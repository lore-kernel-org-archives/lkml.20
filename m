Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FD3939D0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561508; cv=pass; b=vGn78gy74BjSiVBVsdWTrjwnxG3a+G3rm0eYFuHK7xc3eB0koTwvdciTe7p4d1/PnHaoLVYTUrQcjEGbKNHss6IE7rvgKxIuMZ0vQXipLhe8DM6lEAc1Ct5TtyfCOIcNXsMbh0Uc6nSI4LVQFlAyxHvZ/TKWVPIy5xMKa9wOGUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561508; c=relaxed/simple;
	bh=H5HgyIlsw0FH+q0vPjCvMUxollTUJgEt/Obula8tczI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDtSSFvWZ0GqphjXmlCrPUcOmKd7Vz8mQ+ZlIGWuHklj65lIO5rFghfECC3zN1wzp4Ed7ejIapM2+Gr3UlIhlKlrjNcbpg377VB5MFvND34ybprlIQgM1L2jrH+y+4bFSN7Tq/Y5ulzwy/BAwu34v84UFYtUqurDsZfOoY+41p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwLyjvBC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8HNpl9k; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwLyjvBC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8HNpl9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791561505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsWl+jQaevR81Yppcc5u0OX8FaKpUFiecTztMLcffMY=;
	b=MwLyjvBCJKn462rweoAgpGtpLAdOCdcC4H2TvifZYV598wtHdbqIW1pmpbAd+IXj7LPMTy
	6c8SA+7CsHdOYdfn5T+8MJGSbdfo0SajGb4627Ry1ACEdu2pORMgSiICnKotYtndHbT+NB
	GZIC5oCC+A9jy8E7dV7sjh90Dl/Gg1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Tp89qvscNVuImqqu4k_-Pw-1; Fri, 9 Oct 2026 15:58:18 +0000
X-MC-Unique: Tp89qvscNVuImqqu4k_-Pw-1
X-Mimecast-MFC-AGG-ID: Tp89qvscNVuImqqu4k_-Pw_1791561497
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4887e5afd67so5103706f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791561497; cv=none;
        d=google.com; s=arc-20260327;
        b=PWL/76ry/8GOKqLqCbqbGSgOUr6ixOlPg+uxmNWJ5mKOmUp71sMRVKjPu1U+oS//JW
         OJaMcFYKWAb0U40GyJVoVoIq+yJxYzQ6tNNitkt3mTbb41XGRlxEvM9YWAV+2uEeFjp5
         GpIJEMnp+NhyDXyQOiqTgqnuRRV0L1RNRYC4PARN2mA1/vl0awHK/vjsExzwr+C+ElAS
         LCLu6HUXhVJJTdNrlsKLxHNR3fuBKYTubiMZvl8ncqPD2T5/5dRF8lLkRoSaPjnR/Yt1
         h7yA3+2WwuUw97GcbznuFilnYzdxWaUd8GZRLgdxYgQnVrYLTcANLaBCQZRsa5BozxAz
         mlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsWl+jQaevR81Yppcc5u0OX8FaKpUFiecTztMLcffMY=;
        fh=wM2+yjpu38dVcyYtFSEo3WvN9IRzijZLyxAOZUAI4Co=;
        b=G5wTlcMvSlW2iQTfKe4sNx1oQjgry1AuG8gKWSR2ZREDhTNtoX0cwvjt5CQKSo7hb/
         5QkbJcxrPGccCzVbdtVO8DBd7+i4lZATDAGmrieKVw1LATEk+HVD6TNC8JlDW+fa+fLK
         14OsV0QxvVPW/+vFa3L8Ef6A/XBYCPBb7euNSqDFTvGiIkMZu+pSqPNBnP7aD29nxbH/
         a+73/duhQOR+D1eLrtHhgRAVAvw6+3LM6Abd4wMzMx8DeExbssJ7rQGkOgFkAZadWf6y
         e6/LRWLbTGgneClG6ezMj0sGUG/djSi0/fzoRXqZxJ2wuUOQdXHMh8Dsyg2KvdeZnAB6
         r5Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791561497; x=1792166297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsWl+jQaevR81Yppcc5u0OX8FaKpUFiecTztMLcffMY=;
        b=H8HNpl9kT6dSCTuLtkIZAJ/p/jdnaZmEXDmkSIUAFs5fj0C6nwtUKRLIp+5aIUtP4L
         HXzuCSNcsrtveMsK1/vdZ0z4mb8P4t1VZaIP3tP80CrldiG3iKtSATOi+daqExrLFbhn
         XzW9tbkrHYcykC/S3J5NJVd8vWJvcSjbxcUZIZwPi21E39X45fHC+HdMQA9cKDtf6sP+
         HG5jslWGpxhiRvkjrjDoAbPcFnt9za9/xixpPBD0geeOI8xOm7WHmcHyNnfhEycBB2dN
         N5VcDKkvjXcgcS7r6xI3AyHjxQx8987XGiugOrUwYoySRBDhJAco1mP2cVBzDy6U82xx
         P/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791561497; x=1792166297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsWl+jQaevR81Yppcc5u0OX8FaKpUFiecTztMLcffMY=;
        b=no06c2gvnfoMKq7fqc5OvhYZLecrDYSGN3XhA8wtjH0b1GMMSdk7Q59pgcsukt+K4L
         sM9uZ3tFcajKrSZgJNBs7lsJo+jIUftM+1rmaCwxqchG0ndlRx9H68E/h+BxVXf/jOSy
         2cvyEp91MYoO5BmaeDsfzO4So00drVm1tVYlqGw9xkt4PN6WyoayVNAHNERhNcsep18z
         KfvE39BxSUQjAw5xdfhq5JFPsjgdcqO7dgvy7jUcqX+LYt7UXaBdAz1l21+p+W3FYkMt
         WR7AMSo2fP40Y4yo34HMMzI/azBLdZuS59UPa8ws8n7JXOMAKEuJGkH7JM86LISN3Ie7
         sYqg==
