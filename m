Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178720;
	b=0lk4rKTxrQbrqanuvvVh9Clz8FdUQO/RTF6pAXSaivS1txNbggdY7+qPDmGvCVitWAFE
	 Sf99CFhpcfUQgKABDkJQ6hnTzYGRW6OKbtEbGc0ALKkYmaXJw6+g1e1quif5El2tDSpTb
	 T4Gm2yohXs55cp+Wq4zkC0f3Hv+HWfQVHjstepNayNeKBRe+p9Cz3oqnv02pKmxUGuZi5
	 gtr88gHr+ctMOPNjB66p7zTY4XMGM/AFwIJHSv++VvtlnaCYvxoTkl5e+jrHV1/peVfaX
	 KUqSCoy1QMDsouGtFboPQehXs1fQQHl19KLYy5tZpDKAUXuRTzaRjR9eCLGz0rduPgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cVlyChpbZ/BkpQdDsbhYPEc2MScKqUSTZSDSOfOvZW4=;
	b=JXXPItNwC3W6VtbkBlSqvv1H8g1RvFd2zF8mZ0qfCR81hhiLMUpOFv1m1rZz8rCP5w8p
	 D6Wq6uFK9OPsb9E4Ugr3GxfUfrK4iwwVtSU8iuFbL4eOSlKS2YQXmQQjHc/YPEEFaccFr
	 DgW2jwDeqMljhmIuoMrgkRMM8MwRfO3+/s593COhtdXsQBvgpAX1WzhRhlg7hjLbcPlJm
	 s6VdsyrN4czZTEiTObbJRMiZatPQNomHX260T+mDMP2nLGSYuLQOqESei2OBMIkg3govg
	 UMxFQBd1WcOP8jxO0GqjS8xPSo8Nd5YTdv43PekVXYHDFncBFezkg97ScK43rxGisiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oSOpAtuK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8887B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8887B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oSOpAtuK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso3792025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178719; x=1793783519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVlyChpbZ/BkpQdDsbhYPEc2MScKqUSTZSDSOfOvZW4=;
        b=oSOpAtuKiAi/GOz44rZIwdgjOx8mJ0aJ8KcIdnhoZJ0023Fai3SfhU3mrxb37Ju7uA
         5HAoQfv6mgrd6PaQ2aAlvigUw+p+kPuNrK2VR7NUp2Dnf1VUCRN3fKu7DYHeqd0DFOmE
         iAf4m5VPYaI7PyRCKAOE8F5z7LVD8+9GJN8e9K+D4cPvqILonJix6pCHLPoHgyEKj/ba
         3vR28S4s5SsQcm/xN30YYWAe4HLriBFId68HPqFubQf1KmU+hWlZL5Encwlj65TsHnTc
         +W0LgW7hD5Okr7cRAto/Lmkxq+/p3+gTpzVVr2OzkrMKIQZzBCrZldjNmkpufibT7oIr
         2Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178719; x=1793783519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVlyChpbZ/BkpQdDsbhYPEc2MScKqUSTZSDSOfOvZW4=;
        b=BJLRVZeBNBf4dgxSR6eYBlMwuhAymdLvbW1Bo7DKYdoBjPzezckgUn7+LFGyj1MxKf
         /rLQSq8Y2d6Zgee0FoTdhdyZZPLC85hlaVvRlTDS+lzJP1NpavY5/Afc+BFZ8nB8hbEo
         bfijYSumWeU5ou0izyfoyMQxWzqJIg2d68lpox2PnGZKBqcEuo7NNjEtl+Wxzn0GhAIX
         ou2XxT7bERgK2W/PUhCLTF+T1Gzi5fW6YlDI73gsK8z/LFUopw6puJVB7Evelm+6DHY9
         P1EeK1Hdo3thY/QCL9aMu3iKOInZRmjRmXySFWl8SBmjsVMbMLwy9S9izL/5MYrTE7Oi
         xxyg==
X-Gm-Message-State: AFq9FYILU23Q1AvH0Ku+ErkghEwdEufkfA/apn5PHmZQ2wgoEfhBDM1Y
	19U82KuKb/2vsjboiXrluIV7dl94BhBF1aCUchn2cLvKLmILTTNcfQz6
X-Gm-Gg: AYBFou0Y/i+wsDSDIfvT9P8rYpjdRLT4XRx9RfhW/yjZZBscuAev4mWzbUxCkT2V+bq
	bq3M6fr8pFhOGUeEer9TfQndJmDxmu3iKyEoVtxIwc/t1OlsoRTN13MXdOzI5k41Ad0BWkCvwIp
	dFWC3sZIs10Nobn0G6VTwjpDFZE1qUZ8izpQZL46aedi/IzyZZXttokm7KbwvNunX5SI4VwbSyK
	l0ObHtH81TiNqgFvqmdcOdQzPcVOm3dvHuvnrfSxIiIW/2lSonJ24eqX8U2b5q/m/bx/g5OH7Kq
	x6wEnxkaVtF3oIp87S6neoTRIhx2rwNB8zOjvdiWxBo49s2B7P5IZpckKcqVfnb52z77tTjLYJ2
	h8gi2ryM4zqHbBJIXJ78INomP/2mT7DjakQBCDoWZj0flOYUGHFDkp/iOcvvvRC3oaH6YP/3Z6x
	R4366vL+xEQfIhuzjSWhXtAROP0CJ0jaavph0e526FQ8vIgJRY7NHje3IOGsf1AFFWI5O31al07
	KTPPGo9AlZ7m1/3+1uyOzdNjk6sbkNjRCWEzIcLC5iYnbbn5nsqUkM/6jTLXp8Z8UUoKRTHoaVv
	2Rexs2ueVHu++H7KSN+Yy9VePUxOATYLspzgrk0xUV/d
X-Received: by 2002:a05:600c:a00a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4a966773292mr31653155e9.14.1793178718800;
        Wed, 28 Oct 2026 02:11:58 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a979412e04sm35334695e9.14.2026.10.28.02.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:11:58 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] parport: ip32: restore state on fast EPP timeout
Date: Wed, 28 Oct 2026 11:11:50 +0200
Message-ID: <20261028091150.721538-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

parport_ip32_epp_read() and parport_ip32_epp_write() return -EIO
on a fast EPP timeout without restoring PS/2 mode. The read path
also leaves the data lines in reverse direction.

Restore the mode and data direction before returning the error, as
in the non-fast timeout paths.

Fixes: 8e75f744289f ("[PATCH] parport: add parallel port support for SGI O2")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/parport/parport_ip32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/parport/parport_ip32.c b/drivers/parport/parport_ip32.c
index 14a4f4251d5cf..103a75a17eda0 100644
--- a/drivers/parport/parport_ip32.c
+++ b/drivers/parport/parport_ip32.c
@@ -1109,6 +1109,8 @@ static size_t parport_ip32_epp_read(void __iomem *eppreg,
 		readsb(eppreg, buf, len);
 		if (readb(priv->regs.dsr) & DSR_TIMEOUT) {
 			parport_ip32_clear_epp_timeout(p);
+			parport_ip32_data_forward(p);
+			parport_ip32_set_mode(p, ECR_MODE_PS2);
 			return -EIO;
 		}
 		got = len;
@@ -1148,6 +1150,7 @@ static size_t parport_ip32_epp_write(void __iomem *eppreg,
 		writesb(eppreg, buf, len);
 		if (readb(priv->regs.dsr) & DSR_TIMEOUT) {
 			parport_ip32_clear_epp_timeout(p);
+			parport_ip32_set_mode(p, ECR_MODE_PS2);
 			return -EIO;
 		}
 		written = len;

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

