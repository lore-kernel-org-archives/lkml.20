Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628889;
	b=EPqHCU8YYLiWnGdZPvExkqFS2xUucsLDsqqpS3x8Q2UDgKTSnCjjZH/0be33676OeCNV
	 YQ0L24dpKrrF2IgE2Xbxr8q9OxW3Aa7WbINgOPFFvvK5hG3ONyhmzG9U9/ujofb1WRsNu
	 eFLyjKWqDCo0eqx0tlib09H8bdErVJKJ3gKxvfmrynpMuPD0xKTGSTdJ9yXvbSdtKqiMH
	 6yPzF8XBUy4YTy/sLnETHP5DOHrHPosVqXzn+bShYqisPTI69SY9nejKsl94e8cWdYVkN
	 tDLSlJXEAyNR1uoB8uHz1UYCf30cpjpd5ezP577G1IBepPaEbLDRHpB/EdSvZQHJAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=;
	b=OQJVzElZT2F4LIqHFkeUQvrhvTAVrlTvwnts/0vuEAauklPSj8CBguEpUazSsRA/d52h
	 nU/rvUwQOBsZHsREtforgrXLkJpComvHpfk+HXxGTk+roXxGMYAQ/5M6tDvgGMsPJFpJv
	 1J4aO1ERCEXVKfzecIkZ5jKerNV+uewe+eUBHRaES5A++7kbfZofZt41a339pLOBKBq4N
	 yAuu0LPjQyZZbDrJO3sIlYQaDc/jLWctG48TFT+qpJ4qoL2unDAgrfQH2/FrzmOXkXJl0
	 m4AXfkjuxX/PlmfmyMECPyPFxB02GRROaFonzZXq0rdWSAQSSUtGqJ96lxNGtRtwO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efXxvqb3;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F160A261A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88F160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efXxvqb3
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1c6f567caso4011221a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793628887; x=1794233687; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=;
        b=efXxvqb3veMhrvzw0KGX/2WFhieVRxbiKcHFeXOKTr9K2szS7EgRbOqJZkLj/ni7fB
         hhg0jq30R50lwTVYOZS4USphx0A05sE+1AyueSGNseh6f3lDC6g7I+JaZ2ih+v0YU6/l
         kaooWRhc1zh8ORXJELLaz0g30bGcZNp4INU51JnI543R+owC0d/799kZTAgdwgzrne64
         AiiUazk6ZTvjQ4rwiCnucBvB8ZakY6gzUFM7VlDMwggOrbhv9/WgnAXNsqy1OiolAUYM
         jT6dNDeMt62JlY5ZpKTEMgIQyi+LEFMcBcrzOhkJ/49bcLcHJkL2WI62fHwxoCHyokTP
         newg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628887; x=1794233687;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=;
        b=DxR1e88C8V7gTRA9UoQZGdU/+GU4n0koILBVM0TlKPu36Uwl6+9t2LsGm5tgmbX/oA
         VWtqH7dNvB6O22wFFJj58WkJUcAIz0xrreVctzU/8IqoKzACF1hcCe9g0zfD1eVXAssI
         Lfc++cLBdOPh9AVYPwFFbozcdgrT5pMMV1RBh0ZaJNV+Q9CsNAwMx+EoWNY+eKErTGL0
         TIkKcJPSWsRuJUhUMMGEiTaKdGPtgp7xTLQrj/n5pwtWx82a6kHa2m0WczXGy3c5dpRb
         XWs6DEmzbTrqQJ9cTv8KgpK8XInmlV373aLwryDp7tUfF21F1ZUgyo9lffvaMdqDShGS
         aOIA==
X-Forwarded-Encrypted: i=1; AKwUvBzczhM2KdRRFiahWTmImExRrRo0CzsNe98jXLvJ2zYmr4uDeYvdNkckHyfyoW9bjoq55e5mZihPs/ANypY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kz/ynnGBrPyxpiHwxE0fJDEUbCf1zkvcG4KPHJ85TrdqVWT7s
	t0LPVkWgW0s82ilZzvgxMqML1gevfn0GP/kXA8BP4OAq3EByrzdkPeJWQKIQkr0JkgNNPpgdv5I
	hx2O2jjcx5SmMKqNZcg5uBCssDw==
X-Received: from edgd16-n1.prod.google.com ([2002:a05:6402:a510:10b0:6b1:b88a:bd11])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5683:b0:6ae:550e:59e2 with SMTP id 4fb4d7f45d1cf-6b4d5ee26a2mr5205769a12.35.1793628887174;
 Mon, 02 Nov 2026 06:14:47 -0800 (PST)
Date: Mon,  2 Nov 2026 14:14:43 +0000
In-Reply-To: <20261102141444.1830221-1-snehalreddy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102141444.1830221-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102141444.1830221-2-snehalreddy@google.com>
Subject: [PATCH v3 1/2] firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

FF-A v1.3 BET0 (DEN0140 rev K) introduces the optional FFA_MEM_RECLAIM2
(0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
a subset of pages of a memory region without requiring the Relayer to
maintain intermediate transaction state.

Add the FFA_MEM_RECLAIM2 function ID definition to arm_ffa.h.

Link: https://support.arm.com/documentation/den0140/k
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
Changes in v3:
- Drop RFC tag and update specification reference to FF-A v1.3 BET0
  (DEN0140 rev K)

Changes in v2:
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2, following the
  existing convention for 64-bit-only ABIs (sashiko)

 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..85c2e490a387 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -78,6 +78,7 @@
 #define FFA_EL3_INTR_HANDLE		FFA_SMC_32(0x8C)
 #define FFA_MSG_SEND_DIRECT_REQ2	FFA_SMC_64(0x8D)
 #define FFA_MSG_SEND_DIRECT_RESP2	FFA_SMC_64(0x8E)
+#define FFA_MEM_RECLAIM2		FFA_SMC_64(0x91)
 
 /*
  * For some calls it is necessary to use SMC64 to pass or return 64-bit values.
-- 
2.56.0.317.g454f8302e1-goog

