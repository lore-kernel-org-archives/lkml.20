Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794509591;
	b=mvOoP4FnXK4w6wRrwTboiL5G7H/dO4Add0tw65tX1rtvk3rXeTXGDJjp+09jZ1SjXYyi
	 fC878tVXkCg8ZLwTOM/wj9C0c9GMTTId9xCu7OurONE4doHprfCP2nnyba5fsDTWE0JD3
	 h8gYz30xBwAsJNmrqHG4+s8sravSBs42Y4mgwyEjpnhmwOG5uWmUk1a3kMuq3kQiiQszI
	 3gS76/NaDXk4BOpVYdYHfXbOhGn4VP7plJLZMVSxzl2F35CJBM0HgQoE9Txao0qEXMEjW
	 3/x6IfMV4GOp5KncJpBnXFrOsYU1hIwkOwRmya1v6Ub80s/w5QFVs3hxQb+a3wC5plg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
	b=BXdEd7fZM6uFhQeqae/SqwcDwmG07ieEFFyIMs0aVg43K7VeBvRFymI21Z/H1+B0d6vh
	 OeAbVAWjoEK2EVKYUlTYqRka/nFHdUd2a6rKip+MenJJvAk6uiPURM1uHpPH2AOXdUQfd
	 f9J0lWBM4hwHebRVxZKREAu9Z1dh9VfOkIYKnh5gy4FVL63vIRK/5WHvomP+df1GxfK4S
	 2nTrwg6jrZQ/nua++mDKGja4mJbSguGeKLjRCrv6LvR2Q9LtLe1gyKvJ1E82kR4tCmNrJ
	 YO5bhIAJzUcYX72tBPMKAxXd5w4oxQAwnHLZmQfRkbDIM106uTKYKHK1F/Nou95zGig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F00606A88D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F00606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZrXABmQC
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso712a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794509590; cv=none;
        d=google.com; s=arc-20260327;
        b=L/x8V23VBCfn9xtVGzgF1rd5lTlzClK5lgkygj8mcZit8oEOIYLg8Mh8VZkMZdsKhq
         KKfTHutGo6ypl7ISC5NKmYf+fZcTUTnWavC2xsvHF+9v6KhxTgaphiUKWcljn+d987aW
         MllRo7OizoKgooI6rppUCmYoLVu0DQXFgua+EPhYJvR/Zkhd/NteqpwSpDIGtmuHnCpI
         AfiY2+besiaLr1vJq/XbLJ6dSBrdvUL1tlbUl3m6uB4iJZy0QU4Vr18ZvyxpBBQ5QAj6
         OsArLet0SeEtBXTljMtowoEyfyaao3rLNnqNNRWk7F4IEXdKM4qA24S90dMtUr9gTo/2
         Oi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        fh=xqn4Um/lVvFRQe/rFMW8zf0QqrIf1qVbyWveHCTlMI4=;
        b=nzjnQ9BU5j/u+KsmxWBQCK6dsA/uBEQDyqMcQmKNSEEM77+BIWOlIZoD9Jm5MD9fG+
         8rrc8OOVNHHvbc7tJPHuqvxy3ocWhEja5OD6u1SmKqSHNeHClCUe1ducGK1WDSKn80Wk
         zfCN866crGotcmzEzX17eUqWniJ2QNqXa8OZDr4wBC4dIro4V/2ZiMuEjJW+4uQmY40n
         On+mwx3TTWsLC6T/7JZSMKHiwrlLJqKcdRD1q4lcg1mzuO0i/FN7exARBj5EGgD9TmpE
         heZ8Bgj45YoMXN4CZ1qyEvE2eeusOjPRji3tDkTY8IgzQWLhIBpE81TgVyJJuJmv/pbp
         Lqgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794509590; x=1795114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=ZrXABmQCJ3w7fpvZ4karrFrjqd/K0rpSVTywmX4rQzivW0jGhC03EBEcz4x1rZkt8Q
         xZcs/BuI8zU80KvjKJSKuYtuGN5mjG+fjxgyYY1zzVeneVge+I4spJNx2yu2QvsTT+3z
         TvPQqMAGvHx2vUpd9qW4OU+W5Fry9rR5vNkLu1Dh44916sm5TAsfKFS63IqtWkHs77h7
         R3bLVHvSuDoXdeOb4Sqv80Gbk7hHPfx1g7wqwZXqG6wIyCH+p+vTXKO0uHUqslp9hEqy
         9SA57J0VwZZvrWjkKS5FzZu1G0+tHoMzzkIWcR9t7JMe3BPtICsD7vMYb+uUx9TrZQEC
         uAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509590; x=1795114390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3Tw9p9m98nVDXDhiISUHwXl/bWsyTWQBoH+O8XaA5U=;
        b=KS6AA2HbTLWHMoMV53nbQ7l7BD2NhgdMKy1nwMZQ7Pm4DIngQ5LAl9xxU8gKlFTGwq
         Bb0ILpkwUyVm0qW4OYbmQJnIXkViVdp3jUT9kZz1z6uxqqKXM6tVvhXbJvGVwrTPvceE
         tr+O4/vRuVMKE1gYxBb7VDFzkJd4Eweq+aGPqxa2WiG08tP3i9EXRBCMhgR0alYIlGYR
         d0GippZ4DBifzQSYtVY0mGGKsKQKvpz/ObJzKm9BLW3UbnV4nxSR2mqzT+lSmkDDBYpw
         lSuxnZgmA4VpCRBVtISlTZSDcVZhHS+yTdN9V9fbHhS0JJibnmvd/wd/5flaPLbEZs+D
         uJvg==
