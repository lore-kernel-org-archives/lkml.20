Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013325;
	b=SSF5Y0Jbt8Qn+LQ9BnPu6DjiLy6RYF5maT3aR/UIAboJzAwEnPtbXqSOeJ4Fzr/Eaba1
	 EoV3y4DszlvGMKZmLAfSTXX/uXkY1ztlELaDhEF4UxGv8FY2z+UmeECQpZXKfr5r59GTd
	 XPIPWvM38+vKMg1S18ZIZg66eWSkNZFfz/8UyhPwnyNhJbzzliOyexBdznsuXHzWjWqQS
	 lyMniFDhj34WegdLU+yZelsTlm/E1LMMVNoh3vxMV91xNXmHaolWMUekaI2RYjObFvH80
	 E4QRt0T191akQlZ7600r4GpmiPptxefmZ6YzY1lPmBzRLovwRSMB3a4lqLEUzBJrEAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
	b=gQ+EaEhQWxuI7Nn44S2vkSK/e+N2daPqfs12EVeHMi17A1h50JAf4zuqU3evookoS0oE
	 OQA8TMof0KWWAP1huJ3rdmrW5XkntLbpy8kFTgerkhy9JCQsMgw8GEmDyNkc+jD4CqhVy
	 /SnzmEpnifOV1O6CZQpMcmK3fyrzw7SHsKEJTJmq5Gg+sNgZDzoIJgu0i8jXuSpWvhJLt
	 AzVbeuE2O/4TKfv3w2J8GD0M3q4bmrtUdweWXTHVnbINbQFiQCaPXSqO2FMV/qt0itrK7
	 OXda/xhz4t+s7GlxuxKLQylZgMe+J6N31M2IR0IUVZhdZZSiUdOjJDHeBrwQRITfqhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bWr5L/+Y";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2C606EEB4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E2C606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bWr5L/+Y
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8199095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013324; x=1794618124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
        b=bWr5L/+Ypq60sTA8tgrRbxghAa8AL1pLbfZGBUU933a5lttjxGx7N+5is8mCArj6xU
         DaO7p4I2n5IwIpAHqo3rZm668UeiqCjrt9aHFLfNCSGdg0Nw8lc/Tz+BLX9L0TmmXaMM
         sDHl7cJYaYh2QzXYno3C4edEMOf7hTviUDb2KjIezTbg5jXtbvArtUPm20wzi+OX8c75
         6ID4IWkJYg9N4l4T+skRosrM42wbLrODN/CRvSCIBWBGtOPdiRoIz0iB0mgxEOo1udcw
         82XQ/X5czwFosKPC3L9+1ol48arcOWIHtNfWnI1fTHHAz4IjR7ky642IOhYeaSd4wcg6
         7dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013324; x=1794618124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
        b=SK8X3A3v4VnbdJURVqIsAs2jj/Chyexn4dkCZ4Yaa0XvSHGyAgt781DpRJ8Pex/kUZ
         wPKHkk/VTosxKd9sVThDieGVTu7wM2paw5vWefBhj8OuZXdluLLsfCkJKjL1x2abWTKt
         yhoN0Jv3vQMV8Rp1htQPSyHNlIvKHHOzI4v7W31JfyXSalY5mQ7a1yG6dAC4LFUg+Fby
         yiuZmZ9Cy5mXPPGQk7yhIL5Q/o3l3mFZlFBZM8S2BU+hMB3kCsLrxHjn/7HSUp88dyjm
         tTRwSzfZKJAXo8SqXMIG/04W6LNcvK4O95gq4aqjyyOBvXg3/U7R7PbCAZsMWwRSTHV7
         1Rxg==
X-Forwarded-Encrypted: i=1; AKwUvByCMM1a7AXIEQGAvDtbQWdpywyn2U5hb1I4WHzP6+hX51s3ykVlgeD+8ZlOhA90yEgVr8bbuel+Fo5iLqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yyOBulia2W2Tlu/i+AimZoru56GhWMCrEtjkG+pzEMyXLK6sm
	p+ZjVhQHE/Zla2IQ/1zp+DHsh76b+BLi14NaVjjMohtLIGXpMwfST7qIOYeb3r99FhY=
