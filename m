Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E24374A19
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581335; cv=none; b=WuzcSRiuuA4ikecJVkP8llGzhexgitz2VGQEXoaT6OYCmeKHAB+fmTiXmJlYhdTGAfxfjAJmWlVXM7vY3bHqoC5VdUL7QP1f61rRc1tGC8Z0XfcKpM/IZVRvxtwsmoOHRllGbb/skZ3Q3GNrEx9pMdtXMOb8R3hVv032Sbmo6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581335; c=relaxed/simple;
	bh=eviVKQL1GqxJ7n6WTPVfikHyW1NbKYtUFXOY02zwrio=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=mdgxPGvMia9+35dDsSC9OgtFbTiU/AADsx8VRZUQROz29sTRPk/3uW5LfiOWe0SUvcYeVuMuMB0/6nphX+vm9V1D8QI21IJVWqtdU5pwfo6KjjllxPhs3gPYQabazHNl3v54rSYw5JXfCuh6pOAWPK7U9aI+0Tp64ca3twYc7v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbVVFhT+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbVVFhT+"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1744016a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581333; x=1791186133; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzC7ZwZxhN/+isWJR43KtRgUye/21tDI5dM3m9YrgyE=;
        b=GbVVFhT+1SypBnt7bd7P+9HUIs0CrzHlOnB82gde1LN1yvOO3HUg+Y6LfP7dUfZfP3
         tuiPgS9cRxiSDG/Q68FofQikYkwUJ24D+CnM/XbRV34HWDbnS55ajRuiTtSpFIv6CH7b
         Ib/p6ZHun1E4ydMbanoMjLzBXpcaxNsPOpPlqMg4Us0CXj+B00eB4+SO2qscTjy4t4E9
         7nDaWda7Fi4b8xh0j5SxvjMURcuGu3s1ZwZGvGlVseKKnlcwBgEg9kNQus44QjO8MBcT
         g8HeHMXafk/rMsGz8IQv2ypVlhMSgWG7rHLcu9hdzGPa1YERCBoy9TX7lTN8OfEoYGUC
         VxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581333; x=1791186133;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzC7ZwZxhN/+isWJR43KtRgUye/21tDI5dM3m9YrgyE=;
        b=vR58HrfIE49GBW0fWylV9avICETAme+yHAnk9hnGvoRCNSZbaM/v+vkdC/tHgtXGBZ
         kQ+sCqNy1jcoCPdq7+NzBH5JHbn0hgTx+w5if90FTQci5FgCx7oxrcHTV5Mf6FRFEDOl
         JyNdyxofa0PISL9Qf+iSKO6fITaejAQ1YMEm5GsVczKwl7PKbq3725O9rIxLtS5Jd4KJ
         aiylQ5vKkYJsFpMFExWm7U4y7et6NXp9Jdt4kGAqfhBjx052aHKHQ+LtSk2l2knmo4LH
         mlevjJ7Fjn4/lrLEJObKMS0wdOh2p2JTQhYuwzp1w3vRN3sMbTsWMFto8A9pH3O02Mw4
         oZSg==
X-Forwarded-Encrypted: i=1; AKwUvBxSObnLTLk2VNOscShyWsqEXOiHrM1uuWyYH71F5WI58rGAuSwf9MUb9cEzZGekVDSae19GlOg6hzL0Ueg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL88/3g1OCuRfGJ7rsRMUINAum2/bui3nj8KxXyBg1Kyp+POmd
	gJ8o0mYqAWIbfKDtiWvafe17snsowUOiITzfId35NY/Ka0yPVrUaAZLE
X-Gm-Gg: AYBFou302VFieZNkvfLJtTEMAQAAPQGUxo9VI8grcLnE8tLpM2X9oFvIf+cRB5r2UOl
	4DJyHUBC8/ifRZ+Ill1qC6Yw9P4l9NxSJKGIVSNR4MuP/xuKB4nGhEaXePlu4eYllKK3rPD7eFQ
	da2qRJU444fvm19mthTP/zkTiuqRjkZ5NNrveg/RWaq077m4NNTTAmGOgMn6Q00KdcLvZDqk9jR
	2ug+2Kwjd/v1Q6bHuIQBcrcTZLz9uRZ1s8hRQGDJIGlbiimdFu3DVpt1uHUBq8N68w/svcvVhZa
	+M+u/kM5u7VwaLskU82xZYs6wctL6GglGjVf4WkoW8m/XIdVl0PudGqRsLd+cCSMYdBKIJ/NLKr
	B3vtkXhuyak3djngOJVMOglAfCv2ozPJnzfVzlyfUsUAFCDuSKXo8X64y76ivuFL9QxsHNbtiXX
	hIaVQ4bK5uje7EOWKOcrOoc6+q3VGyw4HW/qbQCLDC7KqAUQDNqPAFpVtbQloRi3dtgzgkOSKOD
	BNU02YkxmZoC8ZLOYbB3tgN7v9rl4xLhEcyohvO2KDevCFY5WidCbqw+eDwvyAlLfw6hZ5Ia35D
	j+dj4LFCqZjqhVs=
X-Received: by 2002:a17:90b:3843:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3a0e4ce57f5mr4745750a91.10.1790581333234;
        Mon, 28 Sep 2026 00:42:13 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e151be04sm12870178a91.9.2026.09.28.00.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:42:12 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 07:42:11 +0000
Message-Id: <DLQS3VWUPXK9.NWD6AU4CU898@gmail.com>
Subject: Re: [PATCH v2] bpf: add diagnostics for rejected memory and map
 accesses
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>
Cc: <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260927194205.125086-1-suchitkarunakaran@gmail.com>
References: <20260927194205.125086-1-suchitkarunakaran@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 01:12 AM Suchit Karunakaran <suchitkarunakaran@gmail.com> wrote:
> @@ -4472,12 +4472,22 @@ static int check_map_access_type(struct bpf_verifier_env *env, struct bpf_reg_st
>  	if (type == BPF_WRITE && !(cap & BPF_MAP_CAN_WRITE)) {
>  		verbose(env, "write into map forbidden, value_size=%d off=%lld size=%d\n",
>  			map->value_size, reg_smin(reg) + off, size);
> +		bpf_diag_policy(env, env->insn_idx,
> +				bpf_diag_fmt(env, "write to map '%s'",
> +					map->name[0] ? map->name : "unnamed"),
> +				"this map was created with BPF_F_RDONLY_PROG, which allows BPF programs to only read it",
> +				"Remove the write, or create the map without BPF_F_RDONLY_PROG if BPF programs need to write to it.");

That's not true.
dev_map_init_map() and insn_array_alloc() set BPF_F_RDONLY_PROG
in the kernel for every devmap and insn_array.
libbpf sets it for .rodata when the prog has a const global.
The user didn't create the map with that flag and
cannot create it without.
Same in record_func_map().

[...]

> @@ -6944,6 +6954,10 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
> +					"Use a writable destination, or copy the data into a writable buffer before modifying it.");

[...]

> @@ -7032,6 +7046,10 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
> +					"Remove the direct write, or perform the modification in a program type and hook that support packet writes.");

These two are the same as in v1 and don't tell the user anything.

Pls focus your tokens elsewhere. I don't feel we will converge here.

pw-bot: cr
