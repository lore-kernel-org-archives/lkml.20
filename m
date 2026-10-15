Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD2E4E01F1;
	Thu, 15 Oct 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056674; cv=none; b=cB1ImKnfP+Y0VcpJMUSf09aidEoeeJWs3HxHDpBQ/s8jz8uplCQhfUGQfAxle7w/ZdVJsT8kGCe7jJVqpxOQVFvfCTBcI2LcYoCjsQce3FpKtl14uR/4CpSmHnuqvlfw+egaL7N75HZQ2NbIYGpnQw8oIhEaTvueqorRpqwNZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056674; c=relaxed/simple;
	bh=NL9N0VW3vdF04JqZH4ay/FVcoHrGDn57nY4y+2dTgA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaidpofjOaXP9kqSDA61DkY7nijCa76Aly36BwJ3iRGg9hBIyJxYmuNtbEXD0KFL+ygx7aaID9AFtjlgRrY5Le7KceTDxDqz7CGZmLCUrR7GSgnnmEHjrI3x8XnrizrVbl/JvwUaebjE9iOmA36iANtGvpWC0yIhfinysOCGc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=HsS7G5z2; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="HsS7G5z2"
Received: from [10.94.176.134] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 900F720B7166;
	Thu, 15 Oct 2026 02:30:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 900F720B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792056662;
	bh=MycHCtKOpCViJUeUQ3alLvxWUMdQesuZvEMWTh9BpTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsS7G5z2YTlyMJh+eltF/Bob62gbHOQPMm0/uY+RUwcHz/a/n9Q7DHaDm6Nf6CLAF
	 79v7iwxOtdcJ0XgDImeJ+bgCeYQWMLG3q3SveAuSHE1Up5OqX4XKoh7C51G/xWqxmn
	 LeFvjc3+6mIVpVxjYBuim3ZfN6F2BnZYsdful1Uc=
Message-ID: <20175a31-2ef8-4c12-b329-616cb07d3d0b@linux.microsoft.com>
Date: Thu, 15 Oct 2026 15:01:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: xilinx: versal-net: Remove CPU idle states
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, git@amd.com,
 ptsm@microsoft.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, sven@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
 <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07-10-2026 17:49, Jay Buddhabhatti wrote:
> The sleep state powers down the CPU core, and the wake-up time cannot be
> guaranteed because the firmware may be busy handling other tasks at the
> time of the wake-up request. This leads to unpredictable and potentially
> high wake-up latency during CPU idle.
> 
> Remove the sleep state to avoid this dependency on firmware. The default
> backend CPU idle state simply puts core in WFI and retains its context
> without being powered off. Since wake-up from WFI is handled entirely in
> hardware, it is effectively immediate (a few cycles) and does not depend
> on firmware availability.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
> Changes in v2:
> - Remove the idle state instead of replacing it with a retention state.
> - Update the subject and commit description.
> 
> Link to v1: https://lore.kernel.org/all/20260727121842.3410495-1-jay.buddhabhatti@amd.com/
> ---
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 29 ----------------------
>   1 file changed, 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 21bb917bcba1..9b74e59fd64a 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -103,7 +103,6 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			reg = <0>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -133,7 +132,6 @@ cpu100: cpu@100 {
>   			enable-method = "psci";
>   			reg = <0x100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -163,7 +161,6 @@ cpu200: cpu@200 {
>   			enable-method = "psci";
>   			reg = <0x200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -193,7 +190,6 @@ cpu300: cpu@300 {
>   			enable-method = "psci";
>   			reg = <0x300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -223,7 +219,6 @@ cpu10000: cpu@10000 {
>   			enable-method = "psci";
>   			reg = <0x10000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -253,7 +248,6 @@ cpu10100: cpu@10100 {
>   			enable-method = "psci";
>   			reg = <0x10100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -283,7 +277,6 @@ cpu10200: cpu@10200 {
>   			enable-method = "psci";
>   			reg = <0x10200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -313,7 +306,6 @@ cpu10300: cpu@10300 {
>   			enable-method = "psci";
>   			reg = <0x10300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -343,7 +335,6 @@ cpu20000: cpu@20000 {
>   			enable-method = "psci";
>   			reg = <0x20000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -373,7 +364,6 @@ cpu20100: cpu@20100 {
>   			enable-method = "psci";
>   			reg = <0x20100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -403,7 +393,6 @@ cpu20200: cpu@20200 {
>   			enable-method = "psci";
>   			reg = <0x20200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -433,7 +422,6 @@ cpu20300: cpu@20300 {
>   			enable-method = "psci";
>   			reg = <0x20300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -463,7 +451,6 @@ cpu30000: cpu@30000 {
>   			enable-method = "psci";
>   			reg = <0x30000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -493,7 +480,6 @@ cpu30100: cpu@30100 {
>   			enable-method = "psci";
>   			reg = <0x30100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -523,7 +509,6 @@ cpu30200: cpu@30200 {
>   			enable-method = "psci";
>   			reg = <0x30200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -553,7 +538,6 @@ cpu30300: cpu@30300 {
>   			enable-method = "psci";
>   			reg = <0x30300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -632,19 +616,6 @@ llc: l4-cache { /* LLC inside CMN */
>   			cache-size = <0x1000000>; /* 16MB */
>   			cache-unified;
>   		};
> -
> -		idle-states {
> -			entry-method = "psci";
> -
> -			CPU_SLEEP_0: cpu-sleep-0 {
> -				compatible = "arm,idle-state";
> -				arm,psci-suspend-param = <0x40000000>;
> -				local-timer-stop;
> -				entry-latency-us = <300>;
> -				exit-latency-us = <600>;
> -				min-residency-us = <10000>;
> -			};
> -		};
>   	};
>   
>   	cpu_opp_table: opp-table {

This change works fine.

Tested-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

