Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196373;
	b=FhenWT4HfTbTNToFtoPgYHSZ9kzHsRcvlPiqNrVNB0v3eJxg2EEk+zSUNTLy3JGXglt1
	 0/cDgwck/KhKWspjKESXIsqaf+3EYAP8QJz45/msh+/et/Ldx3l7P70jKMsZhDFvBZGhJ
	 yNH5K7Od/ysCEyDcO3RmXCmMWSMq28csxolLinIzrW2BK2yWKonUDVfjhJZh/71T8miCJ
	 mWH7iotjfm8C70Wmu045ny7fBG5ioKARPMhPvjiy85VMuVXI04i1cj3ccqA5KQq3gxvHe
	 BBIDFmIrGEHHGeeLSdlMmtk9rqGt/XsSH6pW4gQWAMm7rZOfN+F9m5r4ryUi0J866KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XhVUa5jPeCuPjlkTbV5ixpr3E0TOAw03LN9aAir2Bn4=;
	b=gfrjWoTorWLPxDlqCDRZ23+kw3J0DvZuwmNmnjiLNd6ZTG5jKKzO4AE6FGzlCAodTAZX
	 lS/bq9cL3R3O3BVbii0k4KCG5cbY/uryXK+uDMAUHLQV5ogiybp1e2/kkoO89JD0/XrIB
	 UEFQhMDz0FeF2K89sLAGOV/ax8NtfX9waL5gRe9F+ry6QU5tHR4P8t5FkEnBQwkVEIPzk
	 5DcWJLOYIM8nuL+CTF7OC2PWl3Xl6Io3k88CNCLQbt4vJfTAOyr/yALKopPgOz/oUXF0J
	 fAc8abO2HIAesbtc2C/fN1nTXiH5INkc1oan8aDw8epCtVEupC/dyS1KQ4Nc8+hrzsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eMN0rMVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB06D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB06D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eMN0rMVo
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so9535a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793196371; cv=none;
        d=google.com; s=arc-20260327;
        b=S2PqlRup+XjOAve6RMWBXTuS/L04v23se5+mlQQZWNhhNyHE7clrJjVDz9nU/b0/zg
         UqxoENdpHjrj+YCuzxXRk5Go/9pa8MZHJ4SnyXWKP3LROG9OTPkXdzCYr5pl9iKUEfqw
         hacnGlsw5T6x+Lne/0IKSoFtBJHIONtDsotOVKATfpZ5XkJYV0dLrtW8schTGQ7TWVCA
         C4rREfy/1d8UaxWprZT5TFoOpGl388FpYYrrPRiG+p7tsX9wsBVux12h1GgEBtjlEUlQ
         7f+nGvcy/PAnuFcyG+oWVbwdjtAUhdbEiTgR+eAKlYCbMUTP/PjnGglbrFPaWo//IQAP
         5d6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhVUa5jPeCuPjlkTbV5ixpr3E0TOAw03LN9aAir2Bn4=;
        fh=GIudKUQ9qsFF5gJSlyb5lfs070oDWtkdjE5GHgEOQ+Y=;
        b=ffRYc7J5cDgdPSOFEMM/gPxjWTstcBt3BO0/iB/wJaxkyKBO6Leig+3oPEkcYFwIGt
         VNq4KIFpF9r2HwB5OYIKcULnGXTyTfVckIv1pjIm/Z0h/yBc1Hneav/WJKpmRbSDfspR
         sBF1UI5ZVFggZz1qoAiLzQgiYgN0xn01v9x11ucYnKsvMfk3neUlDqN1hWCrLlzxMrlI
         XWbAWP12TsK4O8yzt5r9k2o7c0HQpVkM+lH+FKK8S/96PrXMvzKJ1nSFlqA9SwdJYR5m
         MxiOW7im3Nm7qajTYNLCz83kuusW0Fob2xCcLkOwVWjHZyjVaKAjUL+Otflu4fg6a3Gl
         /9jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793196371; x=1793801171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhVUa5jPeCuPjlkTbV5ixpr3E0TOAw03LN9aAir2Bn4=;
        b=eMN0rMVomcbHDoi1Fi3sNeSNuwHWSCwTftWgAefVogJ6CuyaupZy5b9Bt3gyV74OdD
         M4xMJRLRiK+vf8zD4/9nnq4JpLANGh2NMN1TALhUTNuTYXi40fNcmhWDSPpraAmND5aG
         PBrHye0dqjRVR18VeJwzqYOxCZYAjMGhTtYG2sTqCFm9CeghId1SRblGFtCFiMJXZ4B5
         YvaI9nyNnSpjniiZB1ZLFuIvNuqhT5Pf2mKRzSS9QVSYIYsizq7VgsZdL2yc7QCQf87G
         N3HH++mL70ujXo53FA8dbCvjdLV/nV0TZ3JuB3H+e077Tq7apyS2kC/dPgoE9UWylj4c
         h2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196371; x=1793801171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhVUa5jPeCuPjlkTbV5ixpr3E0TOAw03LN9aAir2Bn4=;
        b=xB5ng9rOJF7sS2vNIpv9yMR+1pxlV8PZKZyNpSkJ+6yIkQU52I2jm7BrWD/KmpTTTA
         Awg4F4rnzGTBOzzs7XretrvkkASCTq27h40ECJmOpD8FHVPZoM/oV/sXuJdRD3mnOzR6
         /FbObP3fAeNC/Jrwvqa3NbT5VekXhZ656hEC8NMLm/JNAPzJuAbsli0IH7hvjGaaaNJ8
         CR+pisxLLjIGAyvWhak0ys/KqVHNw3IG4dzdrvNltSLaTT/DSr5iT0R67Sk8o1h6WzLC
         SbrW6z4uI2fCwc6ggltlcE6nRkzi/5IJeDH/IrrjddoZv+e4kG2EaJl2LmOTuAsHsyWP
         6VvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoGjq9oUVbFj4MG8qJ7fijQmxJtrz/JzYVPSRpPEAH33ypiUWDvsjcHwhY2MLAvH3Hsups9BpiJ/uiQm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnF2NY5gzQJ0JI5W9YxYxM/ml0WEmMqJ0iw9lDWEpuoNMQQXxl
	e6fZ3940YWLATbQBV2DWy4Y3TxQEK1VILX16wwAK7MWvAfzS9IZb5KvXmJEaV56Ad8tnI/kZDk8
	kBOcBLD49QhRrk20ZYWAiM+FXJX6T7MvmdgRX5m4YZVkW1HoxknlS13mf
