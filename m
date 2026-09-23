Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18554280D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182372; cv=none; b=VV46meXGQPS8gLg5ryZsl3oS0P6P1U/dOQ8kCWYDqJCtlUdB+/2rrLMY6JFAjw1bfALRddbGT1qBtwtmxk85u7Tu4z5hUUg8JX8D8LtfS7IqFsyoPbeljvjph8Aj0TVcyn4++zczHeo5RUffHfMUcoY3FCLNOAdPxo4EwP5MZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182372; c=relaxed/simple;
	bh=ZsB+iNtZ996/IRzwqCCTAIPrmIEIkRV+EK4V1lIlZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWvvEqapO6Itvnb79kYlOith0UuRScWTYTW+tUN+sN7EXriIWQIHKp8A5IYLBRFQArZbbBN4Brs7aUyJQqTzGgCQTKnrwogZXOxsFuU73ZkH/VfeppLBIeHf6MExaTf9BiSm6kr/4F/6Sr5vRTeEKL1lUcfzx2RJCYDEESRvViE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=aIUt7wJj; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="aIUt7wJj"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6c8f6a53fabso39317eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790182368; x=1790787168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIExK7C+1gjxck9oYfNX38MM4fuWrgyse7e3gdiUnPQ=;
        b=aIUt7wJj/574RO80uOCIXCo5gUmXk5OmBl4YJDmIQD6OS2Q9Hkc28nKs+tCiO+CG/A
         Db8oleF4h+0WTG/4UVcOqtDOGuSWI+XV1qMDztrXPaom0sz/+jbgQUzn1WS3OvtarSPj
         V2S0enXCVm6mL0kDLTdMLz3iuROVUlRWcJKauPd7rdx0l4h96rtmW0GbH+ai5/EpHBps
         Cuu7Fop1DN0QP8lddkZZfbkJoEowTKRd9gvNvf/2AxSRyH87DL1CMZo8eTyjGf99bHiq
         mEGzNlZ6A1jKvP6hpIepESanRGok1ytupdIn6LsnKH7fIi1rozCvaR4JAiT8B5cApiO9
         THdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182368; x=1790787168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIExK7C+1gjxck9oYfNX38MM4fuWrgyse7e3gdiUnPQ=;
        b=dsIR88qKCHsYHyyvy2hQ0YB2L+R6bvDuqvK/k+3k1b3PuaMl3bA57VCaWccy1fbH70
         0c9ktJbGhe2edrHqh0/Wsm9QtwU+z4ECRWnmlRmqDeC/YsoIFBpSHEx7u+Cqf/czs13z
         ulko9sLPAHCObKi6NT2q499W57q4NbXPY2XCCIq2bQlyudSZsP2u65zJEAX1n+CLeBhE
         G9Du9H31SIZMfZKrmjPoI8vioLjLiTPR5DQVDF2xcl6ncq3bXRwSm18yU+Maca95jcbK
         y5rgqzbkmV0wZYc9aDLjakHtF2WVXRcvE4LrM0TPHRJ9lRzDWnsBkM9vov1LsqiSyGHU
         hDcA==
X-Forwarded-Encrypted: i=1; AKwUvBxoWRwqVPA6aCNZ9HhhcbX5lr2Q4dbsBc98BtiqCs7NZQE7l3JFrXzv9+KN57Y0ppjwy89qd4B3zuAASrE=@vger.kernel.org
X-Gm-Message-State: AFuF++lViFCWas0wn+bXvrHoNnRTgt0z3OgOf+h/VZ8u0Mjki47qLUiC
	pLkwOv7Ag4dLsxxWn5xWaartxDWsR63tUwG2d01Z1TGoFJO+XRo9FhfWAV0/Zz4rowk=
X-Gm-Gg: AYBFou3RCT+YerUsE22lzAH2WjDkNbf313wrRXsv/zZFb7unRoKclbii38va+ECk28u
	VvX0NMcKW3qEOcv27vRvPpnSshqJhuy6SIYsILoxqo0Q9t2LHHECQ6P5riAdt0yHaLJdG9dUUzX
	7pRxTk+BIeVP5F6RzfICGq3RfiioXJG0TXjPxLdUmIXZ1OrzvOEzOQY2Ntni1He3HuXxcQRogxF
	zrrPpqAZcjNqkcUPvgi//a8KRtpp87GMyftH9jYd87/dD0V8klY9wmDoQqNrWZfGF1bnpUfH8Dl
	WYVT+tBqpCvEYizD08l0lXIjWvb5OVyExoS6/+3rg5yGDmD/S/Y/zblZ9lF5U3HXfbdWRolddlc
	nOTYUWB6qLtdG/T+t9AH5nuCxMPiIIpUUdp7rQpWyIS4FL6ErtzZizKZnBiIk6f6KDTKn7Y8FpJ
	10pyhpSSLl/UT6ZCdp0GMmWh57UkFdhHMsfJBKxlXiK3up/yM9fRn77XVEtJH5H6rs8insi3t5X
	Lv+KFHIQz+MubCqh8LOAPHbagOPszjcVjLAjmPK5Rz+VKxoAyFNjKY=
X-Received: by 2002:a4a:ee06:0:b0:6bf:ebd9:6cb4 with SMTP id 006d021491bc7-6d157d8a169mr5153217eaf.8.1790182368245;
        Wed, 23 Sep 2026 09:52:48 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908efd9a67sm2238154fac.17.2026.09.23.09.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:52:47 -0700 (PDT)
Message-ID: <35640d8a-4a6e-4e86-b553-5d5bdcba6e1c@kernel.dk>
Date: Wed, 23 Sep 2026 10:52:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring/lock: Keep spinlock release before wake_up()
To: Xiaochuan Li <chuanx2070@163.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20260919123021.21318-1-chuanx2070@163.com>
 <20260923161622.25737-1-chuanx2070@163.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260923161622.25737-1-chuanx2070@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 10:16 AM, Xiaochuan Li wrote:
> @@ -574,9 +575,8 @@ static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
>  		unstalled = io_wait_on_hash(wq, stall_hash);
>  		raw_spin_lock(&acct->lock);
>  		if (unstalled) {
> +			*need_wake = true;
>  			clear_bit(IO_ACCT_STALLED_BIT, &acct->flags);
> -			if (wq_has_sleeper(&wq->hash->wait))
> -				wake_up(&wq->hash->wait);
>  		}
>  	}

*need_wake = wq_has_sleeper(&wq->hash->wait);

? And probably retain the sme ordering with the bit clear.

Apart from that, I think it looks fine. The lock shuffling is somewhat
annoying and inefficient, an unfortunate side effect of the raw vs
normal spinlocks.

-- 
Jens Axboe
