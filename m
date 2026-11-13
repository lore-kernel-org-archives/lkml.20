Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576604;
	b=a/K0NGpxfU7w1MHyYX2Rma14SCunKQx5Tv4Q61OVZHg1CHAuTPfpD7O/+lnxJ/BK+ym9
	 xQxs/RWOXHRlQhmPklfJoX+/+QvfyD8rulGJ34hbrwlpqAnRjXwPw5AGCw1CIKdzkcaF7
	 2vqW1Qlvti0NB2W5lNBMDTX9nSHHWBjrs8DwcYgUfga2xHYAOxGeI9k5afR1pa774iJKQ
	 lDILGY0s3a6LK8cJO29irviGOg1Rn7SWLGCV3PL2dgz5OuILOa4N2/xtPLM9C7DvBefqv
	 a0cb3ikrq0M6KnYUkL4BSNC2jRK8+nODH55IBaJDoQV3Uld5aF61FG1ZmwQZYA3unvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576604;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wb5FBhaU1PjfGzzqxVF56o7Nk1l974fRGfDZvMXyK+g=;
	b=BKqBWA1J+g/BIEwu0NrOLZJ5ehGHh7HDRNoT1FJKdSYgLcfrNgBqjWN4d7TkVPvZtKrP
	 11oTjb6zrDwR+XhPfNzkQQFHg5UKHARDGxaXtGst3VZa/0kY2prakSl0eiHT52jF6l5Lb
	 01h0p8J96fUVTJelHjelhD8Rq+T61MlWl32iRQHfQmgeNcR+wW+AFrl/W+qLhxpn3P29B
	 u0R6e4pP8KgJDbQL2n6fHqhCWTpBZ0lfHTG/rqS2zo+NQb1VfVtv0LU28EsS/ZKTDmgeF
	 Okgyfvcnvkt3h0PLCEkDCLobqJp7R2yB7IJGXIPmy2ZXU4kJHXwk4r55dxRmEQ6a6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PpZJ/sHu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A5606D488;
	Fri, 13 Nov 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpZJ/sHu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72811F000C5;
	Fri, 13 Nov 2026 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576603;
	bh=wb5FBhaU1PjfGzzqxVF56o7Nk1l974fRGfDZvMXyK+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PpZJ/sHuhN+dYOPuirA0hAGDb5wfAd/1im45NSkkkCKuJZCeIRmXHAup6MX+1j3qH
	 HB2z9upMxMAGi+eI7slkBAOBV+r9EghA/ZtwzVXZSbMmlbY3CeVsjhw25BggKtMHR0
	 ZjRUhipXP0TG/9o1OmKIjbnArwoNC/67bfBbUDCJQ8zMMyfMPpLX3E5DDeBVMuN77o
	 LIpEegXNjAm7YmRtoWaq4dpAnAvsJ3RfPcq9hEoHS13PUUgA2MqdhcuDHjfdRYemQE
	 4luHFZW7TYsDDTZFdzoN0KyxIxDRyc2yhAPu5Dpu+RRC2GbkwzxqIuNxU1FFR+d5V2
	 1gj7fvzsBURkg==
Message-ID: <2440a2e6-5d06-4642-b722-ac3baf5b8097@kernel.org>
Date: Fri, 13 Nov 2026 07:29:59 -0600
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
Subject: Re: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
 niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-2-dinguyen@kernel.org>
 <20261113-laughing-crouching-hawk-5bccca@quoll>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261113-laughing-crouching-hawk-5bccca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 11/13/26 02:18, Krzysztof Kozlowski wrote:
> On Thu, Nov 12, 2026 at 03:53:40PM -0600, Dinh Nguyen wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: altr,socfpga-agilex5-ecc-manager
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 1
>> +          maxItems: 7
> 
> Why is this flexible? Wasn't before and changelog explains nothing.
> 
Sorry, but I'm having difficulty understanding your comment here. 
Doesn't the minItems as 1 specify that the 
"altr,socfpga-agilex5-ecc-manager" must have at least 1 interrupts 
specified, and up to 7?

My changelog also specifies "up to 7 named interrupts".

Thanks,
Dinh
