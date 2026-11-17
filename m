Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932117;
	b=bEMIOwkxstFGZWDFmt7CVZyXRZxHhK+IbUNwTbkGTy/Suu9loZ1u3c1Rkftq8qkW0jaM
	 oYDel4nlu7neT3snmndOKl3UXpuN6IdWym7pAt3dgNtG91CqmgnxKinlH5trI3gOi4UoK
	 EKvk3+S2Isq+V369l0Y3eiAZh6GOLKmh1WhAcmFiUXp+nseRM31NCeuiIW7f08U98c+nk
	 xu8bRTULRvLvNQerj5KcGtg2pSOsJtzp0pxahLHA9VRYqlIPZHD29ert/vSRL1KIGabWS
	 hUzJinFKKoSdlpaE+gGoEW4g4DdK8yQqnjb787l0A2+55QyVKVxBSO2CbpMG8qfVmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dv+qnYIg1LLX+X8u1K4k1JObdqm7jNQ4x34LTfPB/8k=;
	b=u9Faz/uKf4kc+lxzuwUnMH6Egd1i/Yc0H1XTNtgSgyeCU8+2/rRE9m+gmK6tM0B1ySzw
	 EasD1sIodBUMZjM2MDMLOfyS538Y4sD5/DMe4jO4ttRbwhtFANN/exMumW5la+ZsMUxbj
	 cw6Ckv5jBXe8gKj8MfYy7f47wFieeWx5Z7Kibn93Y6PELMn9+kqVRhTc+bE+vglCVVv6h
	 1hDQnghkRbSQk5Z7/bB/U59uXrWPIku3J0sIPmS1rSqAEsQ3/jcIFCpwAIf77yIr3YFQ/
	 Mpy+21kImyvlwKQALNfETD50kImSWj6kp78p0sqcJIAlPLILzyLEzx6k5VLnSpcA6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/yKKeU+";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/yKKeU+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so28155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932116; x=1795536916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dv+qnYIg1LLX+X8u1K4k1JObdqm7jNQ4x34LTfPB/8k=;
        b=o/yKKeU+P+XcDzXRSs5r85sUlYZiOprlW8nqNvPgJ7rL/8IYYWqGA6TeDO20BC/bA2
         eLJX8bBSPcf64wl3f7wpUPWcpxgdpF8tFMVr7JXZ1k4IhVsTJ/xzsIOTKXQUGAukyg7l
         YlH7sgK3C/Zmk2nBMnnJnbf0RDRx9NagPdR3hqXLRbc0dXr+abSa4VYXYzNRM2pPvjzJ
         YgrGN0z6cEcdgDlTEFxCHWIp95ZNQMN98kAN7+VSEBrVGBEVLObzJecTpYW6NSCGKt0Z
         cMRIQszSJkL8UmSI3jrBkER+aVb7AyIfVyLy6bf1TIBJwRID1xtjMq8dMfWD9uBjW+Dg
         Frbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932116; x=1795536916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dv+qnYIg1LLX+X8u1K4k1JObdqm7jNQ4x34LTfPB/8k=;
        b=uOHoswbaYYXqI8z+BclRLxCkWLStYzPTL2JZfN9YuZT7yd8XQfzzHz9Aetoo67t2mO
         dOdGy92JZWZd26Ln0kO/RVyvzS+1XDs36M6dT0wvE56cKvLU6hAZiWeBVU+mODS/Fvt2
         nP08oIF9RL9VigwNCU74WEMp8fQddMgXl2CSnXvR1hMIEn9GNuGx2PH8smkl2AbwrkAo
         oZOPRzas6beHILE/7+qYZosvGcjmABrkSVUfs7/bXgumbUscFNnEaMJq01AsGD/afHYr
         RQ+oZGDT24ODPdDN5XeR8KceVWBzzpboyDWvxokzlA73/CnB3+1qoNftTZ5bQxlwO9iy
         fa4A==
