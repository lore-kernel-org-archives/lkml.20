Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58B24DCF9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986904; cv=none; b=CU1agz1z91m9nVX3NWyaEfUnjkb0mJCb1XBz2osSAl+UY8aNKqwWwJZS7ft7RnUSBsxFWyRhyaiDRlFsucTqN6jAdGKYto80GPulMfWcrtQoZZbfk38vtVMdBTXTWq6LTpNGa9fXAcI+KQrAL/+Mpblj6DKGnZPkycefMPa4AxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986904; c=relaxed/simple;
	bh=mjHOAY0WjXq8RedHE7fU8Anci6chvoW+Cy8msbtc86g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YB7GPTv2JtoJdwQbWPfSO0oNaK8QXqMUnKhpB/zhxDUR0dj52ZS9VhEtzFe0hhOw8L4l1U88ioIMahOh1doM0y5Nm0IydX6Mjv+NUb1JRe/h5JLYfQ45KueShfUW4hsDpPb79DXCNpV8fDLAqKUAC27tcb93NmxC1BFPCcvAYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q6BWJPtc; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q6BWJPtc"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so106788a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986901; x=1791591701; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6sUnq9x/HmG0ptNu1GvY9h8+SRbclY/ESrYb+ZqWXI=;
        b=Q6BWJPtcklvRXHx80NdbL74WnxyYXUzSzEQMjOnZnh14jmh6WEE4IdYjqG81g/nzHX
         RSlJaSfzLLQ/WMi8HUUxoxxrM661m1ieBAGe07VpXAs+QPzJDdZM8d/0YrNZYi9+hdKn
         7Hz+c4gRbJiE2uPtFJTglpE2twY2+ts9r33g5m85S8jTA6N18jV3xeSdZQdZ6hIbo35B
         BZNE9WWsFHOookhalU2uMyM+OhmG3Mh/0dgYV1sWhnFG3tR7g9b2jBZsDIh/UOm/Kodc
         7VaPFxKGl2RHXVXWkqEFpYYEilxwkOk0H/LAlXsyKdzfUuwG9NdfdWlR05EYAYc2c3q5
         hQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986901; x=1791591701;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6sUnq9x/HmG0ptNu1GvY9h8+SRbclY/ESrYb+ZqWXI=;
        b=CvjqGFAJ1y742XfSfXl90H/vC++mpvDB+2WhDKig3yf+6uGgYFf8moct00WmLGHRqI
         KVkNYchlgFKgXigsP5vIfC1+RDwHVogr/Tsi4DOdLQWi9r/uxbCcHvf6C6bafOJ3J3Xc
         t/8COpTgNZ6Uiy+9gYS7OCd2Ojo7KqSpo2z6uQ/RskID0fGm0wPPyNkfwMoPGKcQtly9
         HZuH3YQF93bMqeTN1jnZWVTlJp745KXlV1MVumLMC9U+hzPlgsp8r3EzoMMsFDe/s1re
         ukaNROFPF0ceTTb82LSIN2aZzDGO52KqFJspab+CRqyyxxTdl9SZEGI6ZU63iSs5M82K
         wOMw==
X-Forwarded-Encrypted: i=1; AKwUvByFSN+Tgyvrj0ZUxfiRs0hhIh13JoxcTa1yo0UE2/DJ99QiC6/zAE71zXfoMZ+8/HlzDAgH+q3tCSuNZBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi7/BQr5XuyvCcjsopc9SBRiEqmdL98CAdKBCeFBI46rBxXk9H
	PeYz5/WGOyfKRPBpZEvZq/rA9Oau6dE8Phvczb0pNcjfLPW8i8DO3vnrMkYqqcAtKTeSMu5j57c
	1TyWqNxzwApkUvAwR1WnYow==
X-Received: from pjbie11.prod.google.com ([2002:a17:90b:400b:b0:3a6:fc34:663f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:548f:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a6ce827284mr4162203a91.43.1790986900455;
 Fri, 02 Oct 2026 17:21:40 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:10 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-8-jthoughton@google.com>
Subject: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch doesn't
 support HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
architecture lacks support. This serves only to avoid confusion for
users.

arm64 support for HVO is conditional on certain hardware features being
enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
all secondary CPUs will have started, and the system feature set will
have stabilized, including HVO-through-BBM, which
arch_hugetlb_vmemmap_optimization_supported() checks for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8596a462fee6..817ce39d4cf3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
 
+	/*
+	 * Architectures that need to probe CPU support for HVO have done
+	 * such probing now. arch_hugetlb_vmemmap_optimization_supported()
+	 * will return the correct value.
+	 */
+	if (!arch_hugetlb_vmemmap_optimization_supported()) {
+		if (vmemmap_optimize_enabled)
+			pr_info("vmemmap optimization not supported by hardware\n");
+		/*
+		 * Return early to avoid setting up the hugetlb vmemmap
+		 * sysctls; HVO is not usable.
+		 */
+		return 0;
+	}
+
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
 			register_sysctl_init("vm", hugetlb_vmemmap_sysctls);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

