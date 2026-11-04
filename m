Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804265;
	b=icpTtyU7DP/2DzYRkUaDqZWOCXepgVUOn8Ji1brNZm0DEoKO3EB0MN1CWAbGumIFfY+z
	 X8L/uaj96pPnNp63B750+7udoM7Btr0VpRGdIVZUO+wAtyK+R4rK6805CqY0Ej2+Z1h2q
	 YkCsKBVPkMWTiVt8H90VsCAP17FUqucpCESMlyTnDZ8ACo/R6R0tGYsAo5jtoTvi9cMWe
	 fbI9Jp6lBqwbKczYrbEx6uW4UiHB+GC9wIi0JdnpyERTJ1F+tCNdFbheo3/RxRXQ3vOUt
	 Ohot/QpLwxDU6PxvcRCDW6aRX0+CEs95uiTTBp43Y0PwjzrUKFe/q2Mbb5GzG0K4f7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804265;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=apXXgMBcXmgqhAAmBS3GdCjBKzXMpnkhL16Of9ur6Ww=;
	b=IA8DczuHluUkJo9Fe5u7z3JcsRbZ5usz8ZaKVjBZbyam5e7ffgZAH/SROeK1u9Z1/BO6
	 NOv1t2e+QLWw5tFlRR808KmHRoIfSl8/agroURFer8TusOiHvY/Ik/VqJl3rpluDKxeR7
	 OvU3NfPn1qnzjwK8cJ/PP/NuEiM801ld2J8xwtQ2cWqdO6JvYAgONHdXnS0mkZdhL/cJp
	 7dqtdFwlRLbYAeMCqoCALm/bdCsruCBrPZ1iyPExXP3ZWHl61rFOy0G95/idyh/d9zKUF
	 vNJjok48tX8i9PL1oXMj90BNQT5vuUxz7swyijp5hqz0L38MkzYW1eyx01F/W1Up4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBD606D802
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBBD606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1147307f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804264; x=1794409064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apXXgMBcXmgqhAAmBS3GdCjBKzXMpnkhL16Of9ur6Ww=;
        b=a0cyzfPMcOmeRNtAeBPiOmskHkBSOONtNAc+U8yRKcYYFOXRTwHen9Ru3vKzPy8YqV
         KzUS3xTeUHYA5fN07qQfdQkh76o9c9L7qAZVjO/8Lfyhfnuzte6rp/cnvuznqdpMxB5t
         isRXPGQ7U1NZeDVAstkwvrXVUgqDnOF+22i9oEgP0YyeHC4RoHgNNuDWnj5K2v+6TIwl
         7MSCNVqZzevKj6BaveLPWSrPVgQ5EHv0/xgOEzIA6VjIEsDjj2VkPIneVGf+J9idcK/A
         KoYQHx8LfyU09m54XNVT6VXowufBcbWsASzmkCjqNjA0E+wlS5cte6w2JzfcW43eOoXe
         1t5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxG7TDVUctG7REmeWUGaOTa1DXexoIxoefyssSZuu6nT5WtHFNW6YcSnkI7mH3cbDjCLqLVprAO8l7RxRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O3b/5l/3w+eyugw9Dv7eEE4Nn6BWShMPjs9+gN0AqdUMBuYF5
	0BVgONuU4oldNhpph8R1kjoKS7AaLLENAZlX2eBngm+1Qb6XdrrEx65hnPQMy4XWzYA=
X-Gm-Gg: AYBFou0xvS86grvb/HElyUcHZiyESrfv8Hs3zA1LsQXzWEZs2ZkI0/+UbFx7Gy5MQ+d
	EiXl8d+3GpIESpxUSgD4UX2kFsN+obQvMdfU/nZBIn/miGUqwh+cL2O01HtUq//caBXSQxV2ZLg
	rvlrKbhzeJb2cbCygN0qT1yofoWM78Dt43lVFUhQhi8a1ILD0qwj+Wc5riYPa07vgii3csbfmBK
	/kGybxo4gQW/VygeBdj791YcVgiy3siKdUZIH7sE/R4ASPCMWA4ZNdWlTrbPYjmNLWG6bcGQNBC
	RcXpRRGiw0PraDecX20sh2nJyRxoCL86+ac3PHujHi4/jJSSOMF6fT4omxPV0Od4RoCRqnRFRlW
	3UFdrVcnYy/yzU0p3LWOtwFCN0mq9mtZZrB0bXGiRocGHzPhl7G40GUXJyNtDaF+RvEIeDoepOx
	bIZzhxHA/HB2BgKxQxlg9uDLla9gZnWg5eIwATSz1bXFFHbFCuBIAEBLIoxdFw0OAhd+jYa7j81
	RLdta9SCwt9FBSKQORRfTSMzxYXTlbN1zVgUSIZ6isUhobPI674rnLwQFi9D0mnZAmcsjjUoMeK
	LLA5TapSbDaMyM8a+k2zuXccIA==
