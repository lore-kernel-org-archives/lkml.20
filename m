Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183661A681B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503035; cv=none; b=uubLCxmtd6EQvtQ7cBtSyjgbxSBFOZQNPyE6vvGfF7uRbPEE1UNG2NTJiEJIl/7yOMaNoXnNPfwDOxgaKbTT9+AVO7fQmdMjR2ST+oUxYIQgn8CHZ3qOEvovfaubV7JkVETfSmYeUPWX0rrhGVEPZldPa0Jke6Ot9NOhavgnm/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503035; c=relaxed/simple;
	bh=qo5/6Rvx43HRox+liVpTx+J84TXTvjvOaVg3apZRej8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiHW1PNw70Eg3HjV8pEjMq1HBMmkWZrk84b/BkY9qu1NwfGVcUgUwtLeDOIH3ddakeWVyMjrpTY36WvLzSKm+qQbckBHBegCYKF4UgHek2pINNdvoxGreRyABb/EqSPoUAwE0LnN6GYWYDyjnQYyLuRcp3xSggU3BSd/udOw4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+ix3Bh5; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+ix3Bh5"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so774346eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790503033; x=1791107833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zl12kuWFPbDDv+liW9sd0g6auvyCDPTIyeUkkHG4bLU=;
        b=X+ix3Bh5TK6017tfS/740+gzJdg6VQekAj8KnrHkxBzorkIfbXtZ91QQA70sKYCtpi
         e/8v/P7e5qC11RkK5BZ0LKJx6wVazgqhpubfxDgPXbYoSHlIqmvxX8w602DDwv0thDuF
         JlA9codV3ZEwvJryGfKPcMxIayfkoY9JtrjzmM3xdd6C4xASyBkKfH9JMp0JATSTXE1s
         of0Xo6SpgLtBkX4mKVD8DUHVyBBktOyUgAIxLI0jaBg6qMWrFjthmulQIxY2b1WQ47lB
         wwJD5L2q2zIgvOhFKDtq+tCMt3s0OqOR5nfuj+kbc4vMJmUNr3FmHIRB+eYcHCPo3AWr
         qbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790503033; x=1791107833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zl12kuWFPbDDv+liW9sd0g6auvyCDPTIyeUkkHG4bLU=;
        b=gmgZCL1RnqsshMwaEGgxyUAUhEDYzwdWyteEOLaYXqlZeXZ/t44ykHUYfG9ISpuNvI
         dTQA2R0642uZOAcc46dX6ONPpJxdxHF2+LBl1ApWNJleFj7bVM6YWloGC69SpFdoxSAF
         yjrjGHgp1EwuNpWzS1zi79QYJ95bXlXw9zSUWR2rySDdR+FoDYYKhoa6uYMkcsOmrM/4
         Cy7evjrMNbz4NHPtncSeagPI6wV0AFLM+0DOuuDzX/I80bbmmAgCgEHpUdDxxlKtfwMG
         4TScVE/O0qq1Bo5S+iB9PgTGSqTHApEk8aziCV0SimMkaXJ/onIQUImJw1r5aMwauvcG
         GCEg==
X-Forwarded-Encrypted: i=1; AKwUvBzGr6fsxECIhJrzG2126OBzTBd5os1yVZKEhTvd8rc1RDsuSspQPfeuVFlsc7I6TxBxc7lyTxG77o/G+vY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYLJdq6BSqqt6CTb9sH37W+WYTuIiowUwZ4LxCDAXZEAb4OnSz
	v3++SNb9ZgpF52tdPJ31EEqEBztcZDyeVCctwv80bISkyp4QWStLb6QV
X-Gm-Gg: AYBFou2vhcaU1RUTQCMQfmY5YHw1iqMv/hXFPMGmMLfdYiWZsW+9JRAJfc7jfqhIQS6
	HPr+RCjxs/FsdFAunxqeFDvJwPCHdmMIXFUP1z9V1yJlnwvXAwbpR8rCIv2vl6AV2vV5ftBTQIC
	UTaIDtndeoCbW77vRxF/Qlp/uLDPqhufCchoMAKPFn3K+u2UvfYj8P3VI7vdxkEfycylymFQJmx
	vvvkpjpus47PI64ajz7EzRWt/t1j59zuzj2b0y6JmyLGuRCa09//8Cr+/eTek3Xgl4kSTdUlrJo
	hEzMlZDietxZCR3x7HYZTdML8ygMzCdzQcTZrngtkjQnnCne6DDGU/489yCnYFPREPMPCE3KHj1
	zxYUsjxOvTubiDcJBfQCwlDM0yv0uoEbMQVPVrXtTttVavmoC3ygSkj+wogiOATOi8WUKwFa+HS
	7ouxmwODWE2aaF3vRlQNV2NkRDYkVZuojkrYWra9P1CFsWMslynMK8a6E4TGLnrf9Yd6Quo18i/
	zW9JDZGcGEfdZzdDxpPMmkuBaSH/76Fsr0=
X-Received: by 2002:a05:7300:a987:b0:33c:1f00:358 with SMTP id 5a478bee46e88-34270ac690bmr7433551eec.17.1790503032942;
        Sun, 27 Sep 2026 02:57:12 -0700 (PDT)
Received: from archlinux ([157.48.21.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm23525304eec.15.2026.09.27.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 02:57:12 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb3xxx support
Date: Sun, 27 Sep 2026 15:27:00 +0530
Message-ID: <20260927095701.185772-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 15-fb3xxx (board ID: 8DD0) uses the existing
OMEN v1 WMI interface (despite being a Victus model) but does not use
the standard EC thermal profile parameters.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8DD0,
including platform profile and fan control support.

Link: https://github.com/yunusemreyl/omen-space/issues/206
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d4..616f7432e024 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -350,6 +350,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D88") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD0") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
-- 
2.55.0

