Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275236;
	b=Io0W1oPcHIJRji62JdIE7cMsOJYRbzjsas4kMrlyHO01uy3BGUXtgUIGs0TIp6CxJ74P
	 1ub0wmUzqoqL5NuFKNcFOIbRZs7UQd0IK3jXHexn5aQ4RL3TLD2mxv5iz0Kcem+vX5ZSg
	 pHraOQuNuv8WJfN/sp2JKVT1GXs62tZ7vZ7ceuQGBsoMC2mAuAdDI7gnd4Ed7aWVmfeCV
	 I3cgc4lfskJiMRcdI9X5NFMY0PD3752ckgYWTYAlg4ubFT17htO1RW+5PKjLG0wYsXNqm
	 bGVcilzxmzc9+Lw6f12iK2msQ4zvW6xepzpq2P9vj+HZC0er32Hr3qtrHBoF80xEt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Bpjh/UZ7eC+Zc+giAfbKZXsslkVQ56T637TBtlmPJ+o=;
	b=lId+s1MWcQ2EFOqOkMCXbF9HpoMDqA2nulHSk1nmfMupIiZjrETByvcxVuJtnSjgUKA8
	 O7AI3v4it0JkiUqHC+uFrlojYDCigpEBuy1N0oCZLkAT4lffeSemQu2ChxKfydZZiEBha
	 YNCXtD225T6oHBv0GSi5tt8PDFakZyFEuv6eFD/C/B7cqBHhvGv4ud1iKAe6i2A0NFMP3
	 opFYQ1JNVqraDeozheWDtIV6mZnLeMabh5K+CVialYb7GSlE2PfGI5cZNEYn7pB0PAF8R
	 G5X3UEMQ2UmaceZR+sY6UjgC5+9XLCIjTSfN4u62nMvqN4JLElFTp7xl5x9pTrxPSBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIKL9Igh;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409160A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3409160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIKL9Igh
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso2000719d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275235; x=1794880035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bpjh/UZ7eC+Zc+giAfbKZXsslkVQ56T637TBtlmPJ+o=;
        b=SIKL9IghVLQgnpbTEMUZvLLehWIMGi+cfwyEBDFhyldqdICLm53zaY/orCiVErAyxG
         HrQv1mKroMT2mxfhRKH7YjoiA0hGSYwbDlIVcUVdmas0M/m2L4ZqZPdgXFC8ayof0+uq
         g7qXWqWJ43pG1I9+7GHh9C4DB2xIOcNmw2MzG8CA5TOqnRZu4r1R6MyBw5vFhorZe52n
         GkpRoaKeD1PvfafGThsXQwGmEXFlzDr2bIAOxUgj6fT84Vr81JWRPMCipWEP4G8GOtmV
         Ey9Ur8bVeTQzCFgVLwjLtxVZkzu705Prf5GNOETXhpCgRTYCOPwamiaZ34rHFG96aYcV
         bEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275235; x=1794880035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bpjh/UZ7eC+Zc+giAfbKZXsslkVQ56T637TBtlmPJ+o=;
        b=HgKOxICffBOqB92OuNX2WAIyjV5s6NKEJPU28FLryfbn09WgR7J+vvyFvojQsPBEqs
         xOjB77CKLvgbtKOTqcLR1HqwNjiLnPF3la7U5t1RubfCfazahrVjoqeUe9/4PMId26lW
         PdHlFRdtWe2GtTCtzESAMgm2jLyaLfmwucV1PNh2FNqzAX3DNx07g+k3xvw0oDZjv/2y
         QMg0VC4q5IoItwc7JP/hMwsV3yI3o39Nay+rZX3VMk0OUaStTrUjy72cqmZQQD+9m2yx
         benmBhp/p3mpBNtyhHC3/mexn3DsSpJkyG2WYGuAons9pA8j2f3M0HKsczF6WYfYJQZw
         85wg==
X-Forwarded-Encrypted: i=1; AL+hErGIpWx04w3KBu5zKxaaDCi87ygv6gnQGcyFtPZwEOzT7Fua32CZR4piNRWyIhqPo7XsE4DnLxFVJ2eP9KE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ma3x9X66Z7ly82uzigOkRltRoyDlKaXFcjt46AZCeH6M8p3H6
	TL7QrmM6ieDGRkbf8h0llw+6oH3z0mSVPQIVHSSgg+sCFhecsmlLwRGS
