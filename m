Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365650;
	b=p+nxBf1TTTuizlGskIOcpnB1Br2tRhPpIb01FcBEp2euFMvtVUgehD5bWpwYNks3gnst
	 VLZwHG4t9ifhVqibWcQR5Q6w0M6GxEsau3t5FN9E+MFHgqNC8XgOkCUVJPfH24tkkXWFj
	 SPNZA0+t/LPYBEDFHcgqZx7czmsBpIFnCzvayXe9wr3BHtKXyuWyI0WFPRvlzZLsy5ern
	 /WuHKaaCGRE6P1706R4Q3nIeoko4ycAezXG7xV1ht/HHSKTL7EHP0MNkbrtMvPsxc+UWF
	 fVToOnJ+Jy+CtjUTFcC5YWrjdS09dUgHDI07CG8d4PZaKXQbct9Fb9dcYNtzGsLKy5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
	b=4KyEpmno+m5w2ME3SQwVuG02WLPN3Ce5TPTb7kkrLbprED8uzTWuvw7jR6BbUuUfNncS
	 v/g5/Ca5It7Hnl/SwLatto3RTAC5SgGrgzZaI8TpcZA2+3o2ey/09QHM2h23BIOQyU3XN
	 vOPyr4Vy0nDS4+ndgA6alQqv8o8OsdGPhotAc4HQI7eync7kc9x4APWWNCE392iJfQfMf
	 rH0mSgnmspJwdiAxk06EO52JzhKrcnDHPm/qjkus1do/DHD6ICc01wHCuL/EYW1otVm46
	 MvEoTAoKUdDQPfr57L3HcJc3sbnF4Mvm+sF8B0kvlyhP8gSTVY2Uta7cllgSQR7jFQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lcW4F7Iu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lcW4F7Iu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14fc585291cso573563c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793365649; x=1793970449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
        b=lcW4F7IuLgid/qDqelQO9UUp/XCACLUQcJCGVwPi7t17Byni9TB1h+98XRSOTg9bot
         Z4eRGYv1qldKgQTYxII/O8S3GD1Conth/N67FP6FxsPa+cmHAQVWbhNmptQKjdOkt3Ys
         lwoGC0HthhgCDpj9iSpeLnoXsLdf+bYAbQNqEwxM6lRMBe6WarAeaigUUPTNxUhXeZ0+
         NLRs7P4nxUHYe9m7dXirkMM57gTqfafhUn9g2aVX/lJlMmhVlh83T2n+cceDDEaDvIlG
         53BRrJZnr7i1BSJ25LG627FKqqWSAY3dGlIVEgFzq/u4wH2VocfE7qGD3YjwFp3omoUD
         ewbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365649; x=1793970449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
        b=h5FIa6RZflWNMgIwPk+QsEDRF5Jd9DANElNITQCuQlvmrRfZ11oj9OrNabBCu92fts
         Wckoyygi547W8LfDwq5XJllqEu5xfub5tkN6biTsBnfyVYRdM7ImF8PrUxhEcn7dFzlo
         qb5O0ogydO2IfmFD+mA9GIYpBpE8cdzYeLX+qQShCL10g1Vsd4uvNlIQANlDnf6eEixF
         NLlBQbJZ0Azn8cFF0jnb/ojFhC7jDUwPZ4Sgcq17yD/FRdwNOolAN4HXsOeA0xkluEUg
         XcIbwmQohJJSCg0tYju/eOi+cHA/5r2qVEnP4wCocYJmM2NLuNu11mO2lljTUlcsAjKy
         rbgQ==
X-Gm-Message-State: AFq9FYLl4JTD82txzUZ84MN8C3JDF/ForGJryyKU3A+M9kIJWRoB0iez
	9rECM7855uNI/e14RZ658Hd3nHtHeVgwXVaMxaZtTak8YFLH22/fYAmXrThP7wA1NWY=
X-Gm-Gg: AYBFou2uPq69zw3Zi53ivKHQtzpg5kn+OrO0sUnTZ/UcswXOqrK60SU9fbBEP3cj5Vv
	kVuoPI4MlldOaNotWqkptAncbtzWTJRdiZpE+LdJ0V5NodFY7TtjF/6qEPBhEMoV3VfM3aCXG2n
	AS8/07NRf3dAASV/CMlv9BqCfXAcsHuIZdUU+Xnke9+mvkLehVfFKu5zKC6j7Bo1gVhQwVP/x4W
	m/odOrdMEdgjhscPGoMItIf7FOjo0m2/qrXtqGnvyD4+wjEdnxzrMVy9nN8rNkr5VbiM/HavaEZ
	sYxMYQ0NU4avOC0eOSEqnUCYxWAGPM5b92cM9ieB+vanYvUHz3BFoItnuLr7N+68zGZya3njW4Q
	gWxULuiNUhmsTLjunUlDICthA+//J6XUTMT0Zb8EEcFw0l9fsmwGohJDOAqf6XH5k/Ow3wrOKDc
	ofzzT9rrMXxR8l1Efac9tk8CitofVRAuz7fV/v0QXdAF0W3xLFWT7sUtZlxLR6V1G3fTcAna4Cg
	EtgV+ytug0zWdFjC8Nu05PxkxmSw4UCfI6D+Y2NTC/kWWEQM5lHsHxn9UHJQnuIlzhN+PbQHuuW
	zRY1FXlLEODjQwBZPpX5reWJp4xdcRQ8ejUaFZyAJpST0ZdgwsU/Of+wSSkzDnp4Op+6Rq/hhcg
	tMOxBr+7ZMTy5
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr2633208c88.36.1793365648427;
        Fri, 30 Oct 2026 06:07:28 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm8929732eec.23.2026.10.30.06.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:07:26 -0700 (PDT)
Message-ID: <61bb0fc9-d629-4987-ad18-c5eb46074dbf@kernel.dk>
Date: Fri, 30 Oct 2026 07:07:25 -0600
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
Subject: Re: [PATCH] io_uring/io-wq: save worker type before dropping its
 reference
To: Kyle Zeng <kylebot@openai.com>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
References: <20261030042101.73491-1-kylebot@openai.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261030042101.73491-1-kylebot@openai.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 10:21 PM, Kyle Zeng wrote:
> io_wq_cancel_tw_create() inspects cb->func after calling
> io_worker_cancel_cb(). For an existing worker, that call can drop the
> last worker reference and wake io_worker_exit(). If the canceling task
> is preempted, the worker can be unlinked and freed by kfree_rcu() before
> the callback function is inspected. KASAN reports a slab-use-after-free
> read in this path.
> 
> Save whether the callback belongs to an unpublished continuation worker
> while its reference is still held, then use the saved result for the
> conditional free. This preserves the existing accounting and frees only
> the worker allocated for the canceled continuation.

This is already posted and queued up:

https://lore.kernel.org/io-uring/20261028164732.1264069-10-axboe@kernel.dk/T/#u

-- 
Jens Axboe

