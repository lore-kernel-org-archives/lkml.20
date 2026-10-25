Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950029;
	b=shk06xtZXQcOMsfBnaUgw8/nAqXp0AeEfQcA+RCi/4/8G5Bsqr4lM6d+tmbJME8ePz/Q
	 l+Poy/eEIp9HICjHrppw15an8jJ3iyHv39ALKtQDtpq8wee9BtNx1huNWpsRwyJJ/4suF
	 wy0Mj347anYL2FPXj+vUE84+JeFYook01McvLrh0V/jzUdE7iWOQgxVyMFrwHSiDlQZQa
	 Az5SKKaEYn3+Yco7foseRg3EBwkkMnhkANADRjgC0+qr2MHw2x0rFLm9wpkcUCKVoxV4y
	 e1YhMIxjIUaSp6p10oozJL77w4qyykBbwYqgMrvGKCPhrC/FY71BRsVnPNMMSr2cSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
	b=zBLd5Sgh00wCgEmaErAwFlXMGIUlH0744FKOI9ApGbCQVKI8FQJtgUtm7+J7Pm0/M2P+
	 uZ3fWpVlzOx431/pg8NVtcS5Nk+12IeEfn6PY35X8caK5oHuHrpvUGRPIo93qIui9Hlan
	 5rnMQIhzggXytCIC3z0iz0Ob0SlY0nZ0fJ/WYidWRULxOxl7sJ2SU9puGRFh3ppCI65vH
	 UUCGP4IQP/YMZc5QFQmlGhwWTfS+vqk3DD0pp9VpxjTJnAFS3B3Zz5Uec7B7xV/Sex1gF
	 t3mDqyTajisel8oWBpfESrIQerL8Xohj+EW40cgyRVzU4g7N4Zu1GkyEfOeant8upuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF99606A335
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF99606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so2036285e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950028; x=1793554828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=kThEKxFUrqmeaZ5Mk6vciR8rP2LVT4S5jo7RRtIro4YklfgsI06MKzt6CM5C698Gup
         yaBf7w5cgU7nNd3L0xe4jGsl2RTN8n4bzx+QqO5uqg1MpCFAkeU73/5kisEDGP2CRoSg
         AViw4qdfFio6tUcGYQXvctYxEvmhiLMVhFA5HulzHBjErF3h5Bt82MXGoJIe1OzBvgIl
         D38QrZk1dchWoPYT7olZLi5gEg0/RvaNnXeBT6K2mPuD5QBfHf7js/l0jUpSTMDGTC8i
         mqtX++20uNhM14LdVr5Vpqp+jrAHLVf8Tu5N97E65WrdA9PxQZ9lZgE/salRpmwtPnI2
         uSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950028; x=1793554828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=122YxZFOqU+FbldJ0kYSd8AShgzuhPhXHjcz8MjvVrtmeKFmpSzquDMcQi37dKTWym
         9aIglQc+iHoQedhTzlY94bpmWGvSLTpTuq4szbRtQz+/R7KbTEkGBwga0qRckT/eoP1k
         N+3X4+pf30OHtLLC8J9PLuN7vR9BK+fX+rdfCZ4epmzNOnGBi81RJ5wtW0R/vek/b0Y7
         s9IvukuSYGp3szzUwThb89o9ThgGieqYm3137C9ufmrTmgbr+mhaK32iQZ8/5tzre9iW
         0I47GgbUZ1njfc6tiAvQa1bQ9LEEBpkbKBff4XsLW4fy/dR4bayZRBNFHjBPV6CcC3qv
         HYNg==
X-Forwarded-Encrypted: i=1; AKwUvBwpSuMJWs7SF/PIVlkg0TUQ8H81DtjoidPrDmPWwJUTC9EPqkOMuWRMqS+YWWC82nK36iHqxdSmadW/qbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1IDDbU+dj0pjazSNFyIj3YskJ2kMaOdaVZ176Fo16TLrWFsmj
	FaUq3l5EcBHWEc4Mnbu4bZLLm2RoLzD8T8zypATXfoHKSZ1VfYDDOCWlc4/K6HA12Jo=
