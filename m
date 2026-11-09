Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257643;
	b=qPu0B/3etS2BRMJpyYt2XT4NYJXJgRrzUt3908jS66yH1kn5CVNEMOvvEN0cS1JwhFbt
	 GNwOb8uHBbRPSvgBipLE9nk9xCiJ75XP3mxD+/pxUSYphShzf9Js+ikF3pWDjhBFi3a15
	 W1nycP/kfIAbEcFZtVPUADM69jzjMN60hBKYgl561+lsy6iK4nCvdqeZQbE5FhcjSqJTN
	 bX8szCQnel8a45fT2N580NXgDu6Zr0zXnXVft/TS1HT68CyfNMQXEDPDbSLXxF0q62JTo
	 N6cgI8HaIQsh45kCmzT9OwC9JSW+Y0vh6LJjTwYaFJHcSmAGoWHyUnSZgYyksxZnZvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tJshWkDF2CVYsp27lgxloaGQimeueesl8RBwt1ZwDYg=;
	b=KUJSYR07yvT6VCNjZ1I2PrR8G+vLPIcHR3P2JX1dZtsJWwYL3W0WAUeeA4kvy6o9Vl+O
	 uwYTciiHxhg57icxtZ1CLkKlz5q8yoPrpotm5xj/Whq2avJcv27koaJnVonS2DbTj07KY
	 hI4YOvmvgc2Z4kKxPZ0VKrT32qr/va5NdUDtujFWSyvfFWtoq3CfLRx3dFT5RTklns2AA
	 F1m525aHqk1n/GdcxF5/3+N5MK9YDeqcJC2cMI9pT9clgD36O34q/86kWN0tH7PSYgZgh
	 fqWXBn1EmqRaGRJWffqRh0kYWSlwxJejTzZGTjwcz2qcXtbLPYZbgZcLGnHY4daprbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MX0a2LBF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F205606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F205606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MX0a2LBF
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso3848a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257641; cv=none;
        d=google.com; s=arc-20260327;
        b=cVNB45Tx7xu9okzO3iolhfAWT9CzMQWAJ0kNY8jFfWMcRbbb9MxRI4DUTjkYblxLMC
         Jkn9y0xw1y1SxtmMmLueTnfGLyo/65FZvFAGhcWCxn26TYxiyLl7dZVBHpPp+/7xYN2d
         QroyoxwpdWkLk/5j9PwdMKlt1TGo/FItZVJ6TSL+SAeRmz5cYEy4oFxVX/Yt2jbHjyxp
         xKXWIA2wws/ARvzBR3XSInAVNnl6AIX0MAnE0UDpBowEIGjBqe+hWicwePZZnCc06ayb
         TdUF3AAOy4gsfkx/Gu27p8dHeWFASMNP+ImQh6lujWSMOp5W2tYu39qN8EVSEtJHVk+h
         erkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJshWkDF2CVYsp27lgxloaGQimeueesl8RBwt1ZwDYg=;
        fh=TlljUhDPjuvmiiHRY9j68mn7HPcnHc5GUNdiG586TR8=;
        b=nGyRctGJYjSCyL5JyQ83PLf0wp1bf5SGKh8YoanmXKX9yfT5Lb3eYh5n4AsJzG7OKE
         i22TuSURb4tx3BhDgogbgYOJ3pdxUfdJpO/P3qkBcAZgIFzOu4TLJJmmgVChuOUxKU3R
         bBEk73dhx2SxMiqr1bUuqhf5vzyx1/CSImz9mtjtNhmnjlrGAPQFsAPOGOZ9k9al43iU
         UNWCXuW52IYvJa/1NY3HcOAyccUtLrbKNmPU2lH+VvL+NRVikD2zi/X98OmvRQBcdofm
         +Jiot/H5MgCjejk4z8L8AOaLOHrIsMkdJoOk3NSmTdlNbRzG5Sy1fUTcFDnh+TSri+oH
         hv/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257641; x=1794862441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJshWkDF2CVYsp27lgxloaGQimeueesl8RBwt1ZwDYg=;
        b=MX0a2LBFjEV/RZFucaGU1f86oj+oUPzt+1Iajv+AwZjKMVAXMjp98s38uDKBu2Y0Dd
         msolf7iuG5qJMHHfjJpAyuvD81hiKWUTfdopzkZhWSFyWAZNl4wb0uI6flyUE6Yggt+G
         6iSAa4UGQ1o5WXAaoCbaic7cqOYR5BdaytLbWmkpVyAYp1yKBrSQadtaTkge1pB34Nl3
         SDz0OHRfF/++Am5gmjBpCwv+ZJGcocSrI3tFCi1wLQCCRTgEhU6LVxdcsQoqtkzkWJZX
         eDpW+gFtwM0nZ59F2G9LyyDRAnOks44IqrvXqW8OR8Jas+C/LWC11fwy9RvM5yfO2sCf
         +78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257641; x=1794862441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJshWkDF2CVYsp27lgxloaGQimeueesl8RBwt1ZwDYg=;
        b=S2Foo4i865TL1ATexIbHM4Fx89MNguzwTIePN2LT0uUHBCeGTXtoRIZw0+ZD/i47Yn
         5TzC79YaWq3ViiMsshwH64FdqbCCz221VN3FP8Nah250cg8L539ltH+eWqBMje9gaKti
         Gz/W5Ej0JFwJs/TsQwkRGwvU81Gry8ybJDelL+cemz0kZkWgl+dv2Rmzxue53tr7w5Wl
         3UpKMrG2hVbf5NQg+eP3DL7PX5t1IL86IH11OKjgZ6HnprhUB8fnh29BT4SnRtvGE9yt
         cbfn8MR3aTQQrL9waf4Rfnzbpjr09gyo5/Ft8TehOurVWHpM4wVbOc3YIVgLDwaTZ2eh
         oXlQ==
