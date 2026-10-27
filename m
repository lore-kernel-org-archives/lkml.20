Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084567;
	b=EzzqmeUiZeD0Q8/GBK0o9C5oDjBzlsq7iswpuIm1e7PPW0XrJh8oytPAw6yknwrDH51y
	 kRmsBPOhIYt2XyTFfsdf4tfYA9i30+lM+u39gCMaTfyDqQfJBqpqRxZlm1YVlyIDfYuIX
	 9kZswzZQQ2jco5e1j/vkw00NN4u1sl5ZJNZysXkxMJPrvuwZn5Mz/0MWDTdAnlUHWU9yV
	 5/KaOIDKxmAdVZUmkC7wlrAWFjkF3UTpxxOOfsXJFoth4crY85WPUUDRxLTQxXMyxjXLf
	 O9QAQJl1L0gHqHIvuyxlL4pv487hTa6/inUDFtknB4CV/KRvHgvZtQPh4ztlzbY6Rbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084567;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IGxxK/0rRCVYhR8uVCd/PFtvUOh1YcYCxfBfXc4JAHU=;
	b=Eb6Iqs0N4m2yuS6P3vqgo7cfcDGXmhbqndtMABYzmUYPC7ySLLVhBh8S6REbQ5d2vUNg
	 mr1K/0gy4tZ5mvpLc29vPDzurj3stMEVhSZL6aUGwn9Sy3kYurzcEPYtkmFsLCj8cCMFW
	 BxJorPyemT6THAqk1XFeZUCYvel1yZVymbaIBke+O1zMZk+gfiLGgPpegNid21qrcoeDw
	 NfbJdRxImvCswsdr4jOb5JEbgtjCgPTu+fc9R14nZXvO+hukYoK3H7p6CzOOMh5v6DqnV
	 fQ5iEnLCOkFwPwXV7gyZmmguoTnNA+5U427y3ZNqdws0XkjbPj/KZmZHfqd8TBULsLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gdpeStxZ;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51F2606A31E;
	Tue, 27 Oct 2026 07:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gdpeStxZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gdpeStxZ+ZjdtPmuGrWdMdrRPRK5Q6qqV3TtqjmwjitGtgswKdEsU1q7q6sZ/m3QYp0QRVeTNKRGJ
	 6D4xMkJESfsoacLwf154tcu6g6adlKmH2TV0S3wX89TO6uIhggAkDewe3+lzufhmlXk2SPFt0bLdZo
	 PHJzhomKwZ2g2j2w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26ae04c90be8-90f25;
	Tue, 27 Oct 2026 15:02:43 +0800 (CST)
X-RM-TRANSID:2ee26ae04c90be8-90f25
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae04c913e8-d18ff;
	Tue, 27 Oct 2026 15:02:43 +0800 (CST)
X-RM-TRANSID:2eea6ae04c913e8-d18ff
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-media@vger.kernel.org
Cc: crope@iki.fi,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	andi.shyti@kernel.org,
	syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Subject: [PATCH v2] media: dvb-usb-v2: ec168: reject zero-length I2C reads
Date: Tue, 27 Oct 2026 15:02:41 +0800
Message-ID: <20261027070241.1475-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ec168_i2c_xfer() validates the length of the write-phase message of a
combined write-then-read transaction, but not the length of the
read-phase message.  A userspace I2C_RDWR ioctl on the adapter's
/dev/i2c node can therefore pass a zero-length read message, which
makes ec168_ctrl_msg() issue an IN-direction control transfer with
wLength == 0.

The USB core treats a zero-length control transfer as OUT-direction,
so it detects the pipe direction mismatch and emits the "BOGUS control
dir" dev_WARN_ONCE() in usb_submit_urb(), which panics on systems
running with panic_on_warn.

Reject zero-length reads the same way the driver already rejects
zero-length writes.

Fixes: 2bf290be4f3e ("V4L/DVB (13364): ec168: add new driver for E3C EC168 DVB USB")
Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=ed3ada41c4eb1c4ab78e
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
v2: add missing spaces around '+' flagged by checkpatch, add Fixes tag.
    Link to v1: https://lore.kernel.org/linux-media/20261023025535.90-1-zhaofeng2@cmss.chinamobile.com/

Note: Andi Shyti has posted an identical fix for the same syzbot
report (https://ci.syzbot.org/patches/80b80f7f-e688-493b-b3eb-1516027aec7b);
happy to defer to his version.

 drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 0e4773fc02..193c752b6a 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -115,7 +115,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (i < num) {
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i + 1].len < 1) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.39.2



