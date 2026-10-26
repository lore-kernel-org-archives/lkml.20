Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999132;
	b=fq6vl2wnr0/saSrQ0Ws/HiNLNUZynpQl5UBf9JyimCpyTioSszS/uaS5vk76/vs2eJJl
	 VSaDdfr9qpGz5mHgsMrqNvM2xONqAMMlvIw6mudXuSBw2B/kB3FNgkl6WRjo4M9KVOn4M
	 /Aomf/FXMNtoFtOegZd0YNbA3dcfybyHhbqtP6DHGiSa+NkvPnByRlApGwKWv+dVNDDBm
	 w0DOkE7pBl3SHetzgtGyrpV1V9SbLxwzqXdUxh/1oIXMQWWlj/aadf3vEYUSSSITxmWYC
	 tlbFRJc+wdI+zy0nAhElIvUYwhnl1Wmaz9v27YJn1cqVW6cv4rHl7P8WEh44oriQgtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=djhi73/E0YES7rDU6N5TQtgUKhsNPCDgyp+K6uJathY=;
	b=JJB5YWwO1weIo/x2zMOFW7Te//I0m8YvOcr9Aidt4m/mbjhyh592UkhaMweT0AVnCkId
	 huXbjL7zp6xe4N40MbHxLk/zlOmV/JrP3ApPjKTnKTvVGEkITkC0E7O4cNdDazKI00xIi
	 1XGoCjSt96ZKTF2+lwNpdl98FTCFXrQEg78eJNAxjLZEnGRRxkvHYvxbJuumsZL3Sd+JU
	 IfwcuWE4TV/hVMea+QlR20xD12htkYB2eM9HF96l9NBWcuHghyHeI8eOa2AFtvJOb3dzl
	 uwDlzDvo9Yky1QzRM5YHEu2Ff9WSAB7kkFB4Jeb3XWQoHIF/JgCDYXG5AmBsurHax1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dtYNlF53;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C754606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C754606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dtYNlF53
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21378325e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792999130; x=1793603930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=djhi73/E0YES7rDU6N5TQtgUKhsNPCDgyp+K6uJathY=;
        b=dtYNlF53tfrvhfPzi0uF1flxN4D7lkFQO352gLd0QGWYo8mO6gPNkNfS6Yhbo0uZAQ
         wHtH4T35hlbmlBs0ggQpA4xuy0zWzpx1ypufashgnjTtLZ7Oi3D/YIrIugkPkd35iXTA
         l/BbYFYzxeH5N/KM6k7uYe269acyCNZsVHQhUCK018f9+Gq9dm4ovwV/Vq6FJe3b4Htj
         eEtiVJViEv6wh+3JV4dlZknuUNAFsEp7Qkxurwto9pt/7QarB2SOdnmeX1ZdpBc//BR1
         d+NmJkaBUbmTPnEkbK07/MNrzryBFVkXDiXPNTXo4TZK10IG1oMwA/qvgICi5iHrf/qH
         64MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999130; x=1793603930;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=djhi73/E0YES7rDU6N5TQtgUKhsNPCDgyp+K6uJathY=;
        b=wImitr5dddkMwGs1xeucTqT4YSnyYzaEfeQNPTIlV+pSk8VQZmNiirT7M95Lc0qlKN
         bUJrzO3zGpWxZDbEqgatTpxn7dpUQdfvkwLHL5wAINUvFmK/aV/lg3+doBEMOEiTShJp
         dhHdOSK/oaQ7cVB4acHFz2Il3YFOIBUYO/H6ed/8iZQqECY61UUwi+osAbkSX16ER6qn
         K2X9IwpU/gGrqAr9/pH0jQ2EKcQofP/z3IgS041z3EA5t0N1YerQwuRlQq6FBhX+gyiY
         oX9+n06gEd2iIR+kq8r7YlwtGCz8J+5dWUO0GJ+ZB/8FnKDNWYSoX9jJ4UYS4hTHZrQR
         Gyxw==
X-Forwarded-Encrypted: i=1; AKwUvBwRUD85ERNSgq3iWKmq3wn+LNBMpkUnXyxfRPMNNNdsOaaXkreZnzvu4PfmuJjfylx4SNSB8IAUNiGVrrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkuwGKGfaGSdLIpZ2sojaBp0HvLJ5vSZ612l52LqaesOWpbmQz
	S8EjrGl430FSmk8hJDntekLFAUdeKB/PeInp2fpFxUM1ULc+E2nSVdfjq70gYMZS11g=
