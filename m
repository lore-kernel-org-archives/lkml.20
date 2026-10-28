Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170308;
	b=mqpfsMUDts2gsx9lCqWK9Y6u7TVU5RxP2gE2B2y9cgGGWjSXv0S8wcHeD7z81MDkVulx
	 I4Lu6BgK+e+d5nWYfvw9QaRB15sQ3FNfTc+VKpV3abYddMifkFaVDp8oF0fW2spz+hKTi
	 BzEEYhBRUezqJSV7zw1p/0/DQVi96zZP8Ey5vnOYti13d7hT71k6RT3fgo+UQGJb9qd0d
	 MLI0KRpv8C04RjEXg017yYBMycaeEn1V3Ccz/JpoS2xzUQ5anaiVLK8SohEHA2blbo0dH
	 zHyuPAFSBDpfm2m4dqK2S2OusJtR7azw0C+XanHT9lkp2g9ZAfH1RPrgIATo+NKfLVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
	b=IrDEd0usDxkKKHyF0kkCA50huLyruqfLsTTsKDTKa/aQ+R7V2gMKaJ7vZOLAMGyJCO1t
	 8JLhVa0AwWsxieU91oIBdW1rH8SDtEADzWK41pENiassDL1EEd8tgCITqPI520BMjpcS1
	 BXm/xa9KOERvPJEcFkiQYqfEfIS6vb/GTueUIIVrvCxkAExFW0Vnm2qeKYLMLY93Qqskw
	 Qx3zxyi+XzwICOiTK0dvr6IGEN6oeuFC1gOCGzySS4A82xFToPQmLqIF3EuFZXfm5DX3F
	 t+S0nUBLKV11j7gkxfV1NRnEppbI6aA948uqlVCzvZ8ICzYeAG99wmaz4qP58t1bhsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I9c9UWlC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I9c9UWlC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6978475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793170307; x=1793775107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
        b=I9c9UWlCl70XM6p3zsoWd4pVIsWonb/pepx1rvC1nys6tcu1PjeWirMnEpWdb16CPx
         lcVm0oWpPmut7M/IP1Npnp+VUSR48cuOmKY3bZsjKlPG99E238nA7M+b9QBUoDn3JKFO
         dVpa+gDZN+XfKS538IiHp7h86gWg9zknOO3PvRpydZT4hUlUvS4CaIqQE46JUt4i0OuF
         uG8LQ4B9rcTCR/MjqIk8SwWpitlUhysPK5wS752c2eAWplxyskpZYpquroZF9m95lVd+
         +SHpp6+L1oRCGPwANV/pfYQIb3nD5B0gh48nV9+/zdJKdGyXgNHM0h4jQngNGFWZi2yy
         BH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170307; x=1793775107;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OU82mdQwOnTlldCp6fJ9DzcsH1aK1DJuUdJCn0clSqs=;
        b=oCjEOJ/uorSamxzTZ2JivGlMEiP2SxPus+50tbRoYOILYb3oCQt0reXYuAqxk8Yd8W
         VOiNqvGzN4L4SwUe9xOGvBIT4K5lAKKZEKqoEE2Oiz/g8z52DEUvkoMZYfCTq4cCxA31
         FIQg4ZrnhmggpVaCtujioabgnF9q8zpSp0lxECdK9yaNdJi/CSJC0xNdFrDQHDsqyUI/
         S/R7AQjkEzZLsm/PMIFTHFDiujNxzZyV1Fcj2+ex5hhb6wIm0WJDSWP4EyeoVlstDiUt
         xiDy1VRBtkfByCz0L01czJYhUxj2C17l+9xqytP6PkACzkk7fv4OolxMCaR9SrvF22O7
         2r8w==
X-Forwarded-Encrypted: i=1; AKwUvBzdkJ6UTS4s49jDxXlb9wJcDeIltX1LuHOiF7bWR4ud/7ummYqJGa4H2AlGzSXtdm9QAeqlXkLmWtb4UcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxE7ate6S6lIzgTuy6+2RLn8SthlrvbQ8+LiDUztdXpPNYonuC
	pf9P2bWXqX8VxFr8xcAZFEvxc7B3jyjSjQU7jtLp8VSam8RPqSjUnNoQf4WL/lqCN88=
