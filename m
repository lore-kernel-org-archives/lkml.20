Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4435A397
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267622; cv=pass; b=o0eAXc9lgcPMQzedV5iEYs9dXc4gB8X/LyLsZyMLDKdfQMJ42YzLIqSsa85xQyWZcVJ0lor6ZIcnTRxPWg0NG1OeqdLOups3kCcBitLrOcj0ztx7tIWP0y1zYuOYS33t6Nc/C1fG5MYdK5KTZo8VHrsWdNEsZoiMT8918qTdjJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267622; c=relaxed/simple;
	bh=HsqiZkHlethsCftdDK8oINDRa01ax4a02ujCR6NVOd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsiyBhfJYNxxpUUdp1iK09uqR4i/Yz49bl8WDyIBg7FKF3ZfjkQVlfjHgF73RV7GuqW+Kh0gRXKmUU8jubZZ6Slv3BV9xhUX1NcOwIe2uOadvzKNETPxzOWD/wZng43AXEUMpDZtwZf/Ho9Kp5BYcqqB//8+JYsdMHDLEqDIBuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdpgpe1p; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdpgpe1p"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so341691266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790267619; cv=none;
        d=google.com; s=arc-20260327;
        b=IGKZYs6rgnyekCX5t7slbc2WS9/Lueabf91fmtF+MX1TFeT7rdxXvgpZJtMHg+K8HS
         AXbtJZFgTVq2kI/L4AEvrRc/Iu2cotN+yOi5FMn/4u5CSAhKUXmdljxefupdoecvloyt
         T5rruEoDERMMylDIHH2Lt+6Z70SIbSLTGaLc7ZouyGZscrUBBbIeUzt7HJkJxB5tXiXw
         4q7SSxCHQ52unFAm1jZZKxTYfFnuAXtGpYX5DXlg9Kbr5wWkS7jENIsuaxjsji7EW1oi
         biKwkcuqovXwfGGR2/iKGUMUTBGNKr/LcQkWHDvJUkJdjHhSjrvgQ4XjN1spOkkFA1su
         t4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsqiZkHlethsCftdDK8oINDRa01ax4a02ujCR6NVOd8=;
        fh=3vraJ5tsJpQjfrKRowROsvokp/ItJ2qyWE+pwbR7+js=;
        b=dh1hNG1+7sGTRJW7nW0oPRc1mwfJrTwwDL4r7Jgh7BfwA5VPPRPeGIu6U/jxI9GbQF
         HZDfgpalZOePzG24KKEWvhIVwjzgo6MVethU74ykYlyO7W/ReWor3r4bgFRdCi/Ir2D2
         zAUTD3qCc8A7qHa/gQN5orHwjoiRMt+FBGpqAyy5fk8GCCmQ+eWY8pYzBALhxcdcSr6+
         pVtQVC6bGUMTDRRhJdMp5GixVtbwvgIIq8l6eWWSjuAMyx+h9HyvBkpqk2IUcNHFfucr
         XKYH0tTGs6jCDCOPvjzoOHLYNbNDweybGGKhjClIjtDiMPH9tFJXHnBy8TDpacp8HPrR
         WItg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267619; x=1790872419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsqiZkHlethsCftdDK8oINDRa01ax4a02ujCR6NVOd8=;
        b=sdpgpe1pEK/N/2u3pZbH/8AmptW4tt+MXk0KT3qoXiDEmrp9tvkbELBarh+8wrLs7F
         eit8Yo8JhBPxW5KBumBajq8tjIJzBrHZCDpWu2YpY+IGT+/lZGDkijZ83XMzTqOGyuYs
         z665+byecvtu+W/Oa+EbwxZSzlmkQgpACeI+IP2YUau5bTJ8tcyt/T3Nmh6QDGdY7Vyy
         9g8jLP7YazjAOgRDB3DbIShQRtJnXXfDCCMsj6X0WTKPk/YgJzzNwpXKuRDumgZJQVdN
         BY8c8OUe0L6jSf9OXRf7Dl3Tn6L1dru+9J5D5lVqKAreiQKxwnyyivuo/0frLk9xfvUl
         PMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267619; x=1790872419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsqiZkHlethsCftdDK8oINDRa01ax4a02ujCR6NVOd8=;
        b=SS67srH9uHGOI0ZWh60EJ/f82yD0WCDCzdsVEmJbW8XvIrpbiC60mN75kwYQjWv/qz
         kxYoQPizl7o0jywzovO9DR1KnAkH14YNL/7hPlibkLN//VcwrYfqq2daFvdk46SekBgt
         5W6ILuHPC9pRyq7camJ9KeOuXYFgrw/PHl3P8RvVOGdK1UDD/Jujexu8Z2FGCl76HcIA
         8aXXwG1ox7vlU7TukoQxZ5GTlbbjv9MHvCAvizuBNeQYolw+rS3zn0gn5TLOPiStsqBt
         DSJdxZyKc15X0/loAupKoSesRFuvut4khJ9KHYQKdGKnfGWX64oUBf1IUBX14Ndme7jK
         ZCag==
