Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794847685;
	b=de6YS6UY/i73Jt5h+Fa9E310jCoZoM04LqISD3mwTevH/xNdBYJ1WLnvhvEvodukyOAV
	 WdKid7VkXPWu6SLJDmUAQ+H9C5hJ9YyR9jGmzVWN7BHexpjLxyeEBuCNYw0N54MuYcK1M
	 a2F2jFcghWV9AKSqvGNmag5fEM9QIdc2KMs14OR7oEVUaHddpKFntn5Yqss8x7TDeJYg0
	 LoGph+4KgRN6ewDnBv+LUcFQn8qg9L8yt4HNty0w8VH9Ow2bq7e7zbNSQtrkm7CGD5omz
	 hKPlEASIdaQo+Mfz32wwnuORx3C6rp9aXvIwlXc1xl85eUb7NLK+a82dXaTgmSti2Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
	b=mtuyllpiNVjgScihpT+v1DW9Ne0c9/BA1Nz4iII6Yth6pxrESnhTV6RzRe/lhcUHVMCP
	 W8/m1DR0E9+14U1Eh6xyZ7y6RRuZEY/T1sJ5lmrFpm7Sjol9gs5ThmXjfTaNQS7ivj8a8
	 0danAKDSKHNb22z7JFW/+8cen1rpWypIFEZzYExE8KL1dKFKMFYjClWFPSi8lY8HDNx2E
	 ZXN/FbAkm4Z9IyITVETw3Yrza1ExFbQU/0m/Z37lBPWYyLTAU9Yf5awRuzvIcqFrzmdKL
	 TbOP4oaRCQRRCdFIU866Ed1T7lL7YWbIyYqFMpwbB2sUOxtjuWVEyLZqw5JSLoBgK0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRZpPH7C;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E2606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6E2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRZpPH7C
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50604721c8so595514366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847683; cv=none;
        d=google.com; s=arc-20260327;
        b=FCnze+I3HderDM/DOHFKWDHkZV65sdHPnaTe291V58vMk/dWqbey5+jUZjgHxnmzO3
         n3wCw41G6ZsR82ckfE1SG5rDEJfk1KbluSdu3EgMl9RIDtD5m72MHgu7DGspqxxUB0t8
         FqZWM7cAzvTxC2IABfGJJm7vyqgmPYVwVpS7+VW4bJM21Cgi2kRWjjJhEaXbZ8HGTlRs
         791dDtP4rqtg7KF5UETVtFIbhVN8kF3xrmVl/rXgRI77gY3j7bn8V6j4zZZjcHMV3fEF
         eT0pM/VxDunGORHi0HynmBogyM7XklEHgNklSYou8G5lf69WkMwS3JLEFolMbk9bLJQy
         jUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        fh=7kAVSaxRcVPmMH6daeYiKTX6mLSh/NTzoLoGfAz4ipk=;
        b=mzA7UVpgW2CvR4Npd5xsMedqlhAf47fLLhAxxysePPdkYg6oFdAzJkGRbRm82H2uat
         VPRXpimpTgry+4e38WorRatFUGDs1uP046Ze0ZfKSppXoUyKIHQFV41fYvGMHg0C4Ixl
         aZxoh2odSMI/SeIeeENvkwlO2xnvVL0PAd7s88CYLPvjrMdlb7u4M8WLs5xmsKv6R740
         vydPLqmfe5/ckJYW8O0aT1glBoOgHNka50jpreRvES7lUljt9z5STxNIrIQn//hnpqWj
         kirUm9R7rp+5aTfQshs6ysRkGMhvM4FqqwDIW9mWAlyO9nIHnXUMySxh0uUcKjjBpGsh
         kqNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847683; x=1795452483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        b=BRZpPH7CWREXoIQVx4hqWeRD2Q55mF2ONQt/rqbgFw+JCVZynGVS5mcNl9MqThYOT9
         20+ObweLK0jkmtZ1W290Qf+4riG2nCByG2J+6GdLBeskWBTA2tLFL5mcEmBDnPSWATBU
         BQI5CY9G1xEXxZu55qFcoBCQwGmjz9Z9pC3gd3xNAHs29aEmMKIRONon9FOOpo2uHZ2Q
         ywr+KylRdBAE1Eik7ZBk3/A7E+nr4uU+WVQ7mcRDCRBv5n02bfNhsTlxCqKMeqNtrDyF
         VbvgectNG77arQt+0qlPXBhIA+2vS1vGuQyqbekduzFfPYsk9xzMDhHUNP9rb2ifqGnD
         6T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847683; x=1795452483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        b=hnSMjYe6qNjDYywkUyxieaGA0nsYjU7ALx9o/7QC2GcLI0E/WtwZZV67ekVRTQIadR
         mwkyy3FHfKg9A3y85KgH1813IjNU6TplHuOSRRpIFCjFhY0QtZkRLoeydLLP93NuuAdx
         lSRjBXsgJkMdE9OKKsmKkV8LkvVHbLjJyDgJPu4Nn5wVoWq9Nib4adlCrYqZ9WOPew8Z
         SVVwY7rSJ13LkSH3F4U7bGkfLcuUpW8KemwPaRrcOLbtfvKkziiiRdUWGiwOy43j2XH5
         1lPBJ6tiByYo9T5tnubmXSz1mwuBcaV0svVG5PcybTT0eWmIRRYkurx9ybJ+QKVE2eqt
         laSw==
