Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793426405;
	b=aRm82sU+bMxtOAnXvly7PRX1BhUw94s3LkGW9KcLp95wcg7/2D4HjHxVx9ymye0IV2eA
	 ZUmCU2y9F54/bATUbr7s5JtAzgmlu/E4KOEFg8LDa5z992ZMYvCnlmGY2Zt1Iit2tczIX
	 bTGUHllMzDgrc+W6L3Tqawf0cuzeV/lWtrpfXosTJMMTed3EEBjZQnkD9o8tKHR9IxzD4
	 5jXFuTrT4GKhe8JbbHrBKUbMJ3hC8bFTlzavxcYDpj1upmG7LCN9rlJILRMlBhSpel00L
	 zO7u+hCHD2+7JH06psv+iw7nwTnRbExelXiqCN8PIun+mh03o5qLfjE/mXdjRjSV8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426405;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ZQUUU5NV48jFxmhLwXwoUwGKDKvh6scuO/M6jetNByI=;
	b=h9wcymJoJMiqIsqC34PWZAIfIzjsookvWjZSKOyEL2TeV3V+wBTFNG3oOCC9kNreyGOi
	 OCvFFg6KzvUnmUHGTjeAjQP/a/SWHuil9VCxmj+1mvjhwMt44da5OWzjiOf9XGRMDB7R4
	 Z9gOlxZ1k16Z21jWjg9BWTnN2jdWrkZaRGfjpyCP7hubMHsFsW2d7vHPaU1JHXDgw+N4w
	 d2DibYTHyJNu7eqUbuP7WZpvdMWCZSKeDr57QQ9WK5p84D/IiKdY50Gv/RXafBPRiVdF2
	 tmUPylDWr0CsnmTNXv3FoekBE1LjkfGyhROQZvwfm5CXlx1NE9TZt3HzcaMLuZglKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MDYQl4JA;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB2606A31A;
	Sat, 31 Oct 2026 06:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MDYQl4JA
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA32B10C023;
	Sat, 31 Oct 2026 06:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793426397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZQUUU5NV48jFxmhLwXwoUwGKDKvh6scuO/M6jetNByI=;
	b=MDYQl4JAL2Ow0vIaYrvXUgbtOXtWCti36l2IM/CQZ57X8mAXKXR1zV9pPAUQN9SAn0GQSN
	FttlfrEjkoxLdzCBPzvKxrLy53OCXRPJ23us2Hcn4CcbbYUG48gPmGcvJASiuOR/HGsG/K
	15DtR11ksWAi+c5esj2dPfZ5AKT+Q7tSF0d32pniSfYCsrxkDMy46vBaNG07hEE0repfwX
	UbMsNaW93y9N6CHWZtAX+L68nftaN9JX0CmUrjMrtIkID3CeS7sZKg16GrQ1+aVfzKzn8f
	FIG1Whji46nfsixQ26NB91ciyAClw2MslChZCb/M0m1A6NCnl2vNCoavRLMUuA==
Message-ID: <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
Date: Sat, 31 Oct 2026 06:59:55 +0100
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
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>, mcoquelin.stm32@gmail.com,
 Thomas BOURGOIN <thomas.bourgoin@st.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lionel.debieve@foss.st.com, amelie.delaunay@foss.st.com,
 patrice.chotard@foss.st.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Stefano Babic <sbabic@nabladev.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/28/26 10:45 AM, Alexandre TORGUE wrote:

Hello all,

> On 9/7/26 11:14, Mateusz Nowicki wrote:
>> OP-TEE implements the STM32MP2 watchdog SMC service with function ID
>> 0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
>> value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
>> bootloader is never refreshed.
>>
>> Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog 
>> support on stm32mp251")
>> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
>> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/ 
>> dts/st/stm32mp231.dtsi
>> index 9e1d240888ff..35e247af957c 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
>> @@ -35,7 +35,7 @@ arm-pmu {
>>       arm_wdt: watchdog {
>>           compatible = "arm,smc-wdt";
>> -        arm,smc-id = <0xb200005a>;
>> +        arm,smc-id = <0xbc000000>;
>>           status = "disabled";
>>       };
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/ 
>> dts/st/stm32mp251.dtsi
>> index 9c63fdb5a885..2dcbba65e298 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -36,7 +36,7 @@ arm-pmu {
>>       arm_wdt: watchdog {
>>           compatible = "arm,smc-wdt";
>> -        arm,smc-id = <0xb200005a>;
>> +        arm,smc-id = <0xbc000000>;
>>           status = "disabled";
>>       };
> 
> Applied on stm32-next.
Since this change, my STM32MP255C board started rebooting after 32 
seconds. It turns out, this is caused by an ABI break.

Here is the thing -- old ST downstream fork of OP-TEE OS did expect ARM 
SMC WDT ID 0xb200005a (that was the ST ecosystem v5), the OP-TEE OS 
4.0.0 fork seems to have handled both, and the new 4.8.0 fork expects 
0xbc000000 ID only and does not handle 0xb200005a .

At this point, with Linux 6.18 the kernel is trying to trigger the WDT 
using SMC ID 0xb200005a , which on my machine works (older OP-TEE OS). 
When I boot linux-next , it is using ID 0xbc000000 and my system reboots 
after 32 seconds. (not even mainline Linux versions are consistent here 
now, sigh)

I actually found this behavior the other way around -- while forward 
porting a system to the new OP-TEE OS 4.8.0 port, which I installed, 
then booted Linux 6.18.y, machine started rebooting (SMC ID mismatch, 
new OP-TEE expects 0xbc000000 and linux-stable sends 0xb200005a), so I 
booted recovery, and ... recovery is also Linux 6.18.y, so I could not 
recover the machine that way anymore.

Currently, I added [1] to OP-TEE OS as a mitigation of this ABI break, 
but I don't think everyone can still update their bootloader stack in 
this way. And with this patch in place (and inconsistency between Linux 
stable 6.18.y and upcoming 7.4.y) the ABI break will cause some serious 
mess.

How shall we deal with this ?

Thank you for your help !

[1] 
https://github.com/STMicroelectronics/optee_os/commit/8450f25923c0c98465decc975f25efed19f82ba0

-- 
Best regards,
Marek Vasut
