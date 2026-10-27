Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105771;
	b=ANMEDJwCv6DS/OYD+5GSMIUEzpTLnx0tZn4jd+GmaUWI1715AjxrAr/v4NvXPSrgtPat
	 UmxmRnTNTME0pmkUf33VjZhzBwk02y6tP3zXSBZRzWN9O71tDg/M1n6I6WzsZCrzWCuOK
	 mfNk4nN25vnM6zBaDqFdjqi0pGapbjUaJF5ki9DTe6uZNbPJT+iVtNKlk0bKO4Sbm8brL
	 tWZ2A/+GdzqwJOHEyoU4JigaS8taVJf7WK8RyJPFN0cM9XomU2iXhjPS0m4KEe4isfAU5
	 /39KwTP5P8Mh1aanS0/zFiQdsjybMx8Q4jmm1tSVmDu7nuShetXU7KEoyLD/iH41pWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
	b=PfAYrn4wMwx70u5SPSYrUZf3C/QZMEE9iqIhnBuF+4uSrJ8vqEpfZZ1SDPWXjRCZWlZS
	 iIPRwW3spr2pilMNRucdYq+Wdt6w6Sxf91puZBe8XzbRPpvKU18feMDKtjCKww4DAETO5
	 cNbm6tuTsZSuTzV/3Dj8QmfHzT0l+jhVbLNg0orxJRAWq1qHMRBtpZpz/0JO9Qqc2RIB3
	 0xoy9Tj9Fc60V9bV1XOwKCmoo7rEW7z+HPrsrh+Svd8pwbFjd/ep0U2N+8NpZnhsvpMQz
	 9O9OlquzLdYyLEIwhQULp8cpgIbWBUIHGkSrKKtUc8QL8keEEuCA+3tDC6SwhloI2/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28761606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28761606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so2456556c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793105764; x=1793710564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=oBNbWBMqejrGY89fgbOt84PDcmNTYTRzwo7dXYm2kKYVugiTtHm2ZRf6xPFRETFchB
         e7Bfe7EplJmnyZJHxSmEqnqLF0apjP9r8aTHoa5QeUL+bAlPMFtQ9KPjpctTYhkk48Zs
         GuRD3ZJsnpqhQipbgNlbQtgHjz9SJSTDtrtUbMHj1rIHCMUdr0En8+WSNRORvJC/skfp
         jakziGpSo9AEuV1mNNVR2uCI/3+MrUf/EdOW5tpzCv30bFbfQJ9H6QO7IY0eS7+pnb37
         LQN18Vq4yUx8IHSZdyAQgT0jxb5HH7S3m6Ds4Z1SI3FeBf2i7Hwcp2UBmQNVZq84Tyl1
         AO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105764; x=1793710564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=aYWx3W9zeLI74L2BfYsoP5+LWBXj/F51so2JEx1ohqIdFdrsakywQ9gzx4ztaK9/zZ
         lsmjNayMuyj1fkTKBiNfiy8CRAhExlMn/Qf0Azfgiox0ldnRPMLOCRiZU/Wj6LtNf4vn
         gcaiybIJqTSVUP//nf5dTD72hMbKTWP0EtV3d6l8GZ05WGjQprbz7AfQIT6ZET1qhVAd
         8lT0dFvOWc6rQQjH3oLAjIOdszpPSOLfLF+QGwfqxsdfwZbr+16n5gea+iQ7sZg3SA6u
         tg0EFN8rTnT01yiQLq2HBtjJpuBDPXAgsRZVlVPcQFEsX+p6X3A8OskC4Ul5uNoKlkVw
         UpRA==
X-Forwarded-Encrypted: i=1; AKwUvByyV6jgzKjLLZyChZEPr/a/4npuALqH4mAZMut+R+iIHifizaMlWpQeAjX+5vuPC3z503GodVgXNlzHAcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK3PfdIierBsnXX69Ur5SB/Yzl9yfXIhUHybzoSB7/mFCeBPbA
	I8LPZHx1Y/QNETVHKzHe2pjITastV2F6m1reuseq3o1NEyQjfPpqSHVIij8mOkj2nAo=
X-Gm-Gg: AYBFou1HOL48yMTXPdUKbBTgoFVlx4Ms82xaS31lzy3htr7Zw5+3ozAEY3IebO5pDQz
	QHawUW+ABEjcyxbAyI1hebD8a6H5OYsQP5dMQ+48cS6CV6jbWTEuYp5rD4ByIqdS2jKLmh+vkH1
	XJq6S4A4y3kuGGV0nPcUcN2WEewledCWxR3HcZhF+BoFczr7Vi9O99h1xd8jNptfIPGsgt7MSiT
	mVXnq1Ub99fz2kjY35DUl3eEvui5c2+eDs0GalG+3hCyplTDWE4tUdVPwWSHqxzJv/JTa5btnS+
	SDCaZSeJi1rDlOtIv9V0PzEm5vKmJfE90e/xv/FPzWd0Z5DECHp/Rzeo2T/VMup6ityAUBV16O5
	40ifWOX7hBNacdT6lu1HGLXEKBUZ3/D9uWlm4Z8B3jP06M8Z6WnUCFHW0/drVDcbXVK4hnhYhi4
	Gy8ApxqX7V33tg4KTp/JtkaawVSQHCWSPH2kL4i5UIf4SPkl6Q8S9gGKkF1KxILovRL5jafRQqH
	zm094vO1kJgRwwbT5Y7zWMczqV8zkhwinaq9IR+V808PNKtjGJSSglKkL0SooRXkYexrxyJ2cD1
	+6ooawXQ4mjofg3byFHuxAy/vJz+k5PM+RNmK94=
X-Received: by 2002:a05:7022:90e:b0:194:3a84:e67d with SMTP id a92af1059eb24-1993f6d2c4dmr19379065c88.44.1793105763829;
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a58093678esm4301247c88.18.2026.10.27.05.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Message-ID: <5f575079-a2a1-4f42-ba1b-204730a5402e@kernel.dk>
Date: Tue, 27 Oct 2026 06:56:03 -0600
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
Subject: Re: [REGRESSION] io_uring: requests can overtake consecutive drains
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:33 PM, Karl Mehltretter wrote:
> Commit ecb6817b769f ("io_uring: end the drain when the drain request
> completes") lets a request submitted after one drain overtake a second
> drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
> both standalone and linked drains.
> 
> An LLM helped with the review and reproducer.

Please have your LLM also make a patch that you can send out,
then you get credit for fixing it as well. Same goes for the
other one you sent out.

> No privilege, special device, SQPOLL, or unusual setup flag is required.

Puzzled why this is necessary to state.

-- 
Jens Axboe

