Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932163;
	b=Fctdij3lDMvukdA/+DlG0A+frDfYa389aOsYTCFAwrftZT2vLGMxZvAPB+982ywmYQ5d
	 rtIswHE7U2L8Kbofcvscg72H7oUbta0tMhfObX4vC8d4gyC41CDAh6nX3ritozb2nbQRF
	 lcl7Y3u709385aDleVwW/7WH0vJYvH9Hkqo6vKfHOx9T8of8EjVWJzs5dE7XzmDaJQzQU
	 V1C/d2dEznvqKe0DCSg2cWe8U6z1Nwd7qJ4v+cn7OyJpxGs8ICnwJl52nc7zEf/ZcRovL
	 M5DuXX1Qce+vivHaBEkqkhMvwvpFB/hWVwtkmJr+oL8cI/EyHHbQetdec9OFHikYUiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
	b=QQFwuUjWBgvVzPSFb0Cv87KUYgwy8m9k17ENHyt6wuAq87v26KPMjw2/JjqRa487kbaq
	 aWhL7704xfVH9T+4r+ek7y1Qn2aoXO1lcjRE99sh//Ye9pTOD3bQLNNoAZsbcoqKe24qT
	 FoRLWFQrhAPZMSohF0ySY8r53RedNlSKKfG0Ft5vK7LW7a4GRbtWXUKvVBcaEXWXGLKBV
	 m3t/L3ZfsONkwhkLHAGyS/sYGFZWyUVibPn51sFxdtQxgzPFx6PCcq1Z+smfHLFSZW7PG
	 ldaLOWgGMDbIpekHf4204gz9mRWGUUPpIGeDgPndu6O8y3BIvHl3fuxWpKcH5h6wVNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sGQr/DJG";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCE606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58FCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGQr/DJG
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso323885eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932162; x=1794536962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=sGQr/DJGy679csZBWS0FcJ6btQINnMl9KOqW2B6Tyo9y4l2cY3zwF7G+akccVEVlTL
         ochRuDH36T5adH2abNg7XbV/SMfID27wRusVR4d8nz1zyBuDELJE5u23K6oLoEgphAtQ
         T0G91OjAyUAz9nBqDsKiTe9fDyQHQjmBbFiB4xOIXQ3GW238bz/mvwQVVzjkNeb6TVHS
         MVjsO2gTgR0Nx76vuSNNomf1NTGM1fIoJJnD9a/EGRC01rHGfqrAkmCFmCCVuiAr+ehx
         MX5RjkNkp0T4EahM9x0f4ceJQuEGu/3Ei+MaePDBLmCsMZ9mVFsM/NalAiasSa/mj3aF
         Schg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932162; x=1794536962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=pT/JrRX/yjbQWsDACkvI3mSFaT18mc08WaO1rJzDa2za/EwPbdF6yXryGJotGFrx0k
         aLLZGxXOJXPWPvy56zcpUU1aTwUXNssZpnlBa35lNzQLfGPEXay+rNiWtBys+o8Up4+2
         G5oMnLUTik3FTFsfUnIJi0a61kAtSg/8uBgg4ZXe/pFD1Pxk3gnsYr4yFjx6P5WNXysf
         XkX3K3IOqtgDTZN5+5WHkmaq9O+WSKX/g5UXnLOGGgPC91iL3N//2FAPbd/XCDJlIfhh
         H1awO/8ztDULmtK6pEdJ3BT073r1fKlh3b1aVIAyIq4Qn9/jvzNzPctPXFwS206aOu+W
         DKtw==
X-Forwarded-Encrypted: i=1; AKwUvBwdCL7NCvlmm/8hVBTm5z2Z1gF0ucvaGt/9fGwRz9SJRMDLVNz/UsmeEultfyWsjB+TmvBdO70n1QyP3t4=@vger.kernel.org
X-Gm-Message-State: APuU4Z81VcBz3GU+wHpO+pOTgVr8XRoTRpJRrv4GRMHZZpLlb0uwwwnw
	w5fEBeSLLxKyO+WsYoz0X9iJsWeIV7JABScJJiuXCS1zJUY8gI3Pd14E
X-Gm-Gg: AYBFou3xjAak6HCerXzWVyfm3yGM4exqhOhm1ZF8svvPjvYCgP4JHg3VJ0Fd5reWvro
	KcOWBcIi386D11cw6ZVHZr34hEa0L1wj7dx9SghmcVhvcpLHxWTJYJNW4W+1AceYrT+1HAoEbnn
	+HbvRBh9TpoblUhleASSH564dRrpiN7k0MNpqBlTp84PxeXrOg2TnGP9YQyngOrK2+fgR8R2YkV
	bVBEdjkePAcFkMP1p1/Mx7TrQ3EPz/vpsDjqsbhrYgnvAuPfijzcWbEDmHsir01Y8/voteIyQv/
	BrHdhDQUPJbZHbp+7RZGo27mKA4zxOM67a4Jn3axuhn6fykQLJP80hO1YPAaDfWsq5EkbsLZ5BQ
	mJpAbvFjJzoPp3AAwVvUze1GJ0TI/t59Tt0PwIWib9dENazmupMSLdnGCR6WCvdctZPITsHkHth
	Ge3GUSgsbWBaiKGgVnf7ZxxP0koulT5EXL4fgyDa6dlz0p7e2+iK48OSjxWlf9CC7TOh1eEw95C
	TG6zxzZDLOEHqQLlfgTM5RRufIThCu452OSrldBefrbEBEh9jS7qLvdwuf4HUhRXPHd2yWbEsK+
	J0Z8dU26P9Q1KQcd+ire06t8JjiM0Vi9kIkNXrJMOTh2U3c=
X-Received: by 2002:a05:7301:fc02:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36f761249e4mr1506830eec.34.1793932162278;
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] pinctrl: aspeed: Use managed pinctrl registration
Date: Fri,  6 Nov 2026 07:59:06 +0530
Message-ID: <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it when the device is
unbound. Registration can therefore outlive device-managed callback
data, leaving a registered controller with pointers to freed memory.
The G6 handover change in this series embeds that data in a
device-managed allocation.

Use devm_pinctrl_register() so controller teardown runs before earlier
devres allocations are released. This also cleans up the registration
if later probe processing fails.

With this change and the G6 handover patch, one unbind/rebind cycle
passed under generic KASAN in AST2600 QEMU and on B650D4U hardware.
Controller debugfs entries disappeared on unbind and returned on
rebind; a subsequent pins read succeeded without observed KASAN
reports. The unfixed control case has not been runtime-tested.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11a..d19b4d23c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,8 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	/* Unregister before earlier devres allocations such as pdata are freed. */
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3

