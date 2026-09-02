Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E8489866
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352274; cv=none; b=lBaD0wuPGDacuv0MJ25HkDVdTZzmVDiKpWAbAxiEBk+k4anmQ/D0nvEkXyuI4IFtqDMN6RgtgDViiZviumJiJdxzjA/Tt3Mi0PwOPAHOfIzeer3Ecn/pub4+3qmOEgvnYSlySjWnncWNdn9t7VmaBrOqMhdlAKN8sehPE2FsTBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352274; c=relaxed/simple;
	bh=5yEV4XnolTA4d1Bxi7KrwZxByDjfSzCc7FhIPl9sFLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OL4GyajFShAa1Vmj4vpOUEgwg2Q6WDiV0pC3TGSBDiRl5N5c4COluer31d6qRuVrmaktr3adXptFawtDGcbudC8BCzx8ts7iXluOznEHIgd/RdT5lFF8v6xuk+BVwgYNhy1qetecqFZLJg1Vhl3j203inzPIblb90tz/guy5OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDXNqA4g; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDXNqA4g"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c207cb16cf5so130853566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352271; x=1788957071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TI6pUAVn6iqJfgwPq0UA4Qme1N3xxMZKcN9f4ke5Y84=;
        b=WDXNqA4gKHZ8fvHAhapFVFGqnYhMhs6wjQ8ZBYfa8Hlnr8Q8d7EtCqyE8/V0g8Hxn5
         sABRD4+MkTbtGiZX1x9IsJ1Hm0XoFuhKoXaHSCDFZC0ZMYjvTTfkClxD6K+CshpgtyVv
         rfkD1/shnCAAle7h5qjVLD7bIj1FLC+2eIuGuUMP6Qj+aHqZWs1Culaj4EKUSwE2mchk
         rUWQ/0akLqViDQ4VDZU8clelVpP6bFbF/ITRDlTRz+x8X36AnR008tuSgvssP3nFR327
         Kx6t40Q/1YlLLgB/LybnV5KSkfSdrf/0ko80hYDhF2A4n7eLqzwq3DJTtWyLPWRQNdvb
         8LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352271; x=1788957071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TI6pUAVn6iqJfgwPq0UA4Qme1N3xxMZKcN9f4ke5Y84=;
        b=LX153uTo/Bm712Ki+PJoJB6iPH+I9TvYXwxMoRH/QsjpiBow4pqSRRd4hAFlt6g7TU
         GuotitMCMuk6pdklSz/XKUe1ywAIQOmenakF1hmeyOlb2Qd9zse6EYcjiHgo5TYM7wOy
         sAccqnoVMk1IFw0CX8NxpBFpjAZcr64y4TtxzZ1iHiynCm8IBnyVFODGOtY+BX2IIlld
         IH2kDwUhZNsKmbG8iZUKOeszM1d05+jOVCH7DxsaUDz7gzEHz87ckYDXRh4JE89pj4dX
         XGNkNBKZV7YTZ4ZpBP+ZlGAjU7IgYji44wVdkpwNwsVm7szAZHmlBk/P+qxp+2kz9TcS
         vF6A==
X-Forwarded-Encrypted: i=1; AKwUvBxZCflkj4NXMYlp5yDkcWEPTj/VdcN2YsvU6E7I1ZqV3cMuY8mg0s5aPEcgaSvUC1YFFblxtoaWPmHXmuU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQYi/3z5yFCJTxrPARYrpYKRNGChNShIMTeLQmYIlaI95yTAc4
	VqKqK3CiRkXSFHZA+nf57wtVqO39mJSWlufefO6rzC5K4dVDta9ounumC4Gs
X-Gm-Gg: AYBFou3j95vnatfxhYLi/m2XBS/Wc6ipufQPD1RupwcwN7pQnb30zr6drDwd0adMlfx
	tjRBJiqnbfGMF8JtkMvSmLv24fzb/f3Wr77yWbkotgc96xc68jwglA/SGDLylpSuqvmz0bAygRP
	p640okkPFdWWzzctjC5qYWDY1dKHLwMc4Cyu1nr3Fuk5SV4Sf9kKUV4Z6J+xOkKS8Ixl3wj8CR9
	EYLU13TP5/e0PaBi+APwNJs+NLiCsWJYEOtBhKLsqtQbGCuMNrK7ebyfr2P/nnZbdiffmvK9qic
	zEOTv6JlBnYDdmjHKQ1xRSG/TZULx+xGQKLceMna8zVibe/VpnOYkydZFfXBXdHprgPVuA1T8YK
	WXs27RxupsKTKn7vd3KZlKtGKLlYVLpPFoJhPDfLV1aksBoaVExw8R0WcxXC7yYoHKK1iEXA+ZQ
	ZhjLisoIBkDrH+mLGmjisA3d5ewqVkRw==
X-Received: by 2002:a05:600c:3e10:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49ce57fe002mr86704775e9.4.1788352243385;
        Wed, 02 Sep 2026 05:30:43 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b401sm145048515e9.3.2026.09.02.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:30:41 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Mahesh Bandewar <maheshb@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net v4] net: reduce XMIT_RECURSION_LIMIT under KASAN
