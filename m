Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90254FECFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166810; cv=none; b=UwLFOAkaaaGcO1yt13bqrkcTtX5idZj8vuOIuvumBkjqo4X/gnsZXqv8WLY5Gos01muSQmEJSpBBCbIoWrW1IoXeJoAtWXCQ/M6Moh8krCmRtKTwUNc4R8deZY9iG/LWlq1dssN9fnGnv0aT5LWQlSBqeT5Xr11WSBrnec2nIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166810; c=relaxed/simple;
	bh=Sp+kvynA1LD3S5bZccoXo6BpOy+Css26i58fO0Uh0kM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=DY72+gFYvCteA1aLk5+LwQTwaT9L3e9OuSivq4eEWf/vPyONGaVBcke75aekgrGnajuRVyHcbfA8iZtaqn6kEeYlcdpXOwq5hovtEEElGyV7WIIafP8jgfrxgA4+hh7MWFQg08a+z0+1+/L1NLDSQC2YIUrTlABCfN5n8Lzjdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klkfNhQT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klkfNhQT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89f1318195fso66518b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166806; x=1792771606; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOH4IRDD54/m9IGgKIfn5Mrlm3KQxG//txDjDyh2SCE=;
        b=klkfNhQTqY0mre0ukR8CRc024N2sOFMEo4cOFwHVFqa19JoeTpJPnn8d586F6TRk41
         NN6uYKxDJiclpge/NdYHyuyyPGiSO6+yFJ67gjCEZmOHRQyrnZIBd3B2+AXiUYkQYh7E
         d9jVW8EdSszl9M0wlmABK7R8Tr5D3gXxjmzaB5FAi7XMAhyTdmoAGDJEfaWsYEfms7QP
         3TsV/X/fKZL0OoyFGKC3Qg38nbv8Wa1OT/Nd/Ecq0vHcmDpC3nvkqSiDR1KLWL8YzFLa
         K90VVrYYrXorR3P1c0gA8peEgp4gAL/EepgRqdDyb9rON1z/gsdndvl9oUEr8nZjF7Si
         QXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166806; x=1792771606;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOH4IRDD54/m9IGgKIfn5Mrlm3KQxG//txDjDyh2SCE=;
        b=VbGNascpEwp3o9BVgIPLBGeeBScS2vC+kle/ZaNQTtdfVgLIZH3N+889JA50c1vxug
         hjzfd2S2Wbh/vDtZ47kQtP54HTlCRRGM54vANoHqrmzRE3oeJv9Juenh5BWRG5MRMsx4
         JI1JWGJz6CF9XRfSVAp3qHi2HKE0UaP8gNe53NhIzNE/xMGDfPwC25H/D1NF/6U/qVtc
         I3bVKkkH+bxup2kIWtwwcbtnpwuVaolxkzsiXgJoohHyAn7gX1k+w/WyPtY6jaSddI5h
         EFPrZJD3vHeBxUk1C3737wNcCVlrn2ILjYkSGmmgRtC5rgW5zF3gBpxIK4ZCGDdviox+
         V+VA==
X-Forwarded-Encrypted: i=1; AKwUvByrHou8l17az/SHbyKeU1yAQEN4G9iRQ6WhRlbQP7j1U05gQwZHGrnpp8TZGQPMYjv9qr3i8lt5o0icU88=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN5F380hg6kA4FgvFOsE+wSFiqQG6hk4Ufq/BngLS3gbOnPyTw
	lMAjyFeufS8ixY1/JfTCWRwd9rWhpwIQz4Jtk3VaWc9lasrUVnHjzE+LqLeotg==
X-Gm-Gg: AYBFou3fgvWBGGQxv3HZ2rj+7zhQs+1mdOZT+QQZcdxmDT1O7PfBw5l61hb6dL33Uk5
	Xb6TROeFT4AUjs0DuP8cbr/v4gCMdoNjI9/v1I+rYU7dUDVh6BwaORJcu+U7MyyPQbXYWZPpn3G
	dFqezruR7aw1vWi4gsRqq/PRPHv0C0B6PQ9eDDHrTISyUCS+wBrVBl5xUo9O6nlUwUo4UxIgVqz
	97+IdxAzUXvadbDOeImqsX8HWBSbe98qiIp5p/Pbzs7zaUt/vLGmB7CE5JOCUrJAOtlJadCynzq
	txPVzfNkUCaxlStIza7amWFie/CJNK+KaFS8A3GJTZdnkvH9rTjfRk3qeQ8Bps7bq2adQsENJcn
	3oKTutUzGhyyAKDbXFL5Zh1ovOtRhQXvxssF8QOWGUv4R71YelDCVxydiEllsJQ7BCETSKSNaPo
	ZXc5rZLj8cr6bd+fVT8U64C8PonfvyaWW22KkHQJ2i8grq4zi/6pQXzPi8/Drigk1JTjnoEvHCs
	STH58vPFAjuq0fAJ36bC/tREhDrJ00fyPi5koQ8LePwMAA0GBIWch0b2K4AChHKl4IhECbKVUii
	FOk=
X-Received: by 2002:a05:6a00:4c12:b0:89f:9fdb:a99c with SMTP id d2e1a72fcca58-8a04cc1ff03mr12344b3a.55.1792166805807;
        Fri, 16 Oct 2026 09:06:45 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fd010b47fsm950512b3a.31.2026.10.16.09.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:06:45 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:06:44 +0000
Message-Id: <DM6E405GXJXY.1PEDGW93RMMYO@gmail.com>
To: <nicholasfvelten@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <syzbot+1ea4f564bf6f1f3d1dc4@syzkaller.appspotmail.com>
Subject: Re: [PATCH bpf-next] bpf: Annotate data races on bpf_lru_node type
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261013-fix-lru-node-type-kcsan-v1-1-0b743f5af2f3@gmail.com>
References: <20261013-fix-lru-node-type-kcsan-v1-1-0b743f5af2f3@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 11:00 PM Nicholas Velten via B4 Relay <devnull+nicholasfvelten.gmail.com@kernel.org> wrote:
> Both races are benign: the type is a single byte, the sanity check only

[...]

> Fixes: 3a08c2fd7634 ("bpf: LRU List")

It's not a fix. There is nothing to backport. Drop the tag.

> @@ -298,7 +298,7 @@ static void bpf_lru_list_push_free(struct bpf_lru_list *l,
>  {
>  	unsigned long flags;
>
> -	if (WARN_ON_ONCE(IS_LOCAL_LIST_TYPE(node->type)))
> +	if (WARN_ON_ONCE(IS_LOCAL_LIST_TYPE(READ_ONCE(node->type))))
>  		return;

__bpf_lru_node_move() called few lines below does the same
WARN_ON_ONCE(IS_LOCAL_LIST_TYPE(node->type)) under l->lock.
Remove this check instead of annotating it.

> @@ -357,7 +357,7 @@ static void __local_list_add_pending(struct bpf_lru *lru,
>  {
>  	*(u32 *)((void *)node + lru->hash_offset) = hash;
>  	node->cpu = cpu;
> -	node->type = BPF_LRU_LOCAL_LIST_T_PENDING;
> +	WRITE_ONCE(node->type, BPF_LRU_LOCAL_LIST_T_PENDING);

The node in push_free is not in the htab anymore, so del_from_htab()
fails and shrink or steal cannot take it.
Only flush and rotate can change its type, which is
__bpf_lru_node_move_in() and __bpf_lru_node_move().
Here and in the other three places the node has one owner and
nobody is reading its type. No need for WRITE_ONCE.

pw-bot: cr
