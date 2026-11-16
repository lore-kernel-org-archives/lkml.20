Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854801;
	b=Cuf1FMZYoUb2ShiMurS6RAInj5grf0AEz/YVUn5CgMlIzcasKmCa/1PdsDT69HAFRUYf
	 sVReePqasZJsTQQqq9HOUEVbhNY0XMpWwGiUeUThak34KnkwG1R1Aw6mFh1JLdSWr31RE
	 4Ba/tUiVJzDtpsf6PRF7hafcaGlwZAMlrUFp4e08VTxcmrylx7EeG2woLoaCoTJTyG6tT
	 szXoP93KzIqEhmmmZrXhIBJ1+mLG3yL5s9Ak2q77/Iz2iuNPDml2rB5M/dJevjdiXla8t
	 xbnx8kKrHkxgsa0uGiIFk0CQV3P2qbCVboGK7EBIKGhgVlkmtzsApdw/mlu9WyoZYwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
	b=rbeyeY14Z6kGqtLk2R/GHrMcIHcfjZzk9a62lIGsNjr4PqBJexCiLkoA25fMFc8p70Js
	 9H8QsDmGPHXBVzC+jm0XLaqrSpOw9bG2bkBODVq7kKW5/eehzBB/sESVLoju79V1yRhie
	 fMn9Ol0ryJ23cgugtoGBLWnuTgFS5qUOgX18zqbkqI63IiohwyeUS4k78+nd/AfzfJrtz
	 KVRGKyBZjQmOj5FZXBSFr3rBg0RQ8UC91MEBOkBodq+tyo/l9mnk1/pXoymZakQkGoDq5
	 gsxY6bYWFE8Mg4Ljm6P9uJQfYzQMeCjLbSYRy3l8E37UgFkfBsyGd2pjpXQx/GoRwQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH2NaDId;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C72B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH2NaDId
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1328853b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854800; x=1795459600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=LH2NaDIdv753SjJEeUr7ecK4bF/cc+zRWr1U26KYqgTiyD06NGMXCrAMQXdGBkEp9d
         fcQZjAzFzFiaTeDl7IZ615eUklx4vwO2lOFxDx8S6r12V3b9HeY3MtplnQC4rNrbr6Zo
         yARNzQB1HjTxhtRoRK68WqF2fIHw5/zuRnAWVSZm7PJLnzVj40TO8aWwLytLjmSag67D
         VIPWP7Bp3wbPmYlNuEBUjiuj9eXTBe7FSNpiVfajXs6SwzFaxhLoo4zwahGwci3pYG2p
         soVGU7w+mKiLJr7bQduw1oWIVaBp608WOhOq8LEJFb4vPn5q+OqqzuGkgfWYIMJzJyTv
         bqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854800; x=1795459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=IuJiLl0jJjbZR6X6v2k8suK4rpTgtgWu0CSLsxDKWzhd3UI6qaBsePE+ttftd42040
         JwIxwZqBMkR+EOTiZfseuJCP0naH3MHRzudvOF3jU4BxeOMCqO/H1lYV0R3arS5qjOk9
         xnjV/Viex0HOk4c2hp9hvk2FdYiZCkQnKjhXQr3VO/ZJf9IjBvLoCE+au9nJ4C8dnhs3
         bjJ/ErV5X0QPe4Cs5X22UaUAUt6TUj0spgNjeoznaJoqNg7hWJ24tJvz01CSIDW1OsC/
         akPtGoce8GD2wxXwMoCTaY99SW6Ihg6wYjAU2O5S0nVPkHDvkIrnp9fr2OOf6tncjvlV
         hhwA==
X-Forwarded-Encrypted: i=1; AL+hErGG7PouPcvrVF+5hCGgaLNDi3mHZRFRByBMvrQP5qjgAXiI3oWUGbJ/se4Sc4lNVzeexpjapw1pElswItg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eZiifwsZjSJYYX4VwG6Z5sHrLT9kyoTrwe8VyzuUbTjnfKKMU
	4J0lkAfz+fRTT5kIuKwqMDB6nmZlp+gM41J9AoHk0er6v9ubMz2CJRZB2o2n8KZZfEhlUA==
X-Gm-Gg: AYBFou1FVug0+gtYhfGjhjah+i9wVq/IpM+eKaQb7jfQsbu8G7hJ2PvoDWQ1fShiure
	THywrNOXOYmlKCZHuHZQEV3ksU1jKEG2s6Iihuh4eiMCnOVf01dPNClxcOFctqaE6GZeZ1gjwti
	JVv7/WAbh2Z5vjtpbNcPUk3XbmnspA0zbMiKGjBi1aiaULWdAsACr3unVtkK0Ixx3sAaVNJgWoJ
	8JYVoF7QtvINDdPUgQqLJ11BbZ/WjTaAeX/9NeKK5BxCg+sjgSTEE4f1FMfOERSnZWysjwTe25Z
	px86lOeGzGwD7R4vFaUpinXyDrFztWKxIlCjWt4h2bWvnstrU9fx2rjrtqaS1nv/rUWD3gtZGzw
	XSK7S4KGrFKJl+M2slSa5GlAn10M7emeC8UUzUIaHWYWod+WL46l/uJ/MEkUIeKVPgxVMIyPF3X
	vnNuxDLu+OAWdcTWBjQRHL7Fhy0JdpQB07vcaoER2w1isWHExIwiZ1ai+3duPHUkrVeLjU9NXvt
	7sAQxlFk2SFeCn0FUkG+yxfJhDWPJqE/Hqa0liR519Rdy8ZQo6NtI2ueB90wt8ZkfOipd8KVHJU
	ThDN+WZjiyy9qzidKa7PUl8DWGIRUIpSXwmP1nSXgnG3QaigPotugRXcN5gON56kNVWYseXKAUd
	g8sySwBTHk3iuqfnJ1EY=
X-Received: by 2002:a05:6808:4fd2:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-56e63ba5727mr9976924b6e.23.1794854800435;
        Mon, 16 Nov 2026 10:46:40 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:33 -0600
Subject: [PATCH v3 1/2] rtc: mt6397: rename the write trigger register
 offset
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
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-1-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=1817;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=df32cdCXYqRXb7AgGz4g+i9owLPH2NyaDIX+9W0kTJ8=;
 b=YXj0OOXR/Ek7mAgVNZ2ePkshYGmwdQh66wpXgUVRUARhBWhlo4xL7c+hw4g+ulZz6PAARMwLB
 rVWKea1gZoeASnjj2zRQPwTaWnyl9lPPgcWMM+sqyHTCH5hZTlMhQwv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

struct mtk_rtc_data holds the offset of the register that commits RTC
writes, in a member called wrtgr after the register's datasheet name.
Call it write_trigger_reg, so that the next member, the control
register's offset, can be named the same way.

No functional change.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 7 ++++---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..5afdb707a5b5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -22,7 +22,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->write_trigger_reg, 1);
 	if (ret < 0)
 		return ret;
 
@@ -411,11 +412,11 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
 static const struct mtk_rtc_data mt6358_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6358,
+	.write_trigger_reg = RTC_WRTGR_MT6358,
 };
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6397,
+	.write_trigger_reg = RTC_WRTGR_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..44d2b2cb1ff7 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -71,7 +71,7 @@
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
 struct mtk_rtc_data {
-	u32                     wrtgr;
+	u32                     write_trigger_reg;
 };
 
 struct mt6397_rtc {

-- 
2.56.0

