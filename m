Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1606A4A2E15
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854206; cv=none; b=UfnHLAv2wFSnS4kIxsFYNTgfrzgPKLPDz9Mr8IEWBIJsv/dR/y09fpV0fos43BmV+59Y1q4XBtKUEWUjipFp+wGm3c8E4B7Ov+l0nWdV2fED8SHriQN6TumpRmZH2iR1o86LjGnefqQDC7hb/W57bpbuZuIoyRn7Spv3wQR7u0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854206; c=relaxed/simple;
	bh=8z7mNlPzoQwnfVSdIFR7CDKyD6KPFQ2Mjh2ASGykRbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krZZxnov4b1t14WrrKDR59w7ik8N28Ey/KMCjzzH/u3HiiwuPvel9RQQbuQeknJXcjVSAW6zMVhraWgsuHukg9DAqKc2JyFL26Z7cxspydnNe/CpfKlBjoN7TkpgAGEl2TQT2OiinC/GIl/nvf9UDGa4K+jiN5C30FTXoq/BOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE/isKpB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE/isKpB"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96c92c0980so142485a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854204; x=1788459004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsSqKCxu1aiUq+LFG5GddEFJLmJcMTVHCUjI3Qe8EB0=;
        b=dE/isKpBOo1NXZh+MNJs+Xmh86SAjNuwQhTQQkPrl606yIY7mT3Fmhuxis1ULUGVsm
         /E0DPyYtyZZeY5lQsFszj80BnkmSov/R9t0jMee7JkuPVJtd5VyQxOrRl1cbth8fL1PC
         43MPUF1sBKnoAy57HTIMEaRfkWimw0nSTKQ2HNY6ZEJSkCQIKloblGn6u6uGFgVUv2lj
         BKbmPnmxfTXfpqccCLKUZF2Nz0ELVsG5G+iDg+Usqa4gIeibbgT+f5jgZj164DA6G37Q
         vjp13XJaO8Lkbvo6wLS4jd8oXl55WIVpmCpB8xApS1jwJuaynOHCHKJLqKve4vaN+bZv
         dexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854204; x=1788459004;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bsSqKCxu1aiUq+LFG5GddEFJLmJcMTVHCUjI3Qe8EB0=;
        b=aKpd/f9kT4O7bH8uegQTXvybLAF7HzJs49y0tJiB5T3vjmTiRNtv8aLb3q+ilX0AaA
         oSLVpAcY3Nvat+WMqgtDFV9t3Ytk/oeu5Yio7if9B+g3EvRjU6fjyNMJbbNyUsC+qJ+0
         O6wYwkDTWIyOmu3gecN14iKJagcrplAR/4CsOd+GmkCjrsIb6I/0cizgH6xYmNAa1rdB
         Yjg7pefMerTLqdcHJA0p70944lZwc9jfX2ftAvdn2dZc4gfiVZOHlYYdQBh6tTjmKhdB
         Mu0/3gcVgls21/vqCnGpCkpmeL8mFeVgwYhcsAaQGrEuR66m3lN7rVB6vYtADDjyg3gN
         KLrw==
X-Forwarded-Encrypted: i=1; AHgh+Rq++dt8V6JooTuK8mFyXWaFMhJYU+XnOOWeb/7XIjVhFiZ8xfbn0ryVMY39IYUzX+/pLyqqMc5VSnYsNUE=@vger.kernel.org
X-Gm-Message-State: AFuF++k2cGFcon70cMOevQZVD/xhnJmwGFXoEmVSaKV+ypfOUk3uROnF
	Oz6f3OYUJZSvOZM1chR4HHRQsBL4C++LrjnTSGv4Ei6VMrx2iW9Ed9zn
