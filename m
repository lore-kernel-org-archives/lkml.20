Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576588;
	b=gXoB3MB2GaEAHH3s3Ez5nn6W87chDHZ/We3TxwqTCL9ioooXGZiTsbSuGx2amQMvSIeY
	 0xsOCU6CL5+5VBz/8Qpd2+HgmblP/mmIC+a9rzmHfEqk69SHSVZqOVt+Fb9o0kGiyCnp0
	 FahrWik5ZhsvxX0u5E9vf0R9Pe/Q3ZEnWpwZuRzGgHZ+yXcUCNI6fpYhXNkTMMF/vcJs7
	 YfPaipF95HQCLgfhbLvszj7NQJSJIUEqAUYUryVrMCJCwJkwIHRf5fjGqPx0uFt7txZjP
	 62RQetpOSUdjfqx5OtJqvpmR91i9+AIQFQz9776bQxS0P3RmX2ErNBl+hW9r5Xjy4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576588;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GovTyvydkVkQrCGZJ5TyYvPpzcYH6KA5p9NlJ4kAQIs=;
	b=fyly/BEmvTxw+B+4//c/1CIj3gGPNXRwKqXdNpGpDLkuc+A5RfolKoSg4nMZnUsCn01a
	 3wK7ZVW+Uj9dXlFvQtxXJj+IPQ/c/8rowJtrFaVIS0pjjfIbE+WE+zGu2Av4AJkz4jTUq
	 YXCkNQvqx1dvjahlBR0OOi2iNhy00KBi63yGl9vP0+rv4FydCStqcdgTQ5S79I0OPnBrg
	 dUquXsWF4u6h+v603vSwTAFKXFlC9+LLqOEufrRcVavL8xKO7ixn/98giS75l316kwmRa
	 hfkB4whpdWp61LuT7Jol3nISDkLmFchtmR9v8JxQtEtkcZckbcag7On/7Hih/0e3sqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=EF7PKa36;
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9E606A89B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA9E606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=EF7PKa36
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fhhvaKaF0+C06GIQnzgQPEoqdFIJSGlkTUn8H9rIHNM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794576585; v=1; x=1795181385;
 b=EF7PKa362tPelz+tq20jjG0cOKYDPORaPArw2Fnjk5ikOOMtb2dzeZMA/a1ptUQIHGaJ1vJ8
 t6sScc/UVWYjZUekicRdLPqrU/6MrRdIAlmiS++CkDQzo+OegB9j698qLjL6/8HhrPS4xdjRRgc
 Ydj6hcP+qpzoLb5CyYqy4xhzA0V6mrYEcOpmIYz0rCAyoLuHvun3LXnStuRIWrj+CN8lfU+jUAI
 aLcHvT451J5hyN7C0cIIWb+EwN39Z8CJRzVl7cKKYPLbruwP4YmKXpE3sFvdU+Mfi14PMzLdbyp
 td6nrRqW8dCPu43k6aQk5pQdoJKmDe+Kcf2ILknQOy2Qw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0231a53ba74ca531;
	Fri, 13 Nov 2026 13:29:44 +0000
X-Mizu-Trace-ID: 0231a53ba74ca531
X-Migadu-Flow: FLOW_OUT
Message-ID: <f354e6b0-c4ce-44f0-b315-60895e90ec3d@packett.cool>
Date: Fri, 13 Nov 2026 10:29:36 -0300
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
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Reza Kurniawan <imkyufie@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
 <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/13/26 10:09 AM, Ulf Hansson wrote:
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41 AM Reza Kurniawan <imkyufie@gmail.com> wrote:
>> From: Alejandro Tafalla <atafalla@dnyon.com>
>>
>> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
>> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
>> call is rejected with NOT_SUPPORTED.
>>
>> PSCI provides no call to read back the current suspend mode, so the OS
>> cannot tell which mode the firmware is operating in or why the switch
>> is rejected.
>>
>> Add an optional flag that tells the OS not to issue
>> PSCI_SET_SUSPEND_MODE on such firmware.
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?
>
> [..]

Updating low-level FW in retail devices just doesn't happen, sadly. 
Can't be done by the user, IIUC not even if Qualcomm wanted to help out, 
because firmware is signed by the OEM and won't load w/o that signature.

And OEMs, well.. we can't even get the vendors for modern high-end 
laptops to pull important bug fixes from Qcom.. Thinkpad X13s still 
requires that stupid arm64.nopauth workaround, retail Hamoa laptops all 
struggle with the DC ZVA crash/reset 
(https://github.com/icecream95/x1e-crash) that no one from the Qcom 
IoT/Linux world has ever encountered because of different firmware 
apparently, and so on..

MSM8917/MSM8937 are found in decade old low-end mobile e-waste, only 
could be updated by force if someone finds a bug in firmware secure boot :)


Thanks,
~val

