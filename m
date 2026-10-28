Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209182;
	b=Qgo8+18rJ5anQo+E3D3mKbwUV1zodRF+WZzTPpP7cogMHSfgo9FONsKU6O1B+sy90S+i
	 QWlMrBC7T9DCpQbq6yDlOwQtbOvhdY3pAiF52s7ygT/LTyneg+g0MjKuF+UQjkETu7Ung
	 CyBLhydgabKBEeXnhvhr4pe2jb4KPbO8n6apizXsw6Ulpvq3LhgTxoqzpvJXGTkkjGV5v
	 zKherTP7ur9948BE52K/F0jbhy6weiW2Gt6SE40UKNi0LOt/eeSShLl+7wMKhBEb0mHEf
	 RGotbBsdwn5BwxX/2EnK3aK0x7gWc2uRTG1E+28syFsyKe2ArREqkuqt1xm0gIPVOEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uEHTXMHdpGW92Te2ykl2wHLQjlCid9PVQybwnkt0bJE=;
	b=U093eZ3TSo1bcZfw9U70M58DyvRCjdnqzBXPvcWkv6QsZAhxYp34NsAGIOPf5oDXcwqs
	 GC2VBucm/JM+ShM1y7fZL7yNcTQcOrclGSKxT/LZwGyusWTF3qpi/P+VAMmA9A2HDXQ+b
	 WJl+IspD+Oi4tDE1IYltQIvUVVld8NliFbXScuHAtTgqXqxxh2VqmSQwESPX7TnQBe0ZL
	 7TVu/sOuFN1DolABgd1DKjRFanagevN+nwAEC6eZVfRZLb5bJOLry2WXkW+7Vb9ww+ezx
	 fb3YRGDtPBolEqXyPrY8Ng7hU2OSBhuwGxTh5LNTqiB7kpzPmsaXFm0v8N0uJUBTqUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZaJVMzqH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZaJVMzqH
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso679a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793209179; cv=none;
        d=google.com; s=arc-20260327;
        b=QwtNbmUhlkIn8/8pVDii1SDt9nPmoxZVayq1H9hqcCYSBqi8hgOgvX9PE9zvRHkQms
         b+c2cvT+ZqxKUuErwR7DPWoNHCYN+vUHRYu06xHJwZem4R4y1HT8bPoALJe7xpeLjZYZ
         7jlPD9pptLq7MmV2ZxXUR5wa1vuGXgQFlXJoBvBvlMiv9uHuW2Fb8OyoEqWqCPo/6Orb
         Rle+FuEtCLyBfZkGFJ0pP+vDjTvJOylYlstehESd4r8vUpsSaG34CNoP8neDJZnPeXhr
         v92cSsGx6mfi+pSRTtN4dV1C8/usm8pojvW2WZtoEtEdHkxey0IILXMczJyWMtvJp0u+
         PnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEHTXMHdpGW92Te2ykl2wHLQjlCid9PVQybwnkt0bJE=;
        fh=q+X55BrlLrSrhMCmNjamddbY290MI0pZLhBoY/HgqGY=;
        b=YDGsqQiy9Q2x25PBJA7NimP7sE8mswfFoI7jjciqYxP/FgS/Sa+t56eU8yz5LdszA9
         arFvAnb41DJQ77arlCCPEVkKw7LbEwWqstrqXytWZ7CaDR/aWmd1GCwbaw+9gr4Yupkz
         YYhN7qL9qJUaYEKtNp6sVzMvGuXz+27L84HpuaEu3HRhznmfqOA+rh0+OySv9vfgdkkj
         5GrsOEtfdRJaHDH782yJ9r6S3NQaOP2x0lljD8Z3FIYAQ22FninAga6rJYy+qNG4r3vH
         tf7HqSlOwiS2LZs+5OBeUYmTJ7UxgavRLrP/KCERHOZY4Wir2RSlVd9FKp6Go3H2zI3p
         IUww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793209179; x=1793813979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEHTXMHdpGW92Te2ykl2wHLQjlCid9PVQybwnkt0bJE=;
        b=ZaJVMzqHuSvoVp5a/JWHXbi/xGcPzmRa221eIFnjnjtzXqHp5VVPfRWmFcYGra5+gu
         YQ3RVRKBCEU8dapyEEttBi5MBqZI002yXhm5Sz3pOm7pAuiEmNzyjKZC/wJ062Tvpc5M
         WUv2kkit5fZcZfUCpfSw4OwHZIRVu10AQo5FfJz7nvN3c5VkjJFH1PHwlLJd5WzI321B
         C3XBj+ZQvIFfYsat/kV1zWSFNPwiRwvKy9CF5fRuKWqDplWE1dhCTwoj/NyI4O4Yu2Lx
         9PivfXB/LUfdMCgCTWxm4qjTU2DPRbOQhLqQSFGtSHQhurSR2qbbKC14TJZg7QhpZl6u
         emWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209179; x=1793813979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEHTXMHdpGW92Te2ykl2wHLQjlCid9PVQybwnkt0bJE=;
        b=hQOFtTKLde1iBeqAbsRRb7cAuDS47PdaCIAoX1pzID6o5EXz6g6wOU3RPl3s0UNz28
         6HaT23tjDLomCYeBJo769jUFxXT9omMMlSUaElKVhvP1TIS9Np5Ao/zQQ+nZiyrkaSIr
         nj59F1cupHeDWwXz57L0tuulP1bbGzNgGkknWO/bGxjQYs8sGgmPWH3R/kiifnHxA+cI
         lTjuD5MM0TRkI/uvboFSeoXXYZP2hcTgB1pg9gIB2jZ63rKnoiipNxk5Q+2P1hll7p+/
         jeNOqmsUUrkylcM7YOrVY9u5wuBLrYanUQonLUKg4s8NaynmLphQhyBLS3pgUAtru0SP
         dZgw==