Date: Wed,  2 Sep 2026 12:30:40 +0000
Message-ID: <20260902123040.2172805-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727200454.4048141-1-tristmd@gmail.com>
References: <20260727200454.4048141-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

Virtual network devices (ipvlan, macvlan, bonding) can enter legitimate
transmit recursion when combined with packet forwarding configurations
such as IPVS NAT.  The existing XMIT_RECURSION_LIMIT (8) in
__dev_queue_xmit() detects and breaks these loops, but the allowed
depth is too high for KASAN-instrumented kernels: each recursion level
consumes significantly more stack due to KASAN inline instrumentation,
and the cumulative usage overflows the kernel stack before the limit
fires.

On x86_64, CONFIG_KASAN_GENERIC doubles THREAD_SIZE from 16KB to 32KB
(KASAN_STACK_ORDER=1), but KASAN per-access checks inflate individual
function frames by roughly 2-3x.  For an ipvlan L3 + IPVS NAT routing
loop, objdump measurements on a non-KASAN kernel show ~1.4KB of stack
consumed per recursion level (across 17 functions from __dev_queue_xmit
through the full IP output path and back).  At KASAN ~2.3x inflation
factor that becomes ~3.3KB per level.  Eight levels -- the current
limit -- consume ~26KB plus the initial call chain (~8KB), which
exceeds the 32KB KASAN stack.  The overflow hits the VMAP_STACK guard
page and causes a non-recoverable kernel panic (BUG: stack guard page
was hit).

On non-KASAN kernels the same loop is safely caught by the existing
limit: the "Dead loop on virtual device" message fires and the packet
is dropped without any stack overflow.

Reduce XMIT_RECURSION_LIMIT to 4 when CONFIG_KASAN is enabled.

The deepest legitimate transmit recursion observed in the kernel
selftests is 5 levels of __dev_queue_xmit nesting, in VXLAN symmetric
routing topologies with VRF (vxlan_symmetric, vxlan_asymmetric):

  __dev_queue_xmit(vrf)             depth 1
    __dev_queue_xmit(vlan-svi)      depth 2
      __dev_queue_xmit(bridge)      depth 3
        __dev_queue_xmit(vxlan)     depth 4
          __dev_queue_xmit(veth)    depth 5

Since the recursion check fires when the counter exceeds the limit
(strictly greater than), a limit of 4 permits 5 levels of nesting
while blocking the 6th.  At ~3.3KB per level, five levels consume
~16.5KB; combined with the ~8KB initial call chain, total usage is
~24.5KB -- well within the 32KB KASAN stack with ~7.5KB of margin.

A limit of 3 (v2/v3 of this patch) allows only 4 levels, which broke
the VXLAN symmetric selftests: the 5th __dev_queue_xmit call was
incorrectly dropped, as reported by Jakub Kicinski and the kernel test
robot.

The recursion path triggering this is:

  __dev_queue_xmit -> dev_hard_start_xmit -> ipvlan_start_xmit
  -> ipvlan_queue_xmit -> ipvlan_process_outbound -> ip_local_out
  -> nf_hook (IPVS) -> ip_vs_in_hook -> ip_vs_nat_xmit -> ip_output
  -> ip_finish_output2 -> neigh_resolve_output -> __dev_queue_xmit

Tested:
  - KASAN kernel (6.8.12 x86_64): panic before fix, "Dead loop"
    drop after fix (at recursion level 4 instead of 8).
  - Non-KASAN kernel (6.8.12 x86_64): "Dead loop" drop both before
    and after fix (no behavior change for production kernels).
  - Measured max __dev_queue_xmit nesting depth via bpftrace in a
    VXLAN symmetric cross-VLAN topology (VRF + VLAN + bridge + VXLAN +
    veth underlay): 5 levels, confirming limit=4 is sufficient.

Fixes: 2ad7bf363841 ("ipvlan: Initial check-in of the IPVLAN driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v4: Raise the KASAN limit from 3 to 4 after investigating the recursion
    depth of VXLAN symmetric forwarding selftests.  Measured max nesting
    depth of 5 via bpftrace (VRF + VLAN + bridge + VXLAN + underlay),
    which requires limit >= 4.  Limit 3 (v2/v3) incorrectly dropped the
    5th call, breaking cross-VLAN tests, as reported by Jakub Kicinski
    and the kernel test robot.

v3: Resend as new thread per Jakub Kicinski request (no code change
    from v2).

v2: Switch from per-driver recursion guard in ipvlan_core.c to
    reducing the global XMIT_RECURSION_LIMIT under CONFIG_KASAN,
    as suggested by Eric Dumazet.
    https://lore.kernel.org/20260711204700.1760374-1-tristmd@gmail.com

v1: https://lore.kernel.org/20260711134732.1385563-1-tristmd@gmail.com
 include/linux/netdevice.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 87cafc932e9e6..3ccd1e65bcd9e 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3669,7 +3669,11 @@ struct page_pool_bh {
 };
 DECLARE_PER_CPU(struct page_pool_bh, system_page_pool);
 
+#ifdef CONFIG_KASAN
+#define XMIT_RECURSION_LIMIT	4
+#else
 #define XMIT_RECURSION_LIMIT	8
+#endif
 
 #ifndef CONFIG_PREEMPT_RT
 static inline int dev_recursion_level(void)
-- 
2.47.3

