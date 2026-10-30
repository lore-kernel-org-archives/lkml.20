Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351710;
	b=yvEqwRf3jEfV2bAT9sk3cqOLDjGvqWktl9RL5ijEWe6Kh+hp8gkZzksXZR2UbCRDdu7V
	 /qOQCzWFn49BtGjELqs1IZZwDGXd6sHYz8rT5486MTAYSjxIf0g8SUadqEfkzAwPgsIOz
	 V2fPHRxt2p4X7v/noRK6FCSDAARqMz3R28b9jvv58KqVcr0fxyhOPFzaK/5dTqQKILQQz
	 0kWIrSkYjxY8gLnSyzTisi5EzAKTSQgmrTdu4y3ZSRgebuToFg0RSURqLPom0V+BfaMCb
	 f7NUbBD30M6Ae3npnmRt8npG7l7MfPq7z61cjIpK95rdPTtnECr0qy8ZYb4fH8wSb2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=19OoVAzMw0AgVIO1bk9fIbdG8XAGpIkzVZjZ1XRF4Zs=;
	b=owHDZa2btgKqIiwdDc8B5wDgGndIREgSEYA5oWZWv2IMn0LoDApmqVrt04zEl4vDonWH
	 otU3cCqY+7pvOuiHdTj7gW6EMSobhemQYEgSPMr8O7vMTGCV4ogBvUGJTFucNikjbsZ63
	 NU1f2fN/onmobzv2Nj9YQPw/2z4IzYbfiGzTmZ9K08ooGPqY+eij61gBQtcoaZ/+lXeya
	 NT+LNxxPbDTwC2I6ZEBCQPpQ+OBwUAHHK4ERDYDnjATTltd9RlzoVQ13dkBK9B49naAdL
	 vVkFsHJ+bkgFWvZn6h3pgFS0mnbrVC0X3X/MCO2BlEQ9iM6U9CPmPjk5mHsG5eQUZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ta9GbNcx;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C309606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C309606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ta9GbNcx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso4198825e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793351708; x=1793956508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19OoVAzMw0AgVIO1bk9fIbdG8XAGpIkzVZjZ1XRF4Zs=;
        b=Ta9GbNcx5EFZKyrMDesXpSfPPthd7lvTShebqNnK2GzdLOEnoB9UlSWIUBhGUbEjBC
         RqnUt4GnNmq71/r7AS0+UASXJ1kv3snxFu6QfhSdCmqZrfuwoDHCdFb6zGSyI2kpmfON
         +IRF9Ls2hqqXnE/3+R02ROjwuiN2Kq3q+0bCVkblTn/zIL6hTn6fMCYKUvoFm9kjL8cL
         sZiLwOHfY2XfwtBKCazbD4etwSpGCGe8de+S4gG6taAzX7oFRPa8tqhF0ou/GjsRPza+
         FE5Vz0xgxWdipcs1+/afD6rkNwXGYa0SIldvLNVwWaTuslOnn1wyicPHODj9DFKOhFSO
         BK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351708; x=1793956508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19OoVAzMw0AgVIO1bk9fIbdG8XAGpIkzVZjZ1XRF4Zs=;
        b=MXfyAJNvGbXao1b6C8lVPwpVFc0YhypShX4WzsZxasUwWubiiEoED8LULogdkwNq+R
         tjd9qKOr8i0ZJOBYe7dIG1RBAvMyPXAt7l4ePnDR/epVYMizc15j+AL8pjOshz29YNDo
         UsXuBgX0kQxE5u0IA2UIs2QxxAzmRCRQayAwTswpy2agYoaaRjtqp9yywhEGzFsdFNbp
         OFBQPeMnAov9+/y111V2YeHKNVKhfKtm1qaX/2Lw+gro1/s3ZQ0a1Jto0Uyg4MF7D3zF
         MFYAfsSPgtsQsaZhXJpHFEvuGwVPF+IS9mR/Wul2Sj+FmihumJaeA00l+3zmzlJAN3mK
         /B5A==
X-Forwarded-Encrypted: i=1; AKwUvBy4xocJIHRdRq5nQpE9wQ7ZF3T0l7J0RR43Ujg77RTVaKvJ1pLSdXxtxJ8TaPeArqQ/Ise7jKjDFomXRtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItpCHUxUvbLTr6BowF8/4Uav8e4PCBXW2Tqgg3+SfilDtzULzQ
	nCzzWnJ3x/0p1d89It98qQfqIc9gRKlnE0sfnXxAq+Via1+9BGWIoxVyJo6R0NTFcRjTHLLbNYE
	hzQliHtI=
