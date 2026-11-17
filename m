Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913223;
	b=VZ42XdxMf1sEtztacx3eMy4Y7cjHqDZdgnXWg2KvspAxurustpZ1n05cop32x2m7bUlJ
	 JoFSxn58kxcNfeHlZAtRj0a2lKylhj4XDIH3QcDPgKmdBOlADDifOF3qxMYKlwhddnmsZ
	 QxumhStg8+fuTBaOQ82We1k8VIu9NV3mD7hNF5/BYqihq6rP1+OQcyOIPSqijL8cZ/TSk
	 6xpX4GD8U+H84rl9KZTzfNMrdhbamI9AM7QyQjcxGJFY4mrAufh2P5DCy37QSxUhqZvHP
	 bFc+12JshVJr5n5IrpIzt6b5V0UHueDOip02QZW24WkfH8ilPwpE8hg2P2Z0u2bO5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=+3AXZBYyaaLha1235Jifs6+NRua5WAqO1ulZoEtAElw=;
	b=UWJhmVe1d+ehYYOCYaGK2+UGdVDXo2TaXvA7eGQsfKiHH1e2P2j5mYzQ5risCBauf324
	 ZM0vu47lEIHVHJQxi8t3hxXT6R4UyCg98oL4XhIzfcNNhDu4wGG2kvQwVBwLo8VU5cUAS
	 PZc4PzSNKxnegjlxxx5on95kZR2Y6scJqEy4uqsb3gvz7mOTzE6E3lobWO63ubFAYmiUZ
	 WkRc2EA1ZQBHyljGgSQKXRdvJC1ffhKgGOxI7aOOlHoiaq8ceNsrYFo2uvzG2TbAzYGFe
	 k0QtX2U0cPZzRJt/BBZ6YxzWBBDVhCzfPL1xw1ujBIkjSSvhgBmamrLiS/2QLgOOtTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYLvHtJq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96756606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96756606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYLvHtJq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380c17707ddso176095eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913223; x=1795518023; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+3AXZBYyaaLha1235Jifs6+NRua5WAqO1ulZoEtAElw=;
        b=PYLvHtJqr4D0IYvZqYJ9ZLKuDXFx4SYLu5VHdoq+gn9rxqGNudL/ifZlQdSwQ8aoN0
         Wk9F6daVlGM/Q8Zafz5whOAFFceeItqFEva854OiiaKuihaBL6puKmnalWGTRl7Te3/K
         4D/A8mqF0coTTHkOwpCU9aVOaICJbDxNRwNpQY/rM8tKuLhGnNvAfu2uf92pQjXuYlgQ
         wDvDuqiPKqsjlqbiTSQ7YN1TpVVynVirFOJIGWvFA7vQO8k4B3Ct/hx0KRGEOaQpGYak
         +cQaPv8IhiwTMclWkByHtAK1jd3KoXhgd5ZMaFGyNswNduFlq8RkmC8CxBa0X19vLLRE
         zCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913223; x=1795518023;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3AXZBYyaaLha1235Jifs6+NRua5WAqO1ulZoEtAElw=;
        b=T+z1PjfPlaRtyoOwFAK1apAxQPlqAG9qJOedGnSW6hU3O7ksMKeRrKfQjAw1j1KxEG
         LtuAW+7oTw60VSgNHCRT6F5mk4LpDSo6U3yiu3SA8iTTqeB6f5UQ/giSbv7P7LQ1XM6s
         a7OFta2rVEU8/SF7VibrI0ZUIlT6I6J0za4W8hrIqlQ2+/ZZ+bc8XWJqn99hKM2sh/dT
         NdNRzNEWfjf/NAoHrkWPzAcXOZYgyHmOPMpETbaQY1TdgPcbnF5LaU23bOlBFws4gV5D
         hUnNWHbRRmEK52Oo/ATDm/jwt33jqUMUdkZz5rbgjGdBtvwKEf/K6hfHC2+SQTuyuzfK
         vxKQ==
X-Forwarded-Encrypted: i=1; AL+hErH+NkssMdvordzPvRkaWYlq6dLLBVIH+hCbsvzX3t+xTmrQqK7xuVOZ3CnFY0IblrSZeqR+uTFFk75+1yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SVsj4GNyRIVUmQqOOhFqQSjvrlhsDJj4E5EtQ/+N2QEwgbFb2
	/IbmrIMPUMkpByLyPVDYQTlBFBGrteVm6QkCklpe18j4uvYBLGqVfUGo
X-Gm-Gg: AYBFou0nO+Fq+khSkY0uZEwoDPZrv3ZXAm7nMrseAmip8lnHVQoCHEnTHOoGKOPiczS
	X6Xbeo8nQTNYG6Z6W2So0Uzw/KWr5LhXMUIhlGJFbwgIZk1p/Dm0bgGs2wLWw4PIYQpCQYtc13w
	kFvPavE4Y/pv8AjExkw4cTj3CQn6LXbmiC4C8kcrZr0nZSyJBkFlsNofIUXD81e6v8IpsDvtQ/r
	+mewSv0kcvrQpbEHfzxjalSSdoUA6U2fUs82EZTGkaYzygEkVyubQKTg2I6Yo0GIeTBckVQQ8zr
	WQMVWYR/kwceTdJgjHhzhwyYEKdzI6hvAaREgre5SQ1tLwcIWa+PZK/lMYLdGNiHcwpku+KYoqi
	e7SE+8x6Fu10JX7pwAnptQOU+tYs5PMOCMKXKYV5M1qG8FGKbtmvrCDMWysThyWS3fU6Vg/8NYI
	XTJimGLnsWWcia3/yyqY8/gNwbbEeuFE+LXDqTfWxp1UsT9tBYo5Fs6IrhZuuCC1yYhYrC9iRMj
	Rjt7TSQCJaVV5HQoIfOqr2x6yVzLm5/F7evGAxbuyUgdsC0UdACF0tW3StELK0jK1oiVUq/qJsl
	L/ApYFlUHqyDE0n1bUFupuGrY7lmFW3Jy3z35m/AxCoBCUh/ZLVw847VZcDLS8owidE=
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr27080643eec.1.1794913222375;
        Tue, 17 Nov 2026 03:00:22 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm44844871eec.28.2026.11.17.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:21 -0800 (PST)
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
Subject: Re: [PATCH v3 10/11] zsmalloc: fold zs_obj_write() into zs_store()
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-mm@kvack.org, Yosry Ahmed <yosry@kernel.org>
In-Reply-To: <20261111064707.2568433-11-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
 <20261111064707.2568433-11-senozhatsky@chromium.org>
Date: Tue, 17 Nov 2026 19:00:12 +0800
Message-Id: <179491321252.964041.5043408594966028356.b4-review@b4>
X-Mailer: b4 0.16.0

On Wed, 11 Nov 2026 15:46:33 +0900, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> zram and zswap always call zs_obj_write() right after zs_malloc(), and
> zs_obj_write() has to take pool->lock and look up object location
> again, which zs_malloc() just did.
> 
> Replace zs_malloc() and zs_obj_write() with one single zs_store()
> call.
> 
> [...]

Reviewed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

-- 
Best regards,
Xueyuan

