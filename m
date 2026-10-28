Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793223075;
	b=upOsb6G2tmuBsIa8U0PgFb1RiEdJUpvdUk2IvVcpfrqrWpxSMUIeGjy03efBmtiuS4kM
	 o2DPDKDVbHzasU2MWMMBhYLgxPKMHep5v/uoumKst7GDKK8u7mxxgm98t9ZmdnWOcObI1
	 prgCY69naSTxWezQCJmCZfSdW1VD+J/1Q0fV7gsSurliWl4szf5QOZB0Txh7WiGUuHOd/
	 ihzela6UTebumApgLGur1RamUIz3nRrXJYSZ7les+mMSAPa9kTigrQO7Xr6wwSZ3ScFCq
	 gxm5ITmdH9OXWFF6Ml/jjty82ER7LsEg7xAyMkLNgrM8ERVrVa0R5wTprZ+XhxWrXbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m9aGBk6K2DSuOberChSpAVT1aDTSA07rsVsWjJsLd/k=;
	b=XJnzPtQgDYRisjfLoAaABNXIX4a66RYKXhoJBD/FFXx7xtwPLCqaFN8l52sZj9KF1Epa
	 yYqQWnlRuFa76JmGR8ChLYlsCHldjIBLobxT2hHmWs8dWuJ37TcRubjX81L2/CBcmNLhB
	 js8gsOJJ5th/CWIPRsXowSyGBWb9KMmUVrDtSUcMAeYL8xYcnt0igefNbxGWiFRaAjBJm
	 +MZ1A/d6AsX3Qhf+RjuSFA6i8+t1i/aItsvD0Xnu8CCzwTZEa7QbRCeqRMr2bfrHsKljc
	 Ylps1eqLTG7ZwIJTOPvV237TtPqvtwMK2wN8R81YeQKe5ICLjgv7ndy1b4maiX7BqQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KxnevNTj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89B606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA89B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KxnevNTj
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337c7b9937so103401cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793223074; cv=none;
        d=google.com; s=arc-20260327;
        b=Tjjz/49SmMI+16Z/X9dAJzMnNlw08eEeS544Lr9+ttavMCSKpHsll8ykPBvDG9fRis
         GdJeQbwD6Nm3NynyIr4xHNr4YsSiP4uyc4A0UIRD8TWr9xQ+l+KfUOMTcvHFYRL1CVJG
         4dxRIQNx38s9f2m+EHKKng6CgirLhIOyNcv3WFkoio+PU0Py7jcaDPToS8Hn0QbbALOq
         2mjwjSJTnBXmBCDJwGeQ1tJOESU2t+qRPqiKMP8J0KjJ5KmsbBvpdVe0bUauNZ5jVv7b
         zGaqWPXQ1egCrV5DsJTNqaFDjOKmaN1vxxG9he/q4XYG4LbcsGb+FXOSS32HfuyNs7BY
         eGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9aGBk6K2DSuOberChSpAVT1aDTSA07rsVsWjJsLd/k=;
        fh=/O1kNsLfPbZ6LkI6dVfZrfw5iOvx+YqHETiKT6ZAbyU=;
        b=FmagV7RjCoTesA6kGGW8yNuKjydFNO4DeA90Z5P5pr/yxn4ldzinKUsabwjz/ZleQH
         IDDkHrPnG4Nwkf9l42T+21vLNbfwkQxRXQCfGGJZRrLuuqQrdi3zpR5IuHdooSQryE1v
         XDo35jLlD9x7gFNRC0NQpVgy6Wnm+WyxHENAkDUG0dvyWI3Cqx5ZEedKv6RcySVHeIOj
         aEutpJlIKSXKe+4Sf0bSqnJerA5dRrFCAryZ/5RW8i0v5jUQV2Ae+iVmdZLRO2rWPa8F
         gQrg6gGKLkmDG4FipWJjSjd6vf1shr4CFpNE1TFm9P8eTAotWQ4Cd7lYjJrshFfglkz3
         ZNnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793223074; x=1793827874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m9aGBk6K2DSuOberChSpAVT1aDTSA07rsVsWjJsLd/k=;
        b=KxnevNTj/Uo39hOYU9x4XfAk6dE3AJmJkt+SatwvUfWdhsIvPxmCMoRH179LZITk/y
         +Gnm/CnMBUnTzrfQvPy8Je5uu5L/mQGq8uCPvBUymwEbcYN62BnG+y384dOP9hmzd8kl
         zQ89mQhRYKiwdigwuA+X8mMaOWRROEKagXKA/xd5wmPCDwiwe1wMqwaKKjae6ah1QQbH
         5xXKLOxxg81hhfm7P2ixWeKj0WSANMeui9NFd5OD0UKuYhBewklud4dG08+bsXzLof3Q
         5TyvHb44WsN8Lf296rUvSEy7gjB382rd07fI+sxxmzeTqShvAirRs1lWx7AjhiltakCE
         UQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223074; x=1793827874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9aGBk6K2DSuOberChSpAVT1aDTSA07rsVsWjJsLd/k=;
        b=oDAZXJVinlildUoggotJhdt74AAUzs3LR6wzVjGfZ26BcsYXettRP3cR89H+lm8dCT
         crGSA15K2nTqOYXwCpploupPo3coNcoEQbSJKenCeciAMKOP5QSLD/MNA7P7GQ2Zs6vx
         S7n4c081uAFewyXVMUz9nVEAkQsEQ/KYGZavWintHM4JSyuwd+RNjoVqP9S7/4SxDy8q
         5MVCKpnWyARRE8l5oQSoEjXKkEbMqoB38h3D+1sUkebCR33oArS7st3txQaOgDpJo1FS
         om/Xbnxi96K4Um2T9GWcPfKcb+vFWwLdW9ZRHQ8+vWJyk3PKWY7mT4AAUbKkCthZ4d3B
         Unmw==