X-Received: by 2002:a05:6000:420c:b0:48e:6264:c371 with SMTP id ffacd0b85a97d-48e6e2cb57dmr39441884f8f.9.1793804263873;
        Wed, 04 Nov 2026 06:57:43 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm4830051f8f.27.2026.11.04.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:57:43 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH 2/2] thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init callbacks
Date: Wed,  4 Nov 2026 15:57:40 +0100
Message-ID: <20261104145740.2623473-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
References: <20261104145740.2623473-1-opensource@grische.xyz>
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

init_8226(), init_8909(), init_8939(), init_8952(), init_8956(),
init_9607(), init_tsens_v1_no_rpm() and init_tsens_v2_no_rpm() are
marked __init, but tsens_probe() calls them through priv->ops->init()
and can run after free_initmem().  The call then jumps into memory that
is no longer mapped executable, and the kernel oopses.

The probe runs that late when fw_devlink defers it until the deferred
probe timeout.

Fixes: a7d3006be5ca ("thermal/drivers/tsens: Sort out msm8976 vs msm8956 data")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
 drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
 drivers/thermal/qcom/tsens-v2.c   | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 32d2d3e33287..a13897632b91 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -207,7 +207,7 @@ static int calibrate_8974(struct tsens_priv *priv)
 	return 0;
 }
 
-static int __init init_8226(struct tsens_priv *priv)
+static int init_8226(struct tsens_priv *priv)
 {
 	priv->sensor[0].slope = 2901;
 	priv->sensor[1].slope = 2846;
@@ -219,7 +219,7 @@ static int __init init_8226(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8909(struct tsens_priv *priv)
+static int init_8909(struct tsens_priv *priv)
 {
 	int i;
 
@@ -240,7 +240,8 @@ static int __init init_8909(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8939(struct tsens_priv *priv) {
+static int init_8939(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 2911;
 	priv->sensor[1].slope = 2789;
 	priv->sensor[2].slope = 2906;
@@ -255,7 +256,7 @@ static int __init init_8939(struct tsens_priv *priv) {
 	return init_common(priv);
 }
 
-static int __init init_9607(struct tsens_priv *priv)
+static int init_9607(struct tsens_priv *priv)
 {
 	int i;
 
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 7bda8e6087c4..ed0064f4e1ae 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -145,7 +145,7 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
 	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
 };
 
-static int __init init_8952(struct tsens_priv *priv)
+static int init_8952(struct tsens_priv *priv)
 {
 	priv->sensor[0].p1_calib_offset = 2;
 	priv->sensor[0].p2_calib_offset = -1;
@@ -173,7 +173,8 @@ static int __init init_8952(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8956(struct tsens_priv *priv) {
+static int init_8956(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 3313;
 	priv->sensor[1].slope = 3275;
 	priv->sensor[2].slope = 3320;
@@ -189,7 +190,7 @@ static int __init init_8956(struct tsens_priv *priv) {
 	return init_common(priv);
 }
 
-static int __init init_tsens_v1_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v1_no_rpm(struct tsens_priv *priv)
 {
 	int i, ret;
 	u32 mask = 0;
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 843dd29fad2e..22284973bb61 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -220,7 +220,7 @@ static int tsens_v2_calibration(struct tsens_priv *priv)
 	return 0;
 }
 
-static int __init init_tsens_v2_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v2_no_rpm(struct tsens_priv *priv)
 {
 	struct device *dev = priv->dev;
 	int i, ret;
-- 
2.54.0

