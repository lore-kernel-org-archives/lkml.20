Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A36418346
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006373; cv=none; b=uJqb6eRF/AV/p1MEUjnf3o+yrnaoqMKo/tfcAS3JsgsNXWBYoD5towcJWr/AIfCd0qYBC/Y07Hndh+ufvki0dcZo96bvDNxG0TYDjtp3fRsGTqYSKl/r/3KOACeoCXfw50QWy0RpOsGWt0QfzfcTs2VULN1s/jWQNEjw5aGEcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006373; c=relaxed/simple;
	bh=CHwRqVxsnHjeGl/EzDs6jplQ1XElmScr9zvEPr3Dl1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aay4ipZWM65re/T6caPGHz5S6NC32LhnZvYoR3ifZNS8/QzeEsmtR+AOo/SovqP0thKTb6yjgvsJsYeRqADKVFzbMSdaueNiVIwqRyBq6WlpXAolOujwNQ+39+4trOb76fisH3ms1s7Ipmv0hlD6w6yd/ajKG7Ud6FZ0vs64U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILl0pySJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILl0pySJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso535972f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006369; x=1792611169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=ILl0pySJKBbi98wfZoE1sxM+70xPA5Cs9aj5bq+bjmglfOcFj9uT8f/FJOEr5+XdP2
         VByc1rE6xONhMI8+yeZiB9F2fU5Fw1UJbRH0S9wrpbukS6uwd3/ys+HL/0vupkoSazo7
         SAHmppH4LCdmzwPE/SkYWtf5LFKxsSyIYwRMKQE6xjV4cMa/AA1SzFUUqFodJzOQEr/4
         2T2CmzcgvYQhgoiIpDJHQWbujfaclGYi/CaMfeKUHk+hzzhO72B1qdQOEbhNytPsMdx0
         jsXYG1RP0pX8QCHr/qv/WOLpMSTHJNaQhfc2BneaS5tOKL0s1yDTxVNRzrY4xJeUdZ5P
         7MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006369; x=1792611169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=roSFibDbKg6uSpN7EmUE2pQ4TIKZSPxw/R3byyIpgEb3raq4R38iMgqxCDBYdq302y
         /S9dMUkGo0YTfJBX4sxt4dEKQS6LavpYIpIR+t4jkUHO1acrkaKxNU3UNil0Sqc+SwTJ
         /6j0zXVPEJIV1qGdGMnrJhi8wK2BPehiDlcThheLY8P+G199ECaxlgJsVZsd6kQOaZz2
         FiowlLOAN44csTi2rkAik9a7fo8lPYjk3RUxaezNqPbjMMtrC4yf2D7qFMNrHGNonaRX
         0eLQxOt5UK4G9nxQMu2fQ/BHRlJaf6Yt08Tr5cy6rCdpS8jm2mpb5nj83E33r4UEvtDi
         xx4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4/jb8K/LMwyU7HLPosOucFM/y58J5BTesQC4OMfeNaI7ICPd0Q6KrnYQf/9WaoVvIYCN49hFlSA/WvBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSJ0azmYBOSAUjRRGi6b2QTybK1tCH3j4MsoUZJvHpCFF+SOXv
	safoUHbNfPnd8UtDHcfzyn1uZDRSAFArTRe2jacs8BZRuClojhC3qlT6
X-Gm-Gg: AYBFou3FSTOzXSo6C39aQPWJwRW+TgHytRfgR95cuRAAp4BzCM+yAfyPRi+DpjYp+uC
	xzhByVvHhjPD8nFvVMzMllGdDvF+gR71WGl2Zi/kHpSEKi7CpHvoAv6tk70SXc0n8w15F3j7wVD
	vdf9B1LhMFypxtjwbON4uuMSvgWfJ7PwHbQ5BWrsyrhj4ild1HYkcS/xJZO7CYGccZgPoDW3XcM
	7fnBlwZbti30mRVCRXZ3w1UaA2Sli42eTe0UkBkH6UykVNtj2PUfbg0HS1DwI9YDUMq4g+LMSME
	JkGxqp0M3j2chV+Mh+KDD/mawVSVWTrlfi8y+woR/MhoT6evrtaUPtRxvkZtSHkUxssBr3UyiJN
	xEugQVjk9dUkWkSSVmNL4ThPGil0QCmFoa634cCPAHaHec2ZDLaVL/UzglfbzJpc5HJEl0lxnIK
	EKT1DGkWitSMHdUxfZokf0XhdMvoMNjj/HFkcWIY9xCNbtQA7hmk/v3L/1/jAcHZx6W5XwTtxi/
	Y2UywsSrnD1qEKMip+fBugSX34ZEBqy
X-Received: by 2002:a05:6000:298e:10b0:48b:5e2:52c7 with SMTP id ffacd0b85a97d-48dba77cf13mr25773200f8f.8.1792006368804;
        Wed, 14 Oct 2026 12:32:48 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm13151463f8f.23.2026.10.14.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:32:46 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Date: Wed, 14 Oct 2026 20:32:20 +0100
Message-ID: <20261014193220.38055-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set sun6i_rtc only once all clocks are registered, and unwind fully on
error.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..dd293e8324b8 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -231,6 +231,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
+	struct resource res;
 	u32 reg;
 
 	rtc = kzalloc_obj(*rtc);
@@ -267,9 +268,6 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
-	/* Yes, I know, this is ugly. */
-	sun6i_rtc = rtc;
-
 	of_property_read_string_index(node, "clock-output-names", 2,
 				      &iosc_name);
 
@@ -280,7 +278,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 								300000000);
 	if (IS_ERR(rtc->int_osc)) {
 		pr_crit("Couldn't register the internal oscillator\n");
-		goto err;
+		goto err_unmap;
 	}
 
 	parents[0] = clk_hw_get_name(rtc->int_osc);
@@ -309,7 +307,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 					  &rtc->lock);
 	if (IS_ERR(rtc->ext_losc)) {
 		pr_crit("Couldn't register the LOSC external gate\n");
-		goto err_register;
+		goto err_losc;
 	}
 
 	clk_data->num = 3;
@@ -317,12 +315,22 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	clk_data->hws[1] = __clk_get_hw(rtc->ext_losc);
 	clk_data->hws[2] = rtc->int_osc;
 	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+
+	/* Yes, I know, this is ugly. */
+	sun6i_rtc = rtc;
 	return;
 
+err_losc:
+	clk_unregister(rtc->losc);
 err_register:
 	clk_hw_unregister_fixed_rate(rtc->int_osc);
+err_unmap:
+	iounmap(rtc->base);
+	of_address_to_resource(node, 0, &res);
+	release_mem_region(res.start, resource_size(&res));
 err:
 	kfree(clk_data);
+	kfree(rtc);
 }
 
 static const struct sun6i_rtc_clk_data sun6i_a31_rtc_data = {
-- 
2.52.0

