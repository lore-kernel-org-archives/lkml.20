Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257531;
	b=WF92sG/IVn1BKFHZJS+8IVBop6tqbvfndAqnOHy+uZFNezOMnkl5p0dCqI1ldMVIOGpz
	 jojlZIyqpnZok6s1uvvppWmcOWLx70NDK7Wczp209sJra+bystkeDtWihHmwZYtVJ7TCe
	 Un6zVo5fU5tyIn5BGGoKAXAUJbqQa6j/hemwr22ikPcL5KNZVe3WvjQjDwpHiaWB2/dEr
	 ZWVK2Fto7oZTjFyTgJQNyAP5X20QlybCiCJQRKadBS7xvF4g3vo6WfLFNFcOePktLRGRp
	 v6QYRTG2MurWNLaJ04y1598+6IeVdPbM4RwdBlqDy7+P7ss/TrIS2E/zCjXPFgK0x9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rcTSw5tiRbAGJ0b8TgjYv5hwooW7Iqf2tSDVgzltclo=;
	b=DOFmeaulAKaUDge7f8ov0aJ8K5BNM9SEH0waBH0HN360oQSRo10P6VW7Wf2jSZtOCxO0
	 tmSYOmdTEu3odYsp6edZyJSudX12EttJHlqf98j7S49eTU0JldGuZK3kMSQ1FU1O9loEN
	 fSa7BoaubqAaWeHfbr91zK4zcljFLoxzlqqRglKkES1mX3jYIsHEYktlnDCH4ZrAyUUd4
	 cKHOutFFO2sPW6SF1+JX65oooyH/wOSPqSzLldTOsbFjMemQhpDasl5iyMvuM5jHZ8MWb
	 Rtvx8XRWw6P6jPzR+IXftZhjYcszIO3HBEnALVfSv+l/78VDMPx/I+02HT7p4+xUKLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hAsRLQ4L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C73606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hAsRLQ4L
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4149a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257527; cv=none;
        d=google.com; s=arc-20260327;
        b=I2io8IsD6THxOUv7D3e86Y6Li/GblpyGcbYkueAXxJDlixHNKcRSfZhMchK/hIq4IN
         4GjnJ00zkp90RqfdC7u0JLUhgis/xt0C8pQmxJPXmoy13RN7yYpIlVA2u1trt696csXc
         Jn/xu+cMd4cKyCT3dYrBHCJSNBWd5LDjqU6rTcoKXO8IuH7bA6AdlO+QzjPPoWaBfL4z
         NV4g+Afz2M7wOltc144dVnuPAQ6hziznxaxWrGXE/D5ru1ZqN1CjQHtiIzprbUPIDSPx
         TE3Y3dqC8UDkEKp5kRKXJj7OhcxwsA03h7SOT6BI446viV7TzmnVPmouNNOfOVppobHz
         ZHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcTSw5tiRbAGJ0b8TgjYv5hwooW7Iqf2tSDVgzltclo=;
        fh=rEXPSN5lxxBZss6C4JT+GYztjBn1H6070PndPLtNyuI=;
        b=dx6pjRuKt3tcG7N/Kx6UZRAtlT1MKMrX5YuJ2KfxR/7GxXsS0Gmdyc6W/ZA93f4rMk
         jAwtHq7xfzA29gsRGmX6dvvqhl3sL74J9yt+ra+wlKipa07YSzj6+6bV6UbUxSmubkjI
         UEYGGuSB1Wd/3X7tjtHgLRgVQi3cWbId6LwELRrNILzT/aKfc31UgoUUCwQjP5jGa8P2
         eexn6uhB4YFpO6eyP/tYDIDX3vp8+KB2R0RK8gn4pszMH46hPfOr7CneHVFNv7QKruwy
         zT4woe4F68PzJ0fFLYAHcSRA0HHujbXg4Ii51KCiHEJbKTRUFVYPlG2nwtbVj7ofZPYJ
         7Uwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257527; x=1794862327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcTSw5tiRbAGJ0b8TgjYv5hwooW7Iqf2tSDVgzltclo=;
        b=hAsRLQ4LiZYpge3EhYfAgzJGGzvN921AQgQs1Ci2ECaG9M9/BODeHDV4LIjHWlRVa1
         Q1r/706EYEQGSAv0V6fjx7GL8U3orGVyr1Qv8Nu5/yXoVcG7ZAbIphXQ80GoX/lI3pJK
         ODLFSHBzcjtqYUecAjHSelyIT2vXlCRdFP9V5qmQ3MDsF5bjY83jDpVGVBMGwrNkjyRQ
         4w+yQqV/4RkZMebjKHPegbHUqf8gpX127n9Qio5Ws6JUU6BqFDdk/kyP9ZBzk3BOhOI5
         LeW6k5HRE89HgMHVurXIEeLE/t294XsyMxX0MhFkf9AuxXx2Elod6TFDsn0NoxOcJ3nP
         0JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257527; x=1794862327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcTSw5tiRbAGJ0b8TgjYv5hwooW7Iqf2tSDVgzltclo=;
        b=BIN7GAip5/PZb7pnaOvCQi1+Zb2Z2uq39rq2h7+ppfru0RVpk3Q2hAiOaJfyl7uPXB
         gjIXmGTwTTbZTb6jHdMBMgkc2t8Qw6JWgbjZwkLG1ZpGT0KOBO2bMFxClKsDPvpd5SQy
         TheCJZAfm36Rq98K3z8JDFgzbNli/PJul5a0FXvVVhNHyoph/t2JlI7RjeI/r2MdftLq
         eLthCD+mFx/YIWdR+22cC2AA+Y116/f4X+Lpk7z/rZBkO9lTBjXeC/mLcW7kaYnKbSfu
         aOsS7oGoifeiIjNiNrLM3ML/L+8JqS30/PFbFadxjcRTDmnzM1iXQOrY+k/pGyDCi6Wh
         h+NQ==