X-Forwarded-Encrypted: i=1; AL+hErGaBT7XvxamP2Om8wi78vKxaVtlW+Lgly2rnAX7kTRsFDa2sm4UylEYmh75JNq6DijZcSsuUVFLpiS9Qxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GPtZNiXoQqOtvMTILrHmx7ejio/x79Jfow1upWJdHWgVsE38L
	1Lncon+nSiUNMbaeYpmzwnMvzDUkYY0f24snnyJatJSBJfK6MIOec2vjpAPgwZoLnFt1hDVLLyc
	NjybhE2wY80bX19sH7v8NJ9PjTr7YDiw=
X-Gm-Gg: AYBFou36nBP8VQKNx/i7U7Gvt7L2ihPALN2L7Zi1tsPwgX+0ZOQtzGjNlXf/Cz7gq5Q
	HryQlB/0SF+XfWfjTDB0Af9HBhSDo+0JtUlwrxVwbfDMcox+cq67v6K620f7rZOlUwFwvPyoa6l
	wmkTO+3swv/yy0uNtaucb/t8/26CXEy05Vsw0NZEBOnKKbPz+aiOrx/iZlR1E/oJehGpNmv5wr6
	1pAPGnO/C71PHUEZmoZUToB3+u4a7BR7eIsMT7bKOx/D3Fp+X17Y2RyZ3NUJddVrrIOICakAcnR
	lz7CzKod2awXVI60rgIDq0InbZBy1RUTAM/FIU6E8uhxTskkdfoF/vq6vvqb8gClrVpPRo7ft6N
	ym2r+m3pPSP7R4xS11Eq0fkdCr2iHm0Nr1tkAnbTO6dFFWkZYEJPmapdecL8=
X-Received: by 2002:a17:907:1b06:b0:c41:23bf:18af with SMTP id
 a640c23a62f3a-c509614e4famr897868466b.5.1794847682879; Mon, 16 Nov 2026
 08:48:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com> <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
In-Reply-To: <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
From: yzddMr6 <yzddmr6@gmail.com>
Date: Tue, 17 Nov 2026 00:47:50 +0800
X-Gm-Features: AclHuK-Lr4J3nNZOiRUCcA8IWzVao3HnhljllZthBc3TfeqQ8ypxS6Przkn-9Ek
Message-ID: <CAB63uaGQzATJHQgA2ohAothVDYsAhAhPDrcPmgLzwO9EvnB-Vw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Melody Olvera <melody.olvera@oss.qualcomm.com>, 
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 08:55:33AM +0100, Konrad Dybcio wrote:
> On 11/12/26 6:35 PM, Vladyslav Tymoshchuk wrote:
>> It does not cure the reset here. The tree is v7.3-rc5 with out-of-tree
>> board support, without Ajay's series. Each run is one 60 s s2idle on
>> battery with the USB cable disconnected:
>>
>>   this patch, Wi-Fi WoWLAN enabled                    reset
>>   this patch, Wi-Fi WoWLAN disabled                   reset
>>   this patch, rpmhpd domains left at their highest
>>     corner (rpmhpd sync_state callback removed)       reset
>>   no patch, MC0 kept voted in the sleep set           resumes
>
> This means something is accessing DDR as your platform sleeps
> without voting for it. That indicates it's likely something that
> Linux set up, as various subsystems (ADSP etc.) cast their own
> votes.

Thanks, Vladyslav, for trying it on the Pad 3, and Konrad for the
table fix [1], which includes this change.

On this tablet the reset went away once the ISLAND1 ways were
reserved, with CX and DDR still collapsing, which fits that reading.
Some of the numbers below are from a second tablet, a OnePlus Pad 2
Pro (OPD2413, from the same erhai project as the Pad 3), which runs
this patch on the same v7.4-rc2 based tree as this one.

