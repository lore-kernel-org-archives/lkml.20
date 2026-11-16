Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821134;
	b=LjUK4NvoYnqrHccjM1ass8VdvL+Pw9DX+svWGKYazBff6j2jBQDG8zS24E/jaaIkMKXx
	 l26YBih/5ZYIj0s0IC5WbVFE/NLh6hG2eXZZ5/ixXA0CLBhsZ8+B96W8fCYuViShKuKJX
	 uL4LujOcd6LtLA+zRkpS/Onp0HAEtjZoYUZkkXAp8DDlZtxYkGxqWtiiM/2nUtqdgRUCE
	 IW0hr+4Tz9wc3BkQBvY1tFkSOYyhSVUhndbIOm/DAzfhagcZX8MxzsdIi/doEJkJTHfGR
	 6nvk9e9CQcxf5hr0XymgOJIBq5aOorNtZpYFsLfdYqo7gs0u321H9NO3gHbhADU27Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821134;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HUeJ9zSUpaowgDIZjMKNGFwbG4V8L9TvF44I7CnZ8QY=;
	b=YhyZpCzo3gjGJojHThE5QwiQj3MHoCbZVnN5+32k/Wjk8saI7c5cq5NG47+VLRfl7Swb
	 cs6mbpXKtAQ4wHJ+Tv3IgXUOzEKuJXZ3u7uW54tDjijvyWwt6+/fyvhMT1FaTJ/ip7Gdv
	 lRqm7RgwLTJTxCcyPxDocmbtBaFm1skak5YU9pYnQE0JFYCcviVyyk82GaoN2O7aHGN9l
	 Ub2d/CQpQNWxPw74Uz/Zh9wnpSl8EganX8oq0nIXdNWbKwJF/xoz74cxCxLqIM3u/a1Ar
	 vWl1lSvYUNuAjVmJ/tsam9nN8tm4lMcM884ySKrVciK8X7XkU3+KWXX89DYyiDX9t7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LALg8Lz2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0911606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0911606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LALg8Lz2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D778F1476
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:25:29 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 816573F763
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794821132; bh=G3LD9iV+aYFrYF8zJmTYYviiW41GVezZZiQUp/NRFII=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LALg8Lz27xCfN8LBBTU5yMi0qr4u9ift/G+sOfVBPpA2b3uP0X+abKtawmeBwvFoe
	 Uykxfiy3AN3/LRMVlFow/03oCkrOzJ6x/pvTF6FnwrvHAESX4QpL/JXFgOTMEcmaAj
	 fkblmlEnQqAn2Zrg5eCP844jFA2SnWp/RhoxNnyA=
Message-ID: <99fd439b-c418-450c-9f57-cea11ce90f28@arm.com>
Date: Mon, 16 Nov 2026 09:25:31 +0000
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
Subject: Re: [PATCH v18 0/8] Provide support for Trigger Generation Unit
To: linux-kernel@vger.kernel.org
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/11/2026 07:41, Songwei Chai wrote:
> We propose creating a new qcom directory under drivers/hwtracing
> to host this TGU driver, as well as additional Qualcomm-specific
> hwtracing drivers that we plan to submit in the coming months.
> This structure will help organize vendor-specific implementations
> and facilitate future development and maintenance.
> 
> Feedback from the community on this proposal is highly appreciated.
> 
> - Why we are proposing this:
> 
> TGU has the ability to monitor signal conditions and trigger debug-related
> actions, serving as a programmable hardware component that enhances system
> trace and debug capabilities. Placing it under drivers/hwtracing aligns
> with its function as a trace generation utility.
> 
> We previously attempted to push this driver to drivers/hwtracing/coresight,
> but did not receive support from the maintainers of the CoreSight
> subsystem. The reason provided was: “This component is primarily a part
> of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
> independently from the CoreSight hardware trace generation system.”
> 
> Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
> 
> Given this, we have been considering whether it would be appropriate
> to create a dedicated drivers/hwtracing/qcom directory for
> Qualcomm-related hwtracing drivers. This would follow the precedent set
> by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
> We believe this structure would significantly facilitate
> future submissions of related Qualcomm drivers.
> 
> - Maintenance of drivers/hwtracing/qcom:
> 
> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
> directory — we’ve discussed this with him and he’s aware that his task
> list may grow accordingly. Additionally, Qualcomm engineers familiar with
> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
> will be available to review incoming patches and support ongoing
> development.

