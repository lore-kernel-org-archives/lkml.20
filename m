Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF2309F08
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712186; cv=pass; b=UoodScO7nKSgrB75GXMqsnyPjAUleK6Zso7Bj/5NCjdNKaMlDoh8EJTIWXb1ME34wTr2Kqe2unsZMeP9naackfzlmatBSeJX8PaffZoBGrZN1rPVX+4VEm0LN3nzozlx74Vx6NToSfT9qHYFZqfcxUD4/ORvR+L2ESKxBGFdsuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712186; c=relaxed/simple;
	bh=xsSKiOspqG/+MtQ6W1neljIxJh5ynRg01+19OLjolSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxTKHJ2EHTY7hmlDe4/YIuua78V4NL+3xJWwhei/HJ7cy2jrQwGyauzW/6iHwTS/yZmWs7bR5uQP9xmPKo/MxV5tSBVuH9LQiMyAFbN10VyRye4dStl7FOjVCCpUZPqlmFY0VI2dHyIHnk9ORsNBCIFtdUr1qfTFqDJhIeGz9Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWePuTp4; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWePuTp4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so5710a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 09:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788712183; cv=none;
        d=google.com; s=arc-20260327;
        b=XydiLWnfytalfUt2LuK1QpK5t8VFdWF7TXZ9FFjTBxcGsaulYwMXsUkuG0tQJRGOGd
         mk3uZMJqpk0oqziAv9JgTGrPGrTpUPlvcMm5F7DksMmvZa2k6jB32jJJOnGzWUjyBXO4
         nv3HpTdwSSnwxUDAEcntXXSCD3iftSinirM3jHlT7QZnSj7klmgqzi8DtKVkz1ybw1wL
         weby9aCw448SeJI20QHdmeHls7ZIZvb3V9uVUsAMDXqLMS5c17+u0BKEXM6zvQ3UpQNs
         Dp1Fhte4a9UpQ60HZ4P3mT7rX3Dv7I6DFIVPqbUWAnDYDkJxYVG2Ih99k7kwv84BVCmV
         3t2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        fh=MmVjcKVQJR9L7J6W4bdAvFZusMoW1ZO6wlx8lPatpF4=;
        b=WqntsH8ia1k1ebTHgdOPwhtkwUS5GjpF4FdsvdpXY03afGxgIwFbbssErQyZyyFNlO
         ybQO4zox15nuh1lyzD19vOQlTK65GUxlBCbE7B8y+hM1gmmAf+57Do0N3gx09KDdE/+m
         mBwLFnn9Clv9g96hoFk2ogyLVeX50lRTDOwaAmVu/HrKpjRJuj0nB+vKjX6yMq6hE25/
         BRk0kofoSFriIxTDttyM/2szKSUvLner1++Pcnq3R0wOEzTtpUhjrUUEVB6WG4rHplhj
         FEc2D/xEG4Gcl5GKiyXSP+B6AlWnJ0oc9vlclVlpVVU7Tpn6ZM2axFmFTV+nVK0YXAym
         RcFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788712183; x=1789316983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        b=GWePuTp4DyHrmoN8RLCVlXAjiCAR/3l1vV/63TROXgeraA2vNAIlYSw/TaijwUXHok
         81FwDN/HrJCCReCymBaJGEuJNS09kC1iOyQpuOTXgoPfVUODPsOIMxPTXKFsbMl/C3JM
         AO1X34qSdgEz6IepWDXHn6AejkbWcAAz57CENDd7x0AYjxtZDHu928woYrHYxpnpwru2
         X66QUawfG0NBVnHgzgTPAHSFK2ypFht9ikySCIHD3Xw4t1y8z3T+wqP/rsppziWJWHtE
         3GnyF3bknUmgvqsg1KTL426+BFOdQo+J3OtVW2yAMVHZ7GPMIOg/jd0Nfd8jx3p2MP7c
         xnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712183; x=1789316983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um0Pe18GpPgK3b7kgderSLxwrHj3TqfaAiHEwFEfg9w=;
        b=lj7ledryD/NK9dTHD21LGL8fWHEVYwdEFAz5G0k8DonVb9S33t7Ux9ENP/qCoL36OC
         dc0DzRI8JA5NXIlxeD/4WAYz4jg0n+rlgMj9id26eU+tExlH9Ozo3ZJ4t+2Y8RfxYFwj
         tHnr+ZnhpQOkPl9TsfPB/WYSwDB5CDjjg/4XNKy7VkKX8EnA1aYH4QxKD4YMgFZNnsDC
         XkLBSIkAqj7oaYNP3xNBmllmLhKqQoY4Z1D6LkrmpadR77NG8I5HbdUQAWGW1cvsD/0H
         TlIOe8ukLmwkHg/bc+f3wEYQRknwETw+odY6TxBWN/qcfGGchsFRSShlZorkTYuPokQ8
         VSGw==
