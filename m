Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45617423786;
	Tue,  8 Sep 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860409; cv=none; b=cksAKlPO2vNHeK/1dh2/4hv86M3aCRZ+HabzvaS5LnJDPrqJs/gob2xZ4Mpkifh8RnW/g95tdwG+4z/i3oTFsDD2facau6MNkAJT7Yo7g+5UlPYMxXeefYGsFF+f8ByngimU2XVTuWCmiNHmUp2HEWwlT3fPXLIWDtNie+79OBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860409; c=relaxed/simple;
	bh=Fk0kAPLiE59Bae1wl7rvNGfaKXuJWJD2nQcqbQl/PBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvBieacSNs95/yKaDIPb6ylOry1x8vENv/TxhcxBfg1nByFi2BkTNx6Sjq/im47ZngXrmDUD5nMzTSpNWcxjRvBIIHjVpIHY2yQ3Syo9Oc36+GlRixrQxHonsG/vXKSCYz83IFjoO8uhbkY1RjYcDCzF1u5Pu/VUnn03AMkdvDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=kH5pVu/C; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="kH5pVu/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788860395; x=1789465195;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Fk0kAPLiE59Bae1wl7rvNGfaKXuJWJD2nQcqbQl/PBQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kH5pVu/CkN8IMYmqYcueNyu1Hg5SrLvGsyAq0nNRwyZrfXy7vNHGVMAtoShnmM1P
	 sOcwPeBic3FddByWzxtmkTNzn2n+TYeI+VndkBd02bDr9Uc+lFXp67AUy1jDb0F+F
	 vRrRtMD64Jj6diGcanZQi/UacRcY5O4lNMF6RTdySRlU8OfvtxsdrqiIKYlKKtZ9a
	 pwibD2/Sq92pejn0jV9vDh8uStb5CMLMoRm1N3XpJM7ZZZSLkjnutFbimjLsK1P4r
	 3e9cyOU30vHvB/uwcMCWlXuuHpOdNy57HqL03VKJK3ZiSFz5EQV/wv4s/7p+RDlTx
	 d0idZfT84H0BOdSnyw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N8VkX-1wqD4E24jB-018AdM; Tue, 08
 Sep 2026 11:39:55 +0200
Message-ID: <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 11:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ap_PdUrwLIVGJ3oG@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cfAUSRl8AGcLYbstoya/W13tCt2eO+Pyjsrg5ZZR9vDTzxYOrQ0
 EafFQ1R3MbDowstmeoRQv8yttGT0SyzOnr9ymbIoRn9bJGfzd3x1SuD263i7iqzvqDP6Yhw
 n4XJQ9H8UqhYgkPzl+D1iRu/YzpMnDGBfq7MrLYvRanuz6XU9AZdXfFjURIGcP7sYpf/yCy
 uPFuiukXDh4u6PH2smGLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uDyiNOGbqkI=;4PkjzD8tyPUwoxcI5klYkdNo4/7
 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

Hi Mostafa,

On 9/8/26 11:03, Mostafa Saleh wrote:
> Hi Jens,
>
> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
>> chassis, different silicon. Stubble and the DTB loader need distinct
>> compatibles.
>>
[...]
>> This series does not apply to ToT nor I can find this base-commit
>> in it.
>>
>> Does that have any dependency?
>>
>> Thanks,
>> Mostafa

No dependencies. But I test if i can apply to torvalds/master

with best regards

Jens


