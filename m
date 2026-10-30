Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324231;
	b=3EpnyFHd4cM5uv4sTOaXQ+wIc+oSaEDPgpvmjpuN/W5qBBEmqogrc4rds1TTZEaYXG+v
	 vuXozFWcauZsTLCtGBjQiSA6VNx7gaI5fR3TltjQfuby/6HihkXNmrHiz7dr5Y5jBOMBQ
	 dxWCJsOtb+9zSNDeX15D6gyT1J6JEI55jvqlv69Kapx/qEblP22skyVJiGDvCQ/L0VhJM
	 lKz0cx2pihzKHy1K3dETpWuDbbO/A/vs9QVAGfH4xKvXveZlYuStWOevJ6EcE67riTPgT
	 Mlg3b5TSXQH3pFUw8f6APVR0l3YPUuABnrbniyLRQ8dNk8QbsOEpU9ege1qsOMol5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Zcy8/R0qg4/tLGENoHwYrpvlh1ufL01JT/JeD2hu+48=;
	b=EnbMX+boOOCxFL521EJNMmz1RgWwjNuce0XDgg08WhqWymeO1wDOnsUno+rgl3L9Xso+
	 iBfOicIZqIZ8wCc4hAdpjFvHmyibBlHrDXZ2My3ODnmT5K7dTiwCMjh3tiwx6Md4oZ9EF
	 vCdRRxy7B/LE2mlpqeS6/t8SC6mOeXlzod8CySbW/qa0YOPlNgl3TyOFl9zJbHsC3UVIf
	 mq7O4l/g7Bx4LSRCAeRcMmL6CZe+Ec21E5lsI3Ryk+Osjz5ZaerHS69qU8vcvI5iU9WvT
	 rzuQle3mWY9O7qQXNWqFLq8QnRhSQaJ6jHi3jXyprSLAEyNemLr47BxsbO70vZwScxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HxEU9kgz;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B18606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HxEU9kgz
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b8306b9f8so3652596d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793324229; x=1793929029; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zcy8/R0qg4/tLGENoHwYrpvlh1ufL01JT/JeD2hu+48=;
        b=HxEU9kgzclioL8FU7fxb6+tNSW8e1VmpFOYUvyNCpEzIkeazTh8LQxy9XgtmweR8LY
         lR/zan6g5bKT8xd787YPTNv7KFLq3ltBlZVZXMABLRLeKIxaM7atqkPguDTs+suZ0Txy
         RLH9nOiFJk0qLagIyLOicT6Re+KKqfATM5bhTIo6x6wA33o1BgHGaTTawOkknVQszU2B
         f3ldl8gzxipFvxc6NoGKV7zLq7l5KCvMS7uXDZeh7Titg1daBD4XbAJMkvlHnCO0mEHN
         qnjI6IXSRMWYcmgSX7LxW+8iMRqaSH6wENidPmlIpHiVYH3WABaw57QYix+pnm9EHEQX
         etGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324229; x=1793929029;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zcy8/R0qg4/tLGENoHwYrpvlh1ufL01JT/JeD2hu+48=;
        b=jR/erb1zNo9J/7QHPSbvLUJM4HqCEiu26VXdbGcZEn9hwnk0ObyA9PZBpo+5L0p3qw
         5F8ylp/fvUJra8Tvf82xuuAEWw2BZl6yV64bRz7k+/bggBXrKsQxKUDwtf5Rrcw2tLDW
         LcTJDwP+JT34MpVHweBX5rTu4DvGHGJv6qZgQyuPV+f1tTEGz8V/EV2G7VVTiDPl6wrd
         cT7KsatBr8FgX601SEbecv3edKqUzhGvnH9E1kStmJjJ+3bpo586a5uYBnRzFVSEH1em
         SQUjOO2VxMmPvZhdLaTgH4T4La/n/SLozE0Gg+GllZiIyvlOxa2OqRnXgE/pjHS1CiG5
         JR/g==
X-Forwarded-Encrypted: i=1; AKwUvBwzTbWDYh5OtdhFz01LLUWjoFA+Fvm3I6QHkqYTctu2gs1RpVBksJsfb2gZjzjgiyyFaq1cf3Lk6A40N/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUw8nJbJJOwUAOaUQ64sGxDqT1IwmE/LmtDyE7JVnzF2YzPQ5y
	ItzruRUFXSrIj69GqxN6YQvNtRSu4O4pVvhdIDPvQDqZhNhNFhB0ILzNT4w+VisKagI=
X-Gm-Gg: AYBFou0qtIs8XQHxJuDHGoPwUnyvZQIB3pkCWPdP8SSyhy0poBJDUERwy4RmtvpTuOD
	+B7DJeL6+zE+VlyTq0dSM8RJ0r58bmt6Itaw8pkfqdhd63Odsc29JhaLi5SbERXmafyhakVIKYF
	aSpdSi36YqpsVx9YL2WuZoiLDTrSG276VvFJL8XZg2YoNO5uVXxaqHVM5/qwGgunw80ODpfCGbH
	w+8xuOxwFLszrTwQgjpkFXE5nf8yzyzWWavDaJxIWp/q0wE1qn+algGklFlCMlwL059m7i2rxGs
	eJO+yFHDQmKeMA/EciaFvb5aNBOI+DhjJYZeuD3EJO0E+CFbkN2I7A9ADc5gneiUYAKkJ1CfE2E
	wEw8Qqi5Di8omoJIfZ7K7SgxwFyDDdl4z/qDXDgMtKgVSIh++mIMQMHTexcAemgdn6db1m686mK
	E3dr2Au8Tm/m0l+C0Cd02ZoNa3UhVrLIZy+N3JnC+RcGNoy2lo7y0Xfa9VvGD6E08WpeoheucS2
	Q1cKg6fvA2NkUs0X/4oPcTVhhlUhmiDlEEcedWdyi4kVNeZ7/Z4E1irqdFBYJo+b0yLha1Jl3xk
	/Wb/h4oTxVvoSytWRJ8F/SxU+wKXs0/w6AwqBV0V4EE4szjmPENzMa+gI3JPrXhLfNIcyuFGpJ3
	J
X-Received: by 2002:a05:620a:800a:b0:93f:43a4:a47e with SMTP id af79cd13be357-94421759f60mr164999285a.43.1793324229423;
        Thu, 29 Oct 2026 18:37:09 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca806aeeasm1672456d6.35.2026.10.29.18.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:37:08 -0700 (PDT)
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
Subject: Re: [PATCH v4 6/8] mm/hugetlb: retry the pool walk when the
 zonelist is rebuilt
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, muchun.song@linux.dev, 
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org, 
 ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
 ying.huang@linux.alibaba.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
 brendan.jackman@linux.dev, hannes@cmpxchg.org, mgorman@techsingularity.net, 
 anshuman.khandual@arm.com, stable@vger.kernel.org
In-Reply-To: <fe658b1b-4011-4197-b228-fd4bb6c412bc@kernel.org>
References: <20261028211930.3504634-1-gourry@gourry.net>
 <20261028211930.3504634-7-gourry@gourry.net>
 <fe658b1b-4011-4197-b228-fd4bb6c412bc@kernel.org>
Date: Thu, 29 Oct 2026 21:37:07 -0400
Message-Id: <179332422799.1311000.12794841959006150077.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 19:08 +0100, Vlastimil Babka (SUSE) wrote:
> >  
> > +unsigned int zonelist_iter_begin(void);
> > +unsigned int check_retry_zonelist(unsigned int seq);
> 
> ... is it possible to inline these here instead?
> 

Reasonable, let me take a look.

-- 
~Gregory

