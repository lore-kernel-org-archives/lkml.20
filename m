Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641640;
	b=zfKbqvlsq+IC40F+JxPo2flLPJgk9p/EI/BsU35CPuUvbuOLjh9Lc4MUbuXFtu9z2BKB
	 xbiN+z63WH9ZxK7/eCUYZrz87sGM2AGlMCMnwC7mCMCbJpYRHFA6Y6SFwXxWEib99jhel
	 zXZ9wLCEHML/zhSsbi1xz4dYaocOJxqho85AJBtB9iAeBoDqFYCAws8s+ynCct7/MVCjq
	 6bbMBHx+MWXBBhhModGznF97y0ErCo245opXZKdZLceXHZzKsd1D6wJeeS2Vxd5/E5Shj
	 t0bdis6YfYwZTsi9QD2bGksrJlrsPRfAilIARXyu08ipXNOewl9VALCqmIIgnnNAMrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641640;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=skQyLbajY/JdnR4E6uMtkLCcC4Gk80WNRunpYsHQRok=;
	b=UX3z2Jl0hTnrN6u9FpcLrhRw7oe+bA3vVAeFXn3m2BofRIEs9Sd/JtAIH5jcpVDbw5O5
	 2j8H6fZuFDwr2kqhK3gCiR2xSHFpNxXrMdZCwjrTVZsvG/9r8f2wVH/45pJb5LJAHHbVW
	 zbziOduAmS9s4NrGAP5TyOYlf604P3XH8+HqYiDBKZy0mOaeVE7qoSp8jM1wzYzVhIRot
	 Vo4kbDqtaU5aqyiPzholuLGWCr2xITWL/NtmMuCTZMbsPvZ3Mv0c/GeTLSdw49WCtWo5O
	 Q6BoC1ONRlIAkcdK4+0cIPI38fYKV+Pc/jmqr0/V9PKhfAPgWUWZUhXTvOfwal4hwHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9821BeG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AE606A329;
	Sat, 14 Nov 2026 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9821BeG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8081F000C4;
	Sat, 14 Nov 2026 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794641639;
	bh=skQyLbajY/JdnR4E6uMtkLCcC4Gk80WNRunpYsHQRok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j9821BeGF9glXFemfEqa1hJoxeskWujtRLwXUa9jq8/QlGCxdgAEJu4fiMpcOSWhm
	 ++428UKU67Bi52gw04UhPe4GIy8hF1T1T8rWhHbtfeZXNTJwbhaGsw/mBe4m3p8Ixh
	 6n2PCB9imMGxNgIxHi4dJF1MgVYwkJTdSYjoQ5qqyNOwiKiHRRVBsVkaQ1wjmCy2j6
	 hFCNy02jbNpRlMCpa74PGzjoDFKszzZqqNbvSfsGQSOBew5IXEMsgRCoxE8N0gKeMK
	 jZbKVvliaROMODRBx7SMx8UEPsD4H3/fyMw10UP5PGS0fxs5CU47te6bMLP7n+ZCbD
	 ly4gxWANPAOLg==
Message-ID: <a84e2db6-17d5-455a-9b3a-eb3d787ce92c@kernel.org>
Date: Sat, 14 Nov 2026 08:33:53 +0100
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
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
To: Rosen Penev <rosenp@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111034418.194610-1-rosenp@gmail.com>
 <20261113-gabby-vigorous-dragon-6a2fed@quoll>
 <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2026 22:34, Rosen Penev wrote:
> On Fri, Nov 13, 2026 at 3:11 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
>>> ath10k PCI devices can be described as children of their PCI host
>>> bridge, for example to supply the MAC address and calibration data
>>> through nvmem cells. The only compatible for that was "qcom,ath10k",
>>> but the generic PCI device schema requires a node under a PCI bus to
>>> carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
>>> validation.
>>>
>>> Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
>>> ath9k and ath11k PCI bindings already do.
>>
>> We do not need to least all PCI devices here. Were is any actual DTS
>> user of these?
> I have some WIP patches that include the QCA988X. Reason for it is
> nvram calibration and MAC lookup.
> 
> This is basically copy/paste of what's already present in ath9k.yaml.
> 
> AFAIK this came up because of dtbs_check

It cannot come as dtbs_check result, because there are no DTS with these.

Best regards,
Krzysztof
