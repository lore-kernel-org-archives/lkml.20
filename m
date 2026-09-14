Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C3390CAA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414843; cv=pass; b=oZG4vo6GQLfe3G2ZjTPSD7nb6ImQ/r5BvX08mhC+q4chRoAhFQjM0iVhCfLMKyPKlj5Cy1H5PLsNerZUfOwtrSanK50xOjpYrQW9UZSYZZUXAPCTUZw20MvOWPF9/v4q8EqGSJqmTha5oovwXRAY80y/eH+hN6i8DGTF5/Jm7Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414843; c=relaxed/simple;
	bh=IOrLEilFHhnJxPSxRVHThux+VKNAZpXoN8B5i5lUFcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYOQqsHDVMToRMeTZPl6ig586gTpwVg6MYcNaJtup3brdwvHrK3jw1IzI4pL4ELROEMzGJytH1v2O86XzWuvSE0bNGizXxmdGbwQd8s+GGeDeOefHqiFMuBbuE3f/EmMYCUwlyZoJYGJIFqyCWVryhyAmMkum3P6Rse0i0mnKs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1GTsN2k; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1GTsN2k"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so16828a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789414838; cv=none;
        d=google.com; s=arc-20260327;
        b=N5UFTWBnkVpfbXtzOCcx4SrMLO3upWB9JcTe4E5kQWawKhheM7YNXeYo7d9o+y2+lv
         yRijZ1dBeME8GB8V2RM/S4/LmRXu/KI1Rq8c/9zA4eDenOBPootY0cmqrddvvTt/B17j
         JsOx35jxGpK3TcTx/B9TXLZJD7LygUpnHpZJIwG7rLtsfoQkoqpsbH5sUB1jenmYXSTq
         NjbTbXVVTKFQ0V4hnPsPm+58d/SPELce8wl94taaN5j8+Z9t4DjNMmi5Hv7GfxW0KoGP
         rfaJMo8YFsKAib34RjjeGMNcH7sQL92pygVwahEpisMNAsVazKGVLAluITiD4DpuOnah
         p6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        fh=/LD6lv+x5t/PEGab/Yvpsi7diOSeIRWX3cvN8UY917c=;
        b=atWjIawtyBms0PF5MdGqm6XRtYZb30AHUhXOjTNJgJs9DaZ++WH2qRvsPbo6s4Zxuy
         YPHDHh1kSeQOOlH13whgT92o6GzdvWgQHvjldS1PtCWiqHzrFMS4krmtxp9tQ1LB02TI
         BLhJj3ymJsoboxBKNoljW/pr9OSUtXAusqG0pYE4OhtkJWFpU0vxpwS+frx14+lg/18C
         THkXZVJT8Mv4GRYt6OJy7ZYNMO3B6fScn7sJF/AH8Ym2ZkYKv1tuUOiAO1FrMUwMyCVf
         LcRzheIJIzdde07dWZBuvx3tcuGm7eWv7dluaRnKwWZEjFS98rEEq2lTXqYOAjhAPVXQ
         3ysA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789414838; x=1790019638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        b=J1GTsN2kVknyCzdDaEHMj+c1Max/oEEuJNkiiyGK2zH0OcZLZMAkbyk+z+/qWhtBNX
         nTmb9FpFY7euvMvL4whqstyqFzLc5f+Sa3nJmIi+Wu6IONirPudVcrSNhcMRa27xSgwl
         pkuwnkOdIq+m/B8u4eaQ2w7BaCzSjZufWFBTLmykU/vu+edqyu211NR+B+2blC9cs4eB
         8IpgIfwKY3T1MFonCwT0HJiLmuscfg8HImF7BrkBhzAjtS2SwO1FAuPvmVaPBh+uUz1v
         aiWtdhG0rbe3xhPUxytNNFeNpUnYrt07A/eIgOIPyuYN+zh/PUCUEJyvLEQD1BeMrwqh
         dksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789414838; x=1790019638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        b=bblF0w/inssjoQ/xtSp+8JG8j5hErCrlJRRJ8PvfDlGQ0QRCt7GD0WN9rV2+WAI5+m
         P0DL2yg1Aa8w+AKGfXy5sP+T7iBCEEwWWaCknTviuqvJWEH0pKe7TdOxlGJyot9G3U0F
         Mn9rcMsVzdEuMW9Gten5ReBsoLLB0YSSDwKAIU+lTyRU8JzqNKYvjqNZfIBgM2LGEBN/
         2rnm3/3NqDu9WlP6pe+1Q9aU3ZLf6egIQHDK9QUN3lRR1jUbtX1/hv8sDeMa5Gv25LnK
         URo0hivhzbbbo5GXZ2CnUx0QsUjxGg1U+VCXyjHBRc1NbAgNLkBeydLu3VOFoUnKNzXl
         saSw==
X-Forwarded-Encrypted: i=1; AKwUvBzoso3tXX9+rpRLTXf0lpSE+yddTQALpd+746KnpGkr4MnLflHXdku0235Gn1fqHPFC+qclwgsYVCVSjhM=@vger.kernel.org
X-Gm-Message-State: AFuF++lOjvLAZH6vGPNITKjtde3I1vIifcZ8Zxe7ivfbG3bqMNHjZI8E
	Pzt5No0e6bp1ad76b19K36hKE0Fnh7uP0GGTk0Rqg7lVHbI7+vbDj5h/u+GLbD+MSbtP0G4ba/r
	shyUy9aogBmX+mR53QZU2Wzxfim2NekNNpoR0/WU3pyCJlp5n4ALBJXLX
X-Gm-Gg: AYBFou0Adnz4TQA4+Eddf16MHYLp2xDObAvaS+gJNLNTHq2c0fe7pjCf6TggrvcINt5
	wEIjh4rkTdeLsbgbfH8aLf6hds6etfBPgJoyjbHj5CJ/Yu27/wNbrTVcVm1Bl9zL5MfttS9MvTr
	Olzt/NrM+ZCEDMkivxJQSTcWg143KRmuso6X2GEexFO4aWa8wa7jV/0MZo5AOMXSI8uNIu+ItTF
	phQF649tGOZmDDBgXh4syJvVBrH4XI9Dc89mikLjT7tWXjV6sybVyh8qr9O54dV8pSjCTyUkLsL
	/KPa4kOY4SCU/xD2xca89kSk9EjosEXoGVAmr9MHNnOzJY+ocfIa1xGo
X-Received: by 2002:a05:6402:691:b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6aa043db7d9mr8757a12.12.1789414837491; Mon, 14 Sep 2026
 12:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <40f8ac084021e48fbadd5697ef16f674554a4480.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <40f8ac084021e48fbadd5697ef16f674554a4480.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 12:40:24 -0700
X-Gm-Features: AcwNN1VTxREYw7yGA-RG3H7Iferx9bVJ6dEoqU2hzDKLAla5Isbu_EYHtunu4hY
Message-ID: <CALMp9eQq0-YwL6-jV_ZJke==J1dHa4YFs+xncN-ue0vr9Me2=w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] KVM: nSVM: Propagate hardware DecodeAssist bytes
 to VMCB12
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> DecodeAssists provides instruction bytes for nested page faults and
> intercepted page faults caused by data accesses.  When the feature is
> exposed to L1, copy fresh hardware-provided instruction bytes from VMCB02
> to VMCB12 for these exits.
>
> Leave the VMCB12 instruction-byte state untouched when DecodeAssists is
> not exposed.  Otherwise, invalidate the state for instruction-fetch page
> faults, unrelated exits, and exits without fresh hardware bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
