Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92329B228;
	Tue,  8 Sep 2026 05:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845691; cv=none; b=lx9Ffhua1heHJrnbeewYvks09EqiOSZT1KJSxZESQNge3wGZoftjr7CEbzOARDNKHbaNYmNYjr5I9V/uhjEqn24ICB6J1jXBYnTyULySvxvCteg/WwxrTh6iUmj9H63IQL+2GFPSWGrXpxtp8VzeVY1g98HLSR0mvSV1gzgb6sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845691; c=relaxed/simple;
	bh=wbOlDwSsYz7wK5NlJvIkB5Bp3Raxeb/RoPIVkyDiwJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpuwxNTTi8QrgSKuSrcjc9MTx9Gmq+w+ejhvoFQNleHmdfArtUuKBdyk+4DblCBmMpAKyH6d5R/P/2COc20rVsBmHZwchUPQYd/zJcg5VzyptwBayX1iOuGKjK0GckIlBk0HBpYKV5KqGzXYj68C1RZVZukbRXxNy+yVHpU9Nek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=M0eSpha9; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="M0eSpha9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788845681; x=1789450481;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=wbOlDwSsYz7wK5NlJvIkB5Bp3Raxeb/RoPIVkyDiwJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=M0eSpha9fzmcS6aR6XIon0KZUi8Nh/HIWDWrJBHLWc+vS0qrt66KgCjzOjQabq3m
	 mFdIM0d+37lSHMZPcaG9QL8m1zQ28gE1NIcLI0XlxzefnqrE8ExSNPqL69kslbBqm
	 aGV1BbTnI+wmAD4bfbN8C8ugI7GEW/D1fL+U/tc4Edg1p/+8BE8HqWqLqtX6xCIiw
	 8VC6sYYfFga5CD8Wnt90NwZItqNMuMXmtu4jPmT+e0CqW8Y+1Ow6DCzFvEbNi9WtC
	 HUeXv/jxYHJiK76GxOJ7CJhdiyCGA1VexHpEr4xMSo4xsZX2s5A+p2sjpAItiNkjK
	 VnirmXSDaULwyRRfVA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLAF0-1xKvWn1ycc-00S1FK; Tue, 08
 Sep 2026 07:09:27 +0200
Message-ID: <3204c334-b77c-4c6e-9224-2c104cf50603@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 07:09:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: ideacentre-mini: Wire up DP sound
 names and VA macro
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
 <1db9a798-4935-4fe7-a2a7-a66791e75a6a@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <1db9a798-4935-4fe7-a2a7-a66791e75a6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zK8eiaehOx1zjkSQ3F8oJRXCTdDQZTTJ2q47idY9bzqvwlmdtjs
 G4y6rnlRimx4pB+E1YTe3GonurcycN3Ie4s8kuDob1PUb9fu5nCOeGTCvZfAselLwaYbrlK
 XxdV3z3AdobTLIseuH7FtEv2F01teGqQ2azsZZwv9WPOj4WhTE2//WE93iqd1GgS/r9sowU
 BaryehvCLaFbPZnQQsDEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YQ3x6XVUFvg=;qLc4m/+1dNAT8fbByxqwW4fK/wH
 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

Hi Konrad,

On 07.09.26 10:55, Konrad Dybcio wrote:
> On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> mdss_dp0/1/2 had no sound-name-prefix, so the three DisplayPort
>> backends were not distinct DAIs on the card. Add the prefixes.
> That's now part of the SoC DTSI
>
> Konrad

Yep. Will be reduced to vamacro only in V2.

with best regards

Jens