X-Gm-Gg: AYBFou2HsrULKSR7OCqzv6kpnx/22Y8fI1fm+z1iVj7+/mEvqbcVp18nKdPCvpB1kkA
	rFZTDUe9RfzVX+sPdmce9PET6O1OXX+FUTZJZd8iKJ2gPSo+NvGwOtDSYaxKaxvBSNFtdCbFX/s
	Usx6OtJas8hvrDpfbo4G2f3ne75X1bRtnvfFZGOkFWMPLFeKR50C2y86IInikVyjOIiCjwuJ0d/
	qyvEoo0ZZYZ8Ed58l+xrx7euihZFn6AbKFQ65jZ0PYYfSQ/tXvj+jOSOa/kewkxuYXg2rGte3t8
	9ZUJiHyeJTNG5PydbdkHNbT6heuhhR5Qzva+L/98y5ZNwiYeOhcLPY9eMdgdx0Xn99Kvtb81B0o
	/S8q0hGcTSluSJFmG1KyJY7XDl4YU3JQbMWnjzTPG+Z5pJVL8vUOk6524sVMCJNiJzIrUd6ncl6
	8EU9sPLVqfapQqnTPwud10ALYJdmIjRY9uxGJ4/gd2dilxWhwgTuFmqVwvTyA9/6jSDTQ7gdvZp
	BllkYz8ml2UIIziaz0sCry9nuu0uhIHxwjnt8m8EPDrxD4HPXjZ1VNgzKh4uFEiMnFVRmqK2Au8
	aKz6X67JPtuhiaHWlSLmRSyMVdTQKZJ8aXlziUXBxwaqG08wO3v2J6I=
X-Received: by 2002:a05:600c:a314:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4a96b29d208mr19116475e9.18.1793170305995;
        Tue, 27 Oct 2026 23:51:45 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94fce50a8sm17667475e9.4.2026.10.27.23.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:51:45 -0700 (PDT)
Message-ID: <c4c3e6e9-8f4e-494b-b21f-7051ca81fad6@suse.com>
Date: Wed, 28 Oct 2026 08:51:43 +0200
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
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
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
 <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
 <IA3PR11MB9136C5455D0EA04FC3624824926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <IA3PR11MB9136C5455D0EA04FC3624824926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.10.26 г. 7:42 ч., Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
>> support check
>>
>>
>>
>> On 26.10.26 г. 3:26 ч., Xiaoyao Li wrote:
>>> On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>>>>> This is used to allow TD guest TEE-IO Device Control and Management
>>>>> (TDCM) module to
>>>>> manage the device. The TDCM leaf functions are defined in the following
>>>>> table
>>>>>
>>>>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>>>>> never mentions the TDCM module. A bit more details are required in
>> order
>>>>> to better understand why you've implemented this the way you have.
>>>> "TDCM module" is GHCI terminology. In this series, the guest-side
>>>> implementation is in the TDX TSM driver; it is not an NRX module.
>>>
>>> I think the TDX guest TSM driver is just the implementation of the "TDCM
>> module"
>>> called in GHCI, right?
>>
>> I think we are entering a dangerous bikeshedding territory here. But
>> IIUC TDCM seems to be something which the TD calls, because it sends the
>> TDCM function ids to the host, so the TDCM should really be implemented
>> by the host. But I think such construct just adds more confusion, TDCM
>> is just a subset of the GHCI, so nothing really more special.
> 
> GHCI spec says:
> 
> "This is used to allow TD guest TEE-IO Device Control and Management (TDCM) module to
> manage the device."
> 
> So I think "TDCM module" term in GHCI spec is talking about guest side - the TDX TSM driver.
> 
> Since "TDCM module" term is confusing for reader, so I plan to drop it
> in next version, I plan to use "TDCM request" to denote the guest-side
> operations and "TDCM implementation" to denote the host-side logic.
> let me know if this distinction makes sense to you all, or if you have
> any other suggestions.

Yep, makes sense to me.


