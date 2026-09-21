Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA80043C7B6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976530; cv=none; b=KuglALi8z+V2EiOl5weo/gHHqy4phpOL5HhhAgCIeKLhw5z3ERPJhZD3d8MrWxQ6KocLf2T0hHKTCvfQhz478uLbAmphEKoiaL9MBZkWCo2C54++pxWbHShGuAdK2iu0JMkljXxvJvS9ZJixF+KVfVwo5rkiI9Ie63QoqXroFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976530; c=relaxed/simple;
	bh=YpyUyxCo507Mg3FfSIChnx0hchuXkpf1IYcucI+jCnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYx/v+y6UuMVSXSvJyfQlJ2jSSL4iH3rx0DEI0eQUmn0oEIQU9jkZy34pr8+vhXxfSi0tncrRIIBoCcxVVZF893ClJzqDXDltHIIkOPMNCbMT9uYL8fQrPbCXVOdmGuXrae9iWTX9gFYoRXyn0XTZKOT47ptdOFmNL3TY0jpIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqe+lclB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqe+lclB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso2056653a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976526; x=1790581326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+ECARSANJrUe2ZD7obBA7E5y8RycSAtQslnQO+mgvc=;
        b=qqe+lclBJb1rqSKhljacPsLAQQB9CrIzTdz9rVjqy3nmHMYP1cVYKqlL/o6DscJBdS
         YcH5uPgiEYyg8ygMLcF9FkqMycohG7XNkqyzE1ps1scI+jSe/M6KMdSMaqig1iQYE/2T
         NDXqct80WAVrgXtYG46f+0F5dXfJlL4EItKAm2vZ0+AcMBYaX7Ft6f/Vs1h0ZP83Ly1J
         wKLvduSXgZpDrWi5hbHLnhSgdb9jAydl/x8vYfpDZax70yrkwn8YrUgamZzRSMV0WTlf
         onlkr34+utbZIPGAcVczJ8aeKyzzlKsLfdP8inAVt9hcNwYnVZZLURW1pihW9H4ahVwy
         yYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976526; x=1790581326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+ECARSANJrUe2ZD7obBA7E5y8RycSAtQslnQO+mgvc=;
        b=IEIzWNKXbyuHx2mxuBVjpJRbBtvip+VLJBRAUhWODxWGx1z1GAoFBdMWc7kAQUPoSE
         DaPEEjwU2ASrM6lDWr6SxMCea+bf6rebRfSmJIAOO64CHHpx2jxIbnyIILnXCAfDcFe9
         TGVyzqJXIP6QZcvt2CwEDzZ5rZNVKtWFLRS+UalHFC2egYjwo7Uxc8u7VdcvcBvZECOf
         xFY1GKd+d/Jg0IAkGtFlQwPZrFXJpeBGHRQSpgDNFch9jJoo5sAM4sC5bD0KJbw3GAyx
         mHAI/eStdwRbYPtxqrISklxgfv+mIn/ue0ZK/jiiXV6z361kpoUiVp671qMtje3vSCt7
         MzcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOciCgXLJZadzc7aujCW5NZel5dp/6LOQNh/YY+aycw6M6cjWOJM0GYpZXjAs2HzhVSsqev+bRm6+3wcA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwOnoT46avusu4oG3QyTBmYLmELzAsubh5DL55PXQZ+ySHQmfh
	zchDElNQR0dIDjlgkFRpgz0RHECr++vwyYsfZ3JYVYVlZX2bz0PHMkgm
X-Gm-Gg: AYBFou3HiXbo3rvKwLjL/Ft5pYeFOJbb/WcQgT4J/LKUsyBXvfO2jojv5NMH1DCQOBN
	4O/3PW6xVYj2eJwq+P+Hk4Hxt8lyejCaS6t/p8NQ+dHr+hPgaYVoI0hlLZmsPhhCf5xXgCBBIVN
	YwOR1g/LnDa/awTkbiuNnn167EfDPDsdV2kPKAiRvmC0H7lq7TYDeo9lwsToGqsyQJ1A99yWySO
	7lCJugL0BQjSanztCi1E7QdmjuaXpA0ktu9DohXup9Ej/HSimhJpMHfOA8jcgtyKYx+1l2e5QZi
	tJKZjBpPqydbzYmgV9yJ6WMiPuCMRERAbRN+BJt20PUm0xr8Yk0hCLkefG2X7R0E8fwntzbISMg
	o/EjpZTE36f+Ay0z01TQOHP1DgUY0qspud0mqcFQCCtKebO5wuMFxW81GIOsPYzAX/gin751XRu
	h/yd7RG4vCK62l2SBaW7eKAKBukT9X2dF40rEcDFIwAdobFQyFslCqr9Equr5YVvdOc2pjT5/vS
	weq1Wy1DunzTPSaKFTQJzwpqOYxrMGRM14EV600B5oLyjll9+gvm3Z3wXSIkkc1Q/2LlNOEtgj5
	yHJJ1Hus2w==
X-Received: by 2002:a17:90a:6c82:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-39e6a81c9admr6628207a91.22.1789976526137;
        Mon, 21 Sep 2026 00:42:06 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabb771sm13015876a91.9.2026.09.21.00.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:42:05 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Harry Morris <h.morris@cascoda.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/3] ieee802154: ca8210: prevent stack buffer overflow in ca8210_rx_done()
Date: Mon, 21 Sep 2026 07:42:03 +0000
Message-ID: <20260921074205.2289211-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919213637.3316595-1-benquike@gmail.com>
References: <20260919213637.3316595-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ca8210_rx_done(), the packet length len = buf[1] + 2 is only checked
against CA8210_SPI_BUF_SIZE (256). When buf[0] & SPI_SYN is set and
priv->sync_command_response is non-NULL, memcpy() copies up to 256 bytes
into priv->sync_command_response, which points to a struct mac_message
object (sizeof(struct mac_message) = 250 bytes) on the synchronous
caller's stack, overflowing the stack buffer by up to 6 bytes:

  BUG: KASAN: stack-out-of-bounds in ca8210_rx_done+0xc4/0xe0
  Write of size 256 at addr ffff888001907660 by task init/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x70/0xa0
   print_report+0x153/0x4c6
   kasan_report+0xf1/0x120
   kasan_check_range+0x125/0x200
   __asan_memcpy+0x3c/0x60
   ca8210_rx_done+0xc4/0xe0
   ca8210_spi_exchange+0x12e/0x190
  ...
  The buggy address belongs to stack of task init/1
   and is located at offset 32 in frame:
   ca8210_spi_exchange+0x0/0x190
  This frame has 1 object:
   [32, 282) 'response'

Bound the synchronous response memcpy() length to
min_t(size_t, len, sizeof(struct mac_message)).

Tested in QEMU with KASAN enabled by passing a 256-byte SPI_SYN response
into ca8210_rx_done().

Fixes: ded845a781a5 ("ieee802154: Add CA8210 IEEE 802.15.4 device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the ca8210 fixes into three single-issue patches (1/3..3/3).

 drivers/net/ieee802154/ca8210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 01af4f9..c009930 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -697,7 +697,8 @@ static void ca8210_rx_done(struct cas_control *cas_ctl)
 
 	if (buf[0] & SPI_SYN) {
 		if (priv->sync_command_response) {
-			memcpy(priv->sync_command_response, buf, len);
+			memcpy(priv->sync_command_response, buf,
+			       min_t(size_t, len, sizeof(struct mac_message)));
 			complete(&priv->sync_exchange_complete);
 		} else {
 			if (cascoda_api_upstream)
-- 
2.47.3
