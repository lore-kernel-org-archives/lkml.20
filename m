Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595039;
	b=dxVsOS6T6uZ//TM+ctD2WsEKQzWpmH1CtmUoTvLgulpwFNqYhen27xE3ov4DB+p/8rnA
	 9Nb8DScfmijROko8uU5fux/T+P45MLWqLiLRTfAhdLUoEC4a7Rf+0qFXzhdU8Xh9Yc5kZ
	 QrWp/NPRVNW2xt4+H8Q0LwDjmk3K7PgsNrkIKqJyAOpu/Zw6ympcIA+4Jr4elY8xA+9pP
	 PNje8h6MaGjGaDfoBpH1k2DHGIml5lA9qYukwXjsJJW3Y0soK//0kBU9XbLDIx1j+kUda
	 68dI2TWyJXVUuSNKBAPKvK6/rXNyrBRXLWFMuyZQI+EGl8b+pZ5P9n51J5c/Xk6ehuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rd4JFQ0YCE+t/QQS88S0VXAF6TZs6Kazifp1MOzHMIo=;
	b=2NQ1W46F0C2/5WaV8SzTv2tRs29kGXjkKEX1Ue07UJ8KzSgHZGyYp7oXVeBexoDeceGW
	 hTB5RYcqBJkC4ZtWyOMx+/JkblGvIiTvUe2tcUvV/4zyokRpRbic+kOCBX7lFIbRkmbzH
	 8cjvnwZjhJe1ruIneLPCfp3ugT07OzuOgGJXSyWi5sNqNXsPbHgOEmu9VK5nXhDSbJJBl
	 JF47MXfpTB5q0ZsMQqt4oZbglJ6h+vBEH7bXDh3l4JK7RD5YD58olN1L0w/0IGMqZLPHm
	 QB3RFwB5AkF4Qeex9H0qj4uqdvB0YDzurLQKrgcfL+A6cU3l2KQEotNzMvnTOmxHg4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ceW7qv/w";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54961606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54961606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ceW7qv/w
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7743015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595038; x=1793199838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd4JFQ0YCE+t/QQS88S0VXAF6TZs6Kazifp1MOzHMIo=;
        b=ceW7qv/wm5lINFPZwKS23RgUSJatTRZLfwSymrJNX+o/skOudp52if3hzIJ2PKow3H
         xWwsSzW4gnzGCg4HeBdu1dAFmSvrOOEYK6kzX7A9Y34oj0OctquFhMXzAZmPs37tDI8t
         Y2TfcVqIY0WwtKjG4cLStywFP5GSfbX6dj8kk7KQtBCqqrd2Q0JnS/l5962/mhBG5dhh
         Apo08daRYHZZDZwkJFuO1N7IUN/txXv/9YcfuS56MUOl4XVK7/GsbmrlpfmPpklIVJ9C
         FbObeNd6nleEQyKmBaSCk/MYDa1o7n7O9l7PExE1f1T5+i4tTwJtBU3uUgr5bUSq3fiU
         nAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595038; x=1793199838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rd4JFQ0YCE+t/QQS88S0VXAF6TZs6Kazifp1MOzHMIo=;
        b=RenbVelUDsZPy0aXi1IPHIgkNs3a16Hv1GufHh8qLycSJjksXuT6dQMvptb4wvXFA/
         g2t+qTJG9djSl1XlNLiLUe8pfle3uIoqB0o5YmHc1DBfiQGrrcc3P/GtxWg5OfgCpLQW
         rBv05WmyJLdk1nFVAGhYJbLcLxEMKgRSNxEzECJwsxrW2uucyK5QGjSe8VcW1xBpWtD/
         90bjHE/l0aXTG76Er+c1RoUFxYQPJn3pxpMSXt/Q4K/p4EWO76afiRILLT+fnE+UNkDh
         IRxbycZSduk7OS5NB2Ug8olup68QYoUaUQs3K2190NfJ27Nvyb61NYimTax/xR/yl1IZ
         d5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwjcl6SO3o0xR4PZXHL2q7WXHwi0eQs0iPfQKlTBwequSwrDqsfNuPH8KvCZgcnV1rRerg1CD6b30nDwzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7pT2EDlRhVB4cy3uwjy38uaVd8P4wVjMMzi60NxbZat/dnLSA
	ld8v4J1RM4F+JRqmnLe+DA7NynkSdAPPRHWhcNn1yLBv2eEQkg76T5+v
X-Gm-Gg: AYBFou1TJutE4Dbn2r/CV805BHvQ+Y1GGf2aZKlUUAaAQHt7Hpt2iDWxXGa+gNOtI+Q
	RK5PKifozSfvFnEY5VtEff+DlHyPtZ36GWIYSUfbQXPlyu1IdwXgD7Bm2I0HIErGdQ8JvC3PJjI
	DKkWwNO+zSRClE6eOhX4u84RNZoxZ0MsUelgThY19R5R2Q7F1r/WiSwqyN9A4773nd0+YYg5xh1
	XYgfLihLKmtWOALS6ZNjcjzrX8jqRzmXNl0stlCrHlCzC2MahOUwENUggnM0YdCIQYVidHHAqWv
	+ox98wdlhvoBac9RlZsJE+OuNNlCjCzJZ06P/TlHFcbH2J6L7/lN3FPl7OStq3oN2QAClWuUsO8
	+5hlNMOSEQOSrlcFAurM3BvwhKUFTs4s1N5Q7TlBWwas9waIfDJMjpZ72uwRUr21tJy8s7Ny/pZ
	EFU+sHd9iKbd3j32O/1MfjvAotzO5Vnd94QuYxyqyPs7g+414x/rAGlSAE2mIWTgSYwBxcHhrdg
	xLFpQHp+zlEDQpOSoqqi2VBk7xVLMsusioSLR4qsHtZDOQsTlV5gutMnNJhrYl2Ddg9VA51t2+g
	crfsRGLvxRzR0EOH4JG0zIixDBGL6UD4/GA2gQPFfOvoN4GFCX237hgVooOdSDI9FxTFeczZfZK
	ikw==
X-Received: by 2002:a05:600c:354c:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4a201334606mr32287635e9.24.1792595037572;
        Wed, 21 Oct 2026 08:03:57 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d569d4sm165086435e9.10.2026.10.21.08.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:03:55 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: pci: wake the TX queues after restart_hw and interface up
Date: Wed, 21 Oct 2026 18:03:27 +0300
Message-ID: <20261021150327.2519860-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <d62975cc45c5b17a85f1e5cb7f9c1e326f27ffa5@linux.dev>
References: <d62975cc45c5b17a85f1e5cb7f9c1e326f27ffa5@linux.dev>
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

> The gated wake still releases that stop when a ring was left stopped.

Right, and the message should not have rested the gate on that case.

The gate is there for the common case: a start that stopped nothing
does not touch mac80211's stop reason at all, and that is every start
except one that follows a ring-full stop. After such a stop the
completion loop that would clear it cannot run - it needs a descriptor
and rtw_pci_dma_release() has already freed them - so on that path the
wake is what gets TX back.

Your case is the overlap of the two, and as you say nothing transmits
in idle. I will word it that way, and keep the v2 note that the wake
cannot be narrowed to the queue the ring-full path stopped.
