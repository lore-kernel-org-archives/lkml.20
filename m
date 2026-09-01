Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9342E428
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278799; cv=none; b=CPggwiXRoDn9k3UrKSEj259NBfzDCqz+ExIq74zXpJEJo/n1Uy1mRSg83tqum1c+ufrjOdRcd4jQkomvr355aAfxk6FikMOSwXiDwsbUO9R9D2yqiSEUWKMj8j5H/KXRWy6lQJnv280co8RnZhanXqrhhiyjEpW7/EhKhunak7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278799; c=relaxed/simple;
	bh=4LDKUsb5WjRQEuGxbQQ4qt0v2JnWcG5gjHrFeKmfKuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGJfadjmisArFHrbYNo8OS81kQ+0tCQ81njD9qC9unnyjwK8I2Aa49NtGv+LJF6kZm5QcW7psG/J3yrfu6EH5dIIeZPfwA9RKcCrwEv1W21TkKTpgajwtmyrcMEKd8IKYzASLEgg0w5XDyphXvvMV5DosdrFmV+L+VU+Wyz6ia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhYM2IIf; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhYM2IIf"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1003924a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278797; x=1788883597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYOwd/Dg8XG9xNRBNmcAOBNayTDytvjRR4xWi70Rcrs=;
        b=mhYM2IIfWx/PTvNwkeerzWg/ePSYY1kzX/pYb9w9J10nLt4Kpkkmv32Kv/aHZpmm5x
         9hYUYAJn8CGbvtxyMdQj23F1y0gU9xS7LK+Z5x83Y+2GbjcZsvZhHeya4NRv961wQ7N/
         ZVLgR7y4g7JZ6Nr+rsstT74xBnBaYHuIrMuRNAgORGKyg7Kzhh+qUuMQXIqdfvE24AgW
         dFjTLWVerRA29DJuqVnFDkP3lpXhUHtXtvAWSW/HQGNMhTRnhCmfgSr9zeg0Tmpg+iCu
         037wG3xNm43fHXrd4ez39PR+pa6lXFvNvpjpQ9Tf1NpEtxJu5VYoFuOlirWjc5FaeU3C
         QUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278797; x=1788883597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rYOwd/Dg8XG9xNRBNmcAOBNayTDytvjRR4xWi70Rcrs=;
        b=fXzTKNifhLE30gL9AL8dmGHodRcYlJQdtviV+tFer8I09tbFds+u23+fc/BuVaMqNq
         UariThzZ0HmGxhLYkvxNzSp2yhXzOpQMasD+UOtPH+iOoNgf1WWX/LkwdOkgujhzwCTl
         qraZog+2LgYTzbTypIFJtccMN0ZMVAYrnaporvd6iaK5hVVtlqT7i2xYzGlI+56yNBgc
         U4ZYsaipeSjRGC1ZlGGsZ9d9uveHluIIN+qpdJiK43O6ydwlLuHFfJdrr5MNJOpXHvYd
         1XqUE+xBC73/gEkedT4ck0rgHKEf3nh9ehgNa0lSNzPHA8QBmYZMKuB0zQNcrkzqbRuG
         vXiQ==
X-Forwarded-Encrypted: i=1; AKwUvBywlD1s4n/P96sLMMR4qNQ+NYCE86xmVT8R77oatesL5KwLC4QYW4tMTjK2Tf51MKLiuYz4raC9LkAVkYk=@vger.kernel.org
X-Gm-Message-State: AFuF++n4AZfX3EiGVY5qXGYnVYc9uv2fFq62FVw7synvctYeOZo+DjYa
	kA5IAexPoAtBp9/l+iLRFShZWI8Nz4Ml2TiRcxXaEvd0pm4iNvu9IRHUjnswXA==
X-Gm-Gg: AYBFou0t0k01k4Wx3ck7dodVAasfPblXrkTmcQkUsWYTQMuIv5HtIT5rzGdrHjBLaFy
	u1Pbcn5lBmaOq9vxEk0cvGaH7bHdkFM4xPRbM7OIo19z3/9OKzoQfaq4S/MO2/K0A+7B5BbHp3u
	A7aVAYAyyIpLiFg0+GFeAJGsaEB5FlHZ2fnF5ZryYr0VDkiEwwYnNui+tmwLf+0ymo+Tf1nEhqx
	yosk6HEmZywWiEsN0TN3iw3B8nxkVi4iWjJhvqfKjCKjqEjyByFpSQXDBh0d5zvYRVjqM+nX/T7
	oHl+LF5eAvujVBy5uZrYDQfUblGyaXi6mfyrGbDQgdVumXCyGh+Wm+JkUnzfiqCqV6QnEvnuN3E
	l/9KBuxWN44VsjFYJ9RlcqgCrOeJ0t2ebfio7FUC7xYi51Sp8iFMVztoUy5E08XiujLQ+4VD+ye
	Za/Vtwb4o6Z37PL+HSquIL86Tiacrn20uiXMQ8dy9ou+R9CsFMzDfeGxgjGyePpzQZ/XolL9w67
	morLJIq9eqTeqJx/cokQu6Suv8mtPGDzet9WXc=
X-Received: by 2002:a17:90b:4c84:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-3990f8d58e8mr4230212a91.16.1788278797017;
        Tue, 01 Sep 2026 09:06:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a321sm364027a91.7.2026.09.01.09.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:06:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67f191de-fb07-4d2b-aeeb-9bd6514a0068@roeck-us.net>
Date: Tue, 1 Sep 2026 09:06:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Differentiate scenarios when watchdog is closed
To: "chaithco@redhat.com" <chaithco@redhat.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824205051.4117285-2-chaithco@redhat.com>
 <2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
 <QBUFKT.6XP2A9BR6LRO3@redhat.com>
 <93d22742-bf3e-4e69-aed5-27137d8f49bf@roeck-us.net>
 <df49394b45f04e0de5ab0300a8d18f5ba6d38b01.camel@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <df49394b45f04e0de5ab0300a8d18f5ba6d38b01.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 13:05, chaithco@redhat.com wrote:
> On Thu, 2026-08-27 at 11:10 -0700, Guenter Roeck wrote:
>> Problem is that we don't know if "something bad happened". The same
>> message
>> will be seen if the watchdog daemon was killed or crashed. We can not
>> just
>> assume that closing the watchdog device was intentional.
> 
> That's the same sticking point I've come across. Differentiating
> between positive intentional closure versus malicious or buggy closure
> would somehow need to be communicated to the kernel. It makes more
> sense that users of the watchdog which intend to close the watchdog
> while still running maybe denote such. I opened a PR with systemd at
> https://github.com/systemd/systemd/pull/43552 to see if there was some
> way this could be tackled from that perspective.

I'd want to see a message even if the watchdog is closed but left running
on purpose. The best we can do is to add another message if there was an
error when trying to stop the watchdog. That should not happen too often
(well, not at all, really, unless there is a bug or hardware problem),
so it would not really add noise.

Thanks,
Guenter

