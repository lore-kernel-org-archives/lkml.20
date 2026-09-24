Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD347F3DD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255662; cv=none; b=KIbSP1xkuyyihIVToIFvpKh1/WZU2Vnni+/yZInpmspt6C1bHSvIB32X5MmGP0Y3TBDSuQmw04tBc/7Ps6WLh4+nESjz1yW2bY12G7j8SilwbWDsLJpViRI9+/hIaETljrIcYTqglvntElnkPVHOAYYSqPEBRRksNS6CAOCoOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255662; c=relaxed/simple;
	bh=MexQWRdjnJuSp3NcLmQCtT4yiler41bwgERQVeTO/6c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sjEBowo1iBpPOUCvxOC/zND7uGmNaN/q6o3/JwRTXw9qdzZlmMr7OSwxG3Z/OryEIkfRa079mW2084AVhMvkf2PyiwVeUcPtbvRbIvHdO5QnB+BVcr2HEMzimomJ2aaPit4dQwy8idKMogYRgfzn7eA6ae8+9CRkV0rzPj18NlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAqppfwr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAqppfwr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1645618f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790255659; x=1790860459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AYj3FCXi3Cvi9UA3sTT6TFIXfOoMlewv06G1FePimcI=;
        b=AAqppfwrcaq0QKtHNLzn2kthPIN+0sYNhnbNKJaKANx9N6A7bU/MuG56SHDD8GxXBz
         55MUoAJg8kh9IdyfPWLPX7Uehp6oXo5sScBJv+t4B2SEyhRzmAs2NNMVssgcle6OUGw4
         OXO16TCe/J88HinWbTI2UpZ/ZLa0sPnAxRrFDWBic7/1O00GG1Ujg/avNl6YG+ICsBBP
         SyB+dqaj3h50Mt0qxUuv7YfwegZn9zG5GdmA0RZd+NvwgAbuqD8HMrfwnazOn1cotYd2
         +qf1tJpCFoU4YP/I6E7xpM3IZDNyTAZM002BbqLRn+rD2IanAtggZIOBuFdzbimo/WMN
         XiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255659; x=1790860459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYj3FCXi3Cvi9UA3sTT6TFIXfOoMlewv06G1FePimcI=;
        b=PTGgZW6aqjK/SUajyUB7muqlELXKg2jtwbsLOA/tV+HUQiTWBuDu1GWxxYWRiKmfju
         aMwCf+9Huy4ejCRGN6qaswy55Urgl3LZ+VopoN2BAykMc16BXwrdaUvr3Oe+ribTjGJ6
         9EZNjNHQz7AA3JOQ2hRBVzDCIR0mX70v0sAqGo6tc4621LjyVkyGiAD+SGi3W3RY4rTc
         bcXsoMiu4n7zZsOELy+huhyzP8LH41Mb294schdnfL7F+W6eJrDEHaU+VyxZ+PTPs1es
         KRW3TRaZOtaIK5p6OvG+0HN1bC9tzsrd2rSU161ial1XfO0pN7b1Aj8l55y5NCvd3JTf
         Q6Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxZOBK/9Ihu5c1ZrIvhDb+QSU4qXDFZy5Pn/RvdUwsqX7sl2cauMWLbwbvou1moGBfrfwbJDnIdZWwqwYc=@vger.kernel.org
X-Gm-Message-State: AFuF++n/EwaC8HMVBIX+glng6DjaFpWhxQbfhPx00+h3owg9Wl/b2kqp
	GPyBiadLQAB/glwB9f/8Eu5dwrfx3abCvHuyjJ/q1Nj4AZ0rFlsqMeo=
