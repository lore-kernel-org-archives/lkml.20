Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171514;
	b=BvDoi7E45tN6JU2Sw1HCamdCjeoPlRbkdJtn4LrM1mPNfE6Oa34BjdEGnlQucXo6jtPh
	 DQNN0zSEeaBhsuas8I3k/sOPyKwnaVLrmHpm7eDqYSHtHQ7btpkK36XzqMGssX1sKj2sj
	 /2LB4gK+5TX9o3RPjvoE+CzfGG4BCPYN9CwbjatMZekK3/7xiPjDkgOGNi+G9qlwB+ol9
	 zcBRzAWrRhHWQzshJ03/+kPqJ3rAgfppZNzKN4eXVvaMyjQ6m5+lhW+vf8MEuS1LLycQ9
	 0iCnlUp5G+lGfu5P6Voqsuf9riH73h7vre+6dbQfhXdGmLEFoQdL6SjR5R/sLdYBFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171514;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:
	 Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iJdAfejJSRrDlhZWUiUFsgDUFPRvVO5sQEtFpC6d8Z4=;
	b=JLN5nhF11Lbh4c7cRv2bar87xKRrxoJnDiDLYlfU+NQXGtdDU0C+hNlE8EdN6rnVe6Qn
	 mTjXmZR3t3Li0vQWJU/UT04sau9XxTeMLfBMjoC8CQawmtbwlTCCBSbpxD7RLRliQ0JPc
	 gKNcd5MC4rX2zU0bDqk1rXvPF3MzN/0anQnB/8SBZtfJIQNoMK3v8rb7HBHkCdyj1nn1u
	 lx1xh3WzaEkVn72AtLA9JSf4DlJApbpskug1xchgE5tcsPjkGvr8yOilJwB5/23inURzK
	 DN022YHPComLMyDeduEwgNHu14A8J3UrzRa0/4sZuvnDdwiPVAbiG7NSlqOoy4BbNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=5r2aPQFP;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B2606A31C;
	Sun,  8 Nov 2026 20:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D99B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=5r2aPQFP
Message-ID: <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794171505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iJdAfejJSRrDlhZWUiUFsgDUFPRvVO5sQEtFpC6d8Z4=;
	b=5r2aPQFPr8rJgsaWjzv4JouC6bMQwS9ckhNUDRu6KPWjcuihiDEl5MckaYs+Ei9wL4Tz9p
	NAxQchZLz3fW1TEFYCLgfnhuRNVBgPHzvOA7RKsWV528t6bRHqtoPn/dx+gjojsGHpIC56
	uAmf/uCPtueGQWD898YEr3FZglkbhKM=
Date: Sun, 8 Nov 2026 21:58:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: David Heidelberg <david@ixit.cz>, Frieder Hannenheim
 <git@fhannenheim.net>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
Content-Language: en-US
From: Frieder Hannenheim <mail@fhannenheim.net>
Autocrypt: addr=mail@fhannenheim.net; keydata=
 xjMEaX+iTBYJKwYBBAHaRw8BAQdAjgnNmu6pLzUJq/DD3ZU3tTbKzC2npfFhEK6NYMLRukrN
 KUZyaWVkZXIgSGFubmVuaGVpbSA8bWFpbEBmaGFubmVuaGVpbS5uZXQ+wpAEExYKADgWIQRD
 lxn4P3kTLC9X/iFsAXPIt5MeUwUCaX+iTAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAK
 CRBsAXPIt5MeUzNaAP9KklaL+chH1bUa7To1Pn346guR/N/PkMkyvWgKRs+yzwEA6N2E6TZ6
 CJF8cW6gVaSFmNgGcGZUAw5A5MrUleV5PwPOOARpf6JMEgorBgEEAZdVAQUBAQdA51B2jbQ4
 iUnmggSYEqwukOYQmjBwsyUpc8Wkk9I8qkYDAQgHwngEGBYKACAWIQRDlxn4P3kTLC9X/iFs
 AXPIt5MeUwUCaX+iTAIbDAAKCRBsAXPIt5MeU3oKAQDyZDbjdjzNsJdliBQBkZXuaJDAB1Mn
 59LycSSRsRVCPQEAmNQIItBArt/kiQFu6vC4mXjtM5LzbPLmj/QA26ee2Qk=
In-Reply-To: <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.11.26 21:52, David Heidelberg wrote:
> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>> Add compatible for OnePlus 8T
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/ 
>> Documentation/devicetree/bindings/arm/qcom.yaml
>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1067,6 +1067,7 @@ properties:
>>         - items:
>>             - enum:
>> +              - oneplus,kebab
> 
> How about oneplus,8t? We can use the non-so-much-confusing product name.
> Looking at existing device-trees it seems customary to use the code name 
of the product for phones. Examples include:
- xiaomi,lavender
- google,sargo
- oneplus,cheeseburger