X-Forwarded-Encrypted: i=1; AL+hErE50+8+BNNH0DQpTdUWvbf34y/E6JRTGEfsKRruLPhfpNcSK5aAwio+aXu/T84tul/TBEFdXT2brh8cbAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZC4ucKPDzdieePy8Jco0HL2kOZLacdVb5WMBCGgl6hSIaOhsD
	rI+9hjHUgP4gqsqBSEl6CGBRcSmCGg1BXI1+ug0Z9mVqEYjGjNG5QRFaCcVa7tUy9QvlfH8uCRN
	LK1lPo6aB3gyuH9Grm98Qq3Yhelmmx3/DeCVbm8fLQ4HlHUGwNGjM5DkwNbM=
X-Gm-Gg: AYBFou0ytLGIRq87sdm2/Y5oSHewD8hn8rvAP99N8jGbIuppQJVO1u2F378o+PIx4uM
	KjF1Q6eJ9fMgNo3GfEGIMb6tTuv0HH7ZefZKeUY2mPF3mbFeW1bjb9AR25uWnmHehyDUIP2sUE2
	4IaaCtUmFjRdRCedMbeTAHMV+Ocve3uW6sTezILkXapmU+rCKtB9o0jEaLLL93I9ObDlHVyscAX
	jOh1PK5qj7oQTGVpDrOTtRscErVKg3nZRqwBVYKb4Gn0w8RLL9WSgk1aIV3UgUum3KwHdmEVKOS
	h4DypABIAp89FWT4kBzG/iSOksBbeJzN2b9Lcc0G6GDIY5OU/rdUiXo8M/GA/8mRD+j9a5cR8iH
	xA1ASkqpYEXoeQBCS2iCR+8KB0atsb7+hZR24lM/Ee+gPIYD6XaGtBkgR601/8hO0itxJJtMf
X-Received: by 2002:a05:6402:a54d:10b0:6b4:18f4:94a0 with SMTP id
 4fb4d7f45d1cf-6b757764774mr18849a12.1.1794257641073; Mon, 09 Nov 2026
 12:54:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-12-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-12-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 12:53:48 -0800
X-Gm-Features: AclHuK86JHMc3kTFU5jaWNU0Obj4DoYc-lJkIPeBBJWv59wReMypWf63mqzRBHA
Message-ID: <CALMp9eTKzAMK5G7t+Z6_MYHfUi9kE3t0YQDUYDu83G89xP-njg@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] KVM: x86/pmu: Emulate IA32_PERF_GLOBAL_STATUS_SET
 MSR
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
> Intel PerfMon v4 introduces IA32_PERF_GLOBAL_STATUS_SET (0x391) to
> allow software to set individual bits in the global status MSR. Reads
> of IA32_PERF_GLOBAL_STATUS_SET always return zero.
>
> IA32_PERF_GLOBAL_STATUS_SET is not part of the VM state, so it doesn't
> need to be advertised to userspace, nor saved and restored during live
> migration.
>
> Always intercept IA32_PERF_GLOBAL_STATUS_SET to prevent the guest from
> modifying status bits that are not virtualized by KVM.
>
> Bit 63 (CondChgd) stays unreserved in pmu->global_status_rsvd to
> architecturally allow the guest to write this bit on STATUS_RESET (0x390)
> to clear it, and allow userspace to set it on GLOBAL_STATUS (0x38E).
>
> However, bit 63 is architecturally reserved in STATUS_SET per the SDM.
> Reject writes to bit 63, injecting #GP for guest writes. While older
> processors had silicon errata that accepted writes without #GP (e.g.
> SKX95), strictly enforce the architectural specification for
> deterministic behavior across migrations.
>
> Platform-specific EDS clarifies that CondChgd indicates a change to
> IA32_MISC_ENABLE[7], which KVM intercepts and keeps strictly read-only
> for guests. This guarantees hardware will never assert CondChgd during
> guest execution.
>
> Thus, the architectural asymmetry among these three MSRs is safe; being
> unable to restore bit 63 to hardware via STATUS_SET is benign because
> the guest will never legitimately observe CondChgd. Filter it out
> defensively before writing to hardware in intel_mediated_pmu_load().
>
> Originally-by: Yang Weijiang <weijiang.yang@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