X-Gm-Gg: AYBFou2o3LWSAMwJ+7ZBrfNncilOgO4y4/3K/ttrSVBv0JMgEaME4Y674ZAeFWn44do
	2BnlnuceD0uB5aLQgmw+Ln1jt7QNef/E6XulxniFDFO+Da208KcyYAKwlP9YUUkQBRiHunWVKv0
	VHy9SibzBE9+Da+qJmErB1dOrubt+MgSAv2tOEsHbLwf5eGrCE8YNBHyJ1dp+letslq89v8dCM3
	p6mgHPIvwToxi98olfg7O7LbfachwgxpFHZ8Pb0XGoemqVMU6R+Cs0RXHJcCp7IQDhmDziqxSVE
	gDv8Pr9GekQAhJ06iM1rBHjlpbahAByh+A6p1Grw33gPTMkxPuCKQrZ0XTayHlXek8LRA5Fje+P
	wuJw3BXLVBqJr3H+7AS+aDigjS97BJni1RWCs
X-Received: by 2002:aa7:d516:0:b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b49b872a5fmr76004a12.8.1793196370614; Wed, 28 Oct 2026
 07:06:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-4-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-4-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:05:58 -0700
X-Gm-Features: AclHuK_aEVnfXNRRUg-lFYwMwKWRYKASiTuGPMHFAH2Vod9MbJchX0sY8wu9o0k
Message-ID: <CALMp9eT_iXLG0csWyiMHPKzEuu=a8=aXNOiu_uSbzVcykrDp3A@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] KVM: x86/pmu: Rename reserved_bits to
 eventsel_rsvd in kvm_pmu
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
> This field stores the bits that are reserved in guest IA32_PERFEVTSELx
> MSRs. Rename it to eventsel_rsvd to better reflect its purpose and to
> align with other field names in struct kvm_pmu.
>
> Opportunistically, replace the magic number 0xffffffff00200000ull with
> macros.
>
> No functional change intended.
>
> Suggested-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
