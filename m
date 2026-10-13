Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3A4E36F8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902064; cv=none; b=iKyWU4iICIPPo8zzYWXCHah05f5x5EPlPlaK1uQ3dvv98OiTtI/lMUloT+KEr9s8pAfmZMnld4BM6+h/e7/LfdTKHznpmDHcgxoCoD0fyHbgebNs2AUOMtpgUxD5ou/QaFELAbALRdQORcqjhat4DKla2TntWP4QjXZ5h86BrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902064; c=relaxed/simple;
	bh=epQdanmIbBSQQyUyr4wJmA1U07a04RykgIxTcxuNy0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPy1grOIVg+B2xux4p6DjyV6tQyf9JZd/wg14hdfYfphuUA7oK9HYpGXP4whct3qcD1eHwhpzirEV6OSirhEbA/JvNTCuJoWMGPfhbBiqf3PpDkXErgf/LM5w/3ayvjfgPAWWik2bZ0EFVpO3M1kuXcTb9aT0JbQ1UjWHChybA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E0qAuIqp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E0qAuIqp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso28388645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791902061; x=1792506861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wXreF/I8cRdQC4jDdNM5mdo3jIec5dd48MtOjybNLvg=;
        b=E0qAuIqpuBd4k4pqxOz/MPUVsQV8p8WQS48ABHctnpWQL7iMXWOM80LwfLj2cm20Se
         eJ9/eJqy4FTAqXL++y7sKhvoFDBALNk10JmI2kXr40pAvXYWQxLe0ZzaVmwaAi5Jo4xD
         y3avJ731pdqtZoB3ufZHoc1zOHiYtYsxDspFtcig9LKgbgUPc4UyzxM4zgAjKt8Ph02s
         CcBBOMl/1AyyX+Pow8wJO8K8ORQ85aCvQhsGOaMitLPy3naWklXgq22TzDv6XE7XWTvk
         Q5NNbEecr6rm7rYt0HQJq/hCb9oEJpJJvK15Cyii8MneYcKqp4lOPGwhsOAO0YWFVKE8
         Ok8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902061; x=1792506861;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wXreF/I8cRdQC4jDdNM5mdo3jIec5dd48MtOjybNLvg=;
        b=k+uvL032bt2kGbokp9fqVcKw4wJDfr0aqghyv32UkXCCDSUERaqFbti7LQ8Gf7hewQ
         jLMzcUt9rsirDV/JVwBxHfchC8Dtahv2/iE1P0sDT8lxMuCGE3N4vC+pZN15IUhqUnv3
         jNgkXpmXB3tJa1zFa9+fyr88yw+p6BKyxxEXz8oqzcpUTkxO+OU2zEMj0jZlmTj0svUK
         n8gQAX0XPRepQgarcE3V/ma6vR7SaE3aWR7tnyPDRBtPDwLsD7JyDT24kqvSt7ElOLgP
         CX5dw+WjqUujdWwI47tb1mVqpWqtL9eAONFdm5RosKoKIHqSZ3nWl7sM/jqzUJ9nWzNQ
         OfJA==
X-Forwarded-Encrypted: i=1; AKwUvBy+u66cNHZuSp93h5JTXO2Mz+r/Sap+qQwRZm52i9UUFZbQHqc+5hHtMDGoIAmUtLg/MZf5Ww9diwzqIS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5K1fvEL6tqC+omuFnm4bLF6pm8jUM4ZhQueqwqDy5lnjidOT+
	3rY2ZetwUJlzQYdP/KQrw8OWbHVF1Is/OWOxrZLH/83LojmGSkSgYWRdIFSr4YjAOS8=
X-Gm-Gg: AYBFou2qNPEBDY+jZnSiEsCFemszfnKKWfseRaUqSMm/eG/HLC7FRRZ5bHMEiRqcxIk
	5SU/4pNJL8BqngLyTztrcAnWOR+JDzKqtXK87wZumOdnhMQ4UIY7Jzz4y76mLrx0r5RIto9qZlT
	zB5U6LnQF++ebrTokv1DWTl3EC9Wj46oSXP807wihTuJDFYxs9KrTXuC8xEbC6M0X7w7jHj64ry
	wTwmuRwaqu7juPwCECFGwFshaa7xuY8fqk4vetAdItuwiMEuAeJNpXSukrFBVdEWj0Y06HqSIm+
	Ltv7/AVq84trjCK+flSjDOpxh0VUCEB4uJJMUQosXjWVjZoSVjETmfC7GOaEd3KgM0UVr7Q0Q5J
	rYcltDsvJkEX2UP/ro4oeio/CpiSmOvodO6Fpn13Zeac5473helPFKfpHH7zlPT0hgUcT2L7zA2
	w8DjxTDro/+WvRMSr24vX+B15c7mSmmm/FRBr0RH50ryOjku8188CNzRCd8Sl7nCJDnCvAG6Nsi
	T+FpytcVtZgkZGwyfLG+Ulx
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr250131675e9.3.1791902061229;
        Tue, 13 Oct 2026 07:34:21 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm519463945e9.0.2026.10.13.07.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:34:19 -0700 (PDT)
Message-ID: <54846068-d545-4591-b850-2980ce57f40e@suse.com>
Date: Tue, 13 Oct 2026 17:34:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, xiaoyao.li@intel.com, kevin.tian@intel.com,
 chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-3-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> TDX Connect is a TDX feature that enables secure device assignment,
> allowing a TDX guest to directly interact with TEE-IO capable devices.
> 
> The TEE-IO Device Control and Management (TDCM) hypercall
> (TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
> primary interface through which a TDX guest issues device management
> commands to the host. The host processes these commands and returns
> responses via a shared memory buffer.

This patch contradicts what's going in patch 5. Because you make it 
sound as if TDCM is yet another leaf of VP.VMCALL, but then in patch 5 
you introduce the polling code to read the result. And there is not 
enough information in the changelogs to understand why this added 
complexity is needed. Isn't TDCM handled synchronously by the VMM as the 
rest of the tdcalls, is it perhaps handled by TDX NRX module?

> 
> Abstract the underlying leaf call and pass the shared buffer physical
> address as a decrypted mapping. Add a runtime page alignment check
> for the buffer to enforce correct usage.

<snip>
