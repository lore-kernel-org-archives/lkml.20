Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F935DA4C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558283; cv=pass; b=knAoowYZ5go5zAd1b2qGJQMUgPVm8iIpiVjfRD+EM6QurJcWLZNlHfzxdHdoPjiJ1o15jiAUJnGJo3IfXixZ7PG1Fv2963n6GfD/5NFLVt2MzNnJqXPBY8KOgQFz7hazCflsnmTTsBLYPt9FML5BSbyOy1VzBeacCvWDD7Nytb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558283; c=relaxed/simple;
	bh=0nqgAkzlSPgwqtDRRuI4+mfAWTF0IX7tVXYBeqoqGII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/6LutKY5aEPDTXZFO9hrFR+g17OMifMy0RRtElV7sZxDrCDIEi3nLVENc/Mz4fOo2oHGbbKGKfhsYPLsxkur4AJlC4hrYc47ibngZ/E38NbEuRP+9FPexkuZNh5Dla4u0D1FiaJnOXOsffMH9dupKUuAcE8d33Pt48zdQzW4EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGKI6jg3; arc=pass smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGKI6jg3"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso345758a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790558276; cv=none;
        d=google.com; s=arc-20260327;
        b=G/sBgxUq9SUAPmH++e/jfmDBlgCX/ss2X08IPfCbKalPAOQxKLIH2Fnf05NVw5KUVO
         6KQ5HaBTofUgHjKiwFLr88K6EBXQnR2a+MUC1fdBswFJ92kewhudIL1gGQ3P+M5Qcm8J
         kUS+BBc/RLRZW/+G4kwVyRKlkKd16ZfqL4FVyEhLjOkdYrlY8+N3r8OHEKoSiaEU9iRC
         Lg802nUs+48ToWv/1+oIGkCx0Y9QbKS4Oi33x4LU7w7OccHr2zrnZCBvJA5O7c+0dJk9
         xO3UEOLUqG8Es46kthx0ZlrXG7z+ayP07vUi23AxcmUoIkP7uMyjL5455WossnJD0Pu7
         WpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nqgAkzlSPgwqtDRRuI4+mfAWTF0IX7tVXYBeqoqGII=;
        fh=vpn9RzwiRiAN0yPkc99AeP8hwSQokFRq+vkkHamd4qw=;
        b=Oez2fOj+eRHtW5IojeTjXAw4nkp3kBEEEW/QZprZ/Pgf3w3OwiFleDTZwr9sIuItBT
         eEXOOXs2nfGb6bGwAgorAHzpBFMChn2DzUoIOcZEU9T6s2whdB5oBnWRp8GavBzHPJn0
         yaJkjm1l65cXZ7lkTWdil4zk7vP7dR85VP78e+8Kh/AnvRNFQYLZpztJn/RjTcmM/qhe
         6Elj26YS9YzYBJ+tZfKaTrV19qdAqLYwmH9VTFrarq/zVCXFpv66zD20haDFpyx3aimi
         QZF/oR5m+9lxn211t7C2Isr3jNfXodTSvPyPSWwhJ5I9TlbGKvAgRvTGsGpNMKFBXrQZ
         Nphg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790558276; x=1791163076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nqgAkzlSPgwqtDRRuI4+mfAWTF0IX7tVXYBeqoqGII=;
        b=JGKI6jg32qU7HvvlSYoxFjnAvByO+mb43g3GWBjUljo+LbdH8TCg/qZlan0cz0AYUK
         TuzS6cwINsUtf+EVB8QQC3JROVY2K6RkKqcMkH01GAdG3EbIsqR06ZVNaqnowGLGJs3c
         kdL4LJA51u3244uNESzs8J3djYiq1FDkkGNucwPkkuPD7l4Eyn+j+NcOVxmLa7nTjyKK
         xm+LjCTUpx/MNBG1ybaRFLKke8q+/58UPs2nqR8K+InKNrWfqOFrMtnL84nGGSyc9dvf
         stQ0QaXg4V1wk4NN3aFWpkta1JH+I/vH986ITm4d/f30QCd6iAKyHj6bo4afoaiuBV3u
         XHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558276; x=1791163076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nqgAkzlSPgwqtDRRuI4+mfAWTF0IX7tVXYBeqoqGII=;
        b=AlaxKKANp39ly9uC3R2IbXiw6zGXCJQ4OrBIH+MNR9QSJviB3f6+F1eV3G8O2CcXHH
         vDjBzcJMA9VmfUbDK9IzjO10Frd5zgarz/HpmwF6Gkj2mYx2JFj331MRVDhgj3ZbD8hX
         B9fxhaMnsoDZckg92n0dIsBQcKges6a4UMZJHFewYFBAYKK1yMGMTs6OeXtUwlCCYVjU
         UztQBsayROinAD7mD0k9Nf88pTz8H8W8yGCMRidHvI53mFncXj+rDVrwJ10jJVQ+WqNZ
         ML61xtMH4rnSyI9WShaEJZuWk4F7DEsKvPoZDVLaAqPbglb4bmeYymK3bJB63r7QKj+t
         GMPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzenq5h+pDk2GrjJDV3QziDrc7Yd4a0Ytbce4bCODO973G8unrFHQFHmk7rmGPn63D6MtnMHErLTlupZuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBnk0MJvKl1cNDM1xVEzDyDPYOXyWud68xQF9UnlA3bkyneNcZ
	wRhJwh9CErVGnYOMKf47R2kdXzVhMVeapCJ9kcT83V93zrke+nHg1rJSGmGW9/+a+ccCdkztm1u
	H3iieMQFq1iF+HG8dvC0wu6TbJZGAaLc=
X-Gm-Gg: AYBFou2ZSMPCYbVepp6PA/YLR02c9D0sOhWIZlACgZfO1aMZgQ2OTfuKgE6kXEWbWlU
	fHxeU2L1JJ9S6DJQoJl2AKxeBopB3RukTup48NjuZpfRVImz81nCq0OtstpEb8D0ZxbH1mWqpF3
	tG+KtiBPxr3kapmejucv6Eld4/kYhc5Nef5RZuGUtBQ8psBf45sZvHr/p7gzsNqtrpge/+UN6Y2
	EIdXZX+S5t4TmRXhiow/BB35sNSNw5Z/WNXlifNGRfNr9jUyxgdr7Wj3RkN7909eEywi7GxLNWj
	cLDEQKAKPKzNXfYUEln1tFat6axvVHFB9KX0W3V2CKuyIj0+XqFk7dUucKMdNScmGQdiwmBZ/Jl
	1oyoI2HPa0gwX
X-Received: by 2002:a17:90b:4b89:b0:3a0:cc3f:b93a with SMTP id
 98e67ed59e1d1-3a0cc3fcbf8mr4139825a91.0.1790558275492; Sun, 27 Sep 2026
 18:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807112818.958190-1-kimjw04271234@gmail.com>
 <CAH+3ta7b7MudRedhFG4xQH6-3ZK9gfkcEPy_aHsAHBwjyK81+w@mail.gmail.com> <apcj7xrcIhEw7lCl@google.com>
In-Reply-To: <apcj7xrcIhEw7lCl@google.com>
From: Jinu Kim <kimjw04271234@gmail.com>
Date: Mon, 28 Sep 2026 10:17:42 +0900
X-Gm-Features: AclHuK8uKM50viEvYvH7gJtUCOdNx9kwbsg5nfa3655kxX2O_gRVG_nRjZ7rjkE
Message-ID: <CAH+3ta7zvKzX=8nQeDSE3rz1i81=C5mSCRiXtQuoKkKcw=M58A@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Use active memslots for the per-vCPU MMIO cache
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, security@kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean, Paolo,

Thank you again for confirming that this patch was on your list.

I know I already followed up earlier this month, but as a few weeks have
passed and I haven't seen any further updates, I thought I'd send a
gentle ping.

When you have a chance, could you please let me know if there is any
update, or if anything else is needed from my side?

Thanks,
Jinu

2026=EB=85=84 9=EC=9B=94 2=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 4:13, Se=
an Christopherson <seanjc@google.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Sep 01, 2026, Jinu Kim wrote:
> > Hi Sean, Paolo,
> >
> > A friendly ping on this patch.
> > I originally sent this on August 7, which was fairly late in the 7.2
> > release cycle, so I held off on pinging during the remainder of the
> > cycle and the 7.3 merge window.
> > Now that 7.3-rc1 is out, could you please take a look when you get a ch=
ance?
> > Please let me know if you'd prefer that I resend or rebase the patch.
>
> No RESEND is necessary, this is already on my list of things to grab (or =
to make
> sure Paolo grabs).