X-Forwarded-Encrypted: i=1; AL+hErFHyQjRqkk6h1ELoRseweTwEKWV7xY1LzZqFgpaf5KR+5pWpvBcnjWIvnyNgYKoWqua3RvqlyZ0wANtpBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k+2t6o8eIY4usPwj0r+l7btcOUWxrCMhamGrkPKGqna2eiGsG
	MZKA7bhNRJ/TB9xSn5UEQLxWBFS+dCMxi7MmirgoLGyN2LayElAiVmRa
X-Gm-Gg: AYBFou1iKBgbzyqxT8tQWGm8onSDQ3c+Lt+0+ihPw6MUx+jaU+VBeBEbuh+7Tjlt9nG
	aRHEds5dL+H8kk0BrUdxkHu8MxWwKTr3mXVStvFhrZ6ih6At5dXk2chJkZdK2JyVob7f6LxCr0v
	Hac2/j3hT3oxL9pNxi97HHH7Z5Bh2MlqODqY9wFj0FGEpJvVr3EYx+7iqJBUCFUA8xb5u1uSEm+
	96BSBOjtB+4I4kr/K8pbu8cpBtgq3pHtQgcytEndB0XjylQCNEXRFa0PPUyiwHVrKO5qk9oiY37
	U76a3NfpidlpVyYSNq4z63jr2X9/BUwjKEWOw+oakLr9ZMTLpoD2H9VrWrK8N29gHsGDISm6wob
	YxzaSovJN0bmtohaGLrzV6NLWhyr5JsS2b6TvoIiiqv+/BxjO+bK/P7pkjmL2vtgc4YtrtCQGLU
	ejJDWjEiTQ4Xjl6hLFCa5Gu+fDDTrqCvBTaFINYP2Ej+k2sNOCA9aNbWSaBYzhSGsga+c1iyk+r
	4xDF3DCNfCVDhCzpuCVBD8g7Ir2NdZLPHFyJNqnWBkcj0tUp/w6RkkFERyBCQdJ6fUPU4EdjtzJ
	9mwXjzPa7XM7dylfRCSHadR6vghL/RET9EyAMnn8yPrYQMeygRj8n3I=
X-Received: by 2002:a05:600c:224b:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb5ad95277mr223398435e9.0.1794932115683;
        Tue, 17 Nov 2026 08:15:15 -0800 (PST)
Received: from scheduler.schedules ([85.100.69.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm75831465e9.12.2026.11.17.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:15:15 -0800 (PST)
Date: Tue, 17 Nov 2026 19:15:12 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org, vincent.guittot@linaro.org, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: christian.loehle@arm.com, elif.topuz@arm.com, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, sh@gentwo.org
Subject: Re: [PATCH v5] sched/eevdf: Fix vprot across reweighting
Message-ID: <avx3Q0WvV5lgAhWA@scheduler.schedules>
References: <20261016153721.7843-1-kayracizmeci@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016153721.7843-1-kayracizmeci@gmail.com>

On Fri, Oct 16, 2026 at 06:37:20PM +0300, Kayra Cizmeci wrote:
> Currently in reweighting, while a tasks vruntime changes dead protection
> could go alive, or alive protection could decrease, increase and go dead.
> Fix it in reweight_eevdf(), and just cancel it in the sched_change_end()
> path.
> 
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
> Changes v4->v5:
> * Use Vincent's comment
> * Grab Tags
> 
> v4: https://lore.kernel.org/lkml/20261016150402.6952-1-kayracizmeci@gmail.com/
> 
> Not tested.

Well I got bored, so I tested this. I don't know what more to do on this
patch. I already pinged. So the only thing left was testing, I guess.

The results were good. I tried to verify 2 things:

* Only sched change thingies enter the newly added path in enqueue_task_fair()

* All tasks protection gets handled correctly

There were ~318000 reweights of curr, ~48000 of them were alive.
No exceptions :-). Or :-( since if there was an exception atleast it
would be fun to check it out.


Cheers,

Kayra
