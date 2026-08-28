Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E73A8734
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955547; cv=pass; b=l0vQYA7SE5BLADjaW3d3v+8JZQudq0Jf07+Zc6rr8YWNKf1G5GIAXUX/9Ru4WfX2Lmq2Kwaz5e3Nx1YrrxV+xNcPjOtce4/Y4bR8EQneF419aqPjgiAqKqsz/vEzAYugOPS+e9LFyDIZE+4fyCFF78LJpszU4IY9ZvI5sIhpAfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955547; c=relaxed/simple;
	bh=BMIGDWFwkO1RXH8rR2UOhGKndRufLWtM6RTNgfHf9Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARfQ7h5LgL1CbvYVZyNYayp0hkkcCAO6r4v0jvMUBmgxgEaqAgQ33IR8dpNV0sh/j9EOnjICAIbPzX3YDjvoQPsbG5n8Lj9zxYeI6MtjYhWBh4ZkId0Fe+OgPNZHDNV1DIv15iw4OR+VkPro6SyAr3O7SkdrOyQiHFNg8/4wPP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3j6mVZf; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3j6mVZf"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c10e86e52so46941cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787955544; cv=none;
        d=google.com; s=arc-20260327;
        b=aZ62E48Fq+0NTc4kxizui2bQ+P/3VKlQh/VBsqo2jGPD89jnNf+u4qTb4Z65yL3z9t
         VZhfYTON7FmsyK2gNEPklQ3QD/zHUIffX7rmhtQDgUqNw06WQrIamF/QhUb/FjLFC01o
         yRAq7ZAPf4TWYgL9h+5FGvqzo+0uDEVOHts7pl8QU3EJ2Fjf24AtG2j+EHjxEMYqtVRb
         2e94EmzrqY1AI3Y5XbLgW1FJdufqhtGc+inZnVSpmJV4IKES4xRnwSNj6EDNgy7ZaJoI
         wKFUky5WGzcL52z6kZm3Scx5NBCylUoTVQ6teN4cPKQ42sMfBxhY4LLLzChrRgZ/IhOs
         VuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        fh=JAucePniHZ9ANwFXbSshCrAa4Nvl4igu2Yglx+IGCPM=;
        b=p202DuARyt/MTi4ovikTSUFhVROlkpfu58cwAu8RjW8/lziXy3ER66Z8FVQzuociUh
         rT8V4jBR7iw338BfJOMgAlb5f81tLbIyPprJGwkg9ERtB60FlHTDZOKofsVzCIciZPQ3
         +FTIb9NmiTziiOSMrzyTZym1bcUhEOFgHGcbuGIWHVn5H3LCowLQ9p7AkXKgXjQaserN
         hZ+VLa2bWSt7sNNcE82H8OoebgS6f2SJY0M4AOdjqyLbq9Xe4dFRX9t4tN1IwoaZBZMo
         ds4mo5fP3Smoea2ioNKwFM/BcWck8nS2BWNZoDILJ6gEsEU4N3xHuCdW4tWTja56uHWU
         9axQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787955544; x=1788560344; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=E3j6mVZfc+2R0/xsFMmoqiZRFUt8BlgFX0tmfQUumgdM2tRi4iaJDaU5nIU5SOaGyf
         wTrC/K6vSXgmqZE2Va3x8oXsGwWcyUoq6SNGHEEe/qngfwU0VtiDSFnj+ueLw9/YOjok
         Y4MfGMZgZzHMAshYtHzEeSRm0XVJ75mmaiEuCHNhgdEn1l3gVAcGXjVg+swRIL1MNfaS
         0j4UL1XixaYTJP2x+AbwzhrT6LXuj86PlLjl38+0R2tILXULLOEPckPk76yGzdzlMx0O
         +rv4enFqzc6VIGM5RGpIkK3WPWEqoo9aJSBD1J71yFwvNvlX1vPPBcl4B8LAlRrPW456
         rjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955544; x=1788560344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=Oqe72ORUUJ3ns4r2Qyg8S3/33nQPalS85f5aoNJd25WQZmisAo+zY1zHDPndLcTuLS
         htS/FKrWRf7o8R5a9/tDEl/rD8WCNxb2FIBVgrQPQKK+ogGPXc77yEs09Jlek5uqmLXi
         /lA3CMgK17cltGFdKnVFa/Dbh/N88CDEc3AHycueQ7tIRJqdfLdfXjbYMkKQEQjPb8nv
         zfB0kO3JoOGKIW8plbcWrMynlUg8f5WPlKf4q0uEQnwQiZRhzukeSpL4kJSiXl+XJl9/
         DeBb/OU7uTAfVEvZp9pITwRM2c7jjL9YZxbPGtTJO+1T6nlRqS0XUubLBOJ7t2kVz8mF
         7ojQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ33pbjwGQjHhwVxLSZnH9zkQs4F6Ro+5Pt5Sdw4uWjrDougNDfaspeejIcLOPZej3SPOLQvNMMptOMuk=@vger.kernel.org
X-Gm-Message-State: AFuF++nX9tfoRqVp0M9nhRuEqcMmlU+5fMaiYEahhQ/PM5G4PcaXLhBU
	gKyXXP86Jud/RzRGCG3YL0zPNL6JUUKS/5aXIR1ZDaB9PNM7xhUc2pAli2S3vMboT5IfYTqHcun
	NKXi1dfnVNGDxgxzbXscTO6vESxLX9oi2pgFsLoW5
X-Gm-Gg: AR+sD11G1C2SjuiebCCYJigF+iWq0p+/qunG/QDrlbveCHsDTbxHU0rt+qzKMg2Y1Ge
	4ZvGWGQK/tERejPCDowPRQaRPTkRLTVMA+UrJkRzyPWVuxWS/19AuHzPGFuf0VNkTq4UN8yonsl
	KX7aM3Jb5wN7o6DuDcmcCgVQXc11tMACBUicS+r9oR/jk+blQ/egjPBLkDenJGfd5kQMgPlOh1a
	zsVTv+YmKyztPMOVudomkMHzItVtuXs3RJzzMG971ET3UtipYRG6mfJFscHAaXCyLZqKli6JFYg
	Zcup783fULvRxvLRhBdH6cgZ+KNU1QGhCnP4v7LVBm2gwHJw+iKhutvtx32WqE7pIQv1d8s4Csc
	=
X-Received: by 2002:ac8:7d8b:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52ff711656dmr4308141cf.1.1787955543697; Fri, 28 Aug 2026
 15:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:18:52 -0700
X-Gm-Features: AcwNN1VtKeCMrm5d0HiUDNcJteBwV9YWHV2SenRF5c-NodyaK5x5u2MCHt6fWJ8
Message-ID: <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

> +
> +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pamt_cache *cache)
>  {
>         int i, j;
>
>         for (i = 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> -               pamt_pages[i] = alloc_page(GFP_KERNEL_ACCOUNT);
> +               pamt_pages[i] = alloc_dpamt_page(cache);
>                 if (!pamt_pages[i])
>                         goto err;
>         }

If the alloc_dpamt_page() was able to allocate a single page (not
two), should the partial allocation in the "err" handling return the
allocated page back to the cache?

We observed similar failures internally with a slightly customized
setup which had retries for pamt cache allocations in the fault path
due to SEMCALL failures with older TDX module functionality.
