Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F594D8DA9;
	Tue,  8 Sep 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860071; cv=none; b=eHXChunZwM0psIfpu6Nmbvxm7ppekXyxb5uxt7+MaKARzL2Oo58I4Ea1mliHMgG0mbsjHWf3oYBbjGwmtA3au9ceS01mAA0M+Lpx1EAAj8C7561TjLn/MGoG3wA4d2MVSlafOXGmo5lhrVaiFCCe84UvXk5Ukg8WdxOpPyiKL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860071; c=relaxed/simple;
	bh=hZCNiaMsNa2UncySgR1wa0NX/XH9wMn4ysNd3Mjs368=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj1fL0k4Yl7Maj8/dqUb3A/KSy6QL5SJVtrlkZ2JonxKy9KBeu/IpogpMYL/ajAVe8upW3RcdsOdPRD8ZW1XuLP0On1akQwDqvJw1bSKfBi0MNEN0e3XYnqGTkaUH9FgLlrPSzgz5gBLrbvEBgo7Nm9z27yaYYsD/ilZHQ0jKb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=QXhWQoGD; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="QXhWQoGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788860062; x=1789464862;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=hZCNiaMsNa2UncySgR1wa0NX/XH9wMn4ysNd3Mjs368=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QXhWQoGDBj4CO0XeHZDYaBxhebvQ/d3RnRYBhfqaKZEq1IOATnYaPaRG/FW6hO8W
	 b3YGg8GB7hcpHr4DkSVNq78JZvlR/L9YXoherR7hmEJTqBUp29B2U2QP7Ig9HgJys
	 HOkzgwPfZ+/Gl4S90MjaF0vKThSKSuO/82Yfo5hGum4eHtGYlQqDtZhk3gQc6uUtX
	 d1rNQsBYclH/vKQlW2++wtPGehP+LIGanVelsF4OSEZQNBBeGxBu/YaiijSSF3kdi
	 kxN9CL/GmQbJeJJhmT15FMcdOW+kg3EGwRVKRqyvJXZLroW9dZGZo3C/DLqvO8iGg
	 1EgxwjFX13G3slSiWA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7Qkv-1wmupc3ipB-00vp1z; Tue, 08
 Sep 2026 11:34:21 +0200
Message-ID: <7a135d39-282f-48e2-b20b-742a85485619@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 11:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Krzysztof Kozlowski <krzk@kernel.org>, Mostafa Saleh <smostafa@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cEcxvcrFkLCdoQIdwjjCSLnEsOUoO3tG4IQg60y8YNRxZjrxFXK
 Y1/qlWnlyIfAs/AsbhC5bZY6cAxZuqAyjlyCyYBkmzahXFY9i8QDnnUgDPp3Vd3WNnJ1gaH
 wzlYz/TArjr2oLSE8ZhQowCgZxSiF4Qfmky/AW90Dg9LTnGKqoY3nmgMEeLDWing6garTXs
 DdsTyKR7ZoVB+z4ArFjOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+plAFsiW0V4=;iD9nxjt94ztL0QqojuASGO7iQ/o
 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

Hi,

On 9/8/26 11:05, Krzysztof Kozlowski wrote:
> On 08/09/2026 11:03, Mostafa Saleh wrote:
>> Hi Jens,
>>
>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrot=
e:
[...]
>>> ---
>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
>> This series does not apply to ToT nor I can find this base-commit
>> in it.
> It's a public/standard commit, next.
>
> What is ToT in upstream development?

Tip of Tree (of torvalds/master) would be my guess. I have used=20
linux-next/2026-09-04.

with best regards

Jens

