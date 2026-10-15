Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823A2417DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075558; cv=none; b=hhqM0srGvRELPnKFKiKGQJxAmzF/5NqVIIR2HjLjqjWYzrtln8MvAbcI7lyLmExjl7lY1XYSe7mc+E4mpT++kZ0x4YUOYbLsNH9A/rMLoISilrej2zd5OGWb2b+wsN55i57aLmmAVGA3ogxIRgXRuIASkeon9Vo6GuGJhEoG67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075558; c=relaxed/simple;
	bh=J1DmfvQ3bSlmu/fY22Cf1h8mrdFixKrrTxBkC8vPwI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD0/xGXwQWDmMvgBXvHQbWStpoWVLTYmMIqOpSSih0WgAF0qSTcNaMyFeCthhqKVqK7NlH/C0GyT6cIAO2mxjDcyyFGRZQwwX2Xfl/OGmgPFrEIbvM4UgzTrrgIWGbxT1zA6TOynNs3pVsx/MDsARMaGIPSINa2h+JE2QA0plhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8W2ipto; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8W2ipto"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab432273c5so48108497b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075556; x=1792680356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY8bEQTDRiBiqLeVmhJUy+oN+INRLBn8jSuVjWbtsUo=;
        b=s8W2ipto/aWRWpFxAIqUY6y0MSrQssOEs/bVyNaujmvpukZ/Xm4257+Nmh/TpUJ4d8
         bzP6n0CIHixnzcTPP6PZDBtH3cUB3d6LgC9tWAqFS68aJZke8a9PvvsXIz3cxv7S6/Et
         VurJ6vRUZ3/KlayrHsom4nmFQD9m0XzhqR43r/qSRXdUZYJyGfe5pJsNt5x+xbzrL3DK
         JF0DO2xO8aMDppAPR5TvXMENm11uv/XfxohFEmZRjovHeidH1Ngi5IoMlCgf2WXHqu+V
         dLCC6eUhOwTsxaB7RJ235swfCQlCZd8pnoIeh3glU1RHAI/JzgSw0OGUyFUXHhYD72kE
         tIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075556; x=1792680356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nY8bEQTDRiBiqLeVmhJUy+oN+INRLBn8jSuVjWbtsUo=;
        b=INibrD8hqvZ5AhUpB6fv9wfHlDrZ/bdX+XnOgN4eLTSexywM+JchNUYaJuun//OIqQ
         h86zblyd1I8liG7+DOSZWJDPDG1rGX0Jiy+KwY8+Pw//qgEXtP6oKolMy92lIHpzkejV
         4BX7cid8BcZ9MBjqQgHXPk0s3yN46Mtd+ljs6WC0Y1fjO9qQVBkadsG55MQupxoJmq5e
         P8AcEWWfLMjnTqmUxrKOhHjLAk40IMl0jKH2hntlVAwRLkyjzNapOS3c3dq5FmEQBy8S
         OIsX7o5lgUglK3icNb3mjTrok+XH1YY8UGYmBdkRnYoK0fheHIcUk1mnM2bWWxI2ibgG
         mP5A==
X-Forwarded-Encrypted: i=1; AKwUvBwC/xwu2yiRfEopOanzxAv45U2R0Z9wTiNsGbeNWuIoVPCFdMV/NyYk3l8sme4o1buAL4pKOFET1X/yKEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVmithfPdo13A/3LL8TAa6C0YbLP6rlIf1b+o087LdJ/OKbhy/
	85CldSvrdxgyHY3X4ba7g1VjrisE40RNQ0XMNiLudg27S6SGPMKKGVUT
X-Gm-Gg: AYBFou3MnNzv3tt9izdnO7d0uKCGltccp/qLFou972VUd5ZTM3pJwZlkz+amvzJM2k4
	vDvyT4rawf7EEcLxPKTiRZjN5VBN91r/GESiVYkSEVmr/dszKL8B+ZMiKoo3+4UN0CS0GKG+PAa
	OtkUI3b3Se0UgwHJkPnF89xZSlHm9foRswvyu45f+j79RPUKoDKIDV1bfFIfR9HcCrlv+UQwabL
	4+yR/2fh2eibC5+r8dZpCRfCk/SO/xmoa3eAT74et8EjNURF4Xgjo9fEdrOMcbfpCFOga3092gs
	HYLa9xuJCem8GPJtrKtUq0ino6wERUcKhNsid0quf8XiDDdBoaM96LBUhJKxyEUuCsSeUf/GBX3
	YPMHi7q8B8/X/ikAPs7jYIkdJLet5SQnJ/TB0iZk+zcnMK48SQu5A+xb/pLmKe1bbg/ZGIwvdto
	JgRQ8l9qHUqN8k22h7o2DjKD5c6qYXbKJw+tHR/lJPQx2bt2kE1De//UiLRJ29tLMeKdzfE7fgg
	S6pRjmXTosPLoC6OpXckNpuZZR5TcBN5cEF+EfpuARp1FPaLS6I
X-Received: by 2002:a05:690c:402f:b0:8ae:c015:3e36 with SMTP id 00721157ae682-8b07eebfba0mr45173167b3.50.1792075555970;
        Thu, 15 Oct 2026 07:45:55 -0700 (PDT)
Received: from [10.5.0.2] ([186.247.181.208])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ea845sm67908267b3.24.2026.10.15.07.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:45:55 -0700 (PDT)
Message-ID: <de94c8cd-0afc-4a35-bf81-019a8e4cc8e8@gmail.com>
Date: Thu, 15 Oct 2026 08:45:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: nvec: use guard(mutex) in nvec_write_sync()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Dean Clifton <deaner92@yahoo.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
References: <20261012222926.7754-1-deaner92.ref@yahoo.com>
 <20261012222926.7754-1-deaner92@yahoo.com>
 <2026101335-expansive-veteran-c4d6@gregkh>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <2026101335-expansive-veteran-c4d6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 12:15 AM, Greg Kroah-Hartman wrote:
> On Mon, Oct 12, 2026 at 10:29:26PM +0000, Jeremy Dean Clifton wrote:
>> The three return paths of nvec_write_sync() each release
>> sync_write_mutex with explicit unlock calls.
>>
>> Use guard(mutex) to unlock the lock automatically on any return
>> path.
>>
>> This removes the three mutex_unlock() calls.
>>
>> No functional change.
>>
>> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
>> ---
>> v2:
>>   - Reword the commit message to state the motivation and to make
>>     clear that removing the mutex_unlock() calls is the result of
>>     the change (Julia Lawall).
>> v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/
> 
> Please read the archives for why I will not take guard() rewrites of
> staging drivers (nor do I want to see you use a LLM in here either.)
> 
> sorry,
> 
> greg k-h

Hello Greg + Everyone,


It turns out that I was unknowingly subscribed to this list and started 
creating patches for the Outreachy group without ever having submitted 
an application to Outreachy. I just wanted to learn how to contribute to 
the Linux Kernel and I saw https://kernelnewbies.org/ as a direct 
connection to Outreachy.

While I am technically not part of this cohort, I can still review 
patches. What is preferred?

I assume that the same rules apply outside of Outreachy? No LLMs and no 
guard() rewrites.

Jeremy


