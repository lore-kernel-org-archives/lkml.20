Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED739A4BA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791722879; cv=none; b=BiFH0ZlQ2xRp0um/d1mBqJ/+gOiff4O0RZqn2P37pxV9zmHsomhq7KCi6y7esdFnO5GAmyrfuLJPBmJxiA2xCkZYkK3/FTLGttxDfaral+5qa2FJwGNtnX7xQswqZjeomaUoP6usc+HdQ+cmLp1/NKw/N0QzY7IRwFBpXUsgddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791722879; c=relaxed/simple;
	bh=65FsIsY2eglM8xMKgNTFAfDsHtD95MspamnEelN3fM4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VHCdDvuz5agLDGsp1twSJFRorPT/TvWEDHmQnwf0D7X/EsxyKuBhJwiyZBnCz+7ItQZGFiHgYspIJov7ianu23rb0hYKM494qmRzS7TB68QxyPzcuO3r/Eoe0ACkER3J/5b08KKfBNjdVBJIs3oQmAaJuUsIHU5wV9NpU0H7SO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPcrJjpb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPcrJjpb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso496203a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791722878; x=1792327678; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=XPcrJjpbpcD3Cm24ktG1KAWyjg8swimzqT25YFiiZ5wA+MUclu3QhiidYd5TIEoF7w
         STIqx+3ckjFjqxZwwdeCqX3XpF0+pbMBCGiwYEdKuyL2M60qxkF1xXKul9Io5TRs0Hfd
         Zwd8IpiHaCUnRZrrTqCfA0f9GKV1C2axryjJa1ufp3mo1/38JGupVZGtMG5DycERGbxU
         AxhZJxIRxTph7T7Aqd6LdyKUUbdh+NmCYvhZRyHTh61FkgOSamkL56fyQ1E37dHtiRrZ
         vTviqStm3NG8s2qmmsHMhM3wttx0IJ986xkKFDYUou5DgHmBmyVFBbv4Gh47CfaoCb+f
         Epxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722878; x=1792327678;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=qRKcuHM3F1PL8hJziyI0TWZ8N7jSfPt/jkC33s3l7C/5nVFv0y12j6yE12hE06qyCC
         HCMnS/Xm6GTbWD0N2hgS7bkIUv6ZzkTsWmic6kNpCrNLBSfgwF4qXZxYInZ8F+0zTpFg
         fDLVvMc5ge27zrozPIodouCdaNrj/mUf6JD1tBnalzbd2WSB0Wgr5wqaSRpLvJx03XL/
         44xbs0b+/hspgBd77XZARFCpUPlLwUOhXBeWKaGY4tKNF8+QpSCBHOVpVwnEdcWjhnMV
         hZoHfFiNHmmg1v7QCpS4kPYPGzy1no17kVhbi1ACuRmz9B5KBk2afZUWkRKah6g5sHHg
         VDPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0XzUo4W99ZddEOfRlf5O5Ah+6a5Jw1fqcpqNERl8+fdsPpQvK7ZDuys0yj9y2Eqh0GO3G7ycsKuN6niU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDkKvLCjq+sl/eJhQO3c7aoPFyjYKOPh755Vf49+4dBMgHaMov
	qJnQyFCJlq6WxrzeMo/Q1tzCxr9HaXLwUYno02tB9fW7pk+83XWq6D7II2bPBJj9eiI=
X-Gm-Gg: AYBFou1m4gBXkp1F/khIdeAVIhXwTfVGNoFY+HLM5pnu5Ygr2ydPyBMSst8xQfiB3Dp
	DFifEONy9QGqtDtKC2SjUloOiVFL+KO1BbNdR6DsVMdhpprWhqUqdn/lM694grt0bGAXV1r+4iV
	Ruc0EhcHtyc/9fzbynwrkw6+0TaxfVFYaBgJNpYlFS9e3tLCQ2AXpBfDmHzaywaCtcvLnv8wO1E
	gtGEJvic2i2JV2DiNelA6IIfVEdiygcByQp3tp2EbG+o8q9VSGrWDRKfikQcmj9bVprXnIjMyCO
	luD9+I3FApYYLj506f/ZcS0FxgIX5mCNDfF8WEJqfMJiZjzfk572+kxp/xoWnk81IpgI7yxlD/v
	QvvcvM94vD3p5wAr/lZUHsW6opu6rgwj5m7IxjK2tOFIsGvmrfkh0MV7f7iO5EeRGH++fZBZJgS
	J9monm9jkd2kAeYW30d9LeqtvMI0zQis8LqGeYifWs17MEDlrW0mZWnuLI0YGlGpVRQvp+uL8IA
	TVNhwtnIOJH1HIhYK1y+nOT/3hGgfQPlJ+8vPhziYDNJq4TxnpaCW9HoTV3nNbeLFpZRk9tjA==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr3830705a91.61.1791722877717;
        Sun, 11 Oct 2026 05:47:57 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm11623603a91.4.2026.10.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:47:56 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 [PATCH] riscv: dts: allwinner: Keep MQ Pro Wi-Fi powered during suspend
Date: Sun, 11 Oct 2026 21:47:02 +0900
Message-ID:
 <179172282222.4040500.483739720170904755.mq-pro-sdio-suspend@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The RTL8723DS driver requests MMC_PM_KEEP_POWER during suspend.
The MQ Pro SDIO host lacks this capability.
The request returns -EINVAL and aborts suspend.

Add keep-power-in-suspend to the board's SDIO controller.

Tested on MangoPi MQ Pro.
RTC-triggered s2idle wake and Wi-Fi reconnection pass.

Signed-off-by: khaliforce <kforce@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index e2bb6bc16c13..b2c65560d6a8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -87,6 +87,7 @@ &mmc0 {
 
 &mmc1 {
 	bus-width = <4>;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
 	vmmc-supply = <&reg_vcc_3v3>;
-- 
2.53.0

