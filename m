Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257803;
	b=P/DTi1hDT+nn2mQ1a893RNImT29G7KWo7VH/6THOH8FhQPRd34rUYuVY49/XigmE93IW
	 bWjw6Qy73qZ5ro34mgwPeCl8HFtnJPaEgtXT6ryPziO+DQJibui3fcSmP9Bwb4uT9z2Ky
	 P/ulVwVNRm4QwCXnwYQNF7sLpB8aoAUBDY7l1YWsMSKDSxsuAXQAF5kBuqaIdarU39L5i
	 Y05gIHNosGL1BGW36aBcXNE8qfLvlyiRH1EO1sM7rvG0OWsKrZUbPGIHHo75ps/UfT8zp
	 BRyEjrJs6IIbagfqPPustrPnIitJ4EyqMsz5WeO+tGiiefpuRpTDaKkSHk6XGLXJcGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yQSdZKmmpcQWU+DJnbn5X081+EyRYqo2+GaLjQwTf6U=;
	b=CBEFU0Jr3XivEKHq2LJCcBskwxCNE7VK09ZGUx9KbPlUiPRi2J/U+wfuAHN+JIwom0rF
	 RSepnMzzA6OcjtRbvcPmvnWrZ4w9s/3pYyXn7ZVYNCo/H39puF9BT0rHilwsFVLEpCG/D
	 th7q2nJKAUbDFiaQmC+IfezQHBd/Awbg2MPkW1TrFsCvfalaK3FSMRz/U/DbNGMvYI9NW
	 yf/8aP/Pw16KmhCuej9QDfPewFQyzc2GTrkCfrObskjjWjKGxOioWb8ivoTm042Krpwt2
	 0ylusK7+YwR2RA0qQVx+hmWZioVs/EUfgD7NGvyB59/xeQ26HAfp5IWVuSJG1Rj4yYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=frn5lMeg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517C606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A517C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=frn5lMeg
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4217a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257801; cv=none;
        d=google.com; s=arc-20260327;
        b=bTQV50NQL5eb3RmLJzH5TW+xRtXhuikH8JAtBTP5xUpiHBvFJl0Fd1Yu/PlqgUal9e
         40EIJDnoz2Jm6D6+EXR5dfLy1K/J/GI+chvCPcj8se1j4M+TSpl1mCMvlDF6hM0UQ3qu
         fW+48vQ/NfeIJCBnsbrrtnD50Cu5hx7WPmGZuhg6JG0bqAwH+M5QwixgxE7TBRedWWp/
         Pkq4o/wb0qEB8RzKNiFzJNU3u52oa+3sNLB/atuqMjsJak/OL9xJ5ga7vNRFkPQ4iaEf
         MA3lTwRi1WssvO8W4O5NxX62RZ3odmzDzo8E2pQN2qJ9biHoBTevBlHqx40UPBLgnMEE
         BZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQSdZKmmpcQWU+DJnbn5X081+EyRYqo2+GaLjQwTf6U=;
        fh=Zgb9SGRYyXVmu1YQbgNxnVe8ASmac6ho71lDbkIsPA4=;
        b=KwmWfQ6E6uj4zE37jAV70GtPRTKPi/DPTLLKfyfBPpmezcYTERKTBr1A1gEVZNlTyu
         pgEp+8B8W+TNXtwu+7dnSWWwL3L7yuz0SL8vOeIMEcYmHhcoHUkdMST1ut2VWrgc66YL
         TLfyqvA0XMblYCYA7nY3sGV7qrqyGp+tVGZtZ8N9PO8Xj3uEQnfI+ZinHHhTL0orNujs
         khzEji6BOXAAf73AOgopngcsDtj7Cfgr/VVgz0kDz2XHorghIAinVZoAGqTcta3RU8wr
         ywJF62wm650XZVihuGFCVahDH2tGBOr2/08QvX7+z+elf1rMnb4dWYFGQntaNy8Fg7Nj
         mMxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257801; x=1794862601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQSdZKmmpcQWU+DJnbn5X081+EyRYqo2+GaLjQwTf6U=;
        b=frn5lMegsdCiwPlyqKmc1WsbA+58aVroqKji9Soxm66qwDIEnhsfX/gJ8Sg4wHxUXw
         xCGCqsF7GI2nojk3yrLYQWgOQFNI1lyX3L54l+9FC3DEV/wwE8pwYdSOC0H7827HD+mU
         ZK6CZW2fqVjqAcxrb7FY7s5qPNp122oNkXTRSTGpf7QMhJYmsVYirRX5vi0hGxMUsqqi
         emZ+Y9PHB6nwflTbpYdatipyRJHA+DBwiEb+ByBY4Yl4PAdiuhT22n0TH780kBSqfHB+
         O4MvAhrvktpgp3UcBDzqJTnZP3rYv/MtTil8dHXpkonEYu1QNb4SKOcaEtO9FxPLRphJ
         SMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257801; x=1794862601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQSdZKmmpcQWU+DJnbn5X081+EyRYqo2+GaLjQwTf6U=;
        b=NHKoT5X8aFHjkzrjRNCQV66W3NXD2MPkw3re9EFs54Yf1xbye7MtbkeVD6sNCAjHBw
         t6oa5sqo7QA9eOA7ORS8/JrzoJbGquj75HEyoXFEkoY+tbalzp0ix3KS+fwF2xyKwXOr
         oq/E6Zfj9W6uE8Hf+jVMmQ7q6fRgH3jziXGCT3HDpVYm3OGBaStVpcLh8ThOq/e7Vm9x
         rmZ9+va6Tc3U8wgFIL/rxhXPkAsg4yVf0LZZ7fETg78M8uAJ39vvffBM4RgRxVwMrFAZ
         KFkHQZEeV7z1tOJvys6noBz8PtD3SOcYu2zA9Bz8p4GZyY+JWWRXGdKSjyk/9rDhZq2z
         xTFA==
