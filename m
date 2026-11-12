Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517026;
	b=Ra04jIPJN2Fr+I38hRJ6Hl/cFh7PYHHgUGHOgFeebLpa0C9Vs2Uts8ugX/1O1T73bpc0
	 bfOBoGGuvDjD3SC9VDWEdcGEcdMxTugc1dPZpffRVFShHWJ0zbgzk/Dk+PtgKtv2zKxhn
	 kBimYip74iO70wwXDI+7LyQ8OE1SsWLnmU9VBErD/FQfuwp9yue+/cDXrH7K+jKgAHjaA
	 prXy/8Cmx7wuGHASREvKingiYfFArxGQ/+QNDkQ2/pWxEDLHg/cteETLXICp4JJv6SLre
	 ZErpVp5XzxbLrOHZSjHQ/65OniYPY2JowxFMc+0lmX8VTnA7s0Z96pikf/AIcnVyW9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=e68ELQiwpDBaPgGFwS4ZSzIkJMM3tSCd+P1yanX7rwI=;
	b=Ss+mzILsVLlm19LtZT+6McHwkAWe4XfrD0zwyRRPgncsbghmNEyEGYJjFgSnAsNoOnKy
	 RVVCVxbfRNYEUNo+H7kdQVzXD9pWDx1045k9HyIV/bkGkxtF50Jg4BybOHZigWlGz8fTS
	 mvQpntrqZ5HKrO15EK6r3y5XKN+ck+E1NwFtAcD7wepsN3hLpBZL5bAfj3Gp9QD9dS/Cz
	 /47iAGcCh2tSy5jDmckg2aQh8mJNrlO5Jn34Bs21Sxs4keGEhLUKUSdsn1XS+qW5uULOD
	 OtJFzwJues56IoYs3sjfLu7Haq5fyA5sbwGYskzayspz2d2ofCGmXQvUhT24g2pyQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxPew1I3;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28961606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28961606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxPew1I3
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so106112b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517025; x=1795121825; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e68ELQiwpDBaPgGFwS4ZSzIkJMM3tSCd+P1yanX7rwI=;
        b=KxPew1I3PwGG2pZNZWgWXa4GjYWse4SICR+kgrhTAZDwqn/mr4LrrF5//drxEAdXtS
         bYS4STAcG1SSMPUIni9SDqmZXrpmxeOni6KgALgJ1gTiCUL6YFqXI0nrvom4PRghE0Ur
         roXqFwE8BgMRZzDlrgZpzqfMFRheyGcwOIuMXB0daNpLM8c9FKB3zWwZUFH0hao00cVy
         JeLOnYefOTHEZCJD3sGAl43thCrm0qfXXyP3US7YtnQJfuTF8tDb+WzTYJEQw2InvPvD
         +3W1n1SHxOSN2SMYPNXkhbRABaanDfullkwvuhui6bphElr8BW5lVmwq0M1u99knPaUH
         3bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517025; x=1795121825;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e68ELQiwpDBaPgGFwS4ZSzIkJMM3tSCd+P1yanX7rwI=;
        b=J5qApg89qADCYG9OPZp2LVUQr+8GOdIv5JjQJliuqekddPrkW6D6klpokKsdWIRdZM
         1B2Rw2dxTCr92JjkCamGYfuwI6hY/ZAQ6C6uGvPj5RgKeANDpNvDot1vFR2sAy5DD5oO
         9zpw7BsbS7HmwwtbtuDZkDWVA+MGiAGzdp2yJDwMK7YOZy7GecfYZjsk52z7+9BaYGhn
         Rwy6NCK+i78xVVRjjyBRMSwvxYRf+shxnOlBHQiVAEFUjHVr2LhqZD9KZ67ZEzfgXyIl
         HRG6z2h+LAlwDxPBXuWmJM8HRuo42mx5Qv/6lmqBcj/pooH3MYaRsZ35dI7imkFoKq0y
         iibA==
X-Forwarded-Encrypted: i=1; AL+hErGyhNZmU3qdN/ow6i3rZ4GUPTv3C+tpLBZmHcJ7GXTPtvydXUGBOx2scN6SK/WEddaENhVsuGOBz3c2KaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HJkCYVGkWzTG+g56Vep9u98t/z4eE7/5S/NfOeIL8uCu632qj
	QX4cNB/2CifPKlCplub8C3kD0vNnbbHBUcXCkhBZ2kyxZXvmUlpNOZsmNIKBoA==
