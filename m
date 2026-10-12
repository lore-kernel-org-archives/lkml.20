Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF543E44E7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799995; cv=none; b=J1ItQHsZmvEv/TmtOp5IlgAPEheGOw6oFjpytC9ripSP8jL/gUGkoLDKwDqDD/mUTIG2zOyj4kZ8kCtbEgOwZMD1X+fn3vDpNh+xMpXHGkfFazcDO42UVRgHUtWj7go6+j8PhI6VPMcfVX5uwOSwQSRybeq3gZYec27N6W/GlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799995; c=relaxed/simple;
	bh=a9wITDWNYCyDc/6M4gzNG7p5rTn5OkesyFvug6cv1E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERxCF+HjCA/0bPFshSFQ9N+2nAmQaR8+uTTTfDneiMQNSMW4moZIqN5JeWFGQoa4LVG96aC8wO5nIGQlDorX64inKw564u1lrJW6/nJTQKGb0fMZVCGqf1/IyfoaNgAF6PBTH30R+amq2cqMV0O/StQV5X3kce6TFwqRzht6214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DPLvvQd0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DPLvvQd0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so15939815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791799978; x=1792404778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBH7MrtvWb2jpzSRxs5Qbj54HzWjkwoKw7gmLgBjG7o=;
        b=DPLvvQd0JG/JWKg+0xjoiuX/UCc4WvHthjl+rajlQm0ds0jQZnttVAutur/vUFgEAb
         cAt9/xtrH0txUKsJUcSnCfkIwrQVna+Yk5Ue/awYpRLRZQlUn7gLNP0VanxHU46iZnm0
         eFO+EfjJWTR52d5N7qpd/hK2hWQGTgLmMpY56Q+y39e/Bz9LY77AqZng2QRoLNJubLqi
         fGjkU/foIJsaaAtb5EHWJlvlgFJtXUk8dX9HWrli+mimKsIwbmo0cbOUkzMRRi+jezgZ
         gCh1HSU8e8ZCTVRkqkX313nlyTJxsxPcgU3TbV6SgMVU9cuD8uFYbhMhunUkJRt/zXqb
         Ct+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799978; x=1792404778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBH7MrtvWb2jpzSRxs5Qbj54HzWjkwoKw7gmLgBjG7o=;
        b=mcB+TiqlLf0GZRHmoHPvcZmke6zgTa1cFX5twzb935eMTfBPHdULpBC8yBxEJvYBnH
         W9P0MW12ni/5B7eTOpjSrbIZCI+nl7SlGx+7EbtEuOEUDjsvGHGB6cBEh3RMe+bW0Q59
         GORhgGcn7AMkKwQ64glIRADRGjOryJ07WACMOg1zk/o5lUAN9roGyCFhY2PVsso9Dipr
         64krtPrG93gajp58MYh0iS8cwrqQM9vEnEh1gkd7b7MCdDbFlVVfwtMyggMEiRmokiHr
         eIwYAliSE4+o5AUCIkkZ+eS0ce+3Bk4eoQb8keqRnBokU32hJ/Kfq8/rH5O3oNZCHyql
         Bu7g==
X-Forwarded-Encrypted: i=1; AKwUvBy2uygcyvzW8+kVWUwAagZNrKygCU7TThgcUGDi0RAqKTAKnGA1hQjPtEEu7tBRUdnT2uiPOqScFh1EDXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS0tn8bLpyJoOty04i4PiqXukS6YgWlW3ZYQWzA0g4UZdPHyui
	t2mNy5MabpU4KamdLNkG/CyEFK7U6p6JkW87qt77nMy4i3cMz+kUDWDZBQq2X1mqNI8kAd7W6mg
	haAqL0Bw=
X-Gm-Gg: AYBFou3dk62HeX8fAhr7bDAlm9mp6YNs4fG/rq2VjddEj7kIEnOOhra+XW1BpI9JxrG
	N0XmzkoVAck2zcJ1yMPv5UPkV3wD1rggLRj07H/s/16PFNlLyJzCbQGAckc6scW3HySCu2q4UUq
	S6evooDDs040+WU3A0sdoeRblyOp6Zmen+fnVDj/z2JKShpZXocPfb0dP2aJNZHh0ZpzrVdjKMZ
	tov4dl6EI/MpvyKZc3/yDcBS4CtluXxzLk6g3sN+A8b8yxci+C/S7JdPAHIJv4Rrn4yQsP0VDam
	DIJa0rOcCLFqi5/cXZZYmM2UW/0nw8KSktbxQrwkIEocLk4kbkR6BM8UKmMwyqEe2u9Vva1MIRR
	W+oug/s3zh/HcHXqxmF6BLAnBCMGO5v2Unh3q0ol2BWhMv0EqEBS43f9NgloF5q7dRF4oKjwFXI
	Gtstl1J3rzsmrIL4t8KA5zrPQ1C74VZAll/0OxgJYdgLcaCNzSGyZ090bGPmZ3O6YcFUN7a6xGA
	1F7Ltg=
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr170900145e9.6.1791799978068;
        Mon, 12 Oct 2026 03:12:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm278112685e9.15.2026.10.12.03.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:12:57 -0700 (PDT)
Message-ID: <3ff66de9-4b90-4fac-bd67-7b21aef9aae0@tuxon.dev>
Date: Mon, 12 Oct 2026 13:12:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: dmatest: fix race between wait for thread
 and thread start
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Seraj Alijan <seraj.alijan@sondrel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:10, Cosmin Tanislav wrote:
> Each dmatest worker thread has a pending and a done flag which describe
> the thread's lifecycle.
> 
> pending is initialized to true when the thread is added to the threads
> list. pending is set to false once the thread is actually running. done
> is set to true once the thread has finished its testing.
> 
> When the wait module parameter is set to true, dmatest_init() waits for
> the !is_threaded_test_run() condition to become true.
> 
> If the worker thread is not started and running by the time
> dmatest_init() waits, the !is_threaded_test_run() condition will be true
> and the wait will stop early, before the worker thread is even started.
> dmatest_init() exits, defeating the whole purpose of the wait.
> 
> If then we try to remove the module, kthread_stop() will try to cleanup
> the worker threads, interrupting wait_event_freezable_timeout(), which
> will return -ERESTARTSYS, causing the "test timed out" message to be
> printed.
> 
> Clear the pending flag once we wake up the worker thread to avoid this
> race.
> 
> Fixes: d53513d5dc28 ("dmaengine: dmatest: Add support for multi channel testing")
> Signed-off-by: Cosmin Tanislav<cosmin-gabriel.tanislav.xa@renesas.com>

I've tested this on RZ/Five and RZ/V2L, on top of next-20261002. There are no 
more "test timed out" reported.

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
