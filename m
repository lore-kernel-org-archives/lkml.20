Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474410;
	b=454UU1+jfZ2Wsf/k9Xzib73qlwl2j3vD8TKy5mGSj6h8wxlaEOD3uaJcPfRB1IzaKI3U
	 rm1FdF5CopEypSlYZqKc6vB0o2+KibdyA0xt5F+ZxLGrXett96dZ3VWXiwzcph1R3RAVk
	 J+JDM02o5I6d2LkT/GJ3/P3O5Cz2HBOE5JXhYYzyEhU0tFGlHe+EpuG2pT3Iam6jaXLyx
	 6ZIabB+cqEBWMiApKQoMn1BzWDe0CoB/G3R+8CpVbZEPhKKB42C6iXyFHMNfM6WNb6iGK
	 pvtJYXvhHte6mFEORui0av/79fo299WLEm0ykmuV4CzIKZBQ7hS3XyBVjLqfdvohrMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=AOEFU8qzpm93qZ0ASBa3G2K2mt+nms7YtGgBndT2NAs=;
	b=Re7ckVvLa778FaGE495wp1YixKmFg68AjxMBJVNOEKIs71zmRBWaEQkxsnERodzTpijn
	 Dv9LmKW5gwOuZLfwK4EoIc8y82mjPvJYevuV3dEJJHl9NORqopuQ2AH1pRXDcbi69GDNU
	 Jt/gbTpFsqmrFkfSbOK7Xp2kzVbxxIHahJWULGhPi0X2wRbRgmFX4G8VG/Huna0wXkh1C
	 XSehznrGVjZZe18P5uljbZtkqzM7qmMa0pbonjNPCkz8SoX8B0kJajbo3wctyWCa3A+2g
	 Lcws5dvRDqAahzfkGnll2raI1LEuyQ86W31oIQlOqsSjT2/BCpLYAXt+1cqfE47SpjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fJQCMBQ6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fJQCMBQ6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so42294485e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794474407; x=1795079207; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AOEFU8qzpm93qZ0ASBa3G2K2mt+nms7YtGgBndT2NAs=;
        b=fJQCMBQ6bEfikb53H2FDBkryxY8kd7OKhsso6FL8J1BMHNLRRUPDHng5PEiNSdOTsi
         6X5VjQMWOTQSAPL3adCNUcJp66Kl3GMR8uusg55hfNQE+Yw5HDt8QTXKIeoxrEmRGR7l
         iaqTeccg4O3Vy6X+hjjAr5wsATeZrBzjeamgUci4RCTP+zYt2JSPquCemKE1dQjo1jvL
         Zo3Liu9DKGRbZJ33FbFESxEOLlNApiXLfKR3BajjefqerhZOqbPpspvWoEZQxnIH5kDV
         i81Y6SUTuxb5uWkntohRGmel2+N/qmEhDpV7WNE4S/WcNj12jdUMgBTqWsbQ+/TaoSIi
         yyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474407; x=1795079207;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOEFU8qzpm93qZ0ASBa3G2K2mt+nms7YtGgBndT2NAs=;
        b=xbVBhXEJz4a20M+Cgx+1Pr2kB7GfBqXMsalo5G0AFQupN4qB+lMZ40ILBa4WUETCAj
         N+0YDXEA/LSUIIg9BpNfeiwBPCdnlxsDR2FxaF3/qVMUxNPNYAYDaXR+tWn+suyP8rPv
         4jaFWhudTi0attXT7Snd3ZccPzla+lHSVgCs2r4b/w3oqNqnLTAdvkyVb4wKOQTFOtXB
         ZRePauEVOkGRuYCKSp2FzoI3UFO3n9bxrhOIHoTQt6t7N+YjzbGE7typbvfTUYpeBEg7
         H82UTlgZrXyMeZApW58ltJ+G/IdNzQ85Urs736jA6aqOSSuDm3YkNQSOPIUE1uhxA5lF
         Jv8Q==
