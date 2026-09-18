Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6599509F10
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746083; cv=none; b=bFK9Z0uSEWUv3+m3nZR+V3E5lAshFc45czH1LDJsprcGO6kWo+HDQiTGR9gnmTnj8s73xRb2ZTJa+tddSTHvGh3LMup0ytitNeybwUKLsJZaegcGkDY+czNFc3tmFS4bcVo18pV6zO19j2rrPMrTPc2q8nQxP1FYEO0bxssc+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746083; c=relaxed/simple;
	bh=Y8Xjd/wgp9Nah/nB1NJzJuAt+HbSpuz0SOhh9XDTuUE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=D2HI19OydffOuiL+mSY/o2D12FNDw3JOj/XaXurFu/eDe9n6lu+/icfntoRGtpSgtHDxxojHLYspXZdsQb4+s9EIHbd9xyuSCs4yvI7INGQCARiG7DksMLaw0lljvaTZWrXiacQMhQFczWPTRyj0B64JVRJT0mt1uxiEGQrgHnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxZR7fuW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxZR7fuW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso1541973a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746080; x=1790350880; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTqpDCleJIN6xxRKbyrEn0918f3th1MJEGdTO5nWLlY=;
        b=LxZR7fuWUx34aAAOJWoo2ZQxWcfOqNxAE81QqsJqWZNfWLR4u+J5wiNdmdWp7adXis
         8GIP28cEyRjlmrW8XDx1Hnn6mb8VKqqJVePDJbcVylMLSDjRwLUBYlVqnO+LhlNkXoOO
         2RZoCbdKNKnVfsdabvZFa3DzwtHtBvsxIbDrJiBNRyHlSd2KOSYVqKoMnpuK4cR0/aQb
         9CQIA5LuFx/yvMnfNlejM2zAaHdIPmF88NWQ98HEzULZ7EHivOD858B1UnjuGgy/9G26
         ycNlDLMjwQFUj4hRjH9elsJomXEfCUM5OElUIWmJ+SM5eXqhMTdNIY0RNzPHXO5I6hu4
         g56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746080; x=1790350880;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTqpDCleJIN6xxRKbyrEn0918f3th1MJEGdTO5nWLlY=;
        b=1s1skyvgpUJ2P5L4BYXIQTODxHu60TlfmzjDdyl7XVfEk45GZb/CqRLG52PBG/LuXL
         eMUPW9oonzrW1X43NTcJjQW2bs7bc3W2GxEMDWa2H1uA1sLDii7lCpMVxr26njTUKdsx
         +0NPNCpb/cwyMKz3UFrzDlVIBF0jIvCQwkdwObxOeRFDLs7Zm/TUYXNA91Asl3l/vreK
         6tyICIeyj3y730yLPQveQcWnDUflA6ehAL87N3WFMPH0W3HYkIHtOHhKLAWjsQmWzD9z
         RLftirSY8gxo4m7FpqwQh5FT6ZjgUlLqoPhWRRdZjC7BMwHL+VZenCexS80Lld1VlaCQ
         UqNw==
X-Forwarded-Encrypted: i=1; AKwUvBxxSnNsToWRbStINlZLyHAUTuQcu1+BOiygy9OqsROGf/QRaE4+EuKL0M3ox7/RUT9c+yVLx3o8U3SNG6M=@vger.kernel.org
X-Gm-Message-State: AFuF++ke+LB2I8xsFoxtVNCA2VdJ+jbrqBmr8wRRnu0Gwj2t0XPb8BGk
	vPhJQ8eCYAkfGRHSo3RzxrNzB4bP81duWn8CoLFT0QADK98qPFHlEWiN
X-Gm-Gg: AYBFou0RRjMi40mKYRItsGcG/wL8ApCru6yOnqqJj34PFSpk3TSP3gcCBmMKviNscjp
	86bSELw8vKJd+tQBs/F20kIGgcrdVauAPQvaGvvSPdsLF8ZpOSvv+gyH16iNfsy8nACCxWy0K46
	ezaiAQnZ23Fkf9BYsgNKoZ02t9qvxeQ3dSOJ5i1WpGdRDT9SaIBbhisVyPG32dN6ITgi3eoHnuy
	C07xwUATsAiUhCsqfSXt7I3bU1coj24S9/w0978WTDHoP9fZ+8I7ktEU/173kn154cdfPQBZS+K
	Ff0xDa/64cmSah8hZaHxi49N4TLX7tP32cN+GKlWAdZRR+ge+gDpjM9Xa2tTY+3TlEyfdTFdyxm
	bu/axsqNTen4yH6RwuqFIFKMjfWNZmksbxTqh0W0A1Yr7FSFh4JuEZyEEkctK2z8VBMQfuw7J7J
	cFOD1vUrm+AxQhPa+IJ5tID/gqCJdYEh9B100pwSOFCSobd7NOQcKJ+CNp82J82vhqj0ZCV9T3f
	5acp+jaeIctwATTinjwfKG7t5T8XzMOHMl5356hleaHH5TAkJq3Xai4sZrzBq0KS0OVi4kSJdNt
	ioU0
X-Received: by 2002:a17:907:9703:b0:c26:219f:6f74 with SMTP id a640c23a62f3a-c2a15846232mr267272966b.5.1789746079628;
        Fri, 18 Sep 2026 08:41:19 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08165sm80235266b.22.2026.09.18.08.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:41:18 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 15:41:12 +0000
Message-Id: <DLIK17AFECZV.3U5UY0LYU5Y5O@gmail.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v12 2/2] selftests/bpf: Add memcg async reclaim
 test
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "David Hildenbrand" <david@kernel.org>, "Barry Song"
 <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
In-Reply-To: <44f7fcfafd5f33072dd2b9abc31aa9bf5eacd9bb.1789714023.git.zhuhui@kylinos.cn>
References: <cover.1789714023.git.zhuhui@kylinos.cn> <44f7fcfafd5f33072dd2b9abc31aa9bf5eacd9bb.1789714023.git.zhuhui@kylinos.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 02:58 PM Hui Zhu <hui.zhu@linux.dev> wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> Exercise BPF-driven async proactive reclaim. A BPF program watches the
> refault stats of a memory-pressured cgroup and, once they grow, reclaims
> a second cgroup from a bpf_wq callback through bpf_proactive_reclaim().
> Pass/fail rests on the reclaim counters. The workload timings are a
> benchmark, not a criterion, so they are logged only under
> TEST_MEMCG_ASYNC_RECLAIM_BENCH=1, which also runs a baseline without the
> BPF program, recreating the cgroups in between so both runs start cold.

[...]

> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/config            |   1 +
>  .../bpf/prog_tests/memcg_async_reclaim.c      | 890 ++++++++++++++++++
>  .../selftests/bpf/progs/memcg_async_reclaim.c | 327 +++++++
>  3 files changed, 1218 insertions(+)

1200 lines of selftest for a 20 line kfunc ?
Sorry that's an overkill.


pw-
bot: cr
