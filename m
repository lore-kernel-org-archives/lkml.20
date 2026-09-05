Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596643B42EC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607424; cv=none; b=TKQn9PDCfmxPsptR3YqdiuL1sOsX1W1U8kgmJmeP5AO8816hi4LBx7BNBZGsgFiFxnjShdn02YObVDrRdeg68DNUgniA59qyRIBPY5TiFv+WUOkkeZH2HSHKILaEam7kU//f2+0ULj5I0ymRrVYOTF3xsWNf7CjPGIZdGu46XnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607424; c=relaxed/simple;
	bh=46gfGGvOHamt2U6ZnlfStx9ZhBdMqYA1cvWxqwtmAYw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F6a89VIy1TxNqjRmAovsWieF6QWgwqo0yV9YlgOL+8ihPY5lPlHA+WITDuP5N1KmI1JE0ZER1kRk8NWrAt2ALLgIGaHItZdaNHkUVTxKggZwyB344prxbtbh91Sci+TcFvBZWDVPmgiCuTZ6hNgNlCjVlrFWmR9cqQV1asL//IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+A/z3ZD; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+A/z3ZD"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48436370540so840100f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788607421; x=1789212221; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OK8u0A1r5wARyyx+mQthY7pulPX5uc00KjP5Fs0Y5/U=;
        b=Q+A/z3ZDMSiXVgbRXO+zPozELZ6V3vjOQVVoRzZiHgeBqo4Om9xkt7FGx+oqDs2h2C
         hl0rmc2a8oze26WlFknREh1Jp308JbGotgds7kI0cFTSZakdxrDuY2KF9wu2+0KyIooF
         rGCBNfr8KG/9g+l9oeIiEfjhd1ZnNZf+ZR51fjd3zatku5Y4FJF0feRCEU/K/5eT+/Zh
         9K7+hypVDH/AT8mQplZ5715R3Xg4ULsECVT4aKl/Y1xNNwuP7t6QJd8nCrIJCTkDYwV8
         3h9zUnW9wNSvqNVkluVJ5poCvKR5l5uYy7Gr/YZJadR679rlgxN/XGoOPRTlgwNsvMwW
         y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607421; x=1789212221;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OK8u0A1r5wARyyx+mQthY7pulPX5uc00KjP5Fs0Y5/U=;
        b=T+3+Iu8qae2nbbKO4kBQxPs+at34xqRJ97nNqL0dXNu01XVwovJD+4hFHbL9Xm2JzH
         xxqeo19dlVf8zrDJoH711XJ11XN3bCXakUj6wTBR2yF8BchK98+myromrFnlcpkNrOfg
         OerkgRqPSQgP1gBgo8QA70vGRK9jTk7NKORE8ugrotIAnR8APtTT0xaxLW5ZN9DZxyGe
         5giRjQKXDuQeLxbLJ4uu4albpVWaCmSZqcGfVpYe9u5vyOiQDWQUWQ8fSnjsHpYAmp89
         ZQuQIHEa4zalaEB2kCQCnm+ToN2gRHGEXqZmqzj4ee8+jM9Tra81j/VTxlD0vw+SS94d
         38yg==
X-Forwarded-Encrypted: i=1; AKwUvBxzKGYg2fvDga3EzgtXF92kFzhTjjzcWXbcRKDChMY5AY6vpCBJI0zKlszJBFkBFAtz1NYXkTcxJD2icv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mnpbwWnShC8vO2qfKq39cOEese0P1IOiv9qdz991nbSrNFLznJ
	sdQuaOi3l9ESKmfipJO2ZCqxXkA5Z8Qq+jdJu0T4M/B587G3H2HSNq6n
