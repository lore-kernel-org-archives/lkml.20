Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409349;
	b=SyNvWfLNYmIIXevR/WJKpZt22s0RnZ4p+LDKqgN3W7IIgucUiq/wzsxO4NpI6Rm/aQct
	 HXf6gm2FjaIyuOqJwKSppRiqS3oi5G+nqg+U7Hjfqu6glY0ahP7h+aKysKkcdc5H8UN3p
	 1NyDraqaegtqai6ioeAoPKjVTOvNUGvkksoFCKxaXOkejJKufU7TmtpYf6ArscNdSVjtm
	 /f6GaRYVnAxSQ5scsoU6/NO/6W1RVqIhvRf5OiqNOMVvSkiYLeUMWVWODKSL/bF3BG+r6
	 /GwSpDOOha5yUU6UUVSUJVoxy/cueGY2qzNCrjqfNOriPNMFL+MNUACmQykNA7CZD7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
	b=eZWgxlwjeueKfcjWJ0z/jqXbFUbU4fwPLGAKN4HC0bc3EOE31cWqad0+87+g+Ie7xUUD
	 FrAzRr2gHki7GfUpugGC+aURmX3Qzt4pw18QRcg+g8GppxPXQw1JmqgK+TXpqEbqGbJfh
	 8oSIIAFL05WU3tbIzTAKTlSUMUmstyqt2N75uKigFT6DNSx7+rhm/VRoffcSVRYcEpRi5
	 NeQVsnn2fBVcp7TvqXShgupyho9n3v/HFG9u/MEiioavx94GrrcdQmWVIS2UxBW7BARKQ
	 46/Ri2PnPyyBJV3sroPCHpUEi46Wyi8ynLSs506ef2XqE7vybOLLWzZx+nAj8CFuf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV2oKj86;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82136606A890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82136606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV2oKj86
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so1978639f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409348; x=1795014148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
        b=lV2oKj86b+xYFtqr8A44TZfibZOkFAKibDBsIgxGfdlp7zekATSe10jMxau2SuDNw/
         lW9uq+mbvvcHhIUr/ROsAIHCMw8LL3hojR8wKa4jMWX7473Y2rs+X6Bujwys/jFosKkF
         hEtdh50Gq7hlJt93h8XgMomMVA0pa/1RE5HOx7GNHerdftgqpjBWDy0wzkcuMVEO4Ppj
         eJqAz+TFldEO2YMPZDnbFroqnvYIb5mzWI14tnXafPm4kYycivxTLgGtLjUtQAWcokbA
         H0fhbDrSZPtX5Qu6rdZhxBp5rhNEbxsF4mB+/s/4X5z5lUUgLDDwxXQnyLo8aF5j5tTg
         8PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409348; x=1795014148;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
        b=cXhnxz1bYE6Lb5wyNi/6TtrrQyRQNwplN6j6Dw+RWwRWQGoV4boCSYV4JvstX8o3cH
         XOPdj6mSWasObZjVfVD5WtPDwz0FRt/W+6D9IxIwnxjly3Tz7T7G6RcJWs+pmhIoWrxg
         YSwUeHysq419Kvh1U2NAiQY0C/L+pweRGYTYzslBK7y1StSgrSevbZwn9Fv4NCYPuz8E
         YIt/lIE+p1YsDurLJMh7zjEIhxapAgKJYu7vPGQ/w0gND8all2qQdbS7398f/wi1DJkD
         3qLRsZHZIWa2mYp8zpIT9KuTygYS7N8Q47SozUxNfYlKMG4t09Gi3ifWXQYOHvq8nVmA
         pOWw==
X-Forwarded-Encrypted: i=1; AL+hErE0nAqL6YwPjeHNhTxZrzR87h8GO4Ijk+UNUmXZ72DYrEe4sy8COLp/G+ufAV1E5gIIqlwoqDFyGLRJqzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iOqdivfWykGHNiLeZdS33xKXglEqZ2k7YbrO2P5XtAEXeHc3V
	9RbGxKDwQ+qQk93MxC2p9ZbeiVZXHL2iLt2kEG0mM+XcSwzmbd5MpsXe
X-Gm-Gg: AYBFou17j8gJGQ9cm9FnEekRcii3stsCP9VhOf/IZUFJpRUUzd4WCGRa7VW1az3w86U
	91+5vabbWkusC3AH4jPW2+2pLuxUWjM9ROsdWdfoacv+7CwZXVp1SsT1zWtpdRlMFJwL+mzD9Oa
	uFH1jCqs0cmSGeWaWkWtrmEVeSzdX3lM80aB6n4dEVJKuRB8F3Qyu8wIk0v41VwdfmCZuqtv6kB
	vQXIbDPJMOls4xUVLYchz8FxHSm79h87BySq/ReoZfQilpik9mNhMsAbN0DNUVxRxkEmgLVD8E6
	4pAsxi7d/KvcLFaz3k5DtRb4nmDPVNdl6UpKxLnt1zVkrVM9JFYbZ34q9GQzR0gzjFqoa+QaoOd
	S35H6THIU+1HuTsw7CEuO8i1uyfoEP+TUPAN12xmqduMP4XdAQ3F1BG8YIFEfhEV3guYsjQ6fTN
	yG0jHd2wbe+OdGBlcblW2x+ojrIEC7fk1wHF5RKi7sau5/rw3WPqdry/4UJoovz+1nEahqqTB67
	TvIzV3zoLhWyZU4CTLyg4MsoC0Uz3gMkfszJBlulRqZk6Lxab++HiIN3Am7b5xrEub4BQ5+bG3c
	L6pvApLIodldJwSGM5uP809GfHGozAGrgWANN6RrBo7uPdPnTupMO2JOVbQty3CyiAwxRWFnNmN
	TD66gRXnbGJp+xluQBYmhR1o/
X-Received: by 2002:a05:6000:25c6:b0:490:f775:b00b with SMTP id ffacd0b85a97d-499c7552647mr4331095f8f.52.1794409347645;
        Wed, 11 Nov 2026 07:02:27 -0800 (PST)
Received: from ?IPV6:2001:9e8:f118:9201:bc72:ad54:993:306e? ([2001:9e8:f118:9201:bc72:ad54:993:306e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10669151f8f.29.2026.11.11.07.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:02:25 -0800 (PST)
Message-ID: <1c42a9d1-643b-47bb-8f69-0ff0eebe5d47@gmail.com>
Date: Wed, 11 Nov 2026 16:02:24 +0100
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
Subject: Re: [PATCH v2] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111173546439alUdLx-iD6-ISoa9jqS5H@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261111173546439alUdLx-iD6-ISoa9jqS5H@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shao,

On 11.11.26 10:35, shao.mingyin@zte.com.cn wrote:
> --------------------------------------------------------------------------------
> Hi Jonas,
>
> On 10.11.26 17:07, Jonas Jelonek wrote:
>> I think you still need to move it up where 'unsigned int ngpio' was
>> before for RCT.
> I read RCT as ordering by decreasing declaration length, in which case

I understood it as plain line length. Not sure what declaration length really means.

> `int ngpio, ret` after `size_t size` already complies.  But if you want

with 'int ngpio, ret' being longer than 'size_t size'.

> it in ngpio's old slot (right after `glm`), that's a one-line move --
> say the word and I'll fold it into the next revision (v2 already has
> your Reviewed-by, so I'd rather not respin just for this).
>
> Thanks,
> Shao
> --------------------------------------------------------------------------------

But probably not worth to respin unless something else in the series needs
a change.

Best,
Jonas
