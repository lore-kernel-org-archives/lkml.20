Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8A48D87A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607503; cv=none; b=cI9WupVhw7C9HQbfN3Z/ANZUkU4Q4Ag7vIzCPI+bWK8+qFhaLRbPpiD4Z7l1bciXWLRqbV6/2swLzgQpAG6K87TLZb4UvYXrrl7tzTGYJQWUVCkZWSjEz9Nl8dZR8eouhPc3HVOfFUTG0IGTHchmh9WeexEvDp3x6SEEEQTI1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607503; c=relaxed/simple;
	bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FjvEjpQ8XMABp8+v9HX3gcNztGejzknfHZPSRnci98NhC2jbbR6UuUktVnI2a5nn0UcF81MnB7tkm6Ky1nCJZEe2afUbMqE7URLXnzU9ZAtOQtxFJ+mawfXFLqPGw6N6FIV1REA/DDrUVvl2NVMb4du3nDtODLJsmgQyYsbXHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVRCJsT+; arc=none smtp.client-ip=74.125.225.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVRCJsT+"
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-49ced856e8dso8745835e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788607495; x=1789212295; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
        b=cVRCJsT++DQEbybF00xzEUg9Q0yr/sAMl1n/W539qWwn+qjurUIB7QCXrxOjx7ezQI
         NiXTCINcAkpG44PbtbUVZ3fU1CuKM8ydHT4XlD859WRrxk61i6dwzN5S4lql+zWTFGPs
         7KBv0FnOo6wQoiuRBxuzSpyfv6MjKYg/+tHPji/4SNSkjkzBfZXIsNiFukzxyg+QlB8S
         9MLak73a4Zh+5AT2vrfCJ7HwWEYHQKYCDvUNdTOT5V7hIzUx5xtrI2I8W2fuiMtI+hey
         rFQ2O2bDUOIvCAxyyahvLmJSwFWhn2SsY9M1tpdWB3sLRbxff2PNbN9R66Tq1OixxEIC
         fhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607495; x=1789212295;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B91bvzotjFUcMw1qyxQVrgtsCG6I0XEyZUoF6bsDVB0=;
        b=lnbMFDEW862cTMzsAUSa0/VSZbnzxBdqBzta0veCyt49pNvxs+srGcUWPFjP5lC47+
         OdH1a4A5w4P61jao0341/rm7lhska5uj/kPG7TJ48hOONHTUShYm3eeed9kKQ2hAfUCG
         UWjc/sovLqgcHRmhh1M9NERU5cpq1FgWsk4yLkDCg3fXvNaBtGqfRZ4TzQNTQJ+CriFs
         AImXxJ4EHruuxZz5KuIpaGRQRVe3e8y9syk0/V4lhY5RE+9Q4jg0QbQwy45nO28rmu8r
         ioKNdqF67UI18NVnXMqRsZSkgSmUE/Ahky+ofQrYpdu29ZVqpB7AOOetJnnVP7v3/3av
         0xbA==
X-Forwarded-Encrypted: i=1; AKwUvBxDbEa7l82VRLuLF2dJMYaKo15kyfkkpV++FNdrBffwHbxewDolv+Y3xSsQyrkzF57MIuNTkOe6czjBvxY=@vger.kernel.org
X-Gm-Message-State: AFuF++nR1n1UnlHC2+OPWU6xPwU8Ko85qzhRS+PKnADpf5vphHd180vL
	Jx03G7quRbcm63L9revN7aJJebXbuH3TIzMc7KN5578yTmVT4S9uTrco
X-Gm-Gg: AYBFou1L8eXCa29W9AoPddb8W9bgeJpbl5Hab14ZQcJ2YYdKRWXY6VT5I/04V5FtWv9
	wyLLZjU10IuI0UZBdACPHo06f/0eKAAgEuv+SeGmmiStVHHcbfwB47yiiMbWfpoWfjJQNtC76Vq
	72dg0zhL0ehy5jmq0LyiKMLATR99cj7KoRExtEFmF5KE4anJ5pB9zAriizZ0Im+B4bBYnX5gYMt
	PfkUNe/LxjREoLj4+N7CTCNemBZNyvYDeZJJKRHoVKFqOvySHf4ErVmah9FFhGx5E4/UVALpmVC
	W4y2AUVRCWca+DMQ1Yq4nqUmgyqt9gf4S8HF+EJFDctWCT7Ep/finrEvTcR2Xqn5Uetdot3Zlfo
	nrUyHGDcNTLjnpA+shamVOVLMw6yUhy++fpOJ6PymXq7CdqeZj2wmWEv7BdX9nmlnjHyqNvyQje
	heWvLjz7AFWxhycoBhEDMgX7OyUkij+kcQiU0REQfA4AuatnoBIrUACeYySMRJ8VFgDcw7Nj004
	Tg3N1poAetG4Uu/nboCkxnOMiTbXQVUk+O7sGfGrdsge1jWX0wBb8Ikl30Wy58DEQr6gmC01LOB
	FmPY3lJWaRNIUIl6xr4frgINjac=
X-Received: by 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr268925475e9.5.1788607495209;
        Sat, 05 Sep 2026 04:24:55 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm225255635e9.8.2026.09.05.04.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 04:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 13:24:53 +0200
Message-Id: <DL7CFVDSDV92.1VPGNHDCKVVIV@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah
 Khan" <shuah@kernel.org>, "Barry Song" <baohua@kernel.org>, "Geliang Tang"
 <geliang@kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v7 0/2] bpf: BPF-driven proactive memcg reclaim
X-Mailer: aerc 0.21.0
References: <cover.1788516769.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1788516769.git.zhuhui@kylinos.cn>

On Fri Sep 4, 2026 at 12:20 PM CEST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> BPF programs can observe memory pressure on a cgroup (e.g. refault
> stats via bpf_mem_cgroup_page_state()), but cannot act on it:
> triggering reclaim on a chosen cgroup requires writing to
> memory.reclaim, which BPF cannot do. This series adds
> bpf_proactive_reclaim(), a sleepable kfunc performing one proactive
> reclaim pass on a target memcg, so when and how hard to reclaim is
> BPF policy rather than hard-coded thresholds.
>
> The kfunc is restricted to BPF_PROG_TYPE_SYSCALL so that reclaim
> always runs in a clean process context: generic sleepable programs
> may execute with filesystem locks held or in NOFS/NOIO contexts,
> where the reclaim path could deadlock in filesystem shrinkers. The
> bpf_wq and task_work callbacks of a SYSCALL program keep its program
> type and run in process context, so reclaim work can still be queued
> asynchronously through them, as the selftest does with bpf_wq.
>
> The use case we are looking at is protecting high-priority workloads:
> a BPF program monitors the state of a high-priority cgroup and, when
> it degrades (e.g. PSI rises or refaults increase, as in the
> selftest), asynchronously reclaims memory from low-priority cgroups
> via bpf_wq and bpf_proactive_reclaim(), giving the pressured cgroup
> more free pages.
>
> Another use case: several vendor-maintained kernels carry private
> implementations that trigger asynchronous reclaim when a memcg enters
> a certain state. These exist for historical and partly psychological
> reasons, but the underlying demand is real. We expect BPF-driven
> proactive reclaim, combined with the BPF hooks for the memory
> controller currently under discussion and development, to serve these
> needs in mainline, reducing kernel fragmentation and improving kernel
> maintainability.

From BPF perspective this looks ok to me. I saw you dropped the swappiness
argument, what happened there? I thought we agreed to just include it in th=
e
kfunc now. Did something change?