X-Forwarded-Encrypted: i=1; AL+hErFPwHpfK4VhsiGkjae9k59g4g11opTkM+hHpNTfrUaqUs83KdzpgOfZrdg3GhwINUBS/aiF2w4+DHQxdZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MUY6zz2BhJvU7lHxd+TYbnFBsa1lfQdH1FJzGlPIvHamLaY1v
	gIUczApB9Lr3rKev+VKOHwgXoz7lXTs3eBpKzD/2mPIWt5SKL+6MXCoNDnF7LsGRdRbykTvgMHR
	aCt82nE70UIhxNKIpx6mXIVaOKrQr9sORAAWEdqoD
X-Gm-Gg: AYBFou3s4XsOPmPU6iS8JiTZJnOvp1gqgmMfBxd8vM8slBuiOBHkQlk3vfIhxQCoqV5
	Wjqr0PFgeOjc5QgNpzAnbkhEBhN2MouswvL1fgMuCrYvVILA2ruOG1uajV1ditKBITeoYEj/zMs
	OntQZ9SUeucSBR9PSWF3NIgQEX+xrUbhXLGWMyRARBsfMT9gkriI71+vH78PlSDdtrJy9YhohwW
	olouJjPiXhmsJUEpR6cJhpi24oudTKJfVSI0ETj/zlnBgJ+LKUVeWyNu8PmpnYa7vJsk0YTtcA+
	enKh7iUl8V7p7QtJcP+IuS8Q0959R/xsTdL/QbQBZ6nPlMNZ7HcvKwQCKnKiyPx2lg3G/19TdA0
	wDV9b0UYhV8RaIV0yw6oi5rRscuBmwD8rXcqJfxmHWDh1hgP7O3lDhomlVVfa59jtJVYvUhYv
X-Received: by 2002:a05:6402:892:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b75a448a1amr4902a12.12.1794257800635; Mon, 09 Nov 2026
 12:56:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-17-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-17-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 12:56:28 -0800
X-Gm-Features: AclHuK8ECB96A84bRe6hbcbSXoigF3kLgPk1H-sOcW8BUGbb2JnHVgbjP5uyQvM
Message-ID: <CALMp9eSKP1SorDWRoYMZBimoBz+aJx8-iB3tfrqJCkmjJn20Xg@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] KVM: x86/pmu: Ignore AnyThread bit if
 CPUID.0AH:EDX[15] is set
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
> Intel PerfMon v5 introduces the ANYTHREAD_DEPRECATION capability
> (CPUID.0AH:EDX[15]) to indicate that AnyThread counting is deprecated
> and that writes to the AnyThread bit in IA32_PERFEVTSELx and
> IA32_FIXED_CTR_CTRL are ignored.
>
> Preserve the guest-written value in guest-visible state so that guest
> RDMSRs observe the AnyThread bit, but strip it before programming
> hardware to ensure cross-VM SMT isolation.
>
> Continue to inject #GP when ANYTHREAD_DEPRECATION is not present in the
> guest CPUID, e.g. for PerfMon v3/v4 guests or when the capability is
> not configured for a PerfMon v5+ guest.
>
> Advertise CPUID.0AH:EDX[15] only for PMU version 5+ guests, since the
> bit doesn't exist below version 5.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