>> On this tree the two votes do not seem to be dropped: with all five
>> macro codecs runtime suspended, clk_summary still shows LPASS_HW_MACRO
>> and LPASS_HW_DCODEC with a prepare count of 6 (LPASS_HW_LPR_VOTE is 0).
>> I read that on the workaround kernel while awake, not during suspend,
>> and the codecs have no system sleep callbacks here. So the resets above
>> most likely happened with both votes held, which is the state your
>> tablet resumes in.

In the one s2idle cycle I ran with each of LPASS_HW_MACRO_VOTE and
LPASS_HW_LPR_VOTE held, this tablet resumed with cxsd, aosd and ddr all
staying at 0, as with your MC0 vote, and Gopi reports that held LPASS
votes keep CX and DDR from collapsing on Glymur too [2]. So with the
votes held I would expect DDR not to collapse in your runs either, and
the MC0 vote to make no difference. Since it does, I think the votes
were released in the runs that reset.

On v7.3-rc5, as on v7.4-rc2, the six consumers of these votes in
sm8750.dtsi, the five macros and the LPI pin controller, take them
through pm_clk, which drops them on runtime suspend. With the five
macros suspended, only the LPI pin controller could still hold them,
so I would expect a count of at most 1; 6 looks like all six were
active when you read it. A device that is still active when system
suspend starts stays active until resume, though, unless it has a
system sleep callback, which is what Gopi's LPI and SoundWire patches
[2][3] add.

Here the count read right before suspend was 3, 3 and 0 for MACRO,
DCODEC and LPR in each of the 23 s2idle cycles I recorded with this
kernel, 18 on this tablet and 5 on the Pad 2 Pro. Still, cxsd and ddr
grew by about the time asleep in 21 of them; in the other two, both
on this tablet, they did not grow at all. This tree forces all six
consumers and the SoundWire controllers into runtime suspend at system
sleep (Ajay's TX/VA patches, changes equivalent to [2] and [3], and
the same for the RX and WSA macros), which drops the votes during
suspend. Without such callbacks, a non-zero count read right before
suspend would mean the votes were held.

>>> All of these suspend tests were done with a USB cable connected.
>
> I don't think ToT linux will let you get cxsd with a cable connected.

On this tree it does: 21 of the 23 cycles above reached cxsd with the
tablet attached to a PC as a USB device, and so did the tests in the
patch. The tree carries a fair amount on top of v7.4-rc2, though,
including Vladyslav's USB GDSC retention patch [4], so I can't say
what ToT does.

Vladyslav, to your two questions: yes, this tablet resumes with the
cable disconnected, though the battery cycles with stats here were
PSCI system suspend, not s2idle. Each tablet ran two cycles on
battery, with an RTC alarm 180 s and 70 s ahead, and resumed at the
alarm every time. On this tablet mem_sleep was deep, and cxsd and ddr
grew by 179.1 s and 69.2 s. On the Pad 2 Pro they were s2idle, and
cxsd and ddr grew by about 178 s and 65 s. aosd stayed at 0 in all
four, as in every cycle I have recorded on either tablet.

As for MC0, nothing that I can see is voted on it in the sleep set.
The interconnect drivers are as in v7.4-rc2, where the MC0 keepalive
only votes in the active and wake sets, and a sleep-set vote on MC0
would keep ddr from growing in every cycle, while it grew in 25 of the
27 cycles above (21 of 23 with the cable, all four on battery).

One difference between the two tablets that may matter for the Pad 3:
on the Pad 2 Pro, adsp_island did not grow in any of its five s2idle
cycles with the cable connected, which ran from 59 s to 2.9 hours,
although the ADSP does enter island mode there while awake, and cxsd
and ddr count a new entry every 5 s or so (every half second on
battery). On this tablet the ADSP stays in island mode for nearly the
whole sleep, and with this kernel cxsd and ddr count at most three
entries per cycle, even in one of 1.8 hours. If the Pad 3 behaves like
the Pad 2 Pro, the ISLAND1 slice is not in use during its s2idle, and
this patch could not make a difference there.

Since you offered to run variants: could you read the three prepare
counts right before suspend on the kernel that resets?

[1] https://lore.kernel.org/r/20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com
[3] https://lore.kernel.org/r/20261112-qcom-swr-system-sleep-v1-1-a61a83f6475d@oss.qualcomm.com
[4] https://lore.kernel.org/r/20261110213346.1359-1-tvlad744@gmail.com

Thanks,
yzddMr6
