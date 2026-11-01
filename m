Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793537857;
	b=o6ASu8SGYbzIIjWp0BKmwoXZvt5MiSYzO6UR7+6klVVvhwysD+mmYQLcQgktXaW8zUvh
	 Cjw4JBYbqsIHLODBPHMRk9oC6jZiHmJahB/47Ci/L7P4gdj7u/1IMJ800oYshqAI3aPLO
	 V7LcpK1b1f2x0sn/aEOA94QeRSCWdXJba8iy3QqgJ+GnKajPh18J5XPdsfKsgqAG/HmzY
	 BkTT6lxaEaZHAUV3LkxIopZL2jdgY0uFZLfCD6C/L2iLzlMk0SviE+FJ/zdeWBXQKkVN7
	 mDpwD1JYWvqH2hegzJwwujOC/xQ/XXTsUPAwRVomRy13Zjb1B3V3pK+YGPSYlRkoD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793537857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CfVTzZ3V32lHVKoOGse9NLw4u5NZ8GkugNXlom4S+B0=;
	b=xCLfIJaXY9N8SDSG282JuSCfwsbYt3fHeYvOL5S3BxtY8XgFvP1K3JE2mvlfp0HTYJE7
	 rIQ6o9CSxfax8mckozjtdxFZ5BNjHfOoHuNWb/T4PfOwX2p8ERZgpk/oM9K2ksVxyjgh5
	 iORF/iK+TQi9PAPVOMW2bmSeU6cBbE4zCtNfAKda4kwWDa9xukdZro0GGHbLucar7LXBo
	 0w8PNqIkfHNnyXCHIQf4nVySMRquwB+oyssK+xEXZce7aoJj0mKxkExl6NuvL8dr17Bi1
	 vDYlEFTvZ4k6XihfDAw1Rbecwy1dgIWMz6gHhyr8vg5zdgBnaTa8gyazwhlQ1BXQo7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRd9PeAG;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE75C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRd9PeAG
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so23351185e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793537855; x=1794142655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfVTzZ3V32lHVKoOGse9NLw4u5NZ8GkugNXlom4S+B0=;
        b=wRd9PeAGDNu4HYaj86oZWrxlQJGYtVcvxZtho0H+ysJz9EqFEOZ7X/al3mVFYXd9+s
         htRkAD/r51ArqUwpfazFo0BOql/cYM+74On7zFmHG7pL2vOrllzwa1P4nPklmNxQi8XX
         9jMIR/GCnPxkjv5cFnldEJ2hdHPJ7gsnW5dIA0zcPV8VVVB2Rozhw2M97n+POZDixy8P
         SpLgcW5pFpamxD/L9H/q3VCcJ5B43PZpUuWXCPbcYNekRuUv9MEi9JVJsc0uxIahSxTN
         Wh8SsmWKAl5tdDAILA9j1roJFK1uksslGY9/BTsbJQztWGAzEopLQn7cHeHgtWO76VTF
         8rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793537855; x=1794142655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfVTzZ3V32lHVKoOGse9NLw4u5NZ8GkugNXlom4S+B0=;
        b=mljHk4ZlB1DBPq0weC+EXkXl9uKspuoZ4yeoi/TYQM9IPBUzlv8IDSfY6Y87QZKpaX
         G4/DhVVBae0+CtnaZf/25IhT8BMb4NWaNhlh5A+xgQwIN3GdVHW0qsN3ia6U75SoK+rr
         c4AniVuWZOfTPye76lonyJgtc9mmkETh81DNk53PK+C60WutADRSORYNu8CNdqUK/FS/
         6aLzBaCixCHTKSAkR/c/hKLyJuyeI/E82ahkRgQiEc5I8YyXVXiT4QoJCnVEZa9WaXj3
         1w1baem5h4RDQjJ8ERBdKcSXiQxZxTQuJIEXCbcQ+ezGgrcOczDZhQ5N8fQlXlTmQbIK
         pUzw==
X-Forwarded-Encrypted: i=1; AKwUvBzlDfCRIYHRg6GbxauVWLZG1CnmwXPZwbqmLGoNf9Mu8KKjQrrpIqzFpORJ8F/GcvFxNIfIBAoa+/vApFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzRw3t8PozIJLKuowxOmr2eL+JyFRRQCfMNWGrS1gYdrMvWhot
	gVT3prnSyn1HAF3G7XshVIrC+ME1EOHOdtz600act3Vq38jToO7q+Lg=
X-Gm-Gg: AYBFou1DHDUqVtXIqG8nF2BOtPUZj8KBd1WgUnogKrCY7C+ApJmgsSMlk7GV8DmbM7m
	/nA2fmzcDdBJoUchblVqO35a7puv+ranoaoNZ+lJMEa1dpqseAbjoRXyU1YailXSwh23uCFf4J0
	apCV74xWaECzubK95CStE03Y06hTDisialupKRxHL29ZkZw/RP3HrHMKBwX63utqAOqX3t9f1HB
	49pmU4/YwPwsoiVNtvnK1GFYBsANL2QnNGXV6ZRLfWRaZy2xsjb6c8fRVdwEEezXU9T0k3/pApN
	/umHmr4JEKhZSZuE2YmkGqGcJ9dVGNSz9Ly6q0XJt7Fw8UqbNdm6yYyXJOl0fT7QTZKQScW7HXx
	IgxM3WjTae5a1YT/ji/299+NETF4J7gL7lvJA9F4iO0Q/tAqmwdA5IsTC+rTE0Fct20XDGmqhdX
	grfxQgQkIFobtYdjA3a8NgglQCU/4bIa3DLOQP6vPD0Hwo8ySCAyefnKk2ZeF6WqZIq8VggDK9f
	i1tEYkwkTazNY6/SILjRaI1g+hF4vnqukOUFvDMw1AOhzaHTUe0otnc4/gmRn3c3kK/+FrHeby0
	6lwFwVJXWl+/
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr183360695e9.17.1793537854992;
        Sun, 01 Nov 2026 04:57:34 -0800 (PST)
Received: from p183 ([46.53.134.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm273172295e9.4.2026.11.01.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:57:34 -0800 (PST)
Date: Sun, 1 Nov 2026 15:57:32 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/proc: proc-empty-vm: wait for child's SIGSEGV
 instead of sleep(1)
Message-ID: <65faff9e-5c1b-42d1-a450-b9c66b08ba25@p183>
References: <20261023183434.9109-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023183434.9109-1-drifabdelmalekmohamedsaid@gmail.com>

On Fri, Oct 23, 2026 at 07:34:33PM +0100, Drif Abdelmalek Mohamed Said wrote:
> The test had a TODO asking for a reliable way to know when the child's
> munmap() has finished, and used sleep(1) in the meantime.
> 
> Unmapping the whole address space leaves the child with no code to run,
> so it segfaults. Since it is traced, the SIGSEGV stop is reported to
> the parent through waitpid(), which is exactly the signal the TODO
> wanted. Wait for it there and drop the sleep and the TODO.
> 
> The stop is now consumed up front, so SIGKILL the child before the
> final reap.

OK I recall what's going on here.

The only thing to worry is child pid reuse but child is under ptrace
so it should be fine.

Reviewed-by: Alexey Dobriyan <adobriyan@gmail.com>

> +		for (;;) {
> +			p = waitpid(pid, &wstatus, 0);
> +			if (p == -1 && errno == EINTR)
> +				continue;
> +			break;
> +		}

do/while EINTR loops are shorter:

	do {
		rv = f();
	} while (rv == -1 && errno == EINTR);
