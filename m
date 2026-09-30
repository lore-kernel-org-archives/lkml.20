Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6BB27703;
	Wed, 30 Sep 2026 05:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745384; cv=none; b=f/Kp94eyQcI2wpN68ij3ZPTAiXb1+kMjWlCUxXXhugKNMujKR0enyL7qG690PxrxhHqunnWOaKnbOY1RitwtlvLIB4BDrBQCdEapmFKNG9DaNdDqI+xRDnFIXofmhbqlS4vq9wh1zPCA4n48C/hT+0pKU6rhhtXFzUjSSy98oIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745384; c=relaxed/simple;
	bh=hK6mNxHdXq0DC8dDjQn8mHm021jJUPpmmg0SceYXu9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBTw4sKKbbAZ1J5TjiuU0iQQuyBNl3/sP31va4shyfNrHH73wEnpMe57r/b664qZ3cFzJvJ0/88Yparqh04qikj09MeXGNad73fnBQgYZwWUYumTZfiYseaZ/sotJVG7v5JaX1w1C7vk8uh1XHK4lwUcZGvoC/n07H6OthSKYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA22HlaA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA22HlaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68821F000FF;
	Wed, 30 Sep 2026 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790745382;
	bh=eQleIxJOBPv1KRFntodHoZ79/WxPDKFPhFZNfK7ap0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BA22HlaA5E3F7+u4XMqXTPdWQH0WWR+QICpy7gO+ug23l98iIzIbURSbMIcF7itwc
	 ackm2dnn0Mci2l8Q6i51HM/fc6BE6gbK95z+bwtmWoaUUc+mVzqwc0iKcQSInz1vWq
	 opl50ikHBVAwSmIeY5NSOlYdN0qlOn+HVMy8O97Ihz2T3g7Cv4rTs2t1x8kNudWY6o
	 cU1gzIuy5As8hHXxV4Xiw0iLbbsYnXk6aLDjqMG7M7QiX51JmOPTMNTSjJ/O1DoGjE
	 RlX02A2YhKV2UJNSged+SRrPA+9Ja0fDNuRVo+GTfolHieJ1672L+0ZNOdqe21ij+8
	 dVzUe/i4bUayw==
Message-ID: <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
Date: Wed, 30 Sep 2026 07:16:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
 <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
 <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2026 12:49, Zhangfei Gao wrote:
> Hi, Krzysztof
> 
> On Mon, Sep 28, 2026 at 6:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
>>> On Wed, Sep 23, 2026 at 8:04 AM Mohd Ayaan Anwar
>>> <mohd.anwar@oss.qualcomm.com> wrote:
>>>>
>>>> This series adds support for the Ethernet SerDes found on the Qualcomm
>>>> Nord SoC.
>>>>
>>>> Nord uses a QMP v7 SerDes block, which is an updated version of the
>>>> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
>>>> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
>>>> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
>>>> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
>>>>
>>>> The series can be broadly divided into three parts:
>>>>
>>>>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
>>>>   2. Prepare the driver for PHY modes which require different SerDes
>>>>      programming and readiness checks. Existing SA8775P behaviour is
>>>>      unchanged.
>>>>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
>>>>      sequence and readiness checks required for USXGMII and 10GBASE-R.
>>>>
>>>> The changes have been tested on the Nord Ride SX platform, which has a
>>>> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
>>>>
>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>> ---
>>>> Mohd Ayaan Anwar (3):
>>>>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatible
>>>>       phy: qcom: sgmii-eth: prepare for additional PHY modes
>>>>       phy: qcom: sgmii-eth: add Nord USXGMII support
>>>>
>>>>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
>>>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 ++++++++++++++++++---
>>>>  5 files changed, 219 insertions(+), 24 deletions(-)
>>>> ---
>>>> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
>>>> change-id: 20260923-nord_ethernet_serdes-c486f715f383
>>>>
>>>> Best regards,
>>>> --
>>>> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>
>>>
>>> Good Job，
>>>
>>> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>>
>> This has to stop.
>>
>> Why again adding fake testing to the bindings? You cannot reply twice?
> Reply twice since I thought they are two different patch set, one is phy,

You don't even try to understand the problem.

> the other is net, while net maintainer said that is too ealry for rfc.
> 
> The tested branch is
> https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
> 9.24-eth), and may keep testing for each cycle.
> contianing dts, phy, net and all required patchset, assuming one
> integrated branch will be easier for interal track.
> The dts will be send later.
> Testing hardware is ride and rrd.
> 

Explain HOW did you test the bindings in terms of Linux kernel testing.

Then explain WHY you cannot give the tag only to appropriate places,
instead of blanket one.


Best regards,
Krzysztof