X-Gm-Gg: AYBFou3l/VrcCHlFnObCzEYNpQ0evPmWonFT+uD4o0kh/PCC9X6eMab0ylvA5p9bHy+
	eiPoY0hpJbzxPodYMjp/ehyfuh2rSziQlNqbzgbW/5/wvFbmu4CTQf6Hu5L66ELNEH6nF42Zsh7
	9z7nLmgWNngWy5RF7rnp7oVeszAQJvu3YLlRl6z9rcE4myU/5Hx1IBe/P8YEsOELMGTySTXnsdB
	r14ydz7eHxaInNrXcmzQhlg+n0Ph/eVsxnOiAus1I0KZFFFO6e7/Ob8MlVY9EsWbYbVaUpEvBX/
	T40UVHZGicilosT45cg2DKqWfIlYjbbAC/FemFnmhcg1g1q/JZzsp38YsSxXLum/mpAgC+z+VsU
	YVbeMn3h8+QqeKUmzVwhwUsyp/RkjnXFI3Cn7M1yzoP1HbCEhEPLFYVhQBjbcIHWjsRxKWWmlL/
	ILJK7G4ZESOwGGym2LoXn3BLHdWOoS6AjMcpJOdScB+egy65KdQffXoDhby4Ldy2o+Atl+y1Y24
	qbb6UfXE/UfGlFBiK/ISdp0CvpkAWkee5oIXT9BdKsd1iFZiwF7SS1wWxW4fSYwGpbEwh5IjId6
	rrbG/mycawiQzLcz2zRzN/JOgKZNY+o=
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4ac17ffaf95mr34072735e9.18.1793351707675;
        Fri, 30 Oct 2026 02:15:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm48931045e9.1.2026.10.30.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:07 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:15:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: jpoimboe@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	jikos@kernel.org, live-patching@vger.kernel.org, shuah@kernel.org,
	song@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <auRgGK3aQyv7tF9J@pathway.suse.cz>
References: <att7GJXA7hK7Ic64@pathway.suse.cz>
 <20261028164649.337479-1-x90613@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028164649.337479-1-x90613@gmail.com>

On Thu 2026-10-29 00:46:49, Harry Hsu wrote:
> On Fri 2026-10-23, Petr Mladek wrote:
> > I wonder how to move forward with this patchset. There seems to be
> > three unresolved problems:
> >
> >   1. How to handle aliased functions when replacing two livepatches
> >      with aliased symbols, aka two NOPs on the same stack [1].
> >
> >      My take: I would fix this later on top of scoped atomic replace.
> >               The aliased symbols should conflict.
> >   2. Fix the low-level __write_relocate_add() to clean its own
> >      mess on failure.
> >
> >      My take: I would fix this a follow up patch.
> >
> >   3. Better describe the purpose of klp_write_object_relocs_limited().
> >      Or clean its own mess a better way (code duplication)?
> >
> >      My take:  This requires v5.
> 
> For 1, I have a proposal to create only one NOP in the first place,
> as in your solution 1 from the earlier mail.
> 
> 
> Recap: The problem
> -----------
> 
> Take two livepatches that are already loaded:
>   A patches __do_sys_fork
>   B patches __x64_sys_fork        (same address as __do_sys_fork)
> 
> and an atomic replace livepatch C that patches neither of them.
> klp_add_nops() finds the functions by name and sympos only, so C
> inherits two NOPs. Both resolve to the same address and end up on
> the same ops->func_stack: [A, B, nop1, nop2]. When the transition
> is reverted, the stack goes from nop2 to nop1 instead of back to B.
> 
> 
> Proposal
> --------
> 
> klp_add_nops() runs from klp_init_patch() before klp_init_object(),
> so the new NOPs have no address yet. But func->old_func of the old
> livepatches is already resolved when their object is loaded.

Hmm, this is not good. It would be better to have an universal
solution which would work even when the livepatched object (module)
gets loaded later.

A solution might be to detect this in klp_init_object_loaded()
and free the duplicated NOP there. I am not 100% sure that this
would work but it might be worth investigating.

Best Regards,
Petr
