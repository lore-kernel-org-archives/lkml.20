Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209072;
	b=X60HAndtoTbjP3NPUZJx08lF8zpdWpDntngEQW77X19ExDqA7UioqQfGsUepSs89Syck
	 GgWnG2KEc6rKzOKFrbLByoaSvKeddG6LEw1+FzC/a6XLSVXR8PcCP/r/UgNVKiNYjLViv
	 7UBgUGoztyBydAcaMg7dji8RBHqa4g+lLr028XTed4lf/OgQnzSwoUJDPmfZbFtXdtjXB
	 ROt8k5gmh3H9z9F7Hx5geLBiq4nX5ZzVCDmwEH7iovPo5Z6ilBqu0Bqp7soQjk2w/XFgZ
	 AQ1IUjK+ESZScp24krzU+vVztVxOpRDBUFzJJZca/2OBjpoqrPM5KAU4S9LTHOgMuvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+np9H5/WW8k79AQmUZmL7dcf2+nLZb8rZqIqDwgON38=;
	b=tT/mroq/yykfaTyPHFXozHg6EucIrjO2aqvGoVDJZhN0m+cv9a1EgQb7tNAetmbxG1PM
	 lLCoOrRRYDMjGOF8eb9KO+LKKChMfn9nLL0P1QHPWz9ub/vbCHyOPrH8kRyhi3vcgKVt2
	 k0e7ApSY4NqpVBbrii8ECmM9r7owVosdH5I8OoGIEMbEdarmpiXawCGh/I9FFw1ZgNA0c
	 nd2J2WO5VpO3bameVEGyeHKRiwEGFIpCJRlfZwEA4g6RPvqaUjuJmWnteORDz/RNUde4A
	 HhqEdHZmOf7BwHHkMu43QLoNqO5Kf3y9REFp8zN/YZWlFLSwVdLhNBLcxoxqTm1yaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsg+HPNG;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22390606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22390606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsg+HPNG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1110513eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794209071; x=1794813871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+np9H5/WW8k79AQmUZmL7dcf2+nLZb8rZqIqDwgON38=;
        b=Nsg+HPNGdxtdTZzq3djvWYmBMw+t2hulucj9xOOp3AWvjM6rcN7YNAWhvsNBCh1Knd
         5o9871JBsIP/mVo7h9e1K/ZiMLBbIzAL+xbNaet8zL0A6fVksbo7kfCMekOWMoeooI91
         Z7SjW2/BgWrKmJ/K+oRfYzhWl/Ak1bDo5rGlYFd842whNqAqs3y019dEmg/Edzsgm/Wj
         FNZs6d54wd5Z8/8r/WxihyDBQsx5SASmVdBkDyDumMExC9qDHZPLCQAx+NaIKaUunIQE
         Yww0TstAtTL6c/oGlasgOqlznGlFf3Pay7V8F2D7jkaALRtwkEFjiujHDv1rGYh7JbKT
         5abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209071; x=1794813871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+np9H5/WW8k79AQmUZmL7dcf2+nLZb8rZqIqDwgON38=;
        b=1nH6qEC3gSO/fT6a7m/yrg9qSxEL5MaqHdzFGNRd8kAX/vSl4v4Bn0dZt7gyjUdnnO
         Y+f7hg+6eYwdbFZyaJ9bb7FjAbtDFp84ijZcuNMzZxsaqsRV7L2JJY98Bc7Pi8LQ7XdK
         4MtXMao5mODVcDTebfqGPOgKNHgF1rAXrxSdZFM0UuRt6P0kda4jnnPjNBAHvtIIwYmV
         9yQMXsFoIWpxv9UjRVH2A4m7SLiWOSFWfcAFM7T0Sv2IPVVjGtbX9JBISchkgvWVjkBB
         kTUqKc11QyrG692+0q2urqMQ+aST0LVuJEH9XgDgKH5oePZIWviKiVh+F+KQCY11EMrG
         pzGw==
X-Forwarded-Encrypted: i=1; AL+hErEDYQfQiMksroV6Al852DZ3DSw//ql7CiU09+80QiowfHoC9lgaOGABPDZPzsTUeIEAxZxuAoWApqQuJSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8HHuxoOqO/VYgKzIq805NpzT99wQ7eo4kIn1mYI4mQNr0TGRz
	Zv7YHe4IUJEjuq94Tun6eGLiFAGZXbABnmaZix2kj1Njzw4QQF3Jh6UF
