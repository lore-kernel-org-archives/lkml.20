Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C036B06A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345578; cv=none; b=RQGkiOVMGCBVgqdRNqB1ZGGSQwYb5Hn4+OgP44C5mw6Z5pyHoX4D9J0ZMw1WrKNxkTRnMPV6LK8az6d/FWLxjNb+paicPSqLlkdQA1DIFc126XtlP4TUa4zbBYbhKb9UQA7u5Wx4AeCwwOVvAYIXqSDx/0mU9FBB5QYPTfgImsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345578; c=relaxed/simple;
	bh=/MGhRXXTFshB26dKobSTU+rDExOvlc2JZ8aJb3VEbyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNFLARSeDE4VUCH6bCRXY2ADuJhpmU+b7AfDusnNPduMo5pkgumIHm2VR7REyaI1szEudx/jLx8sNrqye1eNWLCHtpNp2ww8AW8j9XUx5Z3l7WyGYpCGpuV7UF2hX5NeyaQVxoA/ZzXc6ZNtAs3zvEBiqIiDV/3bRywiz3g8BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=abEtMM1J; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="abEtMM1J"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so558803f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790345574; x=1790950374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkecftIWxcu7UUmU6dDFxqik/csT/7Zco/v8or1wVWw=;
        b=abEtMM1JEO1rZRovUEkEHF40x7z1u3DRDYkQMp2cuObRCU9CjocmcIhjmiS1UpIBl5
         Nx+x71GsEVzyTwYUQxPijfw63993FBDC4/sohkDviu9mz4f0bacxKkUABMpJLBHJX4Ff
         2rg/fLT05wh1IkPHvDGkcbjWKrYs+iuNQnCprksjeQ+lgp9xJr6TiPHyyaxa8tKKCcz5
         G0C7TRJtpWpijjrIF9+nTT0v/Ef9bHQbCXWyERGElD+ck6U0PhZTvfTWpT5BeiUq3e5S
         m3XbQnYlNg3L/kFJlJZ+QOzhImwrBVaHJHdE7LkbrwHI/Vy/kCfzTitTZqOlNrQKLVP/
         Hz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345574; x=1790950374;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkecftIWxcu7UUmU6dDFxqik/csT/7Zco/v8or1wVWw=;
        b=QMlz7TW1CCerZgKj55Sm62Iz96vqA/c/9GttUUvW/KUj0If3mN+WudqNBkJfh+3DQJ
         FLTeDrE/Wo1yy+7qAv/xq3sqSxkGC67oPsD+wX7IfNk4fiOZ6z0ZuCYNOxk6rGRsmqp4
         D2b0w3JMMvfXV1/HOMsUxUty2FO3oGbqxCP1iOHuclAcpeCt9G9YxYOP8kS55pdXevJB
         N+ukR2hPebXAmO2/T9slAohh+nALYyhAQWnaI3XDwp6mBeBdPbgsM99eaMoxjfT1NGhF
         G3AshV5MD3OwdD+5hjPcMp1qJj7ykrLNh6ZzauPcEYDlTezGipZF9CTfUgqlTb8K6hSq
         KYEg==
X-Forwarded-Encrypted: i=1; AKwUvBwqcpP5Xz1VODeD4Thnre5ftouzW6lRvQGs8s7sOsnB7FotXqX2BP5Xt/MtkQytiEp3BD8gX+wktUJm6Kw=@vger.kernel.org
X-Gm-Message-State: AFuF++niC0gp+/BL/82BXHQQIkxV64Q6gkFGAVQK0ijwvEe8GEpGP+LE
	S8/Z9g/J3GrkoOCJTQljSs2ujNnxmA8IfDoN1dca7xLxwucFN7lTj33AywSc6AanlLI=
X-Gm-Gg: AYBFou35gpHe0oImkvXF2u1FdlXM37k3EdwU4BSWMdD68fT10CGlJ5wbnWVF8RAOcqf
	CH64pyZnqhHhwHppJeJ2D+abxdSjWJUjAPxDyebsmqpOp5x520ofrqvw/etzMLAm5nQzShlDCCq
	3SIES7efgfwJ/szKGCuNblnAUbSnasVI591NMO2ZHrWGf64J8diR0XVFa48HD4DNo7J52Q2N47w
	EhIDczTRyYeOm7R/gfunN9SO7yJLQQAWCRj6EFT9rEF2j5z6aYCwzUdNsSyrNjELUHV9FlbT23N
	fi0FDTFs+Igxgs5J3oSzkzKg9eS2kxDFBGZkUfN9kO2PfpUXL52zQkj9ORYwSARX9L6+zpqoTYn
	qTpq4dsWryDxsU1ceqLy28ws/ncC6xE8GmWWOluS2mxM1JbQDiMkCVtmoGkEYxPsiqrvW/i330q
	7teyKe0nSX3qsSJQm0D20lJu1a77cw+MB5zw3SzlifCzreyEEI9FIA13nC977681qNX4ejI2j8P
	GUNstbGuTwKGIjIAX5YREM=
X-Received: by 2002:a05:6000:41f7:b0:487:27f6:a4d6 with SMTP id ffacd0b85a97d-488716b00eemr11164595f8f.38.1790345574584;
        Fri, 25 Sep 2026 07:12:54 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm6779397f8f.5.2026.09.25.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 07:12:54 -0700 (PDT)
Message-ID: <64bfe205-19b7-453b-85f1-0306fbd193d8@suse.com>
Date: Fri, 25 Sep 2026 17:12:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/virt/tdx: Configure add-on features on TDX
 module init
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, yilun.xu@intel.com,
 xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com,
 kishen.maloor@intel.com, tony.lindgren@linux.intel.com,
 peter.fang@intel.com, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 chao.gao@intel.com, artem.bityutskiy@linux.intel.com, kvm@vger.kernel.org
References: <20260915102658.713079-1-yilun.xu@linux.intel.com>
 <20260915102658.713079-3-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260915102658.713079-3-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.09.26 г. 13:26 ч., Xu Yilun wrote:
> The TDX architecture identifies some features that are off by default
> but can be enabled by the host during TDX module initialization. They
> are classified as add-on features because enabling them affects existing
> TDX systems: they may change existing feature behavior, or reserve more
> memory.
> 
> The TDX module extends TDH.SYS.CONFIG with a new register argument to
> specify which add-on features to enable. This new argument is a bitmap
> that uses the same feature bits as TDX_FEATURES0. Note that Dynamic PAMT
> is an exception: although it is an add-on feature, it is controlled via
> a legacy, dedicated register argument [1].
> 
> The kernel needs to enable these add-on features when it supports them.
> Add a get_tdx_addon_features0() helper to return the bitmap of the add-on
> features that the module & kernel both support. Initially, this helper
> returns 0. It will be updated to return specific feature bits as full
> kernel support lands. Pass this extra bitmap to TDH.SYS.CONFIG wrapper.
> 
> The TDX module requires SEAMCALL leaf version 1 for TDH.SYS.CONFIG when
> passing the new bitmap argument. A previous change [2] supports the
> versioned SEAMCALL leafs by adding a "version" field in
> struct tdx_module_args. Set the version field to 1 if the new bitmap
> argument is used to enable any add-on feature, otherwise keep the
> version as 0. This retains backward compatibility with older modules
> that don't recognize version 1.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Link: https://lore.kernel.org/all/20260904215841.303070-10-rick.p.edgecombe@intel.com/ # [1]
> Link: https://lore.kernel.org/all/20260722084634.131020-1-yilun.xu@linux.intel.com/ # [2]

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
