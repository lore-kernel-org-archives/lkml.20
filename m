Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8543126C0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693252; cv=none; b=Dqd3NX8OFVyN85DZ5r29RQD01H2F2rUukUd41n48Yj+GKld5hfh58I2qqhL6zxx6jtROvP07USwvuIx/BIWktB/ZQCRE3Y+KvZG1UG4wE1HjWEugyF7ZIDb5dQia0pDxqgmIEl519lQN+nW4G2I9l44QsO3BNX8qKXbLsDwa+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693252; c=relaxed/simple;
	bh=cZDn3i2B41dm1+0cuLWMhxtjt5xxBl4YjwKFgKQKXYM=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=qxU/nnbMPMKVZY4YGDfpBvBYcgbZXqiRcar70CfW0i6T6uJqN4PPOeXvSFvwP7d6rLZ4KvSLG4mp7fvSShXH/Z/2DtTBpGuIbfa5WX8L7EfgWcpwWWAQwAzxWya6R4yMDloqLsTjEwPlH/SspQ6or1ow42rZRrqJO8+UWrfXY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqBjZC5P; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqBjZC5P"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9db539a54so20425015ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788693251; x=1789298051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DEdh5HmNzXfseZwOB17l9FeOx8g8N1pY3V9IexD1Wc=;
        b=TqBjZC5PzL0K4rzu7wNDpeJKiXobRXG/cm8jhJRAu8dvqzBlKkR5yjYxbP2X+1dmOZ
         unak1gRMndeLKtXbV8BPtJgb10uBW7hsdlSRfGQwXI4L4rp0xwJzKHKj/8U1ufxzosml
         7+A9/UiJ6V5ibhXiddO5Q00pR/lNuZIzcw7E9TtdH3IwVVy0NfcoRQ3SXkhq1iSqj0dN
         qF6OFeiIdDLIQA1GuNGSIgV8+mLP5kfo/YZO7yjuxDzVLeOrPaY//Rk/mmjLxyly2BWK
         ZiPX750lIyWWpeUmvFDhGnx26OEOwsdDGO0hhLhxVYZZF8Iuwb58v72nl5ztbygD12qN
         GGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788693251; x=1789298051;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5DEdh5HmNzXfseZwOB17l9FeOx8g8N1pY3V9IexD1Wc=;
        b=QyRxkJU+utZxnl7qFX4YOZX/S4npT50XoYybd1wUgTwG1o+YuT2cXGeSB3D1L71Yre
         c/kYGn5xQCd0McOE7rDyVwrNdXgTdX6pYS0vprIBGvO2ayiGLB0k91k9rSbKPJc0ul0J
         jbHUW6g9r/ZrOj5u03HYEuH0KrXwZ4FbU7fjh6SIQgN/hTmKKJuHa64w4yANzBLXMt3R
         ycmWatZPagesquCfCN4GOQb6N17jYd5luVErtK3ZXWeXzn63azdkXEZ4OZ04yslqDttV
         18sOwgDUNxPenipzvnQKkFfXFppF2tHTNQBVnJ4/8WSye+x+s77l35y65DcDIw58frRT
         HjFw==
X-Forwarded-Encrypted: i=1; AKwUvBw66vWwrWJbXofRlz2pDfVJRWO+/vMZsHU+DpMowcENpXgcV9pv7E0OzUfvIdiwbkJTtF+hMigT/ZCTe5k=@vger.kernel.org
X-Gm-Message-State: AFuF++l4pjq3MZAiKtfxUiR/VCHglSu9FWr5IBeufcpJnZth3mgSc2P7
	Sbot9xeEKolWi/CtBCodlbmvVhEfFzgr6lNgIG3/gaAtdxH2kDa07frg
