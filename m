Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149835677D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015230; cv=pass; b=NmW6YO1e451FGDYsYaQZ3bMrWIIam39Bk/7AhHghGa0LLgTqbVxz5qOyOdThvn3/WZYvmL25KSokwhEAGoTbedKPATTMl4KknNgzpm4Gmv+Wxi8MFNPWxJNzK+2rQbktjtV8cTdXFi7vlpATGhGaiQj+4G8esYRtS+TrCxvelwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015230; c=relaxed/simple;
	bh=/emYiK4WsQd1Xqtv4k4lCJqP5pFnFmHRgERYuuippP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnHopMlQT2XnjV79aDUYY3bnalWsLnYfByijEy9fnIf9lxH8vIeckDg+dHKNSdDcbKx3Sy1e1rEDfcrxu985lWoviYzgBSh7EfScU/YykOE5y30STFAvNaFyA93bB3vyPPYcOVWD6ikQT2QKb29y+UaUzmaW/xjIS+ony+KxPt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sAi7Vyps; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sAi7Vyps"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so483a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792015227; cv=none;
        d=google.com; s=arc-20260327;
        b=GatnEGbmPafFWgjwAWGzxRiQkxubfm7NRfYiwdzsyr4wZjzejB2Cd/t3uhQB4+It50
         PlS03XJGZQRkR4oJOKgEafEmc7p56YEsDi9VhcOljO7OznMyNtqjHbisNOMeXLWGSJNK
         CZHUQ0cXskvQVSMsHziPMWITqHpal4fAMsRjgJmWOmJlCN4UFXOLXFod/H5wOjfdnbIX
         pmZZn40wYM/0W36JY9TDWlJVU6/cFVzydkUsGJiYTve7HpBV+7V8eQIBE/Y++QzinKnL
         aDPz6MSkYlbQarDvu/wQN5DJF7KiXFaQ+yTm2c/q//DXfzjBt5rDCF57gU4bdCAFQ4D5
         gP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6OebQYdvKbMgqOD64fFAkplCh9Qs+Q7ZSU1pBW6WnQI=;
        fh=ZlYL8nptEceqmn4KlwOotcq8jv2t9cv8MNatun3NrSk=;
        b=o3RbiNL3I1EKLMXcXJyq7QJIZDGLXhZ8ohNJWZtvK/aAmKTVuIVx/GBExuiIpz6M6J
         zw9lYXtpHf1Cu/u6zDPNYKNOhtaUpEUpZl7iq6lhRUZWmpnarXD03i/zIcFUEQrbVma5
         Fc1fQX6uIHNQ1uPa335n0ZVTi8iuIQyhHmtcWrwJ9eYMGnnCKACwJ0KY/cocb3H+v/j/
         f3BDvQFIyFkq8owsiFSLYKj7XrHfdfzMwqyz82/kgOHLOYM+lvicKn0d1O+aP0ODi1c1
         3V8FIHh0ynVI++rrwOd++ARkWrRS6VpGRj+d6z2zrfOEyg+SmUAK1G5krtFY/l2TGj42
         acYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792015227; x=1792620027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OebQYdvKbMgqOD64fFAkplCh9Qs+Q7ZSU1pBW6WnQI=;
        b=sAi7VypsVRrJ+RNmUu4WLKIiFhSRL7S6w8wt6k4aiqv8clYay4M7LOf926+A9Gih8H
         GHtbz7MIeNQ9AKIdCSVk0abgQGLTKvYy5CpUo14Oeat+L1x7ru++eWYpwx6QfINS4tHl
         hUSyCAhKxCyBKpIuNyz8f3R6PJSWnKjAL6jymC+KtgdpKp6uRzuGK/9rHkxb0rRqX3Zl
         VChH3754bPkgHEfH6TYXgAPwdtLh1TJrFanw0OdgE/NzZP9EfACCuM7hXVwGWo8dgl4O
         MtkHoJsYDhsoQj2+Ua7HkJMnsn8FLRdUrVJYl607NWpchwI1n4jjganINMCp/HyHFhrT
         zxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792015227; x=1792620027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OebQYdvKbMgqOD64fFAkplCh9Qs+Q7ZSU1pBW6WnQI=;
        b=sEjOS1kDhNQA5MDNwbcq0JlGJkZsjdQIyKMPUARLEE2JBKEKN+rVZDmPLB2XpwF2xn
         rb5hjU+ORkzd6BhDGkdWTVUguQMa1ZKUbTKcfJdGo+q/bi3/BfcDUZIYjHoBS+26AlBv
         OBt7OlWGc+ZFWs89wgHeID9EuNy/Pe3NnwJAWZ6xWRnVaHzrmwcQ1lcnOmysqtysvcrT
         Y7Ij+amiM1i1Am6G3gdwAcTyCqLK6KSrNwMm9qaRTkS4CfqYe5CzeJrdFY/H6ztI8fUO
         GqbfS2IP17Fgyt5pDGdpDOw6I+YRvH7vArM/MRaKrp0zWn34tVDlGGPyCX++pvUeTU3a
         ZESg==
