Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609203AC0E7;
	Mon, 21 Sep 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019253; cv=none; b=NaMrC6vVgxcNDS/hLlY2cJr33I2GnL2a/V6rVAlZYlL7ok1zpp51DgWR/ZDBPIqSP3w44W4hLuXO6KDCBZnCcRCZQ1dZXujBkuSaLSTyXgpwtNlTBSQQxaaa+1smZrC7Uo2bWGKznMgV35C3XAWqOh+bufxFFffh89f0P2AiKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019253; c=relaxed/simple;
	bh=lo1KGIe43KIxj33azO3+I0NtBNamGrBs8H0NCVBDZ1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I1UyaAknlypBqxU+Lx8M0eJRpz7DyLptgkyjhE3q7hNnARoSf7NbS2vRU/u05MBnXE+HAGQCqOcKohR0xeZGADskdNo6RI3QhmBWvQbrQ0oLXvBjsEzJJuIU5s/qIDR/0J6tcyjIxKeMP+sw7fkTsXZ+teuNWxOdlyqJwykb2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4mL7IBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4mL7IBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42AA1F000FF;
	Mon, 21 Sep 2026 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019251;
	bh=cHitpSwt77tjtW81X3MjJUOb384DHBJRc9knAkrAfeA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=G4mL7IBPUYYoEHAxfumSOZ9RTnLTDyFwyt2N24vqHDl6prgPw9KkCK77KiRFiOph0
	 fZOdFwis1iiydcIUkoQv4VE7paBRYxhupNir7kejXTGIo4wRCUtdhdcbPh2GqywH7z
	 l64zFpH9g6DG7JxHUGJc/d9s9XxqhRa0aCuZUhP2TEV4nOcLJYaeyXFYPVzwpIIRTk
	 BjtRVFAyZd8T52OQGGSxFX20WTX6MlS5yCMiNdp0dJiUzP+2tLo6iy/1Q+kwjS847c
	 j8j3Z33Zbw8LRFCsLOmdUEY6qYAJBSNcjaqEvlR2ZW5G6uNB6Q7+ct0Pi3Vx47cMke
	 X865Hclm7eg6g==
Message-ID: <dfc8df6c-170f-4aae-b949-e8f147bfed96@kernel.org>
Date: Mon, 21 Sep 2026 14:34:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH v3 0/4] stratix10: Add Interrupt support for
 asynchronous communication with SDM
Content-Language: en-US
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1786600929.git.tze.yee.ng@altera.com>
 <SJ0PR03MB5950C6799C40C5724B048197A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
 <a7641b0d-ff7e-451f-834b-23514e6789fd@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <a7641b0d-ff7e-451f-834b-23514e6789fd@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/26 01:40, NG, TZE YEE wrote:
> On 21/9/2026 2:37 pm, NG, TZE YEE wrote:
>>
>> *From:* NG, TZE YEE
>> *Sent:* Thursday, August 13, 2026 2:35 PM
>> *To:* Dinh Nguyen <dinguyen@kernel.org>; Rob Herring 
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor 
>> Dooley <conor+dt@kernel.org>; Rao, Mahesh <mahesh.rao@altera.com>; 
>> linux- kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; 
>> devicetree@vger.kernel.org <devicetree@vger.kernel.org>
>> *Subject:* [PATCH v3 0/4] stratix10: Add Interrupt support for 
>> asynchronous communication with SDM
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> This patch-set adds support for interrupt from Secure Device Manager 
>> (SDM)
>> to Stratix10 SoC for asynchronous communication.
>>
>> Following things are added in this patch-set:
>> - Add support for interrupt from SDM to Stratix10 SoC.
>> - Add documentation for SDM interrupt in Stratix10 SoC.
>> - Enable SDM interrupt in Stratix10 SoC.
>> - Enable SDM interrupt in Agilex SoC.
>>
>> I am taking over this series from Mahesh Rao and posting v3 on his 
>> behalf.
>> Reference:
>> https://lore.kernel.org/r/20250812-sip_svc_irq- 
>> v2-0-53098e11705a@altera.com <https:// 
>> nam10.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250812-sip_svc_irq- 
>> v2-0-53098e11705a%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657134969%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=hOumheIvzlbZt1UApZy2F9CCpJFiH25iWSaYeCcdjKo%3D&reserved=0>
>>
>> Changes in v3:
>> - Reflow commit message body to ~75 columns (fix Dinh's comment in v2
>>    review)
>> - Add a newline before stratix10_async_workqueue_handler
>>    description (fix Dinh's comment in v2 review)
>> - Treat of_irq_get() failure as irq <= 0, since 0 is also a
>>    failing value (fix Dinh's comment in v2 review)
>> - Fix IRQ disable race: only call disable_irq_nosync() when
>>    queue_work() newly queues work, and disable the fired irq
>>    argument rather than actrl->irq
>> - Do not invoke client callbacks under trx_list_lock; copy
>>    cb/cb_arg under the lock and call the callback after unlock
>> - Use disable_irq() + flush_work() + devm_free_irq() on
>>    teardown, and treat unset IRQ as 0
>> - Demote successful IRQ registration log from dev_alert() to
>>    dev_info(), and demote async poll failure log from
>>    dev_err() to dev_dbg()
>> - Clarify INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ kdoc to match
>>    a1-a4 bitmap usage
>> - Drop Reviewed-by: Matthew Gerlach from all patches
>>    (no longer at Altera)
>> - Link to RESEND v2:
>> https://lore.kernel.org/r/20250812-sip_svc_irq- 
>> v2-0-53098e11705a@altera.com <https:// 
>> nam10.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250812-sip_svc_irq- 
>> v2-0-53098e11705a%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657165509%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uDzBqNLWQSLSTmXyM72mbyHy5JfchKhk9a6xhrFF5pc%3D&reserved=0>
>>
>> Changes in v2:
>> - Separated from the larger SIP SVC upstream series into a
>>    dedicated interrupt-support series as requested
>> - Link to v1:
>> https://lore.kernel.org/r/20250722-sip_svc_irq-v1-0- 
>> c5b9e02c1ce6@altera.com <https:// 
>> nam10.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250722-sip_svc_irq-v1-0- 
>> c5b9e02c1ce6%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657185496%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=dSLMGTCQPtY6nHXWwKPeen2XIuPzs1vZ6NKBcMYVwEA%3D&reserved=0>
>>
>> Mahesh Rao (4):
>>    dt-bindings: firmware: Add interrupt specification for Intel Stratix
>>      10 Service Layer.
>>    dts: stratix10: Add support for SDM mailbox interrupt for Intel
>>      Stratix10 SoC FPGA.
>>    dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex
>>      SoC FPGA.
>>    firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt
>>
>>   .../firmware/intel,stratix10-svc.yaml         |  10 ++
>>   .../boot/dts/altera/socfpga_stratix10.dtsi    |   4 +
>>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |   2 +
>>   drivers/firmware/stratix10-svc.c              | 135 ++++++++++++++++--
>>   include/linux/firmware/intel/stratix10-smc.h  |  21 +++
>>   5 files changed, 161 insertions(+), 11 deletions(-)
>>
>> -- 
>> 2.43.7
>>
> 
> Hi,
> 
> Gentle ping on this patch. It has been over a month with no feedback.
> 
Thanks for the ping. All patches applied!

Dinh
