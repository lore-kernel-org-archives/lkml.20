Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01B74921B5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370164; cv=none; b=WcJYuONyRFTHj7JF1rIE2dcYcCUY71uS813otzOjlDVfE1hPAGS5adVOojTbC7mTW1AfBU3u2yu7aMqsswVsmOiFnsf4mG5pcuwxHok4pWfa6ba3goVGaeBAYhYvuFvOvitM4SDOFTePmjLDxrvrvEnl6FDO91srcv2CD0YYZnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370164; c=relaxed/simple;
	bh=RJfVcwb+Mf1Et5d6No58/KYOhnUt758OCcEXbSo1KjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2pGuYKQ/33sa7b2kXMdMHJ2HHjHM7IEd5IJDeMaTi4MwekGYFYb3DsnLmgep6CCKD5Xn7tYRBeNosVr7mKKuPUWd82TiZY2/0Tbf8TN4mmrgvqxVea5ByEPEE049Kb4fIsDen745o/6jpDDDM3mKKm1iXQEBgm0naSaBfLkY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reksktsL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reksktsL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a865731ee4so1467932a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370108; x=1791974908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s10B/UJVDcBcMsipOeAzukFpqn1WWC4fSZ9WIZPc2KU=;
        b=reksktsLDB6xOyjbBCytV8P+qzZhM7w44a1SiUPC3P5GI0P5AqWCM/iCXUSdNSA8dc
         Fm9i/W98A70YxDGJYqTQ6XBp2jX5YOtJR3/1NS5IfmU0vUaTc7FfZzd28xbW5f6C1smv
         O3p87CTZz5erAwsxqzuUahsZ97UL/6HCn+nUaM+jWAZfU3WTK/UugA0QuytQv4CSjE/Q
         2C7tuOMnCCF3c/SOWyE2XDkO7+pgkmWXbeDU5xFzmYB5fqovfiwNTU9ct0mAMF59Dk6C
         EjsaAvNQx09QvMkOiBJOjs421X5xr4aawlCsWOhwkewfwZjMct3Uv0w/DVJBwc6MN+dH
         lJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370108; x=1791974908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s10B/UJVDcBcMsipOeAzukFpqn1WWC4fSZ9WIZPc2KU=;
        b=J0PZuFzTVxTZ3zNl3zAQ2XgnlmFwgnngC/5wZj52Unck8MWBQ5s6bnJB+jZ/BsYS9x
         OKgXHEiEVp7VCcIan/DHMCR2mky6cCIZ2PdsJ9Rptes1+jCMblIxhNSDFHC4JXELGXV4
         2c3+4SGnocz7lR7rn8sQb5/FK3hKb0wPjubFQFljCVqcl7DYuzebFvLI8e6+LkDHJzvu
         +HrC2Nq3LZW4MXQVeblptGYvtzZJlvZlKrI4CDG6jE3m37IV+5Zb9kkF5rezyMWBQZ6Z
         irumg18lF4y7T4eHIIW5WZkbaYN5nv7X4PD/dI+qo3rOQ2xWSw6GXOA7M2aBh6K0ib24
         zj3A==
X-Forwarded-Encrypted: i=1; AKwUvBxqAVJK/96nJf9KBP/YMiDMbkKJK6p9LCKbsZJ1FsTolIJp9ZuxneLBGsTIi3xMfespscVgWIqaCpKFaiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn2irvsxyIwQlXLPDrfQ7pIwBHYWi1i6uUs2zZV4YMreOweThV
	UKZ3iTt3qbp0dJAHHCRubOXiETmiFTwVvylGH5DkWmQvQRaiZeyI/FmD
X-Gm-Gg: AYBFou09bXzHv6v1lw1UAwbmXvf2XqRd9QJDstODshQDzgan3veVdJY7UAfoJFPdCMv
	BlDC3TpD3MIG3P7+ULLqL45cpzBw9Wpf4ptl4TutqE87hlsgN0IfkWrh8BViqgk8MZCCtjEcnn8
	/WmL7lVZztzrJGNF1lsHP66gI4o+TDUvCJuQuaFTrtgzrUJnVLPdFutcdGb/yFG4FV9i0x7QgBB
	E0LVvnDfC8UaRxGZ7FXpPne3ajX5s7fzsX/M49/HiLpQEEBdOtX70pCwKaKYI0kPShJ48lNLAzw
	Fl+eRK5oGR2RHS4YNDCRNMin/5SsMKdGf5TTm+dTmaR3dnzqtl7XxSiqY2EkrUsr9VylWn46Nvq
	WDKDKLkOQZkcNGSs8LbNYhwKcj3vChso1Y0TFF8NJ5CVO5WgUAJcdpRWsvcaCD4hQYUnoM8kaS9
	UAY1zqfrUcmMKz3LaEL1z7OzoH7SDECFWU8Vp/DRMPeD+l3X3f6vNjpxGaS21ZM8xaCTk6s7h4+
	cJxNxITQA63efWaOUuvSmxFjX3GxYJXO6ez0zeRuHI/h3sRD2bYCAF/vHuY2QmXw5qXjxC4s++x
	pHxBeP29YiudZQ==
X-Received: by 2002:a17:90b:2f83:b0:3a4:b6c2:b159 with SMTP id 98e67ed59e1d1-3a8a1ab8d70mr1631105a91.34.1791370108028;
        Wed, 07 Oct 2026 03:48:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543e8478sm11046540a91.17.2026.10.07.03.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:48:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Steve Glendinning <steve.glendinning@shawell.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next] smsc911x: propagate reset GPIO errors
Date: Wed,  7 Oct 2026 17:47:31 +0700
Message-ID: <20261007104731.507647-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but smsc911x_request_resources() currently does not handle them.

Check the return value and propagate errors from the reset GPIO lookup.
Release the regulators if they were successfully acquired before the
GPIO lookup failed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/smsc/smsc911x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
index 3ebd0664c697..41423baaf0af 100644
--- a/drivers/net/ethernet/smsc/smsc911x.c
+++ b/drivers/net/ethernet/smsc/smsc911x.c
@@ -439,6 +439,13 @@ static int smsc911x_request_resources(struct platform_device *pdev)
 	pdata->reset_gpiod = devm_gpiod_get_optional(&pdev->dev,
 						     "reset",
 						     GPIOD_OUT_LOW);
+	if (IS_ERR(pdata->reset_gpiod)) {
+		if (!ret)
+			regulator_bulk_free(ARRAY_SIZE(pdata->supplies),
+					    pdata->supplies);
+		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->reset_gpiod),
+				     "failed to get reset gpio\n");
+	}
 
 	/* Request clock */
 	pdata->clk = clk_get(&pdev->dev, NULL);
-- 
2.43.0