X-Forwarded-Encrypted: i=1; AKwUvBwk+ZOb9WzU+Rxk5qllJyg9vAbdEfh9tj9cyDx5wEdLsmDQDcy211BDtOcTVJN9fYoruYGCp6CThF0HyQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kX1YXayaz5sLomigxH/i9gnbp7wuZc81yjlrJAxHK2KFWBV/Yj
	t28ofjXSNM1BIlDwYnp6PR8X7FKgpVjUCh9WVR5uWtU/F4Yc3wOe1fp39AVf8XzqfusU6fnclFC
	7TWG60T0askt4OKAwtfpIZ0g558Ouse2SwoDKExt1
X-Gm-Gg: AYBFou1wAaFZzp7nic2dCrzSxYpsZ4s4WDFT5mg0CVp6rrB0XP7rq9zAV6KhXOatkhw
	SiNvo/ykG/fDu8dCegYzzljrhbSoeo8qQulFoTvWOQb+oQdgoANHAD/Ynr6+qXk2d8eapFQKDda
	XZ8ljAMoUFRqGaduorByvbAU7e4XmINd0W4w11A5uY855YBoc4lMuHdSAPV5puK/79RPv1//K40
	YD3TuaffeY9ipa90n993iI0KmfBlTD74TobXIeGTJ7iTVHEKpgfujiA0gvB6whNrAbFr7LkwY/B
	p28khFwBQFUxVXNgs3AVpZkasJ+WKj4cn35oGqEqvTEz+cAsKeWDFrg=
X-Received: by 2002:a05:6402:3105:b0:68a:e1ba:9cc0 with SMTP id
 4fb4d7f45d1cf-6a7f68270famr34473a12.8.1788712182134; Sun, 06 Sep 2026
 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net>
 <20260824123954.315112-3-zhang_wei@open-hieco.net> <CALMp9eSmrHdLpOi9-xQvcRUxyVN-8CG2MKWnxKfXFaBBDztzNg@mail.gmail.com>
 <38bac307-e0c5-4a93-98c6-140b1c52d41d@open-hieco.net>
In-Reply-To: <38bac307-e0c5-4a93-98c6-140b1c52d41d@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 6 Sep 2026 09:29:28 -0700
X-Gm-Features: AcwNN1UgWSO6Yjn-R8pVimjApTkTKNe-q72h-YE1U5LYb4CD7YKT9-WMQSoP4ck
Message-ID: <CALMp9eRYa86-jcgeWsZeiMev8T+wt6TSZk4TN9rqLtcD0uhZOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 7:24=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.net=
> wrote:
>
>
>
> On 9/5/2026 7:07 AM, Jim Mattson wrote:
> > On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hiec=
o.net> wrote:
> >>
> >> +
> >> +       vmcb->control.exit_info_1 =3D exit_info_1;
> >> +       vmcb->control.exit_info_2 =3D 0;
> >> +}
> >
> > Can this entire function be integrated into the existing switch
> > statement in svm_check_intercept()?
>
> Yes, that makes sense.
>
> >
> > And, if !guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS), should
> > exit_info_1 be cleared for these intercepts?
>
> My reading is that exit_info_1 is undefined for these intercepts when
> DecodeAssists is not exposed, and KVM previously left it untouched. I
> would therefore prefer to preserve the existing behavior and update
> exit_info_1 only when DecodeAssists is exposed. That said, do you see
> any reason why KVM should explicitly clear exit_info_1 when
> guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS) returns false?

You're right. The APM says, "Note that the contents of the EXITINFO1
and EXITINFO2 fields are undefined for intercepts where their use is
not indicated," so pre-Bulldozer CPUs would probably have left them
alone.
