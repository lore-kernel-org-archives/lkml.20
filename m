Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59994CCDCC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012344; cv=pass; b=Ih9w3O/kxTk32bPYdpSY7QKRbZxg165ynAlOBsOiBdNEu6aPmdh2+yiJyF6fnJ5CKSHSGwnzJG800aZ/zIjjk0JVIvd26HxSeJwEUrmjjQX7ftMaGgGj5YLB9GzXLhxKB6ScjRIQT9+IozyUKQn31oTZRM+LRTisal8nTnrIKPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012344; c=relaxed/simple;
	bh=kP92Ak7RvzGy2hBVDe8IS5YHe71q5T7c9Q++nOdItZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RW4sJeJHfYG0Xd0s9Wi3hu07N6VxccoJTuSLkUIxkIZbqI/RYdq/l3baYfGVDGgmeA8nL5VeyIlEvPSA5fFUP22vEHfhlfq95PaIICNrZAJfamd9UTB6F/zwP/Z4STo4GRzMGbdcvyYRYYPDxGwaNzHwr/wYw+ilFv8jJArDHn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3rz5TjC; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3rz5TjC"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so3427763fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790012341; cv=none;
        d=google.com; s=arc-20260327;
        b=p0fKVY+8BO8yb0xpkDPux0B1AsKyNcfS7egjKrh/sCwVHEGv/7eohmJZTXS4QOsOAt
         DP9g74usyjyUhqkhd+KB7To6jl7wItTrlin8yt26V7O+5axqp5YddxMagw5BfDNrk0YU
         xFMi6Y7jqt3MztUfaprIDMURpTmWX5rNCkefbhXFvgMSpWeXCD/KRdSg1CUC0L4I31KM
         t+eG5QEZ1MvyuQGCuoo9D9relTmzedk3WEORJplQYsqXQOh1jcx+wWgzWdisVrMJkm8J
         qy9z0WpiavtdiBvghkhSQ5dCD/y4obNEAmMx8v3m91NRuqQJCnkw2txNFMw01XzQFebs
         E/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WqxxhkWEnQe8FoDsGHahW+AX2LGvlhUkNfobMA0XIzI=;
        fh=K9Ey7W+SPBTKz5SY3DBtNaMzfqiPOeDrnwz5n1r7uVU=;
        b=sjeGB52o/oyu9JhPKt3jDDx+0pRTnyYABmKMcFF7TOiw93LqFh1N93nei/n6jaEyjv
         IbhJhbawL4c4dh3cPUjHgVGikqBLGOKS+rYSGZ3EvNNSN31p9wr+vBhIgxB+WjsCLkyw
         MzL2zOTWJecpL+s7mUPRmLi+1eCV5ciCLNO7vbOSMd6ARwtThGzU1zBDyMvgZ3S/SoqC
         BnltSDf4kX7sCYk1uPUEUUUu+VsF+rQrMu76R0qG4RtnttJzFJJ8JYVIb/VMGYzzW4Kr
         XunoS8tzW3yDEP/DCTdRsF8GfPp8t83POU0Z8iz5PFehqrcpplSNO2Mhaqst41cSpPeU
         e7+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790012341; x=1790617141; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqxxhkWEnQe8FoDsGHahW+AX2LGvlhUkNfobMA0XIzI=;
        b=J3rz5TjCItSSQgWeAAjIWkD1JRNLanF+PgODdumJkjJwjkaI+AQRCBzbQ/0EKTMeas
         cIujKsX0atUzDcQC7R6zWNIioGJGVw61I7eGPyrTm+Q5w4a9S6Ih1qTob33phnrS2BuE
         yXjPEz7BcMuf6Po4I1dpQFpUaDhbmtj2sbWoDZoRlTJBWcrPDhgBS4LgqMt3v+flMfhz
         JTZRPChzC/j5BRssufUjKOZG6IrhHz5IDV8DEAuZcqyxcwXgMOFRujaw8z2X0nu072my
         nZPXH53P5HxKxcoq+0JE72hws5j1Tj/26OY2NLiM9o/gvL29W2spMSG+wrIUe6TB8b27
         /VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012341; x=1790617141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WqxxhkWEnQe8FoDsGHahW+AX2LGvlhUkNfobMA0XIzI=;
        b=J16YOQJLRdr0y8aa1S8DWbX6EJQy2w2q/DgJHLu40zPcOxJ40nadvQOcOuw8z24mjT
         JB9Pav/XzlOsUS82IIlwBfcIZ860l/TbZrPMHdWDXIDg4JoWS9dO3owMcDnNrevEORWU
         GmpGXpV99VnmYP53x7t3+9pxYNBP1idz9YxLC2mMF1BJF7+LevQX/t2OHCPgLGRD/z2L
         lLiBXNR0SRscujJ+dBcuPFqadxAAjx/8Q8bVv5cat2D3pRxgrhv8+Sh8zB6BJnLziU99
         I5+9vHkky8UIyLcMCwiRHT8kxWzEPtXK5KIsVJG6v5Q+jr1U9+BQ1eU4AB4s8HZp1IBR
         VG0g==
