Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F138B7B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381723; cv=pass; b=YkmMNSxAEdKSJ1z7247uYruylZAlt/3fTsos/sDjQRehIcNS/JIFwK6G+SzZmIlfP/CrLTZ6wvn/s2QmafYRRGgkqszqOZsJ+OccvE5m/2w291vpY59QOZv1KxGljSfyw1gZxXQmnXFIYfkWDzK0RFqI1DMaCUk9O6NcdACuuAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381723; c=relaxed/simple;
	bh=LVhIXvpFzVpDu/8jrbjniSLr8dV9PsbTGwAGD6Kvgqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFc7OnY3iCRetPEIEfmqW8jQ0ATbAV3v//eKh61KHaOcHm+6KpJmRM712aYNHANAFeSu494k9JCraZT1DZG9ob0NoeKZUnybVWEcMCz1/KYWI5F2t14easHhO6JvDNN5eejVIU/gwM4moiyO699/yfBGEuPU6zpnJ82NORELQK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eISHAEUG; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eISHAEUG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1670dad7a8so245113766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788381720; cv=none;
        d=google.com; s=arc-20260327;
        b=HXNsONlsa07pdUnOIOZnfd2isZ278HnHJWBhF9m/Vq2rI6ko466NKjQ+1Y03DrrnCi
         OBtjpDYh4CKbyOk+Jg258wFf8DTZeg08lL7LCfRkWdbY/exjJqnmfWVNZniKuJfyztoH
         +kfZ5v4tbxZDaITwtr1KQD5Djjw+pzkZjtemw1CLQW+QncVWXpo4JIP77+Ubf+L213/0
         qmxNyA/qpJpp7vkSo9p7ihC01FvmONVwtuuwfmMEdTH9Ma3tt70BQ6nPUwry2ugfoHvT
         6QUvfs6r6gDhpEoOPUjkjNfby+zg+LIabZgtdBVBdJJS2vggdpMkT6vy5Ig8JTuTYRpq
         3ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LVhIXvpFzVpDu/8jrbjniSLr8dV9PsbTGwAGD6Kvgqc=;
        fh=6NkjhdnTN+MSc+7a+oFXeC7Cho+CpzZyx/+Qh13vI3g=;
        b=aACTSBcc5EaBZSeCdq6XpOFHN2q0VIQgNDmMuOqGWDELQrWLs6p4Vd3Sg9tznPAcqI
         xIHCx8tQPPNhmTI0Y0hE/2+M1eZ+JQ3vMyeF3oNK4bCx/hgNVporMYtHaFdGsAIlV6Ll
         9T2gVey35EG1AZA0CWYO1Tb/eID0GnmRkmckWAD7V2sdDp+NK2diaZlJZ79c4NrlUOuf
         ooswfBh0GSCbxAldwaYczUu7vPHx0F2tRfLTea149WjZnhQTA+8+ZO/Gzp42hLPpHXRw
         PYaAFWW1z9pZVUMlxcSlfOHoEwQfJlpHQGTZf0Cq51rsOVJqXlgXakGbOh1fgZexMl8n
         a0AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788381720; x=1788986520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVhIXvpFzVpDu/8jrbjniSLr8dV9PsbTGwAGD6Kvgqc=;
        b=eISHAEUGc2SvT3CzeGltwiFcHZnnQ6ea3r4FAD2xyVcfAG/VyOGHwDA9Z3yjFOQJ0w
         kzHEI8gGtapjd3A+ASTnVUWg7KmDvreDcJGHaZXsTAwBeYSsCHt+EP4Pm93zLwJq1HH2
         FmFe25mgsH5saIzWOf6nySwrcKAeb8TtdQb3fw2xJAJezcoblDXU4Ef5E8p86Mzc1OZ3
         sI37kFVbl4XFHf/DjlQbDhgWycRaj8SLL8PTj/qU48GV3ez7SY5rlBBnT+hFp5SoiUwX
         skuLkcfjxRRESvetK+EBwLfmjTJiEGphi/5FgBppHKY2JXtzdsvgFZ9V0fmm32l5h37a
         J29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381720; x=1788986520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVhIXvpFzVpDu/8jrbjniSLr8dV9PsbTGwAGD6Kvgqc=;
        b=kGyuuIISmgpFcMYjZY2WlfwHa/+Z+0vrItZ1CzLmz6STqqilijq8ZVIjazJW22sOoR
         5vlbcCcPSGVpZDNA8wmBDGkRET/3SlJQ4/N6QMsp9AZUg1WmCU02o03EtAWChi4wZSD+
         nTDfWYHGJnDH9jXfclhyhf+rdFWGSU7V86E4b00nYI8H/r1llwrjm0LWQ6nI74Bc0Q+0
         SahpGM9VUgXc3n2rb3c4OxhCIFBOOeAAsNdDW3SfUj+4jsciXoFPDVfKVnGKue5Nsw+s
         4QtM9s7VZnuEZyIxbwojUf9WnyryyCHk/qm2zwntDoEdx1TlyNRmraQc8nQ3d9jJEDZb
         xhbg==
