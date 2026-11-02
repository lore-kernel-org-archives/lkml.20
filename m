Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650322;
	b=eGsuBrocQQQvrl+Ql8hG+82iI6LdSFB6JCQHwULqI0wVGYYZrP9TeH4s71GkOTgfZGOQ
	 s3wQ3ROmxoPlebVtU9QeaorYPUUM4eYjARaDwt7C4xxvpLrwecGj5G+1drb+oeWTEy9PI
	 za5mSwaSGkk4ZrEGzLPmATwN8fFN2HqBVuo+0TF9oAP4wdCTcilOL7ePb3RCI4I3N3IB5
	 3UWofdKZC0iGuzacN+supKHR9uQyBU1tl6Vi14hLajzhEvmFk+nFBNHbf+UiWju7vkl7C
	 aQ9R5rPMj79rl56rBmaMOWcnfh2Tk4vbF0NorWBR/3g2QyrJUnS4JEWu0T4+91hA2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650322;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=ooVkNjORrZgSba8ld1qrv4TAWTmp+Mq4v6vJgAJRcuY=;
	b=hyJy/RUd6j9xcopuT9LY2wgRW4HtDTvwG7q+7rpuhNNx19LFKjEXm7O4QOdea9CFfzy2
	 jdByxslgjHuashOfXU3z9gRt8+yOO+EovMjIXYmfuF508Wfh5Aw67mxLLVTOeQIiup5oV
	 RtAV2vAXfZNypYy/iu52J2hSy8DUFjoq8Mm258PSGVhRFdP1+AIGtPUR2wLsMhrey1ZfA
	 E6ssw/qOCvQFkyVS3C/6yA3KZ+Q0cf4VnKAySYcpzI5Au6G1Zgc7DNd8RVvhaGWal7Dau
	 jm45iTHTcGMBB5yEgmzrjacWGuNKT88X7H4M+AFOheIJaZsJqLywxZcdYlO4VygR71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=J5uuMyvB;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=DlvNQeXY;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD50606A330;
	Mon,  2 Nov 2026 20:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD50606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=J5uuMyvB;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=DlvNQeXY
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793650293; bh=ooVkNjORrZgSba8ld1qrv4T
	AWTmp+Mq4v6vJgAJRcuY=; b=J5uuMyvB0j8+fnnIEA5+blJO0xOjNA6dhLpOwpclL9kJpaC0Tm
	8LK8Udvpnr0wv8evtfO5mH+HUCfb4ZwEqdyEUWw7mFP24R3pGwm59KRAIgDy9QRAOb2mnukLywL
	0660CA6K7wEYBRdCGYj0C4cNgJeqSRXyfo9MdgW1cxFHD4r0ssTTGfVFu4XWh9CYRcKzoHIy7AS
	C2J7EP8gep42piUJmtZHEmNBU6rVHAD43SFsjSE6pROOJmAwbYSSMakMl1VlQG83PIKuljNL3KP
	dDZSbc1Pl7aKJWjehAM35wqwK40Vie0bdq+GdKfhAw1VEFr1xAZf7iaQaMuUbeQQxsQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793650293; bh=ooVkNjORrZgSba8ld1qrv4T
	AWTmp+Mq4v6vJgAJRcuY=; b=DlvNQeXYdySbukhI3ezy0aeC1O7mihjZhRE+/kthxIG0im6cUY
	RI9/hdW99mOi/rtxxbS6OcWbNWPcQIfH5XAg==;
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 02 Nov 2026 21:11:33 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Amir Hanip <killdeath104@gmail.com>, abelvesa@kernel.org,
 andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, a39skl@gmail.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
In-Reply-To: <f4c2b984-e255-457a-9b39-f797b840cac4@oss.qualcomm.com>
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
 <20261101164930.17976-1-killdeath104@gmail.com>
 <9304e75396496855881251cac2edb0a5@mainlining.org>
 <f4c2b984-e255-457a-9b39-f797b840cac4@oss.qualcomm.com>
Message-ID: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-02 11:44, Konrad Dybcio wrote:
> On 11/1/26 8:44 PM, Barnabás Czémán wrote:
>> On 2026-11-01 17:49, Amir Hanip wrote:
>>> On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
>>>> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
>>>> (lemon) basically is a lime with NFC.
>>>> So i think it would be better make a common base from lemon's
>>>> devicetree instead of making the same devicetree again for the
>>>> different variants where only the compatible and the model property
>>>> will be the difference.
>>>> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
>>>> for Redmi Note 8 (ginkgo) and 8T (willow).
>>> 
>>> Hi Barnabas, Adam,
>>> 
>>> Thanks for the review, that makes sense. I am preparing a v3 that
>>> moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
>>> and has both lemon and citrus include it. I used the name lime-common
>>> following your naming. Happy to rename it.
>>> 
>>> Plan for v3:
>>> 1. dt-bindings (unchanged)
>>> 2. lemon: move the shared nodes into the common dtsi, no functional
>>>    change intended
>>> 3. citrus on top of the common dtsi
>>> 
>>> I can only test citrus. I do not own a Redmi 9T, so lemon is untested
>>> on hardware. Instead, I compared the lemon DTS before and after the
>>> split, normalized with dtc (dtc -I dts -O dts -s). The only
>>> difference is the numbering of two auto-generated phandles. I will
>>> describe the check in the cover letter. Adam,
>>> would you be able to test lemon once v3 is posted, or look at the
>>> split beforehand?
>>> 
>>> The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
>>> on both, so they now live in the common dtsi.
>>> 
>>> I kept the following per variant because I cannot tell whether they
>>> are real hardware differences or just differences between the stock
>>> firmware images:
>>> 
>>> - ADSP carve-out: 0x53800000/0x2200000 on citrus, 
>>> 0x53400000/0x2600000
>>>   on lemon. Both regions end at 0x55a00000, so only the start and
>>>   size differ. I can only confirm that the citrus value works on my
>>>   device.
>> If there are no overlaps the bigger range could work for both of them.
> 
> Waste of precious RAM!
I have checked it seems lemon have same adsp region like citrus.
`pil_adsp_region@53800000`
> 
> Konrad
