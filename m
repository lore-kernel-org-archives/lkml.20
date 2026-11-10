Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277572;
	b=VRVT03S97a26KbfXr3/hX+lIgUBF8pCYKGUeRSuuEV0NrY6FSLQve1JoXxQ2HNUpiBu7
	 1rwpvZvYzdFB+AqI0v7eZ1PDMcVM52o2Ty7fHI+TrRhIIOrdAyW4N9mD4ch5I7PIEB+bH
	 2nyBoYNQuBX3rYQaavUF5fqW7zfWMkFm1ae6OBXsuVv6Az1piK6BtMHplUon9a57sau2m
	 iRWeA1uOcsu70SG2/MyZ7b0wLIVBG+itA5AiQDXHr2obhHBlPGyIl0BKuX1EXe/8FR1a9
	 4PTXbTKeZcJFVvohwpg/eLFXDcOeFpWnNkp87yuDMrsk4Dxjhagj8rDd//WQ6XHHpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nMXozHSfJxf2AvAMtoshFLuIIIU01l+UNOII+lpoa8A=;
	b=XEMzcxpq3Fh9wgDgZVDj9E3hL85Y6e0wYzQqnqf77klaU4JWq0ADnWMUqZzChUzpBtYo
	 ugDnOaJUSYUTFsXSRZh0OYuFxCpmXe3T59yxe5kUNmjpFy8jnKXIy998ujC5wfki3ExhI
	 m5dW7+j4Vl3xyneeAHZP4cEmFcC4MDTHShIZmNrGjsh0okposl4nMgL9B23ElcdIbeMVo
	 z/h6jpw3MpVP0rn/P5cUqBJnaawBuIL2qfxlaBQU6exR0fwaVbPe+baqvsG99+LhfTrSZ
	 B/uCRkozcnWhfnNx/rsCWnSamX5XaSTwjgC+MdawGWzQAfyNELshaZFWsKThqqD0WeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX2fVbNe;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AAF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX2fVbNe
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2355313c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277571; x=1794882371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMXozHSfJxf2AvAMtoshFLuIIIU01l+UNOII+lpoa8A=;
        b=FX2fVbNeoet9tNqnAuC9GEH/7TT9G7rqH8VlPFwlBju9rj/G/2HAvWODd8cPiGy44L
         FAZHHgZnjBA1pLMi2MiD7vHLbzjf95YB0LR2q3VAp1R7/RV37wZkcIBexM+qO+OT0U/r
         RLw5PEnxaEnZ8ZU3mo2CniUlNQsDBNnKoYCyxR85/LNIxslu+yQGuwvFnaKLIQ75fG1U
         AK/IXhHrvDMQfZFbj5iqf/9+oPOnWekp0Cjy3LvY0lH1eZyB36/3AKI/8rPpaqZY3SIO
         omjKeBfgiPKhvBcZS11FEH/0ej1rGMS6BM4QSaU/lAzkYzpLxdkUskMp+21iCtebfe/6
         9rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277571; x=1794882371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMXozHSfJxf2AvAMtoshFLuIIIU01l+UNOII+lpoa8A=;
        b=0hQS9L2Comn/jDbkeR3+K6B7V6seumno4OImpuHjqEmp9yoSiqB9nFOAOdCnd+4pHp
         yNPhrRN4IaPovxGLvbzS6N/R1HKTvutLgg6zg3NZ6pbhqKqu/9Jisb8DksyxuB3ejZ8l
         yn5eE+Wq05RYvkbZpzaiyksBJc2DMlTMKQisek6CtEBkf0Sc9B5P3zXw0h4ZvvB9TAVg
         9scfQzh4zuDeKzGR6lj/9zx2x5Qf3USTQoljlKX1oEMA88YyZzFp9v63P70VlAd2LW/F
         rbmwghPhO/Viiz41dlBUww7bkVRf3vbTJzPKTmGhgciz0pY1NUVDAYvzVCQ1kOUTG4hP
         hrzQ==
X-Forwarded-Encrypted: i=1; AL+hErHMyD5CvqbCheTwHizC3eimyP+cD8aE7hr9SbNywXBOCLGnhdkfp7+1gJlTuT/ZG/rD+Liv87M3OyabhRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z98ETIuxkmVtnxxvF4JezL7v/dhXe/mSjfLv1gX+1tMZ+JJw+jF
	2Z38bgScN4tVj0vhuvGQS8z3TQnwaqtZftV4n/fmvfstaWqflLOwPhGL7yevVw==
X-Gm-Gg: AYBFou1KmpYTTs4Q1hhIDvAEzCBMDo2hdyhtSBNokeO05I1i2bS7LyeabedtcUJTxeo
	avfkHEyETo3zu1+cIX49Hz8eja/A+YH34EhmaFpf39azAW/+0FnYhbL5I9EE8Yt29IeV2bD4cmt
	Rawg5KEQHyikw9pf3Lplmm3W+mCOAN8g6NW6H82Lo00KonQpbe4opsRmKceIuby3w9W1b0poMR/
	ouiL+mUW1V1IKMoR51kSNtG7VV8n+dAbPrl8LNjSZ5QDZKt9PXl6lnocP29hnTqn+4KF7CNojHw
	GPMkIQtnmIF4ucA0Jus9uKAQW6NTHpwxaaX9LPBdeMcLZUci9DXyy0BJc5RV4Z3uPoQQpufh2ao
	QoIyNRun8V9v6kLO3a2AT83leo4H+LaH831a8h15dUCN1N6WErUPGJzNdI7mkoSKxtoYtzY08ZI
	56p5xCgfeD6tuR3989kQzu9ztvp6WoauUh5t07Z8u8Gk0js1IhCifcJ6HSJc+8eN5vbTWkRGh+Q
	fSiHV/HffLfQG5uzAzyihRA6wCja4wgeSfi63pe/4nTE6piUiKc7eJ88yWLnLzek71m80Kv8NfD
	f1eJmSsY6ms8wOJS613L0NyOxXGlGhHnWUh3E2HETeIDIMq5WrFYiU9B+rbK0UjXltq9bA==
X-Received: by 2002:a05:7022:220a:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1b3b603ef0dmr2264248c88.36.1794277571093;
        Mon, 09 Nov 2026 18:26:11 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:856b:460b:b522:14ec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm2486079c88.13.2026.11.09.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:26:08 -0800 (PST)
Date: Mon, 9 Nov 2026 18:26:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ivanverbovoy@gmail.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Roy Im <roy.im.opensource@diasemi.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: da7280 - do not advertise FF_GAIN
Message-ID: <avKAtJ8VJ7mL2gP4@google.com>
References: <20261109-da7280-fixes-v1-1-09cc3650261c@gmail.com>
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
In-Reply-To: <20261109-da7280-fixes-v1-1-09cc3650261c@gmail.com>

On Mon, Nov 09, 2026 at 07:15:55PM +0200, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> The driver sets FF_GAIN in the device's force feedback capabilities but
> provides no set_gain() callback. input_ff_event() checks the capability
> bit, not the callback, before calling ff->set_gain(), so an EV_FF/FF_GAIN
> event written to the event node by any process with write access to it
> calls through a NULL pointer.
> 
> The driver has no global gain to set: a constant effect carries its own
> level, and a periodic effect plays a pattern from the device's waveform
> memory. Drop FF_GAIN from the capabilities, so that input_ff_event()
> ignores such an event.
> 
> Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>

Applied, thank you.

-- 
Dmitry
