Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BD3C0A13
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128761; cv=none; b=ELRqeOlaAJ1Jjl88I0R0wBj+XFfpptYuKIIFesFljzQtA4jNzL9HnytriRt24mPZWwYr+zP/Rtd051V6QJebD6FfIRiJg2SkdMOKj1mjXN8PJncVFRM1KAH0bDq5P009OItudPqWgdECXXyEdejqOCVM5ZAuGDGmhphS+gcSEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128761; c=relaxed/simple;
	bh=XZS61d0mcO7GLkdtlPlyL2kzE68bvmUYKNf3f7TrgJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAAqUz0EMCt5s8zh90pF7vCfD2WF4w9VdoTgWpdx52k5gnnv4LFlhq1jY1zJs2SaltHOV/NdU+D8pOmZujgQDAO7HVlqSVsl+A1Bxs64C4DefHI5Yr4jEumVIuxgM9HhKP1CuFQfvCvExcQPJONID6T04FrW7dfUqxNknIhcJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqNkdAAW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqNkdAAW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so9331155e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128749; x=1791733549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=sqNkdAAW+XdbqaRT5HvubBsfFNg0bIjKznp8PYCPiTwOzGgKdo0053Bz2d6Ylhf6Gv
         O88qVjviAyVwtRIpKhAPTHdUu0x2q2MhmiNs4h+/t71S0COeX/xt6IlaEDHQKHieWX/k
         qzujEamRWUnk89gBiqWzjdBkzoxc7nbWQuuqaURtBQThR73tJVFFDStKqW7Ms6CVdPJQ
         3FxM3iEHgiIBRY/AHqh53iJPWj8eN9s/xtvxZh3HnxTjHmIZ+jcHrs+NhCNqMV8TZlJV
         383ZePCEiPZUgawe2B/8T0/Cp+EYWpyonyfgZ9JmFSnvlo5ujYMOj0titSvyMTf+XhQg
         VObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128749; x=1791733549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=cvg1Rkuriums6jdQxt0CJitoGY7zHiVmXxrSEUMuDOwNtfkEOUTVaOnQ4ugPsOBfZq
         Z5thPiAWzYoPBAyTGSiNPRmT0b42W7SXuRThrYT4LFewdGqVYJ+cdrZgxSp03MTq2G1Q
         ua+bWLRAqeiB6ir+pLckXlxwnJPP2Njhbh/2KxhDk+ydvQRRVJg2D2Rq73bF5+XsS+tT
         /d7OYdWFO3uXewJkSmnSrT/ny2kyO5GdkqjuoiHPXNUcVOWf9qLM3RwJs87Lq7rg1U1M
         mQyHVo7LJcrBElOPT5qTPXo30w324U14fxpKJdyRg5w2ozP8+IaUFOmNoI+rzDsBztPS
         Z2AA==
X-Forwarded-Encrypted: i=1; AKwUvBx0roToxlV3yg7ADSo3BbyU2E5Cuy0SRwcXqfri4Z1nC/61u/k5L96Pjog45kSLxDNnZ/M2ai330M5SR6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kND4yAAVxboMy1G82Bd1S+iHxTnM1XDAPWohGMpEBLqDP4ynkB
	oj6+YTgxFp4uxhmFb4Sf2V1I1Z/6wWiqx+0SWkyePRhj7iLX6414GY+j
X-Gm-Gg: AYBFou2XCTfTeWOpybxcbi7mw+bZ7HCINyg6uj+1FWXLzke1F8Me/+iM69CwTORyUL4
	sjRcC3LismvnUk333/AQRcJq+yfOTL1Z35E4R6ZHSMckt2D+EBD7wm7sg0mAYp8qPXHME8GfYnx
	+aD9XUD/vtSYuPIZ0qBCKBdc9lc/CiFufNrZVhDx0dlvOHcpQp5T3lum2MdBHsziVKfIXOlxKb1
	VmoG8IX9txuEooslFd+0dOx7KhzInjRoesxRYZP4xJAl0GH3e6QeKEqqYKiEQFcXsCY2caqsNOY
	LNGtZggF+411K1vtW8J+cQqWhKyKWGBQDizVvnNFJSpUYvwRng/wcYH97Wsj1kM9Aq1P6KCvckw
	hQRlV1nRIFcQImWIqGXYWeRmru/tH+P5GOpmdlXOZTxHLuedGax/rTQf2GT7FOgTqWagVl1sm0m
	BJPiMSp+84dlhNxBfi2LviAcOGKgEWk4X5NDIGwKNcVAmKYh4KXbM8YEdLfGk9chxGKLY/A5FGr
	OArkxCdNF3kQJ9T4VWZ7gr1Jt6N3Q==
X-Received: by 2002:a05:600d:82e4:b0:4a1:71af:cbc7 with SMTP id 5b1f17b1804b1-4a171bc2193mr13724975e9.13.1791128748595;
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] ARM: tegra: p895: Update power LED trigger
Date: Sun,  4 Oct 2026 18:44:56 +0300
Message-ID: <20261004154456.145362-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous "battery-charging" trigger was unreliable and slow to update.
Since LG X3 devices now have a charger driver, use
"max8971-charger-online" instead. Tested on the LG Optimus Vu P895; it
works much more reliably.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 0d56fd25ce178..f2b527dfbabd4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -552,7 +552,7 @@ led-power {
 			label = "power::white";
 			gpios = <&gpio TEGRA_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
 
-			linux,default-trigger = "battery-charging";
+			linux,default-trigger = "max8971-charger-online";
 
 			color = <LED_COLOR_ID_WHITE>;
 			function = LED_FUNCTION_CHARGING;
-- 
2.53.0

