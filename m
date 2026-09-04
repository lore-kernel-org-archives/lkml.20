Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0414CC283
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544480; cv=none; b=d3UabLT6qd+sv6sZiwun2djFi/QhWWnR1CctybvJ6DDf2p0c359Vj1mG/2QGANrCvjE5Suk+l122+4xv8o3U7+l3Mp0fkzAGzf1fUwU7ESJvXikIPI6mPS38uLthFPVsUaVtmUtrt/Nc93LtvtBHfe7PRgGV0Fo3FhFgi4nl1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544480; c=relaxed/simple;
	bh=EjQj2LS0JNyUic2hcCxEF400RxvSSgR2RMKFB+bwmO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nx4rlrbkCvSi57q1/33mBjfqdhCpm5tnnzh94EaRLVHm1MCVnuoKpuqedgVQLyIQnU6kFMsBtj2ygXQkJHX1wGSOjfgpFqnmv3+u21kHTtc3T5GS7oIm4tOUEBx7A2AhkooA3msUkK+rEADTFSX7PPDB1gjXqnijcaAD/NB5hAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VYoFjNaV; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VYoFjNaV"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d9537bcso1101374b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788544477; x=1789149277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sswBzQfsCyKYg2+YC2ZCiHjV592pYawy0eyNgxUcAfc=;
        b=VYoFjNaVBHsVGKsuPz378EzHq6+F9r9rtq2n+9NftMpFSIRDlbUl/pZyJyUU532zPH
         /AUeTM14qNkAunLuUghnRxYkevoeuQ8NithBW9ZbwDIUIEHrTrGYHygEASXwfNNuzYxy
         adkaCUTy3v9G6ebKCMKjzgQdu4vVo0ib9KXn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544477; x=1789149277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sswBzQfsCyKYg2+YC2ZCiHjV592pYawy0eyNgxUcAfc=;
        b=MaSDM07bREh036pqFEvFgm8buRYyTCIvrEGMSr7bJ98W2IMQVOZ+POKY7E1C2Koppf
         6Bpazp2sF4EjcUL72/EF9ckNBAdokR8KFoDVWlqB0RutcPjx8JFIJBjdiYD7hcb2jNec
         rNkP4pB8UPdwXuJt0CjYWBu55QIIjLtxabpWnHFyyY9jPW/2nbsYG935Ka91zIfeUNC8
         ca0VeqXoi9fQYz6aGlNM6MRyxJoRDRzcHneFt3CX+iy3GxkIVUzTBhaqwnjTVapMpGea
         xGJoxr6ceeC1D2Rnu2XgMEqOqEJNE9W9U1+ezyN1cGhchnh4SBoca80JMsDt3kcNP4Sm
         P0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6URQR8IooUT4CtHqAgXBgF2F7etvo5ONfe93VjMEGX5+iF7BZ1+drxcRsUDYTuzgdDXFOzlKdzLctjpw=@vger.kernel.org
X-Gm-Message-State: AFuF++mrVrGTVWoLnNsCniE31Y5P9DeZuajxdxDJL8fjwvliD1rHKEtw
	M2P/TjGo+WJB0nwMjuIZ9NZRBUtE4nyXs4ZVcZ9x0zQFxIoJa27NPxBDr3MQnh2WPkI=
X-Gm-Gg: AYBFou3+F6D0ikwlo7ktX4F9kQJ+PO9JlQX7o1tAozq+0aGVWu+RbPrafiDcda14rCd
	8wlfp924TveZIwDvFOdhMQCkmdiABJXFIDZIopWbaWsi6wdpbk4Mg3luQAxlBAVCbl8HPa4nnfe
	8GVbBiEF7KUFSdpjYhRxYOmqwagwg00B4ZdvSBjWnU/V6HUXXGCj12vzVTr2F+t6OlIBGChiN4r
	4yMn4ZntfFuHoSboLIHEXQpSBbIn5vLzNPHe9c0RzFe8mo36AsGn0PYeoxcai6Gnded4d3Q/76o
	GgRIoVJmpWYAsXjpOHb1saBqN7HbaMFIz+XQPfbrHXtubY1z7X7SytvhuFaP9UmaB5kYxHxjVf1
	SrX7T239ETNHU5lhClpcFkGSndlnZvR0EpNLIEgxw4anrCPhSf9UDdAaPNgjC86rpwE2TmuqeXv
	fEZ4YdMzm83Eduge0rhq6iTssV3mM8CXWeCydqVMy6fYQD3/vT6tuuroqgvHuq18UQdUWLzMCIC
	NwuEsZtNwY=