X-Gm-Gg: AR+sD12gWq4+RN7VQMkk6vQUTw0jtX/vLnMlNTC1oX9wvovm5fF2MrMG1rwt2w1PLhv
	YaV4TYQP75YO0RKgodExrwJVHlmNDlKNJDwaNf8fstSp2V6AU8M2BPQAjDOM+b18fS3g9JUbjea
	eVkfYSOd4WADpHrouKiKVeRe7feHoY+gxbiyvtvXDEK5387J6/dimmrxB3Wlrfe/FyGd+oMB/bD
	SaZrpQvrcvn6T2HikQRiSff+5IMVfOMxBGmw2bIcGajeNfnWzT4c4seOWusGG9etUqvvNCe16Kg
	D+O6ZdAHZZKddaCGSUWOn71v1TeI97ucrxY3jz2gLqLwP2lvdDIrby9AaNg/MA4lSN+qZLjq0KJ
	BAvN8QndsA1XjSPGpO/QIRltr2EwnQMGno0Y5LI4rCMfpwW+adzBtPp1RSPcGMeVOpe9sDvFeYU
	bdxKduFRZPuCBj/knblf6x4uOsQ/0BvQHQOk0Z0Vi0NTsroiLpmoWZKjAfpYQAJlkWDPeYDSOti
	cahfUu+yQ+efEsOzmblZxX+sQscpHiKG40gpA==
X-Received: by 2002:a05:6a20:cd95:b0:3d1:ae83:6fc2 with SMTP id adf61e73a8af0-3d2686a88dfmr1663623637.9.1787854204218;
        Thu, 27 Aug 2026 11:10:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beae5b51sm2502401a12.3.2026.08.27.11.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 11:10:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <93d22742-bf3e-4e69-aed5-27137d8f49bf@roeck-us.net>
Date: Thu, 27 Aug 2026 11:10:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Differentiate scenarios when watchdog is closed
To: chaithco@redhat.com
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824205051.4117285-2-chaithco@redhat.com>
 <2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
 <QBUFKT.6XP2A9BR6LRO3@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <QBUFKT.6XP2A9BR6LRO3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/26 10:09, chaithco@redhat.com wrote:
> 
> 
> On Thu, Aug 27 2026 at 09:01:47 AM -07:00:00, Guenter Roeck <linux@roeck-us.net> wrote:
>> Presently
>> [...]
>> Also, the subject should start with the subsystem name ("watchdog:")
>> [...]
>> deliberately
> 
> Thank you for catching these! Please accept my apologies. I can fix those up in the next submission.
> 
>> [...] Also, while technically userspace may close the
>> watchdog deliberately while it is running, that is not what happens
>> on a regular basis.
> 
> This is actually what initiated a bug report at https://bugzilla.redhat.com/show_bug.cgi?id=1991285 it turns out systemd explicitly does this to help ensure a system shutting down actually eventually goes down even if the shutdown process hits some snags. It does this on every shutdown. Given the prevalence of systemd, this is a regular occurrence. The end result is that, when using iTCO, it shows an error on every shutdown when systemd is in use as init.
> 
>> If you want to make a change, I would suggest to add an error message
>> into watchdog_stop() to report an error if the stop callback returns
>> an error. That would distinguish 2/3 without making functional changes.
> 
> Thank you! So something like this?
> 
>         if (wdd->ops->stop) {
>                 clear_bit(WDOG_HW_RUNNING, &wdd->status);
>                 err = wdd->ops->stop(wdd);
> +               if (err < 0)
> +                       pr_info("watchdog%d: closed while still enabled!\n");

More like

			pr_err(""watchdog%d: Failed to stop watchdog: %pe\n", wdd->id, ERR_PTR(err));

since this would be a real error.

The "watchdog%d: watchdog did not stop!" message will then follow
(unconditionally).

>                 trace_watchdog_stop(wdd, err);
>         } else {
>                 set_bit(WDOG_HW_RUNNING, &wdd->status);
> 
> 
> While responding to this, an additional thought occurred to me; given the primary reason a user would see this is because systemd is shutting down a system, it may be more worth while to have systemd log something about closing the watchdog without disarming it to at least explain a pr_crit kernel log line. Otherwise, it just looks like "something bad happened" with watchdog. I am additionally unsure of what would be best to go in watchdog_stop that helps differentiate intentional closing of the watchdog without disabling vs malicious/accidental closing. The intent would lie within the entity closing the watchdog; "closed while still enabled!" still seems like "something bad happened" with info on if it was intentional or not.
> 

Problem is that we don't know if "something bad happened". The same message
will be seen if the watchdog daemon was killed or crashed. We can not just
assume that closing the watchdog device was intentional.

Guenter