If we respin the series, please could you fix this ^^^ paragraph, for
the records. (if someone wants to find out what really happened)

Suzuki


> 
> - Detail for TGU:
> 
> This component can be utilized to sense a plurality of signals and
> create a trigger into the CTI or generate interrupts to processors
> once the input signal meets the conditions. We can treat the TGU’s
> workflow as a flowsheet, it has some “steps” regions for customization.
> In each step region, we can set the signals that we want with priority
> in priority_group, set the conditions in each step via condition_decode,
> and set the resultant action by condition_select. Meanwhile,
> some TGUs (not all) also provide timer/counter functionality.
> Based on the characteristics described above, we consider the TGU as a
> helper in the CoreSight subsystem. Its master device is the TPDM, which
> can transmit signals from other subsystems, and we reuse the existing
> ports mechanism to link the TPDM to the connected TGU.
> 
> Here is a detailed example to explain how to use the TGU:
> 
> In this example, the TGU is configured to use 2 conditions, 2 steps, and
> the timer. The goal is to look for one of two patterns which are generated
> from TPDM, giving priority to one, and then generate a trigger once the
> timer reaches a certain value. In other words, two conditions are used
> for the first step to look for the two patterns, where the one with the
> highest priority is used in the first condition. Then, in the second step,
> the timer is enabled and set to be compared to the given value at each
> clock cycle. These steps are better shown below.
>      
>                |-----------------|
>                |                 |
>                |       TPDM      |
>                |                 |
>                |-----------------|
>                         |
>                         |
>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>      |                  |                                                 |
>      |                  |                          |--------------------| |
>      |    |---- --->    |                          |  Go to next steps  | |
>      |    |             |                |--- ---> |  Enable timer      | |
>      |    |             v                |         |                    | |
>      |    |    |-----------------|       |         |--------------------| |
>      |    |    |                 |  Yes  |                    |           |
>      |    |    |   inputs==0xB   | ----->|                    | <-------- |
>      |    |    |                 |       |                    |      No | |
>      | No |    |-----------------|       |                    v         | |
>      |    |             |                |          |-----------------| | |
>      |    |             |                |          |                 | | |
>      |    |             |                |          |      timer>=3   |-- |
>      |    |             v                |          |                 |   |
>      |    |    |-----------------|       |          |-----------------|   |
>      |    |    |                 |  Yes  |                    |           |
>      |    |--- |   inputs==0xA   | ----->|                    | Yes       |
>      |         |                 |                            |           |
>      |         |-----------------|                            v           |
>      |                                              |-----------------|   |
>      |                                              |                 |   |
>      |                                              |      Trigger    |   |
>      |                                              |                 |   |
>      |                                              |-----------------|   |
>      |  TGU                                                   |           |
>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>                                                               |
>                                                               v
>                                                      |-----------------|
>                                                      |The controllers  |
>                                                      |which will use   |
>                                                      |triggers further |
>                                                      |-----------------|
> 
> steps:
>      1. Reset TGU /*it will disable tgu and reset dataset*/
>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu
> 
>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>         priority 1 to 0xB = 0b1011.
>      - echo 0x11113232 > /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
>      - echo 0x11113233 > /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0
> 
>      Note:
>          Bit distribution diagram for each priority register
>      |-------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |    Description              |
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      These bits are used to identify the signals we want to sense, with
>      a maximum signal number of 140. For example, to sense the signal
>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>      represents 1010. The remaining bits are set to 1, as we want to use
>      AND gate to summarize all the signals we want to sense here. For
>      rising or falling edge detection of any input to the priority, set
>      the remaining bits to 0 to use an OR gate.
> 
>      3. look for the pattern for priority_i i=0,1.
>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
>      - echo 0x30 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1
> 
>      |-------------------------------------------------------------------------------|
>      |   Bits          |    Field Nam        |            Description                |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |For each decoded condition, this       |
>      |      24         |       NOT           |inverts the output. If the condition   |
>      |                 |                     |decodes to true, and the NOT field     |
>      |                 |                     |is '1', then the output is NOT true.   |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
>      |                 |                     |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
>      |                 |                     |Conversely, a '0' here requires a '0'  |
>      |                 |                     |from the comparator                    |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |OR logic will be actively              |
>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
>      |                 |    (n=0,1,2,3)      |this particular condition.             |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |will need to be '1' to affect the      |
>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
>      |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
>      |                 |                     |requires a '0' from Priority_n OR logic|
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will be actively             |
>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
>      |                 |  (n=0,1,2,3)        |particular condition.                  |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will need to be '1' to       |
>      |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
>      |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
>      |                 |                     |a '0' here requires a '0' from         |
>      |                 |                     |Priority_n AND logic.                  |
>      |-------------------------------------------------------------------------------|
>      Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
>      and `0x30` here to activate them.
> 
>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>         are met then the next step will be step 1 and the timer will be enabled.
>      - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
>      - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1
> 
>      |-----------------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |            Description                |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This field defines the next step the   |
>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
>      |                 |                   |Condition and Step.                    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |For each possible output trigger       |
>      |    13           |     TRIGGER       |available, set a '1' if you want       |
>      |                 |                   |the trigger to go active for the       |
>      |                 |                   |associated condition and Step.         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to increment if the|
>      |    9            |     BC0_INC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to decrement if the|
>      |    8            |     BC0_DEC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear BC0 count value to 0 if|
>      |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
>      |                 |                   |for this step.                         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to increment until |
>      |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
>      |                 |                   |Condition is decoded for this step.    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to pause until     |
>      |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear TC0 count value to 0   |
>      |    1            |     TC0_CLEAR     |if the associated Condition is         |
>      |                 |                   |decoded for this step.                 |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will set the done signal to the   |
>      |    0            |     DONE          |TGU FSM if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
> 
>      5. activate the timer comparison for this step.
>      -  echo 0x30000  > /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0
> 
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
>      to enable timer comparison.
> 
>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
>         has reached the given value.
>      - echo 0x6 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0
> 
>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>         i.e. when the timer reaches 3.
>      - echo 0x2000 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default
> 
>      Note:
>          1. 'default' register allows for establishing the resultant action for
>          the default condition
> 
>          2. Trigger:For each possible output trigger available from
>          the Design document, there are three triggers: interrupts, CTI,
>          and Cross-TGU mapping.All three triggers can occur, but
>          the choice of which trigger to use depends on the user's
>          needs.
> 
>      8. Compare the timer to 3 in step 1.
>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0
> 
>      9. enale tgu
>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
> ---
> Link to V17: https://lore.kernel.org/all/20261113024935.3173715-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V18:
> - Use designated initializers in tgu_dataset_rw() instead of positional initialization.
> - Move the remaining CoreSight management register defs into linux/coresight.h.
> - Rename "enable_tgu" sysfs attribute to "enable" as per Suzuki's suggestion.
> ---
> Link to V16: https://lore.kernel.org/all/20260730080704.2903540-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V17:
> - Reuse CS_LOCK/CS_UNLOCK/CORESIGHT_DEVID/CORESIGHT_DEVID2 from coresight.h instead of duplicating them locally.
> - Replace the dynamically allocated value_table with fixed-size arrays, dropping devm_kcalloc().
> - Add TGU_*_COUNT() macros for region sizing; remove the redundant memset() for condition_decode.
> ---
> Link to V15: https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V16:
> - Fixed enable/disable race and PM refcount handling.
> - Fixed sysfs exposure before driver initialization.
> - Fixed priority allocation and access races.
> - Fixed uninitialized return value in condition decode.
> - Fixed sysfs attribute naming collision issues.
> - Added ABI documentation for the default node.
> ---
> Link to V14: https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V15:
> - Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
> ---
> Link to V13: https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V14:
> - Fix some typos and formatting.
> ---
> Link to V12: https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V13:
> - add ":" after "KernelVersion"
> - add an enablement check in the enable function to avoid increasing the counter each time
> ---
> Link to V11: https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/
> 
> Changes in V12:
> - Remove the in-ports property from the bindings, as this device is decoupled from CoreSight.
> - Update kernel version and date.
> ---
> Link to V10: https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/
> 
> Changes in V11:
> - Change the names of members in drvdata: max_xxx -> num_xxx, enable -> enabled
> - Use "FIELD_GET" to replace "BMVAL"
> - Use devm_kcalloc to replace devm_kzalloc once create members of value_table
> - Keep a consistent \n above return
> - Keep reverse-Christmas-tree style
> - Add checks so that the enable and reset nodes only accept 0 or 1
> ---
> Link to V9: https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V10:
> - Modified code formatting based on Jie's feedback to improve readability.
> - Applied inverse Christmas tree order to the variables.
> ---
> Link to V8: https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V9:
> - Decoupled the tgu driver from coresight header file and registered it as an amba device.
> - Retained Rob's reviewed-by tag on patch1/7 since the file remains unchanged.
> - Updated the sysfs node path in the Documentation directory.
> ---
> Link to V7: https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/
> 
> Changes in V8:
> - Add "select" section in bindings.
> - Update publish date in "sysfs-bus-coresight-devices-tgu".
> ---
> Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/
> 
> Changes in V7:
> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
> - Perform the 'calculate_array_location' separately, instead of doing it within the function.
> - Update the sender email address.
> ---
> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/
> 
> Changes in V6:
> - Replace spinlock with guard(spinlock) in tgu_enable.
> - Remove redundant blank line.
> - Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
> ---
> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/
> 
> Changes in V5:
> - Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
> ---
> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/
> 
> Changes in V4:
> - Add changlog in coverletter.
> - Correct 'year' in Copyright in patch1.
> - Correct port mechansim description in patch1.
> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
> and set them through reading DEVID register as per Mike's suggestion.
> - Modify tgu_disable func to make it have single return point in patch2 as per
> Mike's suggestion.
> - Use sysfs_emit in enable_tgu_show func in ptach2.
> - Remove redundant judgement in enable_tgu_store in patch2.
> - Correct typo in description in patch3.
> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
> per Mike's suggestion.
> - Remove tgu_dataset_ro definition in patch3
> - Use #define constants with explanations of what they are rather than
> arbitrary magic numbers in patch3 and patch4.
> - Check -EINVAL before using 'calculate_array_location()' in array in patch4.
> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
> - Document the value needed to initiate the reset in pacth7.
> - Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
> - Remove dev_dbg in 'reset_tgu_store' in patch7.
> ---
> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/
> 
> Changes in V3:
> - Correct typo and format in dt-binding in patch1
> - Rebase to the latest kernel version
> ---
> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/
> 
> Changes in V2:
>   - Use real name instead of login name,
>   - Correct typo and format in dt-binding and code.
>   - Bring order in tgu_prob(declarations with and without assignments) as per
> Krzysztof's suggestion.
>   - Add module device table in patch2.
>   - Set const for tgu_common_grp and tgu_ids in patch2.
>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
> ---
> Songwei Chai (8):
>    dt-bindings: arm: Add support for Qualcomm TGU trace
>    coresight: Move CoreSight management register defs to
>      linux/coresight.h
>    qcom-tgu: Add TGU driver
>    qcom-tgu: Add signal priority support
>    qcom-tgu: Add TGU decode support
>    qcom-tgu: Add support to configure next action
>    qcom-tgu: Add timer/counter functionality for TGU
>    qcom-tgu: Add reset node to initialize
> 
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
>   MAINTAINERS                                   |  11 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/coresight/coresight-priv.h  |  34 -
>   drivers/hwtracing/qcom/Kconfig                |  20 +
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 848 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 179 ++++
>   include/linux/coresight.h                     |  34 +
>   11 files changed, 1229 insertions(+), 34 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 

