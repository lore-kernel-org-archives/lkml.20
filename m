Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999158;
	b=2mcynnONDhrMAYkpOMJdz7klBqb4qRPxRbGbrdbEJ9xgS9LaOeNEO2rgGt5H3vcb5i7o
	 QBMPBwGK+WIAYmqHubOT8qiw1vpiVBZjeXBvRKvRFXtiwWR5rpZj4vO7OqMJE66gSbOJn
	 5HiNe10C+CG9jcp56sonC4vs2RSdm6XDJ5PkE4wymc8oD3Jm7tT0fa8f4caBDG34mbtrN
	 zrhLn6Ehoo414cWh3tDmzwEjOok5EYdchItz89THnU6r9Jf0ZNItEMK1v5v1Akoeh28lb
	 2s5EWToRVr7aLvqU8iSQ/YiS1sNGBiJcUblrsieFcBTxwdctcOne8XBj6XypCnnntKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pgNA9ES5pzu/PrIv6QLbL97KrUMwvmUV8dNRJkoausc=;
	b=glcxgSdeV0aCncTyYcXqLcbDOhLK+RISbKscOeGeazbkkk/vOmiWW/WIqura2XGP9cS6
	 JGA8O+UVFdV5hDWY2GRM/dL09C8pVVSnaemw6QvHFE6ztkpkuEAQc9b+L8nKsiH2eeb6u
	 p/U1X0fBhm/IN8hesYrrAEsEfmqFEofr10uhnmBiveK7xP7DuAf4T42J15SUUHDhzt+yb
	 BN32hH/AlrECQj2aqAgrxzNP/licfjEwJsbwBDGfLFJNtEnULJLPZprg1ZlcTgGafoMQ1
	 j8k4biTuge3fz0naxIyfqmxFAmf7YVsONA6lGnm/L83n4NrjCSSGHhJbtT1+hwAo9Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=alOFJpGp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=alOFJpGp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso7934455e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792999157; x=1793603957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pgNA9ES5pzu/PrIv6QLbL97KrUMwvmUV8dNRJkoausc=;
        b=alOFJpGp702Sbo8JIYzXMb2YB4qbNbcYug8GhJLutW9Hv9lhotA1aeZeJJEKH14l4o
         cGffY/Jyqsn18hBjreCkAo5W/BqUp0lOQCKOdFMeiKgUjzz7fegp5kjUPrXzV9/B8Szx
         idWCCPrqhl7zQXE/oKXJ0Cyn+HHaYJhH9KMR1xturFWVqMogU/bs0hAhU5d47XGGDpk1
         dQCtUkOZBqVQ+22v4iZeezKYuZ7yBSad3S7RPYnem+zzq3BBTu2U0poKv4NsiOxWt8fi
         XWoH/OngyESsuan0Y3qkpl/A/TsbQ2QtfYVBBQHAhdu6GzLCo4kDO8RVmGBMsz/hBz8b
         iKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999157; x=1793603957;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pgNA9ES5pzu/PrIv6QLbL97KrUMwvmUV8dNRJkoausc=;
        b=zGk79MPhIm+yAj4i6JT5SKPW/nUPmtDPWGfZC9/9nFfymZRuW0k43HCa72qv0O3Wz0
         WjvafeL3DFjUmTwlX3nSvs+g54gVaIpX2JUF2CXIhfi4t8kPKFxOggiCgHWTmu44eTh+
         Mga3KtKVl1Ab5QDpyuwNRqn0JE30DDh8DrKgMrsMZjz0Mh04Y8r92+korRtAby/JHP2t
         E5zJKcUlLVREvbmZ8EnfNOUNQVmPBvXgo2pskm6uEmzCYjJu674+NYYFwvvyK1fWQuDg
         g6t7aaP8lW0OXKR0/kR+M4HLaVHzHtzsdQHHq2TjYN3XpEFFxelg8yzAUOWx2upLnz/W
         uaUg==
