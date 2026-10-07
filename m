Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619374E1C70
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399343; cv=none; b=mjAuF28B7YgmaQ3o/TLICcxumwyD2SggEmkqrhJGtf/2AYmSBKq6epSf5WfbwA377yjRR39DSjxuEYzIY8V+jGtwAlaquIbcNm1eieVNydJpc2gDsywlPgBCh1QukzmRQ+ZRcEbErEUiGn7XgfPd7/2y5uUuBVjK71j3EuznyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399343; c=relaxed/simple;
	bh=NawfysQwVd6S7oix4jACaVQ2tu52ubs3uEDYi3x7Z4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHqvgszYCG8D7tbBnmuaCBvwVK7qOm3RUKLliWkXFxk4zCwFm0r+FEOl8j9ob8Cb/paOKErjjLyRy8iX8PoP6hFYPOqtq4pTAkOqNSILB4xc5BufPSifnFJOT3VzJQXLSVBYj5h+3cq9Ow2PgKkK63ajYM2xlMN4FKTgaTNwKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cirsLo45; arc=none smtp.client-ip=91.218.175.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cirsLo45"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NawfysQwVd6S7oix4jACaVQ2tu52ubs3uEDYi3x7Z4M=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791399338; v=1; x=1792004138;
 b=cirsLo45FAZyWK5HLGdKvS9N0Y8DXff6ap4cAE6ap3TgNFeOq14Eg2gI6bpevDoc4zhB8tqa
 AAOg7+A1EOdxPHK391Ori31j52wYWH5hbE4jwHrmPIcJgrOEKoMfkqXrpg/OW4e6XydVJr1CRXz
 coxbWdZO3NTKqvYTBjt8gEXRpo8b46YWixuLm7gbcpr6Wps7RXVTkvFiOMZqHlWenpvHMr7/Njd
 uNf+pUnvGSEjsByNv4lwDVTwuUG50M/Czhc6q/kS0gYC5vQ0faNK+hmkKSBtiFguBG5wWdoyB7U
 uWwZNTaHifGz17X9uOKiGZz//FtV85OVsGNdofR2dHyMA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44251fd1fed4f74b;
	Wed, 07 Oct 2026 18:55:28 +0000
X-Mizu-Trace-ID: 44251fd1fed4f74b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d0e24121-49f2-4002-ad4f-bf96f6fc0861@packett.cool>
Date: Wed, 7 Oct 2026 15:55:22 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/6/26 6:15 AM, Sudeep Holla wrote:
> On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
>> Some domain idle states require system-wide coordination and should not be
>> selected during regular CPU idle. However those states remain valid for
>> system-wide suspend like s2idle.
>>
>> Add a per-state system_state boolean and populate it from the system-state
>> property. Make the genpd governor skip these states during CPU idle. Leave
>> the system wide suspend path unchanged so s2idle can select them.
> Instead of this I am thinking if we can QoS cpu latency setting and block
> system level states normally. Since s2idle is user driven, it should be
> controllable via user-space and we don't have to define bindings again
> if systems that use platform-coordinated needs this too. They may not
> use domain-idle-states.

Messing with latency sounds like a hack. It seems like some system-level 
states are just explicitly provided for runtime idle while others are 
only intended for system suspend. That intention should be 
captured/documented by the device tree explicitly as well.

I don't have access to HW docs but according to someone who did some 
digging on Windows, it seems to be this way, e.g. on Hamoa Windows 
enters system SS1 / "LPI" (0x02000154) at runtime all the time, but 
reserves system SS3 / "DRIPS" (0x0200c354) for system suspend:

"A Windows WPR trace (Kernel-Processor-Power |PlatformIdleVeto|) showed 
that Windows never enters DRIPS while the screen is on. The PEP vetoes 
it (reasons 4/5/8) and only allows platform.SS1. DRIPS is used only in 
Modern Standby."

~val

