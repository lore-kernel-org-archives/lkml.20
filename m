Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499784;
	b=ArwymTULZtzeYtgKMShkK7EaetvFQWPS8YbmT7dzJEYbEMDl57THJZDwxoO3Qb/V1sSM
	 2J6hgWYuKX3UAsHCV0eTuzRu/lzRe4Xm7nvVVegFbz4AVIoyuuW7TkS3039vbncOLJ0Cx
	 sk6wbTcG4ehuShJGvcRmZxDVcdt+vTfOVXpVqTJyuF1Z4SGKWcMsfGcbtrT0dWh8/arzc
	 Lcsiw58OYvxFslCnvtZnWuY0trMK7gaLQ9l30C9b3DzwkBq2pmuYDtq6jSMlxCP/H4nAu
	 gSFuGg8QoprlWsUX/A2FKO0k1Ai402ahPfU8eauj7cGcP8PGZberRTggKa4YhQ8WvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
	b=U2Mn+gI9pINZ2/YJugwemqivHSse/XyEfPe51g06bdi8mXtub+jyJC8HBRvMuj0jrGnn
	 Im/51YAAw+ZmqyoDmii9ZyKQJqs3jiNvJ5ZXz2WZ4/ClHouwPC3lqy/byeGCVjacW3Sgy
	 NIWWPYVXT274rq00jad+sl6pZsFu/CnH4fhmWAP1drw6LiWPeIJhDfP7W/y6WkeGuAJ7G
	 aSH3hb9tiF3CW1zXwp5fMsdggpN+FcGipNxt2GgzBKdr3rnfHJPYVGfA2QqSdFgzalqPc
	 zhEakUmeuJ8sb4CYVF2+iZGVuQonQvQ1D8B69YXaesAYyxz/TQPz0OP2dak1b4OF8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqVc6QXz;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D5606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710D5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqVc6QXz
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533797e72e8so28449831cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499783; x=1795104583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
        b=kqVc6QXzgemIPXmf3sUGyXwfEEKVcTxQIwTKzWLQCzXoQanQat8M4/5MUIoYRVgeCp
         SbK+q44FWJizK1E0AgDm1bLJCUrVbOWnOC/HQLOGYINAMRVbRuoKwozbzqTpI3E7+WFu
         AwkRdA1FXlVbUApBcg7Ori72R9hDGXqda9GptKaZCsi1wawpT+DlfniFYlWc5+qZkGkB
         WyQKBIl+k0TF950olx4z2A2uRAjFo+OIiZ2WoM8oDMdGhDp5HHLHris3UdbjuCFYNY5f
         +uFVyeIqTf0hNu+BmeCH10wbxB4B5WBsjxgS4votG+EaBuQjE2nKGxTcWCSy6W1BPyoX
         SpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499783; x=1795104583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
        b=b3ei6pTKJvnUqOiYi5DfpDOTZGdkK2puPf+f5PUf5MgjPjE5UTCP7g2MeSDJuVsP3C
         AFXFwEEbeGJ+S+tpb9kw1dEUU0QG1pYjPbm/cdA4s3/MvsbgHTa/Z9wuv3DsHt29ocGe
         WcRv965m6yhH/0AKFY9gxPErbaiY6982ddNjJO9/+cm9q+X4EPhhRKyhzJAsdDUSmFfh
         4VwT9t1OD9xk/HhsHZMkfKcA1qIOHkBfqylX9k/VpVzaEjLRZQxOWrpn0cuftT9OfKR2
         N+RsuSHOix+Llqhy6tJMJ/7Zg5Vm04Xk5HI4muAG58pbSRzdpSH4jaVBuH1yLCFCmoxU
         1fmA==
X-Forwarded-Encrypted: i=1; AL+hErEcwPC0andQ9zri+n9vjiPjQsvfq5XqJ7dhwqohlHXK9QWolXzSNQgWIrRK87w9mbBvTySz1z/VaRBQNZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ls77btvSqKGbSjS/hv4KJRErSg42C2NkPTr8ZSGGGqV+rLrBe
	IXHYigub6PhPWmGvyL04PG8SCNm9e3QbCb2IO3WdBFzeXTgqiBuTtK2R