X-Gm-Gg: AYBFou0Dpx+Tqbg+i4KaYzBE1ahHMZrwTG7OtB2xxYT83bLw9XdXrT6AJCeLXG0IxHt
	v5Vaw4+LV673ZXqadMN2tfTITJcQyUy/C5IvJj0M6fclnrUqIA9HMSoS4Kyacqq18N2GaJjWZzo
	wOOPgU3u/OOX+qZROViWlaYZyS3DrZMlBcC4Aaek4sSNPcPl0csPA35GC9RpPBkB1HjQaySbZPf
	LOzMQQFFGKQrESWoFfjMYf/JBufKd6us8zLcnp/ZReB8grxgwpXbmbCTzQiSrJZpIgPJf7vUeu2
	NT7r4W4DvqBfc7RlSs5ei17LmG78opGolg6CBwXyqOuhASYY1gQ5Khktv8NODA9CbHA/W1CCAeR
	AEOQizRJdLSe+fzMlUIyfC9pOH39ixxMK7EvPsSIXWL52zpSK9aByfj8Y8xLxSTD5QJfrgXujiH
	a2ncuY3D5tXAi3c3E4QbPLiFybJCHll2XlWyOeWfugYFfe4eorJafl0UBzf5yr0r6yjWUrU4pel
	U5q3cDdg1RJ9PcPzwD+lT867PB4NaskCRlKlQV1MuVK1zqg0XLVZ0TWUz84aE+s0xg7c9OKJ9Ed
	muvI4yilRB4jbJpWsNkrG6VnerkWHCJNRLIF7I3PviScfs0Dq+N6LtB1Jh8MpDJKF6ac1ryMkpP
	hU3cVJv0RIEniLJdmskLoUw==
X-Received: by 2002:a05:6122:50a:b0:5ea:be1b:1b66 with SMTP id 71dfb90a1353d-5ec22ecf5f6mr1525623e0c.0.1792950028135;
        Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:27 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 6/9] kho: support read-only KHO mode in KHO core
Date: Sun, 25 Oct 2026 13:40:13 -0400
Message-ID: <20261025174017.3870481-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

When booted with 'kho_ro=<pa>', skip standard KHO bootmem and FDT
ingestion in kho_populate() before early_param parsing runs, disable
standard KHO in kho_memory_init() once early parameters are parsed, and
use kho_ro_get_fdt() in kho_retrieve_subtree().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c        | 8 ++++++++
 kernel/liveupdate/kexec_handover_common.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 67efbdd39439..cc56caeecba7 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1819,6 +1819,11 @@ void __init kho_memory_init_early(void)
 
 void __init kho_memory_init(void)
 {
+	if (kho_is_ro()) {
+		kho_enable = false;
+		return;
+	}
+
 	if (is_kdump_kernel()) {
 		kho_enable = false;
 		pr_info("disabled in the kdump kernel\n");
@@ -1841,6 +1846,9 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	bool populated = false;
 	int err;
 
+	if (kho_ro_cmdline_enabled())
+		return;
+
 	/* Validate the input FDT */
 	fdt = early_memremap(fdt_phys, fdt_len);
 	if (!fdt) {
diff --git a/kernel/liveupdate/kexec_handover_common.c b/kernel/liveupdate/kexec_handover_common.c
index dc25cb4c08af..a9bc8d45d3ba 100644
--- a/kernel/liveupdate/kexec_handover_common.c
+++ b/kernel/liveupdate/kexec_handover_common.c
@@ -263,7 +263,7 @@ phys_addr_t __init kho_get_mem_map_phys(const void *fdt)
  */
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size)
 {
-	const void *fdt = kho_get_fdt();
+	const void *fdt = kho_is_ro() ? kho_ro_get_fdt() : kho_get_fdt();
 	const u64 *val;
 	int offset, len;
 
-- 
2.56.0.307.g5fe7bd680c-goog

