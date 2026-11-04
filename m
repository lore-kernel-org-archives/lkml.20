Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830571;
	b=HRC5XLWUVfcH1n5Xyony7mivSfCGtU/QER40BN5yy2K3Luj3/1usuUfqUpLCb7ns30aE
	 gzgKBNie0MiJwqRPS9VqA63HPswNXhQhGGZD+ixfLQxM5lG9X4oR4rYLxd5gt1nQelYnn
	 KIdn7SHZ3V+5Ie1d5VWe0CWWq+FJdpaNIJsnp6gqew5bRyQATUR1YpYK+3EE/9MWTb6/N
	 zNI2pKjPfbDUkKWg5WNLSZXsp+rG1Q110NI2i+EsRGveuiVamhbpj7oOrFfm6uhbOKCZU
	 ZRMHlReb7cL05NhEHxX8u1QY4K4PuGuuEIwpM603RL+DMLlHtBNSO2+lCkRj4k5Ay6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830571;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=j9Rufr4Hs1JO0y9U1COsDcSj8+g2/5xz85GRfteT5Sk=;
	b=cMEzI+0OGoUrUzI/CZ3PimX1pfczzYBYoHND/+5+EAr7isPFCpOdsiavdoFNWVTOLuJW
	 hNIkPOJe/imBYAOgHQher4yQxvP4Yptz+60vBVoz8cB9lItQ2G26kMGu41La8pXAcNmf/
	 MUaxDIByxe37OOcHQtm/siYIRRo8+vwEH6VKM5htzBEBdEqb1Pos882ol4Kqe6Fzjj0sf
	 nT+RwMBiJQnHyNTbEhOrx/42Pd1oh+4ZWNptMzDB0ipvN0Z5HeNu5afdZh0YdWB9YwrW3
	 OmDTeGxkhB7lk/uSzRAYOP3kXlVejMqjx3ng2t3zjFYmJ5yklUR06kK/fnl5m9Oj+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ug71nNHV;
	arc=none smtp.remote-ip=95.215.58.117
Received: from mta1.migadu.com (out-117.mta1.migadu.com [95.215.58.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79B606AB22
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED79B606AB22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ug71nNHV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ImSXfR9ngIu3UEz6sbn6M4yfwE7dlZrkCsVOFv9NUHg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793830567; v=1; x=1794435367;
 b=ug71nNHVXzCpxDF+L9Vfqsfl9KY6RjkN5M6kckMhmwq4dgWMMDgyIZdFaS59TIlXpgjgk7e9
 dEOCKEb7C7yZ18C3TfOkg4hYvX48vWFifQLaugD+4irVGd60Xy/H2cfrwtElvxl4IvqAOJe5WXu
 50MfmQvLpMWnEg9T1fWiCkKCkL4ZLEbZvO6GWzZOJKZjUkZvrzbpgN8mPuoE8nCQvz7lm+b8nbE
 s3qVlqByQtbSFgmq3txK3fMxficniOCGiws0xV4+FMWa/2C8x+051x6qZqEOAp1wp680PN/tk9X
 WvD18Q30JDkd/ch1ztcUfsLybYsUU17EJDg/bpX2NTPbg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9d75a789143152f3;
	Wed, 04 Nov 2026 22:16:05 +0000
X-Mizu-Trace-ID: 9d75a789143152f3
X-Migadu-Flow: FLOW_OUT
Message-ID: <648ae82b-edda-42e1-b5b2-522a791d6bdb@packett.cool>
Date: Wed, 4 Nov 2026 19:15:56 -0300
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
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <14bb6196-8274-4c94-922e-4ec8e2d7f2e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/8/26 4:46 AM, Konrad Dybcio wrote:
> [..]
>> do you see the problem with the rpmh_read() or in the voltage range check?
> Applying
>
> 20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com
>
> I get:
>
> [   12.735771] qcom_rpmh RSC:apps_rsc
> [   12.739294] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
> [   12.749622] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
> [   12.763769] qcom_rpmh        CMD=0 [addr=0x43100(VRM/smpc8) data=0x7 resp-required sts=triggered+sent-to-aoss]
> [   12.781024] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
> [   12.797493] qcom_rpmh TCS=1 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
> [   12.811733] qcom_rpmh        CMD=0 [addr=0x40000(VRM/smpa5) data=0x0 resp-required sts=triggered+sent-to-aoss]
> [   12.829006] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
> [   12.843942] qcom_rpmh Completion is not done
> [   12.853536] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond
>
> Neither S8C nor S5A are "special", neither of them feeds an
> ARC resource (at a glance, anyway)
>
> so it's the read part,
>
> RPMH_REGULATOR_REG_VRM_VOLTAGE and RPMH_REGULATOR_REG_VRM_MODE stall
>
> RPMH_REGULATOR_REG_ENABLE interestingly doesn't

This happens with some LDOs on sc8180x as well…

I've been getting the "failed to read VOLTAGE ret = -110" error when 
enabling the L14A LDO (for cameras on the Surface Pro X). (And that 
breaks the entire boot)

With the "Skip read requests on unsupported platforms" patch, instead of 
that I get an error exactly like this one above, when it's being set to 
high power mode.

Even patching out the *writes* to mode/voltage specifically for ldo14, 
rpmh_regulator_set_enable_state on ldo14 crashes/stalls aoss (and at 
least in some dt configurations, boot proceeds but wifi/usb break) :(

But S5A, L7A, L9A, L12A were listed there normally from the start and 
never had this issue. S5A here did not have an issue even with the read 
code enabled.


~val

