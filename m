Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A6F37EFF4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450879; cv=none; b=rNfWvYfarql1iTq8nabsSdJPYk9grVXslHolC8iIzUWcfXo8n5OhHPTn9YXyS8tBdjQeUanlNoIqlwYkjRLYdggUIztJfCbnxSJt8B11Tk2NE7D0QB04hTPZbMbvKHNkaSnCZn8hgljKEV4/6ZS2joeJvjJ3wjbBfYIKRrHxrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450879; c=relaxed/simple;
	bh=YpaQOC1WDkFRpQbpfg74M0L2LJg3c76FI9oNmLLjydY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWjUgf4JY9TAnPCDagXM3L8/jgSjkr0bX1EnGqOIDfXfinBc6M8cjEQqebwB0BL1sx/RVzQS6jMKrDuYAOJzBYnx0mIoxuN1LxYGWDpZaGPe2arXdoz927EkaJ/BdrHtJpVmcaqdQQyYYLu7U1KBVVJ9M/JzWQO+k9HhYacRemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gs0ZRnCM; arc=none smtp.client-ip=74.125.225.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gs0ZRnCM"
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so1389587f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790450875; x=1791055675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1i/A0Q7vSMnTo4N9O4lpowhPB3CoGwq6o5i8iGE/Bqk=;
        b=gs0ZRnCMx+XMi2CrOIaYsSBoH3Ba/g2KLA7BRI6Dy3a73c+3HMYEDuAQhsIXCF+pHa
         aOVAk1dubbbEw22cESk6lOkAbOIkkcTfgGGDhkZkCCqaiCrAdYTxpIK+pWHY7U73TNTS
         4RMdxpWdH99uVeyCLQTBTL1sAbWl0dR4jrf9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450875; x=1791055675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1i/A0Q7vSMnTo4N9O4lpowhPB3CoGwq6o5i8iGE/Bqk=;
        b=SyNYi1FqPCYVSg+fzwpDO4hcI32VzfYwiWqmO4LdbZQGeoaxzIy/PuSZTjkt5YPL58
         OOyhKclz/YSO13z925WQLwVA31UesW2hmAfRowYUiXd4/H6k7JDfki67cWI0XAhIBmNw
         muvbyfj2JtQDf7a069lFaD1fJo68cARw5YYA0jPDQMQoqj/Y7cTFJILIuhn/lK9LBFUJ
         57hZ9V68GPGpYUwMonZ0ZeEU3TwjUq86RmzCjLxqiN1Jrb9Q/ACypSYV392zERjRXJsj
         1T5BdNa4cayPzvRK38HcIs2UOq0taonTaOZ/c+9O7Webv3aAEOJaQZsbsXSep1chsMFt
         EZ+A==
X-Forwarded-Encrypted: i=1; AKwUvBzCbZ6TewmwLX4jDSpKUzNEEba0/5u43LrOr1DHFZd/zxm90zYXiEEpV4dtzTglWSQ4tQWFX9w/k0uiX04=@vger.kernel.org
X-Gm-Message-State: AFuF++ndzsBM6wfA2tY6lR8hC2m0K6zioYPcBHsGhG/VSSrSmCpNeIZS
	7SFscFIQQf2wQqKm+WofjKfJ9yUmn+oAdnXx/S/iP8l3m4ayeepzfsHlbHc4CaTsvJw=
X-Gm-Gg: AYBFou0BuvQTagxYlhtouAhx41d8dTQNf7jfTjfk86mZLFKlW73tB4ZQJbVXN5mylLB
	h7x4Sqh3+KPBD3QJmj36pYgt7+GN1gGhVk8dQ//9uY1mES7TOxVojwBbLf4lSlOWKn6S6PiqaZC
	q8O4yHk9rOC3DYFCklvWPqZmhXtg+qyVsTY2tOwxFs98wE7KLjeXLzDD/z5/vLri8bclkAF45qx
	IeDjJGsYNBIbhLC0NcWs7F0CZPBnRq/MFPb6SiQATaHQSSTHj+Zq0ZszydUJFax6OwE5BtZfs+c
	le4MBobcc6uoz0HhUFCNZhLgYn8q8Kh4+kAd5F9/BS723cE2cPR6sMdihLQ4Daky3K7NpW6V5YF
	JJMcZeHotVyloMRrrnpgP8IhN7bBIhzG75C/sSmW7QIeue/ykqsiSWKQ7Jj2grX0kDLW8Ir4WED
	pXZXDQrXmsdU0ePnqoW3md4i9dt4MOC5WqVhAq6j9uoJW8GTDqKIrtLw2Qflg9M6p8eIM/hXLl1
	jzxz6v+GAXgm4wXxo70E0S2sAGaVB+qV6ELXk0v72Wa0V0lzIl+IHBWGxjyoFmRMUkt
X-Received: by 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr152199945e9.7.1790450874738;
        Sat, 26 Sep 2026 12:27:54 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm179388075e9.1.2026.09.26.12.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:27:53 -0700 (PDT)
Message-ID: <d41f6f1b-b317-404d-b1f9-ed6f4170fa26@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:27:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: Fix debug message formatting
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 ZhuangZhuang Wang <wzz_123123@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260916190423.1892-1-wzz_123123@163.com>
 <dfb3afb2-cec0-42e0-8e5d-25e89f54215b@igalia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <dfb3afb2-cec0-42e0-8e5d-25e89f54215b@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/26 14:06, André Almeida wrote:
> Em 16/09/2026 16:04, ZhuangZhuang Wang escreveu:
>> ksft_print_dbg_msg() passes a va_list to ksft_print_msg() as a regular
>> variadic argument. As a result, format specifiers consume the va_list
>> representation instead of the caller's arguments and print garbage.
>>
>> Add a va_list-based helper and use it from both message printing
>> functions. Also annotate ksft_print_dbg_msg() so the compiler can check
>> its format arguments.
>>
>> Fixes: f2662ec26b26 ("selftests: kselftest: Create ksft_print_dbg_msg()")

Does it really fix this commit? I don't see that is the case. Please don't
add fixes tag unless it fixes the problem in the commit.

>> Signed-off-by: ZhuangZhuang Wang <wzz_123123@163.com>
> 
> Reviewed-by: André Almeida <andrealmeid@igalia.com>

Also can you tell me how this problem was found and what;s the output
before and after this change?

thanks,
-- Shuah
