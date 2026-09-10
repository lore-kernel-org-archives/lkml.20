Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B9739F16B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029230; cv=none; b=dsVikdz04T1FGGRsSVHReVJxUrGPNdY5/T/MlRMIu3YgJtnymoEuNJ6Y7mXnwKPPVFt40FNwYUBaBdxdzA8H4YyUn/94GC0dMrUP6Jwg2Po4Gg6AN6O1/LDrTmEdMqLQ0i0556ycKwaVYtjKwyLnrwaY8f3ORC4Vvd94lsgne1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029230; c=relaxed/simple;
	bh=HhQAnu7am8lcan+rEXFRV1oJg16AJp0jaoM8Z9/hRGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l510QRtWA861b8EjO/9gZ73ZDDxGWidWhJQTUeuY9C/5BAv9t60uxwjVql49RfNs21YN+Qf9AIo+HDGfTELc2hbTBYg7RShnViAK5+gi96TR5bqorA2A90vjp62ifniWiaW3MOUwWHWS4KAI/KX7tQVpOIqeBidO7blHFdwGPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JiunYuQ4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JiunYuQ4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so85897965e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789029226; x=1789634026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzZhRaUvpfNvfJeOcUe7YmDm/dB9ckW/oQNsKe9IOfA=;
        b=JiunYuQ4liDD937BhXd5a09tfOrYolYtaB5Rnh5uTGXZu5/PT+SAVvYx/1XNdn/jtc
         a8GbrlxlAOkdbzi9Z08tuVMQN5JpLxm8GGLGIpc/1Dtwo4nwUFl915ERAqiRpqfX1Gp0
         YylBGHNnamqT5GgSxrBkOdvJI7G5yDx1oCPEAOWA9dOM0ZpTqK4X8pavphCNLN3Iw/DU
         i1MesVB4IO0xPi796QAlx9ig5vPc/H+YZmO3aL5qGnSoL0/3Kno5rdTWboLMPb2zJ/1I
         vgs4mveLRQxdiK4XU5QrG3/gz/7njVYCm2aSprTaWE/xB/fTptGfayxBllfWy6iYuWP5
         5jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029226; x=1789634026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzZhRaUvpfNvfJeOcUe7YmDm/dB9ckW/oQNsKe9IOfA=;
        b=YMsja8+kg1u+eYrk75iS2El8fk7xxm8naj6j8Qxl/kX6r5GIGEghEfVFbpaLMJWg/x
         yJ7c6ZlACOrQBk+fL/GFPJxmaQ/9iEfMmYPcrszM8/5ELWBZ6shVXxbZblkX6w0RSn++
         H+TQps9s50QkOW1hmAl2aO5ZbQFM/nqOGEvg82ePSU0Tkx7dMqAslKvJqhv/8hjZgvxw
         Xs1n98ReCYpOmc/JgcdtsShKVi7PYUePk8+Ns+dzfy+o2jfkPT/3vdNXHqAm+2TGFjbI
         z60ONcvqYgjL5NPo4BW+uBG3jzd+RB2E3MpPIqStA3Kw7FlSrIeYtE8Il52XFPNwM20j
         5/4A==
X-Forwarded-Encrypted: i=1; AKwUvByoS521RyFbMtmQ61fNVUpnUpRzyX6EzKtOWftQ+u7hYJKJTauMbZv7RuTwNLPTfn7d4oEk5t9uDEFHVeg=@vger.kernel.org
X-Gm-Message-State: AFuF++lkVsOTo/aRb4nLJlxNvcAPgvSehmLqau1WUyifhaI5XAzMWMbC
	zeIFrHZrPf9+g/SMJ9AGySbTkr2P7KjkTB5KVrtf/suqkgbUAfsVy+RkruGsN4YyQcs=
X-Gm-Gg: AYBFou1k45ZnqtXcLa8zYTbrB0PnBumW6f0mi7Sbe48zSKSXCbaO7LAnlbvXQBJu7ui
	xr8B1vVa7GTz/7f0itJBNO1xRuvXOWtCBsy5aK5Y1ZdR0YfAgn4fAlyzkPgKvD0ZF+08zSVFc3Y
	Gy4BqWsw/NvIG2nh1pwQxO09AETIaesSbA7lXU50ZoHFSnL2iRPYDI9t+Xq6k7izYMbLu8/hyKk
	xP6CKiBd/llRBwmecgM3rMNDc6OFv57n/2KsmelWtahvo+A1bCyBcIvqi5OUENAFAkXup3R7BVv
	YRtYyW4//2EqdRECF1KNIxe243koQCfjZ8nR3ythGWpGOtvZkfQAhy71+JZdhwyqWq/0ob+1xHH
	ATUu9RxL0/CdHt+/DSM2cn1jIOjOL/RQfHgTcbBwT2Ia9RoKHzwrpaMbFYImNd9TTkVsHQXOKrr
	c3IV7SVSV6bM3AlVxyB8cqjtUuyubDb3NRHUwd2P95DK0y5Eu9m6fl2KKnlJbhtTeRLbef9s5N9
	oQ7zF+y0oyHFJ7EhpmIG6aK2yFfpRR80fNqN7YB
X-Received: by 2002:a05:600c:354a:b0:49c:fc6e:8cb6 with SMTP id 5b1f17b1804b1-49cfc6e8f48mr375853355e9.26.1789029226295;
        Thu, 10 Sep 2026 01:33:46 -0700 (PDT)
Received: from ?IPV6:2001:a61:135f:1c01:4928:2da:9a39:bb64? ([2001:a61:135f:1c01:4928:2da:9a39:bb64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm43282065f8f.19.2026.09.10.01.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:33:45 -0700 (PDT)
Message-ID: <c0006a9c-7cc1-49a4-8226-2f4e5333a4e4@suse.com>
Date: Thu, 10 Sep 2026 10:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: dc395x: sync the waiting_timer before freeing the
 host
To: Fan Wu <fanwu01@zju.edu.cn>, Ali Akcaagac <aliakc@web.de>,
 Jamie Lenehan <lenehan@twibble.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260810055028.119525-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260810055028.119525-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.08.26 07:50, Fan Wu wrote:
> The waiting_timer callback re-arms itself and takes the host lock.
> adapter_uninit() currently stops it with timer_delete(), which does not
> wait for a callback already running on another CPU. The final
> scsi_host_put() that frees the host (and the host lock the callback
> dereferences) runs right after adapter_uninit(), so a concurrent or just
> re-armed callback can fire after the free, leaving a potential
> use-after-free window.
> 
> Replace timer_delete() with timer_shutdown_sync() and move it after
> free_irq(), outside the host-lock section. This waits for a running
> callback and prevents it from re-arming, while avoiding the self-deadlock
> that would result from syncing a callback blocked on the lock we still
> hold.

Thank you for the patch. It raises a question, though. Do you want
the timers to fire after the adapter has already ceased to function?

	Regards
		Oliver

