Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013549;
	b=LyF7EO7vECn48mft5ostJRb+EuVsmDOeJEPAVFVxyAxbSyL1OB7Jly6DZJyEBxOfgyD/
	 AP2yG6qBM/srS4QYQo9wk7wvtzsvhW9bHkjcZv76q4L4Fb5OSu9ykl+gzhgAuHdlAJ4m3
	 d5WMbLaisKT7Nar6PZxpbRR1DkjRB/1A5Wu/xyr5ZdWKy2KEcexS8cHoSjFc+42KETqL5
	 4a7kGz0EGpTq2cXR6ZHutCr1aZ8fAA6jwz65zoxTW53/4bTP+gthx3acsceD7UiJ0esm/
	 sqOWEET/LY42qsdV6mrnP4O/oUliWogB4jRiS/MFKQhVVipyvDfITOWRnuIL0XWakmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NvY4ae/ED+MtOy03cyKJMlG3Ts44d9nHIMF7xjvLS74=;
	b=QgLBHKzN8VdmXEKJ1+ARoz/DBxRfXn/UXfLCnPnv/HW+PP//dDRGS0su465cUPBYeRp2
	 6QeiNdEOBq1GZCaCYZc031GBmk0yy7vJUPQogQbRRAkxBQr/ea3+MhSS7RJcLg0PFtLaj
	 Ig4eWFOzQ4QaN70SBN6BRo1cnqMJioblAaFd8/+ybBnxkV2J5zMoOaCjh31ieWjv12l3r
	 Pw43G0VafrKh8OBQvM5l6K9+9Pv3kzqQD+rwsDnGNpuefk9nz5Sams+1EXMeI/43Z9iY3
	 nLucLbIM+JB8gAiQsMdTSSKZBQfGp7L004aDeg4IB+W4ebBSsx587qdbDkuK7iHuFYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fRM6y72M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F257F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fRM6y72M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvY4ae/ED+MtOy03cyKJMlG3Ts44d9nHIMF7xjvLS74=;
	b=fRM6y72MqaWz7poxe3Y0iGUnUx37rPywQs2FHiIXAKi5nYAEV6M31zrbzmLAhKdW6VtVuz
	8EHKaPbb29GNFSCkw9NoKuqRyQsKCnoc72ZBKbTSGk4bezTWPWwrRFaU+p4fCluaEXV2Xj
	ZOmc4DU5WvlOdTjGL42yAQ7nOsc64RY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-8T1mK9NyPHKuQWwejArigw-1; Mon,
 26 Oct 2026 07:19:03 -0400
X-MC-Unique: 8T1mK9NyPHKuQWwejArigw-1
X-Mimecast-MFC-AGG-ID: 8T1mK9NyPHKuQWwejArigw_1793013541
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB69D1955F19;
	Mon, 26 Oct 2026 11:19:00 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A52BA1956087;
	Mon, 26 Oct 2026 11:18:55 +0000 (UTC)
From: Jerome Marchand <jmarchan@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	Jerome Marchand <jmarchan@redhat.com>
Subject: [PATCH 5/7] x86: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:20 +0100
Message-ID: <20261026111822.458404-6-jmarchan@redhat.com>
In-Reply-To: <20261026111822.458404-1-jmarchan@redhat.com>
References: <20261026111822.458404-1-jmarchan@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While working on a fix for a tracing soft lockup, it came to my
attention that __local_dec() was broken on ppc64 and other arches (it
actually increment the value). My first instinct was to fix it but the
fact that this function was utterly broken for so long, decades for
some arches makes me thing that those functions have not been used for
a long time, if ever.

Anyway, they're not used now, so remove them.

Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 arch/x86/include/asm/local.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 68af7b74450af..6d0bca91915cd 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -170,13 +170,4 @@ local_add_unless(local_t *l, long a, long u)
 
 #define local_inc_not_zero(l) local_add_unless((l), 1, 0)
 
-/* On x86_32, these are no better than the atomic variants.
- * On x86-64 these are better than the atomic variants on SMP kernels
- * because they dont use a lock prefix.
- */
-#define __local_inc(l)		local_inc(l)
-#define __local_dec(l)		local_dec(l)
-#define __local_add(i, l)	local_add((i), (l))
-#define __local_sub(i, l)	local_sub((i), (l))
-
 #endif /* _ASM_X86_LOCAL_H */
-- 
2.56.0

