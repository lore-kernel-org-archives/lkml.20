Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711242E428
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978462; cv=none; b=hzCMaqVhhVnItJOSEbqyYoPYJJrkVvTwRrXn6Je9683NutjNFBdVLOTfumnKXOa2eMGwYJjFfwxRpwPDZ9s0y0Okoxjcpf7pcIonSqtRlhTFaFoM/sCrBATJXv5u07ZuwoVoaBI3rIfe78WlQOqxQOPa7GcDuodkH2KnQWYWDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978462; c=relaxed/simple;
	bh=85+Cs9zYb8roYh0bxNfZfDi+ho4myyS5fVQBONCwrPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXO5ANRPPpAPHBgoYLrv2vGPwQxpUR/FaX+K5uMCM+ngtkWHKHzrB7Z6FGojB+RYrfZyxKV3K/H0MAUO5lQOdWc/AeGvj4go7N3SjWxm/ZeM0f7nlWPvTnbD+5Wb7EPOFHjOqHP0HhKE0CKqoMgLItNvgV2Lp58SIH8GPgeQACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovv4TDMs; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovv4TDMs"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1601029a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978459; x=1790583259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WaGH6iNK5Mh0P70RN5intWLsRpMiCzE4Pn1BuX1Z48=;
        b=Ovv4TDMsEpxjYZIADdeQG44we5nUYR2ET568jRtmQPlX8IqwkTeCv206k9EBUs/g3v
         JnJCvjz4kMbViBdOVUX6dZ1CfXsVxCa5w8nuDYDB3H4vtePTdPC1XjeGu4njC9vXoKS1
         oVqv4CYGj4vIfUVrC46CDfwLDLPTcPUMduW20wx5cxqdLINjvYAW3VWPXLpuqZyUzu8G
         VEk5giulvwTmegnxBJTzLTZrG+e25+CvFhHBbN2RdBsZCwPCD1A1v40J1VijzjmHpFQs
         Qb0SIzBvz5guxDCgpY6viTQACoi6yfH/FzNBKK8W8EqKXzpYx5GBhT3NBNGDIs6ma9yb
         BD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978459; x=1790583259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WaGH6iNK5Mh0P70RN5intWLsRpMiCzE4Pn1BuX1Z48=;
        b=oABXSKbCWoACIKnvwKqaCTWTuFt86mrfvGblgffTscxIFYjD5XdRdu01oB8IP/Xu3D
         xxHoCWEXuGLxFvXwqor34onmtjUan9GhIczp6Hs9ADXbb7/8cNqZntg7VHY3xgE1ZHpG
         7jD0KcT/36e6fA0fw5bW3A398vhv7jpMrQ1Gz6dXqV3TVRHRdozZMZqEdQbuYiEtNiN3
         olaRqdxPD1dJaszKvKuG7LcGtX2lCpfjIgH9OjCVp58teaWzdePSl6RLhifo7ZDjN/jO
         55lqnbP+AnR9k10NnGbkAeZEoiOC2KNv91j/ca/6JkkmRH9akVx7rglSNRDWbVrD71i5
         QLMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbtxyXONEZnis29GQ/PQ+h9levu2iPLLf6RAuqtuArywBNoOtCBY371V/cyhCpRWTfyyewRIswZzwU/K4=@vger.kernel.org
X-Gm-Message-State: AFuF++lSKe5jBMuT64+l1sq6knJBucMobIm0+GgL4UscdHN5rMZPojvy
	sGrb0sU8noUFSxQmkIpB6UwS+V56HRIMW0aRGl2jYjEErtRm0XWmZUV9
X-Gm-Gg: AYBFou1txffaDYr7J+wNyCNDYdfYljuSayvfkDBWMZ3bPDodYQoSRkvF9R+nLNxY5iW
	y8MT4yysVj0MWIJNHycaFLmUVCT3va6ObI1W2nRb4KhJMhSBDXh2vnSxDls3Tq5uAq2mFKy8JyC
	Rngn3WjPqkiq0ZsOmHWRZiyXtaLuNRUojG6DGsdVS3L72tgmJq3ATJRk9nf7Kd7x0A2RmKuJezz
	Yn4d4xQZ1OkuCN6oqhZ1N00oWik9gWhuXnXcHQHaHX7mN3qPvWjWYs/sNW/MzIVEyZbXivJKQ15
	SozckXsYrVitTJBqZhkl3T/dUtPymft+/VBJD8TmfP9x+QIAx5o6wrAP/R2KiA88Plt0LGgOnZY
	JhOxJtuelbInCbRViBqCfoiu8f0JotAjHIXzL/1dFbLCKBa/QzQqkSXY4i5jpnWPCVCTdn+t+Dk
	YL0TUPuZg0B+YgM7cn9z+yVaEdQA++58pAbwLOU4/a0tIMbnyjdi14RDNy/1B/Z2Osd84kn0Cvj
	GP/KQsq8neo6MPE
X-Received: by 2002:a17:90b:3c06:b0:3a0:352d:4cb5 with SMTP id 98e67ed59e1d1-3a0352d5614mr5695017a91.13.1789978459486;
        Mon, 21 Sep 2026 01:14:19 -0700 (PDT)
Received: from G15-5520.SRMIST.EDU.IN ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm27742255eec.16.2026.09.21.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:14:19 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org (open list:ACPI),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] ACPI: use IS_ENABLED() to simplify built-in or module checks
Date: Mon, 21 Sep 2026 08:14:11 +0000
Message-ID: <20260921081411.4819-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining built-in/module check for CONFIG_ACPI_WMI
with IS_ENABLED() macro.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 include/linux/acpi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index ddacac812094..b590f520dc57 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -434,7 +434,7 @@ extern acpi_handle ec_get_handle(void);
 
 extern bool acpi_is_pnp_device(struct acpi_device *);
 
-#if defined(CONFIG_ACPI_WMI) || defined(CONFIG_ACPI_WMI_MODULE)
+#if IS_ENABLED(CONFIG_ACPI_WMI)
 
 typedef void (*wmi_notify_handler) (union acpi_object *data, void *context);
 
-- 
2.53.0

