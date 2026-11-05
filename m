Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911481;
	b=HqoLYr6YLE+/varGhwxETzKfJlvSi4Kpi90lVxPBdGDXd107OqZ7FryvZIUY7pxTjmuq
	 ZrpYE4lGiBPMkh+xDqzPRRRUV3ZcVTdFZJybFaPdq79GONjQcYBeT9WxZ1ijKmUgEjJjF
	 gs6nA9rsnq/PQG6RJI6+uoIemE0TCROzHgL5ObA3hWfbBf+4xnzpXRzAKgnkSK7MxCWGP
	 e4/6FWpQop26rXpgNdL7XJt030NfvON9eS3yohPhNN+GLUoL2jT97TN1GZOZXcKYfJxoG
	 LZl57XDug6rcx73ivy6zEOidAaR44v94+i+urTp2gqsYN9K3J/ZGtKFlNtPJeZFp+bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
	b=H6EQqg9sWJkib3KXGW3dnIjGl/terOoWsLhBjVG1gI1O0ykSdCrMcRLQj4hL+OOVVl/R
	 X7jp0lKhBTvPFwgY9/BxBsGiqfVCyEqJg0+lhuo7uTF4mCSoenCrl1aVbReS5uk+/bwaK
	 ZtBy/NobDF7gPtcYX5zSRSo3YOdHlvWEWpL+tVyFS7N+pl1PhB16A2T2uTFrY0W1Tskqh
	 2wEYnBdrRuPJmfSjwP7iDXaoxDW+g+eGj0qamUPVUe6W/Tcnj+1h828iualJT1lQ7mqmi
	 zx5Wpz1Uo82mfJUj4+Qu47pkw2V54JjVidT5DMbS0thAq0dZdP+WH48nBY398k8ViBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=BJ6Vc4Bn;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=BG038r1d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BECC606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BECC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=BJ6Vc4Bn;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=BG038r1d