X-Forwarded-Encrypted: i=1; AKwUvBxqH1Koy/9geRoLnafpABvBokNE1XpsQ0rzV5AMGWgVe+lHZmV1RSLB/88Zg4sx9ksl6XHbopjxZrnzyL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3qus13OOmQHGzNOh/0AgpseSARa13ZKrv5agKTYKdy4w14VE7
	IsI7sYDpiKE/+d8CwFkH3/r3CDS+9vJrKe3mQKZNodh64UshlSY7J0M2wp71u2EdV7WkALtGhqx
	4bi2R+Tc=
X-Gm-Gg: AYBFou2/96Eg1V9RKtlGXQOb7WqVS9jIQSCwYlRfUOMO7GkIXETEs5/mm2EqipWh0Ti
	//VCkxu0tG9B0smtui4gNemgUOyS2iTB1xR55F2xCS7jK11ynVgpjekhKbfPOkOALK98HgyT3HU
	QHiA9YrDcc+1oUuuCXApvQKVYE67EuqADW6l8syHW2TkAz9dvSKN6tUsz26pSvyq0nl/N1leMT5
	Hcufqf9fv6cnwmRd4uXfuCdA7C8w6TsfTjsxwjBkjgR9FXRKvKZofcAPRVnjHg52LnzuPPM6Rsa
	VqQD9f9qWuAnLLDHvZZZ+I0DJYbpME2K3s0JF7bx0dLgni6J6br9C0gYcWJpKPVQ3t2zkUxFKuk
	vZmXmVfAkXbEzXAEI73b5yifZB2cCDfvaOdLPQeQg0GErl/mdHV/iN5lW3EBevnp7UEPdVTg/pF
	HSqmMUW2sDaFHePSl0uF33RZCDMxAC73x36Ia+zYf9pa0sgchjEnPHkGons0qQYITA9Vt7IpOV5
	jy5UlAkBLCwU2VQSIfUk8EKkGi0HnLYL8+/qG5rqJ/hpNPcLjwBl3Re5tlm3FcmgKAVwt9G4Vvo
	jD80
X-Received: by 2002:a05:600c:4704:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4a35acb115cmr112800535e9.20.1792999156749;
        Mon, 26 Oct 2026 00:19:16 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm12607073f8f.13.2026.10.26.00.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:19:16 -0700 (PDT)
Message-ID: <dcf5b271-516e-4fbe-9917-511a517899a7@suse.com>
Date: Mon, 26 Oct 2026 09:19:15 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] KVM: TDX: Add CORE_CAPABILITIES to the allowlist
To: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, dave.hansen@linux.intel.com,
 andrew.cooper3@citrix.com, kas@kernel.org, rick.p.edgecombe@intel.com,
 xiaoyao.li@intel.com, chao.gao@intel.com, tony.lindgren@linux.intel.com,
 kishen.maloor@intel.com, dedekind1@gmail.com, adrian.hunter@intel.com
References: <20261016091422.3182216-1-binbin.wu@linux.intel.com>
 <20261016091422.3182216-4-binbin.wu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261016091422.3182216-4-binbin.wu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.10.26 г. 12:14 ч., Binbin Wu wrote:
> Add CORE_CAPABILITIES (CPUID.0x7.0.EDX[30]) to KVM's allowlist of TDX
> directly configurable CPUID feature bits to accommodate the legacy TDX
> module definition of the bit, even though KVM doesn't support
> MSR_IA32_CORE_CAPS for TDs.
> 
> Older TDX module specs define CORE_CAPABILITIES as fixed-1, so userspace
> may expect the bit to be set for TDs.  The bit is redefined as directly
> configurable due to #VE reduction.  Leaving it out of the allowlist would
> prevent userspace from setting it once KVM starts validating the CPUID
> input to KVM_TDX_INIT_VM, which would be an unexpected behavior change for
> such userspace.
> 
> Reporting CORE_CAPABILITIES as directly configurable also lets userspace
> detect that the bit is no longer fixed-1, and thus update its stale
> knowledge.
> 
> Keep MSR_IA32_CORE_CAPS unsupported for TDs, as no existing TDX user needs
> guest access to the MSR.
> 
> Note, CORE_CAPABILITIES is the only bit that is both unsupported by KVM
> *and* redefined from fixed-1 to directly configurable due to #VE
> reduction, and no further #VE reductions are expected.
> 
> Signed-off-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
