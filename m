Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544423;
	b=yjCdYYnZn2C+u2lSbX3Po3SgOD6vaSZGD2Xr9ZDJjqbaywAhEf7PFYbRBL/KqG2n0Ciy
	 dDmvVvScDCA18RRFaICH5M4hMsjJwL/LhUyR18+T6gx/nSWGWHwfG4cov9qOo22Yhy9EM
	 LQ0NFqYrlSMnJcbYxxQaERVVkKRKw9Xfp4dUJkCRh+PiNnPz1SHNEq+OFLPGsG01EeceZ
	 5atScsOhv8wOFkpSVjRYIdkyXaa1CHNU6TeZJbJiu9rH06Et4M96uOcEAYrAPJAmT+jZG
	 hNaRD7OZ49oEmPtaBSr1Rs7bFQwlNfPv0I6738HB3S+J0NABwB1076iuUmyH7shZ1gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
	b=s+QrbW71noxMWIr3DtoZCI/hk1x5beSrP7GNuDoibE5fluIIM2CBqUTzFdwGxHqEeZ63
	 gcbvCJIbDq6gitVDVkfqoV5Xl2Ko3hC+pq9SSvZ+eXjDfi6Gsvj7hYQMTNZ82Bb3D/Yka
	 jDT/aPRZDq39UaBIW0j4ims17pCDK8pIt+6SvKmycw25YYOS28m/GCknKvE4keJGjhEUz
	 +XKtmDcsYQDn+HqetKY7S+U+AC+8N5zgHBX7g+3B48uVHUcdmeeCsLCIhCeCfT9z3Sugx
	 iwHKT8GDzP4eDp8IDPUgWZO82QvkWzbEeaf0nxr/Y7wwWS7VUYIp2ou+w4srpzOBPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHkCTlsn;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F68606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F68606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHkCTlsn
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so4426123eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544422; x=1794149222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
        b=mHkCTlsnC+ULlBwO0LLogM3r/7h1XFLev4Vzeb6v8xf1ToE9UTsLWSd5zmThTz1vAh
         1StTDZoLI+UDUEU1F9/Xq++fo9/xj+Ak95vmt1EZu1jm73CZd3ntY23BlFlVHPT9Vz1l
         KszdZVnxSOeoFAcr5MiadymyzCAvPELM8ff+HBlopKvErZZMAFZsCVA4mbfbVfoBdMOM
         3bmFkykvwu+MbqJ6ZMN3fd2LgA7DsBku/Zeh8+k6k981wh1sxSG4kZAmMfu60pWlo1Nt
         zi/NPbZM4YgVVTDftf+V6Mw4YiW4GzCDrZTBZU6fXIhH0TqpilGxW3PPZ/oTZcgw77dC
         0cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544422; x=1794149222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5gRU5GAL270mGkO9O483YONp/GPCEfficmu0iainJg=;
        b=bFucDHeGv5uoglPsQBwqKt4+EDZSfB6fPY9Tl8Mbfme0oqqJ38arzEUVNYYOvzOBtl
         uE0qQHVrqiva74ChH0kIYLFY0NK+5c2191k7LaLNQfqEU1CqMgT6Jo7C84shxOEz73M4
         PGzn5qo5HIMufZBjMvg8pGR+UiI0D2uKhjfB1hHp4Z2XrBaXsTjM+EqN62uGYeR+zvbe
         ekKbvbKosjM7qTYl2v7Qbj9h6kI1+5Qk9NGV1/CTRWCH+W+ZUusvjIl+oJX3Dvk616OB
         49fIw9XLg7AZWQUSeeZMT5XP7XCNDOW7DHtGrJrPx5afwsy7/4FcbtE1ZKjOYmL1hB3I
         TJMA==
X-Forwarded-Encrypted: i=1; AKwUvBwUHUUSc3RYITeIeHH+yw2SI8jfO3iJUg3/sIT+K53LQ8UBjoB7NNqX0So74PRP3ryfBU1PS+DMdyo5dMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ol2tLAmWz+nzgIsJKYcecC+RBQLMtFlQv3we0awD6gLkqpWTC
	JNhhw0xTUbAkYfEigy+2xybXE1lidcou2me2RlcOBVGVX0ODr8hXs3QZK6sdkA==
X-Gm-Gg: AYBFou12duivsCq3x/52fDFj6tigX9OyTREaA8G+PnKv8Mx71/iOTqfYAp4Jy06CGLP
	IF3raa8IZkriDV027WJEWW1ueks8XBf6mWZWLTcHSj/eXz0IBir2TjWnKExMJMVL+t1nXCEin8+
	AouMweog9Ep11O0EU/OJA5LcpTSDhwK7mTY1eUfiCpyYJfYzXzA4M1P5gqvrcLKXLmaizivqPmD
	5Vm+A41mWHezixeUngPgU52FmK79ZRwvxaF4FRZFUS6HWG0UrEq4p354xmNedQD6eNQrDlH4Fjr
	2bvIS45bgrN6+H8eRTk7AdUSGL5coE2ybnNkgls5RM2Lfwy+AN1gfxOis/7gs0hjYTRiHOcfX6X
	1xKtsgRVIeWyW2+6p9Zw2x50ZAIUMbO0GTtV8thvlEIoP8z5+UkruMLyRm8HJL+VtpGte+AYVAT
	DtgO3s9wA96Pa2Y13oteG7p5kDJXXQ8bkTeN9G4JJYa394VaMCLAn0mHxBZbR/5p28V1UYpgBpX
	fU8UEeG6/XkAjXB5fKP2M2CEFNafXx05KouMtjhL+IyS837+ngAJmmkoPfbkPRSoMhOiUd8v94z
	do1MfaVXv8y1YTRBoT9SEUJe4+hPBP5dl2K/7Zsr/bnUxU1hSABSp2I=
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr10929945eec.9.1793544421715;
        Sun, 01 Nov 2026 06:47:01 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:47:01 -0800 (PST)
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
Subject: [PATCHv2 3/7] KVM: PPC: BookE: Don't call __ffs() on an empty pending_exceptions bitmap
Date: Sun,  1 Nov 2026 20:16:28 +0530
Message-Id: <50c8d501783acd86f7b4a25257c70505b96ff7c5.1793543627.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793543627.git.ritesh.list@gmail.com>
References: <cover.1793543627.git.ritesh.list@gmail.com>
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