X-Gm-Gg: AYBFou2QfU/0NYBZx2DjTAvTRSFHEOiEs1egdkcX44HsWd3D3LbpSyFStRHByfmmMTk
	tkCg0Wk/JCxSr2nS4cpELPg+XmETVH17/+AMgs7aE+Ya0p6UgQlieyg/IHzVebYZ076SsU35NfK
	0HdNjMD4X64OVcOEF9iutqBlwOsAmcoOB6ttgoMh09pyLfa1EY1naD/STnQUysbh9t4dTqInpG4
	cunTiaxR0p18Kgecoy4yhWG47wRi3OCv2SiJf6Wyiroe9MbUJdHYhcI8FEGhdBHx2j75AMlhCZq
	fkliQpRKc5ix48neYVpkU2NsuCxYP+yfEhew68w2GnQcUAmtHh0ISwp+tNyb6CflXlCpt/5tNog
	45OWyt1JUkqVz81kTrPYbEqRupNRukXMW0nBeMJgqXJf0kR/zomFhJrSgduvBcvheyRCoji2vKf
	/hbeThcEWnZwcj0tWHFYwn3mLauO/Ugvn6lDU1ZNTb2F5dKLOBKn/UJ3fXejlCUAYkOVbdUcIoc
	YEu0Ro15BuWf79Q/2DtvUSaXbs97ARbLcPOmfhDwfB49n4oS4zPGDxslo4UbdNrLda9ULNRwZBn
	wZ5SJ8ufwBokZT6IH3YKbP1DUa1ze/UJpAWgScXwYXym0MwTYoxwYgfVio4OXq9yMqEJBK/6A2c
	Y4idrxpNBrw==
X-Received: by 2002:a05:690e:c82:b0:679:9afd:c0c7 with SMTP id 956f58d0204a3-67c5680aef1mr689248d50.126.1794275235051;
        Mon, 09 Nov 2026 17:47:15 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933e0d01sm8429667b3.22.2026.11.09.17.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:14 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:05 -0500
Subject: [PATCH 6/8] powerpc/perf: mpc7450: Export the event format in
 sysfs
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
Message-Id: <20261109-ppc32-perf-v1-6-a6e8a55b3b48@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=L7btMy1nXBY1bg9NMBkHPlpV09dJ8lMXLGy4hYCTfyY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU+5d/ne7k/x6j5Z3dE75bjXuh0Jeuf/1l2q4r6Wi
 sz3aZlRHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNewVGht49aXyL+8
 2uxjx+vydBfe7Rr9FTzm3kOX4x8YhESdviaTcZ/unYL77gpHX9v/DLyNqD9Vt49n9TMrgmu21rj
 n2p0ZKfN7gB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The MPC7450 PMU has no format/ directory, so perf can take its events
only as raw codes, and cannot set the threshold by name.

Describe the fields of the event code: the PMC select (bits 0-6), the
PMC (bits 8-10), the threshold (bits 12-17) and the threshold multiplier
(bit 18).  A threshold event can then be written as, e.g.,
cpu/event=0x12b,thresh=20/.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index b2fe977cea16..9bed5c238f45 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -398,6 +398,31 @@ static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	},
 };
 
+PMU_FORMAT_ATTR(event,		"config:0-18");
+PMU_FORMAT_ATTR(pmcsel,		"config:0-6");
+PMU_FORMAT_ATTR(pmc,		"config:8-10");
+PMU_FORMAT_ATTR(thresh,		"config:12-17");
+PMU_FORMAT_ATTR(thresh_mult,	"config:18");
+
+static struct attribute *mpc7450_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	&format_attr_pmcsel.attr,
+	&format_attr_pmc.attr,
+	&format_attr_thresh.attr,
+	&format_attr_thresh_mult.attr,
+	NULL,
+};
+
+static const struct attribute_group mpc7450_pmu_format_group = {
+	.name = "format",
+	.attrs = mpc7450_pmu_format_attr,
+};
+
+static const struct attribute_group *mpc7450_pmu_attr_groups[] = {
+	&mpc7450_pmu_format_group,
+	NULL,
+};
+
 struct power_pmu mpc7450_pmu = {
 	.name			= "MPC7450 family",
 	.n_counter		= N_COUNTER,
@@ -411,6 +436,7 @@ struct power_pmu mpc7450_pmu = {
 	.n_generic		= ARRAY_SIZE(mpc7450_generic_events),
 	.generic_events		= mpc7450_generic_events,
 	.cache_events		= &mpc7450_cache_events,
+	.attr_groups		= mpc7450_pmu_attr_groups,
 };
 
 static int __init init_mpc7450_pmu(void)

-- 
2.55.0

