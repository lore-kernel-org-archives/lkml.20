Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195474AF67D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637876; cv=none; b=PWb7ScrKf0x9mFZhC+Nk1L27rgtMVUdE20DlqhPJ1j5tfHcvgNbjb8jFVG3j/VnyxxA0vUnoLvPJyGtd5JUiveyFtppC0Aoc/Mg0yeCH/rrtULe/M49nSTw4Ks64ziKQ/WnPbNpCXhqzgt5WjlGaO0BFelwgPSP6TyggfLHZBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637876; c=relaxed/simple;
	bh=GUFd8mGjHKrlTe3TFpZTr9P7tWYu1BKoDQiHRjrkKTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5nc0ru1KWswFBQXCCw0T7ST+OhLwS1hYtWP/JR6dCIEDMC9M6czt/Fw2WxMWibeAOnTfBnnhmkAWTuTqh7e3F3voYtW0qY/rhVPLtLx9yaSm1cpbd6blzH+CA5NaSUKeeQKsFCUzVXZPserA4o33cjB4dPs45cGfDCQmwvhRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMOyw2+O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P78G9pEz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMOyw2+O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P78G9pEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789637858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
	b=TMOyw2+OyrwdUQju7/La0dReOxTcukHM4mwnSZ5cL0EFhS9wCE0jQIpPVMw13JMNuVqydo
	1B0umawewmO9+umREOx3MLphBznL3pKyMI752RxEFz3b98ZrvgIyC00g/kGZOOmRpNKy8r
	jUY8PYG9SGyuwVqAta9n8e+iGYMR5ac=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-bbRZEHJnP9akddJVaQKuiw-1; Thu, 17 Sep 2026 05:37:34 -0400
X-MC-Unique: bbRZEHJnP9akddJVaQKuiw-1
X-Mimecast-MFC-AGG-ID: bbRZEHJnP9akddJVaQKuiw_1789637853
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso4683885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789637853; x=1790242653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
        b=P78G9pEzKdWua/AsuxGaQUji76/dWLic18q3+xkAzaiioouwjizYgwQLidIUxw4Q2N
         ux0CjBFODgaPPQOUl99frwhH311PaiEiGnHR5sU/Is5QKvKRWU4eCux4Z8wQw8WoCsIb
         rFwEpG3SHg0+g4hn/sB4G4eo6rv7uZu8p13hNGrbc7M/jFmIoXNv+ibhvrUgeTvuNxuK
         dWIBIXvQcR57CC0FFWixfpnSPrJz5ZjkFCAflrltLz+R7ozGEE8QZQm+pQvfiLKzYOs5
         TdaX3CRi67ghOUFT9aLitg4MSdKqnY1uVPL9tv8aSz5wOepBrFq2Ak7yf5Lc4PRSxZOK
         fCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637853; x=1790242653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
        b=2q/aDqW2M78jZj8rPKXDB1GQeStJvRJtL6YM+qwEiN4f2e8TyDFwb2/hXRWFV9neUw
         1ASjEUlhWkF9GHmSWI3NnWFTHOOZg8PWQgC1Y0u2N+1SIa6+blIaXW2g7tIqjkUVh0/i
         0J37gtrN85neEpzj91Z7ob8t8GLBiqJxzdz1uzWjo0tdPi8imbu8yW7MxylQoJQTMw6T
         XwBG6TRffc8r5gIizQ/3262xyD1I668TAtblKr5r/dvxQ/Wy2/ykRLNL3iSHZ0rIzuH5
         0bj7vBTKIU3JEP0SKkagE6kqwzDtjyBuewW01qvDKTqLoJ7H3qeXje3hyy5cFus/5FbU
         6ewA==
X-Forwarded-Encrypted: i=1; AKwUvBxKrg0LIAI6wqu1fr/anqbbSDsdkcOMX4Eo3FfCitWhiFWuHnlacEGPDNTekQS36p+dkO2HujKyUW67xLs=@vger.kernel.org
X-Gm-Message-State: AFuF++mnafklqfqKPfUCr+Z81j+Z1a3Yyp6fGl3koeX0jlj10DNib9p/
	fVs5tQtNA/fXHyONdt5+Hs8fUDDueNstPLlitaf+9hRo15l4lPjCMog83okluB++6OI2J/B/pG2
	+tz0Xn4I1rkY/8HRhuz/Pdkhhba2UD7pbUmXfsCZGpU6UnNPSlRbz1ZC+5ftZrBNxQA==
X-Gm-Gg: AYBFou2WKm0XFCbvKtop/AzgKQAnwaQ9Mr1btVXPtcCh9bpnuFLaCcB99jtepNr4QGy
	6+vgk+LrEN6rxsKIqaczRrcUlalzXZzta1nXeoIEt23ntyfbQVaFfQGZzLy6XrM+weu6UAFU5SU
	8fyXBeOqwBRWilh8bbMvRugJ9PDOisLk978ytxlEidd0Hf3RlWJw7/6DHbj+rxQjUonRfNhg34E
	Na/g+XBYtlv9ECsFxHX9R7gTlzfZ8l0X1o5SlDIvSyrWtzNy7e5V0c6+QZGTrFI/4CAZLH0HPhn
	cxRJ6d8+YWW3EER8hgp43Nw+GdYwx3INgz19yg/HGs5hvgtbPyW9LFLQjhDQDikj5BgAqnj5BMk
	tsoIB2C53MX23pJHrLL+tCcqs+I+fuxhzJGtr/B+m5bY6J95ys1Q8F6U/T8n6AiFJq6euyt0kNA
	==
X-Received: by 2002:a05:600c:1986:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49eb732d3f4mr63786805e9.21.1789637852989;
        Thu, 17 Sep 2026 02:37:32 -0700 (PDT)
X-Received: by 2002:a05:600c:1986:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49eb732d3f4mr63786545e9.21.1789637852626;
        Thu, 17 Sep 2026 02:37:32 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm62963925e9.6.2026.09.17.02.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:37:31 -0700 (PDT)
Message-ID: <f2444878-9676-40fd-878a-c69472229d16@redhat.com>
Date: Thu, 17 Sep 2026 11:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] selftests: net: Exercise TCP payload
 verification
To: shuo huang <f64116045@gs.ncku.edu.tw>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 shuah@kernel.org, jiayuan.chen@linux.dev
References: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 02:45, shuo huang wrote:
> This series adds TCP payload verification to udpgso_bench_rx and
> exercises it from udpgso_bench.sh for both IPv4 and IPv6. The test
> checks the receiver's exit status so that verification errors are
> reported as test failures.
> 
> Changes since v2:
> - Wrap the receiver command in patch 2 to stay within 80 columns.
> 
> v2: https://lore.kernel.org/r/20260911160649.51863-1-f64116045@gs.ncku.edu.tw
> 
> Changes since v1:
> - Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
>    addressing Jakub's feedback.

I think you did not answer the more fundamental question there: why is 
this useful? I don't see much value on top of the existing GRO (h/w) 
tests, while this add a bunch of testscase/runtime/resource usage on the 
CI from now on.

In the current format it's IMHO not worth merging.
/P

