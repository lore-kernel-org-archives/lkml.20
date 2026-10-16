Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5F2EEE91
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134183; cv=none; b=ltvjkkxLJBtIe1rG/qRV8qnqmPwRSFLevW1fyQK8HFirLwQMxSUPRro93XZOVaA+OmG8P/AgedTAeVq2i0z0X+XtuEM4yFmURPMy1afs3UeY9MZoc783WzOq7CtudxCaxDbpxlZM3fhjzpukRYWtBENQ9z4KguTmpu4kAzZy67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134183; c=relaxed/simple;
	bh=zP2obJz3HeuvKGl2nJSDhnLPQDTHZAQgKwICzUxtlAs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=h8Z9ZWdYIW+f9e/IjbndJ2dv8jQsJZE4dXHAyKCh9jSuaKZApGQhG3TvgjCobLwudsL7PIvdl+RhDnV9m6ofjMniE9OgCmpex1KIMetUMGMBOqEHKlUwdflBwqDwWaN2m+Rba3MHkyYFU8pVRlDh8yM93TrlcznNbneaxBVF+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyWWAI3Q; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyWWAI3Q"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so5205078eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134181; x=1792738981; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7ECuynPFMnAXoH7UnU3pPhhBlQI55oWE7ikBWj/6QM=;
        b=gyWWAI3Q4yKpygtGzjM7lI8qiQYBcC50uqQYcMHFWIdRWk73RwmMe0LwRy3C8V+Kvw
         Zh+q6Mo1gvs7bcsqYolYJJlOjNWQVLqcTA0ZlEwJS4UlB0QaU9+vooXXw94beL5+9llj
         BtKR+mImotS0sSgAj6dS6b59fHOi11Lt0HjMDv5kN/WgyG5Nn29f2ip1dyaoVd8F/npa
         21Sfm9yyTb0HSTe6+tv3WF1sDQAZUgUcvrsgOgXvfeJuhJ4bHyzw0t2gVIyQ4Me7MMNP
         wXCgtXARiVw3GLgTsglD81+2u/gHClk6bxV7dDKgDd+u4T+8sn8SXiUhJOwcO+Qtd9K1
         l+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134181; x=1792738981;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7ECuynPFMnAXoH7UnU3pPhhBlQI55oWE7ikBWj/6QM=;
        b=P55rYK2DQrstGX6oFHFhVG4n1qECrsJY+KtaFzQ4RkWpJsH3H7zh4SjMVAODizeid9
         VISdYvre/lTecP88dW0aIMPtcmmGHiO1XG1ECDvQ7mEwUzcnmdsuOetdAOSVvajxyYGI
         IPkIJxXUrd1Hx8zSZVBXPiNO40+5VipcuTqbUJdvsTghs5kzfsV8jSfdhzoD4FHq5Pht
         Ox/SaEfRTS+0LvSveMFNUnUnw4e28rGl/UJMPbwBRn86uRZRIWyDqx+EfnqItI1ZsHxp
         KGUgEq+KJvMaGWVEpV71/PpqMyNZGhD0waryvTjN2RsiUwURHSH17dv00bhEaqXwsdEi
         VwQw==
X-Forwarded-Encrypted: i=1; AKwUvBxEHwIXi6iIuadfV2pcP0gTIwAJUcJZaDxMZ9sFyCQ/UkyTcloFNXVpl3Rpqm/ChQ/E8x3xH6mDnfVX1zM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdqUm6vrzINsJZAUJUCue6H4UJ0rZDz9ozKHSutTLJAcm2dZxi
	EDzYY3ieVZwwXsEiADyvB6jKRiOIvo8XRG1b9Z5GYLFgpQmrAuSz8LSu
X-Gm-Gg: AYBFou23e1uhh/S8cyz02zsy+xuNP32m6uqyScbQnlU4Fm36/MA9WHMUAluiXxaiwqS
	/s7zJ5lXnZCLzaaAepbsl6m9MM4TKanhU99Q4vm9HFmGp08Iwsu02F+II4Jme5UsthEnLbZ+ZQW
	NJXFqbYH2MfKfBsM1xmmJJvlXnfDzvsmZttkyFbJldHqBA5fuNF2MRS/UIRUnsEEGPxhtccHU0q
	pxTiL8UQrh+rmt+nL5YRG0YwtFzErSEDI44jxny3PPAGGs/9Hbj05jVMEjLaGW0nSIPgJ8lqz3N
	oLlrglXGzp55S2JAT42lknBvIQHZ1cMlnaCw2YxyfyxthnubcHPjjHTx7ID1yhnpCMDqNaTPCNP
	sFDEdZ4AU6WKDvHA/kG7bWCRPcjmA0p5WRBcVm/pZyN0PvS7EPmvJq2Aj9iBcuVBKWeXbBP8Q3i
	VRDvbkkmYnBiIoEe72329BYcmkLxQR0NwcYovsxhBrnstJjTj3E1CdpgIVVuN9qBmUNrawSSAi1
	18m4qAw81/vQNMg8S9gg3awQ/Q+tZWTofGHVmskkjZBh49beXE3cRkT4g==
X-Received: by 2002:a05:693c:88c6:20b0:359:89b9:5e09 with SMTP id 5a478bee46e88-35989b98cabmr23303257eec.36.1792134181207;
        Fri, 16 Oct 2026 00:03:01 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm4668641eec.6.2026.10.16.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
Date: Fri, 16 Oct 2026 00:02:57 -0700
Message-Id: <179213417712.1857356.6461669805362228910.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792134179; l=720;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=zP2obJz3HeuvKGl2nJSDhnLPQDTHZAQgKwICzUxtlAs=;
 b=Ehu4kuCdgJFTDnwERgVz09MpBc6sKrQuQi3WzVTfXZZRn6gnjof0JjrrjR+uShX+6uuJl/sO5
 ugIzBb5hB1oA+c4cIgQyyzCQhT53SKZWgE1VtMGQLDtqBiV87YAIU1H
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

> When booting with unaligned_scalar_speed=fast,
> fast_unaligned_access_speed_key is initialized incorrectly.
> 
> The key is currently derived from the fast_misaligned_access cpumask, but
> that mask is only populated when the unaligned access speed probe runs.
> Specifying unaligned_scalar_speed=fast skips the probe entirely, leaving
> the mask uninitialized.
> 
> The information tracked by fast_misaligned_access is already available in
> the misaligned_access_speed per-CPU variable. Use that to initialize
> fast_unaligned_access_speed_key instead and remove the redundant cpumask.

Thanks for the fix. Looks good but needs to be rebased (apologies for
the delay on the review).

-- 
- Charlie

