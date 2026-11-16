Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799920;
	b=EHGYKamdkbhsVYjyGfoY9v/CXfAn62Ln2VCuWGrFhszkzSac01zvNpazGmpr6O7mKXOv
	 iz6jS/Q9CSi/8TwktWgTiQ575vnSWI35nTnlLgdNwNz7l4hLECmAO+WvpBSHG4ZpG3O/r
	 6GGwOSS+MakbRwepQNxGishO7kbSQxM5MYLWAvwIhZKEuZBGSnATJRg7edUM4uvLTBqHg
	 wbCwYzv7XATSDixtHSalD22gGx7M+LRI/mXanfGVq3MK0kprLoSDN4NpfmrgoNJiAshlv
	 UFoO80s9FEEUy6uO0w+8ChNEgvJuwx2XQ563nvT1nhcuvcoBIO8xSr0e1mYTml0op5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
	b=m6IVCwYp6T5UYTmAS5R016FV2jxBxCIW6Jafw2KreXp2xWOrFjibPX1yokSU+ywYNPWa
	 u6w6ANf5V5+uZn7rFSAMN+nHgXnCyhz9DacVVka+4n/QPqmXPQCjjkRsDzF5vH7ZDNrGq
	 ZImn0+g0FnUR0Gie7kogjWt3B6e9QbKtIPsqiDcFpHlMZ+YHByYLrptr0rVy6ifUMBsk7
	 1xYif90xfr3K4ZophNQMZWNmD7GMO3hAGez9x6PchdJLdD10HJK6dFxdze/dpSFQAGTFZ
	 xiNY/z4+q8G/4fFYu2NbhWVE/P6T6fnjQPEFPwc0YqM3ZrzCQyMmZpKhp2Zei6aJUJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ERc/RIxY";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA631606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA631606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERc/RIxY
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b24f4b15c4so919189c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799919; x=1795404719; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
        b=ERc/RIxY2S+iijnFuJRf7WxuUXnbOU13f1iLkWLamCJZMLTwSUsYa1XGt4TxAqhiGm
         NGjmzYjQVJLxAClTkWEGcXp132ZnnsraZKxuptxOXMIfkATkIhGz4o7ZVWx9aYQTEc+o
         Gezuh6l5bESkTv83LfXLlx8RS7NyJnvuhhRoCb8us47fZtRO1hS0O1XVK6Qfr0pfk9iq
         LP+NpvWIYGEnCbykbaoL5wruuUUYAvhNjZlDdKR9sRQKiizVd3cPh876Zn5OAIdT6DH1
         QqWY4dt64XKpQ7EBmx5cYePHVIRlgLD/dRT+fLRnjSYl8cv6SzYmiaE0j8/Wp3nbtdlf
         rK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799919; x=1795404719;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
        b=jnck+6yGD+vbHkGkmIJBQq06qfJpxPfCEr0ULX14AUFSfUvoU0xwRong+cKiuyZLI5
         gp8VnBYiwdB6L6/Jp96Fl8jqQ4VEnaly6U3XYSBitehRrtv8UMj2vNNvSJm/p97ANd/Z
         RBq+VAre7MOLj+15EA/w3PzJLWi0M56GAgTJBOxQjWx3escZY0xmdOebfor9hB0X9GEa
         6KsLYqKxKmRQRNOFf1FRn3MT9+RgzRede1rT+hWIpVhy2FPjILrg/oiHBZdALiEej46v
         cLG46l+Th00rMNYSanGFaYwwul+fyAlmv7EVHevr79qIyMGMVzO5yf+co7CgrKFjJs0s
         ckKQ==
X-Forwarded-Encrypted: i=1; AL+hErHNQ1Ow+J2iNLff+vrIpnJWitrzv6wsmzDeSHhpGCVyIjNE9qa8MzNW20UHnYRJ8jFf4JdIQnMOyGnzzWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6mjHwiDISPCEu4MU1dUxAxGoP7JlfGwr6D7P2gdJnssygZTjS
	HLLJm2gFy8whUaSBgpq8QoB/2qX+ACVv7KZuOtQ18Bh9rB5/mXWykIlM
X-Gm-Gg: AYBFou2XgXmE1jplqpu/B+czvfAP9I1mPepde7MntgHTo/gfwsbpBdB2r6flDSmsTJz
	yDzbPN6MN6JNA1nMyIbRRbfSIJqmMzCf9TcwkwF02xlyn1fsUw96mhkEeHaSSfIf80pDJIM4aVw
	ImgvFTQzSHMrLb1PJU7xB9W0fVz+1I+1AKZM9/pX6RripqzVKf/qdeTx0gNL7GXGlJpO6DnQdJA
	rGFYJ7GPzUclWeQ33hZlasDNJ/kP+EzjuhP4vUzXHTqklgy7JDeDiudsSKNlrVq331gzd4NAKXA
	2mS1np54mV19kjcSC3mHOde0SWtrfrSK7RDjrkZHNNZhaAnCc8zur8aaC3HTT3rHMS5NNunDewb
	i6RuVuykXo9Xu01wcvpCxTLVmP5nUSTRMlnwbkmUgLb8dibKpPFzxRWLVIMmJUh9NJv9vqmidt+
	jkc+xBOFQkwwzbhX/pumXvNRAYTJhd73lBWyTnC8b+dPq3GGcFWHcWxeCCLX8AOMRaFuBX1E4IQ
	j5UnQuh2ghpkEZwCCbSrvKbC/OSkN6TcEI5WJcGtUHmsw0cQOUt+TzxdIcaAAdks4Z4Ums1uh8x
	2RZDindkAkBstcl65pNNlroF2TqavmtBMDauiSOs0Y5DOVDU
X-Received: by 2002:a05:701b:4294:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5030990dbmr8883780c88.11.1794799918907;
        Sun, 15 Nov 2026 19:31:58 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm27456340c88.12.2026.11.15.19.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:31:58 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc/xmon: Avoid unsequenced accesses to tsk in show_task()
In-Reply-To: <20261115-xmon-wunsequenced-v1-1-42ae3fe45bf4@kernel.org>
Date: Mon, 16 Nov 2026 08:54:13 +0530
Message-ID: <1p8l8nmq.ritesh.list@gmail.com>
References: <20261115-xmon-wunsequenced-v1-1-42ae3fe45bf4@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Nathan Chancellor <nathan@kernel.org> writes:

> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in show_task(), which can
> break the build with CONFIG_PPC_WERROR=y / CONFIG_WERROR=y / W=e:
>
>   arch/powerpc/xmon/xmon.c:3262:3: error: unsequenced accesses to volatile qualified 'tsk' [-Werror,-Wunsequenced]
>    3261 |         printf("%16px %16lx %16px %6d %6d %c %2d %s\n", tsk,
>         |                                                         ~~~
>    3262 |                 tsk->thread.ksp, tsk->thread.regs,
>         |                 ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
>
> tsk was made volatile in commit a2305e3de819 ("powerpc: mark local
> variables around longjmp as volatile") to ensure its value in
> show_tasks() was properly restored after returning from a potential
> longjmp(). Aside from that, the value is not being modified through
> other means, so rename the volatile parameter and add a local variable
> named tsk to hold its value throughout show_task(), clearing up the
> warning.

Yes. Reading vol_tsk into tsk (local variable) in show_task() function,
doesn't cause any functional change and also fixes the unsequenced
volatile accesses as you described.

>
> Cc: stable@vger.kernel.org
> Fixes: a2305e3de819 ("powerpc: mark local variables around longjmp as volatile")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2199
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/xmon/xmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

So, LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

