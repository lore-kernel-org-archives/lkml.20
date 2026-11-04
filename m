Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806626;
	b=T2yYKRYiyspQiR/3sieTn02fE72pyzCKmI6br/rp3ElMqEDSC6QhGc64wAfBXhAIiAXl
	 beJGZvtZlTR4+LmkQpRRiHSpSOE+1fOukvZaOTc7aUw24lfKrcieJghQyL4u0u5txMuob
	 pmydNrWmoic+QYPv2h8T7Ye+vefbnCVX5uIjewerwFdPqn/JRfQeyiDM9sdg9TDtKleRO
	 ja3jKY4nM4rG688KQN0GHz07OoGEF8a0JwbadNvpQsVI/COKft50wHNkin6iW1VlDERTg
	 6QNwLIf97t6oU/8+BtE0Z+x3VAejDCaI9n08VrqyEgSmNraFvQ3Td6KKw1JF5ybXxkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
	b=ruJI9ElSzlyHgWbFLn+PR4RngzUWL370ev/j9k3f/B30L4HvlGCZhDaxSkxikia8hWXk
	 yVvTlkIrM3fmvfvB+UILrT8IV769l7xjcd5gq1WleDZ4F5w582MrEVpcjgM6XPGTkjLtf
	 8d5N2GGxb6G1lQjt30o76ECDn8cma9CicVT5Ym0H26mw9Cp/RNZUdAjE2Jm8YgGPH10h5
	 NBGl3yvM+TubOxF0dVkOLVzCNXsfTTidivFo077xnhXdup52W5ZKDvMEYeBG4dCbWObab
	 2O+x23bFpdRZ96aVGY6VbPPidxeHW7gM7Zpk0ecrGb4a1cF5xlu1oIexAkgJ2wCQiDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FYwYWK2E;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF1606EEB8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDF1606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FYwYWK2E
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8374985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806623; x=1794411423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
        b=FYwYWK2EQdU6g+L2m7QxHnax2tBQzNi1hD82GlIT+cr/SOHN8fbNvkzo/rC5ewalbj
         6F8TBXzItWM1VTyAr0bQEqGzDol9xNog/knq+CJcXt9skQqycf7V4+eYDJbiihiKMBbo
         uUNm7qCP9bJaggl4ORojoqaCBTw5CGvDOH0AjbPZy07WgqdUGhGKC8pQFTCb53gBSt54
         Cugz/4caPOatIs1r6Gbb3Jn1xtKGmK4ayrRepIj9LbK0pm+nZ8R0bAPJCFW63C2rU1XW
         r0tP7EegC0wPvXBBBi5bvxG1ggJ/d5K4OmpWeCYfzlM55F1ALzp647DvyaRV3bmpg/GF
         REmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806623; x=1794411423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
        b=MAdZRor+wyg8FpEiuLdxPbZY62jJ6vehQVkcD2bUpKqC4ZwuELarHlPL9a76zJJ7HO
         dK1mWotcVW5NYMTsRD7KvUJ8B548hcT53Rus7ZQZA8pDornSb6iclRrnzwhOHWKbaPYk
         wfWbr/9GFMWnar6yRWjiVK2e2vXUB02WW8e7i1M/K9FEoUZiC1lHcoPaW8MLei0MqAen
         CiI5uoK7nj960IgPzVRH+aVf2/DhMOOJ1hEZqAoOt2gsBOjjXGf/ML3eV2g1lxzIPqER
         zhlacFOS/msjNBRz0R49nLcN2wWNLx/SAcnBhBi3Cm6vfOsIDtIFWa2ZiAOHf4/UHgt3
         HoHA==
X-Forwarded-Encrypted: i=1; AKwUvByqafu7yYszt0rUbPjr4qqNcF/wy76HOqJftatHYmd1k6x5o3VaGrRsJMlSZDts9x0UqPaejDefgXfq/CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TtNxrGDZBEFNXJtG1ubScyn40IGGjzgkOWUq9Mf4lwBJ2fiY/
	4xXEdZUSAWyJNjo4KECbuk1km1ggTZzkUfc7/6OgZySnrkOhRGW20cvVqKDPWtOD+3HLnSZ+hTS
	oXnUPF24=
X-Gm-Gg: AYBFou04bAmMlGIH3tyLjg7pNKgFhOgvB4HPhPmkZuNZ2mtTFMAW9GsUCE7ooPFET81
	xn9PusnMBFV7/lOpc4pwtT7nJvBrhLk61AuWICIm+iSSMS/ncCO+J/mOx7YtLL9n1QJUHeHmzNf
	mhnCGD9tdOCbeUAeQumJDSmuMv9I4w3oV+qeOSMuEbjTzV/lR8TQ8Uvt4yGg/r49AWT3DgoTPZV
	8X2VtLTYLUCCzyNvgQzMVvrvzo6rVmY02aoWIr0GGnsk430gYFMAt1PbgtWugj3qlv2mW/jCQpz
	Ti5SYzLwOwm3pz9UFPCYq2wnZ6hjVRpcqsQpdjNpInZkNW1s2bZGlncVfxMCXWSC0WkWr1+Jrx2
	6BOat2Z8IUA+lWsjFAjaqwThP6Ouc+lrPRVqcmFWigtCBqDe+JTXTGEwu3x4yVHGrX1yO6vCTEn
	QTFKrGEuosJkOyhR1cJnHunwJfthB+HNtQLcuU5kUj/HbWMwtT9TT0Kie5X+6q5iF2FjKHKGKVR
	35jfdCE5mjGyPYU+5TfRUXMoMj6JYW4yjP8WVA42vuHcoAMddLMnhf+JBrpGbLctakqGADOT+4g
	xYE+WDHBV00o7g2iTmJ3E4dw5ieTf9Fv
X-Received: by 2002:a05:600c:4687:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4ac16fa4dadmr359442425e9.7.1793806623610;
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:39 +0000
Subject: [PATCH v2 8/9] coresight: etm3x: Don't ignore
 etm_parse_event_config() errors
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-8-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

etm_parse_event_config() can fail, for example if an invalid timestamp
level is requested, but etm_enable_perf() ignores the error and enables
the tracer anyway. Roll back to disabled mode and return the error
instead, like etm4_enable_perf() does.

Fixes: 882d5e112491 ("coresight: etm3x: implementing perf_enable/disable() API")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-bc35b336-f835-40fa-89d9-7a580efc3b53
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index b670a324bb41..db8413522d72 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -487,7 +487,11 @@ static int etm_enable_perf(struct coresight_device *csdev,
 		return -EBUSY;
 
 	/* Configure the tracer based on the session's specifics */
-	etm_parse_event_config(drvdata, event);
+	ret = etm_parse_event_config(drvdata, event);
+	if (ret) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 	drvdata->traceid = path->trace_id;
 
 	/* And enable it */

-- 
2.43.0