X-Received: by 2002:a05:6808:5387:b0:4ab:224d:6dd6 with SMTP id 5614622812f47-4b7deda428bmr6794706b6e.15.1788544476511;
        Fri, 04 Sep 2026 10:54:36 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm2596901b6e.6.2026.09.04.10.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 10:54:33 -0700 (PDT)
Message-ID: <aa803d8d-25af-48eb-bc6d-2476fc795c80@linuxfoundation.org>
Date: Fri, 4 Sep 2026 11:54:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] cpupower: monitor: Show how a counter value is
 exported
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Renninger
 <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 "John B . Wyatt IV" <jwyatt@redhat.com>, John Kacur <jkacur@redhat.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260818095538.1196953-1-hemanth.selam@gmail.com>
 <20260818095538.1196953-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260818095538.1196953-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 03:55, Hemanth Selam wrote:
> "cpupower monitor -l" lists the name, the processor hierarchy level and
> a description of every counter, but not how its value is exported. Some
> counters are a percentage of the time spent in a state, others are
> absolute values with their own unit, for example the Mperf "Freq"
> counter reports MHz and the RAPL zones report micro Joule. Both cannot
> be told apart from the listing.
> 
> Show the value type behind the hierarchy level and document it:
> 
>    [%]   The counter is a percentage of the time spent in the state.
>    [abs] The counter is an absolute value, its unit depends on the
>          counter, MHz for "Freq" or micro Joule for a RAPL zone.
> 
> Before:
> 
>    $ cpupower monitor -l
>    Monitor "Mperf" (3 states) - Might overflow after 922000000 s
>    C0	[T] -> Processor Core not idle
>    Cx	[T] -> Processor Core in an idle state
>    Freq	[T] -> Average Frequency (including boost) in MHz
> 
> After:
> 
>    $ cpupower monitor -l
>    Monitor "Mperf" (3 states) - Might overflow after 922000000 s
>    C0	[T] [%] -> Processor Core not idle
>    Cx	[T] [%] -> Processor Core in an idle state
>    Freq	[T] [abs] -> Average Frequency (including boost) in MHz
> 
> The time granularity part of the ToDo needs a new cstate_t member every
> monitor has to fill in, keep it noted.


> 
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   tools/power/cpupower/man/cpupower-monitor.1   |  8 +++++++
>   .../utils/idle_monitor/cpupower-monitor.c     | 22 ++++++++++++++++---
>   2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/power/cpupower/man/cpupower-monitor.1 b/tools/power/cpupower/man/cpupower-monitor.1
> index 89af019f8dc4..c8008919627c 100644
> --- a/tools/power/cpupower/man/cpupower-monitor.1
> +++ b/tools/power/cpupower/man/cpupower-monitor.1
> @@ -51,6 +51,14 @@ coverage in square brackets:
>   .IP \(bu
>   [M] \-> Machine/Platform wide counter
>   .RE
> +.IP \(bu
> +How the counter is exported, in square brackets behind the hierarchy level:
> +.RS 4
> +.IP \(bu
> +[%] \-> Percentage of the time spent in the state
> +.IP \(bu
> +[abs] \-> Absolute value, the unit depends on the counter
> +.RE
>   .RE
>   .RE
>   .PP
> diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> index e8b3841d5c0f..376a1e30653a 100644
> --- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> +++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> @@ -269,6 +269,20 @@ static void parse_monitor_param(char *param)
>   	avail_monitors = hits;
>   }
>   
> +/*
> + * A monitor exports a counter either as a percentage of the time spent
> + * in the state or as an absolute value. Tell both apart, so that the
> + * numbers a measurement run prints can be interpreted.
> + */
> +static const char *value_abbr(const cstate_t *state)
> +{
> +	if (state->get_count_percent)
> +		return "%";
> +	if (state->get_count)
> +		return "abs";
> +	return "?";
> +}

Way too much complexity to do this.

> +
>   void list_monitors(void)
>   {
>   	unsigned int mon;
> @@ -284,10 +298,12 @@ void list_monitors(void)
>   		for (state = 0; state < monitors[mon]->hw_states_num; state++) {
>   			s = monitors[mon]->hw_states[state];
>   			/*
> -			 * ToDo show more state capabilities:
> -			 * percent, time (granlarity)
> +			 * ToDo show the time granularity of a counter, this
> +			 * needs a new cstate_t member every monitor has to
> +			 * fill in.
>   			 */
> -			printf("%s\t[%c] -> %s\n", s.name, range_abbr[s.range],
> +			printf("%s\t[%c] [%s] -> %s\n", s.name,
> +			       range_abbr[s.range], value_abbr(&s),

Find a simpler way to do this instead of adding a new routine.
Hint: you can check it right here.

>   			       gettext(s.desc));
>   		}
>   	}

thanks,
-- Shuah
