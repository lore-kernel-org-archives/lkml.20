Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514391;
	b=vpzV7Ye8kEOdYDiebGBhn0nOTixFXjnY17nnBASyololI2D0qYpKLK2614dWYossG3Cr
	 m7qPRpPxmSWiqMsEH1hHGK3knf3NJOXR57h7MnmFdGdrDgaaEeYXvEhjPkqxz4y7j8WK9
	 6fm/AbQkxntV9TT0n6SO7L+IBgtSldh4WE/CQM8x/nkYamJlMeuWBq1IxR3UyD4QN5fXW
	 Zfhm3jSRbH8/j/Veb3re8xQJ/dltrQCr8eZSbde26ic0FUCa7dF+e/G6QMmsnFkZO09rv
	 +zwHIQBkjMpLkRj/9JjrQ8X/h1u95FB4r2GV1WxEQ359zH/kNZo5635KHhLtIY7rUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514391;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gv6kUfncabuP+ZVdtrbbHCGIexNhvbwVVXmfviemsuk=;
	b=N6pIrzYMTHJCEO7O4o5dwbZh04q/62DRGvkv+R6n8pLbWi1+uGek4kdOUYC2W0nqMP6k
	 Xy59dtdF6SJh8iEpVLjy+TeQyk+HpUMnVIz92ZKaTLwun0JRGcRAyhR4IVxj6qR5xKm/D
	 8cQVkckEMgQFoSPrKu3RcnxybD2JAQm64KGuTQ80zFf4BrphQhly7ZgmYxIL5T6ec/qZW
	 jPDacyxaGoiDpUeDMW35smiB/EWk19THsrVpvi2uzhJsS2bpePN0bIzeV3YT6XnQho9rG
	 +Q74SZgajx+lp9UnudJ7Zu0exvFTKZhO5SdjHyFgrFLNxahom9OwvdrY0ULpaoFONnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iutMHWw4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02E606A31C;
	Thu, 12 Nov 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iutMHWw4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550A31F000C4;
	Thu, 12 Nov 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514390;
	bh=gv6kUfncabuP+ZVdtrbbHCGIexNhvbwVVXmfviemsuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iutMHWw4g7rhbFZrf/orTMdre66B/MthrJTwTXM219nq7BedireH7yePdiNPbYVUP
	 lbwHLVbSSyOjfMLoezwIKRtiKG7hsakyp68BkgoYV8VSM6RT+/JN5XYkskxNSyFNzU
	 NnFVsWBEzRNDPaBD97qFnqVGdET0yDtPO+Lm1/F9lO5BNSCgq423YWQ5+HkI0dg+Hb
	 vcLkU9pMVZSN7wUq4sGtTgTeYhNzquwNFLTliF5ik7JhIs4OcnMm5lLO6DhRkLMMrY
	 fbPGIJtFtzSILwkWoc2l2ZmT1Nki/AELfvexs16Hnxtyw8dwsHQJp2ODqzrratLOF2
	 kHe24GslBVztA==
Message-ID: <46821acb-2db9-42e1-b93d-8b6d39f259eb@kernel.org>
Date: Thu, 12 Nov 2026 21:13:03 +0100
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
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021022446.3619435-1-robh@kernel.org>
 <avWbmsjkYo2LMJKs@parshuram> <20261112125346.GA3821108-robh@kernel.org>
 <avX9Qrcapcnutdgh@baldur>
 <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
In-Reply-To: <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2026 20:22, Rob Herring wrote:
> On Thu, Nov 12, 2026 at 12:30 PM Bjorn Andersson <andersson@kernel.org> wrote:


(replying only to parts of the message)


> 
>>> Can the QCom folks stop doing that! Coordinate applying the series or
>>> take the binding and dts changes in 1 tree.
>>
>> I assume you're referring to "QCom folks" in the sense "any maintainer
>> touching a binding change related to a qcom platform"?
> 
> No, primarily you and the submitter I guess. Submitters should be
> aware of dependencies in their series and suggest how things are
> merged. Otherwise, it falls on you to care that warnings are getting
> introduced.

We all have been swamped with patches and Qualcomm have been probably
the busiest arm64 platform for months now.

for i in arch/arm64/boot/dts/* ; do echo "${i}:$(git log --no-merges
--oneline v7.0..v7.4-rc1 -- $i | wc -l)" ; done

qcom: 1016
freescale: 485
renesas: 215

Qualcomm SoC got one more maintainer, so there is catching up, but
probably not enough.

> 
> I would not care so much when there are transient warnings in next,
> but I don't want to be the one chasing them down. But AFAICT, it's
> always me. No one beats me to it and I'm not all that fast in
> noticing. I just compare all the warnings by platform for Linus vs.
> next with "gl-diff-dtb-warning -p arm64" from this repo[2], and look
> for things moving in the right direction. Of course this is all after
> applying which isn't ideal.

FWIW, I do test all Samsung ones and I look only at some of Qualcomm
boards, because there were just too many warnings to have a clean
dtbs_check for qcom. I do report them to Bjorn/Konrad [1], but that's
indeed only subset of entire qcom ecosystem. I know that a few other SoC
platforms keep track (TI at least).

[1] https://krzk.eu/#/builders/102


> 
>> Do you have some CI/guidance/tooling for Vinod (and other subsystem
>> maintainers) to perform system-wide DT-validation when considering
>> merging a binding change?
> 
> This one is an ABI break because it adds new required properties. I do
> have some tooling that looks for ABI changes, but haven't committed it
> because I haven't figured out the best way to deploy it. I think for
> anything that is an ABI change, the binding and dts files need to go
> in together.
> 
> I think it is time to reconsider the default of bindings go in with
> the driver. That works okay for new bindings as long as the platform
> maintainer doesn't take .dts changes before bindings land (also an
> issue). However, for cases like this, we need the opposite order. We
> need to figure something out because this is only going to be more of
> an issue as we get to warning free (and we are close).

We have been talking about this for some time and recent consensus was
that SoC maintainers can freely take such bindings when driver subsystem
maintainers lag behind. The case here is a bit opposite - driver
subsystem was before SoC.

So let's change the generic recommendation/policy? Whenever patchset
touches bindings and DTS, and the bindings do not need any driver
updates like they add only front-specific compatibles, the SoC should
take entire set?


Best regards,
Krzysztof