X-Gm-Gg: AYBFou1I7isMd9P29GDesf4J9j5ufKH5tbgE4J5WHCxuKvGFMdatXeK8Tq4hmieBsat
	wKnKfh1x/xnZR5vetYsYpkDBRKEjR/dwoFeaeuboByFQAxLtvNW2SQslRSrhmZVRxxRkUc1Oq6+
	MmY9rmDaS2Qzj8Fn71lQcxnZ5cNH4LqS+EZktTx2Gb+0aepac8PJbAamdwXzgUgIsC87eG2ClPo
	ZMzg6N524zS7G3JGY431+AliP1uKV1KJM6KwNNq5zaBCQUf9uc6AU1KjEDVf1NYCaVavd+eZcBH
	gZqRKNDuOvNwXMFAc88l7N/pP1VEeTuIYaB9L1x29ptsYkHJz+N3C48m8/agVrqDi0CMt2cWiY7
	6P761Uig5XTWQxkmQdwcawRVXM77l/T5fJYk9si2J2JdKcKNRo6iV4K77MxrM6SxarY74Llt+2I
	oVd4e5VlNsHx+KICvxYXG5X2Ph8BpI4K1HSqzutIILR9VeKlYhmPZM4UFCbJOHTjfyDZynDWhSB
	b5C31WJjCaHAvSwZpipqJurK8kcYS25q/oJYQppCSAkM+J+r7UdrKqT+cgLSRyfzVPP
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr25093820a91.13.1788693250979;
        Sun, 06 Sep 2026 04:14:10 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm10400667eec.28.2026.09.06.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:14:10 -0700 (PDT)
Message-ID: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 6 Sep 2026 16:44:09 +0530
Subject: [PATCH] rtc: mpfs: fix unchecked devm_clk_get() error pointer in
 probe()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

devm_clk_get(&pdev->dev, "rtcref")'s return value was passed stra=
ight=0D=0Ainto clk_get_rate() without checking it for an error fi=
rst, unlike the=0D=0A"rtc" clock a few lines above which is corre=
ctly checked with=0D=0AIS_ERR(). clk_get_rate() only guards again=
st a NULL clk, not an error=0D=0Apointer:=0D=0A=0D=0A	if (!clk)=0D=0A=
		return 0;=0D=0A	...=0D=0A	rate =3D clk_core_get_rate_recalc(clk=
->core);=0D=0A=0D=0Aso if devm_clk_get() ever returns an error po=
inter here (for example=0D=0AERR_PTR(-EPROBE_DEFER), which is the=
 normal, expected outcome if the=0D=0Aclkcfg clock-provider this =
RTC depends on has not registered its=0D=0Aclocks yet by the time=
 this driver probes), clk_get_rate() dereferences=0D=0Athat error=
 pointer instead of returning 0, crashing instead of letting=0D=0A=
probe defer.=0D=0A=0D=0ACapture the clock in the existing 'clk' l=
ocal and check it with=0D=0AIS_ERR() before calling clk_get_rate(=
), matching the handling already=0D=0Aused for the "rtc" clock in=
 this same function.=0D=0A=0D=0ASigned-off-by: Manush Prajwal <ma=
nushprajwal555@gmail.com>=0D=0A---=0D=0A drivers/rtc/rtc-mpfs.c |=
 6 +++++-=0D=0A 1 file changed, 5 insertions(+), 1 deletion(-)=0D=0A=
=0D=0Adiff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.=
c=0D=0Aindex ece6de4a6..60596b0ea 100644=0D=0A--- a/drivers/rtc/r=
tc-mpfs.c=0D=0A+++ b/drivers/rtc/rtc-mpfs.c=0D=0A@@ -256,8 +256,1=
2 @@ static int mpfs_rtc_probe(struct platform_device *pdev)=0D=0A=
 		return ret;=0D=0A 	}=0D=0A =0D=0A+	clk =3D devm_clk_get(&pdev-=
>dev, "rtcref");=0D=0A+	if (IS_ERR(clk))=0D=0A+		return PTR_ERR(c=
lk);=0D=0A+=0D=0A 	/* prescaler hardware adds 1 to reg value */=0D=0A=
-	prescaler =3D clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) =
- 1;=0D=0A+	prescaler =3D clk_get_rate(clk) - 1;=0D=0A 	if (presc=
aler > MAX_PRESCALER_COUNT) {=0D=0A 		dev_dbg(&pdev->dev, "invali=
d prescaler %lu\n", prescaler);=0D=0A 		return -EINVAL;=0D=0A-- =0D=0A=
2.46.2.windows.1=0D=0A

