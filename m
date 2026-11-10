Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275232;
	b=wkVbg40ynPfTPINBzFh1pYOAbfyEBgFm0ZeH/+IJ9W7Yw8ih8Y/72Tk0hd7AphGZ2Cf5
	 PYwX9njXLftmNZJ6MG9Gl+5iPasoGEXBTh8PUUhOIlhl9WHXsC2bpWXnU3YxWLDLNCzXt
	 xbSYgoiBvqAc8+B+dqHW00Q5QZsAJvc9sk7s7m3Bfp7AKnzNjYbocWKzjgmlKphTmsO5z
	 LJiSHgugQW4NU/H8XwvMyDQl0HpXOjTUF6E20gpz9Z1M4ciWBl5l1DqnTJKQAmHgZpFTA
	 IjCu9WMyaCOH1+0fjR4Mtknz6UH1PG5+CGeS9Q9K6VU8q+rDpaXD+U8Wt6GHmAsjobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LyEW4G6IiaD7cKAlJyc5b0j/vS7ap7Ko3xTmCG8Q3gw=;
	b=klp8qn6V60jlIqdnW5OROsHci7MGHT+mm9V2wiVLiMyV2NCZL9lH+U9tf84s4qHbsIWy
	 0KMJDlnvUs6wnSDp4/oPyWPu/oyq5jrQ2KE1nrn6o3HUjcti9XE9+Q1hXXNDZvckngoGm
	 1Rs93DTDos9hO/s3ZRsLC8HtfXg9lqQENeKa5IKShWx/s7RrIjrQYghNSVvKU81sMjsJV
	 5aI6lrbjzdJAevCNLVHr1XIhIQJEa6tVsq/XbPiOEyDUK6ykFAaU1VeQF2syecOSRcGQa
	 DqEzB/WX+a4RBT2bl+I4dblMP0FtTnl4KXfR6ICeUSPmrSXoYwLX410bpgMy44EuS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N49Pkd+O;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75471606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75471606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N49Pkd+O
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b30477a320so11505887b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275231; x=1794880031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyEW4G6IiaD7cKAlJyc5b0j/vS7ap7Ko3xTmCG8Q3gw=;
        b=N49Pkd+OixlJTVmPYFc2jStULpbOhb67AmZxa2kcb2Jhb1bU7KbCM9ficAmcUTw79y
         BqotC8zhz1gdJSo5TocYeJB4pfMNHX8yTWZBeYbah8JdiJds/+KHzQI8SvvwPHhU7vfO
         2l9WL2t8GTb9TLUus+9eqA81hfaDpchKGMQK4GkpiMV61EjFDxhMHCLow0tbWeKsW2xW
         /uXJJJl4EKL5coY8vcoXGTGGLkR6hCAXdxD9bUw2GWydYxj8lBWk2khcI5cFw2LhXRY6
         Iu6wD/0JwtRWVkM8Ta7RKvfFtXgadUP82w8qo1X9jYJdr8tR0b+i2stcHbIWAeXWe/oQ
         kYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275231; x=1794880031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyEW4G6IiaD7cKAlJyc5b0j/vS7ap7Ko3xTmCG8Q3gw=;
        b=qlYmOwAzZ/ZpvS4VCsit/qGcNACwsgojv5eClhlpEl+9ap88zbSFc1GJ+ytEftQmAU
         4E2aumftNvBiOizWWJQ/9R4VXk4Lw2lfuqXE67DO7dTWSzbKM6u6GWSoAg8m9UA08ISE
         V6XsLgo/Avz4Ddoiy2/TRKH1MELnuKSEBeX3qqjk4fYe+/EgjgXpSzcjc+0tmRmqG2Vo
         F2yu+cyZGuiLGtZOgiXMrwQbDMjyQXzCDrx+aVSBkdnmfmu8aMoMzWWfSi4yy1m6i0q4
         0FeqcTHyFqeBzkwYxsqLxvU5sOgmleKHTtMV7zbS9R3mlf3AyXcMNXuCKBmV40EOE6Wh
         P37A==
X-Forwarded-Encrypted: i=1; AL+hErHLvNWcxP+g17jy6UvSNQzzksgTtLObUTeoa9GHv0iBSURqsH7AgsLWzV/ZV9rC+gNwrxH7RQtCKZDkRWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VG6stYwI1Jwr2nGFgEF7+mWeXOI+Qv1IGMQptzh5J2wuLqvrt
	gr57QwQhbPPqDagJ61iz96n2HBhe3vhesQHYQpCWB6b8O9dI8EsWhq3r