X-Forwarded-Encrypted: i=1; AKwUvBzFHIs7N4HdWLyIqmAdhWmbtBefBxxt483T/TRR+bOpBgnSPdwzqnrZe55O27BpDAEkFMwb7hAPWKem6KY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEj7UPUADhMzWM0oMECXRkndlaoJz0rw8zDeqA0AbpOvLreN6L
	hvVrZ/1c+uiz29pe/UKk1kYiX+1YA6NHS23xj4ZHFX6BIPNEEXiKbAUdBOfC2BHKk9JqfS7fCSk
	KNUdtBugF0szROmHyT+HRq0GEepjLHIIEEXsMjheY
X-Gm-Gg: AYBFou1poQHPcUaTC/J8Ex7ZND30saXI6rLeIbgQx1fbCLMTtwILVzczX8gvpPisfWn
	KVmV7BcdpPLAp4uE4LOtUMFBB8VvtrLK+m8dTNN+WX6JvVOEX4Zqc6n/5WKUnzjUNPKbnB+sohq
	DHaiUnKq7EGe8Gq2LEu8NIaoZK01ss4CtRRPW4rMo5MB6mvPvd+W5Fs/Aj8xO29i/+LGXwFNj13
	PcbN9EH+Pvgox572T/3iFNAAesJRwcNIJV507ZVRmvqVGdht+J7haz/cRWamOl9ufWapL6VMJAb
	A43RgOjyI7IVeJqZ18lAM5ykd1IW22PbIcIYe5yWWeyi2C7pbaLMhgMKzxlP0K81fvXT9hCzse4
	puTI49Fz/+jEE46/tMSfUPlwAZXsXeUQci5it
X-Received: by 2002:a05:622a:5148:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-5414de19e54mr2522771cf.8.1793223073074; Wed, 28 Oct 2026
 14:31:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-14-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-14-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 14:30:57 -0700
X-Gm-Features: AclHuK8H03wGGLJIEjVfGl3dt9B41jEIn0rRjkJzd1wAnJ56AQXBqQQWHoy01b4
Message-ID: <CALMp9eQGRJXgw0xsFMt9rf4+Dmb2_WH4_LguuC2So3a=5mX+0w@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] KVM: x86/pmu: Factor out fixed counter control
 bit calculation
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> Rename intel_pmu_enable_fixed_counter_bits() to
> intel_pmu_fixed_ctrl_bits() and have it return the computed fixed
> counter control mask instead of updating fixed_ctr_ctrl_rsvd directly.
>
> Accumulate the desired fixed counter control bits during PMU setup and
> apply them once in intel_pmu_refresh().
>
> Move the helper next to intel_pmu_set_msr() so it can also be reused
> there, which will be needed for upcoming ANYTHREAD_DEPRECATION
> emulation.
>
> No functional change intended.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
