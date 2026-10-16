Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECB3B38AF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139027; cv=none; b=stV2fRSEtaVKPDw3ZCrNSarZpZWaS4qbw37IoFiwvpqCADsXCtVyF+lCuLxQvMWE8qBmUrxNdTufnEERjNvSb4qeBZF4Ht8KqSPIPcCveSKAtP4DKQdpllXi+u8BnzJTRSUUEhfoyb5rRa/EYjUt1hFMyZ8J83JHQl5NjpQwj2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139027; c=relaxed/simple;
	bh=DPuJiQDIaf5SF8ZF6lSYjBVWmbCcO7IipEOzcZxX1/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iFHcrE8jNG95e+A1fT6Ci93YygU2zO3BfYphJkoDvxMWdDxYatinloUMYBQqeSArd53zOUbyr4IEv4EzcXJ3Z+fEcxGS9Jcyp+r3LGuVQxbwXOehxPopMwuhKM3U5YDDByOk7zqT0KMu9oXZsTsuv2zb3XOjScxrVlHMPr1HyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXwAzgKX; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kXwAzgKX"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1813fea7dso87736245e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792139024; x=1792743824; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=707YQ5WOW5OhLWsgc1Mn0RWZVRHccpuv4G8HLhK/9eU=;
        b=kXwAzgKXyb94nAyCZ8KqGZ2LBpASFeePey4Ul0D57Kezx1KDCyFKdzEbDL/ARf4ysp
         b1MidvwUCbnu+7j50CoA+hXYbBpZCMx4RrhF9oLoY5pHQr7VbBJfci+tvtpEWDVaXChF
         gDEtGCyL6WbdvQ3ItW9DdpVczm6NqYMp4pdTI0KKyzyGhwcWfy+WkqO6yShhlb5PfT81
         R7CVTk6zR5bu9iHHrWrUWvkeBfEUS0rrkI1CXQYOP/38dPX6jqfJUxD5/eHBtaRbFDG7
         A0YiiYNuJGotGXhBujwOX3bZ4pONoVvyUjBQvB3L33HZlM4JJVCFr7RMSEts/l9AIFKp
         xAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139024; x=1792743824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=707YQ5WOW5OhLWsgc1Mn0RWZVRHccpuv4G8HLhK/9eU=;
        b=k/TKcRZ7XvbMa5nqCiJj5Bh36lLU2wz2+q9o/xxOJ28TSGAVfOryWntz/wHvJBF8r3
         SvAzVcfiGI+ksWhhiv+YUyyNAo5GQIjYPYmzyx7J6hXOUdfddeH0zAQ5mN39pyih0qLo
         blUR0JtA5w8k3mD9WT4ohtGWOZ5g3lanZ6wkpDJHoBgEYKGjjfgDJ7XMuRVVOlDCeRo6
         ESwyivxXpSDf5u6C33QzFk6JpdBWJO1cKWaQR3gh46QA3noFejg1tJ++Wi2xZ6lpBuSY
         NS6QvRUHWu7MghMev+0gnLLAF2qp7pQ+/At2qxkn4+GnwnvacxijM4expAEpmjrrcVnh
         7HDw==
X-Forwarded-Encrypted: i=1; AKwUvBxrElcSI6NvQYJmFqElpJaxTkorThAUdMWXyexu6Hefr69JRJPbTEcJNnS/Iarrjgckzf0w9Nd5LKnkrmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhxWchGU/1BTt5T7MUdelVi2khfLvkPZxlL0qDolS2LG9kJ5wg
	1Js4cyTN2EiSWHqIt/w9v+6U4azm3YZ6NAON2zZNghSmv+KGeKluObWaB22w3lkoVbxNQSwqcD7
	OK0PbKQindtMaM50w5K6ggJndbg==
X-Received: from wmbhc20.prod.google.com ([2002:a05:600c:8714:b0:4a1:93c0:d3c2])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e86:b0:4a1:ad49:7b3 with SMTP id 5b1f17b1804b1-4a1ad4909c6mr230452255e9.22.1792139023899;
 Fri, 16 Oct 2026 01:23:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:23:40 +0000
In-Reply-To: <20261016082341.4030770-1-snehalreddy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016082341.4030770-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016082341.4030770-2-snehalreddy@google.com>
Subject: [RFC PATCH v2 1/2] firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
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

FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
(0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
a subset of pages of a memory region without requiring the Relayer to
maintain intermediate transaction state.

Add the FFA_MEM_RECLAIM2 function ID definition to arm_ffa.h.

Link: https://support.arm.com/documentation/den0140/j
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
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
2.56.0.176.g3575e65682-goog

