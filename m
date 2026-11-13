Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614269;
	b=GERsCQy0KWVEysRL1uNqpWn3QKfiHh08553Xq0p3Gm3RIbDQUy4AKLHSKWjZOVUtNIfL
	 cHSyd7EREkvfU07Sm7AHvMcg9bpjqw7uZciWtm4l1MLml6HsNTufG38ndyDQAOJbVv1FO
	 FFB5ZyKL1OD9Fz4FrH1nAMUS4BYY4doARD6/f/auO+Sn0WbvcXMsGuOx7nbo7Q+XrTDQN
	 ktESxpNGFCK/8y/FrLzUubJDMHMgJWGML0cy+eCF7xDog3Njvm25Ds8F9+NZ3B4Wk9zs6
	 29ZrQtopYB4o3qbptO/gYZiCL6okry1Q/Gi4CLAfF42iK5GjFZH2qCbqo4/8fzy5iZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8+NtZFjS95/B6+YyhboKxw3u3O9LiJhhPeE5lA5NESw=;
	b=D+S3UWzcniYNqSFUQc0DsQ4Jj+oLXlamPBVVfexqJr0shddkG7YDVmPeo9yvo3ot0HTX
	 Gu6hvdRVFEZGyYhzlx+2CB13G3Pw7CZ3mLS6HD7Bo3FR/pWrNZN8Xgotr7sw6pGdKc+nL
	 16zYnV5HPR1almWr/42k8B3SkYT0Q0TiYirQYyCOSja8u3Sb+BCfltJwwGz4qD2Gd+OzT
	 Jy2pDtUbEg+t0NVcMCdr/nhA5O1zbRyJSSlQrY2VJYUWDp0Y1Wax7hkVUoyZG+fONJQNP
	 YJ/Opi7I6BcPbAD8+fQmCV6T8WyM6Yct1z+b9RIIyx+7rAWmU1E64HkB4zxKSUoitWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBGmygPD;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26812606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26812606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBGmygPD
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d21051042so323502066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614267; x=1795219067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+NtZFjS95/B6+YyhboKxw3u3O9LiJhhPeE5lA5NESw=;
        b=hBGmygPDV1jEVNi7ehHZf9hn2Y8oSa7UtMsjyhADVtKE9Iqh5pWhHd2aC4DUxniZ5f
         27Ulp3r4zZ/F1m4/sRxY03nO2XffKGC/J5jZ7xEgNoBh7aEoCOAuGYd05LMBjsD+bx1e
         s6IKemiL6a8UuWC18SAypIdYnhexr1iOwoho3TI6QLQM/qSCvEyOfLAlJfVUTmGO/vZB
         /W7iHN+lLEeuU51R5VJvEOiVBMHPYqrgYIOInkPUDEUTnx3rMH1vgQ/boYi3gMWkpHX8
         l0w5eDaG0cfAN8f6ANOgOTB2J9Wa9ipElL9K6yeP6KGz56JKKvMS6v4J3EAgcqZWY+Dq
         4g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614267; x=1795219067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NtZFjS95/B6+YyhboKxw3u3O9LiJhhPeE5lA5NESw=;
        b=xuvr3L0ujGI21WhJpv+eek5subloaW8O6va7BF++qGT4L9vRRiBu0vYKx/267p9pRv
         VdcrBhXoG/Y+/+KTU4jwrRDtSzki7XCV0uVy/DUptdgvMgZhUAS+MmRwO7RQ2R+jTg9o
         WHO5Jxt/1rAvVOcUijRbzWWxks8D/azpYLHzEYsK1d24p8c920jrv9M8doP/YswOtJpt
         SS+C1zAIgYC5/MqMgP0IwQY2DIIm8x+7F8eqA5p1e3hVgIL2iVYJeLavSZDrBd9DSJV2
         hVKlNY1Bzpb7kXnGRJhU23QcUQuCkO5M7F0w5YzhgFcRnyE8/PBn+9C8UevNKSoxO/Td
         8TKw==
X-Forwarded-Encrypted: i=1; AL+hErEj5YPyBpECjxjdFzS9qQhyFlA0Cx4w2hmYlUl6RD7D7vcMlUoAT6uq/l1dGNooSLUxl1zJ6EiYNheYadQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q3XmWZfdhEpoNcdZqs+ii90teHwcU+rKhioxlAW6iKihZ7A2D
	q1cSNgHvkSy+wOWQjWNMOeoXRYgl/qE2o4n6tA75s8xwSFc8Dl5/dNoR
X-Gm-Gg: AYBFou11HxQHh3rk5JGqtmQiZNCTlo6gybC+q1bZ2tYKafzY4SwBKhUsvunVfc7dRrs
	jsF+xm0PJCpSK9HyKd8yih7QmAXGFOSEf5N9Bpet5mUXyZcnaVGCHfcSt8JGS4d5EZacx8Yj/GS
	4LvUJS/vCMerCSJdyY7NM4Uf28t7mIvLYPfzGU4E3e6LWkeveGXMBwHof/M8FTdLezDeqZ/8Dv9
	AyYjGZDKHJRiMowt0S53Giu4YsDwT50GE12mVFOoT5p1Wo6do8Zh/GjdExBJZsZreB6/OgqB6lP
	C6NhyR5DZcM26Hsc6S1ZP1EtMflgzVyD3DbAG8Eh5Z+NabGWybCUdojhmbL9FImNS/7+5wmYZNU
	ccC6t8NDi7W0ZGZ97I8NGRarm00cbeGqZbtE+hXNi8nPmf9cWcYSl5iADV9uPgH5HlHUSuucbIb
	ZBViudFU5IJtLD9N8NTMRiDFNJ/TtxcHPEk7UFcXbBaM7v9v/yzRD4LLmwIUY0EzUcbYyIrjp96
	/2Z146FW9ErFjGvOslBa2A9oioUL8sOfILgb6XBfSx48u0wtewqmX1cLc7u3nRvnaxyk2wwWYWq
	2Hv4yNvqfv5K6eR3+3exzol0zidCjUe4p0oFKDJe
X-Received: by 2002:a17:907:84b:b0:c35:3880:773b with SMTP id a640c23a62f3a-c50963f11f7mr367103566b.45.1794614267472;
        Fri, 13 Nov 2026 15:57:47 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7d1b7sm154978166b.74.2026.11.13.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:57:47 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/6] net: bcm4908_enet: release the TX ring on stop
Date: Sat, 14 Nov 2026 00:57:45 +0100
Message-ID: <20261113235745.516931-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179460252891.2199510.811569497068459485@kernel.org>
References: <179460252891.2199510.811569497068459485@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 20:42:08 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] Double free and double DMA unmap of TX skbs, introduced by the
>   new bcm4908_enet_tx_ring_clean().

Right. It happens when an open() between two stop() calls fails to fill
the RX ring: bcm4908_enet_open() ignores that error, the TX ring is not
reset, and the second stop() frees the same skbs again. In v3,
bcm4908_enet_tx_ring_clean() leaves the ring empty. I'll fix the
ignored error in open() separately.

> - [Medium] bcm4908_enet_stop() now frees in-flight TX buffers even when
>   the TX DMA channel was never confirmed stopped.

Also right, and with HZ=250 the 2 ms deadline can expire after one
poll. In v3 the wait uses read_poll_timeout(), and when the channel
does not stop, stop() leaves the skbs alone, as before this patch.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is High
>   severity and it stops the patch's new cleanup from ever running in…

That's the missing TX interrupt; I've answered it under patch 1.

pw-bot: cr
