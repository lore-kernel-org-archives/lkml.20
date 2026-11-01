Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546916;
	b=mwCgfxLHBc6EOnp7O0gPk6757yFPqT9UyQyx5X0AJAkuISmEIfY+SCZotvh2EGlY84Ic
	 5qIIu4IvaRUZvNzm81HWn81iTrzA0qhB6zyxTYWhFy9rnE7v8VL6EHwzgzvwV42T2IdMC
	 R+3HTxoCASwcMHbqdjoZDskhMhlrjNm55dDwOtiXHEjHHXXQsUVxdrHByfQPRpnaoX1xI
	 867P0ZchfVYl07v7brsxgfFEmAnXEpFjZuEgbO5nctIIGRUbcXyIDmFUzn5wnjIT8vTiV
	 yT1Fpzqyy5el3O4tWJ0jv+B5j86y4myT9guhNvf0/I+LhgILgX1Eklawf+s8snUmh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
	b=XOuk9w/FOAg6MmsQ4Z6ZIFWVuXx6DSglCYT+le682YsPJEOgemNj/qL0l/vWcrN1UD2f
	 NvwbP4Gg3ShsHdmo/5IzzI8zjVkw0lbiv6nvMvnh28U+s1T3YKavy5sdBLCmNgMjAForu
	 wSSIPUdQeRRrVIqJIKWrUM4Dfl/SfoCpXEj1Q7qBY94tzjRU1liW9CSwM4qnRA96dkMht
	 znukVGQFezoD82YnZTvKKtlLJ1u5+0GFRcnhaUBXKQTAt4inW2LOYSmukq8TjgpcU5XKa
	 ouB4WpFCH7cs4+rxQAbc9St4vjeL1G+m/6pF6MW1hSYbDNwZzFwgoD1Rzi+oZourkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rd5/l0dK";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF13606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF13606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rd5/l0dK
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so3490765c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546915; x=1794151715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
        b=Rd5/l0dK71j+9Py5Teg1XlIb+lIPR8BLqXMqPRuCD9UBDZKEQdgmsPjhwTI00BdOpJ
         PCHWtQRS0+uMJ0cs4ORAm1pSJYCEE8Sw4o5QenDI6VRvCH8YrEl439df6F0UWfCIdRS0
         AXLtOKuehag2/CbCoiOoyPRSBHfqSP0jFxNdQOrJUBbdEcSi6MweE9TbszidtjxiM3rc
         62bRDhngTeaHny34UWDqC/o+ZEY5nBd52nI8d3LSRTBZ2RyCl+iKS4hiH7MEQbU4r0fu
         +0ApZ5Y+nMvjPaYcf0s/iSrCi9dm7xyEp8PmSWjCBmkL1B3RQEw+og6Jtua3LuTmyzAW
         ASaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546915; x=1794151715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
        b=ozoYEia0OQZt22vKT0dDCGTFGAdW6aVYaT/C7cPOBSWu6HzYjL3iZHsqp2Yfp47YfW
         k4leW3ZptRPEDTDQ80rStqJETxjwvrcz8Jv7R9ZM+1OxEDOumUIemfyvlbNsdhQ1I63D
         kHR86X9t2b8ovrhg4ZQep/jygeY44YExNy1FJnM+MgWpn2C2gVkGBd18NYeelfq2W9UT
         4Zqh1+XRl7yKSL32QUydWZwGNSauVW5BrvrO6KZjnkELx1Vt9Z9Yq357aZBOzGnJOrYf
         nnm2Om6yJCjxwQ25JzqxqQ5eaS5M/YI9RzGIYygKvZPKV29/Oo0FM2P9rb1gzbTg6wOp
         0JPA==
X-Forwarded-Encrypted: i=1; AKwUvBw02GaIHODVlZ7RBpKwmNiNcTDJRPFRAvNU0JF2WitqGt2H9avCogfdFMoKnPb3rf7l2LMooNk929W/1Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Y66H+MWfO4QFBkQQWVPp+wt5KZuBW8EfGbqcan3BZLubyuor
	dWEynSyhTx08ZEvukuS/N0LTsq1mP1o99mGmpCDkMVVWb2RCrnZxyXm5tiB7Pg==
X-Gm-Gg: AYBFou20S52GyuK/cbUakxTbR/dbUTzuRGAKw+65xnpDpxoYPAchcgIWCpkyfexzpJA
	e9N0Gem0pC21FO2TuTC4LFP4basg/tyAGqjV+d1JSM2zFe93RWeCc2kZc5PfQtYsqvMG2dwaPvP
	5AZ40NlML3o+yEpKH0lKURIfFCPRinUm1h+zd8HRdYoukJHjEzHBRCQZxaYbvk68VbloGnHzJ52
	n5aQeZoWa+c0kLkbWV0glA472SJjdJS/7dh9fceZ7zBerblS/kLTWqi/+dxUbcym3uzp0goE4oi
	r33ESfdi0T0u7vVLNXEiR40MhazkerhvmwpLv6/3rXy/h6G+LarXWSMkc1nnqmKE1qT3tj7JeHl
	+F+MY2Ez27ITQfO9/PeWSblmb2ggiHHAoo4u8tGJyjZU/ZmQeiMhgdhdRlWpeYixuZDozOTH7pT
	EvREP7fQUGI5vC0yw5u0604nLh9FkqfqslbsaWKWN6QUikO74/nmM85bjrxNLUtJxu5kbyVw+qU
	dLW7gPWqbBzWwd3feqpC0URBH0zVcDT/L+p/mp2llsBd/42a2DMn6pqTmZUPPCcWxZR3C3vH8cZ
	WPaJMx45egKlOqFg0YZoltYDMfye/w5uxQ==
X-Received: by 2002:a05:7022:ea4b:b0:1a7:979f:ecc0 with SMTP id a92af1059eb24-1ac5b7e1074mr11081302c88.27.1793546914963;
        Sun, 01 Nov 2026 07:28:34 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:34 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 3/7] KVM: PPC: BookE: Don't call __ffs() on an empty pending_exceptions bitmap
Date: Sun,  1 Nov 2026 20:58:08 +0530
Message-Id: <9d5d92e93197ea43468312c82417b2f24159cca6.1793546707.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793546707.git.ritesh.list@gmail.com>
References: <cover.1793546707.git.ritesh.list@gmail.com>
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

kvmppc_core_check_exceptions() has the same pattern as the Book3S code:
it starts the scan of the pending exception bitmap with
__ffs(*pending) and is called from kvmppc_core_prepare_to_enter() on
every guest entry, so it routinely passes 0 to __ffs(), which is
undefined.

To be safe here, let's use find_first_bit(), which returns the bitmap
size when no bit is set.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/booke.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 13ad4cf5fa71..9794ee6f7204 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -692,7 +692,7 @@ static void kvmppc_core_check_exceptions(struct kvm_vcpu *vcpu)
 	unsigned long *pending = &vcpu->arch.pending_exceptions;
 	unsigned int priority;
 
-	priority = __ffs(*pending);
+	priority = find_first_bit(pending, BITS_PER_BYTE * sizeof(*pending));
 	while (priority < BOOKE_IRQPRIO_MAX) {
 		if (kvmppc_booke_irqprio_deliver(vcpu, priority))
 			break;
-- 
2.39.5

