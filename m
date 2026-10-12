Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF131C56D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823579; cv=pass; b=dUOik0hrg0Nid0cVbCi6sj65K5IlJCBA1GwPIjqiWz53lUJhdjzhN7DmlYJMPfP3zF3vPaW2x0EEIa++nnoLGO5RuTjoFJiAGcn+h/eWFZ86rJ1q/Oo4A74hyPUwR36JKEVrBzaVCggf8RdYBMmdFJaIttEk4qbHb+rxPxzFWrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823579; c=relaxed/simple;
	bh=oAXS6V6MF2Ql5LJpFSKH366GGwqI3OJmzAt9fON9zVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHViVem4VTpxjaRET7xONaibAaz/ho8lrGzJlQTi7N1qckxdJnE5FcsM63EstlrliYvdPJ6kX3G7a1lNtn0KfSsws3yhLvgu1b5hOaqaVo6+t5wkVQ/szxYtywwG5Xh5Q/yYJJYGjxGNEuZJpE3rb3708FP3aTCIsx4r2kd5LjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRlACDIv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/PqYrSG; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRlACDIv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/PqYrSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791823577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Xrn0w9zhcSyTIcnhYHLvfCTc9jnY6eC1cxeeEthPCs=;
	b=RRlACDIvCrHlmW3ZUs4KYBoAMC7rq3McuwjHCFILBZzmWPi5oC5mlGbKQK34rzjSg9IKn3
	MJKdpZ1fpNAVi6ULLB4fxnRIZlj581eVxqm1O1CZHohmsnxUQ8rN1Q3yHNZsYn6PHZrQ7G
	3YU3JrCkv7mAtFoVJNfSFh0WJAOxdoY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-pcLJkCFXOl6DLxVy5ohiag-1; Mon, 12 Oct 2026 16:46:10 +0000
X-MC-Unique: pcLJkCFXOl6DLxVy5ohiag-1
X-Mimecast-MFC-AGG-ID: pcLJkCFXOl6DLxVy5ohiag_1791823569
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48afe67dfc2so2553113f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791823569; cv=none;
        d=google.com; s=arc-20260327;
        b=Fo6dCKo/VY4NVpPL2X/9Xa9XoYb1saLzzq97G9yjMjn9BoNJPwtpv1vH2E8qbMMxT/
         L9rj5XJFSuLOHWvcUJ3ApBIlzqA4JIVIjDQWCFe3XgY0Hq6/Xe0PGxo/mgNjrKd5D1cL
         LCo+6WjByjfhvxyvJuyaU/tmErF1cBbFnRnrs4qU1lL6FbU00T9g9VPobRUCqlzEXnYr
         IACnvMzW19yItzBahcyw7MuYrERVDJER6WusiArULv1x72zTzmwOYB39hPVsknQXrwhh
         19D4vfbG3WcihTJdPqDgV/M+4shduiV9f9vhg/o/Y/qhe4eN2DaNs2sJdy6oDE9Vs4qf
         80dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Xrn0w9zhcSyTIcnhYHLvfCTc9jnY6eC1cxeeEthPCs=;
        fh=lkWTLCjjmmYOsqaRKrP5QyxvbJtHdGPyLeBfI89RRBw=;
        b=OVDNimpFX7TVhTgJw3ZvNGHbwxC+lIAjv7mglU1jVWRYJ0OFsHy/TcTW2PSX89lyZ2
         efsQLKHmG8HYfsxbgWcHC4IIrcj2Q8r9VYNYyV9M2RgCIeMDpIAcCtaULCqZN1vweUjN
         dDFVg+BVtGS5YxKG/tevXVunxg29L81ieVmkgbGWyyjt3dPPYtA1JNIfZxjgSUr4LPjs
         4ozNrNY+S0g+fg5HJC8dSe1/SK6eGY9Ihr7loXs4yPSa6TlMvW3+WAYcoMI5E9Ulb0F8
         1KTYotQEtuJg+RJAq0ORHyiei+w41RoeyQDiaHXgN7lfBuB6RkQCGmVDiJnMILgVY6Fu
         VQ/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791823569; x=1792428369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Xrn0w9zhcSyTIcnhYHLvfCTc9jnY6eC1cxeeEthPCs=;
        b=K/PqYrSGbMLD4cr1p0bUSPaSdk7BqoFT5E3pl3Ei0hTq6/+4nfXSipnYzci6Ljf3lJ
         wux3gvg3esVbl9moYAXYFreLHE2PYZym/zbfdQw2t5YsNklXajbvaDXXvi5ZutJjl3/Z
         qH+LXmlwHzZT4rEcpAH9Vj3y5UuhbaZt2JmnqLhuZxF84mR03GLCl7DNIqhvLHBzLL7B
         ejuVVm3VU/NAQyqotGDNOHivD1eceOa9cpD6AVNJTAEGjK2e/VV5285GPNvTnf/gBbCC
         3fFoUbpHR4af6YZqC5t9NQtOvvh/aLeEgOEQ8kRm+kiSb8WbvXvakkepecMzSCgZOtHt
         vkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823569; x=1792428369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Xrn0w9zhcSyTIcnhYHLvfCTc9jnY6eC1cxeeEthPCs=;
        b=kj9FbiZ99rN/bwjoNljkkPezCe6CRpoo88C/7M3eJhtOMPspGYnt776nJS/d4sbXPa
         halW5oLpvl+CTJIFj+DEBNm2/GD5Djee0gafgufgTvZUwAngcWWpjNd4tcMMTIzeVUnV
         tgmfwnIQcCWMp7bYB8Cra2Z771HzZ9H1CXq7/daxwndRFJTDtBn7fWhBKvWBsPYVnJPh
         MtKTxzM8v9CKV2cuFAN+5PuDt852n6COsHLqFJ2x9DgiCkK1fT7j7pdYJ+zp9K/rnW7o
         nAA7ldY21DAkOFDS+CW70fJWSEJF1txMqUKl8X5uyNN/CQvdn6HhNLpBtdyUuhVMDroU
         AghQ==
