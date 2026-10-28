Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793210478;
	b=gB4U8wa8B7B6SplfLqwsMfXABLIbiBASIJa9rzskVTBoiU2fJJU0RGlSWrOTb9xeY65W
	 j2tLTuZJ5Sd/Aj8djMnD+pjZHPueefNXQ+82C713KbwSMAK9v0/cw+/pyxwQq5TD3fMZy
	 aKTNdkr/hl2NyUMl/OmiGifTw8k/SnxzJQEC8hr9AXez93dagL26UkqNvAbQcYg0QU3My
	 vq3t/6BYPDeiJotbf6A8DyP/JkLUXxBOl0+pc08tcj2SQcmc5adfm8f15w19bJHyiNEss
	 0lokMOYLi7nO24klzWfS0kB684F3Bh+ASyKGAJbaHn+rNzEiMxg6CSBXK8tlCcA4XCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hYGrgEN624oSyPzumBDtLjqkMyYtHA8VinlvrqDbFmQ=;
	b=X+qgUEVRmpYUz3uCDWTrzL8fOdoisxsv2khwhcqIL+XU/bXLkSG7b2DE2oGTUUC2D7Hj
	 0a/zfnuaFONo+inucgGjnZvNr6goMfnQCjvaQWxjkAC09bu9Z464cW1tuc1ueqka0M3n0
	 SH0WG08RZ/EAJoXDQzLaRZmR7mo0nOKWWE6qJs22PBgMCno2Ji2fiNCJi2LlPKFR53aCo
	 BKxSKOOPWYRfWGRN/jTbLF6f0oiufhVMVkC7Nu3kENLRjwvgf/UvKDLHwqgApKbpHg3ni
	 1ra4rcDA/0bbw0DQmgVKIdRnZWoaVxe0Hk5Sv0DSK4EJqoCxv0VXI2mnByKjtjyFP4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QOBZRZvH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF2606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QOBZRZvH
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so984a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793210476; cv=none;
        d=google.com; s=arc-20260327;
        b=d5WEttKhbGq8G3gY+y+LwdYJqMqXV45GxeQfiwIGJA+wEZkvImcTdCVtIzeHDu8vKs
         m3z8j7s18aarPB/11lvRPK6oXD0gSfbTQ6B4DnVvXg/r9NdjRwn6clOkWo+/Um1HzUan
         fHsXhcr3WqSzPPeRCauk74HGlbDEtBY9uMdp4DyDr8nT0Ak2YbapFO+obOZg6wVLXRyx
         Q7QPLMomjLYOBH/D27hk4hIVp9BZC7jQEzojrnXJIUm8o76LIOhF8Cl1PZGlH2blxAya
         v0UE7gzjbabIGyON5t/qhFisuJ4FkS/8YElOqa/e6pQqvBCAVxYEGfD/wSjaeT8XauN1
         RAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hYGrgEN624oSyPzumBDtLjqkMyYtHA8VinlvrqDbFmQ=;
        fh=JzSXDIOW/CRZxECndaOPyx920sfBZvVfKByoZb/e2Z8=;
        b=R9FXuvfYi6le1GSdVRH8msOsmwlkp69OuT7QhaWZVq34vjxWHTxyRWNaGyn5gdpEfH
         ioDz4wFrV/O/x2SHIZOcD31vz1T6z6StB8MF5myfY7hU/yh+ErCvfh1zn1rUBQ/2akIU
         qiAAcSi8m8LQCmuaAWf3SUEbOqU0ic8MPkEavwI/fT9E8b+rWv5uSOaAgUjF0XbCZUh5
         9g95KEgAOdNITP3yYTj4S1s11v3xu9GXS9eRf0QMn7D6NFL2V0tC26M48eA6r7Lkuxaw
         R3xUX8PNsnS5togredpVzRjH5YvMoDwIOVlTXA439EUvFqprY2MpVaN+T2roaA63wQzZ
         sWPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793210476; x=1793815276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYGrgEN624oSyPzumBDtLjqkMyYtHA8VinlvrqDbFmQ=;
        b=QOBZRZvHIL09k9AL1uGushPvB9GQjg3DbSvjM6/Vn+qFJJVUiU5cbMqBWONhkV0CY8
         4eQpWDWCL8gMEMJcO4agzbotHKIpn4b4IDL8dewMenq/+MN2VLPxRHogIlMeK274XKHI
         mn0PIofziFPal5nOoXjrpSRU8f4haiD0lBSwMHPTbG3PBWON+C0gqTMyPP6WpRF6ygUq
         qyMP40M8XVjKQStAZI0dNE60Ar4RXRf5wfkZ04rRDh17xVE4hIzEoG6Hyd+yxXk27sWS
         qc0jClofoM5atPwFYwQmKFDqoB+i8aLeqwSaMy6FHOdvTNMOkePcI7rwBCEyta8jWAjt
         B25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210476; x=1793815276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYGrgEN624oSyPzumBDtLjqkMyYtHA8VinlvrqDbFmQ=;
        b=i0SOlhzGjDPHd9TOEtj50jRj14q7LhgGLGmZx85gQoD1Zn6l9QVvBBMUdT7vruc0We
         06TUXrOm8zyw1boC+y73w7komy29meBw3YV79KN7SCpbMWoiEEYcXEd3P21saBs0zdGC
         nqKA5JU2O4Cty0Ty5Nc1RW4jtm9Ov8uG9nD4MPZVJ6CZxMC8lR0RdnekM569u8LqyK/8
         uVYZc/rv4LdgoLhFkGTu7xDAavNgYj8PkK1zgawZcD5YtIyPd6Z/AOvH+ouDaRjJbolv
         9DgaJ6Stuty5qZGJS5u3LKgyyKSrYLfE+JqiUx8BDkvGbQDxU/uslGhAFrbl6GK96jxW
         TI1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxscpVmzVOm23ekt9fELJmSHQYGPYdI8cScDaDCn0HwygXYsGRFl8RgW864y+FL7J7Q/XY5gfp4/mCXZLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvX5cEH039cXMxhtX1ROnIrC9FBTZAEg1vMZQxjjPB0JYwh/W2
	Jcj3Qw+x1Z70D6+VdOcFkPIvRfNAONlwl0Go70KADuJMhRAhwASX6j864/8WLE1Pv1KE0xJBs5U
	d+NlXGSaYVsDQK9bu4sebQhKq9+pZWj/rP3zOI+NB
