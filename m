Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585905;
	b=cBs6+YgPJPQ/QJmgpmD5TpnamEYpGs4DSXDy3yYlDou4L6k2dAuqxKfj9INve4EHXU+C
	 O30J/nhkr0dlErH0K7QQ/C8h5gbll1wB1H24yhdfseI7VrLMKQqAW5aaO1tbxj+l6UEoz
	 8b5JaRai/WsXzXirqYj5kUxJ/KYfENsPnULqGrpdCrmbWqOZMfXBL3dVju3zkJHRijwUO
	 D8/SHLUCmlzOqVx/4cfIP4ujsSTwWhz2WIgh5wZCYJriYyfqUJV0cFip/lWB9XdDXaPjK
	 XqtGu6ugnwTiWth/0/N6Vmy3fbyTyMAWYMooGOD4gscWwFGpxtw2Tzs2TybYzpavimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=PIswKYlluaDARtIzDWuLN0cEtsenjjPlYbjeU+HWeAd5iw8SCbLZEdbd1M8PzwhwUljE
	 CoNHdeY8b3u1bUbKjUGtijy9gh4M71LJIP55h0+ZNMzjruHtWNlkiPvNfnB4J7FCmegVP
	 FCz6YKx/iQRKYeXIbVImkrJ1xNhaNLQsLMl/ESH1v02nEjXaYrbPas5MXj0aZcoKqGKOv
	 1pPWJ/ESML6UIlQ8m2O6ZMr+zqs2tgdqeM/IEvPSe6UwbWlccLNJyZAKORcchnHJ4PSzI
	 5A574ntCG8GHVF+sJxNavJGeH/KPpNY3s2O/eKmfL4p/dYMvgccW3t/+9BHuvUsLKeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD660A6F79
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DD660A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1732759a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=CsDLFnXtB3WQ1uRAtL8aws3SolQHAtawncLSuzZPxSkA+bkQI1GAq54XPJex/Ud0wa
         EKWnT7UnEAVaqSpnyo32Ah/rEBa4EZSOOv9HFTpYrKnAHHrMrFRvbXVX+l/zeWSK00uR
         cyQhJpE2bgjnpBr6UKRN1a2QuYXr15PO7++KJLHnTIf4ZtGjlMFN68qoP4H+j+lT/kIf
         jqdG+IjYbtGtMwJzN5AaX31+8wOvMxnMu2IdVCLPO/xrb3qg7HNBi8Hsy4Q4gXuwTdwl
         JF7s93f6rXH0EgrcPxwC2lWZygZuw9kytyklugU2pHYTmMHAj4xrfTMrhfrtwxuJhyK4
         1qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=VD8FBVce/4UPGEgrAeNwqg0jwAEMd2st8mQRXch+OYb5uRaKqGmdR/6Vlc4z4u9OMV
         OYVU0icmCvFogEqq4Ntbo8lUIaPRWm+a0+ZMXf+5LnOXBfYjr7+8d//1za/fsNCmZmr+
         Rq1iEalbS6+HUKlgvPosIYLxp0mydsfLUCb+NEbo1RklGpHjr4HEPh6X2ePN9YwjumIa
         0B3Gy6Mx61BBhMg5c8+NoRYvAESfxcCxjknAusRqg3sKdjBz992uq0/R+gyzlK+GXI3f
         Q0ONKOQJ3soY3POyP7IDyZg7ycpVQfZRdCFwF2kTrpWlDdHtvDPwGnZaj19jQG8E04JP
         Wmog==
X-Forwarded-Encrypted: i=1; AL+hErHUVtGHEwblb8mCe/Usk76WWytEFZzgLmuCgWKZS+kLzhjATXamQVWnT5BgF3EIX6Z+5zU8xHNopb2JdO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8Oj31t0otHP29Vw4Xw+50lezLX1FbQbv/YwQWAg3k4qioP4Xj
	LYgpMzS/SEsbN5FGl443/yVhxYGr/lRdIHoKZoK3DV380FZEHkBMpBcTHPhd7QXIqQc=
X-Gm-Gg: AYBFou1WGJyaml20dJpIt/4i20da4TXAI0/+o/pH0q69E7vCB1jvt4DaEFivk7f3TCU
	CAjCMzt3qkW78IGmgtN/Yv1MRmG1abzgg/L6I96Wb6NQ4rH/qp6oqjFh/n1HCbpjcVGU9nm3A55
	WjUjDn1IS4yauD+9b4JTBK2pJy4/h3nzOvznVzTzEY3kOXZAlxBaJSzsbFk42YTksz2SYo3KW18
	eBYQSL/Txb6pU4osrIcM9FU+RQmxzoocC07ikfGyAB5/JGJeZrg05OgFCAedmSVr6kwLGwL7ygV
	KULBC0yuJW8cdqH9j4B7LnfhlgHO+rGm25JPFr8Bf0z44k1RcPt6jxZKEgOKhfD7x2g5AiTpN0s
	ngSAcmRCyDDlkdVdCimx3ZvV7S7TZl3N+a3r+5j1ZamvcNTCKxKo3/Q0qeQ9ytPfufEGP0fniUO
	8QY5Tiz6S/uij5+D2xjm7qakuAMYy/B1xseAbgKswdiHlQY8sCwAnRIcg/YGOKev9UKU3ilNQzE
	T8f+3RCUhoYD2VEwqC/AG6RfFqWB4827Owq3TXhAgi5uFbRgWKPoPUJrLwLRUkv2YhVa9fqOI/a
	bEOzs9qs6BuxSTXbn6l/EBe2vKMkFpjo07CJOXaxwEFN4NoGC7A+iAH5jWXMnWH2WfkCtXJEgD+
	HXhxVntk=
X-Received: by 2002:a05:6402:c4d4:20b0:6b7:8ace:4bdc with SMTP id 4fb4d7f45d1cf-6b7c0be5dc0mr2076346a12.29.1794585903767;
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:45 +0100
Subject: [PATCH v3 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
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
Message-Id: <20261113-bat-temp-adc-v3-4-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=39kPDo0KhTsrVvnjKB5C4HJbyboZEw6GYyL3G45auk6/fdnDjvSVTwlOddsdPKaBb22KYj5re
 PV5Oqu4IxGcAOs2aPblfI2Ry7nV+J99UGRYwq9dKkZe/+PFdMxVRJ42
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

