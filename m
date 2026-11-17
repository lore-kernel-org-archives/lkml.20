Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934985;
	b=Iqy8XZwzlehl2ZzI4nK0z28JQOePyMBEHIpHGZVnqh/XJF0sXd3lxhKp7bVGZWbrYddz
	 EzchRfUy17kBEaH5+WlpJ4YryYRqE5G+ig9Aehf/jJPXe86BBlwBohGCA1jl7tPrIybal
	 i25+9ioe69cWfKY8Y/AS0JuMQZ5uz5P75IdER0TKCqj6vjbO6Tw7aPFKSgT5QwKSGOjIU
	 bySxj/fYx3i0r/bClA56eto04WBeHkoRo+gWzTJW7CChEH9c3dZtAdNNFH4ykvON7r0Lr
	 tSyyJLUrJJ8sxe4P2v+ylPjX3Zo5ZzRcgGZ6A4pNmFNbIsxNnRYO3yTraDKLqli6yCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
	b=lFwxkfJc/cl4lkwcdnK8WAvICMQbHwViafuiGtwP47F3Fr4RQeSPx5dTih9VTNrXr8F9
	 8BhJHBfdX/DjSzWBCZM32fnoAr0+yhCUdh57ny5viU1WyKAHTt8/O3rr6DgJt2tZrkmdf
	 CRFHWCrMcZV2KzOV3AzUR/JRygyQnlcAKRgh+5nBLKHdRfaHf+0hErfHaKJsh/6vQ4q2h
	 JPubKRWE2v6fqBEWa+1a+zsEDt2YLsqCEI71XDPgYdebs7aK1UNAFlKxBx46zO3rSG8nG
	 zZD1HGOBc0Pq52pRU9VtNBLOnaBfJ05KdT0CAyCW92DznUx89SlGgEC3QGjRZ/3dqug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvnU9wiD;
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DF606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9DF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvnU9wiD
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-4a556a650a0so101520f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934984; x=1795539784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
        b=WvnU9wiDkdjWE4pNa4YnS7DMwPrKzqAEkzJ+N3Rqoji9xFli16/u9ibT5EThhG5UtM
         dM7/fS9CY9/QU6uyjbejNeAlcTZ4+IKWg83dfxwhpEZYMGLkWILqDhoeZAntH1ELw6Ac
         3mUqTO0159tp/eq5kOIcp90+EQhEiiXPVk9wYUlRKsFsJdYAP2jmWNy7Ntd+8c5n0vJ8
         wAY3rgtzJxg7uQ7TyoNlnqXTgsEBkws9O3gnu48kurTg90mY1kVRGNopzboSO2f/EZ33
         Bz2/6QdXLGKc1/b1S9B376f4iNq+0/zkVRtx56/t4vbeAvVadWSi0sphdF4yUnfrZ00/
         /5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934984; x=1795539784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
        b=2AaJSTfOEvJNfyVxyCzzheOHzsaYM3e9MmAAN+GHaTGDppSlZt3n8Jpo1498+5CMnK
         GZkqhnqd5eB2oY7Ks7DJjgUvCwtNQo79xhQSSJf13PEpITvqDjq/s6daY7+RPSc6XCHq
         Q37V8HS/laAiK/13NR9B/YB4SYvZX+YUl8g8mqXAH/HeMrNolOXmdAf7V+fc7TOI9gkQ
         2dpatRAw8tq3DCkJ+OfRGQQq2hjFyHKwiZW3hUvD7Ae63WxMT/uY4jiD4dL/ylv74Wac
         dpz5nVpWyG3Lmjz+Z1l4p9PZ6cO7/8CsjDut6tglqstHYl4Ky8tnZbD+98lYUcdM1G9q
         Y+Ig==
X-Gm-Message-State: APuU4Z+rhmzLkXRA8GFyGrWE5ejlKRbuz5MezmyQcy5ToV0PqmZ03HF8
	1XNlkHXyrpC/1OLH3s9nGwm70/15+YOmnID5PrXVq8kp3gk8BW15yuZi
X-Gm-Gg: AZFdTZdLL/RNGg++RCESdb6tGUzpZtRCQUoCZH1imikz7rg4BZcXkiXvpYHohpuLK8q
	4s3kugmS0VFEUGecKaPTOvmCV/oprQ1vUaZwlkFeTS9EAb1+jRx8Ht4QBlaNJq56XBLYpw8qDQe
	J2V+ccZELOtmKZqmAU5UtnjzHrcm690SkF0f73Yx0eUa4xxnRmSek9eAw5KGTZ5Cr/DleFgHr7w
	08QnohA0VVZ4NMSHdxalam7UPf+go6CMjMDxseZABdbSgx1Kpxl/LARijTBgasK/OpluKb4DeY6
	mmOZl9J5ztu1Cx+jPp4HTc2l33hAgldT3D4LPyK237lHm4RyEKy6l2AeNmPF3zsVlYk8GrcC8wH
	pkYvGLkHCRGlUymjozMr9pj8pjnG3APX8VrpaSGf7pz4bdiP8uluJ+qx7CLIV+zjAfaSkkk9Mp2
	Jr1BqjKxsYES8Ipm/7UpyeV2mI7+Q668cr2SVSVuFzlg3g+KZ363BFBaUhgbW/b+U2HX9htUm5G
	xuJECvhhRQFZWlZP83cRHUl4MjVoGyNLPb7vVwXqil4J0fmdoPcuHRCZRY2Cf63BNN0009p1qYq
	7mINW4ige/RjzNYmX1fT3yuu90VuaZvWFJNq1qkegSVNeB+OXZ0f
X-Received: by 2002:a05:6000:2087:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-4a63e223fb6mr42941f8f.50.1794934983703;
        Tue, 17 Nov 2026 09:03:03 -0800 (PST)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm29339432f8f.22.2026.11.17.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:03:03 -0800 (PST)
From: Timo Joannin <timo.joannin@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	orgads@gmail.com,
	timo.joannin@gmail.com
Subject: Re: [PATCH] mips: cavium-octeon: fix missing prototypes
Date: Tue, 17 Nov 2026 18:02:57 +0100
Message-ID: <20261117170257.576913-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avx9enOXbOGmpirP@alpha.franken.de>
References: <avx9enOXbOGmpirP@alpha.franken.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks for letting me know. All the warnings are resolved,
no v2 needed.

Thanks,
Timo Joannin
