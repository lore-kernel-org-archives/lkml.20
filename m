Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446765;
	b=zKw3IWdewLFiIOx7pt3jKsOPtH5bJ8rPwN2o3ptDZ/sWkxO797yukG4dRC/rgK5rkWfO
	 FjzJIF2Iv7lB14MnhcFlPz9NoWSF+tJPB3CLfAJf9wnnA7quiYLdJS/DTu5BQHzMX9szi
	 l+sJU9UVAmoq56QOR7mP565HEntFs4S+Avlvej0fEzskqim9H9GjrgDArdw4iS3ZCl23H
	 ay7ipNec/zhGiFKcmlBgYXMHe530u/ohxoGbG0Pxzk2g1tX7yiLoBbjMKyN3ITGi4OiIr
	 EsR8y3nkEt9aaiPhQQ6ZLAS/YZgsajxsm2EVwTKDZEQp2hn7sqJeY7Dsg1cpi2iUXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
	b=AQBrcfNgE2+nfvQZgRDaMHCuC0td3317jw2R8BvNiesAf26P/o0A0fCdNCNk8/q/worn
	 cKjEPF5y6uPzHwyFNnDNmTu0hClgYXgYMVS03bNeVPVV6o9Zoeoqv7YUsjIKypvjcYQAJ
	 5L0IOqkLijkxwPqasD47pVDcytB4pwO7oGgC/94YCNDPlWV2TMZ+y68GytvUeG5sIMoKJ
	 /jXHyp0mBaAk/zfgcN4uifZvgnPnEvPpSMvumYdZiTcPNIEjlzSgvjvj1qFBcb9PWoBrQ
	 1To4j0wSC1odIcNAJMwql+3dxNikCuYf/bWrgf8zpLdDgi6F8Wz/5lJxGNQ4aCj2lCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsYPY1kc;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597B606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3597B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsYPY1kc
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so6665739c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446764; x=1795051564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=ZsYPY1kcOQ1ZkbpwRFCLeOhKMk+CXgiVRlqpcHA2KRBb/wtWm/38P5ptumhbwtMSMs
         4Gjx5DC55qOIiy9xR8C5F2UUSvW1hdJ46sqxWm476o9UBQbatqeXDYrDStIwCCQf9gTs
         1Y0V+4AepBSMO5tvFvdmYXeomHELECh7nIsRzOM1ukxztuJBZWrh+f0DrI/kX+SzGMoA
         42YkjlF71Om+oH1VlmZHRDR/0y35e3VXs9UL6FvlfOhweg6D0LxU2MTirGODKqbeDuLx
         RajSdUIwg1iExbxEMTMSyPSPErbxU4Hg8IEeenIR/z9Ff3waNPkk/Oxjf8VEG++ZPq9T
         OGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446764; x=1795051564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=Tb6JbDOPaaJo5ORWbTwEZ/kZeDRAzvXcysU3OG/3jsXvJ4piR6p5Ojt9w9vDhAfueZ
         sfXvj6pHkK9upqXfdW3TH1JuRU707wW3HYukTzvaNXUhuLZBFCnAUwCTHfLTHeyboNvT
         kTEm5fBvLL5U29aSLugBEbAQPnK8tACItULP16kEdGqcM8/0WL/Gahypy2wbEWqh4Qu3
         WzdkUgTi9JIdzMhFneXPg6grUTU5TWpwwpHwCQ9tV5TycI8B4pZAr3A5vYxUvHP0nSHE
         pAAu0z0fOGiAsRKtY3acwriWLpLR1UTlykrCLmtucA+/NkTFyz/zbOaPIhNCN/QhEXmR
         FXnw==
X-Forwarded-Encrypted: i=1; AL+hErH8+AQn3Z1RSvu9IWfzj+lVE+V2rMDmuJOlrUHQzS/VhLgHzw4dq59IJguWn9gmizdwjyhyoDBtWchlQnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ApoWXE7dKyzq71qc4dMzXtNFse+o8h1s2jSoqbEwenG5ZmeU0
	n0dl5hHOG2JCz7uKQ74a8XsD310uZmk5//qPXVDMgTbC11pfMOKQ83Mo
X-Gm-Gg: AYBFou2g8V4kzrFKWYN4a4P58q1ZpSvt4Y2vgweWAINqPcK2AF/sD74QOI8V/W/zSTG
	TDAT72Nzckb2zHKr/w1sfvkNrKZpDkNLxhb1P0foEuBfoS085Ye/GWmTJi78Efh6gZ+z6iKZDMR
	vAOkjp9arkxNJ5bF/x7mQbEKXK1pnZ2IDDDWT2rdHG7QsfA3k3GjapeAulTFuGuJg3Fek4KCuTI
	PkrO6bys5QtIw6cXZ0WyReCBQdgPcPIOrxyOehk8vdi0IDLgQ5Lusse1SEcEJG1gW0YKB4T+MEX
	VIMHRmlxgRmj+mmRmtH6U9jJaOp0F8SUgUi9yeI6t3Pui4NOAA8LJ2DBq5vPDh1WRNJv/jNBfAz
	4BLiVRRbO6E2jKr9seX7+a0T3qFmC+G0Y4pJU5O7H07DFHtx75Hk6S++PLr5W4nass1FK/RDbUv
	oOCYdnOcWYS/H85h9U+lzsTx7MOTGF6uWfxqkT0ZeCu1fsTLy2OpypYDG6Fk8+EXi3yj2ny1VXO
	o5VwtxVyyyTgRW2l5U3V55GlPlLCcVH+TUH6+dw4WJ2Zn1cFlWIA48qG5TUF9vq6NJZC1Jtg7kA
	c1z+C1cuqLi2sx9iVsmoflmJ7aM2c8ZVwNTOd4uOmXg/XqH/uQjsYIX9sUSLevFRwlf6NBsPDFJ
	OS0iL
X-Received: by 2002:a05:701b:21c3:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b3c02fdb4fmr3591375c88.9.1794446764133;
        Wed, 11 Nov 2026 17:26:04 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm20110159c88.2.2026.11.11.17.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:26:03 -0800 (PST)
Message-ID: <c52e7b57-9d40-456c-a2f6-545c0bca9b46@gmail.com>
Date: Thu, 12 Nov 2026 09:26:00 +0800
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
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, conor+dt@kernel.org, cwweng@nuvoton.com,
 devicetree@vger.kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com,
 robh@kernel.org
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
 <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
 <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Andy Shevchenko 於 2026/11/11 下午 10:05 寫道:
> On Tue, Nov 10, 2026 at 08:08:03PM -0600, Victor Chernyakin wrote:
> 
> ...
> 
>>> +	if (!num_channels)
>>> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
>>> +
>>> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
>>> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
>>> +
>>> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
>>> +				sizeof(*channels), GFP_KERNEL);
>>
>> Couldn't size_add() just be regular +?
>> (Question to Andy who originally suggested it)
>> We've just checked that num_channels is small and won't overflow.
> 
> While that's true, the other aspect(s) of this is in play. Namely we want to
> have the same pattern over the kernel that makes code robust (tomorrow some
> cases can be modified unnoticed with opening such an issue again) along with
> the potential of finding those patterns and update in case of mass-updates
> of low-level API, and I have heard for the matter of fact that devm_*alloc*()
> are in the plans to move to something like k*alloc_obj*() or k*alloc_flex().
> 

Thanks Victor and Andy for the discussion.

I'll keep size_add() for consistency and future-proofing, as Andy suggested.

Thanks,
Chi-Wen

