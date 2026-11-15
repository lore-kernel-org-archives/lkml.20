Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773158;
	b=tl6/NIEtCnOx597bVBdjTSCjY+AIHd8kP9gstzzwg9PXVUICZAZKt46NClN96P7rkKt9
	 /asOmT4v5EMUCsIL+YeTwZMZ/0jzh7YVK6MkqGznBlqLjdIXupn55Jc1+uces5vn1VMUM
	 JpHi8tBFhwWzOjyORWllILnpGMeIMPvjSvFaw33Sy2l2I8ao4hxq2iTekT3s60/soE6QL
	 glji+z+7t7WhJqsf/hJ0VzqED8RPPTIFpwDVg9+rdF+DpL+4A7ouY3mBdIuzuENw/Mx0H
	 n1IqqNOG3qTzUcMWMIfTxiDlvL/R5D7PnZTNuySh9e2e+aZEyPDMDjv/z6SwbbQq3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773158;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eWwfsTolxLJA8BVml4235iBRUpdWo6uvgRUtVXadtys=;
	b=xDfq64a4F0RC1pOaBKiH6Y/Emb7EqhjaqvtvkJSDtbhBiBSeosmLN5JEGDE8eXC4zQeS
	 4fUxRRliiK/BK1ZWTw5rmMYzyX/hU5ibx7wUkSKtrSG0rezWT/HDJ6/4W0K0Ds3ssBA2n
	 0M8IOrY+gkPZX8VNvzaR3fAQxdw9YIv3rMAUmueb8AvT2WAAf1CBl1IO3uQdJ7tH2YVcC
	 JfW7A4jbSgxqj+ynTESQdW+AAAFQ1LdQmbLs2/sUJeoFgj8K+t1cmcsjiZW5SYJ7lUeUk
	 R12YiJUbHMYQKAkqkFmwBVYSics22f+BPleL7y6AW3ey9cA4cE7DEPh9SX0eF2cABeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fB48p3Ap;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D4606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fB48p3Ap
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ijOToy8EljdLsjoi8ZJtYrR6lEoFQJoUfCvn7kC5+ps=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794773154; v=1; x=1795377954;
 b=fB48p3Ap4fYrqqPG4Vg2+ZpK9XYAJYvckKxwAeqIQoeMKsPdKgdTnTJpQZfK5hdiXahK9CqK
 Dq74cu4pXMRs8NCkqXO3c4jhcWUFI6BiQJBWFyXu2IKpgSjIWvOn+h01X+4B2oaFlC3EtdHPP9v
 oNJJLf3p8nK3iN1/lgYDYxQOv5sbF26TEu8v9I9CVjTWbxwaC3nSr9jz8y0KCbLBf8fSmbdnLhk
 7nSfxssPlMnDb6L3z618zelUfyC2xmsTkkVnNNv/FdsQ34COhIn+jiub9nINClW6vs5wTMR3zxc
 6WZ50zVb7YdnT8Ji3wSIZOflLLxNfbBcR22W88v6vlJ7Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 386f8cf8c4842d84;
	Sun, 15 Nov 2026 20:05:54 +0000
X-Mizu-Trace-ID: 386f8cf8c4842d84
X-Migadu-Flow: FLOW_OUT
Message-ID: <d8415f6d-3324-4e3a-905b-7ea8c39bd2c4@packett.cool>
Date: Sun, 15 Nov 2026 17:05:46 -0300
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
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback voltage/bypass/mode
 set during bootup
From: Val Packett <val@packett.cool>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
 <5b2yo644hjtnyue42da6zltxpai2hlod3verxbkecbmmaw2ktj@6qhufjoik7kw>
 <14bb6196-8274-4c94-922e-4ec8e2d7f2e5@oss.qualcomm.com>
 <648ae82b-edda-42e1-b5b2-522a791d6bdb@packett.cool>
Content-Language: en-US
In-Reply-To: <648ae82b-edda-42e1-b5b2-522a791d6bdb@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/4/26 7:15 PM, Val Packett wrote:
> Hi,
>
> On 9/8/26 4:46 AM, Konrad Dybcio wrote:
>> [..]
>>> do you see the problem with the rpmh_read() or in the voltage range 
>>> check?
>> Applying
>>
>> 20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com
>>
>> I get:
>>
>> [   12.735771] qcom_rpmh RSC:apps_rsc
>> [   12.739294] qcom_rpmh Request: tcs-in-use:YES state=2 
>> wait_for_compl=1
>> [   12.749622] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 
>> irq-sts:WAITING]
>> [   12.763769] qcom_rpmh        CMD=0 [addr=0x43100(VRM/smpc8) 
>> data=0x7 resp-required sts=triggered+sent-to-aoss]
>> [   12.781024] qcom_rpmh Request: tcs-in-use:YES state=2 
>> wait_for_compl=1
>> [   12.797493] qcom_rpmh TCS=1 [ctrlr-sts:BUSY amc-mode:0x1010000 
>> irq-sts:WAITING]
>> [   12.811733] qcom_rpmh        CMD=0 [addr=0x40000(VRM/smpa5) 
>> data=0x0 resp-required sts=triggered+sent-to-aoss]
>> [   12.829006] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
>> [   12.843942] qcom_rpmh Completion is not done
>> [   12.853536] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond
>>
>> Neither S8C nor S5A are "special", neither of them feeds an
>> ARC resource (at a glance, anyway)
>>
>> so it's the read part,
>>
>> RPMH_REGULATOR_REG_VRM_VOLTAGE and RPMH_REGULATOR_REG_VRM_MODE stall
>>
>> RPMH_REGULATOR_REG_ENABLE interestingly doesn't
>
> This happens with some LDOs on sc8180x as well…
>
> I've been getting the "failed to read VOLTAGE ret = -110" error when 
> enabling the L14A LDO (for cameras on the Surface Pro X). (And that 
> breaks the entire boot)
>
> With the "Skip read requests on unsupported platforms" patch, instead 
> of that I get an error exactly like this one above, when it's being 
> set to high power mode.
>
> Even patching out the *writes* to mode/voltage specifically for ldo14, 
> rpmh_regulator_set_enable_state on ldo14 crashes/stalls aoss (and at 
> least in some dt configurations, boot proceeds but wifi/usb break) :(
>
> But S5A, L7A, L9A, L12A were listed there normally from the start and 
> never had this issue. S5A here did not have an issue even with the 
> read code enabled. 

..So apparently, the "weird" LDOs work when controlled directly 
over SPMI, rather than by talking to AOSS:

https://github.com/linux-surface/surface-pro-x/issues/55#issuecomment-6872761348

They have a very different address in cmd-db than the AOSS-owned ones.

Now the question is, is this 8180 specific or is it exactly the same on 
8150?

> ~val