X-Gm-Gg: AYBFou3mCUEPAi6t6w5fK9454GBbQM8zcxJOh4huXnBT0XYk93M/OojvU93OZ2abKUP
	zwIaMI0WBZmAiIc9ra3nc7ZaLj8FI1gYHsqpQA95onnmp4c4U1Pwg8q5Ar9WpAF791u1GVjzIsV
	xDFn2zwGUY/G16nMIdJsqsfMJiILV6wDGWBwreRKLPu+aeEnDZWb8xiPdeUaf2ZOkN0pNcqPdLn
	ovGF6Wsum9gIWsPVzqgm760MUattGtxxkFN1/TgRU8/QWJr4J316TXX4wEVM8uFbAlgUZHTu8ly
	3wkv0npEJIrMMU/3fUzqL/HUjXlIkzsWjmoKUWuxjRqFAiez77ps14uMacFVtKegSMXG5iuWO9H
	zow2UAmHkrfY+8S5yRJDCBJbZTgk+IJ5BvDODGxbAdKGEtNj0R7ulDFeeH3ZUqBZm9CSDauXr6S
	q1WpP2byRgXbC4lTE+BqxpIiuUudZCySQlladjBBgLzLQ5NemCM2SqSTu2xEm7i/Uvq2b+1a0B4
	aTtjvNoKipUJc0RwkiLRDJ2nP3ePwm3skdOLugVSMrXAvOzHyxvd80TtaEB5uy+fcrr8ZkNoBYF
	mS7w2dmIV5eHCoUnjcGKB+ZmwsPktIo17MFQxw+1UngLI3Gn34aDXRfxPebl4gBYHXfr7aIM6yt
	mDcAkofcC4RzD1yGdo8WoyOUaXS+tyzcY+0Wd8eEgtF5PIArnzyWL1pnR8aIonw2OTExkl3FVd1
	J+rE7hHJoPO0DR/Pgw3d/obTjpC7969icu4mmRDJcA2VqQBqDIdgUKEqCy6Pl9nlatTH1w75uzN
	ABOzKMpd5iZKXBken3DVsELCvXhDOnWnHzbi8LFxqvzu5VK+QtpKUuNy0R61SJ/bw==
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr1051411085a.57.1794499783220;
        Thu, 12 Nov 2026 08:09:43 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:81cc:bb20:fc5:ca2a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7d2b86sm760012185a.33.2026.11.12.08.09.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:09:42 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Don't overwrite the initial mode with the boot readback
Date: Thu, 12 Nov 2026 11:09:42 -0500
Message-ID: <20261112160942.27909-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

rpmh_regulator_init_vreg() registers the regulator, and
set_machine_constraints() applies regulator-initial-mode (or the mode
derived from regulator-system-load) through ->set_mode(), caching it in
vreg->mode. Probe then calls rpmh_regulator_determine_initial_mode()
unconditionally, which for an enabled regulator overwrites vreg->mode
with the RPMh boot readback (mapping a raw mode of 0 to the lowest
supported mode).

Skip rpmh_regulator_determine_initial_mode() when registration has
already set vreg->mode. Leaving vreg->bypassed clear also matches the
non-bypass mode request that ->set_mode() just sent.

Fixes: 09d99ff7fc3c ("regulator: qcom-rpmh: readback voltage/bypass/mode set during bootup")
Cc: stable@vger.kernel.org
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 08e39499be86..da4764ffa632 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1961,6 +1961,10 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
+		/* Keep a mode already applied by set_machine_constraints() */
+		if (vreg->mode != REGULATOR_MODE_INVALID)
+			continue;
+
 		ret = rpmh_regulator_determine_initial_mode(vreg);
 		if (ret < 0)
 			dev_err(dev, "failed to read initial mode for %s\n",

base-commit: a2a6f6b0b394eda55bd3483ecafbdc8228819a98
-- 
2.56.0