X-Gm-Gg: AYBFou0kQvqMFdgLsPLtLirGiyNnUK+MCIMEk8ZV0SPgLFKvc5TusMqGRmJc1b/Lq7y
	WTlgUAWcs75kjDjHDdd2DDCiWGq+H9varsEky3mAci70kCrU9JI3oS3H60ccBe3P5amLf4AAEBI
	GloOwHWCGt5g2xjPK3Fe8+1tr225dyWN+YZv0Mfyr/Oiouycrwn2oyTjftbVhhcjRC6yRSNlZf6
	GO0mp5leOk61D4j4xcnQ0Nv5PdLY7K2WoQIuWlPwOE530PNB0jKW7GSPAZsfLddNMHq+pd06Nca
	obW23OeprOzKty4etfM/i8CW8rlC7geaGeBUbeZ4FzUIqb0lW8i9Fd0BihOC2/7tg1hk+Xn+cvg
	b81ZD6dHrk5KSbYcX+pinIqCMVQp3Qdg9MH4b4I65qbJK5iUOganYa5d/WExRVPLYXId+EMSEv7
	Wadsg6tfmq/Y5Gy1SWwMgnTr/rV37Yvnj/xcb4aa8Gut4LaxT9fw6Hj0n/014g1G8OhLBHCP4db
	ZlqupmTahoBkw58OFWPcEO/Z6PPBfV55nR00n4nTQV8xoKLPui/zloHH0jEcpu0Dp/uS/5J7isK
	nRTEqwACSjgnxwdN6ldDy6PEXI18f8jH0CD951VqljKwXJPSsooIUtEtF727gf772Ts5
X-Received: by 2002:a05:7300:f788:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-37256038776mr5838575eec.6.1794209071027;
        Sun, 08 Nov 2026 23:24:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm9950069eec.22.2026.11.08.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:24:30 -0800 (PST)
Date: Sun, 8 Nov 2026 23:24:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: dudl@cypress.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: cyapa - fix runtime PM leak in
 cyapa_update_rt_suspend_scanrate()
Message-ID: <avF1HqGfA-82_Q46@google.com>
References: <20260916185015.2093520-1-vulab@iscas.ac.cn>
 <aqwD1o6J4svIevWW@google.com>
 <1794120347.2701234.vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1794120347.2701234.vulab@iscas.ac.cn>

On Sun, Nov 08, 2026 at 06:45:47AM +0000, Wentao Liang wrote:
> Hi Dmitry,
> 
> Sorry for the very late reply.
> 
> It does not have to be the "sync" variant.  I used
> pm_runtime_put_sync_autosuspend() only to mirror the normal flow of the
> same function and the other runtime PM call sites in cyapa.c, but there
> is nothing on this path that needs a synchronous transition: no device
> state has been changed yet, both put variants mark the device busy
> first, and cyapa_start_runtime() sets a 2 s autosuspend delay, so either
> of them would only arm the autosuspend timer before the store returns.
> v2 uses pm_runtime_put_autosuspend(), the counterpart of
> pm_runtime_get_sync() for devices that use autosuspend.
> 
> For the record on how the patch was produced: the candidate came from
> static analysis tooling, and DeepSeek and GPT-6.1 Sol were used to audit
> it and to help write the change.  I reviewed the result and I am
> responsible for it.  v2 is build-tested only: it compiles cleanly on
> x86-64 with CONFIG_MOUSE_CYAPA=y, including W=1, and passes checkpatch.
> I have no Cypress trackpad to test it on.
> 
> Thanks,
> Wentao
> 
> From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Wentao Liang <vulab@iscas.ac.cn>
> Date: Sun, 8 Nov 2026 06:45:47 +0000
> Subject: [PATCH v2] Input: cyapa - fix runtime PM leak in cyapa_update_rt_suspend_scanrate()
> 
> pm_runtime_get_sync() unconditionally increments the runtime PM usage
> counter. If mutex_lock_interruptible() is interrupted, the function
> returns without dropping that reference, so the usage count stays
> elevated for as long as the driver is bound and the device can no longer
> be autosuspended. Drop the reference on the error path.
> 
> Use pm_runtime_put_autosuspend() rather than the synchronous variant
> there: nothing has been done to the device on this path, so there is
> nothing to wait for, and with the 2 s autosuspend delay the driver
> configures the put only arms the autosuspend timer instead of suspending
> the device.
> 
> Fixes: 672865080a8f ("Input: cyapa - add runtime power management support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied, thank you.

-- 
Dmitry
