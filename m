Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038190;
	b=gIxvZqJR+17ZyZ1bFmdCU/siLs6q/aDCCEmIv+cKvNYBzbUc+GrQ/8yisT+21+xMKIAP
	 LN7Jxi2zMd8LEhS2q6u/6Bv45UEhMng9jVezSWbzJkXpBi1ZBbq3l6zd1qRqc2WEz0i2c
	 kBSufoIWN3NdjHCHvVBqBNv+tbG7S3ibSce6Gkh7km4HGEa7ZXKDUZ9wu6IzqRyQw6do4
	 zkjJyOdMwcBeNHcxLQhMJtC9j4cluv/gOFJPedNQJybrkt+OY1oWAkh4i9gWU+oPy+LjP
	 ukgMZ1QHLZxAp0KXAAAC3G0AxHkAkdtTuClL4sJ8wQ6W9Cxnu6A9Hb3ydkdDDuRRd1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038190;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=talHnQ7/cHb/VJ7cbEQ58lXn6pqWYigIkjRL331q6io=;
	b=oq3Dvyxh+oou3hehfbHoS1wbB/8eRjGEyrRbqEWktVFojRn/YGVNwnHcfEo2pTULnb0Y
	 FqwBYFmLni9T6Fl5jmV6oP2ps5GJ5DsJdWszkc1rmEfSfP00Fz2YKwM1Z1a0NVCoIKnR3
	 Lob6xK/uPH2cKAXCTgFV8UwEbaqCct8MJXuVL4MmjTNgpV85aT4zlnGoMYn8kZf5mzV+Y
	 EhqIvTt5rhouKuqWtIDvZBCvO4lXZ81EGVa6tsR8zApWXWxJOnMhL8HAZw2QhLYcnDzMS
	 ZQlynNmrd+wNu5EhihJklA07nyBdMR07AkzEsFvRzytxSiHH/T+ei5tLBtFP/sXe7OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SylhSQuH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8390606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SylhSQuH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793038189;
	b=Kkw6rW7inbBRUfwsrxzQVt4jk0Gc8F6VoD5LRDH+BHSL8ID3tz+rTGkpuhle4Ttov0Ot
	 4e17hIeL1pHe06uxc+9IX10w4lyRoOzh/ifulTLQzf6KZzfF/0lQKd5OkgWrHWJJOTC3B
	 S7CRwcbFw11uiRzVmukaI+RZmac1wCs800dvPjrZdFZ+7aQ0QaozFJxBrXXjSB0dVH3kv
	 SQ8FuRgBCfLGrI/jtF6XTBiHJ0ACmp4/h2G0Sa9qsGu/pH8ZBhEb3pRSC9KLs9DtaXrAJ
	 e3seu/JwBdgwrNzqLO3UGPfSJTALkATCPhdfsccMrunsO9ZayPTXmY2/v9xpbp8nacQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793038189;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=talHnQ7/cHb/VJ7cbEQ58lXn6pqWYigIkjRL331q6io=;
	b=bn7/gjoQwWRxGDq0vvx4c6/qHjRhY9hpMDQXT9cPjZDDLH1e7gTpqO/Dz8cT8djlloDs
	 mDlGkHkIkl5Uv6KCeOSwbaTl4N0tu7XF8kaCd241xbQB46Jx1bY3F2/cVb7IU4Sr+5N2u
	 5VInjBaUNDSulCKhZ7jXabibIpQBNi+SiI0VI1FqWITWBfZAXlhl5J477tA+O6JNkGpaM
	 IlqBhLAsafmtsf8Q2m8hjGFYFkSzHV4L8oAo7TBu382Pzc2QyLabJXguFiAo4qk4FXHcn
	 vy8CNw2jQUHCjoZlzFDAoHHGdPjfpZfVl3EofI8YRJ1gsG3KcwPlNGck0+OFLyGtMDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2FBA1F01829;
	Mon, 26 Oct 2026 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038189;
	bh=talHnQ7/cHb/VJ7cbEQ58lXn6pqWYigIkjRL331q6io=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=SylhSQuHI5Vb4l0uCxgaakqJTmUBtV3XmPFLf2ceBTMmoO/0kgGqkAgl1OmclBTNU
	 MZRZlp8lRavwhrvxep9f5aFigQ+BlwoBCCfkZiEBgn6y3BQhVkSkc/dSe6eUSXCYAU
	 pJF9+JFUgU8rnolivHn/C/zsoibsKKYfDt2uKF9naWQWO67ULYbakhSCVhZMdTuKAN
	 1LO02g/qDdKDVSwfpGmfifzHXi8f3pqPlvRMFZERLTyKoYhsp5sx06tWJ0wzeL9vlf
	 MljRh4mp3xgKJFN0Z8tSykxhMKsshIQ8QD9EGbmAwp9h8nBPXQsRsTSQDruAb3AsFv
	 O3nt1xGqjuujQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2790A44E20;
	Mon, 26 Oct 2026 18:09:48 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Subject: [PATCH 0/2] nvme-tcp: handle TLS control records at connect and on
 receive errors
