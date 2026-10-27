Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114451;
	b=VbmHdBa9H3i4cuFV8OdUaR7hx16X86hr7qcJRWuysXJOnHN2fxnb8ptJjqmKREXRlB7i
	 fCtRUVuNp1uNCsgwAJ/b3jSgFRbApDYb0Ke3o2kHoLKtQ/r7wdv2v5RoYoX42VgBTGQUU
	 4JGkR7n9Zb2v80kYqit1jazHyVxTaSUB1kRD/5M5ODxI4JSij+OISpwvE8WolIX9A1MNH
	 jD0aujKtsK5Tpkn81gfwK6JGuR3VtVZ0XKN80ngkKSSmcJEKMo+OxXshr0A7NFG7DtLv8
	 VapffOryuzTvji9R+PPAbTxMZpSUp17diWj1Kcb8BmvDkwk5rzm6JI0+9f/6VbpKepQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZkYfvMiNj5nFXaNlm1Casddrca6W3x4oVBLV9EhyGUg=;
	b=lIU1Dlre2iVNFCfJxZcIxi4XNmun2QCSd5EZSvDDDDUDI9pQG6habVFXXRaSLvGIVs3v
	 EMTy0j3oJ1FvAHPu6dBSUoyK2KgsD+eNxtS02LzocriutEsgoaEO5aquuHgO9HQRRT5VG
	 JsZKOn0mCJ+QFf0pzVOLusARY6BUl7NB8XXuAKmz2qgHJkWGYRk7SRgYbu/G7TM+upBjc
	 tPeIpGr88z35j9eGoPoeFf/zt0Xbrbg+F5LbUizZCR21OJPDA7E46Li0r+544Qc8ieUVl
	 smxWp+GM5e7Dsov2bz5R0waZb1/fJpun09xbAAahS7QzV6xwhqGFRfrA9m8TYEoNs2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="W8UQh/Cg";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF15606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W8UQh/Cg
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso8012a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793114450; x=1793719250; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkYfvMiNj5nFXaNlm1Casddrca6W3x4oVBLV9EhyGUg=;
        b=W8UQh/CghaUzKHwg/SKpr85qFcqtEzggJnbL7hCRFlcvsxV8zZZ3gWgcD8d/sd8BC4
         mRTG7H/GSJaL0gPs4qW3LQlGNqChCN4PhlNgZ78ZCXV0oTvSc+0k/OcICZ3gbofPszlR
         mRnvPA2rW67qUVlkkTYeH7emFB2FmSQ/krzIvo2y+xMrOYtpYo7ZKV4IWLppKZzV3Ty0
         qDuQixtU2NpSBlSyv3UYVBsXxFqVzdIgWfSKQ5AJBLCa7XCGn7Q2HYAbZkJnXDRUBDFd
         n1nurNSHakQfz0VTWrCZNZ0SYIsPtf9qjzifQ4ohhg0pDx25t/WBGM7QqDvCpdXkZSsq
         n8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114450; x=1793719250;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkYfvMiNj5nFXaNlm1Casddrca6W3x4oVBLV9EhyGUg=;
        b=FiJfMch+w09lXKWxsyI4VD2wBJi1TLUzMm5KFsq3JIEOPHIMZybbBlNzylkoDL/mT7
         /OyRYbe2sTIUQM8EmjsVAd2zhBGPR/sl8b813aK54d6ufn3+eiRzMgTrva8GNS5Y2i74
         Hfi1qN/niILkPu8DU58C4CjZXj89LKHC/DEJumSul5CK5P2TLf5ocr3N73YN5cGCHwoj
         8xmTsKZ802CNSnLbXjwmlrOXNYhTgJu1XnwQnC5k1tjfW0MtRvS3qeo+QMnfrK8hT4It
         z/g/MK4yho6B2g4qqZK9e2QnXdyBizRTFha43kO489IT5pwD7vZfmPBSdmO9cw4iBwDO
         4b1A==
X-Forwarded-Encrypted: i=1; AKwUvBw/efmmFyotd+v6Db0WooqEjI7Zay08AGM2alGcFykdiZb8CNLszBSIFCSg20OTl0gGA6QC3EezvSIsPuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYbIzMILVV/nZ884f18ef8Kc2Qfe1vXHcRaztrPfpZQtJxKCiE
	lqbiJ6gqUePuPVIFMvlrXyKTf7NwMgkyZ2kcTqKyoIwCu023cfww/k8g2E/Y2AhUAKgekot7IOk
	9wkRwjw==
X-Received: from pjbev9.prod.google.com ([2002:a17:90a:eac9:b0:3ac:5201:5db9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cd:b0:3ac:9e76:aa97
 with SMTP id 98e67ed59e1d1-3adea1a76b8mr8072837a91.6.1793114450139; Tue, 27
 Oct 2026 08:20:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:20:49 -0700
In-Reply-To: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
Message-ID: <auDBUQQ9Ympsobkh@google.com>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 21, 2026, Borislav Petkov wrote:
> Hi,
> 
> I have been wondering how to improve that Zen uarch detection and handling and
> be able to do range checks of uarches, i.e., "this code needs to run on Zen
> microarchitectures 3 to 5". And I asked AI.
> 
> It gave me a lot of blurb but the basic idea is good so I went and did it. See
> below.
> 
> It boots in a VM, I'm not even trying to cause the cat to catch fire by
> booting on a real machine but that will happen soon too.
> 
> The thing can easily be extended to pre-Zen but that is not really needed, I'd
> say.
> 
> X86_FEATURE_ZEN to mark all Zens remains, that will be a future patch. Perhaps
> something as simple as:
> 
> 	if (boot_cpu_data.x86_uarch)
> 
> but I have to move Hygon off of that usage. We'll see. Small steps.

This is better than X86_FEATURE_ZENx, as I always found the lack of inclusivity,
e.g. ZEN4 not lighting up ZEN3, to be confusing/surprising.

But why invent another scheme?  What stops AMD from implementing precise macros
as arch/x86/include/asm/intel-family.h does?  Providing range-based checks would
"just" require more macros, no?  E.g. couldn't we do

	if (AMD_ZEN4_OR_LATER(boot_cpu_data.x86_vfm))
		return amd_zen4_perfmon_event_map[hw_event];

	if (AMD_ZEN2_OR_LATER(boot_cpu_data.x86_vfm))
		return amd_zen2_perfmon_event_map[hw_event];

	if (AMD_ZEN1_OR_LATER(boot_cpu_data.x86_vfm))
		return amd_zen1_perfmon_event_map[hw_event];


and

	if (AMD_ZEN3(boot_cpu_data.x86_vfm) ||
	    AMD_ZEN4(boot_cpu_data.x86_vfm)) {
		...

	}
