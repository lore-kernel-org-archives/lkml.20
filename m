Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411843;
	b=GRfztecC9bJOdyzF+YpCfSJxJmaqgU0nHH9Vxb45Q3t358RaeJky//MBW/76RwlF8ew8
	 e8Ii7SVUXNa6oyml+jRxBC1LNMehazN6hKucNCD1jiTYdpb8glP8zLRCGCyJR0mx8eqa9
	 TdDmIr+649Ovmxm3pPRUWySVAxbiQUYRlioqkBf5xxZ4tIBj84GkoyOeIGlBP/87siXbP
	 8N21b2YFPH3Hxw8gf4umVZYzNS9qU8JjilMyrdMicsh7wSfQ5WF0Ccuu9rdOgVv4GJkTk
	 MWwG2P3qtuEdpBVO/skh3JWhFvTPckSw4+On+EFsSblACIQheGqPdwvL/Izp9y/40bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411843;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sGZsPOiIfmsPmYtcqZWbb30z+VsRcrH1VH92p1yDihA=;
	b=C5cmBoRcTMgYQE3oiPMjAvaimX92DvkY3eGCDQocNuoE3zCS46iegFcuC8CNrFS1cAVu
	 +MA0cxNxlmvWFF5Pa2qauc/zQL+xaMPkJeZn0sHLh17eayDlhOEmpQCdR5KWwq2c/VXQl
	 pt92uiUFK3TXFu/zqwc0nDC9pNZWlrTDQZPtksNf4samvYjs84NQ6e7TWxUxghVrdMouR
	 63b6vBDs+OMuEuxGEQZyfgmSzyHJUWnI18FgIlg3bmHgyl8dQ2j1YGIBXZQPiLWkaebL4
	 SlKYB/8Wl7GS90mh0RScLztKDMW9tVhURYMuZjB4Tm1LzTYf1FnrBzSblZ8751YSnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnwKN41t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC7606A337;
	Wed, 11 Nov 2026 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnwKN41t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5711F00A07;
	Wed, 11 Nov 2026 15:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411843;
	bh=sGZsPOiIfmsPmYtcqZWbb30z+VsRcrH1VH92p1yDihA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bnwKN41tiMDWegJQL3lMFUN/kBXPGY7tkOpwBLMR9dSbQqcNASqYAn4QfxFahHdwH
	 eG/OzF0E/7tQ8SiCLwkeoPaZLRRznXMYvUdVifHqaN+mVXxgIqEV9GBgKCoZWKvPnh
	 2vTX7TBbVLMIy5xLv9l3O7ajuS+iKYEcigzD83F7g4UZittxQ3OE66EsJzSn76iqwU
	 6ik7h2vHF5BoApmoeG4BoQni2cwH7KjK+QUs4OQueKvUJeux9vNhsaecGT4ddRjPku
	 tUoknm/9chw3n69iZvspFGOZhtcTa9o9MYiJI7iafCtFJ9Qa+qe+H/rrCYmg7GEqPK
	 oCYQpHH2BXI2A==
Message-ID: <2b277604-0452-41c7-b0a3-f6f935d802fd@kernel.org>
Date: Wed, 11 Nov 2026 09:44:01 -0600
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
Subject: Re: [PATCHv2 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
 niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261109162523.1698129-1-dinguyen@kernel.org>
 <20261109162523.1698129-2-dinguyen@kernel.org>
 <20261111-tunneling-elated-grouse-1f8bf7@quoll>
 <9d87c457-d692-4c55-835b-796029a5e54b@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <9d87c457-d692-4c55-835b-796029a5e54b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/26 06:04, Krzysztof Kozlowski wrote:
> On 11/11/2026 13:02, Krzysztof Kozlowski wrote:
>> On Mon, Nov 09, 2026 at 10:25:21AM -0600, Dinh Nguyen wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: altr,socfpga-agilex5-ecc-manager
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 7
>>
>> minItems
>>
>> Also, missing constraint for interrupt-names.
>>
>>> +      required:
>>> +        - interrupt-names
>>> +    else:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 2
>>
>> interrupt-names: false
>>
> 
> And I already asked for this which you did not respond to.
> 

Apologies for missing that. All comments will be addressed in v3.

Thanks,
Dinh

