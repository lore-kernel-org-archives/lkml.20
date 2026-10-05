Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361735C185
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188296; cv=none; b=PvEja3UeD3zHnjv7D9xZA7/x+fKIUlLQ/pKFdm7QHgHTK2+GYD7WvoHjmyPl6PufpgZjriOjXmAI8OEmHqPpIgaW+eTq9jSqiMuz/H0nxS9XpmvwHLgusCrcMDW6zcr8szPtbRztzKi7HdGiEKnk/BDMndj2qRW/sLz1byUqOI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188296; c=relaxed/simple;
	bh=56s4DWdd1dGgSvMNpCJ1UQps30v5jYGjvYruRBJuET0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEVWNGdB2pDFz5BiFJIlZrWmKbvXEKvs5yig7HhKkt0iULwBtg7CuwvlTeCN0AdEzhKq+R6GTRv2bpqeznx7irTCKGiMjwCmub3ztBfy1bAILNZZg5d8oASUwn+YiYAYJmZQNVOA5P32EXmw7A2haZOwG3sY+ptG2MQkBdniOIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=GuibmQem; arc=none smtp.client-ip=62.149.156.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="GuibmQem"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id DdqfxMFAWXXg5DdqgxmmqD; Mon, 05 Oct 2026 10:15:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1791188102; bh=56s4DWdd1dGgSvMNpCJ1UQps30v5jYGjvYruRBJuET0=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=GuibmQemV6mNaGQKX2B0+3FFKjwdU6rS3XTakLZTCVeAXq9ncu++k4oIPSZabYtAn
	 wfmtFAG+clHlshv0XehA0EBZvdW5VdFmygIBOoUxV2Y4JBUuqVmqCeCU1ptob45K/A
	 rHKSxObacs+QycakZnhyXnYBhdcffe9mI2EQZa/EcfrezvjKyAarPXGUEvnGXRl3W9
	 lK23NB10+pulf5ntJE8YlHhdaHbP1fm+z7GoSDkUxTPrmzHCxjaU8hYoiMjz1aCYml
	 tOn48dPhqwlr8TVqtYDcrYd+GBtG61idNg5PRFeZJibfnzOFTrtD0cQDuH3qapuDD1
	 JKbjHnll2yFkw==
Message-ID: <f432aee3-9bda-430c-9cb6-e35248c87b3d@enneenne.com>
Date: Mon, 5 Oct 2026 10:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] [DO NOT MERGE] timekeeping: Apply extrapolated
 ntp_error to clock snapshots
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <20261001202134.33929-6-dwmw2@infradead.org>
 <0d5d56ca-89fa-4f09-bd24-9c730dd27656@enneenne.com>
 <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org>
 <7274f4ef-edec-4282-9c92-b6f7918b8320@enneenne.com>
 <46df3bedea175007a6480b4cb8ba070c6ff3d527.camel@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <46df3bedea175007a6480b4cb8ba070c6ff3d527.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLz0m+1qRunQPsXF7zdGsjhoQYh2Oqq+5Vyh8td66NfzL77m1S3GR0iPxKqqQ9LrrngfbwlucL6ktBobQHXDwGCgQZ0wRHr/qqRqsH0jymo/fFGZdR2Y
 CRI3l7DLHl+Y3w9N6MFOZtGx8NyPyTi80NpAqyXufRPLxfwFsWbQ3WFVNbnqgNmOl74M+hOAAULfu3p0xyG1NoGYKBgynjbBd0jUX0MxnBJ0qF1/obCxf4Kb
 H9fekIHcoHBWp9UlpuBuuQ/T2Y8hvbZb4t9IynM7um3Y/nDY+6AHYgC1AvbXWBagBXrHhs8H/e5i1uXv9W2iEc5vOahbJNQSOXo6JI1btI8mcjyaGaek8G9v
 oP70Okv7gtajVsuAbETgFSgAia3LrBFSzfuzDMQeR3bTGkQkOS0=

On 03/10/2026 00:47, David Woodhouse wrote:
> On Fri, 2026-10-02 at 12:26 +0200, Rodolfo Giometti wrote:
>>  
>>> So I think we do need it, and my inclination is to hold off on enabling
>>> CONFIG_NTP_PPS for tickless kernels until we do. But I'll defer to your
>>> preference. If you want to merge it sooner on the basis that with a
>>> 1PPS signal the system doesn't get to sleep for long *anyway*, I can do
>>> another test run with just patches 1-4.
>>>
>>
>> Yes, please do that run. This patch changes what PPS_FETCH returns to
>> userspace, so it has to wait for the chrony and ntpd people anyway; if
>> 1-4 alone are good enough at 1PPS I'd rather not tie the tickless
>> enablement to it.
> 
> https://david.woodhou.se/ntptest-r64/rodolfo-14-tickless-1hz/
> 
> Fairly much identical to the full series running tickless, which was
> https://david.woodhou.se/ntptest-r64/tickless-1hz/
> 
> And not really much worse than the tickful variant
> https://david.woodhou.se/ntptest-r64/tickful-1hz/
> 
> The ntp_error isn't measured because it's the clean series and most of
> the instrumentation is gone. I'll set the 5s pulse version running
> overnight.
> 
> The series is also tested on four virtual machines on the same host,
> tickful and tickless, patches vs. baseline. You can see the tickless
> baseline wobble when the actual frequency changes, while the other
> three remain stable. You can also see ntp_error on both baseline
> kernels spiking during the initial sync.
> https://david.woodhou.se/ntptest-virt/

Thanks, that's convincing: with 1-4 alone tickless at 1Hz looks the
same as with the full series, so I'm fine with the tickless enablement
not depending on this patch. :-)

Please put these numbers, and the 5s ones when you have them, in the commit
message of the patch dropping !NO_HZ_COMMON.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