Date: Mon, 26 Oct 2026 14:09:43 -0400
Message-Id: <20261026-nvme-tcp-ctrlrec-fixes-v1-0-ebf6ff7eff34@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCUAwEf6XkbKCvWgV/RTy06VYj+izJswil/
 27Uwx6GZWYhhymcjtVChlldnzkgbSqSa5cvYB2CqambfYpxnh/gIhNLsbtBeNQ3nNsxydDu6sO
 27yjkyfA7wj2d/+yv/gYp3xqt6wdHTW6legAAAA==
X-Change-ID: 20261026-nvme-tcp-ctrlrec-fixes-5f1cd54073ba
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Martin Belanger <martin.belanger@dell.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793038187; l=2128;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=3hTAzrQJfgElLUy2dxnWBPcmYnvUEDdOPYD2sRIU/0g=;
 b=iQQCHjO1s/DBlbEGXiWuHp59XYALtBKQvAVw7ggCh/0qNPDM8zpPbc/a/fTIYvqg3xIIRnPzb
 jCRWH4eV55OBPFaLPIlAQmq/P2cdng7mpRhoPu/NfTXIqDh3NZB81oM
X-Developer-Key: i=martin.nvme.dev@gmail.com; a=ed25519;
 pk=4K+XXetGK35w2LzRRddd/bbHawZU222BN+YZRuSpN+k=
X-Endpoint-Received: by B4 Relay for martin.nvme.dev@gmail.com/20261014
 with auth_id=1176
X-Original-From: Martin Belanger <martin.nvme.dev@gmail.com>
Reply-To: martin.nvme.dev@gmail.com

A TLS 1.3 peer can send records that carry no application data, for
example a NewSessionTicket right after the handshake. nvme-tcp does not
handle them correctly. This series fixes two cases.

Patch 1: when read_sock() returns an error, nvme-tcp does not start
error recovery. The queue stops receiving until a command times out.
With a NewSessionTicket on a live queue, I/O stalls until the I/O
timeout (30 seconds by default). With this patch, recovery starts at
once. This also applies to plain TCP.

Patch 2: a NewSessionTicket that arrives before the ICResp fails the
connection with "failed to receive icresp, error -104". A target that
sends a ticket at once, such as an OpenSSL-based target, cannot be
reached. With this patch, the ticket is discarded and the connection
succeeds. An alert in place of the ICResp is now reported with its code,
instead of as error -104.

These patches replace patch 1/2 of Hannes's "nvme,tls: minimal handling
for TLS records":
https://lore.kernel.org/all/20260922133708.84522-1-hare@kernel.org/

Patch 2/2 of that series (the net/tls errno change) will be posted to
netdev separately after 7.4-rc1. It will not change
tls_sw_splice_read(), because that errno is visible to user space.
After that, a follow-up nvme-tcp patch will read control records on a
live queue, so a NewSessionTicket no longer causes a reconnect.

Tested with host and target in one VM, with a test-only change to
net/tls that makes the target send a NewSessionTicket or an alert.
Also tested on plain TCP, and built with CONFIG_NVME_TCP_TLS=n.

Signed-off-by: Martin Belanger <martin.belanger@dell.com>
---
Martin Belanger (2):
      nvme-tcp: start error recovery when read_sock fails
      nvme-tcp: skip TLS control records while waiting for the ICResp

 drivers/nvme/host/tcp.c | 173 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 150 insertions(+), 23 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261026-nvme-tcp-ctrlrec-fixes-5f1cd54073ba

Best regards,
--  
Martin Belanger <martin.nvme.dev@gmail.com>


