Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620B41F7D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341750; cv=none; b=jS9WrdMq1CPUNpUQX2qoXvdFptoX+Epr7CE8XovIffWWHk2j/isBTFssYZT8XrwqtVU7EnnuwRKVupCsjA7yHbJkAwr5xMyiw3HSJRczCrQIiidndtyg+u9AKe8Prp1O1Ri1TB/2mB67S+P/ofUoKZab0/FlKK0GafKQ13iRW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341750; c=relaxed/simple;
	bh=iNo/X1HOk6SUJNcB6uVnTG8Bp5qsoZbcjIchia2Kcjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDBrptG1eD+oRkPFOrrO4/OUDXD1k/Xkzu/zWC+KmDL7O45abEN1/PArjij7s4AwC0EgjL7JeGXyYL6On3niEV0/05CsqdNNUIDLoDsaaMBlLUJGw6c8bFMcJG+H0NOVYWbPQPjT/UrSc2LJrSLFfPWxu4YkH3ciNynurCCDCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EOge15Mv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EOge15Mv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so853773f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341747; x=1788946547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/LlQ50v0hB0ogjsIKinQ4rbE52J+HgLlzftTVo1r9Y=;
        b=EOge15MvTgAdmNeo5esCajAp5M+aMEbtJqSU5hbPO9rHke413eR6pdyNv/qbL8l9o3
         AgJAwUhc17GP00J12qc9CjHZKyRpefUy5yXFasf0lh72ede3V65JIt9ecSywXH0aD+5m
         uwVvtxKZSfgvTPRnWSpnRgsdP73l+RoN/pm9xd/b6YAE3YyjBv96AroHLCAxxnvwD5Xq
         2KUgEZtm/lewFcrIpBlQehHECFkP4uczquBxqpHt2if1BFjuhkGjh+MVS4nwyFY6Pv4x
         zKlri44BlAJtaW8HIvImMEgq1CyLyRP4KJyuGNI3iKsfQosYhB0etVQbqHKHP4KZ+m9/
         Oopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341747; x=1788946547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/LlQ50v0hB0ogjsIKinQ4rbE52J+HgLlzftTVo1r9Y=;
        b=RkFv6k9RNC7k2tM+4oUFsh2mcKB3jZ6YMI1wNAWJeQOBdQsoXvmp2LfHW7rXU7fUlC
         TPo/4r0r3Yuive98B6sppg6GzfQjbL5ReLyrVxEnlElZXc4NBrUgWbKtCBPEjrz5bC/C
         Wbj8es1PXEbhVDj5ydKKMY4Mbji8ymi5PK0UK8S6pxnLHpiSmyWAuuZry6vTTQuNsT9X
         2vJS7jEWqstNsgA8fNbDWhazDi5u3xxWFwWv8VYF/usrv7HeETRWTrpn6ljM2mK5491d
         yKEHnYT5fnKrhzPvCX1HI0cHsHELiW6ev9SZZlF4g/0AM/p3mqOIv2alDjN9uAMkJOhW
         693g==
X-Forwarded-Encrypted: i=1; AHgh+Ro0zF+GLQ/UzON3z5HOWbbMVim+/ZQFy6w7RRwbfUo+a0C59iKYzLGDkvixA9I3hMbpDHLUJVrfqY4OPN0=@vger.kernel.org
X-Gm-Message-State: AFuF++kNR9kef7hn33A+qPTN2AjOgy2yWoOwYlP+UFnoe8/Nl4dFPztZ
	6jOi0MZ8VIL4CpdyhFUSTOCnRcCN5nC27wcbIal3UFmkq5oKpHTyjBLh6HSTtpYl1qQ=
X-Gm-Gg: AR+sD10IydkCBu65jTJLDYbQyuorBmExdUnhC3difwMPW75p4KhaSg7EiHLU6Oog8ZJ
	T6Pe1crKXWnAoRatEz0ItHB3u0lR1ES3OKrTCCMYNcfnDZzVYKxCd18uH3/eHWm6HG/Mm2jhFM9
	4G98EsVyoDRwHvpeHEfNDlEBi4+16yLtG+dWu7G5jtnIDNy4/JZSmOkV0icllgQNPyHdxNKswDy
	8hJ1hiLLJHw4fSIhlYO9aA+C5l23VxrKAAnl8XLY3BeD0KNPhoC4xW6tVxSggT2dxhTDex/wmeS
	UQ+N0DFBwBplMJQ5VIgIG2x2sQvWivYjMF0ZFuHx4WurG1x96jS3AvP+4rR64YCDkQV2hyl6mbT
	hybatUtrY84IXL9c95I8HSwgL0V8Bj0xyTtVUWzbRlE4HGvZeSJqmbIfqrs5dud09cHxh4vZmRq
	Aa+ry4FrFwQ/yn9hKNEYw02JAvrN+DX5ILTC3AHgn4FT9SJnarMbSxxbvXrteHcbD84vaqP/zVW
	4N9rYF5HgUcETBMXeD1Deus30hjVSu1Dzc0uif8
X-Received: by 2002:a05:600c:45c4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49ce5816186mr58880035e9.10.1788341747117;
        Wed, 02 Sep 2026 02:35:47 -0700 (PDT)
Received: from ?IPV6:2001:a61:1304:a201:f0d3:bdff:55cd:3f16? ([2001:a61:1304:a201:f0d3:bdff:55cd:3f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b401sm134005545e9.3.2026.09.02.02.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:35:46 -0700 (PDT)
Message-ID: <be2bbb52-617e-4b9a-b8a1-ed5c2faf81e0@suse.com>
Date: Wed, 2 Sep 2026 11:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
 <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>
 <2026090159-aspire-vanquish-da99@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026090159-aspire-vanquish-da99@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01.09.26 16:30, Greg Kroah-Hartman wrote:

> With old hardware like this, let's just stick to this "obviously
> correct" patch, and if someone with the hardware ever shows up, we can
> then test short message information like this.  As-is, this prevents a
> simple "leak kernel memory to userspace with a hand-crafted-device" bug.

You are not wrong, but if I put on my security person hat I cannot
ignore that we are still leaking information among users. That is
the obvious fixes would be memsets in open(), not in init()

	Regards
		Oliver

