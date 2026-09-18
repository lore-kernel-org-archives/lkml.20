Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E64FB9C0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743887; cv=none; b=jRoc1oWLrunnZSs23Yd19qQm0zv/4oMaVOcIhd56GY1LuXCjKXG2aU5EokwLf1E8oy31PEsKeOanuB0O5HSdTYfsmEt3ZEE6PyJOLHGW4yoMICYJWAeGBg0h+B7KgyD1Wa5oDHZYPtecMeH5wGuEc4YWmEUckFPEn50qcOPHuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743887; c=relaxed/simple;
	bh=Gb/x6esgMQpQotVfJren+Rm4Q9BISakZHHgrn0/DCTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aicvrPRnnRRmraGBfRUN7c/IOjBdhX0raj3HYhpfqg8tYoRZ+cgqz80dXDDLvgMs3W3OUW66SHxh8LeSxejdSOC2w72Juaa+bnr+A7DkXiMvhMLnsF7gk2B1nMbnYvlqSiPmC59MhLs+7k1m8pVku9OZ1DeLcc8Pj+StvNjkzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lU1X3vFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU1X3vFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380411F000FF;
	Fri, 18 Sep 2026 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743886;
	bh=I02gFSbSDWfyQ8250o/EPwBT5UIcmcn8R930+dynCG4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=lU1X3vFVRMhDdH0ak6oco6luE0dfN3ozu/dVlm0SLMbQQHXjOj6aac3srOYQMhUJK
	 BaE6b7WMca1fFYltZvkL+KehD6kByHP9obus2KY2oiVuPp+DexsBr+0dAkq34cnA7T
	 1nfoxzS9Nxux5eS1SY3EhEvZDOWV15Q8YyaS02jgH+eiR+uaRgeZvYUaueMhoVAdDW
	 HZmleFuXFdocxcYU4LqlfkjOh46vUC/gg/CpM2JJwWSpfAVEgsNEcvVQN6vD9Y/5a1
	 2Uo6gLKuFAanFU5ejw681N0/SFPTsuY6BWsOEMA0j5or4EMXWOZB4VhsXc/iuStpZq
	 pG5vavzsUmk9g==
Message-ID: <9005742e-51d5-465a-8f9f-b4aaf46ccd51@kernel.org>
Date: Fri, 18 Sep 2026 10:04:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] firmware: stratix10-svc: remove RSU exclusion from
 no-support path
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 linux-kernel@vger.kernel.org
References: <94bea0ef315adab7a8f9f9a4514eb961a9ea7be7.1778480470.git.adrian.ho.yin.ng@altera.com>
 <0b12d08b135d8bd1744db895050340b5929d5211.1789570907.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <0b12d08b135d8bd1744db895050340b5929d5211.1789570907.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/16/26 10:12, Adrian Ng Ho Yin wrote:
> Remove the compatibility workaround for older firmware that excluded
> COMMAND_RSU_UPDATE and COMMAND_RSU_STATUS from the no-support callback.
> This exclusion caused receive_cb to never be invoked for these commands
> when firmware returned an unsupported response, leaving callers blocked
> until their completion timeout.
> 
> Always invoke receive_cb with SVC_STATUS_NO_SUPPORT when the secure
> firmware does not recognise a command, regardless of command type.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
> Link: https://lore.kernel.org/all/94bea0ef315adab7a8f9f9a4514eb961a9ea7be7.1778480470.git.adrian.ho.yin.ng@altera.com/
> 
> RESEND: refreshed against socfpga_firmware_for_v7.4; clarify commit
> message (timeout wording, shorter subject).
> 
>   drivers/firmware/stratix10-svc.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
>
Applied!

Thanks,
Dinh
