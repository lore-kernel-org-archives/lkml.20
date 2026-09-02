Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A8C49364B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353005; cv=none; b=Pa1HOW2kLk+9WHyhFGtvRyOCTfb+juLUXtEFk31QQiUGmMNuKmWrWK6J4I7VARyU0Skz5xuc+V9CiP/YDVhtvHeinNYttzPs1D3OPDHegwmm9YMMVakM9mvMXT6hB+fOIaaJz9kS4A5H/xoCjOByFe6I8PIPiD3pSxYe6WRf9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353005; c=relaxed/simple;
	bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaoaEh2rwU6wWqYUoviZr4xybhQ+DClEo37hyBmhlgBjQIucQrWt6QYwL7QibYhd46VKJwDgJ/lMGOzPGOfZVKcQUxObEQ33guXkIAMn0/dk2JozUjjjtf7Sii5LK5LVE7m/djD+cHGE6mVHekR6pks56jSvibIZc8H4Zi40soM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXPC4GWq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXPC4GWq"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c252c7270faso140691266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353002; x=1788957802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
        b=eXPC4GWqz/Kw1fZxDHdlSg8T0asqPGvuvYJHA5MO0oAza/KDgQfOrtaqWt5qNONpD6
         u2z7Q0qjTkwod2SAooxzY4hoavod6HZYHgQAAgoHfWnc6pCyQ386062uiaVgbUJqbniL
         m+Gp7o8MLz88lOXRVmP+tyllwhpxuLdiBnHR8gt0EYKUaq6NuLOHYKooIGMYFW3f3s5J
         7NFxhhvC/fc+C4dWeTVzxX2t+9Vrae82eWQ5M1wBdu3wL4RoJYo9yAB3iRlbKDH1C90p
         IaWmQYE8RkXk9LNa0mzntkEoBdVBHc//zx90Y9dPTfXwdrF42N4AVnRTqC4B1a4E/r6y
         vI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353002; x=1788957802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
        b=CQrn9eAfCRUQEUvJ7YUksutj9QyemoX67BzR2AOwAO9z7WIi4hY6rdD0ZnsA2S2Dyi
         LaTGkSD05g1n7GxIxQPC2RxEjgJ1fVsf2IXhm0NpxHS6OtEiBS5VHQvAUF0u28xs87Ab
         xsoGB3xkaMJEcmMza8ag63e/ysRbEmjUrVnDtv4khUtK2+UmAcygSuPbEW0Y8ARVm2Dh
         N1Gce0N8w3z9REaEUeZZpbyPdtXFpwqeorBsiWOrzcX8kU1W5sLMfBTT/WJMPvZ8ptq2
         rU5qeYjsmNFY/vpeaUjdZ/cC/LfOcbO+Rz4eAzVIJgkH5tSv3DJnU+2iT8DGBE+2Owtm
         h0AQ==
X-Forwarded-Encrypted: i=1; AKwUvBylxk8K4Z+Dl37JvoUmQuLxg1y2odn9s98HOQAqsgE5vxbEWxg9LUQFOTsuiwCpNKWJpj//+ENNkUj8z4E=@vger.kernel.org
X-Gm-Message-State: AFuF++k74lz9keNmWvETCoTKCnvRspPr15j6qFWxPm6bF77AFXyQRSHq
	b2nbHeMaprVOZ0e/+sPyKV5Rcx/ez86hvwbUcpkpuhZWbrkxLTOdvFa6
X-Gm-Gg: AYBFou19r0oXgdX+wwO5pE/PSlHyX6GvwMKWz8JcVMrNpEicm9EGglUZrQi0yzppYTw
	5MmDllwnWeeGhBWG2IaJa/eomgwkAjQqPbMNR1dam5XVfYaerq4U6uyHP6C17n2XthRkNmCMLe2
	BuV583cNBxOUSTFy/cAahgA9HqMKjFO9bfRasQNXG9gJrR3f7P1NXhL8csVpu9WY5oZXQlJ6uNR
	Ot5lw4op7cKlmulxpCLfl0xzzkGZKlQMd4FvMPCn4o1UTey331sdYsmxkQ3M6PUaetKGqE+8Gn6
	zcr4hN1dvJaxRQI18y/raDxLUPCNVkumQYaPKBD9zojny1wx25ONYt9yWiCTXaKRnNBx3xLwcTi
	X44NFN9nvBmY0EeleLjHREFVg+wuqcMuR78Gk4ZjZlVa/3vMkJ3Rlh5B+TDCeufvUBertgn0otG
	pPYpf6cE9P72EkAUEEOWWI/x/B1zeEiCb9oHcIEsYGv0KHGj/S0VZ4U9g4r2x2vBNksoOLxg/WL
	NC5hepTUhZqmjZCwA==
X-Received: by 2002:a17:907:d21:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c25d526e682mr232505566b.5.1788353001758;
        Wed, 02 Sep 2026 05:43:21 -0700 (PDT)
Received: from [192.168.1.124] (78-3-72-185.adsl.net.t-com.hr. [78.3.72.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5cc3sm127621666b.7.2026.09.02.05.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:43:21 -0700 (PDT)
Message-ID: <5636553c-4c2d-4fcf-916d-0f334ddaf401@gmail.com>
Date: Wed, 2 Sep 2026 14:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831181006.1382372-1-sinyavin@gmail.com>
 <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

01.09.2026 10:08, Loic Poulain wrote:
> Looks good to me. Since you're touching the statistics accounting, it
> would also make sense to update the drop statistics, for example by
> incrementing the TX drop counter in the xmit drop path.

Fair enough! I'm adding the drop counter increment in v3. Thanks for the
review!

Best regards,
Dmitry

