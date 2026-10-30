Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793332816;
	b=dS8i05vj3xaqPSbxNPG+qy0YuSAItMqB1uRTNjwzkYfRqTkyKtbjDYgujIJJLV+7l9EW
	 2kiHszi6gYX2rWemuDVN5xcDCAqU2K0ZW20eu7LUwkrcM1Dewh6EDYs+ab9XJk8rjXrSa
	 4KrJWFfnFhqavflBF89r6fgg9Zex3NO+cAe6UeJdRoa8D3k2p2lX0ODZEKsl+e6exE4UA
	 26zE+0/ib9Nb5zYmLAJCt/2pKKgZCuWj/3WufNQHjhZ1wjGWGsKei/M9vDpkO0NIVOET2
	 3Dyz75O2aoPiMZBAdKEnnCQFl/oAK+vCD74+ndds+gVgotYEKAS/23f3tO0hKIPTANQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
	b=pd9NmdZ+Nigs0rtji+8HepN445ji3ec8sB3bScOJe3whnP7xZVhVBi9VhdzGx1JXq75S
	 34DfG0AEJYMtcLdzVbMmMDBhhfSsFO4n9YKAHZMskqjs6Rm/kob/we7oD0uMMGAehW6fn
	 3bDEIVReiEpXQ1/Rz2jMgjRNtFUPe/7KuN/2gDqtjWq83MTQQwh6aNePOGdu6k1+SYqEp
	 4qi4086ORy1wjXCwMqNExSqz95iWJff9qjBOaPbtHWlL2outYFzu4r9X55W8cMVmYfF7k
	 1fSmrR+S53MVQcNys6mG88tKMerZXsx2LjfalnZIwC5kjQJtMqN8Hek0xcx6GTciwyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epqzn++T;
	arc=fail smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F94606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F94606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epqzn++T
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so3327401fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332814; cv=none;
        d=google.com; s=arc-20260327;
        b=GmUp9IgI6/h76e1UXIbDAqFhpSvhRZQWzdDTuhFj80dH1VlVsPCdjWW/ZoedeedUST
         zieR1E4KNhFLAKlsJAkBD8ydI3oXK2cRBcYDLQExmVwDVpDk0QgGkGeZLBM2+2jVSKfI
         6BiJ1GeivQ3YppsTPy3Oe3H+AC5l4QEVDfsPtMCA33QUwJbIdHOQIrKTsVvraIvxMMvI
         FzKS6P4SQAoH0kfQsw88grB5o9QQIZJiCmBRMf/ri57gbtsybiEV7v5YUeSTpA7FHyu7
         EQHrcXS2OEpBVcgGESC3Qe4M4WwOIxWIhSWtGX3Wjahu6itGzWU6M3oKLguJJjfUs84/
         8eOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        fh=WnboeyfxmXsPxfHIuVJHQJaOZCRLyg6qPfSybVfgqxY=;
        b=hQwbURPtaHS5kJwkJlIfsnADzh7aBeE0uymc8DCMinboPiKGVhp4uDammd+K9OnAFb
         AnNL2olgTbNH1+lSjuPSvJkPpBCJn0FfEIASjzfBF9TbjeLLMOmmmtwQRaeuDnoNZoia
         93ELt5dulSbxb6zku05R39mAlJGmGBPQjCsqPw2+pPfaKq74/hczv3CIzHCXSISwuLNV
         fxOVHiUG/Hkt5GEGiOObg3kvHMHI1ga2DmRgsA247DhhYD+5C8PihEOUXayNLrC2K0s4
         jK6Q56+uda81mTkQsukHVNA6/sM49jTQ/DVvgLLeLbIZEfDPeIPaiUfKXQ3VsLBzUvzM
         n+cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332814; x=1793937614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        b=Epqzn++T3ThHlw+p2SQJa62uo0Fu2kGBJpXoBicTYzqSdjSehXr1hZjLptWfjIiXJR
         pJUpUbU4BuEYZm38r0Rw2O4P/EvFduucyYU6TAsyUqtAEiZNP8FI6XujHB+4HA7Gva8J
         0ytOjdd2fQOkdFHaly+iuSq6qh7BnZ3LszMKs61zPfs1e//5PKcBH96VCAf9QKdMhSSL
         ZU9BkOHmvzEd9p2R3kyxcQtWW7Wk+34ySlELX+gmgKH+Ug7cj+hk4nUSd9/3xI00DsW7
         anYJqlX/RjNQdU2NrUFalbMYh2Pa+kT/+EAKIbcHfuQLyvbk4FaG7F9S04mUAUIaClta
         MOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332814; x=1793937614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        b=A8t7XMGBYJss7TbVzNkWtSmjY3BqPw/INK9cnOS5kjlDc/1e08npDpXque88neSbff
         DpFVinI02UNt7Q1yvnb2zRd9432oEGvsQnHO0/VTwl/1kbBXorMpdnIISxxFv9wP66Nn
         e5XQORHKWecdfzD8ENAQ7OjjfmxqTa67d/bchq21/W0HINStJG55pDWg199xY4mxnati
         Gl62V+ytgJN6HREQBfasrHi6zNGbp3WeGXu7PE/QgtuALEZtuM7eN6QGabKOE6eONYp9
         Ed0GXQN+/hucpfjUAVdkQO2n6Pdb0qWpxup32NoHXJrpii2dACMZN0CxJppu8rbBvAOO
         4rag==