X-Gm-Gg: AYBFou3t+Hy17iDT6uhk/aI6R81FG/fKi6CKB3SxazyrYM6bqoyKVrBv3c20jmj5Cu4
	EG5YUIfpDV6VlHoC7zi2m6p4bZVukbh4pyETk6PnoAfh2yg2mu1/AeT4FYGrk6NUsEENuZdFEnF
	utxpBdrS1grwE3RkVILTZ4pbxlUBRQ7oQ8fViOzO5aF/po6m0ity9ItHu+qgVTnyNUfv0q16yQm
	0OmWmNiEJWIbftkeYSLUp68Dc9KI3URuuG+/fI7QLlOYdAi3PpaWBLt+bAnhK7v6tviMHjA9VRe
	JaQ3IiWmFXd8Fo0ExUWfw3wdzVuLGRG80bZ4h6fZetz6x/8oUtMrs6LOoAyuAToK093trYxZ9Pq
	TeVGC8sIGCbpRCHjxdD1XAtX+QThUwjUQLE4wrNcCQNcJ1f67vnXL5EB+wRxOY2jFiP+LJVKIG+
	Kp2d1XfkbZPQvXjaaQiWse2uPAYpbBaFC+9Z2lB1Csgf/kfywcJEUcR5SfBR6rYd5U25lWxk7Ub
	wgiPjJMNF+WYy12FXvLS/909RF6XWe2OYz/4yeqi8SNKn4ax8stLL/U0QyPrYnZBc1Q9A+9V8fs
	1DYS
X-Received: by 2002:a05:600c:4e44:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a35ac95a17mr100011305e9.13.1792999129962;
        Mon, 26 Oct 2026 00:18:49 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm175964295e9.5.2026.10.26.00.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:18:49 -0700 (PDT)
Message-ID: <5d0a6304-225d-4dd9-966b-ad569d522e0b@suse.com>
Date: Mon, 26 Oct 2026 09:18:48 +0200
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
Subject: Re: [PATCH v5 2/5] KVM: TDX: Track configurable CPUID bits allowed by
 KVM
To: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, dave.hansen@linux.intel.com,
 andrew.cooper3@citrix.com, kas@kernel.org, rick.p.edgecombe@intel.com,
 xiaoyao.li@intel.com, chao.gao@intel.com, tony.lindgren@linux.intel.com,
 kishen.maloor@intel.com, dedekind1@gmail.com, adrian.hunter@intel.com
References: <20261016091422.3182216-1-binbin.wu@linux.intel.com>
 <20261016091422.3182216-3-binbin.wu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261016091422.3182216-3-binbin.wu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.10.26 г. 12:14 ч., Binbin Wu wrote:
> Add tdx_cpu_cfg_caps[] to track the subset of TDX directly configurable
> CPUID feature bits that KVM supports, and initialize it during TDX
> hardware setup.
> 
> The TDX module reports the CPUID bits that the VMM can directly configure
> for a TD, but KVM can't blindly expose every reported bit to userspace.
> Some features imply additional state, e.g. MSRs, that KVM must context
> switch across host/guest transitions to avoid corrupting host state.  The
> existing hardcoded denylist can't account for such features introduced by
> future TDX modules.
> 
> Aside from a few fixed-1 bits required for basic TDX support, features
> that can clobber host state are either directly configurable or controlled
> by TD ATTRIBUTES/XFAM, which KVM already validates.  Thus, an allowlist
> covering only the directly configurable bits is sufficient.
> 
> Organize tdx_cpu_cfg_caps[] like kvm_cpu_caps[] so that the allowlist can
> be built with feature-name based initializers.  Directly configurable bits
> that aren't feature flags will be handled when building the per-register
> masks for KVM_TDX_CAPABILITIES.
> 
> Sort the directly configurable CPUID feature bits into three categories:
> 
>   1) Features that KVM supports and tracks in kvm_cpu_caps[].  Use
>      TDX_CFG_F() so that they are also capped by kvm_cpu_caps[].
> 
>   2) Features that KVM supports, or can safely allow, but doesn't track in
>      kvm_cpu_caps[], i.e. MWAIT and HT.  Use TDX_CFG_INDEPENDENT_F().
> 
>   3) Features that are obsolete or unsupported by KVM, and thus excluded,
>      i.e. EST, TM2, CID, SDBG, XTPR, DCA, PN (PSN), ACPI, ACC (TM), PBE,
>      HLE, RTM, CQM (RDT_M), RDT_A, PREFETCHWT1, WAITPKG, TME, PCONFIG,
>      CORE_CAPABILITIES, RAO_INT, FRED, and AMX-TRANSPOSE.
> 
> Excluding the features in category 3 shouldn't break userspace, as
> userspace is expected to consult KVM_TDX_CAPABILITIES for the configurable
> bits before invoking KVM_TDX_INIT_VM.  Nor should it break guests, as the
> features are either obsolete or unsupported by KVM, and in the latter case,
> a guest relying on them would already have run into problems.
> CORE_CAPABILITIES is a special case; it will be allowed separately to
> accommodate its legacy fixed-1 definition.
> 
> Future changes will use tdx_cpu_cfg_caps[] to filter KVM_TDX_CAPABILITIES
> and to reject unsupported CPUID input to KVM_TDX_INIT_VM, so that directly
> configurable bits introduced by future TDX modules are neither advertised
> to nor configurable by userspace until KVM explicitly opts in.
> 
> Signed-off-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