X-Forwarded-Encrypted: i=1; AKwUvBzPoqSndyTmu1TPhoD6O7X4MvnlaIkkE7N8KvKhVBFKwUXsbHY5pPIaUxF0ydS50RE/E/KveT/63uFKQY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQOyLQwJYwwyZvAEr793VIOg0K9jBttuBtJpiN7ywW4Wy7lP3S
	jPq8xKCHkG++MNv+7nrDYsdzPQ5LtQv+wAGfP5H+rtYFiScECAWoaHnss0P7rlt3jpTu45mTz6R
	7kdyyF17gMA8TYtcDtdD6gxXFBW/omzAh2fNMhyE/QFpvvH3bfOY8FYvMDFmec/JTVPU1R1731m
	qob79Kj/gLTodIXB5vrHS1UmErrRFkrUucEpeMGSi6
X-Gm-Gg: AYBFou1x+SyThoT1vrF6zbFVz6WtO4816GwzVyfrvS70ImK7o8PdZT6Mog6BLIveV5h
	O6D5WZHUyNMqwyypEGfqG277Vf7x3x6Q+SfrB+tPTfLTeX5J49+E1gfiqsVxrO9nKmoCfe1rXk0
	f0s5O+czMUbLa7hFKYgYHKd08vKn7JrR0dwij8d10N7H4cAqjoAkHgnLxFKD3KGWG+mlJOppXCX
	pJzS0vyPCaDb588lkGRMzft485pu5fCwkWaVDwz7BD+Uf5TLpreNKiZWF6bGA==
X-Received: by 2002:adf:f88d:0:b0:48b:6bb:6d37 with SMTP id ffacd0b85a97d-48dbaade236mr3490753f8f.25.1791561496608;
        Fri, 09 Oct 2026 08:58:16 -0700 (PDT)