X-Gm-Gg: AYBFou3B7pNlTaXLBHi9n52O+YScXvXGXod6OTghOT/0wuhY1GJeZjaDBFfmn/Da+T3
	rycGJrRGyHMKW2/9yrWK+JGxct4bHSWccShaSohXsfgxR251MVrsXH3SzQtctM9Zg/hRMQ9hNxI
	D6+Tfdte+tawul/yHHfgk4kpvaV7oJelu+punASKeBE1sF7gowEPibGbZLEmM0aZDMp0h+wbWy9
	rO+2CgnEsqdf+1xGNG9WJz+szgQM47BkNzOV+iDLOr3DFGw//z3m5JAipuJ37jImfuGWz0HKJF3
	s2pkRhA1hHupVQFdgh47b16Hg+aD9jA2q+tXV+wAbFz7kRxW/xPSzKT/UP52e+PD0rBUene5ni6
	dU/BSU1CrHG8MuNTS7ro6laiv+UNWlnhhSRDaMT1dax9+Rr6/otXW4WOPRQRF3Tyc1mo57RRNLc
	nnUOE+6iR6WqwWEWOJc9yBtFa137VoieUzL6UJbG0tyFRJ2gVW8nrgiD5AEuymUFKqXnxSPsHGT
	Rav+HCekV6gYYwMTMrOb8NynamYlWgsrg7d3uH2d6/0lTeCdXdTCMz1zu9T5j0W1+MqANAFtqNB
	VnUXNczDAiqhLdzSRA9IOw==
X-Received: by 2002:a05:600c:c172:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4b6de0ce784mr75713875e9.17.1794013323786;
        Fri, 06 Nov 2026 17:02:03 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:03 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:51 +0000
Subject: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en logic
 for csid-gen3.
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
Message-Id: <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5512; i=bod@kernel.org;
 h=from:subject:message-id; bh=nnIVbItJxuQZ0Qr5moeZMp2czLIaOCrSffwrHAO9/Ds=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh/UhDLGaiSfcNaMWhUm5QNiXuNVARgwu06S
 wCqzNyRAWaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fwAKCRAicTuzoY3I
 OrsYEACYj4djjxQxBYoKfNdgyGCIjmqob0IP4oHzTzi8oKtDO2h+l1SEDVUoAA3WFWu4yLuV+cn
 76Yn2xEjRa6J/gZpB3DSsDUbw6pzdiHFv2pTiZiJ0sOX33QziLjKuTEq24wl2Jz0CFIN222iATf
 8QT1W8ygouJbHGszU4XiWHzhVpPZLBbGiF4W248bzegoWi3UOCQT7yY+vEnBVE3p6UDzlYe/M0a
 XNk0Lzk6QfGkk5/pkZNq6y3OzpBtcKzNK24ecXXFfoUudw75+h0S7Z49mbEudZ9Nouapt9+Oni/
 oHNide0UDrpa04AKKUse42myqWTNnsqEXz7MHDM18T4HVH0YufqPMLSXm3urSWb5b5s8VlovzmZ
 VLQ7rHYvXiIlpeZcFrLmATSBfTHvkMd8I9QOHieFZR2ox19ux0cXk1v6cKwMWMbJ4xURLy2GeIM
 B72UQCDb6I8qXpwZJ924WeBh1XBurPGu0HWvQuYr2mBC5tHJuUGsZHFPud3Z0Wn1qXHsXHcbHl9
 aAZ8oDk7chqqHG2r8Fr8ywQKyDG9NGHxnBz7l7b8sbdTH7FFnrj0C6ykLGVlyLDd3Uyy7bkeL+q
 CD5bxpYnl+3JqrXFP/62LnQUAQrUHAsIe7GYc0XVrMyXMl7BG+rkYLrNSPz7nZTdXqPFLM13sCt
 1DqbLnPy7HM6c6w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 52bb19f5fbf3b..b7821019241d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,

-- 
2.56.0

