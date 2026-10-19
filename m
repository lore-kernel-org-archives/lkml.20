Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66A3603DB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383118; cv=none; b=Nkl5ULLYNCAAmgo2rER4pDF+M1A4rKh5NggDeB7y0qM8VYV7WcAe9b7phtRIiBayzi6CtSAgurrBn0ONgw0LkDibsF3lL/1wxLN2k8QY2G02khPC7ZL3MVL85VvUZQNq3SrIWzEkKKHkhsfduErV4q/ed1jOPbmudt8EEPGfMis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383118; c=relaxed/simple;
	bh=Gyt6ha969KUHQxQPuh/s8Hf5K7QXr0NuPykQZun3bvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwAiQzrWpi2jN6wVCxSN5Dll3pIpKNcrPMes4r2fSZphKWo8Gjwith+S+xSokHPF89WtcJTTPowBmTHEocJ3qrp+EXCYwvaiiKsEFro0sSSCafddmQ0KR6CbSnK0JpQ3JD0A1/mVI740hqEs2PNJerYwwkDRwM7fk3fDw7FbdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7zUea2I; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7zUea2I"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35d7fa491deso1943966eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792383116; x=1792987916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU57XbVpQ833Hr6SJRavUp1FZo0BckbSiKcwzJSb5wU=;
        b=S7zUea2IJhFg7cFMFtMoJx9iNVfE3je7aLDApmMY8CQv/P3X8HZ9rBKA4cJLrn1y5D
         RJehKoa3RS9cooqP/yuQXkymX5UdE0TNXlo7GFDfbZRIumlJS3Td9CQWeQTjbXXfwcRs
         lox5Wu6Xnz5fZlMEehLwTFl2ybCX82jwNXKU7l7ylEosKe6O6XcPuVtjdgwje8jPqWEa
         IQ2Bnx/kEBPaySsw9Jd+Ej6oOgNZlwsW7fBEvN1NULyebPPOTbdXrlYaIYn5LLUeo/mO
         +iXOFhpYLCnrWK04h6Kg5UxgnbWagzLMMzGSGrNfD7w7nbdEx+k0mG65mmaTC6mp/Yvj
         2bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383116; x=1792987916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU57XbVpQ833Hr6SJRavUp1FZo0BckbSiKcwzJSb5wU=;
        b=KJg+TRd2/Sy5U1oEcoimkSzwD1KIcJLHhvBOodbD5qsTyS8qUq/pz90qVA8vzX+Paa
         Ydfs5HXN3pMwoC/KGMOz/+D+qc8WWFETU9YD3suhCvgOmX0FKpIErkqJ2X3+J8HJ2s95
         lwgG5Mz8DgXELrFBxvTSlnWQt+idvz3NxiOrzOmcRdHuPuRba9WbZRp282hJNicTHPia
         mVkHPvbhgNdUF3IqXtH5oOeUIwJeFreHmkhn9Y2QFHuWu+fy25y6+jWG/p5K4nr4RQ6R
         m1QcCizfXGcra4on6rzOtdMAAo0424XjYZ710TiWPhqa2toRX5QKqurBrnjPTdIS/664
         SAOw==
X-Forwarded-Encrypted: i=1; AKwUvBzGVUhBLny/cqQCM0xgaj2M9RiuQkdcEfwgnZrvyEr7aiDgMtgy1cD8QbROWdrj/XAul7EUVu+0BoOCVwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmPv4jYcDHkuqOQ0sCYoBxAptsBs+e7iDORtBwyjRL/1mS+hEu
	rrFznIR5qjpKdeCNlTFtLOp3wazCjrBYY0kexyue02fsBXrBzy46Ug4P
X-Gm-Gg: AYBFou1PLIWg/UKwSyfgoJnvglBNOVWaRpJsAbgh+oPiHbki++8/uBNiVw9yW21dgex
	I1AcYqWSEt7sW5BQ8TzzJNS1e7DFTWXu27C6/4idT+xvVJCTUlmJiSV97OeWCw2VG48cRnMgALo
	3tToQO+QbPRUrzjB/T5SQ2z0ItxImm0kKAkU4QKYX96wY3JxVUK/1GwupcDNsSWXq3HS0plPWn2
	DoM2H3YESCT/iB5Dgrivq/RHPxqmyopeKRJ64xY91K8hUZdqnrYMDi/AezW+V8xlnctgYJ+OdMR
	3NcKsDdl3w7YsUoDoQQz3ehDxplk2S/6xES4MlbVbzuRTTqWBzi2/qfhLdSSYKcDr2f9Gg0okUa
	IhHcRkh35bUwBQtDgnKCSqP+eGqrG9bYnZhx42dI5p5gULitWQLM4kCm50evcx/CCjL58x2t0aJ
	vJLeafcdXJE4qmGjz2C4C3W2bMeA2yo4id04tkY4z+x7uYDngOIn9EFVRr6jg0j3AxlAdIVz2eG
	p1YCqT9UWrmZkobqCEw0WJo0cLWjElAJC3bJDv5Ks4E5BdOVQ==
X-Received: by 2002:a05:693c:65c8:b0:34c:6edc:f4d with SMTP id 5a478bee46e88-3619ed15f04mr8711921eec.1.1792383115871;
        Sun, 18 Oct 2026 21:11:55 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:5200:e917:1926:549e:76a? ([240e:38b:e68:5200:e917:1926:549e:76a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm28296713eec.13.2026.10.18.21.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:11:55 -0700 (PDT)
Message-ID: <966ea621-9d1e-4d52-8351-5dcbf88f93b7@gmail.com>
Date: Mon, 19 Oct 2026 12:11:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Weijie Yuan <wy@wyuan.org>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Chen-Yu Yeh <chenyou910331@gmail.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <atQ_mXYNqs4tnDpW@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/18 11:40, Weijie Yuan wrote:
> Oh, btw. There's a comment about ":Original:" from Jani [1]:

It's good to remove them if no one needs this. But I didn't know other 
type documents...

> 
> | I'm wondering, are these :Original: fields useful anymore since the
> | translations extension adds the button to switch between languages?
> |
> | The pretty much hard-coded expectation is that the English version at
> | path/to/foo.rst is the original, and its translations are at
> | translations/xx_YY/path/to/foo.rst.
> |
> | I.e. neither the HTML nor the RST benefit from it, and it's just
> | repetition.
> 
> Perhaps we could have a bit of discussion here?
