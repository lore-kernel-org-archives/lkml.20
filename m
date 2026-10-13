Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1E3D667D;
	Tue, 13 Oct 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884051; cv=none; b=logkZZEwuFzYmy772RN0JnJUrisQyuGlxBDIQrP9maY27R0HOdZfYVOTE7D6jMjXYrUBPJClnCGXq9o87ykR64Kr548636U4/Vg/6U8xpyx3+vhQB56dQyQ8f/YkhStTSJw/fKzvughRmXkY2U7RX9XjnsMEJreVOStOAkUR/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884051; c=relaxed/simple;
	bh=cp7N8ckHf6XYI46zPE7vhku4Cmn3iyfpZZa1m4ykJqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioBHxX6VDrlBbvScYNP8yzXHM/Kv+kbcvbHMePja0JZ3+KLKmfCWzZXGT2WfGfOYbINBSKcf/+8CqyxYxt5eSB/dZwQDKXJGFGVnw9SPDtExJmsL+HIm0wTbWTQ3VnEmDVfuPvend81fBac+zhFCDDXyisLNjKU9jYHF6OlXIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhHvIb82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhHvIb82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF031F00893;
	Tue, 13 Oct 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884050;
	bh=S2rMpVXuXZB3WRdRKxL7b0OEx8ULZVVDKPPaqYnOA/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hhHvIb82W7LfGfsoDenctHqkuLvnaJL/alRRu5j/a23ESLOmyj7dImjA4fz/d5WQS
	 jny06343Gc/HXeIbln7wwwdUWAcVJVFFQafgLXa7r1LpBhXDxHud6E4o+Vgiz/U+Hj
	 /Pg+QF0A4fHM/LXvBLGMU+FeqG8gwSnHIXpYDLguLByFejXr+Qg09gQvctR/Rt04k4
	 EbZtsgVI1+sjUD8KGJFstUxt0rXWcvMviR26BkpMDS2ORyUDxJBwKE+3Yyzgf4uB84
	 SegR1+bnzGngyNToiY1JpKhx58r43cUqpNHyt0y/uzkXverON0V38jaogAG4J7IN+o
	 Gmnb2wge2jFhQ==
Message-ID: <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Date: Tue, 13 Oct 2026 11:34:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
 Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
 <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2026 11:32, Ruchira Revdekar wrote:
> Hi Krzysztof,
> 
> On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
>> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>>
>>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>>
>>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>
>> No, this did not happen.
>>
>> Please do not add inapplicable/fake tags.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Apologies. The tag was added based on internal validation but Nirmesh
> had not yet formally posted it to the mailing list at the time of
> submission. That was a mistake on our part.
> 
> Nirmesh has since replied to this thread with his formal Tested-by:
> 
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> 
> will include it correctly in v3. The same applies to the identical
> tag in patch 2.

Again, this did not happen, otherwise explain me how did you execute
this code on the device during your "formal validation".

Best regards,
Krzysztof