X-Forwarded-Encrypted: i=1; AL+hErEWnu11Yxp/FW1hKHFLDTydT2HX3pLbde0dA7s1dHfvb2vMqxpQ/9p7DCazgeeCT7pYHjt03du7dvhuPvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dt0J0ccAxb05HkjBL2Ms8xUkfkpi/53yDtjH9WtKMHyV0IA35
	xHx/o4Q1QswdTF6k0o295MMZ5eBgeE7z6MLbTFAMy3I4cMzWi2bP5GboP5YfZIsXK9TlhQ43gy9
	LL7h0baVgHcSrXkzTdNzEYvqQTI4OLfMiyhl/vnEN
X-Gm-Gg: AYBFou0h3K2p7CetcyPBNZUQAfrdu76j5udlGwT/OBO4pC2Zw7EboeNZv/i1qdmYtyA
	h3AJgPQgU/3DqNVaibPY8XRdznH1Nt+841UvpqZzuvI6BjXWN0XYbzIGzX4HEWZ2V+Gpf8t9c1v
	JHcpF5w1XZOkWbhl7WyPZ4vgzFq6HEqTcBG8vh6WXZKxVc5POBVGNfb9AMwYEeCpnZc7XGXpTgq
	jJ/TPcvSxDcd1sE3xoOTnGJdGaU1rr+OYGxIxm+0TKjMqg2HbBm2QtotLHkjIbuUcL1f7aT2rHZ
	MYizikB+HOeHOghkQEslMD2WazR3krhRWVFdUgic6zcEUD3CAIIYsCmXS/gUaXWOvXctsHHeOPZ
	BXTn0TCq5WBQYhOjF3o2rf4LDnbvg2DDb6orqWLycOrPTw1nkNinmMgJ5DBfY4fJDLIzfWBYg
X-Received: by 2002:a05:6402:1812:b0:6af:97c0:ce51 with SMTP id
 4fb4d7f45d1cf-6b75a46094emr4869a12.13.1794257526955; Mon, 09 Nov 2026
 12:52:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-11-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-11-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 12:51:55 -0800
X-Gm-Features: AclHuK_jh4BG1_Jg_Og6V6gj5lpyZpXNzqYqYHPmT3tAbR7qfr1zyYFdUD0j8_U
Message-ID: <CALMp9eQjzERciN1_L5S46=wqQ5ggHJwOz7AkFwnpZ_qWo4zcDw@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: x86/pmu: Document GLOBAL_STATUS_RESET
 passthrough erratum
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wrot=
e:
>
> IA32_PERF_GLOBAL_STATUS_RESET, introduced in PerfMon version 4,
> inherits the MSR address and architecturally defined bits from
> IA32_PERF_GLOBAL_OVF_CTRL, while providing additional bits to clear
> new indicators in IA32_PERF_GLOBAL_STATUS.
>
> From an emulation perspective, KVM handles it identically to the
> OVF_CTRL MSR: reads return zero, and intercepted writes are guarded
> against pmu->global_status_rsvd. No code changes are needed in KVM
> to emulate this MSR.
>
> However, to reduce VM exits, KVM passes through this MSR in mediated
> PMU mode when GLOBAL_STATUS is also passed through. Consequently,
> writes to bits that are valid on the host but unvirtualized by KVM
> will not trigger a #GP (unlike when the MSR is intercepted). Except
> for the known limitation where host Intel PT in system mode can
> assert Trace_ToPA_PMI (bit 55), unvirtualized status bits are not set
> while the guest is running, so clearing them has no negative effects.
>
> Document this divergence in errata.rst.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
