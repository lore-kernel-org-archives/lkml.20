Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275226;
	b=4OpQECsukY37W7/gF8TejbvW4PIIqbNjXOVykMgtaHcnM/xWq0UohLTD78dQWtM1w0k7
	 mUFs/u5rDelM4NU+rlA9TIx7bG6a3toWCqnij3WkWWOXA1fMKix6b8cWj3IFLAtco79tt
	 iyn+ahqwi21YWy3fCFm6Y6yuneNzPHCpdCcBMS/MhcfVmhlZpZqHALPLtuNjQk6UUZkfZ
	 wdfqXAZR0ahSlV9x2qYavZzRlljt1mVfR4MTqZc22ikKbAc+rDhR9uYn5BUtoebs05YH+
	 CNcLHYNFNCSKDExN0vr9PZ72OQrITui32CF9/oJl55udvK0SstOUPTQQbefXetqL0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UWasGv2YzuvIDNMrPYhW6hMTbdrTiz1RXd1lac2gzkg=;
	b=kORNMnvtqhoMBljE7In0iMkBK76WTszuScEVieYICo9Q9O5snH4QTNqsvRSSmTfKX+lp
	 wAVJeVKxPSJNcyRqTdhhbKCyxy9G5AyGKdgN9JL8vYTaDX6org9bu6MgoPWG/1bGMztHd
	 vCx+L/X3AX1Ggie1HcLuBcr11nfh+xElNFVw+bYEiUdLZ/ogDlMsmnCBKfeY1IxjWso9r
	 RCBFJXTiSu1pwl9fJSAKVghjt1XjpAuuQvaU+ASwN3ZFk4sdsZbAVKA1BSQtxwohDD1SS
	 AhuObtKUCOUSUc9HwxlCaFF8FPKFN15djH/cSJO6mjq7/P4inr9hUL22ukVUhOvkTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzHe2uqL;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FF60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112FF60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzHe2uqL
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b32bbd39d5so12064127b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275225; x=1794880025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWasGv2YzuvIDNMrPYhW6hMTbdrTiz1RXd1lac2gzkg=;
        b=GzHe2uqLlfmU5TGKBWD2ZX6hB/fGcVJv2ZzyVN4LZdkDXlU0yKwNiefA+eHtbRkg1h
         70jb03AKSSyMAeahuteMxiWv7H3P9wCeRlsluuT9GrsHCEkF8oYCjjM+94I21SSv9TMi
         DXl15hrZ8vlyLKDlJ9tLKapVn6ZsU1iwMgxzpEV6tWGMpQsnowNW08WFdCnLwFoQpbaX
         E8L04xtl4QuMZ6OmCYKLDEGN/87gK1cZlhvl6+LOfb0pGkUCR7oGG7UuvqePf2rbBjb6
         8eCPeue8YSs9J6KSL7bIcC8oR9lh2NGOLK1xUViJm0di9uhxjBgwXfXUiqUIYfl1+2k3
         I4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275225; x=1794880025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWasGv2YzuvIDNMrPYhW6hMTbdrTiz1RXd1lac2gzkg=;
        b=1vhNSEJcskcH4V4NwlpUWL/Q5rYoLuZOwb/SE3YNW53I1StPTOF+HHtQtqwMQ2+80k
         f1bnABx8XXbJ12n0vJBoBObMe8GnY3bZ6GKQPtVQ64kPN3o1F6mzqhJy2Dl+evZsOb8z
         RGmPLJPHMblcE612uxwUrYsoqnfA3H7BCsxrWGn2mjRpdRfa2rf/UiVorCyoqye1uYB1
         /QwFbrYUexSjT28C/qHJITALmidvO/id+HDaHJJLBKL6E6tyeAgotpYjwbC1BZLGni67
         F3J1X0B3Klhgc5+1TEWDb74eATv3/udJ9yKOfFbrxpfDUqSZ6Zvc74hgL1s5s+GknT65
         /LWw==
X-Forwarded-Encrypted: i=1; AL+hErGVw7ysO9EdgvfmW/zs/AKzdyUfNlrkm4ldP2l62rmOdvGousma8M5PtoyUwrRpIlDoEjJtnp1VEczmA9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B1cJQ7srpZX7vHMGfBKtJa6ZXoK1WOzsdkCgKqqgBY/HN3Gbw
	D0ca/t+RuEjOQJgxgeho+dkQPauUMXsKCUTBchv6fcd8Ha1AyPUYp6TP