X-Forwarded-Encrypted: i=1; AKwUvBw7XjiQOA3KqWPvy/eZrJsVVPe2k4V0TUqrP+mEsDdKTwdzSK91+3A95XF5JiwRLiDZnagl9KGH220J158=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyO6AHaJN6jXieIXCtuJIik9fIyvQc+Y0fwOJWrAfR0VAPiT1n
	3SVCnwYSUpoFwfmRkXW8nB3KQuinjCw+VrV2ilcfPSU4YbPBCEyP4V5Z0FEGAJjhnqbr2Zpoh5o
	eV1J1mQTxOg5XwqNn0CyS9x4rFIOF6HKwzYBrKBFn
X-Gm-Gg: AYBFou2eMugODn1U1DUZtaT8FQRlGJ9vFD8kghkAYD3fsz15oV7owOFx0Yay1tXCsUB
	/J2h7u1O3MdNMh2uxcTxwZk3B2LHyye1LBEr6Bwasg1XHHVhuM9mzDK9plKxCZM1AqZErrIKS43
	uvf+dCYT/rK/Qutplv6wLHxFZ1rvuUCSBd6CW7fSsxq6RzQnFSmwlbqIaP1pfRUW1z+EtCqCtMH
	+4Jaci2dBLDKZuK+thtGDhL7Jru+eqqVaYGNIVMMuVluCCYCKosbazK8p8m1furdaKYpXEaQ5tI
	6Y5iO7+NfLSzaMojwcZmpbd+2lM0rBD1sc/4mFFAgKChouNZB08AoWMjhJvKl4pong==
X-Received: by 2002:a05:6402:424c:20b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b20aad4720mr18371a12.9.1792015226706; Wed, 14 Oct 2026
 15:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-6-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-6-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 15:00:14 -0700
X-Gm-Features: AclHuK_0kBrRqooEuDpz6sx48p3ynl5vzugVYTkfuTyIPrqM8TsV36JOMpwehkA
Message-ID: <CALMp9eSWazT=0tXKvGb9UNWBv62di33QgugQHOa+Bo2sq0qUCQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/27] KVM: SVM: Add helpers to set/clear ASID flush in VMCB
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Introduce set/clear helpers to set tlb_ctl to
> TLB_CONTROL_FLUSH_ASID or TLB_CONTROL_DO_NOTHING. Incoming changes will
> eliminate the use of TLB_CONTROL_FLUSH_ALL_ASID except as a fallback
> when FLUSHBYASID is not available, so the helpers will create a common
> path for this.

No functional change intended? :)

>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c |  2 +-
>  arch/x86/kvm/svm/sev.c    |  2 +-
>  arch/x86/kvm/svm/svm.c    |  4 ++--
>  arch/x86/kvm/svm/svm.h    | 10 ++++++++++
>  4 files changed, 14 insertions(+), 4 deletions(-)
>
[ ... ]
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 6d0242966dc87..ba5077b9838c0 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -480,6 +480,16 @@ static inline void vmcb_set_gpat(struct vmcb *vmcb, =
u64 data)
>         vmcb_mark_dirty(vmcb, VMCB_NPT);
>  }
>
> +static inline void vmcb_set_flush_asid(struct vmcb *vmcb)
> +{
> +       vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> +}
> +
> +static inline void vmcb_clr_flush_asid(struct vmcb *vmcb)

The name of this function makes it sound like the inverse of
vmcb_set_flush_asid(), which it isn't. Maybe vmcb_clr_tlb_ctl()?

> +{
> +       vmcb->control.tlb_ctl =3D TLB_CONTROL_DO_NOTHING;
> +}
> +
>  static __always_inline struct vcpu_svm *to_svm(struct kvm_vcpu *vcpu)
>  {
>         return container_of(vcpu, struct vcpu_svm, vcpu);
> --
> 2.56.0.385.gd3acb90ef8-goog
>
