Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925939;
	b=jqVSH9wgY3ctxtG2CLc0jgc+kZ7igsO5BO+YOwmJSyUxn82Wn+1w0SH0FP+AJ2qFbxGu
	 PpKBIazlH+kZCPNrUvXzhRTqxmp9i0Mb1t63QFyVWTieGD2qIUuiCtJKQIhoD82jNoqyo
	 iRizcT3rTma1dmv7/NXgGMJ75W2YLKLG7VrInlJmUT2zCDtbCS/jsTyyGnbIhSeNi0SYy
	 Krv6Orswhbdbuvk0PxF2WXCEESdtXWmqgBSDXm9mzNgUQlnibCtBlnDyKc4eyPE5SPZaU
	 HYYtgcxswDSYXn9VdcOhplASZ+AlmwGmyYpj0WyOOkkotxBceKpjGWwpSHNHAxS3WSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925939;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lAoigsXFf7M/yibkKbnUHhQT3j3jKMVmefA5lOY4trI=;
	b=caKToWGf4m+vYQUPaaTM135S5VlBB0jomRDeDFglzMHPjMWDpcWAEg2N41i0f4lGjWLy
	 xwt6gjVEt5KhphKzDtoS4GmlRpiAsNRC6zqfcl3gDdHGRdze8TpOsaDmRVH8ufXMlXPvB
	 MhQLA9e/J0H5BUZ/zDpudWvPfyOWKAlp+N64/ekgXYBs+Xw+xdCDWyVQv4XBSNInB5DaB
	 hP0bbhvE4CQ0L/VIifGsiZj2kCoEVVcOt2kiGqENf7Mo76forZwPHMJoAIdq6ty0yxA9g
	 T2m6VKHt5mOiuHA9NB9AJZSflJ/65tHoqR8RmvxalvxID5alWTs0fy8C3bdPB0d00pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChPoefq+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA35606A323;
	Tue, 17 Nov 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChPoefq+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1201F000C5;
	Tue, 17 Nov 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794925938;
	bh=lAoigsXFf7M/yibkKbnUHhQT3j3jKMVmefA5lOY4trI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ChPoefq+x4qiVkQnlZzPxjrq0rPP1Hxs1FwjrlqmQ3Ej1A/FGCSWV24MrnyE67NVd
	 zwotUju+txYF7P1DN6AnR1H0DHc45dHybFSxRVdvqjLzkhdnPTJBtOqVRPrO6rraGW
	 0tEvQ1T/Gx2IE1Mavk1J5lms8ilTXPMo67GJQdXP3TO5TJ52BFeE1nn3X+p2m/JV2/
	 tTElOhxKRUVHA9bqnpJAqPW8eENF9/ceArsGyEhNVHT/Tv6Wp2McIEYaysc1RS9WaO
	 mTStax5H0VXyOn98EZIGa/CX8+HSf1HMnT8Sb+QIGzQduBjLmF/oq+uYdNmGj0+Ymg
	 x2YMlkgLq3Ujw==
Message-ID: <2412a591-1612-4fd1-a806-7918a3df98af@kernel.org>
Date: Tue, 17 Nov 2026 15:31:44 +0100
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
Subject: Re: [PATCH v2 20/22] arm64: dts: apple: t8103: Add USB4 ACIO and NHI
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-20-1f80085f93fb@kernel.org>
 <ef65915b-7a61-4f59-926c-375d654ce2d0@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <ef65915b-7a61-4f59-926c-375d654ce2d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.11.26 13:39, Krzysztof Kozlowski wrote:
> On 06/09/2026 20:36, Sven Peter wrote:
>> Add the ACIO host router, NHI, DART and M3 mailbox nodes for both Type-C
>> ports on t8103 and connect the host routers to the Type-C connectors.
>> Also describe the USB3 path from each host router to its DWC3 controller
>> so the NHI driver can create the required device link.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi |  95 ++++++++++++++-
>>   arch/arm64/boot/dts/apple/t8103.dtsi      | 184 ++++++++++++++++++++++++++++++
>>   2 files changed, 277 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> index 686fb1dd215d..01c942b0a75b 100644
>> --- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> @@ -17,6 +17,10 @@ aliases {
>>   		wifi0 = &wifi0;
>>   		atcphy0 = &atcphy0;
>>   		atcphy1 = &atcphy1;
>> +		usb4-0-acio = &usb4_0_acio;
>> +		usb4-0-nhi = &usb4_0_nhi;
>> +		usb4-1-acio = &usb4_1_acio;
>> +		usb4-1-nhi = &usb4_1_nhi;
> 
> Sorry, but what is this all atcphy and usb4-foo doing here? You do not
> get own undocumented aliases.
> 
> How did this sneaked through... where do you have DT bindings maintainer
> acks on this ABI?

Huh, I just wasn't aware of any specific requirements for aliases and 
thought they were just there for convenience.

But sure, I can just drop them and identify the correct nodes to which 
we have to copy tunables in our bootloader by just walking the fdt 
instead, no need to change anything in the dt-bindings for that (either 
in this series or the atcphy one)



Sven