X-Gm-Gg: AYBFou2Jq1lBrSgpoJi+GKRyxTHUmJsVPmA24G6ev2nQOGBFhOUnAZbOrscN5Eem24z
	jLnWLrTf+9Kzx3GaqHn27aojIPIz+nhttRTQWqj1x4adhn7CZ3maqT9HJ0B4m+0a/mcAAcixj87
	Nfn0PUjWdx/8JDZHixQbm5oCdDHa3i0tPQ1HG9sFD6K3hWPgQOyC6IOjUJaXWzsKMUcvHi1zuQ6
	iUW3WUpMJ/Fmbuzt/z7/QuAF/vloDXGwTn4b2cvTrBWw7tz8FzPnR/BwPomqYKToU/9KVzv+a3o
	XDoUWYQFwWLneya47sm1ys24tVXsNSxC3U4bEO2GQvUHH/PZgZ+JE0751+KQSRwYu8x2d6KzXvt
	aK/ULkvjz9bW5YDtv6iOHMLBy9MIfr2ca2sTw
X-Received: by 2002:a05:6402:460e:20b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b4b10df53amr9804a12.4.1793210476079; Wed, 28 Oct 2026 11:01:16
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-11-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-11-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 11:01:04 -0700
X-Gm-Features: AclHuK8yaY1Mr7Qag_ob8fNtdQv4hPRYzNkPHcADJjQZTbhiVJB96EDx-qQxwrA
Message-ID: <CALMp9eTyYFVmvqt6BRTSt4rc0XS8Oy4xGbagQjN_Maoiayd7Yw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] perf/x86: Remove num_counters_{gp,fixed} from x86_pmu_capability
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
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> Now that KVM has switched to bitmap-based PMU capabilities,
> num_counters_{gp,fixed} can be removed from x86_pmu_capability.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
