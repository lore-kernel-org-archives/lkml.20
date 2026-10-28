Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191795;
	b=ZjYwd/RY/rIlW6VZjAzUwQgX67Ah/StwG8Vv6qywzvUppEFeoOlcW3IDb/wSdPe2+sbE
	 fyIi2vP6j/BY91aMjZIXnv/o/6Af5Ypds67owjEclctjU/85T0EFWc/W0g1swIlyNTGxK
	 v48AehiEvicaiGcOQM3Y+JH8bvgfWg4Po7z925qyQjm+RIj4yEE9YtXXiAJHw32/DNMz1
	 Yh/ENxGmCqBtKWF+aC+W+L+hptQ2gWacMHpHm7MQDJKn/i3KRYuEVEjsLM74rI9TrzqW0
	 hfzx4E3nfI8g9D7Ck5NB0Q/QbOartjlxLwClJ3pKy+8wWFftMu0Gjr/aH2gaWikr7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZfYYIFc96021z2Ptr5l4lRWqOsC/xE10NBYAqp4BDUA=;
	b=nYgiJrxRB/kAGqqyoCRG/ZAjz4gbMbbA5zfvcc8mGWJHPkR4/UiKqL90Ss1RokQ3ALJE
	 t4MxL2gXfdm2pceLR0FlKjVvgcuYbHBc1lEdTIPxsR0VQqi/L+fZS7kHPdzmUDwUBjm+7
	 sDoB5QRNHu5NnuUOsIqftiUZfla0kGOOyIMAO0dk5r/76gpaeZVcQo8RaskjtqLU51AHs
	 x/yVATqvIYSj1+Gj6AUd38ZhtQe/donAvgQWGtP2xdYB7Wfak0Opr6GYIidD1XnpS/rIL
	 F4hxSbAz4iiNg+0QliJ6MrCDOQcMZD+mT4UKvzICWB/nOtHUnKvHfwMJTPYfz9H2VCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O2aaWT1Q;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F8D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O2aaWT1Q
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso672847f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793191793; x=1793796593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZfYYIFc96021z2Ptr5l4lRWqOsC/xE10NBYAqp4BDUA=;
        b=O2aaWT1QUG5iHDpwaXyhMod5A3B/CFUFOO5o9xVnVv9+hVyLHlYVUnhjiTBDnvP0bw
         j97TZ+f9XcH2gXfC27ofhf3is0GhaAZ4F2R4EYVvVRwW/1g+HRE42j4t2aUl6tB0RuWM
         eGBGqh857T6SB3Vv01NI9V2T8ARx2MxyadEiHyDbv7IP/9/wvBt9bZ9EVoZ8/MhxRwqo
         FL51cHN41T8oSUloJITZx1Esez3ywHlY7XUe4ySd2ad8pkkRj7ewfe8bh4tEI+nibzRu
         OvgBGi0Rkq/ng1f2kZuM+G3CShg/OD6tdEsxsh0Rzhjk8j33TknS846UEv3L4jP4p0sp
         +mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191793; x=1793796593;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZfYYIFc96021z2Ptr5l4lRWqOsC/xE10NBYAqp4BDUA=;
        b=KGlL9rtBJVz/+D+jeLqxbkUtDMPsrALmUl9NR+yt03M/Ze+diUnQF+nblPS8h6WMHO
         Kz0YI1vNZTu1a/H6ZMIMpv2lRu2T6i13/8hSWXGiPZ0gTkMLZsVKwnCXcRqxSUJknTVt
         DJMFnyqNpD07PG79jjYj6EkR2u1sgm1LcMTxVNnSvEBc7heL0gWnht4tEJYfaDGpq8K1
         H87H5KCEOSxOSe0FSMJSAxWZg3A66VLSm2FMsqZtReRzByWGVQAxFRGf1NqdbA7QveSn
         IOjRkXAt0C3X7SdB1JPNbym2EI7FEyEbSwnQCGPq1pVXsYm6Ebp46Kr6yfxH8NuIEc5s
         bFVA==
X-Forwarded-Encrypted: i=1; AKwUvByEw/P5Z5DycjSIw+fVK2GPzB/fbG4dIKo2FC+MbGFXzYAuokSV1z0FAkCLrcEbz/A8RU15YjcEpDDGCYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP4KGpjU+8MHgPQn/71alTpgRi8m9sBsPB1IXwZdHVZHpsFTLe
	e7ubI9erlrx/VuOwgAv9b+7GxocyfFPZwJD0nmYdzjmvUZCmfY5v1ca+MuB+gTQhsNA=