X-Forwarded-Encrypted: i=1; AKwUvByrgOcx7X9mb09DZYE/7dN8nJZbBNl/XiFtr2SNvnbGDEtiwAWu/2XR/254uMnxPo759SI/Mn1LQrCpyIg=@vger.kernel.org
X-Gm-Message-State: AFuF++li0iZOG74eopo0mJ1FMn9zDBtVA+PEQWXYNxdUfGM3yjb8lPNi
	PzHikLb06DytuoSCGpvtpjy+y3a7J9DuOb8wpsC4nPDubKleJIW7YWMnD1fOp3XTqSp9DL4GKsB
	MpIP7Z6YGHuJ5gIIZWl8GjO5FD5ObUA6/wHNtqOWu
X-Gm-Gg: AYBFou3CHCUVObIhng2qVTO0ql7gthXVFiRz6FOzdsbNjpiJgOYIfX6sfUHFGyRkxAl
	jg0sw1rH/BPP6oKOY4344bWMbHqdd6WtIO3GJo+umhLs8OhGYkmSK0ripqcaMQ5pbhtQWqHeX9M
	rIcxkGkQTJ8hhYkcLNVtbb6elmDFy9SdccXoJ8vT8y2kD6ljQgNBVf8CIYQzGpaADhtpM3F8TVR
	inO7L26+lQqPjD3dW/YExVZRae2ADRnK7EJYy15DfD5RKV1dl6MSx2IUexK1aW9kJQeI4+mvg/Q
	h+Ec97dOxNT9dhZVDXEQC+af9sP0Jloaw4jrm6FJUoTgV9RNxHnZQUg1rKF3aDVwLwLGj0jwxsm
	SyqkxzGvbfwim8TICHBXX+tuNnUCHdQ2YMK9CX099SavELE7JR+1TeB5mFRqfoMimLS+Jgggi3p
	/FT4DL4c1JRb4S
X-Received: by 2002:a17:907:c78a:b0:c25:541e:be7d with SMTP id
 a640c23a62f3a-c25d55b8807mr567367566b.18.1788381719836; Wed, 02 Sep 2026
 13:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828094703.11081-1-lance.yang@linux.dev> <20260829052606.49470-1-lance.yang@linux.dev>
 <CADrL8HW3=n8VqW+7YSb2kyhkHidNKGy32+2s7A0OfF+oYoAifg@mail.gmail.com> <apf5xBqj5560JlMD@thinkstation>
In-Reply-To: <apf5xBqj5560JlMD@thinkstation>
From: James Houghton <jthoughton@google.com>
Date: Wed, 2 Sep 2026 13:41:22 -0700
X-Gm-Features: AcwNN1XNWP54Rwi-EWw78kODWTxBfe6WSk0GmMqznEozoElZj8yD1pyZq6NZGNw
Message-ID: <CADrL8HXg-Ybh9Lqgo08VSCtyD=8byMOZZJqEDgdr_+=p_KwYaA@mail.gmail.com>
Subject: Re: [PATCH] mm/khugepaged: Don't collapse uffd-minor-registered VMAs
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	ljs@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, 
	shy828301@gmail.com, zokeefe@google.com, hughd@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:27=E2=80=AFAM Kiryl Shutsemau <kas@kernel.org> wro=
te:
> On Mon, Aug 31, 2026 at 09:51:33AM -0700, James Houghton wrote:
> > WRT the semantics of process_madvise(MADV_COLLAPSE) and normal
> > madvise(MADV_COLLAPSE), I think it makes sense to always disallow
> > collapsing of UFFD-minor VMAs, whether MADV_COLLAPSE comes from our
> > own process or another. UFFD-minor faults are intended to be resolved
> > only with UFFDIO_CONTINUE, and until someone asks for it, I don't
> > really see a need to make MADV_COLLAPSE actually work to resolve minor
> > faults. I don't think userspace can *rely* on MADV_COLLAPSE resolving
> > minor faults either.
>
> It is safer to go with stricter policy: reject always. We can always
> relax it later if there is a use-case and reasoning about the interface
> is solid. We don't have it yet.

Thanks, Kiryl. Sounds like there is still value in this patch then.

Unless Lance disagrees, I'm happy to send a v3 with the same diff but
a rewritten changelog (and no cc:stable) reflecting that this isn't
actually currently an issue. And I'll include the uffd selftest change
as a separate patch.
