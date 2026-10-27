Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112981;
	b=XoEtihlR9WO3+ClRmwmv280u5z2w8V6fcndK8F4L3wL5YO1CWL4gupGggbUTjR5QPJXW
	 QjDR75Hw5Rt8/eqmp5F05A3rdzYtKIbiOWeBQhdNzPAzTAN1FpTbmNipCQHg7ywU60Jca
	 S1sWc0cumYMIuhUf/oMtn/pR6tuut5kn4eilFH2EZxJrW2VRd3gqoVOlcRxUah8mCpGUh
	 ctUk38HTBZG0Iaw3fQ8NL9vlZA0aiK+jZhROjs0LbDTI8bbY7SeHhi7UlOrdMqEcgIV8A
	 R2356XO9gqCQ3sMAvkfwf/6bpwvw6AefXeqY4YG5YED11tGypF7qtx+1X9gpW+Nq/VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oEua/z5QWTBaePR8XlcCbxxSH7VJi4eImubtOg263dc=;
	b=4T659on7f8ILdQRSw0NZPHXhqRpB16zhyPqM66e9PqRKKDG771tTS6siP5VhqzEIcBX9
	 jrTI9Vo2LeSVmXmnfUWoEpK+ux9GHjxsvazM1/aaP1e7QI2dZ3JIXIkzXZAyMkXpT/pXB
	 i9VVC6jz8cqT2O2kRbspAzRYE1Zt0nnGT23/AwUc7SWhgulPSGud1WN53qKrUb+embLse
	 M7UtjQfWkYQaOsaQZpH0SnTfEjksNlXlfB/Q6OowSkl38CmWmnLsKRHaGigEzJ+9Uy3Zn
	 kzHd20GnvxitjDX20tiiuQyqxx+iVbk0WDZEI9UyJuYiCJG1bFmQFhhW6ahyxKscMNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kt5n0MDz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kt5n0MDz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so25481165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112979; x=1793717779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEua/z5QWTBaePR8XlcCbxxSH7VJi4eImubtOg263dc=;
        b=kt5n0MDzVTxh4H7BVzyli1iiZYyNybQ/j07vKmmgqEAxzJ13DJ2uwP5ZyJcEyfpYO6
         Pnu2cCJfD5HnsNYdWYSGdJVXCP0eOzNV/2lbdwEUJ+Mz9teFdtq8cwRWHCB7E1HIoLAF
         pUfwoWnlAAMSC++u2jG1PlLm+UUorwTkY5XFUSUqjGi3kqwMpP6mLh2aEMXKpUpnHZWy
         uHIKVblzjSEv1zBvS36yE8s4q5Op2eILjDgmZzP+DswMrW2po2hat+YlYNvRpR3kRM3g
         8DA8rkqi4XDgaPcHqyvXSadRhKIZlWi3eTI3TOk8aekuJcYgVOcFwjrWTD5/i3MmVp9l
         /gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112979; x=1793717779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEua/z5QWTBaePR8XlcCbxxSH7VJi4eImubtOg263dc=;
        b=OFvZxGKpU0Lg7XCQInZfgSkNuqhEGf6jDDT5wbHF9zkR4P9gdTvxILHXpLkIgNWf01
         V88vdKNKB6ZEtsVu2dNEsahBsmQG/khJh+p7Ku1/SSbDH6RN91COdhbYyaxSf+vjbz4T
         lQN66Y+irgZbCQkGQOHgxNjqPTU1S3HN3nBOasN3QCeiRxb97pSoTYImvNm7FQK6ccdW
         L8Fb03QSRPeWQxEyxuMpaoKB5p3+V3+Cr6s7ba2816gmr1AZIPvodomwpTYFeKzgxTwG
         Ti8V+wLH03KtNSjgnsFmF02s7uPs2VwROzMfEV7ZAVHKu1aM1JblZ02oOcjihjb7ZggD
         rwpw==
X-Forwarded-Encrypted: i=1; AKwUvBwxjpPEEdZnuz2k5QVRyP6poEAvfZDd1JWvS2DDVcpv7vjKEtfueAyXMk3nNyMCbymnF/Q9w7t9x8EjKBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVSdMNGRGvKKsMkdVKQkrEMEkDVCha4vEjwu59I3aJjFlEVmb5
	MemY1QAsiXfN5WG/STAq83cC7k7iQBBocU5fL89gLeM2ys0CKFvbj44P78uX1WxYmWE=
X-Gm-Gg: AYBFou09/WK2veuN8pA+E7Pc5XJW80QKEkdYt5ZgpWCi9eNLNBaM+8aaCF6O9rkyVMm
	clxEl4l4h35++gVLbSUmnRlCyPhNZpw+8YlAfmv33lY+NVRRqncPBufKi8kM0HWq/tHcWqQlIlm
	b6aPsmxinZvc/dlQn8cETpxbloQT6IkgzvSzucRLq7LoHa71HhDOUzNVLo3HPezp8hOywOsZBqm
	VICsMWsWYEuBS8bLn+AzJzhiOBl7Svc6ny1Wb+2sNrrWQVlQ/81T/YGn6XAZSBQBF5XbdYeWRcU
	uXcseTLNJpjE/wlb34zgf8FcvapUWVzqv01VQ99DnLqMaomUibWgMmj5fZJgLL5PUD0lgUrEb+E
	/6XRKtQiTPfN2B1/EqHrgaZhFv2d5kkO+zJ0lfx2vGc/2XHPVZUlPcxOq5A55qckMLScBRtNQ7v
	rIdWs7qleUFqVjsSShV3Vme5UtHOzZb6pZtY4iF3CVxKUqwDQcvHcQ+OC6/wpzAbWcVkgJgPjYw
	7hX50mQX7dvzY5MViQInhlYe/WbS4Sdzvlyrvecr1aVf6Mdl8tmQS1lIE3uiMcNjICB/By0awvq
	YKJF
X-Received: by 2002:a05:600c:3e86:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a35aca5f94mr195688655e9.23.1793112979110;
        Tue, 27 Oct 2026 07:56:19 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:50 +0000
Subject: [PATCH 4/9] coresight: etm-perf: Fix sink device reference leak in
 etm_setup_aux()
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-4-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

coresight_get_sink_by_id() returns the sink with a reference taken by
bus_find_device(), but etm_setup_aux() never drops it. The paths built
for each CPU take their own references on the sink, so drop the lookup
reference before returning on both the success and error paths.

Fixes: 226443925887 ("coresight: Use event attributes for sink selection")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-89fe1ee7-7e2f-4c78-a8e6-93a1a260015b
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 5261061e4dd4..6946058b5401 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -519,10 +519,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data->snk_config)
 		goto err;
 
+	if (user_sink)
+		put_device(&user_sink->dev);
 	mutex_unlock(&coresight_mutex);
 	return event_data;
 
 err:
+	if (user_sink)
+		put_device(&user_sink->dev);
 	mutex_unlock(&coresight_mutex);
 	etm_free_aux(event_data);
 	return NULL;

-- 
2.43.0

