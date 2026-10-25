Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901042;
	b=Yljgkmesu0ZHThldhZyNCunijy5Lkqr1mtqU5dmyIGrJlBep3o30M+lI0uhVGJaHSSvb
	 Zb/BJtctnuNv8FFOOjadA7Ni8z6rBYQRTcwW3oVmeINBPJauloNoxACfhxHvYPSMl+d8k
	 4O7MeP0K+5nanx7GktH3hed9Ehna42FipdqlzxVi1IKyqn/OpXgxnzKZ+WE/O0A0TnVx3
	 ohAfYOMAQzDZpP50PpM3FRjSnDaQNBXkettfb/foHCFzB7j6HVTQSqt46FYWwH0ibnZtT
	 PVB82xej3L8iKnb/M/Z7n1aDPKEyVEIySRz1Xz1UPmRxfjcZ7WbzoQILuHgbWNrpcZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
	b=fibZdw/uCVlWXMdrbvvr5dAsVF5CEXbe2GcjkiPiMvUZa+luqbKwMtfJlB5F8vRC3ixQ
	 PbV6QIPWMIGxGdfyA5aPw+8Q4naBFBwl1EgOijKX9iF+PuOflE54qG/jysA6lho0j/nHF
	 LZRAd/K/6zH6mjzeJx8wlyQLBSOJbhPmwlejAIjF1YrBL4mbRCkt7e7Kw+K+oRvyDZivH
	 WOU+wS9U+gMuNSZYXNxdJqIUzrF4Nz/YIQT1OkRwmSre/R+1tSSBtU+LgGTxHXifqZIyH
	 rv/ilA/toGAKZAfweu5BN8jQcS66N1d4+D1BZTxICOHOqwn2v+N3w+5ktcdfSfpjbJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCMZbZpH;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FB3606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FB3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCMZbZpH
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1464016a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901041; x=1793505841; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
        b=jCMZbZpHovCuF26jrCaIXkA0XyCql6/lsi0nbXXusRURQH0DQtsXwimLb5DEAkl760
         9Hk0Kgd/z3ATVXuEjixsqgG2gODGUZuD66AI8MY6dV9GtoxAgyTXSNp3UgDn9RlNvUrd
         7M71REEdijuGGI0suGbD5t/6WvaPxiXYKYuYuMvg/Dkz0hRdjZA4BMlEH4i2LXf4UEsI
         kSgqzrvqqaYMgWEX/kVBpRk60w2sOiKlqFCwY1Mtcb72hqsyboQTr/KvWkc2QObq5EJJ
         gevo98TpziMiDaevzd5fGX3hXfxu1QbaRBd2qO1hQ+IZdb35dOH/cHPVt1oHc0qo7xQR
         GMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901041; x=1793505841;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
        b=seb3tSYlulgWLhDfl4+OHRQT8puGLAD64K//Yck1X5vdaR8nBNwk2GjmKs9d0vqY5E
         3kTpl80MZ8RdI4XAj2FXc8aWjdp1WTEad6xSz60FcoL2mYxrp8KMCkD0s4lGPjhgGvT9
         utZ1VPY9UonkFQp9AK1zrv8l7WowffRMFTbuYl04aoYuQs8aE+N6cHOlWVH+vkRo0pFF
         9b558ZmA64Toe1eSgGe4TsAjTUz9ggfx8l4b6LwAxiHoq4wmlhEohFSUp+huAsuRhMcf
         ObPbCymTO/m4M+wZgZPGY7wlTOgOcBjpVs2KAe+xVyCKf1tX1hguqlr5n6HZibsI+gNw
         KSkg==
X-Forwarded-Encrypted: i=1; AKwUvByiceOfkDN1Svfop0HXGarg+/Bjz7FFPT5A/sIc31ttM8Oqwobztd8pjBI3Vlz1+zVjDI3mIY/6Akou5dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpSNPCQ08XfAcTUEMegfQXpw3CaiNxQ9Y+xf0L+VdwLiHbQ/7I
	eq0+En/8wY8bpg6hGEURzKrs6WbZucXcs4/jl1KXwcXcAciIpvWK26to
X-Gm-Gg: AYBFou0ip096K79HNjVeSeihYIRHmwb7SU7jU+/pHncegL6jPwOcIbV7E1lH6nUniAQ
	vGAgL8drXP6+cRqysA10o3QlfSahqFJR/Anm3Ics1MNWxIo69POMCsnBw+CBE9DHvQ/UbROvc9J
	st15GvDDlJcwyQkPRbbyZ5MsQjAZcED2cIxwHGEUaZ19RlTg/b7NvypjowgJhV2wprBG8iWr44B
	pOso87dyZ42sifhhM+sx8IB7TP3fQj5zSyvvCvnF/KI/6w4tQ3Rj4HHlcwnQM3Vseu99qZfXf3/
	yDvfE6DGbuo1fnxWe9pG0ny88I5oCPDzFLee+KTSCTXy6uLUeegX3P0ZHB6J8Vm1HCeCQ72fH7r
	HYkOOmbzBAcu5XE7Dg5e5Kx0IwzpUGOON8vsrubEsCYprUzmlyWRrT6VcVTOXu5SXymjvc8DIdq
	oA4zDDrRvgxDIH6AUALNV9RxuRHxfLGZdOJpSEcqV/Cj006WlxaAYYPdTdnVEAWtJUyDenDClZB
	yR4HKN5YQSlbwE7XD4cow6Y4V2PN82HaUlyiQT/bf64Uoq5nCQWTI/sji6YbEraz0RLFgxy1ikd
	PMEJgFi7oO3zkuarMYN0NkIfRVYiWM1aXVuGN44BSIrZxHFBCtJbDf9fcwWj
X-Received: by 2002:a17:90b:4b05:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3adeb197eafmr2849652a91.64.1792901041321;
        Sat, 24 Oct 2026 21:04:01 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb1e37esm2940351a91.4.2026.10.24.21.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 21:04:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 04:04:00 +0000
Message-Id: <DMDMDJ9IQ9DC.2I7GCTCJYZ68B@gmail.com>
To: "zhen.ni" <zhen.ni@easystack.cn>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>,
 <ziy@nvidia.com>, <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] mm/page_owner: add bpf_iter and kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <7f9a9da5-1250-4be3-bfa2-70e4b6051197@easystack.cn>
References: <20261021112437.1799213-1-zhen.ni@easystack.cn> <DMAURQCKK6CG.10CZ7MFXGJO3V@gmail.com> <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn> <DMCCBEPCIWH0.2JEDKE64WPJRQ@gmail.com> <06925440-8df8-4f2e-aea0-ede1a98435fa@easystack.cn> <DMDAZW82I9LT.3FNX2WI80GNE2@gmail.com> <7f9a9da5-1250-4be3-bfa2-70e4b6051197@easystack.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 24, 2026 at 07:16 PM zhen.ni <zhen.ni@easystack.cn> wrote:
> Feasibility isn't in question. The question is whether we want every
> prog writer to reinvent this traversal plumbing, or let the kernel do
> what iterators are designed for.

What the prog and user space can do on their own stays out of
the kernel. The reason for the nack is the same as before.

I'm done with this thread and all of your future patches.
It's auto NACK for all of them. Pls carry it forward,
so no one in the kernel community wastes time on this anymore.

pw-bot: cr