X-Forwarded-Encrypted: i=1; AL+hErHqLzod4vq2q5VebrOpP3nDDqlNfiTEw6XJZYdwMg7gRqEHoP93t/oTLZbh/bD7nJiMgbEqbhitz+XFops=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ArzGnCvB/vVnRExgR/ZjAaOQZ6VctBb+ILnTOfTgVmd4dAmw1
	s8algoB8o88dRqg98OuwF+ck1wyxb0h7Ub48jfZCecW7lZ/Pz+bpieW+7J7VgWtNhmc=
X-Gm-Gg: AYBFou2bUC0DZ155e2739ZuKFBr2EVGh71PkgKZEYjmHqa1QBmnWw2RCxmIGKMMOHga
	bK4PEVYnR1E6vN+6fvZzre8dPED9rgKFJn1ana3ORuPzeeRxi3UJJZrKzZts7o4zJsh4bniWrVY
	xTLhWdzTO13nJFC4j6IbqQgn0SKBVj1UY4+LN9mUtxaLsa9XDYXHJMoLgupzvmdo01Tfrs1RTVM
	+EF3uXe7DVCo48t++XQVzX8nq+WirlZBXfiGrKu3zRffCQvZ6Y0ATR7MXau4OIaEGOxtaJjUMOQ
	NPgZ8fStymrmVyARNO8CQUkD8gR0W2YuLmW63lFPaOPjbtuERuPioL4Q6HUkpB19i3gMMGdSrQn
	zoXRjsk+e9417NCXB7Sr6SPes0Qsve/xWWeVXOt8szbZtuIeT1O33shjjR+TCDNZ8zeo9R85+Dt
	8Ekza2G1yBKUOnQfnp9aJa8RYIehS4I+ztcNIkv1m2N3BjgoVYNNvpTtOD+oHv56uzGGme//slJ
	kHywzGDTq7qswsXyhsRZXM0odchO0UdPcVm0nuFIMYDSUyqD+uPNIJkLFTNU5IKffk719kzTyp9
	VBqUyujaFakjZ2OXcIWzAp6rpvXuQQmy78oCp9rTsWVTsIZYt0Ca6Ww=
X-Received: by 2002:a05:600c:1549:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0938ba0amr89292435e9.23.1794474407550;
        Thu, 12 Nov 2026 01:06:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:1264:e140:4d18:9bd3:e16:ab6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26c2casm49653405e9.12.2026.11.12.01.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:06:47 -0800 (PST)
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
Subject: Re: [PATCH 1/4] crypto: engine - clear busy and recheck running in
 the retry pump loop
From: Jean-Michel Hautbois <jmhautbois@baylibre.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 liulongfang@huawei.com, qianweili@huawei.com, wangzhou1@hisilicon.com, 
 linwenkai6@hisilicon.com
In-Reply-To: <20261109073556.2517351-2-huangchenghai2@huawei.com>
References: <20261109073556.2517351-1-huangchenghai2@huawei.com>
 <20261109073556.2517351-2-huangchenghai2@huawei.com>
Date: Thu, 12 Nov 2026 10:06:41 +0100
Message-Id: <179447440150.262855.920255293147441135.b4-review@b4>
X-Mailer: b4 0.16.0

Hi Chenghai,

> When the loop drains the queue it exits with busy still set, and
> crypto_transfer_request() queues a pump only when the engine is not
> busy: if the loop ends with the inline error completion in req_err_1,
> which queues no pump, the next request is enqueued with nothing to run
> it and the engine queue stalls. crypto_engine_stop() also spins
> waiting for the stale busy flag, up to failing with -EBUSY, and the
> loop keeps submitting to hardware after stop was requested because it
> never rechecks running.

I ran into the same stale busy flag while measuring crypto_engine, and
had a narrower fix for it in crypto_transfer_request(). Yours also
covers crypto_engine_stop(), so I dropped mine.

> Jump to the idle check instead: the loop now clears busy and exits
> when the queue is empty, and stops submitting once the engine is no
> longer running. Engines without retry support are unaffected.

Tested with virtio-crypto under QEMU/KVM: a small request no longer
waits for a big one in flight (about 350 us down to 4-8 us).

Tested-by: Jean-Michel Hautbois <jmhautbois@baylibre.com>

-- 
Jean-Michel Hautbois <jmhautbois@baylibre.com>