X-Forwarded-Encrypted: i=1; AKwUvBwtkboWjngue7Trq07rL1EZ2HfVeMetUKKav2ohqs+2TBF5Fx/GwuFeHHtW4XzYLhCVHTcS1L4toOnaa7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJolNQ054goa0rRmw0TdXaDPjICZDOZ9/gOXKzmIQrpzurtj2+u
	xkZWGUmkb8JRvbbDvOR7RpP5KwztAwwFvo9M+F5s4wdQ86wmzF7aqe2xLpnzjUvywIKjqSpvvdy
	F5DmA9cFSmj4wNvzcHEibAudN6G0J9CxNeE9Mq5hf
X-Gm-Gg: AYBFou1ND4U0X37JUuGUI6dzIF7IpAoL7XHUj6FWC76HASaXAs4s4wB5+Ky8NTFFq1z
	qYgvRxwytNGQ1mJY4HS9TCheFGDMehXidB2TvH4avjR8Ng1/3dm0l5ct7LTtrJOxb5tQDM75XJ8
	/HRMqIeZK1tzG35QAoipr1cA7RtcIq8I+Ge26KFUW+gLo0QSQmLLBaBu4d/8NHTFBb8aBfHQv3W
	3sKabKcenkhVt7CGQKgg3+cMvc9ylowTcIQluZFiqUuVeuuf4tQip4Ac5bG4txMIm6dZDMHKr0O
	2ZbNXAXmuJ33FPcugEt+W/mCu7ZmfsCuW0zeoERGxYGssBSnbELH6z5km270D5ly/wQyfVlZHS4
	oI75E/CxepOmFrhRuYAKX4U039KlIhtiNhqeC
X-Received: by 2002:a05:6402:115a:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b49c132c7dmr79948a12.15.1793209179030; Wed, 28 Oct 2026
 10:39:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-9-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-9-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 10:39:25 -0700
X-Gm-Features: AclHuK8ySYeolJHo7pCBJUUKUCrPrGo9dyPRJSPDpGLXiM1VD-QYMD7CcoN58h4
Message-ID: <CALMp9eQnWPd2TmC3WgR27VTpFPf1T-4-jhDn6opn940JpFOcYA@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] perf/x86: Plumb counter bitmap from x86_pmu to x86_pmu_cap
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:51=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> Intel PerfMon v5 introduced CPUID.0AH:ECX to support non-contiguous
> fixed counters and Architectural PerfMon Extension leaf (0x23) further
> supports non-contiguous general-purpose counters.
>
> num_counters_{gp,fixed} indicates the total number of GP or fixed
> counters, but cannot represent non-contiguous counters.
>
> Add cntr_mask and fixed_cntr_mask unions so that KVM can get the
> accurate counter availability directly from x86_pmu_cap. The u64
> alias is convenient for mask arithmetic, while the bitmap form works
> with for_each_set_bit() and friends.
>
> num_counters_{gp,fixed} in x86_pmu_capability will be removed once
> callers have been converted to the use of {,fixed_}cntr_mask.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
