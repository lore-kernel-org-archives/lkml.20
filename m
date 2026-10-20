Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505247;
	b=bhR5p28Du6sKIWsR4RhS2NXvBK6kWxR8olMNncP7r0jVOT2zWnhJ/QmxvSxAj4MKh5fe
	 CFKRtd5mvxhP3Hl86QuYqSWJR1CcZThro3q7Dc26YEOxgAJBkAZq3XKpQc3iZPIAlZ/2s
	 XAMGblNdmIceS5VElrI76xkZ8mal8a3L4YX7pjkMTfHE/OqJhe5NH+EggRw2Okoyy8sxY
	 yILCFuyZKlYfW+dIR3TF+6yuxB9ZzFqKPMZhQUUNct0UkYI1xPaOSeQvSnEs+MSkcwrfE
	 R2GBVBdpZKzO496fvByPHzHpPbhsMyik4Hj6Re3IZ8AfkROEDriW5kEM//+3Js3w4ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0MP30nw0IIRx244dAjoQ+sXac7dSmGXhgCJfSLXreiw=;
	b=3AlgOQ9eJE43cxtid7Gk2z9xgSFrpSpUuqyUtG96OaaHf+LHphwm5WxnPo097gTFxL/V
	 rIvm+K1qzhA12oIki4EFftKh1VL5pO1rT9lMlaIGbrAXj2fn5P84rMmMRuBQc++FJlhCl
	 9O8oSdR7iFcLOPCDeakqgh1qI5ZSKpp4eqccTAKrE+wDwTXKLeeknrM4BJqZnBz7+He8N
	 I+X6jhz7PE3UmBdvPZ8w0EMEMxWlmBkaFAw9A8k1chE83FyG0vZ02f+nbliXTIIwD9ya1
	 iGkqxfaUfhOCjEW12p0wkJaBaPs+YHAbgzVeY5xA+EBd3Yq5dY5BZpniQJ2k3N2gylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PiJ9AoaR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC160A263D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AC160A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PiJ9AoaR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso22940395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792505245; x=1793110045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MP30nw0IIRx244dAjoQ+sXac7dSmGXhgCJfSLXreiw=;
        b=PiJ9AoaR0HMKHeEwK7TitYoY6Y56ApwuluhWcQFtkEo5nw6XDL21eZZN0/FDaSB6E+
         12p+bA6tosrGoWErSa3cj61/lAhieh0fPU4o4SgBo/84qERPd8kaAPxL5knJ2fmZF3vQ
         3rC58BdOSWB2KptW7YBKVVeEheZUH0FgVPL3Rg2Uq+etDWfwXl1bqXq9VmiheLezVAUQ
         7VlohMz818x8uAWgJtuD4q8kgfP4ejcFmEpP+fDznL+JVlLUvdp9Zo3MCzjLltfie1ei
         gYbUs1MWe27/bpOHuzTnw7yVPdJ9O28r3LS3CToTnwBmi+ahokdJo9Pu+F922jXfX1Oi
         6yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505245; x=1793110045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MP30nw0IIRx244dAjoQ+sXac7dSmGXhgCJfSLXreiw=;
        b=ujLL5n5bqq1o/EtqTPc891jCvVQjJ6irUCFYzScJ26pBzrfYAi76+Ufr0Co1rE1m3p
         AtMJl6m4nrnETsT69Hj/V2Z7Tm+M45vuOV1tyQ+P0kjA3P/K9db2Aqxu8R0KkUHjn24h
         rYrRjFCRLEAXFRHv3+zF8bAsoXM09sIsH7JgPUT833oUC7kVGTDYflrW7UntMF3dGepT
         ZQsAGbrSy6RumWCLwCb2qvpj9zw6sEPvEVA5dQFldaBmfrnW2gB4NXiH6qJDdGHB9aRp
         YzOL0nRrOO9D8jonJzueT43oMkUrWiIMfOPFkKFQkEqT9L+faU0ITP7WDh8lXFIG0yUT
         ppOg==