X-Forwarded-Encrypted: i=1; AL+hErG2iu3ArOB0mALONBxn3goyx8+6cOwrDBrame2LEq45NBX+3lkayhLetVuYRrZGU5tPZxq9dTn7BODaUxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DupmsrZzCGpx/VWcReRICKFvqzDEmYd83jPp/pTigop2WGhiE
	uhaU/BOY5lH/bjctGPuEH4bDTYk9R9XeiC7raQCY2YEPHxYwSzkr9pHtN7rBpowlJrq1ZQRnGjR
	IJrCNHbhb/tCBfEe7Dq/mb9QQhSBz0OB3t7x77SkM
X-Gm-Gg: AYBFou0o4LRPHCAtSs0WFEaC6V/7J+rBpTdlzDKTEY/2eGp0XpHKK5+lp29UXmirZ9X
	rlZi95kZLo6eN/5KpeTxoX6fMmCjR0p7ADUlp7I9BqbIWaqDsCbJJfk53fN9DvL7n8JyoYUnL3n
	ZXHhtuHuw4LuyJ113dXQqI/CKe+/+lcLn52uXQNFHHpBX0kPq/RcQEcrkSkw2dZJZN2BJ70o4a2
	XG2/0BEoSaevqWYvaZGZ+5m+ml2Z2Ub2Dy/8aGuW7h/45sQ4P1tYPht0QvbrvTKV/8skVI4j7E2
	CCrN/Zb6rlOs+snsYGL+zep/4uGx7j/NX0j9vMHLh+qv3n4UBqTQ8HO9KUkz+u0CrYxeC2Nffn5
	IW+zTnZAFSZJW6vMJovIr4ufv/f5qBU0msQiBWfGvKUwAL4GD5KwOWRY2EhsVzt/vIrTmhlIa
X-Received: by 2002:aa7:d85a:0:b0:6b5:66cf:eaa4 with SMTP id
 4fb4d7f45d1cf-6b7c278a457mr7058a12.0.1794509588955; Thu, 12 Nov 2026 10:53:08
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:52:56 -0800
X-Gm-Features: AclHuK_9mvODzBgQFtLS_Gtq_h9EB7DHS-Em7YexSsSAbzFwFzuvZxGvVdZTuHU
Message-ID: <CALMp9eTF3WtzGGaV=sCYLqm=8oHNbqg2pYUr_qtcXJaAKjc9bQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> VMware's magic value in EAX, and let userspace complete the call by
> updating the guest's registers or by having KVM inject #UD, #GP or #PF.

It's not clear to me if this paragraph implies that VMCALL and VMMCALL
are supported cross-vendor. If so, it may not be true.

In arch/x86/kvm/emulate.c, group7_rm0[1] (VMCALL) has the Priv flag
set. When an AMD guest executes VMCALL at CPL > 0, x86_emulate_insn()
sees Priv && cpl > 0 and injects #GP(0) before ever reaching
em_hypercall(). The other direction should be fine, since
group7_rm3[3] (VMMCALL) does not have the Priv flag set.

In any case, if cross-vendor hypercall instructions are supposed to be
supported, you should add them to the selftests.
