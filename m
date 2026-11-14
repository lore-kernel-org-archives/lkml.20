Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677041;
	b=ySFGA3TTybhqoIKFUnY1vEA/l0kwKIRjlToXUDIPStSR+BldmT97p8rcifGcJ5szwLHo
	 CxCNb8prAEE/OsKE+rMS3bPWfgMRGGbzkF12zPLx3cTolaRY+mW1G7Q5PdG1mggju1FI9
	 UoaTytM/fxBBIiRdNLlLyg9m+5PFFoefUwID1J559GawpM32evIvuGFUX9dfMuDUPF0Im
	 KkiyZzrHzxAIgfrA/tViQp18hULNub2jdfIwEm/lGWP02ozZ4b+WK6OY8oItgsvhpKkql
	 c1Ey5h9kBqZ6FpGSQnuFL0jOqXNC2qB1xeOYyW0PNeeWYd1qOiHlbnjvkOUndxE4Xag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
	b=CACTf+JAa5r/yg6J1Id8kZL5jqYU71nikBZGBk+6isjmDrYpRUVBiGqK0nDF5T9YGYhV
	 rM171vPuo0GKQlPM+1JyMgZ/ghybwXh7G7WRqDL3cZDsW01eCrKjAmasrL5qE9RxZV0vB
	 tSd4ftT72hAoHzXmkCGkZP8Q8VYbSO4kIPtcxxG0YeqvBCWXyofar25rq3BmDvbyCqvUa
	 Wm857VxRyBkDGHglfb/vgAgmwmA98WT8/4hTFUdr7uhhR7vrcODjakW4lA5fBYPUsRW3S
	 cTSS71sEsZbOV9LFLjs9unsnhymHWW5ShOM1eJ+O/8TpmtYsA9uSmgCAH+a5I6ihRoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHftsPkn;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD45606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD45606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHftsPkn
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so7226665ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677041; x=1795281841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
        b=AHftsPkncyeNzCw35cYmUb5uWh3idT8JrBvFxVGL/wN3/L35yj5itI78iLapXYJP08
         o29VMAhIEUoqPQkvbH0XIBQdXuM+Nl3LfgznI0+abVovu+waFjrr4gu0uahphbErnYjR
         MXJPLp4GTEzS/paquWKnCiSuP3EzpoerW3qyOZrejRL/wtV/vDak0btq6yY4m3cxXcUz
         oeUN9ZRW3g7Z6ZOmPZK8Jpo4+Wm0EfpFTB+VQ14W7IFL5/2XHuScyhlmd40j7bE+6MC0
         KVeTfHbO7CYLuEofYvoY7FfPzue4v/86hhWVBqKfzwlhdo1enxcPVukGiyJBC8waq9LA
         fMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677041; x=1795281841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
        b=cjT+7s194iYI9YkhOF0uzcgo65RrbqYqYWPOTDGPyFdgy42rMbt/vMA0rCXh3LahzA
         BqRxmksobovmq52TvRbd/qDbninlNLvd64R/qFaBBjzGMv1wk8GlcjayHb57j+2/gPNv
         Ef6vQXPBag8JJ1gitG4H3rJMNXh0/Csfju6FaY7S0uTlymYVvpMBQDqward6Gmau0R2Z
         XqWUALIfkrmBD559yfpH3eylUUiZrE0z3v8Yf9Qv3XN/QOURtEzzegQfeRPeg3cC2TMy
         BSAkyq1+qXssboUGBMYHauIQ1DTxhXoXtYpKzuzKqjQMjY9ergXiOJ4ThHQagR/WGb98
         zJmw==
X-Forwarded-Encrypted: i=1; AL+hErGXnkbnChsUHurGxusTiH5Qv2ORu1V9IVKZNTsTeUpQhYKGhKKuZ8sy51Gf2hN9l4V1Cj5yxermxLpjZII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hoqE/64n/j9bmNehep53cVjLtrPine1fHfVw1u+o2uHUd1S2v
	kd5WjdMZuuJTxim4iIPe1E77hUyhxdxLaXx/wdxv10EAwKmn0RGfRiZPnz9P4NHL
X-Gm-Gg: AYBFou1Ted9ICO8tamJxkWu8dI1xhiQIrCIVFSMs8TKtdY+v4K4AZcVi9EjibbbFfoZ
	A+oqK8WgFGMjdLGm7QAX2nm0GIVrWWK94ZE1mnyTBQFniu2pIGl9WjzKhf1k70mayMBTxIspPJa
	M2tQYOLVHc0GJ0DbGi55R+pQ77UYoQfBLZ0ZH7P7BTuo6vMaGwDzwJWHi0t5QtDtkmsPuy0bMl/
	NaNmJmf8h9McGYc8/DY45qBadDMrXWypa9OFXx8k/z3Ej/8q4lhw9ChqEW7zHBOXBXqwtmbFYpa
	7YESm5SewJkgmbjTsevRRD8Cf4QChMAaNOLw3C/mDul97Iq0+ntcGFoFcHDZbJRt72Z+hLDeMTT
	TVUllJMTKWIY/XylD8GjWYNZJ2f7HyEyskaFX4LUr4U+MevEvTJ9SjCFWxtWYuqoDUhn6gHqhQp
	5zhreikYUrvt3pwLK/sNgeshdRfO3HbWsng77IHFf1uw2hNY/x9NatIHOmXfActC7vwkO6uZ2/K
	F39UWrrDA39tYtGxVhvXPJfZqQcTM92vAtJF7dwMUtIou4eIKBs4dYLyC5axx8LxDh4rSlcjoOO
	hpqYQ0SNJQRIFvIivGkYFkndepK2YTE4kPptPaZpJzdjXLv7dYW7WxfNGyRTfH/VJMk=
X-Received: by 2002:a17:902:d4c9:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2ee0dc91820mr60268405ad.48.1794677040704;
        Sat, 14 Nov 2026 09:24:00 -0800 (PST)
Received: from [172.20.11.208] ([64.141.80.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad534sm22503985ad.9.2026.11.14.09.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:23:59 -0800 (PST)
Message-ID: <2d7db808-607b-4004-b9fe-8386ad4723d1@gmail.com>
Date: Sat, 14 Nov 2026 09:23:58 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/sp_SP: Add translation of process/4.Coding.rst
To: Antonia Ruiz <antonia86.ruiz@gmail.com>
Cc: avadhut.naik@amd.com, bilbao@vt.edu, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CALv9EdcctPgU2i2MJiQWwMCy=sDN2ridqbeWodz5VcaBhvj+Fw@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CALv9EdcctPgU2i2MJiQWwMCy=sDN2ridqbeWodz5VcaBhvj+Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Body is empty, Antonia. Thanks!

On 11/13/26 22:41, Antonia Ruiz wrote:
