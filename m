Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793037727;
	b=BWfnGx1APMsf6fS4XcdfLBYpsMVSFqagHrjEWsX1vCz+oZbdQZXlp/NntHS28XF/M1qB
	 sZU01DciuiIKkc3WhhxbdG9gUE0hPHvCEVoiKYmv5iXAva1G0Fgc0tZOJe78wJLJb38u2
	 QiNpPzAhTm8MMuCVp1Dob3ya6iMBn22X1mJNhec/271Ww0mMS84xO2ZXQeW+bhAtogPp3
	 nxgrYMchgrlZB6RfgEV5+vPErtB+D9IA3e3rSqAJv9IiXqcv3dbTpIDuZiToKIBNTbfc7
	 /M2UMNOpvnQLif0OTSDODhMKn9eRTKLbdaZ+iRM+4agfCULU/DWb5JuoqH+n/JfPHyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tE7RP4VYsHqrXApguz8sNdRczbXmH+5NrdAtgpflwuU=;
	b=JcEbUjBjlTgcu7Srdb6Ee4Y4d1g8mrub0pJvPjDoHbpn9tMGKXgeFhd5kyvZv25ShlMm
	 xxXgyL40lX8OU0DgyR/P6dR/Q5dlzj+L33AfGFXIz60owXsCXPCwKiF2q7p0ND7/xaTwU
	 gAIjSI/DIXWST2PAHcu8AKIEILYqSGssis7MbzCFN9hGJbwIuiU55a2I+XZGqCChU58f4
	 a/6i5M8zWBSncP9QrDSjS20tz4W+iFpbU/+OLLqoaHjSWznVQrMG2YFj9xbi/i99qI7iB
	 UCtMHcWtRPAOzPpHixy2u+CkMOjoSVgHogp1CQhYLh8+IInOQYOzLQNJsium9woCfzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GSt8eQMm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15033606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15033606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GSt8eQMm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso6845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793037725; cv=none;
        d=google.com; s=arc-20260327;
        b=oOUK/wGR28MUa1d+xMjmHhZdL9PckvpJUPUxZRNaCWjFhZtyX99Qnmtx0Oh9t24yET
         dZPayIyUJiBJP2YybplftCOca2mVTjpfrRPdWHXq4RKhPW1u2HSyMH6KQI53xj9vecsC
         zfTIuPiYZGH2Rzgnt8FHjgBGJ0QwDJShPmOepNINhfO55Dx9MfmKKWofvA4dOlbSwyuk
         1uSAjK8vQ1eQADykrgR9y967cC5TN36FYpMnUHOwhatHCuVIuh19PdaC49m5Y3BFYb7b
         Y3CRSuRDQVarfE0WSeakhHuCiEnfpiwnATcIPmnE//O62OfMCPEatJkqgz8q4mnIIywW
         b/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tE7RP4VYsHqrXApguz8sNdRczbXmH+5NrdAtgpflwuU=;
        fh=UArxsK9+QWazRiDTif0sYhLUvLjjXOKh5DvfCy2bYP4=;
        b=lw4h6PQ2IQ2B0dRfTpWxOuqjuCz3GDdDUDs7IlRyuMHj2/bvNKnnCxu9Z4dQA6xLG0
         mAMIIhnC0Q3JiPvW+DoDYuc1LmvuOFroekMfwHL1ySO5oP0ZJVZkKe0/Jt1zVTzWdpks
         wg/c6MsnszowryaBdW0Y/6q+AiMBNegcMO4cS4p1cEystckYhNH7QylXnrhY1RlGIU4o
         uht4D1h6qsNriWKuDvsV3Hc7edvX6AzFbU+snuvJBtT/gKFaJnsx44zShkcfjDjr3Ogh
         lktGH6TaLaMudCmRoydk3IjjnXevshbuJtAbmc0GxXJJbxKGVpd0HSIoRrFG58NktLHk
         Iv7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793037725; x=1793642525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE7RP4VYsHqrXApguz8sNdRczbXmH+5NrdAtgpflwuU=;
        b=GSt8eQMmyonsmu51tnuB3OOoCLAG5Ub3saP+6hzbZxjvXs2HavzZWqdru6q9odLc4x
         8LZgJ89V0wIRfGdc7DhIluw7u2J5YCb9BrvVTFuHpuCVo+Dh63PI4bO6EdT/unM+OkvQ
         fdm85tXjnIrCIlStBx5JtUdJV2+GE7Ymx6AobqUFzfBG6IkIaCVYdsqs0rpUNtzdqMGo
         G5pbGkRiBT08huUAERs6p1O+qMMPoGSQ/EQfuk1JgUcg9wyGzK1sxkCBpYJ6wjVEHIBN
         f0qJBda99t9zffio2My9RsJ+qhwXwPAlb011+xum5s8GmE9XRsgQo3ncrBNVFI/jihAe
         PcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037725; x=1793642525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE7RP4VYsHqrXApguz8sNdRczbXmH+5NrdAtgpflwuU=;
        b=1RNhps4ljtuB9qwi2rmbMGFTYVk150CKi4+7PLrdVWY2oUHsejOHVAsCmze6IOCwBO
         cHak6KMHpmJl765rEJS6qilGjz+jeqVTbUF+UN8d/RwutefE514V6myB0sUhGf6kiKql
         uH6bc9hAsi+jqwLhA0mzGIk6pdVmUwVq3n8hm0g/5fjy0sa7B2Et+edKLIYhKtFfMv7y
         w5ueUo2Lr94aNgO8GPGtwDivLhOAfnUKkCQqDlkb3HrVAZsQWg9BOlj96/ezJFhECyLJ
         97sxzDHwJq5ytImv16PHMJAdzgSOwqN8KIVduW8pDprNUZKBMsBhp9qqnijPCI2fXHmZ
         T8gA==
X-Forwarded-Encrypted: i=1; AKwUvBzRvRUxSe3cGLr6CN2IQKiawJ4AXQpihInZqYJilUbJ51jBAuebycDoEScUIzt8m0VtQViTm7HalYp9Ids=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzMMQVvHHB0SLyivoi0BRENbgdIFQHXV4HeWasY8L+KLenbwOU
	nm+MjIGI0FNWx+VCdWIgIsrqGlmoUsAjZhjgfooOY55d7gJHWfacmE7tCSmjJkcpV9YWuSoeEDG
	iu43i3xBZip3r4UmbL5BgwJrjclJi/E0Aj6JRLebK
X-Gm-Gg: AYBFou2WmIgX/v0q7IPwM1/M/S5BNXZAAM2cj0LhJcmACx9LUSSZBxFvxkUljaEDgNn
	UGTRl/mr6Y+pkp3HZpRfifR7lQlnkMKGghbAHrKnhr1XckGx4GlTTl/JQfed/+GBxZ6bvMp6MGN
	u/zWMyZDwfUcFEJ0q0ON6aH+1XinqrboKyZELyJ3pzsy9ILrBirp2vKxz3KCtcBDgHIQ+tBHopS
	2KtdM2XS97rGvwG0xstoRvk+JNuxhBSX2DQAbYHftxsepHBbPKmVBkbsLQvLke3lDcbyG4CAyzJ
	w83it4FOIqTY9yFgd1l0x096Ki19wHm4zGUE+tPHz5iEPtLCFHaMA9eAJJ8K6A8v3waW6vNvuGN
	9thK21YHyWbeY9QBJI2gzvipnRSt7db5KEkETW5UZ8rtMwzKbNtudktbmEwLW/OhMXSXa3yTBFe
	lOvO+ld+WM/BrkjMasSfCSkA==
X-Received: by 2002:a05:600c:2295:b0:4a2:bd1:a80a with SMTP id
 5b1f17b1804b1-4a7d73b0af0mr46865e9.2.1793037724801; Mon, 26 Oct 2026 11:02:04
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023222313.3979455-1-tjmercier@google.com> <at9U2HvyUP-iYOCt@tiehlicka>
In-Reply-To: <at9U2HvyUP-iYOCt@tiehlicka>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 26 Oct 2026 11:01:51 -0700
X-Gm-Features: AclHuK-fek2ms36qxSTQ8kH_qS9sI-bAShEDJFdyR3pRLqFaZUwSwPiYlTTU9KA
Message-ID: <CABdmKX1mLKEJNiecW+meJ=LB_Kb8-ieeWdZDd4T6rNR9gKuq_A@mail.gmail.com>
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
To: Michal Hocko <mhocko@suse.com>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	muchun.song@linux.dev, zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 6:25=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Fri 23-10-26 15:23:13, T.J. Mercier wrote:
> [...]
> > ---
> >  mm/memcontrol.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index a05d9a8baa1b..84f4a8fd4d16 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -2457,7 +2457,10 @@ static void high_work_func(struct work_struct *w=
ork)
> >       struct mem_cgroup *memcg;
> >
> >       memcg =3D container_of(work, struct mem_cgroup, high_work);
> > +     if (!css_tryget_online(&memcg->css))
> > +             return;
> >       reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
> > +     css_put(&memcg->css);
> >  }
>
> OK.
>
> >  static void high_irq_work_func(struct irq_work *work)
> > @@ -4463,6 +4466,8 @@ static void mem_cgroup_css_offline(struct cgroup_=
subsys_state *css)
> >
> >       page_counter_set_min(&memcg->memory, 0);
> >       page_counter_set_low(&memcg->memory, 0);
> > +     page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
> > +     page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
> >
> >       zswap_memcg_offline_cleanup(memcg);
>
> Should we simply disable_work_sync when the memcg is going to be
> released instead (mem_cgroup_css_released)? That should both prevent
> the run reclaim_high during the memcg shut down and and also avoid
> plaing with limits to work around.

Hi Michal,

Unfortunately that won't work for shrink_many() ->
!mem_cgroup_tryget() -> lru_gen_release_memcg() which can occur before
mem_cgroup_css_released() runs. (mem_cgroup_css_released() happens
through the cgroup_release_wq.)

The high limit reset is also needed for targeting live ancestors above
the offlined child in try_charge_memcg(). Without the resets,
high_work is never attempted on them since it gets dropped when
attempted on the offlined child due to the first hunk, and
try_charge_memcg() breaks out of the loop.

Shakeel's remote charging patch
(https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linux.de=
v/)
sends remote charges through high_work too, so without the resets
those would lose ancestor reclaim the same way. Before that patch not
performing the resets means reclaim_high() runs unnecesarily against
current's memcg (not the remote memcg above memory.high).
