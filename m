Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112989;
	b=0WXMHxiMJilR9aObdOPrQlkAYl7gmgrd8ikOP3XJk6+VaewQgGnuGCkJXA/0hPAeahpy
	 UphF6UO2q3YehGrDiBtFDCo69f7RmbEjqZnVHiI3QqJrIS1OgDPWath1Spr0v7kF6wSPf
	 6hqUc4oanEfwaOKVlCEWmgVKIDrk7s36L1hrYz+5RHKl15LNp894Vv6Ms72DWt3+cT9cR
	 cA5d6Zeqstx3BJNPPlVGgX3/oDRbLM+HatgDu4F5l0D8SKFOBLB/Mu7u7W2FrbGOlcwZk
	 eWMlxelvy6jS2QlAA7PhWzO3Xr5uSMTuIyIke9bRxUTQSZAmgh/9bMZL3f2Hyl/sfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
	b=iSct9WaMm7hoHpvxaapoYjEE1tz5CJ52+zDsCJGkSnGCP7fOP1Z/JxYQ68t6xnQy8t9N
	 MFXFMUL6OclfPyHZmTqTwI89adZT8sAisBIdtxtDpL9K8yTwVojWzyk0CinlYzWmg/PoW
	 lpZ9A1QDN0cH4Upa0O+ROFEZPQQxWqx46UmygoNhMQ+ECf0zew2Wt8dJlVuf+VeL3PGIb
	 Duh8PF3dW6bcwW+q6nsM9PYk1XjGObCs2b2RGy80X3RMqU3mcrupCRGiTQODe5aAzciV6
	 GdRR38XLv0/0+Vs77eqE9/wqtOzTnvaT/VZEsEaPoRx7QhxwQGchg5WpX4hp08fHsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UM57lP80;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ACD606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34ACD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UM57lP80
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso23924715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112982; x=1793717782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
        b=UM57lP80d4gb8qXrdLHTEPswTHHCHFI5n/Y8vUaHufczrHLUtecwLvU+LNJ4GsmgAI
         ZzLVXL+UV6PHTv4vQJO7OCmJpkp6uhj1DUucsH6hkzzpp6gWzg4jQIjzFNVJ9mk/DNNw
         E2F5Z8UMem+Ok2qC94M0CkWVZRg/S3osSUfgKgetVmzKfV5biastY6cI/zjQ2JdBD3bL
         mWtzV0U++z0oOLgacP3uKn2+a2gT6jDoSceCX98Jxkhu2XiF/nyf7CuPwLXlX76k3Zl4
         xnT06/wlFXgH7lGdpnwFrdJ7P7YCM/hOzyxQbmzp0bjaCzK+eQsKIU66a7e95d+A+to+
         7hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112982; x=1793717782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qOnNQBF6wxV5ukDiaPEeWN9daX9NrcrIGNB5KVrHlo=;
        b=JzlgztAKjMSsshl0TD9UrB6VUABqyKbQ9MjyWba2stxVXOi3Dgh33t7SzplYk2hQW3
         +VsEtnNOfAmSlMi6ea8S3iPV1DR+DJz6CA+qXCa8aT6BTmZXZsSBay4MPyGqgBCvFwYv
         vCVgUIiUKsM6NZJCDhkN7m7eDr27gSVDuPkZIYt6BYVBxgJP2miCGJZ8lrZYvsGS1MnO
         OqPl/BK+3RmZf4k1wSLzBVxpYEqaDPQu9vuXybYI3hrHCdLjyWjha0zLSQAasKvaFZZT
         DDokPCHd4kXGucOW8AHENTpVeSTSohgLlJodj23A2jR6MQDvFRTwEd5AP+ndYJZY0fhK
         +tRA==
X-Forwarded-Encrypted: i=1; AKwUvBwMPsenjiRDg10AiwfEwaW4rj53KEgJ4dTzbqJiRCQGrsrD4tN0/z+xiTuGrfQpUOUG/5e0JEcB701YtQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdPhi88khp3F2PL4PAaxoupkDvuKG++Q2+sCwk/Pp6NUNgCrK+
	a05GVWBtaZSMvgL08Q8PI/f1NWug7QAB9+csrqv92MT/G5ARNXSAP2e9KzLVf1UWFLc=
X-Gm-Gg: AYBFou19IFCCB+8nRWhGnVUWes6Jdjpa8z5nQO3FZVxTUV8qDbmRFDZVAN1LCJIKBOv
	Hx3w9b/J4t30KabBTTsdW30AVJ5xSCmWHdzJIu7dg3o/nGItV6wfYiskG2qr/IljjPKWRchIdnF
	FX3um9ndzqhioniWEznQ/qfLLRNM4FdQk1J5n8yGwbTs6KD0AZ4PMLKel5Dm9Pz8H4NeO9Ct8Ej
	JkYg2jMK/kXhjW/yGWr1HN1FtYZudQ6rJ8ZBBUALCl/15z4f0SRkRRW9hWMQr8AcELsh8tGQOge
	h0J5Rji/KJfs5iBxzAl77xUZgIucszLGz0EMxwp7XqoVsId+kbDGf0KFKeb8rmU88kcMALbBJpg
	vqd0RqOGf008pu5Ii1z+WwAwLuST4/Qz+POa6s8wH7tPgb0qiXNExCCjpYztYkX28Vaa37Jr8FN
	9J1KsIIsmKCEa5lufm/7AEwxH9g/b6/UFUSCxbPN3i+a7a+If0SJEotSZg3S2+Et39ICPNRLwdC
	RPYO9Q7xHSDQ947h+FU9WUN3XqagP3pno7VefHH0xCML4/48w0kKElgeOs=
X-Received: by 2002:a05:600c:4e87:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4a35acb13d1mr200149405e9.21.1793112982558;
        Tue, 27 Oct 2026 07:56:22 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:54 +0000
Subject: [PATCH 8/9] coresight: etm3x: Don't ignore
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-8-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
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

