Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A33B894B;
	Sun, 30 Aug 2026 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099861; cv=none; b=Y+0Xh85zMTY4+N+6Z8gdHeVSZrnlmu5fIIKgvh9DVhkJ7hr5FGPiF5u0twXCjBzI7s5+3UtW2cisJJ9v+iFMj37lPnf95tY+10LZt1oUtP00nl4C4208WX1CM1o2mpSPKhWJ22tCIDASPSDc1fLvvbZi03nT3MGaZ/q7mtvfSfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099861; c=relaxed/simple;
	bh=cFGbL5lzncK6HtGP+NdsMOrefB18060CqmxMOe8n/is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvOyNy08eSWEu50r+eIMwRa0O1pFNWtOG9Zbt3XbzpK3HgW63biDEMYOkc9QfzuCswSDBqpcvsrLLOYXMOFCkK0E2YaDOkRyHFRXHS2PGYIPtiyYInHI02JL+jycfQGQtqZVOn2VgLkXa8kVGo/v9xnxDRAwjou677SzbgHZA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnTsKPZRqL7ibBg--.46365S2;
	Sun, 30 Aug 2026 22:24:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: appledisplay: validate interrupt report length
Date: Sun, 30 Aug 2026 22:24:06 +0800
Message-ID: <20260830142410.37791-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnTsKPZRqL7ibBg--.46365S2
X-Coremail-Antispam: 1UD129KBjvdXoWrury5ZFy8Gr15Jr4Utw45trb_yoWfKrX_Kr
	1Fkr18A345CasYvr1UJF1F9ryF9a4DXrn7ZF97t343GF15CFWSkr9YvrZ5CF4DCFWqyFWD
	ua9IkFWj9w4vgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

A successful interrupt URB completion can still carry fewer bytes than the
two-byte report consumed by appledisplay_complete(). The callback
unconditionally reads urbdata[1].

Resubmit short successful reports without parsing them.

Fixes: 069e8a65cd79 ("[PATCH] Driver for Apple Cinema Display")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/misc/appledisplay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index 16883592f7fc6..4543545793e27 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -82,6 +82,8 @@ static void appledisplay_complete(struct urb *urb)
 	switch (status) {
 	case 0:
 		/* success */
+		if (urb->actual_length < ACD_URB_BUFFER_LEN)
+			goto exit;
 		break;
 	case -EOVERFLOW:
 		dev_err(dev,

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

