Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA74D0CDA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218598; cv=none; b=uqsBi0DM9F1g1U4ZUfeUw/o+LA8ESE8kVTl3HpieHzSAOl2JlOLZfkOOa7Lmc+oa0SGEAUxxI+roSZrHn/+FsktzZNQUJ2gnIo+B8ZKUUsNJyo5nHnuGhMpFu5/H6a5sTtKMc+rjsTTWukxA/f+3QdiOgy3LeDm1Dvs97PwH5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218598; c=relaxed/simple;
	bh=YB+YbwoKBhI3W4nwrDoCGLgvOKJw1wBczHlEC67lwnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCcfBUn7z4+Vd5QuPQLCwDcVaaDdc41sIVn4kCl9zN+fVLHxV8xfwRlF4RgDWZu3FSaG8dsJ1Dj4ACIG5vqeYPTsJSgce5Zd/v2YXJaZIHGoN4hghSaJuwHdeCqF4j+OItsqXBuUVdn7T44cKgVa4/bumfx4OOWF43z1ys28KOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbHxTNn5; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbHxTNn5"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so2595600a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218593; x=1791823393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=CbHxTNn5gouwFLhqX6kvWfffsGp/cjztnVn4iVlCbwlU6rbZPiswRykQK39hwSVH0C
         0vDkum70MIfK8BnpRnZgTTIfVJcg2GABOIXNHlmn0vaV50N95WP12q/7Ep8XJGA+Y8VH
         JmcdahN5MFc9JQEGG1ESLBlfIzw84cRNhRie7uvKlD4jS2/Xr/WvjwRueBUwQGrqnk23
         +DnePaeozkosPPQCkzeNoIUmYUye9/PB6lARqeXHyTYz/6EZI8e8E9Gwn417i6GZZFFu
         IZvmFMiwcJgwkZtupiCdvrhUlAqMVrepnbnhAVsY3swrgzI1WXJ/Nplf0tXwJhsWGf4j
         ucKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218593; x=1791823393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=Gz8xJe5wV+XXeQ+j1K0zfGrMCGuv7VSISJpgVrQecUbMFjzmOeMEqQK/0v1aXNUfk3
         zNtUhujcSdzHKU5rAvVVrkTcHUAld87JHg8RLaAp1ywJRn1jXxPFwm6ELnziUNh5m9aN
         AiXakfS2XEPVnplf7R0tWSATmuJ8aWA3dwIUZXLKSYl77VowN1x36wSV7Gh+awPwkbJm
         1Fw4Ajsca4+gr7F5bzBUte0BRtokGba1Iy2jxGWJ3LcgaJ+nfTzVCiP+rKZVKDmqnbc3
         NrTOtvra2IU1C/VBpTMVrEHDvdulQKbReSFCZgiWBG79b+LQhlWCLrBl3qpvtr8gGtIo
         Nm/g==
X-Forwarded-Encrypted: i=1; AKwUvBx0kRoU6CBAaiJ9prqNf6ueOoJ5+sFtFiqy1my5cSdF3WMa8YXT0XJxtL205sf52ab7m6iY0zG5jqz0YNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYID/q3pdiQWaNUj8OHXKOFtEo+8urBZvPMPJUQQOGaAPQksDQvT
	rloMnjltqG7AakRigc62W/2cSSb2S91+QwD3Pv7RWFacPPy2fHWJO46m
X-Gm-Gg: AYBFou2raHAGe4lBHZKI2QObPcV6uX5hYsgo+A280xSLzykVFdqF+MUk7ZNS8D9tVIz
	evMS5j8qgfKzVuyN+SB4xUzuSNRJzsC5hwsoTLjzj1hXC8W11cR+jitEF6+6wfByp2O2kILbe2m
	sQXY2K4uKV3uIrpoVZJODQGRZlaE9xlAYZ0dcUQDnBMNean9o81ye0m9turz9cqhuNgwfzuiGcp
	qAcG1Z450p1X4/bxSS0okTaOAg51jf8ShbMaptQb7dn3QdpVEJDP8wnMRPU9LuwU4N5Z33LfhrU
	UPlH7mx9qlsAepukkf35mrrBVj9Lu04b6h6reesfJwKjq1iSqiFH+HMSWFHMuWgIUfTIJeML385
	mi930mrpQ7UhHtRxBwNJbrtXWgOeh2LQeAmrvNzFO6grcTBGwb18eRlq4qzY2mQvBOQC8pWOENP
	hlT15DfYzuNiDLW+U4ymFUCfCUdwurvlMceJ28rUH9EJ/FmnkJg+49zhOiNATqCc7IW/I4NxZec
	6xipZ7bd8YOKZWkAY9oJJc=
X-Received: by 2002:a05:6402:24ce:b0:6aa:734b:1a28 with SMTP id 4fb4d7f45d1cf-6af9e2ecaedmr7014561a12.34.1791218593075;
        Mon, 05 Oct 2026 09:43:13 -0700 (PDT)
Received: from workstation.home (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021af56sm3485851a12.31.2026.10.05.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:43:12 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Mon,  5 Oct 2026 18:43:03 +0200
Message-ID: <20261005164303.1208127-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005164303.1208127-1-zstaseg@gmail.com>
References: <20261005164303.1208127-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.55.0

