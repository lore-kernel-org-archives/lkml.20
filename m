Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507102;
	b=iDeMcpui68TTMVfa9AbPHBMoLjQGrDD+WRi/iF6dwFgArccuhSR7YoiLoABWp2r8NtH/
	 vBVjuZimoGQctQ8KeVl6FTAYFIgl8aFrC5et4NEa1Y5abdQ44uzUbXCntCcfVvsAN8xtW
	 5z/ETFkfigIpy1AEEvpW55Mx/3Leyko4RmNlQ4GjkT2GZ8LunV7CL+B5IHXIh8cnqYKkf
	 Zugm/MvmAWpXj94bgJMHKshuil2uC/KJbT9NB5L0+gWAsa0Zcs8H6dAuBfKOhTfDSU06e
	 c6bgxjTi0DvWQsZYGt+sACfmu+zzYS1xbZ3d4rKUtF+6NYCCOxxQYDYDfN4s7ArLLiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
	b=ki7ytvbQeg4XsLSOPled50Vg8xezLHWnIqHWojiZqQc7568vB84JULG8VMABFK+RJeEk
	 IYbLkKcr7J7qpyeiGsdFPamIldTFlGwdFE1wcLSroldNFBxDfcr5ZdFUAgpZs6HwdTcnl
	 BQ36lAGoHkppA4hTaUP9uqPy5NS7uRw28YUosC9jm09hcfN/QF/8JdsTYMuWYO0Ejzl20
	 39BKtqwrbIup/DMQFcnA/aZL5YAKaC+OG/Xiw312dTomzaGUNwYv/Kr3sE7Ozptni+SH2
	 LjfqE0+RVO2eGV1wBAW2qkbSNPkVLSUx88uMtTttd53KqfaJABiQXue31077vxGY3/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m2NZWL5N;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CC1606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CC1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m2NZWL5N
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-188406bb948so589000c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792507101; x=1793111901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
        b=m2NZWL5NjZ2r44cDJg2ObJXAzX8Oq7pwI5/+OjSqY7KwPjqMRunLc7Vhw0EY2b9Hqk
         xjD5bWNFxLECfk3ZmRFjfa9XUgZWC6U2K9+mATCHQCayDCAKzezUqDx8GGaIvpm2kkuL
         HH1fVsLaQ2z0mG10qre2bnVOfZ1AbPvF9mLHeP2dIaF4VPwOOIwlz8QO0puMbf8BeLM0
         b5MJyZ1GtmsDfhCfHMVWCfmknH8dSyYHlXib9RUBtNGz/yK75cTsoJQ7ZyPMitV9wMr4
         Teba6QRNK5aL4RtwtGEm5JGbwjFpd7eE+7w8i8spYh9D0ow3AJzP1UwopyiEzRwbLB+k
         6mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507101; x=1793111901;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
        b=VIvvkqHOq0YLj/QqDcWpIrFOR2K4TdACxkBytPlgui4f7ZRUIQoJrrJIyYx1jE970i
         3jnnavw/ZacUprusHjydwqPD5XrlkBGGpCOzaNfK2ezLTJxC0aMQ6hINRYdvk+bbMVhW
         4ukF+Bw62dBU4fbSO2w4L9jlDtiP0KOpFjpcDjhYcm0218G7zPmApPU3LDAAQR1pb0sG
         FcWwnXvPcjwNbEwF2ovlgDr7Uu59zdALN22SlPmjw3h/q2EpqfwHlYqMrJM5X3PbaxPe
         KNzSlSZOHN+dNT6aRn1gqOB/WaTBXtwQvaAX7f1UolFseMklX031D4CjbIwcxxKN3kFL
         Hl6A==
X-Forwarded-Encrypted: i=1; AKwUvByjMFl7vZxDV1El3weQLrhNA8qJ6LUeleRG+dwwKfn5wvDuZklTwXYQpTYAgcNRpMmvOOZ8aAW/sKTb7QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs3mamFlOMsVeDBnanHcKZoUBviXZxCsHeWh9f0i5eCZSDWo8z
	aeVZtAhfb/MX6B6x/7JWsFN4H2Ms+coBjOglISs4YUXmFGQi4VXsvAcvjWV4UQ/wGRs=
X-Gm-Gg: AYBFou3w+V2Rdrt1VJ5ArSuQS5cwiQf0aWN9LHlcn4dgWYXUaNluIJMydx01H+lCYL5
	tRa9ycjOV8Myt+z0B4f/q2HC1WDayas/ElpnowMhgWLXHPMSVGgmtDd0m/aAYt0oKmu06ojQE4M
	H692npINfqysz3HeMFvSkzxmQ804wnyFkMt1Mgn/IhMScrEpfvZ+ZahTF3TD0PFuXLiLRX9UkGf
	2HXO+fq4bElC3+JYl4u/EAyG1/NF+ROyDoE/c2zjxuptFI0r8p7jXQMvUV1EcQHW1ZGi/8VTRfA
	ILpRAja+TBAK/zlNwkXXVWeZtwkuLLV8XCM4Xo08S0Bpcyx7x9BUo6A42kpSTvGLoPoWpYDqZ9/
	Vj5v6lMaZGBOm/FSMIYDt7ytV2Vdz0v64hVzdwB5nr7FDHK5nMPE9Z0o4/jFQzfG7ubmXxuJ+o+
	kQ5M+9t09lHOcbQbu7IlDEIXmTf/l3x4FaeietR4d3BQFUVJFRi5J4BvNakzQW6oV/2VLlSDpFr
	c5+b9yV8fNT0uexy1zCV7b5J5BUn0wOOYl1Rdaz4AN7d9mS+WJbYjHRw143QVkquC25ISsFkuA=
X-Received: by 2002:a05:701b:420e:20b0:144:c123:4036 with SMTP id a92af1059eb24-185134dd5f7mr15402776c88.35.1792507100657;
        Tue, 20 Oct 2026 07:38:20 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm46679675eec.27.2026.10.20.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:38:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Austin Schuh <austin.linux@gmail.com>
Cc: peterz@infradead.org, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019231243.802569-1-austin.linux@gmail.com>
References: <20261019231243.802569-1-austin.linux@gmail.com>
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when
 it fails to arm
Message-Id: <179250709922.3332995.6640113026967245594.b4-ty@b4>
Date: Tue, 20 Oct 2026 08:38:19 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 19 Oct 2026 16:12:43 -0700, Austin Schuh wrote:
> io_futex_wait() takes its io_futex_data from ctx->futex_cache, and a
> completed wait gives it back in io_futex_complete().  A wait that fails
> to arm kfree()s it instead.
> 
> The usual failure is -EAGAIN from futex_wait_setup(): the futex word no
> longer holds the expected value.  That is routine for a waiter that
> re-arms with the value it last read, since the word changes whenever
> there is something to wake for.  Each such failure takes an object out
> of the cache for good, so the cache drains and from then on waits
> allocate.
> 
> [...]

Applied, thanks!

[1/1] io_uring/futex: return a wait's data to the cache when it fails to arm
      commit: 02caa5922184e99da04b37fd3336066625ea8e2e

Best regards,
-- 
Jens Axboe