X-Gm-Gg: AYBFou0AgME7NOPyN/E/GAI9/m9gGPCsUpDGm0dcLRpwj3Vlfqc52HcqBi7eGD5gPbA
	wHg0E3Fd0mJvSIujNv6C1t8tSog+CK/SAk5GRSJxSK8zutdjL0LRIxXaqVbL1vH21IrUHpepOtc
	0KCey1qfHvM1d6rSEuWZB3TIUn0v1K58Bw7jOnug75DAt8+9LT7Xj08sMTjJLQyGzWR1Zxp4aGJ
	72fcaqfJtPE48QCOXd4He9gWD/HPlRkfORuDc09LiR/IG3r2tS3DJKDIhdT9yb0AhdePyJQLAfH
	/SQmdkR8naLu4Cqzn16ju+b52resR/4YdYH2/jqtCqcaJZeEtMfsYKQukOtrSgUITSfTOrxWA/6
	5CK8Lj9cF7M5lDK6q0DuVcYY6slm3sSDTL4Uo4kDiOoIzO39KfSc/IxQdzzn9bobraYweA69O+H
	JQhgeOAAnJVIkmSIQd6YtM2K75pxXT0VLjL1Dn4rSbUBsE3T8f2DaoKoZksWRpmNwn7SyyfIjE3
	emdmkRvv2FHnUMIZuAzggfnXxsli3XZ/lzNrBMVAyknUlpn+BRNLcZYH2kUFB4JPBO6gkzkjt41
	BNRqJ2OQf0TtMR3pPUpBZv7yJFUo23XbqUrfIQ4sHGpOr85gDQfZdLuFGBgiNEw58PPP3s1S/BW
	ld8dzmgabS2q+HOEp+yd3MhfNYJTC8ok=
X-Received: by 2002:a05:690c:698b:b0:8b3:398e:8004 with SMTP id 00721157ae682-8b39297d3b9mr8600917b3.20.1794275224989;
        Mon, 09 Nov 2026 17:47:04 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bf84sm8634687b3.3.2026.11.09.17.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:04 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:01 -0500
Subject: [PATCH 2/8] powerpc/perf: mpc7450: Event 0x634 counts L2
 prefetches, not L1I
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ppc32-perf-v1-2-a6e8a55b3b48@gmail.com>
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=TwlNAcp6eC0hJG+v2/kOLi3vElXUnRdKI+S9gxs5PKI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU9hd/Dtkpw88Tpj9D6m3TdNn3lZyG9ZnGfVtbhEd
 NltLrv2jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmUy8jw/2q6LwdX6
 5efnRlk4O3xGPtqVsrPrHWuEl2hD5S2tv8JIKRoX29p9NxxRpT/ZpITvnZE8vuPGjgivl1YNdUh
 yRnra2TOAE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The cache event table maps L1-icache-prefetches to 0x634, PMC6 select
52.  The manual (MPC7450UM Rev. 5, Table 11-14) calls that event
"Prefetch engine request" and says it "counts new prefetches allocated
in the prefetch unit".  It is the first of six events about the L2
prefetch engine (selects 52-57), and the MPC7450 has no instruction
cache prefetch event.

On a 7448, a pointer chase over 64-byte nodes counts r634 at 0.00 per
load when the working set fits in the 1 MB L2, and at 1.00 per load,
one per L2 demand miss, at 4 MB.

The engine starts a prefetch only when an access misses in every cache,
fetches from the bus, and also fills the L3 if there is one (section
3.6.3.2), so it is a last-level prefetch with or without an L3.  Report
it as LL-prefetches, and L1-icache-prefetches as not supported.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 564f6dac3a00..5a882d934645 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -370,12 +370,12 @@ static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1I)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x129,		0x115	},
 		[C(OP_WRITE)] = {	-1,		-1	},
-		[C(OP_PREFETCH)] = {	0x634,		0	},
+		[C(OP_PREFETCH)] = {	0,		0	},
 	},
 	[C(LL)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0,		0	},
 		[C(OP_WRITE)] = {	0,		0	},
-		[C(OP_PREFETCH)] = {	0,		0	},
+		[C(OP_PREFETCH)] = {	0x634,		0	},
 	},
 	[C(DTLB)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0,		0x312	},

-- 
2.55.0

