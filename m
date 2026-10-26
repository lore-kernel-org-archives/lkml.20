Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998835;
	b=nu7ZqoxvLm0LCi3DbBvaKEUqbnhvXlMgYxY3T1D2zPesHATRfVS1oQUGO5cBNiQyQc79
	 cLKh0oxyMnwJBtjJGPDDpEsFg8hA7jGcvUttdwbXT9kwB7RwCMLGYymuE/Iw5qt9HpG7A
	 6XvDI7Nes+VOVzXSFiVuDrKY/xuZSgdveF62ezL76Ll2t/lJq6teaB3nTp/2xEwvkHM6k
	 wuZ1QKVbaS225ofK4lK7euHqnVpax4CNc3zmkkkrwt8dy8/5QiJ4ROSJbICvUFllMN4Hf
	 hqhDqGXF5lbmv4d4V8CbIH20ERvMiJTOD+KapJux8ai5ms5ninCWfeuIRECLd8VnWWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
	b=QUNTgPL2g6YwGFLso6wSpl+fRnc79TLqm26ijJSpjiHkDLh8GZpch3SYXlnXBmwI4BmW
	 rJ38NkN8varJgIlhBfk9ckPQxz+zXSTUfLyY2WN257GoeGijszZcV65y53WR9j0xcQJsO
	 gmQRNKhXh0kc/IBWSxDBWFK7LyWv8relxfpZiq4VDo7LuRvCJUx0B2kSrn3wobJBTTcxD
	 4o9fmAshiHe+bCxH7/oTI8pGhiLATj/8D+N5KFJNCvVmXEV1dbAAoOJh3PfoehiRgAKHQ
	 8kdIWsNhDEpMQEGOUm/LNCv76nF0ecgBjIImWlkY0IMayKfMbRQKPGc2VpQfOoLVbtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gre7Knoz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB4F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gre7Knoz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9108385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792998833; x=1793603633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
        b=Gre7KnozZLpET4fxBOyHQ8WSJGdnED5+tfL9jB4alzVLIfLSAPQ4m9199dGsmCvHR0
         cNOycp7yQyuDpFtyjMLJW3cBG12TgWn8x2VrG3kjprvTh+RNEa7yjlLJ9ZBImquYHZbR
         HmVWLSY2wzfa96cDCJZOOusEC3Hhzkifjv1g+XuHJsUx7Y+NVW+GsUMHstjC6H2VFR0r
         MrsaHG9GatFiOPKQSxvxXDFHyduOLh/2aZ/fMszFJPA8sctW6MDaADWDvbNJwrmeWx/d
         q+0zv9le1lczBXcR4EZSsi2xv4CnnTH2aWk+nEFUTYvLdaAIHBonHNAd5tT2SYYwZpi4
         dtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998833; x=1793603633;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1b8piUv5ZZ+sF0HHFMkLcrFtrY4rkMXKD2YJaiXD/B8=;
        b=uPTfETxXlNWzGCC7/w62wRvzhLWDEy6zDYZzbKsMYYlirLK7FNQhG/hq7BEe1HOOKQ
         xNQUTURmKvk03gn69TM2F9OWHtEhiCozaj62I26xqz6L55j96BmKOOWBGqR+I5MKeTWj
         1BLkeVBxPeZcIUPgA+fIzNGsB6G8GTctoEQXPUcr2SZgmnV9W9adLWDKdtCpreryip2o
         Ug7LLnGtXyqIZJI57p6knwhmvS9OVl4nDzFK/Gv/m8x0crD266E0Kb+CsnQkoorz0Iji
         Bcu9w5cMZ8X62hUZ+7Uf/JXDOKWsjoMu5toTQNPJ8RkF0fb25RyVB+IO3t4c+UMBcWSs
         D/tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYihNdoHP17fbsTeEbfHAWsH3WP9DgW0cNmvaPJhj62/rczTSl/3mC3CH99kEdFKNkAVKQtujw6hCNoxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKReuuAPySDPiAVfV/3CgntpoSCkzfbvUJrGL7Y0UgtU5SvPzgJ
	LJ5+YYFNI9ZZD5USEkmMS4Qe+VBnNJFHOJzZ0cc/QteQIsgcifAaTIwU+FfmPAXNqwg=
X-Gm-Gg: AYBFou1H3iU2VaybXZKkMoyDT9tE50S3ikk8cppciHQ1hb3hmJ3xXGTQHfJhmMlriR5
	xUF9NY/SszHqmxtMLeZ0+qs6rPRpph/dZoXPnzYP9br9iC/BVp/SZgUaJgwdEBmyKZ+JYZ/wfUi
	OjbscqjvCqmX+0CTc6m+KwRc49+h9GJjfjg/rtrfegsvUwQNKrEIJUrelayHV8EvtOGRAc7DHCE
	0XQvQeWkVNINjE9Ly1fLDlvu6Uw6+pamkHKKN+EjDLmWpEu3ecC6JOQqzPnKJwMuRC2SDTwxnwx
	K/nBUXqXoL2aWOthlU1C8gWP8fh4MXj9AwrZvQR+u2a8K8rU8SMMknQBZX2QOcykF25R6OFpTqD
	Wdw+8TKHlD8Wahq6yus8Y2upPaWCn7Kpe5+EMBCPF5bNK7Aa6PuQkBjQqgJZYW95WFmN6IM2fnh
	dZsH4CRg3/Ms2+G0wtZw+e8QcaDL5hXujA9NxxKlI7tVbwtVC7kVJUycVOKFGtGECM/H/Qd9tk0
	Ohg8rKtGTaYW2++3Q1KKs6RW6dJUWgUWwldpWZB5QUaJD2hltfNNWZaIauIqJ6/1A9cJ/YjExfb
	K7lJvoCuj73q7aRnxmc0x43DFWA=
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr87025685e9.33.1792998833162;
        Mon, 26 Oct 2026 00:13:53 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm137080865e9.1.2026.10.26.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:13:52 -0700 (PDT)
Message-ID: <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
Date: Mon, 26 Oct 2026 09:13:50 +0200
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
Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
To: Xiaoyao Li <xiaoyao.li@intel.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
 <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.10.26 г. 3:26 ч., Xiaoyao Li wrote:
> On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>>> This is used to allow TD guest TEE-IO Device Control and Management
>>> (TDCM) module to
>>> manage the device. The TDCM leaf functions are defined in the following
>>> table
>>>
>>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>>> never mentions the TDCM module. A bit more details are required in order
>>> to better understand why you've implemented this the way you have.
>> "TDCM module" is GHCI terminology. In this series, the guest-side
>> implementation is in the TDX TSM driver; it is not an NRX module.
> 
> I think the TDX guest TSM driver is just the implementation of the "TDCM module"
> called in GHCI, right?

I think we are entering a dangerous bikeshedding territory here. But 
IIUC TDCM seems to be something which the TD calls, because it sends the 
TDCM function ids to the host, so the TDCM should really be implemented 
by the host. But I think such construct just adds more confusion, TDCM 
is just a subset of the GHCI, so nothing really more special.
