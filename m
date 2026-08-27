Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7EB374E67
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837502; cv=none; b=t0UtidO2D6qinGLS+P9jhLctviwLODmbp8Kay0OU5KNrs5r74p3lhyKX/n/bbZ76tC3BOzMEfLglOGLl5xBGCbywaHhkE2xFnD9jW0xMCU3416MbOOdhBVl+1OyxORu2K/htvHHw/GZ7+d80vDElJEV4Ib3hucV9K9e00SRsk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837502; c=relaxed/simple;
	bh=yELTqc/whu2ZyTt7q6V++mR1Ah4OLnSfIhMnB0UGToA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QjY/HuHUEx80RRjzIjDEYPdoBMdEdtzDUIGoTsRw6zmmSvfR24MAmoJGR6Hy8I05jwT68+IaT16oUUN6XuGRvPVD8eoq2nIWqN0IA4+QBM9YdRpA7zBv8LRfnfvqRd527bl0AcnSydbpmfjwVBO58o7SNw0Ppu8Mrop64iFZlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1pSwJdW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1pSwJdW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so11453215e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787837494; x=1788442294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qyby5UZjcCx+5Tgc+qhWvfDr6EF4z+GwQseV7CdajZc=;
        b=A1pSwJdWjSSCQu51RIppX199PSaRYiZg/+X0J+gU0jR919ZfvdNaeQwf8Jf7Fxg+Pi
         PV09TY6XHkfkh6HRF6ZKavY2LOvrU+xEzATenJxIkFzMnH2VTbewGEvjxDB93FoByQat
         OOOsDEfnRHv6l2hDUEnyIRK+Y9GRud0PTc53DG1thHH4argPwS3NkfDw5GZ7+EiBYoRz
         mJ7M8hBrFmbB6O8SAHd46qyvYiPA9S9sQIHVMwrkSa522ZVcA12BXo5aucRvSFoinZTB
         kFlCnYwMWwv8fDyGwCqAAvaO7eQu2y2o/rkj54o9O8t9gpvbrdBzCv6r1tGCHET5nPri
         6UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787837494; x=1788442294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qyby5UZjcCx+5Tgc+qhWvfDr6EF4z+GwQseV7CdajZc=;
        b=osXL1boiOsUxT/6OQgNiRd3+nVhx1jp2BDwH4xv41b7ILJaLZgJ7bMXnPwsJzuoDP1
         TS/DxXNvAwgrZwRgaICvjzO5HMo6gaffX+cIpHU+hAr1IwyJHqzJF22V3/Gzq8LEg7bY
         G0yVd5wI9Pv8nu1WXcsphHKt3AQXd+ZRmH91029jVnI5Eb8a2Vt2jCun9D2ZUWV8eyAo
         n0OiHvkPZHGiJsgizxxF/4K1KHbsXBxZEFGQfkzWKDHltGxnsB7PW6ZA25GB/P9wx3My
         JhttDk6J1IylODU3c2nDybo3uexQOXLgjUO2Bef//69RgQmNwCCLjSw6aUsUVTXAXrCr
         gOXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPKD16PpO/wv8/W0eYU9KJWn/O+OHzUM9QgLWzHJKi39isUW9EqVuOSVTYpVQDIic17mYGmN88lXrOJx0=@vger.kernel.org
X-Gm-Message-State: AFuF++l00+DwuhtE80KHP+zrQpBIFow8gaKnjueGkmZmb5dN4pjMqXIU
	hZYm6iIrwbLhUJQ8+KOwwqFamkoRTGuQqoTC/mEIt+6ZZK28QCFrnJpL
X-Gm-Gg: AR+sD113t0ApQh7k3mmsoCVyAVBupPt9/T81r/4kUaqSe8gfOBMenxgAiM2FzPBcRsN
	VN6Rlzgos/u2w7Xpk3P5IAtoy+TFVM4aUH3BY9/eULWx0ryT2h386MeIFznCAQdSOWWjp8JulA9
	RPzx6tRFlEY/3SSEhMAm0yLyIMGMEaIwgm2kV1wDQF8OiOAyzr5lChPoYt/8Jz1FilOJ6YiddmL
	Coj8LbEtIk1yR2gSb/in4+Xh6Yz+zJxHfn2VnRXXUy3NNN+jvh+Yq1vczz/L1k0WvyiYgwxQPFi
	MLpuxgsiuOZkybLIq46WrgUNTRNOhZu2Lq/wpkoZQBrU9YxABGkqyl1pHl8mM2WOiSKxIQMMM0A
	rF1YjcmO6J70mH64w5Y5+llef+D65vNelQLLN4vwkBjH9XVxfyEOpExQfO2JZEczpRm2TR1FavV
	ykbI1PgMCD2aRg7hWlppolz/8U1h2o4Lj6qebXnpeN+osaUzTWHrzMvaZohEJCcpnqXT0b3xXVS
	DuRW6oGDPPSxcvn
X-Received: by 2002:a05:600c:34c3:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499dc82e965mr179956955e9.15.1787837493359;
        Thu, 27 Aug 2026 06:31:33 -0700 (PDT)
Received: from [10.45.29.112] ([15.248.2.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b8eb6ef7bsm28292645e9.5.2026.08.27.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:31:33 -0700 (PDT)
Message-ID: <41e1eee3-2cbd-46e9-9bce-5246244c5d12@gmail.com>
Date: Thu, 27 Aug 2026 14:31:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jthoughton@google.com
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 kernel-patches@amazon.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mamarang@amazon.com, mancio@amazon.co.uk,
 mingo@redhat.com, pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 x86@kernel.org, zoumboul@amazon.com
References: <CADrL8HU2uoOVsOoxY9Sm2edV5-aXzP8QLL2LPShOF6bASpkfmg@mail.gmail.com>
Subject: Re: [RFC] KVM: x86/mmu: Prefetch forward run of pages on TDP page
 faults
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <CADrL8HU2uoOVsOoxY9Sm2edV5-aXzP8QLL2LPShOF6bASpkfmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Aug 25, 2026, James Houghton wrote:
> Firecracker might be using async PF; using KVM Userfault basically
> disables async PF.

I've been working on exactly this series [1] on top of your KVM
Userfault series that turns userfault exits into async PFs, with
userspace signalling completion either via ioctl or this idea of an
exitless variant which skips the KVM_RUN round-trip per fault which has
some exciting numbers!

It's running in our CI at the moment, and hoping to publish this as an
RFC soon :)

[1]: 
https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding/resources/hiding_ci/kernels/6.18-secret-hiding/linux_patches/60-async-pf

-- 
Thanks,
Jack