X-Gm-Gg: AYBFou0YzWo1lQRxCDkrqfU13sh8rjoC60Sd5mjwQyg0B6YYbx3HK59RhvJJtsFRIuR
	Pp7puhnQTTd0nQh3Gbl+n6LrLmphtMpXj0rlXcqjyWK0u0vC+Utog4Q37xt2CbvjrClaPfhi+0/
	CCLupxNvcwMC21D4quQ/nqIPum3tYlQX1D4LJpJ3pejW6omnhr83zWlFezrc9yK0qd2KQSutCAj
	x/kd/ZYo/9vXT3cdAmy/6MQPG5TOiFSgri/OSjetqIbG8WC3DiQS/lcJslbW7tJfvovo2yqpiO9
	351/ySoU4Z0YkNybM1qNAAWb5qMU4jVjFXArsMq5jHDKVuMNRg2xKaeNQvKNS0BW5hVx+WfHlG9
	TyaGb0v0lA8xv9S0NnzLVgbGYXAG6vh9lK0Et48bKyK0rRS3EYJIZ5gQ/V9bvRbnEhJLlWNbdxT
	n878F0U49N4rvCvPaxgig0Ys8m5L2JeihJGLg8H1GuqQpSrnhwvT2mxOMp26LQSslOy1H9ZMrmr
	zg9MWh3ToDTLAKJRFtkLSnFqlOL5V3opfKlTxZF7Pf3WhnuWJsoZRCmxpAitkNcfzBUKCbk01Vk
	/nmus41WIMD7RAupt+Nsg66cBcg=
X-Received: by 2002:a5d:5888:0:b0:485:8c16:5ef9 with SMTP id ffacd0b85a97d-4858c166172mr8839779f8f.51.1788607421304;
        Sat, 05 Sep 2026 04:23:41 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm1014293f8f.37.2026.09.05.04.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 04:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 13:23:39 +0200
Message-Id: <DL7CEX9EX781.23V26M3600JEI@gmail.com>
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>, "Barry
 Song" <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, "Hui Zhu"
 <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v7 1/2] mm/bpf: Add bpf_proactive_reclaim kfunc
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Andrew Morton" <akpm@linux-foundation.org>, "Hui Zhu"
 <hui.zhu@linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1788516769.git.zhuhui@kylinos.cn>
 <7d8b77dc99ffe99a7bef874a257472fdaaf07e1c.1788516769.git.zhuhui@kylinos.cn>
 <20260904110308.4473cde499e91aab14dbd5fc@linux-foundation.org>
In-Reply-To: <20260904110308.4473cde499e91aab14dbd5fc@linux-foundation.org>

On Fri Sep 4, 2026 at 8:03 PM CEST, Andrew Morton wrote:
> On Fri,  4 Sep 2026 18:20:19 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:
>
>> @@ -159,6 +160,74 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct =
mem_cgroup *memcg)
>>  	mem_cgroup_flush_stats(memcg);
>>  }
>>
>> +/*
>> + * Reclaim must not recurse: try_to_free_mem_cgroup_pages() overwrites
>> + * current->reclaim_state, so a nested call would corrupt the outer
>> + * reclaim state. Reclaim windows are marked with PF_MEMALLOC;
>> + * reclaim_state is also checked because it is installed slightly
>> + * before PF_MEMALLOC.
>> + */
>> +static bool bpf_in_reclaim_context(void)
>> +{
>> +	return (current->flags & PF_MEMALLOC) || current->reclaim_state;
>> +}
>> +
>
> Would life improve if try_to_free_mem_cgroup_pages() didn't do that?
> If try_to_free_mem_cgroup_pages() (or some variant of it) were to
> permit nesting?
>
> 	rs =3D new_thing(current, &sc.reclaim_state);
> 	...
> 	set_task_reclaim_state(current, rs);
>

My understanding is that given the current restrictions on where this kfunc=
 can
be called, this is mostly a defensive and shouldn't be firing (?). Given th=
at,
we can probably revisit this when such reentrancy is necessary, even though=
 I
doubt it would be the case in the future. It will at most be invoked from a=
 wq
callback or a kthread, so should be fine.

> ?