X-Gm-Gg: AYBFou12GqSXi+xxCBj93sqBHgeQgXSkEeVq1812ong0iyHIOiGAgZgK0328Ka+aMiv
	s2CV79OS/rIGmQkeKk5auzVTWsRJ/5+cAq5JUxiwgSPpETYYs482CHfZO8+bK0hk/lCail/8B18
	+ObstFGoSzqxyPsctpBxrayaA+c7i4eKirw4jHChPMRYM+4Q2Dsw8Gr+UOS32gNQS/CEHXrCHNQ
	sbo5or0tlhBMHcYJ0Z3PSfCWUwxRdwz7sIQMJO+j9xW8LSNt9r5bvsUAONfJQr899tEKp7M5wlO
	P6cop5LCpVEK8qU3It3c1oaNq5OY81o8LqnRqClM5OjDKEsVJdu40WavAej/he7IBSGjjZ4rnfS
	o+Fs22mVM21XKlDxop9SPm7oWelonUhcTg8r4ww6NyAxUuk1uAvw3h6Xv2GOQ1YZlbSDD3YyJ6A
	IZ/z17z2NRbRF2Uej4XJDByY5HhRQzAq6gPFbMdXJ+end1nG6CdRzmgmabFdxOAhh3qkJHLsVJX
	MipyxIl95ZN71wU1JKb8tuI0pouoUTIQb1sYLStXMB+AS38GOuc/1MP44NYg85EJF+xVNJizgY9
	TV0KZrdeWA==
X-Received: by 2002:a05:600c:630f:b0:49f:bd3c:bc1f with SMTP id 5b1f17b1804b1-49fe66fd51dmr40235095e9.26.1790255658497;
        Thu, 24 Sep 2026 06:14:18 -0700 (PDT)
Received: from ast-epyc5.inf.ethz.ch (ast-epyc5.inf.ethz.ch. [129.132.161.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c104a6sm123986495e9.0.2026.09.24.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:14:17 -0700 (PDT)
From: Hao Sun <sunhao.th@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	john.fastabend@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	linux-kernel@vger.kernel.org,
	sunhao.th@gmail.com
Subject: [PATCH 1/2] bpf: Fix uninit read for non-fetch atomics on partially spilled slots
Date: Thu, 24 Sep 2026 15:13:41 +0200
Message-Id: <20260924131342.934290-1-sunhao.th@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_stack_read_fixed_off() skips partial spill checks for non-fetch
atomics; the following prog can be loaded:

0: (b7) r1 = 1                        ; R1=1
1: (63) *(u32 *)(r10 -8) = r1         ; R1=1 R10=fp0 fp-8=????1
2: (db) lock *(u64 *)(r10 -8) += r1   ; R1=1 R10=fp0 fp-8=mmmmmmmm
3: (79) r0 = *(u64 *)(r10 -8)         ; R0=scalar() R10=fp0 fp-8=mmmmmmmm
4: (77) r0 >>= 32                     ; R0=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
5: (95) exit

When test run:
	retval=4294967295

Note fp-8 is ????1 at #1, yet it becomes fp-8=mmmmmmmm after the
non-fetching atomic add at #2; hence the high 32 bits are leaked.

Fix by applying the partial load check; after the patch, the
prog is rejected:

Verification failed: Memory Safety: Uninitialized stack read

Reason:
  This rejected read uses 8 bytes at stack offset -8, but byte 4 in that range is uninitialized on
  this path. Programs loaded with CAP_PERFMON can be allowed to read uninitialized stack bytes, but
  this program is being rejected without that allowance.

At:
  ...
      0 | (b7) r1 = 1
      1 | (63) *(u32 *)(r10 -8) = r1
  >>> 2 | (db) lock *(u64 *)(r10 -8) += r1
      3 | (79) r0 = *(u64 *)(r10 -8)
      4 | (77) r0 >>= 32

This affects CAP_BPF only.

Fixes: 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
Signed-off-by: Hao Sun <sunhao.th@gmail.com>

---
 kernel/bpf/verifier.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index fec5a1ae6a4d..68859328c564 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4038,11 +4038,11 @@ static int check_stack_read_fixed_off(struct bpf_verifier_env *env,
 				return -EACCES;
 			}
 
-			if (dst_regno < 0)
-				return 0;
-
 			if (size <= spill_size &&
 			    bpf_stack_narrow_access_ok(off, size, spill_size)) {
+				if (dst_regno < 0)
+					return 0;
+
 				if (env->bpf_capable && size == 4 && spill_size == 4 &&
 				    get_reg_width(reg) <= 32)
 					/* Ensure stack slot has an ID to build a relation
@@ -4084,6 +4084,9 @@ static int check_stack_read_fixed_off(struct bpf_verifier_env *env,
 					return -EACCES;
 				}
 
+				if (dst_regno < 0)
+					return 0;
+
 				if (spill_cnt == size &&
 				    tnum_is_const(reg->var_off) && reg->var_off.value == 0) {
 					__mark_reg_const_zero(env, &state->regs[dst_regno]);
-- 
2.34.1

