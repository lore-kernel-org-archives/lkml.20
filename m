Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462967;
	b=tT+OCSiNF/QZNcsak6AWdUhKVeAOVLecY+bjs6VrtjmTCULSTSvvtPRF5k75CG5ia54Q
	 2Gty9CV7obq9tyjdvdfTQj1PvLOMUgeOlbfum9a/abXSo7R5YcyIxthxcEI0WGyobLwTY
	 YKgGwDK2QH4QAGVCrpUDyYlVxm/ZdwaRAZ2+y6/s4IUfTPLS6jNW4oAOEU/kfqf98W/l5
	 gmydxlpKV0tDG9JEMbg9blXzW9hXeM+yG/IhXhEJ4faoytmedvfyPIshz0L5lD6oWk6EC
	 IGn6ejwrEo3boUWRRx+xOMb2NZ1M1+90AKGZ3ih2+7EO0Ql6rf5JChJHMfI7yQjBFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
	b=UQ0Kq67Tdg+Hkge4GL7HqojVTWLGCEChn8bJ6ayDCMTae3YU454GMYRWU/3HV5Z+kTmy
	 oN4lIO+OWElZdMOumPWoj4inHEOBfJvzeYTi5UPiAblExfBEKI6m6gLlzcE4RdC3GSx+7
	 FNyd3k4v0jvf2m19YYH/46NcfRsg2eEhezqdvD1Ipd34WfuYpuPBGtqiR58LtvuFTqJPk
	 cKzj6jWAsQZXIOXBlVGpymcjN/qAvnloj/uVQquoYXhTqEzU91ly2sRxWaOPNIgHGGng9
	 VauPUXSZFxQEE7S75/mDphtU4/QszzRHMMGtEnv0hgL9OPcoqYBzm/mc8+rUN7X6wjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6EJCJLW;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C66606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6EJCJLW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1330216f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793462964; x=1794067764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
        b=E6EJCJLWCieZVwSGms7gp3lNxGNcvomp7Gvr5ZoemZetpmCg8vKLwAensr7LdUH8iZ
         4niuvuh2rEHmDU5dYPL2cS/2skmQiuV+42yeGkunwfwuBNnWtSipQ/H/MhHBc2lhnBYG
         cPWNn/BUq6A4lNMYxgSn9vBuAhk6C8cFvVoKVemR/Uqm/0nA0OCzRrSHjMoH3F6OLn5p
         V6qYUQnK95M9BA+uAYHHqxqo370fyc8t604Yck8l4vy+GrUd4dojXMxhEOpvJ4wiuNxO
         uB7LK+kdDjWw8a6eynUIUuBvzyzDMqK0A7teCB4rVIjEcWxDQvMXiuR84GZBaasCxDOI
         +AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793462964; x=1794067764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
        b=hxLee9TNzqFEeFLSNhV0Nvn1McRqZUn6HbbOkxEkFrmPaW+Yo7Mz8zQdx1s0J6v1Bb
         nXMHjFrvLqWh8MDSoZ6YFYe1ZNCrQr27Y9L2WKUO/30TZ4Dv4t8k2WhPJxzU/k8jvjs2
         6n2VKdge5cXd3sRt9urJF1MQey8Xdsl1Vn7qSEpu8ZUnMTjJsH5sYxCR+XnfbHwGH6Z5
         7eThKNkrzqEPsPWLz5Nd0HHts+Iwgk2XtIiuOpDyIYa/C+Zbq/y8FPLcGKSJGk6KJkb1
         Cu+16fb31tat6Ql0gYooGYwMIrBNzj+t5UDPKAXtNdt8UZoC2OtEEuB08SYlZpZMbmEM
         LLgQ==
X-Forwarded-Encrypted: i=1; AKwUvBykWzuZZ71BQcdB0n+pEdBTXJ0JwgeU1z7kjOllPJFM1UvdbiIg8Rh7oVYiTeBWVFe5RMPf5Uc85PXI9x0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyb+EvHwhgL4dQ/OjcaoRSJCHf96UCL/1O5ZP/yop6L+VCEN4R
	85dRzRcWKKuBDm9L25XERStyMjlk/a/PpyWq8ClwPMWHECdPal8rx6k71dW4WKqi
X-Gm-Gg: AYBFou1rwUht8SUB/ktuJxY7ETIe8/OxPRXaz0AiOFClvdd3S4bXkuGy0mtEmE2v90s
	kOO7X2yeTb6ruijpSCnVCZEb8OtcBxJOPk47xtEO7nQX/VN2t+kRTvp+DuyLK88tiSmYafLV8Vp
	Z5vro4nUgT94JP9H3xbQwmiOwEk/oRGTVlfOaE/DR2Q6ruccT61uGlONXXBizB6M0z1ErAhwFPp
	yaohWvE4uRMaNPCpZQnfJK9j82UXP6l6sWGZ9rZLFV+wyW3Wq2cYQ0oefzrQV1XJtacKLhQ60bK
	vpzKEhouiCysyDUHgIwzPJ0ni5l6OSGJnNOGVnaJVHaLRGDDexFJfoBRpheGsmdTxF8uqDHoApr
	t6fI8iYtQ6Bkkey1vE1HmeR8+7Oc6VeYMGObhj2/3gBAvEl9yPdmUO+x3AC0CdPna4nyksCRu3q
	VEuO9vUBIZ8LTdzIcdSiYPYnNKK6qnCRKRrC0NQp5s+XObVkws5BmQlIWcOaciGmxeYxUbRBjzq
	lreLVE2E5iG3/3ZczfZrcLZhg2doaoOn4cLaLU24H/3Uj5I6iR5fZjPvhFFj71NHy0g0Wz1u30g
	xR6Xgb+tu+fFCQ/uF5TODIcpGBNyS18A/T68X2rWsP8So4UcvfrsKQ==
X-Received: by 2002:a05:600c:310e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ac1709ae70mr125197655e9.15.1793462964034;
        Sat, 31 Oct 2026 09:09:24 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm110103945e9.5.2026.10.31.09.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:09:23 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: octeon: remove unused cvmx_pko_get_base_queue_per_core() stub
Date: Sat, 31 Oct 2026 16:09:02 +0000
Message-ID: <20261031160902.2540710-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cvmx_pko_get_base_queue_per_core() is not used by the driver, so its
stub for COMPILE_TEST builds is never called. Remove it.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e2d10..ac7a98093398d 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1323,11 +1323,6 @@ static inline void cvmx_pko_disable(void)
 static inline void cvmx_pko_shutdown(void)
 { }
 
-static inline int cvmx_pko_get_base_queue_per_core(int port, int core)
-{
-	return port;
-}
-
 static inline int cvmx_pko_get_base_queue(int port)
 {
 	return port;
-- 
2.43.0