X-Gm-Gg: AYBFou3OLgRpO7EPb8MtSglPtQxs4nHMygYK9Gv3vHjqRRlCSlRBFYh7GGWJK+85TOO
	Rf9I5uxp5g07jjX2njSXCcldO6OpGxzp7jVvPbvQTUju3qJWpHTuNaIYwaYVTq8u6vSomOzEjME
	HB/YzTc96w1BnhcXoEFg2eNS4P8VQAkFwcokfl6PvldjAfveUuWOByKPd7bhOO7OLyPdc+h1WpF
	nVF1XxbXxPvR2Mz4aT0VfRim0CEJJBL5phPGoFGMKZFjN72t+kCspRQScQwoma8a7qNWkpcwsm8
	P7FV/Jw73VGOoOseWBd1zo6k50R8r9KZ20ZscJKG74jirJUmu6GOoTLx3SG83vONbUttjE3iEK3
	0QGARAHt3aVEAky+FbBR6N1hb2BPIb/oAp4BhiqHGLzlV1TZk0HykQvJwaW/FtF0E1i1n3mhpM/
	xOCngE9Hoig1ibfAXjWvtrTJoi+ap7RKI7LOPrVAc3FqN0t2FtyiN+XM9F4GSn3JMriDbd95yjP
	Is+wgWjfKhnJmiCH9QkRsPQivT4wCWkV1790krMymn19e70T1txQ90pl7turVUi4vFrJzrre/BA
	oqg+LUk8qdiaNKDyqj93z8EaEcCEN3CWdZ4idCwZar/BchhgCf75TlI4lcCb38jSLrU42UbCOeM
	iznMHA5fmOg==
X-Received: by 2002:a05:690c:a409:20b0:8b3:2405:6dab with SMTP id 00721157ae682-8b392c4b2b2mr5085867b3.69.1794275231320;
        Mon, 09 Nov 2026 17:47:11 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393408893sm8423327b3.26.2026.11.09.17.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:08 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:03 -0500
Subject: [PATCH 4/8] powerpc/perf: mpc7450: Fill in the L1 data cache
 events
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
Message-Id: <20261109-ppc32-perf-v1-4-a6e8a55b3b48@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=vxh969Hcy9WrgNGikVvry8J80j4iE34/QdKKb/UQT9A=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU8xOlEfF3rij4y+FmuL7owp62wag77+brff8IKlV
 fPqKuM7HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHONRDvDX9nqbTbqlZ
 K2J19eNft0e7U7+/sXCcYvPx+8snCVTzlzlwrD/0C5jjkX4ralP/lyILH4hD9bqfdlH7dLMyUmN
 3dNNnp8iw8A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The L1D row of the cache event table has load and store misses but no
accesses, and nothing for prefetches, so L1-dcache-loads,
L1-dcache-stores and L1-dcache-prefetch-misses are not supported.

The MPC7450 has no L1 data cache access event, so approximate the
accesses with PMC2 select 26 (load instructions completed) and select
20 (store instructions completed, PMC1 or PMC2).  These also count
cache-inhibited accesses.  PMC2 select 38 counts dcbt, dcbtst and dst
line fetches that miss in the L1 data cache.

On a 7448, a loop with one store in every 32 instructions counted
645840841 instructions and 19773839 L1-dcache-stores, about one store
per 33 instructions.

Loads and load misses are both PMC2-only events, so perf multiplexes
L1-dcache-loads and L1-dcache-load-misses when both are requested, and
refuses them in one group.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 9890c87c58ef..27337a03ebde 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -362,9 +362,9 @@ static int mpc7450_generic_events[] = {
  */
 static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
-		[C(OP_READ)] = {	0,		0x225	},
-		[C(OP_WRITE)] = {	0,		0x227	},
-		[C(OP_PREFETCH)] = {	0,		0	},
+		[C(OP_READ)] = {	0x21a,		0x225	},
+		[C(OP_WRITE)] = {	0x014,		0x227	},
+		[C(OP_PREFETCH)] = {	0,		0x226	},
 	},
 	[C(L1I)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x129,		0x115	},

-- 
2.55.0

