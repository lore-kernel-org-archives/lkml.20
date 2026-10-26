Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013554;
	b=j4qOns8/8op0KNMiNzXLQWY6cBJvhZrWYx2nl/4c8gCUJPZBPvHnFphRcUYrjlVCcXqA
	 iRXCjCddlnhhBQhiFp4fzAuZ5pqctbgH1cDMioZfFI/qlmfU91NN97fHX3cTYyow/5r8M
	 UfirQ8iuAaIZcmku/06WxcFngcsDoQEq0QlVfWpCgLO4aWXNCph9WgdG7FSooNEB2IHTp
	 wgz4IkDly3HsjtS7G863vj4fnt7iJ7QCN8ltqeHBLCXCDOE609VB3CiwI92eXoU0pz3hb
	 2P4EkCl8ReOcMZkv2xJq3zQhsFgB3ulvyqT+JgwhSGtl0hjeeuL8mRIGMZVSvu/Mndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013554;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=wGg9j8X+Be9VMOegWNn5UsG37/Y63svMmYTnax47TqN4XvTPuk3lFcPfSa5tupHC8oTf
	 NFC/PYibllFZDF8qYvn2AvaRjLgRJ1pA+jgNUDJfKpZ6dy+s3mGTY5Tmis94F3+hOBlh6
	 YIPy6wCkriBNrB56xbMbdCmVu6fds8bgkylo/E0pa/RsiF2+7jMcJeqycEDqsJWkgsYnB
	 Os0By9koK5g/HxHJvuI0H9y95D4ze3MlEBPPrGtCCQafIuVFaoqcJEtVeJbsVLaU8hNKl
	 kzQ8ZDMhOOFDdFKQUHGwz6/3D2zs96uuegJyhkfAghJ89nwWGBRnxmFCxbg/JXB6ReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fdKzjK4a;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5D606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E5D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fdKzjK4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=fdKzjK4awH1lPwbCmc/uIBydd4JBqaJobtvwQ8QXaGNgCh1/yglyKG9qJdKTDa0fIzMIBP
	myV/EnKO0AY7ntFKSLBrPWB4ApcfNhc5Oqc7ydh+Jhc6nd6ukyfgSTW17isnvoYdNpvDY0
	Ad7z4Fgg3Plu/0mLmQKe6pxjMM1fFN0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-CumeemOmOJOuBM2QvMTNQw-1; Mon,
 26 Oct 2026 07:19:10 -0400
X-MC-Unique: CumeemOmOJOuBM2QvMTNQw-1
X-Mimecast-MFC-AGG-ID: CumeemOmOJOuBM2QvMTNQw_1793013547
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64C1956094;
	Mon, 26 Oct 2026 11:19:07 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44ADF1956087;
	Mon, 26 Oct 2026 11:19:01 +0000 (UTC)
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
Subject: [PATCH 6/7] asm-generic: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:21 +0100
Message-ID: <20261026111822.458404-7-jmarchan@redhat.com>
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
 include/asm-generic/local.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index 7f97018df66fe..4bb458b57d470 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -47,11 +47,4 @@ typedef struct
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
 
-/* Non-atomic variants, ie. preemption disabled and won't be touched
- * in interrupt, etc.  Some archs can optimize this case well. */
-#define __local_inc(l)		local_set((l), local_read(l) + 1)
-#define __local_dec(l)		local_set((l), local_read(l) - 1)
-#define __local_add(i,l)	local_set((l), local_read(l) + (i))
-#define __local_sub(i,l)	local_set((l), local_read(l) - (i))
-
 #endif /* _ASM_GENERIC_LOCAL_H */
-- 
2.56.0