Received: from pps.filterd (m0354650.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KLFa74124489
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=; b=BJ6V
	c4BntNkjkkda/UZwOgHQybgHbKBTf70duMytHISYD8fZlPFOC7pQ3KtB2H49YY2j
	fA/Xq2vBz9pOEeGea+zUbDowvp595UQSG6MbSz2v/xM17+TQvdbo7pBRazaUJiJF
	xbhLrxm25HQLAewoZEMRYxNz7Ir9g9dh1kKNDAImZI5bBoTGwpAnxLMwyvdr7hM0
	Y1LqB5zisPwRkA1q0WkIIIgb6NSy/ZceUacOrW9yP8GnRvUoY95AedCtDVsnsjPJ
	1sZFqgFcxfwGr+44douE2DzuTzn0AR1M2BMzjUmmXhjrjrFI9rT0YRzd3VJ0jmdf
	JuXa6lwJwR+pJymZ5A==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hrdhfm75n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:44:40 +0000 (GMT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4048584447so64571866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911479; cv=none;
        d=google.com; s=arc-20260327;
        b=X1EEJi7WqyeCuuHThaw3QLcOMG4mL9qmxx2VWqOO1VYeTmK4EPLvq5Nqu1/90Sje69
         npp1Ick89D9ECfPQkLrCBNi7etrswsbrAaKjNu/mxlNYAT9mFMEDH9SiShR/rzF1Uwnt
         rVRQZQ2SRDHt4elhm7IzhaCpe71zMqVut+qqOzJEA50gewe6v6gkSGzNXsNJHaERsJqI
         ZWdyXxCpOwEGDUSzRA5Yn/080gb1gjE0Ecjc8ngDelIs6I/Hx5y3Mttys0wtL3frN+sZ
         YPYpjIUSD71BUXBReZeHSFl1ZLKw2TpZH61PJaQMRdIcBPRP2s6xs0HTMQdYvWKKHXCX
         yy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        fh=W33hf9eHv+D5QyO87E/oZ6fdO+NP52oUeCvCEkJUJjQ=;
        b=UYoJ3Gt90GQ9z7aOVk9o5iLd2r2Q5dJ23ss6DSvDGqYRwMiSe9Yp72cGe071gJT28W
         x/YJaTQJUH7ASGTDX1PEFaMqQRoJIEHxejUdqbdcOXbudNqTPwQfqXbljfNUYZLA1LJ1
         UvRX1HdbPMAY1VHZQCKxul/0Y1esG2kH+k7t/Sa2m/b6TZEK3y0I2/kCOR/pFLPuuaNX
         AoAWo1gPnaObr8VoQ0/fMjUEqA15W4uDgEzdgm2FAN4zKiooN1ODV6HM9RO6UE9qKKZp
         Fz9AZKlju1QvRFozWJvAAOEnwM6qrzSTkZjii85SMxe3D+J+Cq3EQ4Q6ezhyjD1ldkTk
         4hcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793911479; x=1794516279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        b=BG038r1dKbdbDwE9apXSFD1bmbsBgKa2kmPasGPXI569Vpb38f6s379Sd2whmzKLC3
         uALKWgsbCrDc7BwSbrY/4efKL8b1XwtzfUktWNGinx/dH5z3uDEm5g5iEdkWxDgaXILe
         rjhEj4QpHqA8mFDhLsr9h/RYrxo5ra17zCxxX1p8jrYMAyjoa+Z0Y1VKpTww2Ku0QCN4
         HMaWLL+0E+IaIJfoHGEaH8Q9KTIVrgKxXGt+4mY8/qEa8pZkFWiLFtx+sL+d+g6xwkU/
         UCTVr3pNl9inYrdCO8Oza+rFEzs54SLnuhzHhLSFKJufNeyA2WLENvLzRcmMvnYnw18K
         wFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911479; x=1794516279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        b=adXVSsFPIvjt9FgBZDyEGHePC8ls5UhulGg+Xd2+ZHRDeIdT786/5wcwNEgeaawj8Z
         lUPsXV1+/CRTaS+pKrDvHEnYgR+B5nfR1n6ltkbj8c7seHPdEtwNXYpKtCjK7oR2Jafe
         O+M4ghPcL7cuhdtZtnrJb/kQQaJZUtKlvUYZwk2xaNbAZTs2qcQUKAkTl0Gk8TXFsOh5
         /TI//6Acg8Pey+Nv0FJiBa+DFJsUnbBo6j1JmV9FlCz0nk4QQP2iVNG5iB6eCGzb0YgX
         UqTqeQcg/BaWCaFawN7bdK8uHIQ03nqLqHpCC3prjhpiXuNXO3+N2LYCLkwmlIxu/5CP
         xwUA==
X-Forwarded-Encrypted: i=1; AKwUvBxONGPoK4Ns2hq1gauqqXidwh8gLGuDA8t/RciVLJWi2i6ApXYQoOIy5DBMrPuA89Sy7k68L2zHAVYOpis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+5cgAvoEA4Xaqk44XZ2FH7wE9vCs8TnryFIy1NNyzXORmhXlE
	KjzuswdHjYWbAYctJ/sV3+RiCoCC9dO0XQTQcQuuFrQGT/MFDx1+gF85M71J4Cwp4i1kPNLUT0V
	l/cHyHK+5OSqDK4YPJdVG1lnviskk6taD4gDbTN6YNa4qALqhpkdAd0frAKvSR1hqFmKINh/5YX
	zKIYtsDWbycN5nTjRB3laCxynN9996ezAKkYyo5npt
X-Gm-Gg: AYBFou1FuLVUeA8YmzEmw6uDCGZ2yPN73hSJFXLzz1NbtXs1VdUGRN3mcMu0os+Qr27
	+ZRpQZb8rVjATWraDJhh6oopdwx4mbfBFFRocCRR3EV1ZpOEAGucXE2W2hiEOeODqwyw0XBNeyz
	i1l+u/4da588iroFXfVEI322a9b1QRihKGw8io15PX0NDlVZcN0fEwrfjNRo/HvgNB6sdCwX7im
	wdljunS+k8pnpWeyRaynkz+hfoSVAqS/6d7YZU1ULiR4tD5s4p87KYlgB6YJtVmTZCTZIZXxDXD
	Bg==
X-Received: by 2002:a17:907:3d4b:b0:c46:645f:ced7 with SMTP id a640c23a62f3a-c4d3550b4e7mr52051866b.39.1793911479002;
        Thu, 05 Nov 2026 12:44:39 -0800 (PST)
X-Received: by 2002:a17:907:3d4b:b0:c46:645f:ced7 with SMTP id
 a640c23a62f3a-c4d3550b4e7mr52049066b.39.1793911478527; Thu, 05 Nov 2026
 12:44:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
 <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
 <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com> <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>
 <20261105122604.GB1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261105122604.GB1779021@noisy.programming.kicks-ass.net>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 12:44:01 -0800
X-Gm-Features: AclHuK-QbtNDfOwcT6C7zf6IVXI9cH4b0FGauUAGbW7YvuxTYSfVQ8tmszmGMLk
Message-ID: <CAH=2mMBDMjex_oGm3Fj7F2P=kxgh79n7w4+hW7b1UsCCfx8V+w@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Mike Bazov <mikeba@sentinelone.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
        Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX4rirN6/KZjsZ
 HKlqezSob3fwNDeJCWTgqKqRmhq5ZbotcvzkjAu8Hnwhxj+vuiYEe/IWsnmGWw6Qiru81m3vBDY
 hpD5VXZOp9/FQDIMYnG9932EhV1Q7rlxtWjsly2o8eJAbT7HfiTI5P2PkvgF191dsNy8sBIVDvB
 gnieF5Kz51xsPkeckxdkaLs9wmgTDGDo3FYztU+ZHfplbog76H/IdajSIsRpm9rAiaHAKsmPjRa
 XSJjNTn/ZYu6hX15V4c4Z/zQ1jwYo2rSrl5lFSvpEq8fQNP+1RyT+K3CPr6/08YoXR00zrsBPg5
 33jFuHakCPtRjtO67tjVr1mu32fGxcGM9x/8AH1v2uqAPc/XNI1jflUXc6Zwz56bTTEYxhBjQ+e
 msatvqomdvUQElJ4g1feFC0H/V6kLjfptFDFZRhlpZXIm6ExNUzV7OczpNA196XYl/UJGnP0V8Q
 su2TJ2yO9aBc75f4Dsw==
X-Proofpoint-ORIG-GUID: 2I9T7Na3sqC46PRBd8T1Qjo9E2GRz5QR
X-Authority-Analysis: v=2.4 cv=L/6I0OT8 c=1 sm=1 tr=0 ts=6aeceab8 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=t04HzT_fAfAF5W-3wVZy:22 a=JfrnYn6hAAAA:8 a=3KWSPp3VrHgpKBhhfMwA:9
 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX3g97tvu0ZUSs
 L2/o291yPtr7oby2jvoBlgeHcFLO4AlwsiFbv8RwBg5NmxjkwTZvfgxZHZ/OzxxkkWrqrOmC8ib
 rQjASECkB5HmDnJFQxAetVOzCZxbxhVP4xA5cORo+TKsS/9eKKfZ
X-Proofpoint-GUID: 2I9T7Na3sqC46PRBd8T1Qjo9E2GRz5QR
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

On Thu, Nov 5, 2026 at 4:26=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
> This seems weird; your task-B bpf prog would never run due to the
> prog_active thing.

Sorry, I misspoke a bit. The issue we hit was a per-CPU array shared
across different programs. Since prog->active is per program, this
wasn't safe once programs were preempted.

> You've not mentioned your CONFIG_HZ setting? Anyway, something daft like
> the below would make promotion less aggressive (also, clearly I couldn't
> come up with a decent name for the intermediate step :-).

The 7.1.5 system we tested had the below settings. The 7.0.9 system was
the same other than CONFIG_HRTIMER_REARM_DEFERRED.
CONFIG_HRTIMER_REARM_DEFERRED=3Dy
CONFIG_PREEMPT_LAZY=3Dy
CONFIG_PREEMPT_DYNAMIC=3Dy
CONFIG_PREEMPT_RCU=3Dy
CONFIG_HZ_1000=3Dy
CONFIG_HZ=3D1000
CONFIG_SCHED_HRTICK=3Dy

The 7.1.5 system also had these:
$ cat /sys/kernel/debug/sched/preempt
full (lazy)
$ grep -oE '(NO_)?HRTICK(_DL)?' /sys/kernel/debug/sched/features
HRTICK
HRTICK_DL

> I would strongly prefer all BPF programs that attach to known
> preemptible sites to use a per-task recursion counter or something of
> that sort.

I agree; it seems to me with per-task + per-prog tracking, we could have
arbitrary preemption without recursion_misses. The question is how to
implement this efficiently.

> ---
> diff --git a/include/asm-generic/thread_info_tif.h b/include/asm-generic/=
thread_info_tif.h
[...]

We will test this with and without HRTICK on and let you know what it
does to the miss rates.

Thanks,
Martin
