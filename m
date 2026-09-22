Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810452269C;
	Tue, 22 Sep 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063624; cv=none; b=Zpe1KJapVdEfx+g9/NWsaSorMOQ1uSkAgGP52F3hRSp/goxCBtoZNA+SjtM3hELGGgY+MnCXFA+EkiEu0twgQSnaPEy9Yqt6alW5x3Ym5X9fF7FaEiOM0AKy4XTsLqmtM2kkr6U7pL8NA47GUSEqMNDUjvmk54pFRK55N+/EtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063624; c=relaxed/simple;
	bh=VJfONPyJLCMboeZt4PJmF/h50dvHL17V2WftUiegjWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZasPKJ90Gy4+4RXQbT+V8K48x6Br6cScOWBLKzz5nicdn+PQOL/A3DPzsi7oDcOLuM98w/490EpweiUFavuqpyihF4Z94eT1iOCPEcse0WM6OPIhLhi3n7G2gcYykj3Fi3O6FemQo4X5NqsbnZa8nSFGRseE7tuOAbhnwhFI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=t1Kjz6OK; arc=none smtp.client-ip=115.124.28.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="t1Kjz6OK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1790063609; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=z5z03EzSX15psHI2GHVzpt1XVqFSy8lZqCkoVrhWfho=;
	b=t1Kjz6OK7FTFhy32wNsj5AaDllB/ik9Uq1NO4pIuJeireWJvF0XRzfWCAx1CmKg/el+XIyyvFJGrrO9Ja8S6AjH17h6BkYhmWSNDyG6xWMew4LHZ4NGitLPnKEjPi8ryUKG37MEMlhezjVYPgNQbe8dW7S5e25h/z340qN71sG4=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436569|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.154597-0.286864-0.558539;FP=13689446538022569150|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.jJiRhfx_1790063608;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jJiRhfx_1790063608 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 15:53:28 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH v2] media: cx18: clamp bytesused in the single buffer MDL path
Date: Tue, 22 Sep 2026 15:53:27 +0800
Message-ID: <20260922075327.1325788-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx18_mdl_update_bufs_for_cpu() copies mdl->bytesused straight into the
buffer when the MDL holds a single buffer:

        if (list_is_singular(&mdl->buf_list)) {
                buf = list_first_entry(&mdl->buf_list, struct cx18_buffer,
                                       list);
                buf->bytesused = mdl->bytesused;

The value originates from the firmware. cx18_queue_get_mdl() receives it
as its bytesused argument and stores it in ret->bytesused; the mailbox
handler calls it as cx18_queue_get_mdl(s, id, mdl_ack->data_used), so
data_used from the firmware ACK is what ends up in the buffer. Firmware
that reports more than the buffer holds leaves bytesused above
s->buf_size, and two paths then use it as a bound over a buffer of that
size.

cx18_buf_swap() walks the buffer in 32 bit words up to bytesused and
byteswaps them in place:

        for (i = 0; i < buf->bytesused; i += 4)
                swab32s((u32 *)(buf->buf + i));

That writes past the end of buf->buf. The call comes from
cx18_mdl_swap() for MPG streams when CX18_F_M_NEED_SWAP is set, which
cx18_queue_get_mdl() does for every type except TS.

cx18_copy_buf_to_user() computes the remaining length the same way:

        size_t len = buf->bytesused - buf->readpos;

and copies it to userspace. Here len is capped at the count the reader
asked for, so the read is bounded by the read() size, but it still
starts from a bytesused that reaches past the buffer.

The multi buffer path already guards this: _cx18_mdl_update_bufs_for_cpu()
clamps each buffer to s->buf_size before assigning. Apply the same clamp
in the single buffer case.

The single buffer path is the common one here, not a corner case:
cx18_stream_init() sets bufs_per_mdl to 1, so list_is_singular() is
normally true.

No Fixes tag. Both paths were introduced together with the driver
(1c1e45d17b66, "V4L/DVB (7786): cx18: new driver for the Conexant
CX23418 MPEG"), and the clamp in the multi buffer path was added later,
leaving this one behind.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Assisted-by: LLM
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
v2: add the CX18 maintainer to the recipients, and describe the two
    places that use bytesused as a bound rather than only the read path.

    The previous version described the copy to userspace and called the
    result an out of bounds read. cx18_buf_swap() uses the same value as
    a loop bound and writes in place, so the description now covers that
    path as well, and notes that the copy to userspace is capped by the
    read size whereas the byteswap loop is not.

    Add the Assisted-by tag.

The firmware reports the length in the ACK. A device that reports a
data_used larger than the buffer it filled leaves bytesused above
s->buf_size, and the single buffer path is the one that does not bound
it. The clamp here is the same one the multi buffer path applies.

cx18_buf_swap() itself is left as it is: the bound it needs is the buffer
size, which the clamp now keeps bytesused below.
---
 drivers/media/pci/cx18/cx18-queue.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index 04d6828f0..a973367d4 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -114,7 +114,10 @@ static inline void cx18_mdl_update_bufs_for_cpu(struct cx18_stream *s,
 	if (list_is_singular(&mdl->buf_list)) {
 		buf = list_first_entry(&mdl->buf_list, struct cx18_buffer,
 				       list);
-		buf->bytesused = mdl->bytesused;
+		if (mdl->bytesused > s->buf_size)
+			buf->bytesused = s->buf_size;
+		else
+			buf->bytesused = mdl->bytesused;
 		buf->readpos = 0;
 		cx18_buf_sync_for_cpu(s, buf);
 	} else {
-- 
2.50.1

