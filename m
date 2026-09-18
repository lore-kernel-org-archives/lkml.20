Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E34E2F0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729981; cv=pass; b=HSr+SRgz8p8HxmZG3RCJsegSM2uqucKtJhMJVPp0I7DKeELmxsqoJ/k7+Bowga/LBWiWiQaCuiKU3oQRVCe01/2rsSyocshYT1/lr+bwfGBz8AL2jvlOkCYBUXZKPg+BgBV426dx1Sb4S10zki0oZH+twcNtCp8Ad69a8IMkAjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729981; c=relaxed/simple;
	bh=TXdiK+zXX3XOHC+zbrRgQmzWKL9JH67eZAMPC/L+Ipo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9uypefO2uaNbF/B203HWL6i3LyvB4LHO7D4HKRQIWO34vRYMWHJ6K902fuy73h7q75/gAXiFVpLGss2BoJp+2NXu18GS9l6PqEMMY6+FvVHDBqeU2YgIHXjlHz4aPemn/fbHI4+8/siEogk9cV0wd+b3Tkb0fZ9FJVldURQewQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hPH5DHwy; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hPH5DHwy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6455a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729977; cv=none;
        d=google.com; s=arc-20260327;
        b=rNUYsIbZ9/lmZ4nmsrUynh7to4BMfIj2VYaHQ07jcyCOwkpOvXlwYm38UvYmRnBnxt
         H2x0kFxOWMm+T/md33lKpbdLbK90g8reZSf/rgfxfhD6okKq9aaqbEtzUaD/03byH72L
         ESSOOu6W5bkIj70VOl52QAA9s6TQJuMszbRYZORciFS/9dsZGAiAwX5YPL/rk+ynL6OE
         dQbK7n2eX32L64FsqEfug1PfNmUg/1IdbXj/37wZrsWzSEKDVyGs3FZb1qEaRaUrmJEg
         lk1sJg3uc1/RwXctGZ9+TNq95Bvb8eGYaYReQ+JTS9JdYNX/RGeG/FdiGhKVeK94o03q
         z1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        fh=CIfjf5hA1UVa8rezQRSGR6eNsGyDFyyDC65Ye+xfKGE=;
        b=MuFMCTmD3q/f20SPlZxClpufwUR+9ggRZohfKN5lYfXQVbapmt13r+h0tfX68Z1sGQ
         xvcQsoj6lu/appQaAPu1mni9AGhjVGXBtlT+cMv9VgIKMhr+IUq3OAmV375VCIkcazub
         0J3R2z1L76z+pyiD1+6QGva9+SbhjpSghhQS2OyD+5lA50H4Z/5TMXXvsiDaSyW5OjnN
         ba1xFcLmq8DoQaBCmLcmya1tJlSmZ3JzVwxJRSaZ7NicFJcxc7TP6jNALwmB6/S66X+D
         IkBor/ZqHLLKC+q4ioVn3YB9B0ABLSzq2+bU1byz2jR148u9wyUVB39BAZQoYLTI64Mb
         PEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789729977; x=1790334777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        b=hPH5DHwyZcX6rRCO/qljV7CtstYS4wkd8hQQSPvSO8ahuIG83enstvM2pB2/DOHywV
         BplLMYOGxu0EwmhkJ3oLKjb9fNU1fVQL8We2Wfxqlp44BLJlLCvegAqUD3B8sQbwbgm3
         d4kIbyjjepbF4Sf8sIrcJoKYHnIN+XzT34rrs+4YhWOYgYE8LJFqS004gO/8PWxxL9DF
         Jjl7Ew0OK6f56KjAkx5jVqylN7lXMoNoYqjrDzIeiC0xdisynQ6NHA9yzyVLUFqOBVNq
         cJFzrTkYEG6JfLIxM8Qh7HJp6TUsqiLjBHAyJNZzMbDrX4H6tL4V4d384NzbVe7tS1SP
         0Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729977; x=1790334777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        b=CjSVTsCovJP7jxkJGaxhae2bI55Ou5TDOow9tfM/W9f/ewRYkxJoW/CrZt0zKvY7BG
         uzC/uRlWzr0wH5hR3hEGNyBmlTrtlclDS9TCJKrYuwoPmb1XRJKjUYZOq3x4lryLhgrq
         FUMEREAyO+tRS2zGCa6OIffl+lfokVl0cpaeP2rnvXT19bf9sqP5VAEr5JB5/MKhbKt3
         GO36wghBnqra3EzdSEsATOvT/t3NqItRgdw184c599+Dduqtxj2nLbh75CLLrwFJ9qQk
         n7YnG5Fhb7IOiKzntQasEbDV2NYU6Ljvd7FgDZzg/tg+Z4qlZhZwvSlBLwadwXcI3X3d
         0zQg==