X-Forwarded-Encrypted: i=1; AKwUvBzQo4Ntm2iikb/lJdNp1ZM+1KufGmRHlcQcdNOTwcgady3p1rqW94uiUqaPY6j2CYzrOz3RT1MF+p826D8=@vger.kernel.org
X-Gm-Message-State: AFuF++nDX+bjWQDbOyLkEmM3FQ6Zob6SLylARpK0f+Podh886RulEKay
	uTMzx0drbevIoz9ErKNnZFfoMwI4bTD+hkK3K3qKQoHpS85rnJPiC3ol+lLcc2wpyuwog1cNUaQ
	KNSqjvGYaH1bAT2dwlBtzBqCvxNVSYBc=
X-Gm-Gg: AYBFou11CDQPa1ahFTLASlDAxg9cEQ1yj4vYOKOow5HKUuchXGRzm4HF1uVE3IxA/fH
	f1FvSb9rHS9LWKFMp1+57Jy2qKqjrBcVXasGIdk6Hz5GHp7yaByn09UtsSgcNK4seGnbCCd9+3l
	ksp9oFVNkixNi52X7WgmjLzh1bUiqXxsuS80QJahMYaXgDzz3980WQ5Huzig5PSTDIopy/4+PVP
	GQXR8kzt0ejkbGVPfX5eayLlLHnp+/EFDFGSABXGn2Z/eqnb0842sPajI6TVzzkuA8F8pHkSVWp
	oo2ZzLM41Kx7pA+qeA7Nu15WhJk4l5+7WIeIrihO0YPL1F+dfkpuzKQsmqX6EBJRsMWF9BZS
X-Received: by 2002:a17:907:d508:b0:c29:d96a:2ea4 with SMTP id
 a640c23a62f3a-c2ac22ab96amr266478166b.26.1790267619222; Thu, 24 Sep 2026
 09:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924160354.531101-1-puranjay@kernel.org> <20260924160354.531101-4-puranjay@kernel.org>
 <DLNOU1DBG2W4.1SHS4ZHDHYUM3@gmail.com>
In-Reply-To: <DLNOU1DBG2W4.1SHS4ZHDHYUM3@gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 24 Sep 2026 17:33:25 +0100
X-Gm-Features: AclHuK-Bi52AMA6s0SIbXQ-XgYBFzCwxroPYIyRACpcI4-gdKpMP3dj-AloUdrM
Message-ID: <CANk7y0gNO0xrZKyX8SafRU_r_-4jo5oQGvTzdKhJ5JuRyMbbuQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] sched_ext: Stop citing the x86 JIT for
 the cmask cmpxchg loop
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 5:30=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Sep 24, 2026 at 09:03 AM Puranjay Mohan <puranjay@kernel.org> wro=
te:
> > - * x86 BPF JIT rejects BPF_OR | BPF_FETCH and BPF_AND | BPF_FETCH on a=
rena
> > - * pointers (see bpf_jit_supports_insn() in arch/x86/net/bpf_jit_comp.=
c). Only
> > - * BPF_CMPXCHG / BPF_XCHG / BPF_ADD with FETCH are allowed. Implement
> > - * test_and_{set,clear} and the atomic set/clear via a cmpxchg loop.
> > + * Not every BPF JIT accepts BPF_OR | BPF_FETCH and BPF_AND | BPF_FETC=
H on
> > + * arena pointers: arm64 without LSE rejects every arena read-modify-w=
rite
> > + * atomic. Implement test_and_{set,clear} and the atomic set/clear via=
 a
> > + * cmpxchg loop so this works everywhere.
>
> arm64 without LSE rejects BPF_CMPXCHG in arena too.
> bpf_jit_supports_insn() there returns false for everything that
> is not load_acq/store_rel, so the loop doesn't load on such cpu either.
> riscv without Zacas is the other way around. It rejects arena cmpxchg
> and accepts fetching and/or.
> So the loop doesn't make it work everywhere.
>
> After patch 1 can cmask_set/clear/test_and_set/test_and_clear
> be __sync_fetch_and_or/and and CMASK_CAS_TRIES go away ?

Yes, I thought of doing that as a follow-up
