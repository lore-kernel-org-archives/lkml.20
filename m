Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217322;
	b=H1fgMbz1A7N3Q29tCsAMLZVgoRYxA7mboFFW/jj9myNurss2O0ehumKXIvZ8ZXCrjEiS
	 UU0L/kDJGDQHrqypnTT29436yJ690GxrsQu1MGC/Vp0G9nu0NZC2cJGVJUafaouHyh7uW
	 zV1g/BWZ2RRCcvQWmBQfQVIs9PnhIQxNi7hRVvUIFLQ5FKJzkx9Ho9O2nGkhFTXkONk0y
	 snBCXXKUPDGWHeE8r2soUCrOdQ/b4OOzsR4CNVqeJ/ndecynQ70ND49OZdp9bHLLeq3ZS
	 YFw1pT4GKcEkNtZLurwD9D7pSTw/m0NVlZ4Nlyhqvt12byWhjcDJwCRKC423eDhIqfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
	b=IerZ6MvkvYB7eV8Tonjhc9CJSFUOCYsr6XOW7v94I9VJIbaWrZo4BztSk9UiP9GLBmZl
	 BLtDYInR4G15+AQBqB5GpU8TxiOQwTwhAR5/+IXPd2833THkja/813+uzrgeGxalHZGST
	 Se0m6j/FI4u6WLpS5KFRnntIonb1AGwqds14ociFYJJrJTGJ5Gdc6NzpIBsyzOYNWqsmH
	 JQDbSTH37dbjbnF5t8t13w+/g1paYp/Ir73rJYUvff7lxWNLvNXx9Hg2Ajgy6pEJW8CVk
	 vHL8X+IUX3dFb8UclLXX+cwnT9+I0LEjWC8j6hVDW7uz4H6fWHjDTimN/OE/I7FoaUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=jwJWJpYG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C2606D823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2C2606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=jwJWJpYG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so368017f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217320; x=1794822120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
        b=jwJWJpYG53W3bYNAMjjnfAHNEopoiPfqGyHAI24dyaZQLuAXG/R0aWT62L7iE4Xa+l
         nWuO1sGeg0D2G3nth8+R38WlTxdcOvd6mvfGIzMulOxmvp7AoazK5iluv2N3oUOZ/1Dz
         LVIuHoEKRz4PPldNoDNglzCZ985xc9uoyEI2GQT/QHjpy00HhmmNLf3u1OOEa96NNl/Z
         79wzRaz1EcbQ/uJtFl/1uOw/AYqFsdf9/EvwYYdhplVoG1uaz73zyGe7a7aiTGmheFPT
         Z2V1uJjmro20ysyMeFGTlEFfIrEjM0J4KZ7Bx6jqPQfBKH9jj0cv0/VpjXq/STAlG0U9
         AqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217320; x=1794822120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
        b=SOEmYpyQA8yiAFpXMHdKWYnoQLIaC6Os4yjEu9qmmmAdVd3gB+OsalpEuVqgutCC/e
         5vZJC6OeXjkpvjypVs3aEAC4myc5RK2ir+uhRanORKtA6n1bAaz+Jj8UM6MF5DiDU6bN
         jDffKI0v8PgIkCoi4vBKOuePDkM3K8cbObMDUWxkZLK/gKPPT3nAv3K3AJZsQWpgANIK
         aoXWJiKEAmdw3NO2d2oM7TZUFYI0FJfTRS0ElwqULwpWHIFJd4rHYZHrQWPuXxAivd05
         m89eacX5DUgoOGTHbf4UgCOxM4z9bOo60riI2q0ST7LqTjAAHriRjMhoylHwTcxinvBN
         PCBw==
X-Forwarded-Encrypted: i=1; AL+hErH+Psaotrf/w6jPve/zlJMorhKImsjGLlEa5hkphE9BwBQwAPBdo0tQDAM/R5kSh3Ls0rv6FNhSOHnUE1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H8LThvEvxOAO4Bdpjjo90BwxUWSVXhFtqvZTlyarW41PEKez3
	hKz7uEEuzmZiq6hPnymNGJnVFs1oF+GnQ8Rv3FPr+oA8zMUUZVxttldNdgXXa6/uKctWZLuhEDo
	qfT5uP14=