X-Forwarded-Encrypted: i=1; AKwUvBwExt6+X82tfJT7JJJDejj9AFgJjb6mWhOBsT3R1IoYNHDtgu78xkzsFjZscP1HnZt1JnCXct5KpYbMQ5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kXjrkas2Ltn1tvPBQ+apqV5oFn2KZvsrCBfvTQkJ18kV9j/QNf
	IHaRCrYuqUQOpkurdwxMftq4XLI+hapRDckWZKnIgrTfAgzBAOKs1pe1SY4X58wVDVe5DLhXwL9
	wl3SSPrGYHQuh2/uDzp+K/arQ23KI2aHqDubG0SO7
X-Gm-Gg: AYBFou3WPtVmKxcXA59H2GcefpzEnpetCOVKoA4ZjSRjp9jQv2VQG7J4/Pa7rH4xcd/
	3vQL54zChq27SuCst7la2Q+wtmjViPP9PyEeWtawBBy348W7d2D8CzrG1L8SdunM9VJA2eYkYVf
	jX212HSca3f3eG00roSmiwC3glblqYnp6nT95TGHkuGxOorW14jh/fzYEyikUb1Fklos8QA6HuE
	C4S8WDqnEJyxZkmIqr2mn/OiLWvCBHKvDn/HWGknKVKNoVGaP7O+aWEZI7J/YNM01yFAhoawiHR
	DJjDZNBf8ce2DqZcPHqsHMlnc0aIj38JYRxa817j00M+aI0YvSNobgM=
X-Received: by 2002:a05:6402:c318:b0:6a7:ef71:28e0 with SMTP id
 4fb4d7f45d1cf-6aa4de2f154mr26742a12.0.1789729977107; Fri, 18 Sep 2026
 04:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <1fc24efcd29e379c3784f661512cd3ebd833e463.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <1fc24efcd29e379c3784f661512cd3ebd833e463.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:12:44 -0700
X-Gm-Features: AcwNN1XzGDkuAKwNUHrle00CDHO2BYgnV92QAH54Tlu9yL0UYsep9hP_4pNWdHM
Message-ID: <CALMp9eR9zkPvmaiox1N9hxrCpuUmMzxPzynJyP3op=jhLZiXxw@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] KVM: nSVM: Track valid hardware DecodeAssist bytes
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> VMCB02 instruction bytes are valid only for the hardware VM-Exit that
> populated them.  Track whether VMCB02 contains instruction bytes for the
> data #PF or #NPF currently being reflected to L1 so that stale bytes are
> not copied to VMCB12.
>
> Invalidate VMCB02's instruction-byte state when preparing VMCB02,
> normally in response to an emulated VMRUN.  Mark the bytes as valid only
> when the current VMCB02 exit is a data #PF or #NPF.  Opcode exits and
> instruction-fetch faults are excluded by inspecting the exit state.
>
> A subsequent change will use this state when propagating hardware
> DecodeAssist instruction bytes to VMCB12.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
