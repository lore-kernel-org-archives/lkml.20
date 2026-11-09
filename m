Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234089;
	b=xCvXSBNsU5KduNdlEXoc/U77IOHQ+rFaTSlmPX3/aPe37tFYz6UT9uqHuwBnQ5RZXWSb
	 OjOsVvLn1bt1Jvg+GPY6M1X/9uTwqPyMKUaaTXiSixfqIiMz/rryObZm1cMzlEEQtrezH
	 8hN7tHLzYHsIUtIkUgCGUAY+YipqrCa6hkHsvg4sF145g70yQw8udtJ/lvjnxGvCh2ho7
	 YhVPgd2yqTCXWQ57dEs0Mf7w3jFixwjkPYByPwZNsDZHlHMsqAQXiwH8PKDlNp2FIcvlF
	 5iwYaL4CUMbOON+znaJAlinOMXSNVXGv7TEBIG6qfx3VqgzQeq3IkYAYE+TktrTt5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZlIxQgQkpoK4++KHMJP1Vagvvtw9FxQaLlSgPvqh+i0=;
	b=iPib3RzEYI7/uIZ6LPOgdCT+9+Qzs8j1XDzz0BSysfKYbJlJTUMYO8ih4Bh79lgzYNGW
	 jMeC21cgrdUU+yrEmGqG1SQUqbTnpDa8x09bSEODuoSMiQIPP7Ca/r9AeWM66NSbdjSSD
	 pGqACjnvlh0HT2CCUmdTQ9HGYxZtEHfnuE+Gmj7nejnAzRynZRE+PeJO2oeMk9taiEAAJ
	 24FjDgNRS5eELhkpJWOeiv5wH2wNYb6EF3fq3mwyM2VneypP3hpGe1fGACohAm/Db1fgE
	 7w+3Evp8kLwI0xEHx/RKtmRATe9xy6myUMtYV8I11VTvy8q2WmIPtWmB07A3hfgTPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OcYLfIHK;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE9606D834
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDE9606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OcYLfIHK
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-702dedeb70dso424148eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234088; x=1794838888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlIxQgQkpoK4++KHMJP1Vagvvtw9FxQaLlSgPvqh+i0=;
        b=OcYLfIHKDGWPIkpQdoc2qr0jZBENOeJrMdQyICFMfpRCrPtlmWb3bmhSmure0jyb6P
         KamYh72D/xCqKzHqk+JVv/7eWwpz3ZXYc9MWphsDRVIEvCSXY2zR9S03T72zlLIwW/Nu
         GNNUSY3S7iQRkAd0sw2HT7V/u6wrRwyjEgRYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234088; x=1794838888;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlIxQgQkpoK4++KHMJP1Vagvvtw9FxQaLlSgPvqh+i0=;
        b=rV872vJ/H2jDXYSMCYROeXXy8bSr/k1qvAJ1nxZwaoPb6NJdIQVydrj+qBWYbSB0va
         sci5GrK3VzvI8XrRv67EsRyDKvdjACKK5YMnZKef9sIJboRbBzqLuJFuM8kIF1S7kXPx
         +L77KORB+z9U0CQS9G1lfm8fetpiDRh0aFUV3DZNARrI6HAeRCsrV40thycGv9HXn5Mq
         s1OThD5c8A3hlYgDjOOrEwJ9qavx7djgv+Jq9DNQGA6Q+Yl3M/RdUgN3ygrYkcMe9bJV
         /HjML0ecDg03zb9A6b0VKLUnSI1vgQlcUNWIy/vCOC9gcqXt6OP67Ia7J4rXt0+/NKKK
         ujPw==
X-Forwarded-Encrypted: i=1; AL+hErEMjuj6vx2SIC9v6OsZr6QYyFY8BX334vWEOAzwyOKv/Spjezl6Js3jH6ttL7/DZ5RYlD//hK0abtzKDkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dt1rFTwsxT4n639xpbClpSLOPIWDrlkgxdkwxxldG0gY0eie8
	HaB3AwliUYSSMaWcgriO0XOo96ftyW0IAX0vq5LToU/n7EFLUR3AAZ1UDzg/goV/2sVe6jfj1jD
	VFSv6zA==
X-Gm-Gg: AYBFou2otzMXBfljBZ/fsh33sb60SDWqjTPOdJRvJYZ6Op3N0BMyyzIOzf7oFkIkIJ4
	3WtTFswrinqEoRAXZeKLbbGdJwq4ALz7y21Bti8P6zzBuFCgXLM2b0HwB/7VHmxFRpXYUvuJr4b
	RpS43+HDmI/sHQedzIYxaAJ+g0mzgyc90fhSBjWk2Mid5K/xtA8lwb2CfZTE2IbeB/hat8HXQ2w
	BEpWmNMXwwT4TKC9kxjDlU6tjmwgxvLk9/r2K8Z1XyDL7vsIp3O+eTfQvvSLc865QBg81CdQQ1T
	X92b7Rvqhv7fFNCfZqwD7QXmCDaF9t1Os27T9N8XMakS4PQC2usYqLmaUMF/R3cmRKax8CmCFnj
	+oQ3U6smPBVdw9XVsysPPyMZB5ioFbs3as6Khui2NVMizerhRjWzm4byrT4z+tcX5PGxV8WY3/8
	FyOpDnRkxtZOlS5vYNyBzJVFIj77ct5E0cncsIDKdJM6E/Xb7P1Kv52yL1SZpSfD6Ioiy7SClFS
	xf0DuT0g7p93fpo40DIz02YkIVNUI4c5cd160r5o/okdmVzHINpfsNfqSJaRV47zmfq2AY0V9qX
	1hGj6M+CcVpYjMk+pYnukIQ=
X-Received: by 2002:a05:6820:708c:20b0:713:e423:cb6d with SMTP id 006d021491bc7-7170f25b316mr1333819eaf.30.1794234082937;
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-7170f8cbfbdsm3339213eaf.7.2026.11.09.06.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:21:21 -0800 (PST)
Message-ID: <aa84e372-932b-4385-9504-f3d457dc3e2c@ieee.org>
Date: Mon, 9 Nov 2026 08:21:20 -0600
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
Subject: Re: [PATCH] greybus: reject messages with claimed size smaller than
 header
From: Alex Elder <elder@ieee.org>
To: Zhao Feng <zhaofeng2@cmss.chinamobile.com>, greybus-dev@lists.linaro.org
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20261109013336.1122-1-zhaofeng2@cmss.chinamobile.com>
 <f27cb885-76bb-4d2b-b863-437c78029f8b@ieee.org>
Content-Language: en-US
In-Reply-To: <f27cb885-76bb-4d2b-b863-437c78029f8b@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 8:20 AM, Alex Elder wrote:
>>
> 
> So the problem occurs when a message arrives that has a bogus
> header.  We know we received enough bytes to hold a

Sorry, some combination of clicks caused this to send early.  I'm
working on a "real" response.

					-Alex