X-Gm-Gg: AYBFou3CrJNI3GA9C0ziAnGOTuagBY2tZbX6KLIJ3XKe53fTVvH6cpu8UZun2rdCxzx
	OS+9PyD7knEcBQtBe6X0Pg+tRHv4g5a/LHHANyHTlff2e2KHrhB8SBTw8ZmjZZquc5K/BJq9jpc
	8URdE4gut1QXOzrnosfaKjAaSqpm7umsjyFcqgGoLrc0ddEVVJwU8/qUr41VD0QturVIZBzOrhK
	eyD5aCC6PxArWSdjYS6BvQ4b1QUhkzy04gckktuJBu4tT5bpO4Y5guOw+Qo9/ev4xFdJkFzlixw
	pjRN3MS0KS3wyaKQyFheuKLM53Lzk3qavYFAZUZo2VJWZ1V/xuqOi1200cz6HmR3bVMTwskoRBx
	ysg7xd6LptoWh7iB2JpRJc9JuH52OKHj/PaIOjNwUIeOrxCFnEDhTZBpsAL/o8Us5YfvVbpzpGr
	HP34YSu+06dnU1SvNT/g4fPHmQ39wdZewdj8MieBzlhSnSJAD43+4Kqjrc/9AL8n8DnQOtDNmu9
	6rZQ0mMmZgP6ox8QMfXy2+P0z65IP53kA47BYzTnBFSTXAMmccHirJnfxMSr+QXEqDLgDgx3DQS
	ONpoiePeNI1zXskr/dKRhOyvL2aJ1/7EYosZK42F/NMKc6K+LPzBTW1MT/ZsrnhIxY6CGM0z8pm
	ZPX/vUoKADNjTsw53MQGj87jYZgqG6kw+UA==
X-Received: by 2002:aa7:9063:0:b0:8a0:3ed7:93a7 with SMTP id d2e1a72fcca58-8beb6396804mr736741b3a.32.1794517025098;
        Thu, 12 Nov 2026 12:57:05 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a7edbsm134654b3a.18.2026.11.12.12.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 12:57:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 20:57:04 +0000
Message-Id: <DMTJ704LM94F.W2LQRVNGZAJJ@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf v1 0/4] bpf: Scope callback arguments to their frame
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261106231157.2840635-1-ihor.solodrai@linux.dev>
 <2785198b-ca41-4cee-9dba-bc0c1e6e8f25@linux.dev>
In-Reply-To: <2785198b-ca41-4cee-9dba-bc0c1e6e8f25@linux.dev>

On Fri Nov 6, 2026 at 11:32 PM UTC, Ihor Solodrai wrote:
> On 11/6/26 4:11 PM, Ihor Solodrai wrote:
>> [...]
>>=20
>> Ihor Solodrai (4):
>>   bpf: Scope the bpf_user_ringbuf_drain() dynptr to its callback frame
>>   selftests/bpf: Cover the user ringbuf callback dynptr lifetime
>>   bpf: Scope the bpf_for_each_map_elem() array key to the callback frame
>>   selftests/bpf: Cover callback-frame map key lifetime
>
> Alexei, if this lands first, your pending verifier rewrite will need a
> hunk like the one pasted below. Or the other way around.
>
> Without it, a join can link a value to the wrong callback frame.
>
> diff --git a/kernel/bpf/join.c b/kernel/bpf/join.c
> index cc4494aef187..92b94e18c873 100644
> --- a/kernel/bpf/join.c
> +++ b/kernel/bpf/join.c
> @@ -464,6 +464,9 @@ static bool join_func(struct bpf_join_state *js, stru=
ct bpf_func_state *fd,
>  			return false;
>  		if (!join_loop_stack(fa, fb))
>  			return false;
> +		jid_note(js, fa->frame_id, fb->frame_id, true);
> +	} else if (!jid_strict_ok(js, fa->frame_id, fb->frame_id)) {
> +		return false;
>  	}

This and your other set no longer applies. Sorry.
Please respin them both as one set against bpf-next.

pw-bot: cr