X-Gm-Message-State: AFq9FYJBEvUjvj1a4tlB6cZUErctctOtmRYT8uazcXmwMfvY17kEbwB5
	jaWiSWOLU4OUtI5kBBXEyulggmhk4vw1BNWKJjYeXGSDlWYxqJ51mjyznop/ucaYvZwwZ6LRKqD
	6obIWUbkownfCSR/8eosIkewtRc1KnbO1wz6W5hE+lJtWf/ZiE64lpCqgE9rgIqfVFvE5rCsIqB
	J6gmEWkf2SAyqys6b6ySgoi0v16A4GOpgmB6NKorWa
X-Gm-Gg: AYBFou0r06XUuxlAUyQpCtYxzd1BnONcrVMH2QoD9cen+JyB2R/dpYMxruTH9eFdeKY
	Ffx0h1DYnNfjbTP0/kSDRhqSCNH+wSTSroeRHMJ4JgomrO7ox3Opipj1yMOn7zZcinGVRO2HdKI
	WeYzyT9B1Q6Cb7AlZkpn3IsS4SpAdZ140lBfT0aXdFSmRRNclmWZcF78ec5HLeK9raxJzff27nX
	tX1dlpY+Eq+o9Ue+xpWbnoMHRlRGHPe/pNkbABJyEh7mWYXZ6amRtUsQl3a0A==
X-Received: by 2002:a05:6000:61c:b0:48c:58b9:f17c with SMTP id ffacd0b85a97d-48db947461fmr19542068f8f.12.1791823569137;
        Mon, 12 Oct 2026 09:46:09 -0700 (PDT)
X-Received: by 2002:a05:6000:61c:b0:48c:58b9:f17c with SMTP id
 ffacd0b85a97d-48db947461fmr19542035f8f.12.1791823568768; Mon, 12 Oct 2026
 09:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009130450.361690-1-pbonzini@redhat.com> <as0NBfuEY-60pgtz@google.com>
In-Reply-To: <as0NBfuEY-60pgtz@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Oct 2026 18:45:55 +0200
X-Gm-Features: AclHuK9pVodaU0y8aFoEzn0G64V6E6NcOQh1xijrAviXyHmZnBb8SlkbTzGCjn8
Message-ID: <CABgObfY=xYUJJtYvcVhjdTXOah6eofi0O4C3J3sa60KCC+WO6A@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/mmu: Cope with the SS bit being set in #NPF exit codes
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	SimonP <simonp.git@mailbox.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 6:38=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Oct 09, 2026, Paolo Bonzini wrote:
> > When running Hyper-V from Windows 11, KVM is seeing the SS bit set
> > in nested page fault error codes produced for shadowed NPT.  The AMD
> > manual is unclear about when SS is set, including whether it can be set
> > when SupervisorShadowStackEn (bit 6) is not set in the MISC_CTL field
> > of the VMCB; in fact, bisection shows that while SHSTK was available
> > to guests since Linux 6.18, this started happening with commit
> > 687ee95c1b6d ("KVM: nSVM: enable GMET for guests"), which seems unrelat=
ed.
>
> It's not unrelated.  As you note below, this is purely because Hyper-V on=
ly uses
> CET when GMET is available.

Indeed, my intended meaning is that bit 1 of MISC_CTL does *not* have
the side effect of reporting SS failures...

> This is wrong, I reproduced this with the KUT CET test with gmet=3D1.

... howver, this makes me wonder if you meant gmet=3D0? Because if you
need gmet=3D1, the Fixes would be fe080f58dec24049 (i.e. when the gmet
module parameter was added).

Paolo

