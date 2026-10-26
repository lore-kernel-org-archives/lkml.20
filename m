Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013527;
	b=KqryPVYdEEoyO6lZ59iQlQd8dIatii8OZPhuujagLskbVOD5t5gRsn+Ie0kbGmWA++cZ
	 +5vp20e2zijAFUyGih9Ps49y+C+n/qwlkLX1kkhof4mIcSnIsH1ZdyA/mDHW+TSbMB7Bk
	 TWjgNdJZyjs2cyIdM2fum8s8+Ez9ASVuYiXbyWOCeKOQ7XPPfbXSH/G7X48unTcQwBNNP
	 8xH36bblR/0KwATRqHgckEYwtOBxkQb8dZSL4GsNrzKT/YQEn9dNwYG+y1CPCPs3M0eGX
	 Lj9nM92bahFpDy0dMs4NRXXvZzMilq3U7jr9T42RPVqOxA2HRh65cFofjDeWPvubxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013527;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=rbE4HVimj3UAIPKUXuhAh0R5+r8HoILlRGhsY+qOMz8=;
	b=n4d72QQKVsy60aN2tTwRdO15aZncSYpXloiRWg5+38+Q+m+fv7XmSeiuNkyVuAw/myVX
	 0a0a8zml5IwHXcfEYkEs3ktOr/wsfbVYxNZs0meqsguuNNB86lRVtlfT/iPgrp7S0unUE
	 jlZwgbj+xN35NToaczcwcVaFCaKhImLy9gzemb4ncaZKOL9EXR4vQE5sW20Mgz5h3Hryz
	 N1+sWPXnREWTSbWSu0rHfmn6kjkccujIddkNeWEbrnF5Q/nyQ/XDJOePmIm6twgXb6Gvv
	 y5AWnE1MvGwhiCclM7aP7l/ZPabjRVdC5R++czo4W8qeXtuKOercjAX8ff6ffZ+Q3yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9u4QqjB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FFF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FFF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9u4QqjB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbE4HVimj3UAIPKUXuhAh0R5+r8HoILlRGhsY+qOMz8=;
	b=V9u4QqjB0LQ7oYtK1MOJd/83VNKKbLvQiL2kaXaQB5kBGjMvKMT3+UaPvqRWO28fYNfZy5
	NOh1lDS+K/vrsDhV3TeqlnG6I9VISm1TA6WIl2RdqdYWEMUO4Dya6YuuoiwCmPTYW/ekEi
	OxZaFw1HYrvh4ul9YyzqO4bfPmaPxEM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-NuJb4LBHN2m9x8cklxfmMQ-1; Mon,
 26 Oct 2026 07:18:40 -0400
X-MC-Unique: NuJb4LBHN2m9x8cklxfmMQ-1
X-Mimecast-MFC-AGG-ID: NuJb4LBHN2m9x8cklxfmMQ_1793013517
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F055E1955E74;
	Mon, 26 Oct 2026 11:18:36 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E78FE195608A;
	Mon, 26 Oct 2026 11:18:30 +0000 (UTC)
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
Subject: [PATCH 1/7] alpha: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:16 +0100
Message-ID: <20261026111822.458404-2-jmarchan@redhat.com>
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
 arch/alpha/include/asm/local.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index 88eb398947a5b..1578c76adda62 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -100,10 +100,4 @@ local_add_unless(local_t *l, long a, long u)
 
 #define local_dec_and_test(l) (local_sub_return(1, (l)) == 0)
 
-/* Verify if faster than atomic ops */
-#define __local_inc(l)		((l)->a.counter++)
-#define __local_dec(l)		((l)->a.counter++)
-#define __local_add(i,l)	((l)->a.counter+=(i))
-#define __local_sub(i,l)	((l)->a.counter-=(i))
-
 #endif /* _ALPHA_LOCAL_H */
-- 
2.56.0