X-Gm-Gg: AYBFou1PRMqk7ZQhaKS2EZBz6GihiSUJaUkz94lbBPDonne82eSX4Tq1/As8KaOYyv0
	yJE5EFEFuAYQxnkP3rLwZ1zo3kORO+utupNz7KRRiAYgN62Wek877v8+l4AqKvn0JCZR5Hcz2Pq
	j0679gRuY7ppkAjFrqRB3xS7Jr7c8DPRxl555lUQoSmkFOaw0GGVuz8FO9jShujmfIFyc4fc5GA
	KsR1SJftd/SnpSGGoX+lTQ/4ij+73k9QR9zCiuI7gP7auH13w4hKvjYE0vr5mi7YUQCgmkZF9fT
	bv6iGEeAenAkMe6bgszzr3CDK7oBAduwmq8kmzHiJlxKhOc47EwW54/UDByQfafahpJq12hRM1Y
	gxfgCQJalTdlYsEQf55DeCiRrdytar//m+Bn3zPUCaRlESJn5GPZIDNR5VF2sWy8YsowjWlGM+l
	cVaUOUUog1WFPY6u6LjR6nJtygTg9Sk+r9NDZb7SVLBz/1e41LxBXFO7TiG6A6qONUBPrVJKEBZ
	upNckYhsn/BWxhAyfainlTGpdjtrWTleyA0AIszuj/rDqWCv1TTXOQfryX/nSuD6FcGhVuEy1j3
	VJz+SJUjCXfi6TrqI2MkcOTNGFpuqFcNpmpuEl4yg0QGvkT3pYpB7w==
X-Received: by 2002:a05:6000:29d7:b0:48e:e2a:4093 with SMTP id ffacd0b85a97d-48e5d5c277cmr3745966f8f.19.1793191792916;
        Wed, 28 Oct 2026 05:49:52 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm28285252f8f.53.2026.10.28.05.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:49:52 -0700 (PDT)
Message-ID: <567ad0ec-378a-4f65-833b-e40c07ab56d2@suse.com>
Date: Wed, 28 Oct 2026 14:49:51 +0200
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
Subject: Re: [PATCH v6 4/4] KVM: TDX: Validate userspace CPUID input for
 KVM_TDX_INIT_VM
To: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, dave.hansen@linux.intel.com,
 andrew.cooper3@citrix.com, kas@kernel.org, rick.p.edgecombe@intel.com,
 xiaoyao.li@intel.com, chao.gao@intel.com, tony.lindgren@linux.intel.com,
 kishen.maloor@intel.com, dedekind1@gmail.com
References: <20261028081658.1228484-1-binbin.wu@linux.intel.com>
 <20261028081658.1228484-5-binbin.wu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261028081658.1228484-5-binbin.wu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.10.26 г. 10:16 ч., Binbin Wu wrote:
> Validate the CPUID configuration provided by userspace through
> KVM_TDX_INIT_VM against KVM's TDX allowlist, and drop the hardcoded
> denylist-based check.
> 
> The TDX module lets the VMM directly configure certain CPUID bits for a TD
> at initialization time, but KVM must strictly govern which of those bits
> userspace can set, otherwise a feature that clobbers host state could be
> enabled behind KVM's back.  The existing denylist rejects only TSX and
> WAITPKG, and thus would accept any bit that a future TDX module makes
> configurable, even if KVM knows nothing about the associated feature.
> 
> Rewrite tdx_is_unsupported_cpuid_entry() to reject KVM_TDX_INIT_VM if
> userspace sets any bit outside of the mask returned by
> tdx_get_cpuid_cfg_mask(), i.e. the same mask used to filter
> KVM_TDX_CAPABILITIES.  Don't bother intersecting the userspace input with
> the bits that the TDX module reports as directly configurable, as the TDX
> module itself rejects any bit outside that set.
> 
> Ignore the index for non-indexed functions when walking reverse_cpuid[],
> as userspace isn't required to zero it.
> 
> Note, this is an ABI change, as KVM_TDX_INIT_VM now rejects some input
> that was previously accepted.  However, the semantics of KVM_TDX_INIT_VM
> are unchanged: KVM already rejected unsupported CPUID bits, albeit via a
> denylist, and userspace has always been required to consult
> KVM_TDX_CAPABILITIES and set only the bits reported as configurable.
> 
> The change isn't expected to break userspace or guests:
>   - The newly rejected bits are no longer reported as configurable by
>     KVM_TDX_CAPABILITIES, so userspace that honors KVM_TDX_CAPABILITIES
>     won't set them.
>   - CORE_CAPABILITIES, which older TDX module specs defined as fixed-1, is
>     still allowed.
>   - The newly rejected features are either obsolete or unsupported by KVM,
>     and in the latter case, a guest relying on them would already have run
>     into problems.
> 
> Signed-off-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