X-Forwarded-Encrypted: i=1; AKwUvBymgm6mWmkmPs5cHGYkQGe1H/uYO4qX8OnTdPbG6q6wNSyaoisihM4BZsNgoUY+fGv8KFIRVDx5OT/u81E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3xyMfqwYcvXg+/GF4AV/47Rsk7518PKitOVM98uaTXG8IKFot
	IpQS3p98Om7lI8z9EXbP5EhovtsZn7dLSbRGrNoIHgjJUQTy/hDFjmaICOsR0bS3fyu8xnMe/r3
	jg/P9YKbPk5aQfSX0NcpxF6DfJJxp3H4=
X-Gm-Gg: AYBFou0+zdTnfO0TvSkTTn+RdmrCfYtEh4xaqClqGplZKL0yYiKYvqtxMsGy69nFLA1
	iJqcxuf251u0NbpQldJCXD1P+kG570sSqNlyKbIN/TNbpR6B4YoNQIQjWjp2cuDUJKrm3SEcjHW
	ea0Ah6vYwAh+NVtERQoVGzf3S7BW3SckecKMCVEDz0sC4mYHpzcg3/DLnUBHO/6vLWcJ1xafKXP
	YYnCm7cwG+aKxxDZn04lz8737WcZkI+VgNe1G8Ndr4EXNVuEbHJO6gI7IfRxp+ilbThLAwAesMg
	Sgan5cUmKKQpmCrKi6fsKAdW0FpTOa8HkvskWDet/GgWsIepxt7Arj2b/lE/GTqLeJnL44/DGGY
	ZvyyFsd1y6cir8ggR5e6kEbXaIxNg1qWs7qIgZSeRojWznNFZ4f8HdmTtvNPW4n7thKnYnGSRzt
	+4+dPTaPs88GViDHb86cjQnRcM3/k2mS9TkAI2vhRwaKmmxd9La0Dg
X-Received: by 2002:a2e:bc26:0:b0:3ab:13e6:c351 with SMTP id
 38308e7fff4ca-3acb7966d6fmr1569531fa.2.1793332814462; Thu, 29 Oct 2026
 21:00:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com> <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:00:02 -0400
X-Gm-Features: AclHuK_oJ3s5RUCirMOkhYNov1PNLqWTliY-wAZYDiCbHMWHZpexW4vczKNrsL0
Message-ID: <CAEdQ38EwMT2a09rZMcJDmots55b6bcX0-ARWfb1sC7w7n3VkRg@mail.gmail.com>
Subject: Re: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
 sampling interval
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:02=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> One minor corner case? This  multiplication can overflow for very
> large  sample periods. I guess normal sampling periods are not
> affected, is it worth using overflow-safe multiply/shift to avoid this
> limitation?

Yes, it overflows once the period reaches 2^35. Unlikely, but perf
allows it. v2 uses mul_u64_u32_shr(), and saturates the sum with
check_add_overflow() as well.