X-Received: by 2002:adf:f88d:0:b0:48b:6bb:6d37 with SMTP id
 ffacd0b85a97d-48dbaade236mr3490726f8f.25.1791561496196; Fri, 09 Oct 2026
 08:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002164750.3981742-1-seanjc@google.com>
In-Reply-To: <20261002164750.3981742-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 9 Oct 2026 17:58:02 +0200
X-Gm-Features: AclHuK-7M2P1s3vmGyha3Gb1Dl0I5jX9wU2nbwFTblAHJjssh915xjEcJupkhJ8
Message-ID: <CABgObfbVST40ndfetLvBfj3m7PACQOcA3BC8j6zYnJvGjTUB-Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: x86: Fixes for 7.3-rc6+
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 6:48=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Please pull a few more fixes.  These aren't _that_ urgent, so feel free t=
o
> punt these to 7.4 if you think we're throwing too much into late RCs.
>
> That said, I'd really like to get the AVIC fix into 7.3 as I very deliber=
ately
> didn't tag it for stable@.  The fix depends on what ended up being the ch=
anges
> to hold kvm->lock for all of vCPU creation, which I don't really want to
> encourage folks to backport to LTS kernels.  So, if we squeak the AVIC fi=
x
> into 7.3, which is presumably the next LTS, we'll save a one-off backport=
.
>
> Thanks!
>
> The following changes since commit 973ea70393e885e540f714904e51bc6cac80e3=
d7:
>
>   KVM: SEV: Do cache maintenance on the source VM *before* clearing SEV s=
tate (2026-09-28 17:11:49 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-7.3-rc6
>
> for you to fetch changes up to b3e6212dea2e4328a841ceb37f377583176dc735:
>
>   KVM: x86: Use active memslots for the per-vCPU MMIO cache (2026-09-30 0=
6:40:49 -0700)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> KVM x86 fixed for 7.3-rcN
>
>  - If creating a vCPU ultimately fails, clear its entry in the AVIC Physi=
cal ID
>    table used by hardware to perform IPI Virtualization and delivered pos=
ted
>    IRQs.  I.e. plug the same use-after-free hole related to IPI virtualiz=
ation
>    and posted IRQs that was fixed for APICv by commit b41f2ca6c0601 ("KVM=
: VMX:
>    Fix stale PID-pointer table entry left after vCPU free").
>
>  - Use set_page_dirty_lock() instead of set_page_dirty() when marking a p=
age
>    dirty after writing back SNP firmware's desired CPUID state to userspa=
ce.
>    Using set_page_dirty() is unsafe if the page/folio isn't locked (as po=
inted
>    out by its function comment's big DANGER warning, which no one reads g=
iven
>    the number of bugs of this exact nature).
>
>  - When checking for an MMIO generation match, use the memslots for the c=
urrent
>    vCPU context (non-SMM vs. SMM), as a misbehaving guest can coerce KVM =
into
>    incorrectly identifying a write as MMIO in order to bypass KVM's
>    write-tracking.
>
> ----------------------------------------------------------------
> Jann Horn (1):
>       KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
>
> Jinu Kim (1):
>       KVM: x86: Use active memslots for the per-vCPU MMIO cache
>
> Naveen N Rao (AMD) (1):
>       KVM: SVM: Clear AVIC Physical ID table entry if vCPU creation fails
>
> Sean Christopherson (2):
>       KVM: SVM: Add paranoid helper for checking if vCPU is AVIC-addressa=
ble
>       KVM: SVM: Use "is AVIC-addressable" helper to sanity check load()/p=
ut()
>
>  arch/x86/kvm/svm/avic.c | 22 ++++++++++++++++------
>  arch/x86/kvm/svm/sev.c  |  2 +-
>  arch/x86/kvm/svm/svm.c  |  6 +++++-
>  arch/x86/kvm/svm/svm.h  |  1 +
>  arch/x86/kvm/x86.h      |  4 ++--
>  5 files changed, 25 insertions(+), 10 deletions(-)
>

