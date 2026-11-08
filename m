Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137813;
	b=ww8bgXcJhstbUsePHUIbu6pbNo7+PQNTtxqeBUqMFNknfjvvrDDJO3ZLibm6JgSGqv9K
	 60Y7zem52PYFaitw9XNdHRXZB7TnbJUlTql12/cYRWHZrGjI52YdVM+j7uNOByTmXBP2M
	 R1XQrEGA9nHzB4OCut4h7/rr28+onCIy3kCNdAsvQT44HIN76sgAendyRaUPyy/Ds16Al
	 JnJLX1U6Aqjf8zQR/Gs0flcyyl3f8atiie2DdcynyKalTT/J3h16nfx/EnOCcdcMXAi8f
	 Nx40zk/DvE7LKrbKiXC9F1KYuNxxUL+r7Sjz8geB2SMMazVoxF6obKP5dW8hqjqmcXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
	b=UixTeHvz/SYZG+mwNY+SOdunuy8tp09b4P9zQDtQZNh4PwZvVWm98Gho/P0muRtmK00B
	 cXQdaDxfyC34g/nqEMUyrZDKXhvGYmEYkm2fyUQuclReVgd7WNu8N3YlCYTFA1D1c94wZ
	 UDKc0YZoY9tkCv0PHpke+jMyM0JRCAqfxJcUTzXeCbDHZq48t/6WVNvy1JtZg0FAKTCGx
	 8YanBB5tk8iYbOcxzWrnWnVefm7bhMSY6mu7St65BmzBoSKsCLxdppjDBXRTiLH3X8hW5
	 TlA5vmPPAJuK25iu115hOkcTxlk/8Oe2HDuPAQrN+NA2pmtPxwI7fDE+zv5hg4yNWOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wT4DmX5v;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E6606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wT4DmX5v
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so95493c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794137812; x=1794742612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
        b=wT4DmX5v6g8ragyrVs1tQyMVQDrbpf0i7mYsKboBOonG44h2jWSwrxD7GEq28ZEule
         MyIxx1fCdjfa7TqdL2hpGKaLD/wO+8ySVlJdGEYKOc15mno4KK1ZApthumeHomLbD68B
         3H+4VqtFRT0t+ilLrJ4p8bibw7zXl6YUnNc2Ihv2N6NVNcv8ufuNL+4EQjIRDhIUN3e+
         JzVi05y1HBp6c3y0ds7yyPhI51PqPMXrYiooQ69WpldDLyrAf69/rW0FPtGUGQQzTRdn
         aaUuNE8g61FFZWe+zE6lSGI+Zf2iFOIrpnXGPNjmzucC7PkAjPC4OOkK8ko4/fW1hlOp
         GZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137812; x=1794742612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
        b=ic3DeskvKjrAd2okZeoiCEkxj2B43HdXFs6qGp33tN2EEpWwO3wI1vNfsw3qTviBDO
         Z5FpjWxIyRrVB1JWRmEfAxwEpOI+NTYEA9wVINzp7IP65c42uy4rIFR4CgEUnohRpaxY
         Dj9TQR7IkftPoNpiAV4K46+cLQXdQIkaFo7XpgNrwM6INjSKpyvfGc5/s74TOCZbqDJW
         K3JH9QmruO4Vkh4XaRRgfiVGj5+FNU822ib8JMrVkNDcctFfkwZAmIdHrBDjDrjKsfaD
         uymOoIvUTsC3KTZxAlGlxphXZXIybDuKKGLA9GBXRiHi/8hMbQaG161hRXdsIn738HBA
         hJWQ==
X-Forwarded-Encrypted: i=1; AL+hErEaJFsbl05cxRKYgAZdUdaAAQA8emaFZ0AIlP/cpAchaEUfDzpC/8vkXHiM6/wTHoIQzYTWk6KXjc6O79o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5bBB/DjTdAGmTCnun3fPLmh1UqKB2GTaK7fi6GyhRo+hDQvjR
	yigehekFNY2zhq+MTAQcWMYFggeSXeydltRoosDSth7PAGFOQQT9t0Qi
X-Gm-Gg: AYBFou3aH+JtHKdSagMkWMEmlWg4C5OHl4wbJo+azdtgo60THaFVZa5gRJm0PNDNLCD
	ODOmIGqJlC6rIDDLKFXDkvr4ulenE3WrOPknLgVGyqmqtZU2p4P+nHt1QyaJqTIgZJaK6ZnDWn9
	XaelOmqLYo4kwM7NKuRzHENbxQNmY18ApBVWX83phibhwxOSJRLPL4YmtiZIYpeQcPmGV6D6Ibl
	RBg+AlNqBMmbA/EZpikL5PE3pcr3LBIu/8MvrksmNH0FCU1pzOff7vhPKaeMKyYXVR6q679eWB0
	6FP0tiXL/eaTW88dUdvMPR6iTMDVOYD0Oyos3C+xuZj2/hdJoTxfSPf0B3K2qrchJF+spGBki3f
	RfxYZukzqcKzrowvPZyb+Pk5Z2xd04Zu86Qk5OyTTgygUvsl/uZxdzfCHV/XfGlbQ3WII0M8jnl
	6d8b20VqTTKQQ2DB9DgoUCCqSpFxh2uxIY4P9bHdIFiB2XhSzuABBAazj9GwgNl/6wU2ohoI+qo
	cuB6U2V/KybaFDG0LMWCuGzwcGKEEbu6/RbND57/RJtdVViXsjNK8xALJC2q5de1arx4YYBxwLc
	Cmp+4IkceX4HCWzeeENJQAfLEpd8NoeI0UrATRZOuSkcZ1iceig6tOwHDgTp9IFk2MfHyCqIeOp
	b/+FkKdmbGRsHuLdh9qbN7s7iZWIWeX2REX0eqd+p
X-Received: by 2002:a05:7022:4591:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b39fe8150emr2783771c88.16.1794137812026;
        Sun, 08 Nov 2026 03:36:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm4687161c88.15.2026.11.08.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:36:51 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sun,  8 Nov 2026 20:36:45 +0900
Message-ID: <20261108113645.1730429-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <878q33y4z4.wl-tiwai@suse.de>
References: <20261107111056.667-1-alyandra5b@gmail.com> <87pkwgyck9.wl-tiwai@suse.de> <20261107142950.125901-1-sammiee5311@gmail.com> <CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com> <878q33y4z4.wl-tiwai@suse.de>
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

Hello Takashi and Alyandra,

Sure. I'll put Alyandra's patches first and mine on top, without the
KUnit part.

For tests, I have a sequencer test that I used for these changes, and
I can turn it into a selftest as a separate patch, with Alyandra's
KUnit cases added.

Alyandra, would that be okay with you?

Best regards,
HyeongJun An
