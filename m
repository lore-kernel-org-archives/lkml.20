Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386862;
	b=2op396iHfEM6Ga6YTfobKldYFqwY4Ul81yGNsQwH4Bk3Q9n0zj8pmW11aQtI8UysLaFI
	 6jScc6FIdhvNxy3xYnFZt8ikKo/LA2EE4EHXda4UMHh07C3bTI3A/X6I8NhhNBjtvfjlf
	 z7RWOToXMMjyu1+wcXQ+2oIYcmXbOv/NImTWVCWfTnpOz1ptbRJgYwVb2//fiUWllwSlj
	 nB3jdWM8+Lqy5DCR+EChOCK9Zf+3r3PV4wc6218nM0kqjjbRNv9A3URcBmMvRLVGXyfzU
	 nPI6MUglCFW7NlYsEsp8Og8Gvc5DjFaosKbeBneWj4gWwct5ye4vJg5BuxVJfqPOhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
	b=XaLAFNYry45b9i44ucuG7cFkNUY6Aw0jhDjsXh8VKl6q1rd3Hedhf30TYGYo/RZ5JTtA
	 dB2+0uIX2/KeEdlpLP4HnF4uQtoHGyWQ4gfZQ8YyyVQQRmnQg8KCx/sxxH2xEh5sc26W0
	 O6lRGlh/0ZhhXSoLy5WrJTbEWSIlLupcEb4drP8gjuJIiHyHarn0+l7plZ/QODst9mrrT
	 lZi/dqNUC5pT+5pgPwr/iCaOSNAx5hWY7xnQUIjUOaM3jXFTT0uX95In/CcQpvs2FZd2p
	 Q2fFcyTwSQxdLD982Z9FiK+XwUF8yKr8mZIMkHg7LgSdHZjswiJJ7yAFCmRqZ7kpIaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xh0HWaz/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xh0HWaz/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so3768996c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386861; x=1794991661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
        b=xh0HWaz/ph7y0s/RRIf/FyNZkht8RxojkI4nReRVOsb10WfJ/Vr2pEY156BbqiiYxc
         sI6m4WWV1UZOeQb203bYEu9vMt52AfZWHgBD8NttjrkhONqmrwKRyK8s+YOkGj4SZjK/
         iV9TszaHfTaz5z1gkUuGXJrT3sS3FwvGEzzrleE4P4BoFpwaDQ3UfHPTWs89PkBThXGi
         BE9rF14HnCxnvPU7txrVKQNR9ukWRbelB6Tau2ApwN1RcKglQyh0HqWN40VDTNzKJqZQ
         fujnO6wmG8RuvQdzcik4Y19RsO63gQhPEtG2EHz2THwzLmQN4ZfvL8JnT04HhwLeTHNj
         iu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386861; x=1794991661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
        b=iU4h2q+pA50Neh3pfIQK6dQFarELuzn7mfwVOxwIrXw/0uVHgaUJF9TxUKNUWuD7gf
         SmjEMVcYn47+YLQvX8YKXKDWhfpSWMOazYpBeyFsU8J3z8lcMm1WvnzzMNef/D5cUHIa
         ffDzWVjal64e53YO/kET0UpDz/e+GlAhLWpCQEt7KJBl+VK7Qm8UA3+IYOdMLYvSheoY
         vLSxw4CHMEu3GDSTpYvpqEe60IOKTydj093+diZrKS1gt9mAtaqWO2JITg6kBJ+nW30P
         FDBmE/9TJWTqERIBmr9NRKBFnY+A/mzHIGohhjgzCnVr91sIZhBaLhcD5XhN5BxV4kgs
         anTQ==
X-Forwarded-Encrypted: i=1; AL+hErGWVraN/ruo1lcB7u7nQfWpBZIQ8QkNYQuFkpv0Ah3tsRtoLHSNWIHLaoWNoBahw4W5Fx30PJz6HSCw1GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZiHy7862tg8zRePLaTs8FqppgO/yojRQeI+9TDnB1luhNVTuG
	5P8Hj43lK4E5wmy7z1AMOxjNmksu6+nLqIOlLZJjdfJ+egjR03znJBBl
X-Gm-Gg: AYBFou3l6V2X57oA5TZ1k5mB+4XCMvzreL/efdWVRfFosCE92D2nKde+KJJi7AnBGnU
	o8iaQamAkrV1SzJ+oDc0F62wNwErqaq2Pq+YWYWZjcc+InyHlTxJ/ZYsPZtM4gzMSbhPrS1Y0pr
	U4cMkxI6BjZJmh6oX0bhRHWI2vO0QfTtpltazvQbD+Mmpk+TsuLYaWopJ4WWoAxHdJ4gqO49vZy
	jvY5htFZntinTew2EMXM3q1PjBFmn2GPmPw2IeZrnqyCcanxlqDs4LzmT/CNo6mnF5Hi3TAXjMh
	FTCP0OBePqn8pc8mXqpL4Cb7c6bFOjGeK2LbYGjwlbGuLbb08TaZd0NEjZ7EX84iluluzFt6E/J
	Q9BEnYTa7Svvbbamg25Wm9rp/7VhwdBv8/lwsUSKfsUeuae/Zmor773+wztM7hi9AN2sVRvD6J1
	Y9XHgmNGM3MhpSt/onkhaMejvId3jgsWpArCOzfee8YglGJxHkJGN7evJPdVUU++xsVDje3HVbd
	Rd6Wc2RXMNPXTUjYrNZqlDdeCIBbqEDh2++l0la7oTWbO2IhQgMJn5iRcLXcduscbH26z/8BSQJ
	azIR3kD2HTZ2hKZAsK6ujZpnNDRwuyj1ooZURvw/Ryhpl8WbZARXQRjDXQPp2+Z6SX2c0R+tXrH
	3QE5CbRkylsd29K3tZSia16P/0DKuSaLVrBSYZU7F
X-Received: by 2002:a05:701b:4513:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b3c023deaemr1852664c88.4.1794386860845;
        Wed, 11 Nov 2026 00:47:40 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm11707400c88.13.2026.11.11.00.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:47:40 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
Date: Wed, 11 Nov 2026 17:47:34 +0900
Message-ID: <20261111084734.2592346-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87zevhugi6.wl-tiwai@suse.de>
References: <cover.1794141913.git.sammiee5311@gmail.com> <87zevhugi6.wl-tiwai@suse.de>
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

Hello Takashi,

Thanks for picking these up. I may be missing something, but I don't
see the four patches in sound.git for-next yet. Only the selftest is
there (ec925d374015), and without the fixes 11 of its 22 tests fail.

Could you take a look when you have a moment?

Thanks.

Best regards,
HyeongJun An
