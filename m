Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D76E3E1236
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537916; cv=none; b=kIWwM6FbGZxfY5vTNES8EC2TKI5ZJdCzvyLEDKLs0EX9zfNnixpnEAV3TsgFeG3UntmrPCUEroj+qqsmqkpEU2YJ0e9o0QZJDfBuuUHWBdH31VN/NHyo6s8pNtLHe1yJlWrsKpEA0EEBe5yuved6Lxi5qk9Dz3QEBAA/UQczdPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537916; c=relaxed/simple;
	bh=I2asbyezUO/zn1BhH1IduQEcf94bapJCZHVpyXCczqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kakxgUsxOcLiqL3DL7TVGtp8u/WU90d8e3tN6GKdB66AbWm/C7uGz47uleDAZGCzN0Mjn9bZ8Bea0UpftTXithKo50HrqkAHZte1ngncM6SZz5htGx7t+FF7BAux23FE87X8k1mpVYFBBh+SFRTaOxB7GMP9a+T6s5pIsXpt3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=YpvPr0Iz; arc=none smtp.client-ip=159.69.174.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="YpvPr0Iz"
Received: from mailgw.sysgo.com (localhost.localdomain [127.0.0.1])
	by mail.sysgo.com (Proxmox) with ESMTP id 19A2B80ADA;
	Wed, 16 Sep 2026 07:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sysgo.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=k1; bh=Og5Kkwll20nMJ0Gp/zPxN/
	4k0RFyyPGbZ2F3i/7WQWM=; b=YpvPr0Iz2KyoOELha0gz4WoSKR6D/+6UcbnF2b
	c7U91hyktwDfd2bkqt2e2teDwXzfuNQaCx45HNvNjKxnyrD14QAaVkpsktvCp3W/
	oV+rZ7aEbRpE4wAqnBlOYK9HafI02Aku+Bleh82ezA3zQ0IW0cM8Wan2EHoBujU5
	OaLjGiBjayUA2sRf77XzvE6JkvwPJTwSpUk4aJyT481+Ny7ljfRrCSSWz6sLJb3L
	O/daCg0r1wXyCkGXtBtYFx61d5GA2R+wREX1d0g4M4LQtqRYTJUj1Qz9YXABzMTZ
	AVhPtioGsrjrtITXIYfW+sWftis/CHHgTYJnaLRVahKzWmBQ==
Message-ID: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
Date: Wed, 16 Sep 2026 08:51:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] printk: Remove console options before decoding the name
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org
References: <20260916053218.40546-1-david.engraf@sysgo.com>
 <aqotk6oiOdp01hAF@tlindgre-MOBL1>
Content-Language: en-US, de-DE
From: David Engraf <david.engraf@sysgo.com>
In-Reply-To: <aqotk6oiOdp01hAF@tlindgre-MOBL1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.09.26 08:48 wrote Tony Lindgren:
> On Wed, Sep 16, 2026 at 08:32:18AM +0300, David Engraf wrote:
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -2646,24 +2646,22 @@ static int __init console_setup(char *str)
>>   	if (_braille_console_setup(&str, &brl_options))
>>   		return 1;
>>   
>> +	/* Decode str into name, index, options */
>> +	options = strchr(str, ',');
>> +	if (options)
>> +		*(options++) = 0;
>> +
> 
> How about update the comment for why it needs to be first?
> 
> Maybe something like:
> 
> Decode str into options first. The options may contain a ':' used also
> for DEVNAME.

Okay I can update the comment if there are no other objections.

Best regards
- David