X-Forwarded-Encrypted: i=1; AKwUvBwwQM0gaHSBcJarMSgmr7BD7Bhu9bS+VRTkXJhkX0DK0nUTGtPplEr9o9SET9Bhdaas5sM3nKUmzL4PJHY=@vger.kernel.org
X-Gm-Message-State: AFuF++kpeSzeAmdAINwRIJnMbDzScEuzX405vv0Op8R8rCA3h0hM6gw8
	YNOJAsud12Hq3H4hl6ixxV62tlVC9UqeRaMCMv61WWztTVB3Ct/7RslIH0DQGHUClRHIEnwrGb0
	2RLvwJl5hsuP9KoUxcM1ytv9HpeGYOcY=
X-Gm-Gg: AYBFou2SJs7333kik/HpbQhHSmgpsNR1RXaq0kaBLuDUUq9XSd34xc6TaDGEbTEb40r
	OkSlhv0ndBvNvZrAcEVL/fMuXokR9eYub9ywbOADLqBpVV8k3dSSunbtAwS3D4ljb3SHp9IhRih
	HJRhA81p2U/FKsAiZhjHshA/vkz3F30bkFhmNP+dPAWA3czM5smCYGokMmoLqGsM0LZ4bm+8s4r
	M7LlJX7XBvDbg6CH6Om6HJPRoPHYoI880sg9Yv6oU8tPhsqxc0j4VyzwHwlFE/ovIRhFlaIfyrz
	N3Bn1pqJro8saoeSA0oew+g4bt22DkgcspNA5knePYNoA5FhrbEMyR2B1pK/p+ADaPA1Ftj/fhL
	p9YEqQv6gMPRtKA==
X-Received: by 2002:a05:6870:96ab:b0:43b:b245:30ac with SMTP id
 586e51a60fabf-486e575539emr11232161fac.16.1790012341499; Mon, 21 Sep 2026
 10:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921154650.130677-1-suchitkarunakaran@gmail.com> <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com>
In-Reply-To: <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 21 Sep 2026 23:08:49 +0530
X-Gm-Features: AcwNN1XeWmSNSpYjUTctrJrH5Vc0O-P93rFea4YdAqzuTsR8qSpMr_fjrprOGQ0
Message-ID: <CAO9wTFjK+oRT-maca6A1UDBrgYTGB0Zr48UiLm2Ees835POOFg@mail.gmail.com>
Subject: Re: [PATCH] bpf: add diagnostics for rejected memory and map accesses
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, john.fastabend@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 22:35, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Sep 21, 2026 at 09:16 PM Suchit Karunakaran <suchitkarunakaran@gmail.com> wrote:
> >                                       verbose(env, "sign extending loads from arena are not supported yet\n");
> > +                                     bpf_diag_policy(
> > +                                             env, i + delta, "sign-extending arena load",
> > +                                             "the current JIT does not support this load instruction for arena memory",
> > +                                             "Use a kernel and architecture with JIT support for this arena load.");
>
> Did you read what AI generated for you?
> "Use a kernel and architecture with JIT support for this arena load."
> ?!?!
>
> Please apply human filter to every single line of "your" patches.
>
> pw-bot: cr

Hi Alexei. I'm sorry for the oversight. I somehow misinterpreted it as
"Use a kernel and architecture with JIT that supports this arena
load." Is the following diagnostic message fine? If yes I'll correct
it in v2.
bpf_diag_policy(env, i + delta,
"sign-extending arena load", "the current JIT backend doesn't
implement sign-extending loads from arena memory",
 "Use a kernel and architecture where the BPF JIT supports
sign-extending loads from arena memory.");