X-Gm-Gg: AYBFou3zAwacyWKd9SpSNwiCNYUXfu3aF+hZENAIoAHew3AlXUcaAHFl/k35ETx8Uut
	n96aHBtldq3LQtIFyhA3xWSL+Ym5WGg9fhNvSPru+wXVcn1nVBxeHMXTN/5HZvjrthVZZA4aOOZ
	pYQd8TqJGRR7LT+Hc2Eynvk9983mU1oWvYKKbwZO5JTQXjO1tf2SZFTSSpzgoDPXph+IgIQAj0y
	doQWfyVUBONsBwmNnebe8uFMdhIuUVmfSMQnEM+/mKkg+aJtbNOeXVOaqGzyBNLcmPzrvubzJ9H
	+PRnGEGc/OkCwtV2uXYQA142locn7NcnuzEHL2aPlroOuJ9atWADNGVTNQMwupF+kDOVVoGA7XH
	JiwjbcjO1t2QMrMJh1C7g/CuDwqaqeKzdWBfmw5FLmUtUFw6nvIzhyu5qfWYMTMt2/oANnUTJMa
	0hh1/TgQjcIm/X7H/ZOvRVGlLPXVhlFLOQnHWc6UBUF5d6plrisRETUzWQuWJT1ayMtid368r0E
	kDq7KXNGL+81uifezAP9IgEInIMI5Xwflw7kcIE4eJsIYIwPo6VoVqNyf2q2I/ZyLihb2MhhpW/
	UOc0LVkN+UFBNXUp5HlBVD3NYs5KHjqgIFRlDj3KcVIhEBQ+L6u94sr1ZetsUcM/QVLPKTjjkrp
	zLH70Lmv0
X-Received: by 2002:a05:6000:40cc:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-49583b0bb95mr7229716f8f.38.1794217320053;
        Mon, 09 Nov 2026 01:42:00 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:59 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 09 Nov 2026 13:41:50 +0400
Subject: [PATCH 3/3] power: supply: samsung-sdi-battery: Set the charging
 temperature range
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
Message-Id: <20261109-battery-charge-temp-range-v1-3-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
In-Reply-To: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153; i=alchark@flipper.net;
 h=from:subject:message-id; bh=V8yoLBrj8mD8VVaKSjnQMeP0OJ8ZemjP5irT6VMLt1s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBr/fPfb15KlzZO16yduUD768jeXhcjnVj5DpgRJL
 hMNxScvOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqpy2MDDdCOaqtnSM+/X/1XYypuTEjYN7OXY+Zjot2zZ7+qJ7j/QmGvxJuK24
 sPvOnbdXWZyGLJvPtfDJ39661LZ3XriRvnCNpvY0BAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Give each battery a charging range equal to its operating range, as the
firmware parsing does when charge-temp-range-celsius is absent, since
these static descriptions skip that parsing: keep their behaviour
unchanged.

Leave any correction of these limits to a separate change, but note
that they follow the charge-block thresholds of the matching vendor
kernels, which count in tenths of a degree: the -50C and -30C lower
limits look like a unit slip in the original import, as -50 there
means -5C.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/samsung-sdi-battery.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/power/supply/samsung-sdi-battery.c b/drivers/power/supply/samsung-sdi-battery.c
index 33565002ee27..da283735df3b 100644
--- a/drivers/power/supply/samsung-sdi-battery.c
+++ b/drivers/power/supply/samsung-sdi-battery.c
@@ -659,6 +659,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -50,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -703,6 +705,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 47,
+			.temp_charge_min = -30,
+			.temp_charge_max = 47,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -747,6 +751,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 43,
 			.temp_max = 49,
+			.temp_charge_min = -50,
+			.temp_charge_max = 49,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -790,6 +796,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -50,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -835,6 +843,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -5,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -879,6 +889,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -5,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */

-- 
2.56.0

