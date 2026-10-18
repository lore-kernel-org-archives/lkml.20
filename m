Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96636402D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339574; cv=none; b=R2GzOYbTuqQ69f6B5G+84Xd0zx4CRcwXDOkyzzWordTKsUPK4qjKXsy5jOMKbuaCBxqokwDbMO36CBR9Nu1s05eTeSlwmkSumMy6u46gJjCnVmtOWMj0R3OnBVt4PMO7Rm1dff8cYXDANOG6ITw5FBtf/PcopgfHgpfHrAY5SzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339574; c=relaxed/simple;
	bh=QQJdHbFVBJHFCDrLeChsxHNa8N2aCigs8BUP95r4Zkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2oYbJGcf/MkBrKkmbRfibE7inIEn/f3dduyqCwLKGYtMbVxdrANixgaEJVWc2cMvYJavVgXyvhMzNa99D5r72QFl8AuM8VL5xdUBfef8CUHSsWwXCHn/EEMXln+DDw+tG62oPvXPtErv7FRL+TR8v9GakdxcvxPeTjuV6MW7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8OQI3m5; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8OQI3m5"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo3106767eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339571; x=1792944371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7V15sRJ8dwoI31++1uINRuoyJkh6H1c9bF9VyuwB2M=;
        b=G8OQI3m5s3BhyVAfygDNHmLbdcXp4WMO9DX1x1Ltu01yICEbKRZq+M0SJzkO8zBt78
         z1LbVT4Ih5yRIpZGEnybLVdRzCxAGygNiRXakSQJhXtF7JMc1ozrRmce0HVXn6MLJn1Z
         yTO6NrNoffpJ1o2WZjORq2qELRnKhDts9B7JkjVN1A9OQuHBMRJQTMRlVexOdwCieIX1
         5pNRl4KnQIlu7d+QkxuTb2aP4Dg8qOl3qoYjWbKfI3mjsiqb3nqAJnpE/YZt9hrymbH+
         +xok/y14qeYEG5Fs9Fv8qchimmHcEl/bFSOdw/ncIjzE5uMfP9Vg65D1caoHA3gBvYs+
         FbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339571; x=1792944371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7V15sRJ8dwoI31++1uINRuoyJkh6H1c9bF9VyuwB2M=;
        b=RJO6VvlX0LDxMRxLgbY6NCGh9wW0XUkYnapOKrO0JszAAmDOV7wjypJuvJuKMAGmAT
         LeBKap15xmw0AfAwrgXgwxVy6jbA+iH/ALSJIm8J2gzcVQGHhOp/NXQi/j8LHpcVS37M
         iPCr9Ceq1RYYduvFWnw2PKhHdDrSoM/VQLaP/TTS2qy4FasCzxc1WxG4J8AYJkG8YiPt
         OtmZ9LrwcH7capXDbnmopdMWn7yhBsRhJqGKzt9O2I5dIePJdiDbtUJUmx5YAz9IagM6
         +kSZITKgtvxxnV6wbwRTYZC2RUcC3OjqKLMha3LZTNDPOMilJ9twhLPk+3fxuk/AaL4I
         9Cww==
X-Forwarded-Encrypted: i=1; AKwUvByIduFz2zVG2s5p0089QjMo+KCX27rWSiBfwKRjA5BxR7P/xW4sG47L+WUptydl2e1Msjx/tAOHMLMKqPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLipPNe4iNWXBwcho9vVQUoWd589hkGllD3QTN6VwqEmACW88jN
	3hWasvnaWN31l1Tbf3O8p2NFxMzQY7K96CP/AYvfojSRhOU/U/y/r+kUtFlVFw==
X-Gm-Gg: AYBFou20Ayd3EL9LPCl/y45FnnzFDKIuzGyImgmdBEHtR+dH2UsVgKFz6BADRk5JevN
	6ESG6OOimJFA+xNkeRwkHb+HRXYk9OrLCKyphTETMlZsA1phQRGig6QkCfhw/5h5BMelKq1NmEz
	bsuP4aXgG9LezX854qnpNNR8xPUsOIoLigyBTDyQMw5bVj7t4VdkaVgNa5WoluVeX2Bbl7jwOm/
	aTcDjsYGh9Eu+WqAme69ViumdrjhC1KcaQiHqZxRib/8XQmA/BpUgnfMo/ekfckprU+XadRtJq1
	letQ1/toy/+8QqtdS8PLCnYnmSWxsJMOFCF9D0Te87pm94iX//35lO0gZ0YixVMM2nw9GE/PwA0
	4B1bclRoCjZVcUXOTs+DHGQOfQpab4pVDxgtOnCL0MWHBAR5PQ2/aiihHBvJlYOcubnGVv2s+wp
	qwjxMrwgun1HOcc841T+W30nr9pIyhXCOQWD9k9LiBlduS6uNoXcqb1eBQcw/foCBayaUtnfEMD
	c4aHnZ5QzdX8FgSBIBq3UkCuMiu9jTaH05qida19zTdzySewPFY4ZbWDfI4D2pybXlt+v/vsk8=
X-Received: by 2002:a05:701b:464a:b0:143:868a:20c1 with SMTP id a92af1059eb24-185151be30emr6936126c88.46.1792339571071;
        Sun, 18 Oct 2026 09:06:11 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm21507861c88.5.2026.10.18.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:06:09 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: Add XBOX ROG Ally X 20 Tunables
Date: Sun, 18 Oct 2026 09:06:03 -0700
Message-ID: <20261018160603.65449-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds Tunable table for XBOX ROG Ally X 20.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 5792210b75bd..8f88a979c3d6 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -2697,6 +2697,32 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 13,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_max = 55,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_def = 17,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 13,
+				.ppt_pl2_sppt_def = 21,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_def = 26,
+				.ppt_pl3_fppt_max = 55,
+			},
+		},
+	},
 	{}
 };
 
-- 
2.55.0