X-Forwarded-Encrypted: i=1; AKwUvBxTbQcC4XgMF6nrwNl2d7Svpk5tSpmtRdg04V/hHZtwSqLvh6aecBjowP9/GSIX30/qnfGG90jxLpYIVn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdKTAYiCCXPN+Dipd/FFWsb6UWvWiPLF98ts8NTR2rcbmEUB1y
	2g/6USdrOdG7t8ZyR+/A+4VYTH8Qdx8mftUU3d+r753G8VQ3lmccdOTGa5Hm7H+H43c=
X-Gm-Gg: AYBFou2c4uEx8NHstWGPjfjaIxdjYRqkHaitoJvWavzEyl8UdmaQk01JleYiP3tKQv3
	jSGTgrxZ6b4dMdYS/kNjf/7ZltzR0f4xiM+n3gFn9uqn3sIN1T8wIr/M9+kJGU6qovP6fapygmx
	bqSteDupkAg8b69Np1FrHX1JhaWdU00xQSe5ieBdVFVBctq1VWF36eu2Mz+mCTfCko95Oqg+3oy
	x9cTTITFsVi3VA7Hg6DgusvgtmQe/4p8r2fl0qvQ3lfuSy1uqR+yCUNNihY86QbrL4jDFHTgGK7
	a+kq9u+L2F1etLyl70yMFLr4NDXhggzNdpJdQqAQDJc0UeXSXIqKdTQk2Cni7Dz66PihfkXwmyu
	Yfh+DThZ7ykKrNza2HdIwBhEbmCWZL3uc8OezusOd1kvwkKwDV9Rdo10489w5lHJe0HRTlKFpGq
	jZwBICwSsek6yK1pNFo5Hw5ERsLG3W6PwKHy+bbHxxlEgwEEks+f5WlYIz3R1fD/HtMA0ImiBdx
	mWp9Q==
X-Received: by 2002:a05:600c:c16f:b0:4a1:b29e:f72d with SMTP id 5b1f17b1804b1-4a1d7466674mr249825155e9.0.1792505244986;
        Tue, 20 Oct 2026 07:07:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce1479sm75602805e9.14.2026.10.20.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:24 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] module: Move mod_unload_taint to tracking.c
Date: Tue, 20 Oct 2026 16:05:21 +0200
Message-ID: <20261020-taint-unload-v1-3-d1c764889afc@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
References: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
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
Content-Transfer-Encoding: 8bit

Move the definition of mod_unload_taint from internal.h to tracking.c, as
it doesn't need to be exposed to other module code, and remove the
redundant declaration of mod_debugfs_root from tracking.c, as it is already
declared in internal.h.

This is a non-functional change.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/internal.h | 13 -------------
 kernel/module/tracking.c | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 70ef20b97c84..3aca22253296 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -253,19 +253,6 @@ static inline void kmod_dup_request_announce(char *module_name, int ret)
 #endif
 
 #ifdef CONFIG_MODULE_UNLOAD_TAINT_TRACKING
-struct mod_unload_taint {
-	struct list_head list;
-	char name[MODULE_NAME_LEN];
-	unsigned long taints;
-
-	/*
-	 * Number of times a module with this name and taint combination has
-	 * been unloaded. Updates are serialized by module_mutex and use
-	 * WRITE_ONCE(). Readers that may run concurrently use READ_ONCE().
-	 */
-	unsigned int count;
-};
-
 int try_add_tainted_module(struct module *mod);
 void print_unloaded_tainted_modules(void);
 #else /* !CONFIG_MODULE_UNLOAD_TAINT_TRACKING */
diff --git a/kernel/module/tracking.c b/kernel/module/tracking.c
index 873fceb30526..46840dc22dcb 100644
--- a/kernel/module/tracking.c
+++ b/kernel/module/tracking.c
@@ -14,8 +14,20 @@
 #include <linux/rculist.h>
 #include "internal.h"
 
+struct mod_unload_taint {
+	struct list_head list;
+	char name[MODULE_NAME_LEN];
+	unsigned long taints;
+
+	/*
+	 * Number of times a module with this name and taint combination has
+	 * been unloaded. Updates are serialized by module_mutex and use
+	 * WRITE_ONCE(). Readers that may run concurrently use READ_ONCE().
+	 */
+	unsigned int count;
+};
+
 static LIST_HEAD(unloaded_tainted_modules);
-extern struct dentry *mod_debugfs_root;
 
 int try_add_tainted_module(struct module *mod)
 {

-- 
2.55.0
