Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862689;
	b=fOjmyxUsgAhPREL68zhRH32fBmvd6uRTe04vMb4i8OQPRz27XJJXDB1EapDeOAEzfSmP
	 TFKLCix8iLeDkaLjojBqNp8wV0ljv8y421WWGL2uy6v7gU7FltUbi94IzG49oM+MKWvWS
	 Rl8KIoFWsSJ1iWvxk3x/KRcbjQ27PUPxpsj/d47pmOebYWWE1SXLMTj4Wm8j2/pmPA83q
	 9LXR73Otvf7q60+FG/ePYqHZKojflIF0m4SNQdHipUQWeNRkxg1QSnuru9UKOm1dBKKvA
	 lbeO6ez6j5ffwlrGONt3mEEFZNJh6beoDHyD45TgyV9Zo5a6aRwVUVoPPb2JOXa/3tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
	b=Q8IwnssHN1vn7A61YalfvGLepM1PLis7DVCoXg4xchBKBzO028wKvrahtXq42cjsvqFs
	 fzAWZzfXJOn2e/nfusm8Lm8ljzIiEYDUEphBjcGjdL1Er/eiRI3qbapJXxENdaDepBjU8
	 x4fGvIvtd3YkSnIbxyyz2v0uGXiihVZRJu9KrNojTf5PuHNueMH494aY79jex577FDNXz
	 bbgiztrZr7UPP58C2QNJy5DqiardQ06Mt9mE8YCl8himeKlzRq9A0i1YRgymTNiJ7i5xy
	 Tdcim2MGy929v59PCCgyOcrr3aXZNFHU4amt69fqlqIPqeCT94iG2XRXv8OgqR6USXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xhfpB4p/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E81F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhfpB4p/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so184937f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862688; x=1795467488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
        b=xhfpB4p/FLz4tPvQ4XDyzPJZhYbKdby9eMFjsG4ed6t2AZa3F7CPzOfipZSOTimeWe
         BcDpq6gokbNTxIQ9l4fnGfjfFt29zj3RD0h6lHh+vJ1bX552MblcNRz+J8927R5ZmjeF
         iKpG54++B5Tp/HqvgFsBZU/VNWRkvyP+JLjtw/G/z314VyLXrSJcxdPsDrmr/1FXdlvg
         DIdw/tMELU7KsErDToyfosjf4meSG+J1RxQySHwdKjVeXk503qOmotvoqiMa9MiZS+ON
         XrDB4pfb8+ohnHUAfF24YjeIm1F8rDtjJQd8EA/+blfE98B4+XJy/aO9+RNJN9y3qjfU
         QxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862688; x=1795467488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
        b=cRUV2rYKROnW6plk70PaLRMWQqmMsEG0xusyo5YEtkdz06XgmM+h880JPCkXZbBXlk
         Ff7BHaknpylgbZFevFf0iZD+usdOicbL1IBw0yuCfccF0DPuoTLCUb8nHZ706O5hblsl
         kthLFjWI9rVO4IZ6zbRUmdvc5d0oRMOrEF+36S5WCMDeD7cU6eVTZhwuxeDVcgeEeTJU
         nRNyJ+OaWOqwxAir234mZJI3k8kVCDb4UTnCSpkck2HtKBPKNC0RLAs40wCFASTqFIg4
         sguU19dAlARKvbvkUQF///uMhAsCWHgbLfpjcXB/fuu7PwHl88BMZNmXq0aQ/K/6Oik0
         6boA==
X-Forwarded-Encrypted: i=1; AL+hErE/+j4AAebs2t0W44r7GI3DjdsKHl8JdETuilusXVtQ8JSSoGE7X1Gr+gHc2svAkpFwmeZepBddsuCzxhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zibyMKLfS9ZUQCEPMuI+K4+h/YkEKPerUppQ7ooDyzbGf5KOS
	TtJ83/7w+16UEY/UCC9GIRTv/7OuD/lIXWwAQptW8YGilIVQfCjttmV5
X-Gm-Gg: AYBFou2olZbIbd2pXHbU/D6sz6duv06dn/tdeqi3FnGHPRAdwkGsoXvE8kVC5SGeoJ7
	Mi5CryuCeFeTliPm++1lQ/k+TVmXl21QpnU3Sz2rDTltvy1/5wGtM2fRQub9mv8h+nNF15+Nl3A
	P6meHP+EjYRXVi0yJ5pDKnFa8gzGH9Sl1QC9ep4H8frIvO202vAUPJYQgEb1SpNyfj3N20IXG/g
	3E0tKs5PEiDzYeIzLyYVeKdvu/VKa/CJUbBshd4LVZCPdXTe2wNh0dT/+myMwi18sf4YIFKUVBi
	N/fA5me9hMTevrkcHT/qw8rD3XNDWJFY+XCzgHJc8OcDfY9rAYS5n2f2bc8C30IqrjS+vtLFfZY
	qCKY8jAKY8iAU57BCsbVIb4na7QAuDxdKkM2Et1HzAM5XrpwHFfuBdjiKKKXT0texz4lrm5U0HJ
	51PY2tb+SoMhOAWZfeOrKYlBg0EJslnyYaZQ82ktEFFTQAo05EKRV9yz41+NrNcb9xcsWoU6Wn9
	nPzzVuxAiqYiYZlyt4HlMkuE955MWDjl7OaUsysc9qM8d7YpCdDl27yjClAmoNeKQUX65g1m6sy
	Uo0+hW/Z5rXjGho//TSiihMAVwk=
X-Received: by 2002:a05:600c:a00d:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb693e4d5dmr149922355e9.21.1794862687584;
        Mon, 16 Nov 2026 12:58:07 -0800 (PST)
Received: from m2.. ([37.142.154.59])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm20499255e9.8.2026.11.16.12.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:58:06 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Maarten Brock <Maarten.Brock@sttls.nl>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/16] HID: ft260: uart: add modem pins control via ioctl
Date: Mon, 16 Nov 2026 22:57:50 +0200
Message-ID: <20261116205752.18800-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <GV2PR05MB119417E6491EEDE07003C52D6837C2@GV2PR05MB11941.eurprd05.prod.outlook.com>
References: <GV2PR05MB119417E6491EEDE07003C52D6837C2@GV2PR05MB11941.eurprd05.prod.outlook.com>
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

Hi Maarten,

On Mon, 16 Nov 2026 11:47:46 +0000, Maarten Brock wrote:
> > TIOCMGET and TIOCMSET work only while the modem pins are GPIOs, and
> > return -EINVAL otherwise.
>
> Without checking if it is possible at all, I am wondering why it would be an
> invalid operation to TIOCMGET the modem pin states when they are not
> GPIOs.

Thanks for catching this. There is no good reason for TIOCMGET to
fail there. The -EINVAL came from the Sashiko review of v1. In v1
both ioctls returned 0 when the pins were not GPIOs, so TIOCMGET
reported every line as inactive. v2 changed that to -EINVAL, which
fixed the wrong answer but made TIOCMGET fail.

The chip does the RTS/CTS and DTR/DSR flow control in hardware, and
no HID report gives the level of these pins while they are in UART
function. Two things I checked on hardware:

- For a pin in UART function, the GPIO report (0xB0) reads 0. With
  RTS/CTS flow control, the CTS bit stayed 0 while the peer toggled
  RTS. With DTR/DSR flow control, the DSR bit did the same.
- With flow control on and no data, the chip drives RTS (or DTR)
  active. I read this on the peer.

For v4 I am changing TIOCMGET so that it does not fail. Lines whose
pins are GPIOs are read from the chip, as now. A line in UART
function is reported as the get_mctrl() comment in serial_core.h
asks: CTS, DSR and DCD active, RI not active. RTS (or DTR) under
flow control is reported active, as measured.

TIOCMSET does not return -EINVAL any more either. It ignores RTS
while RTS/CTS flow control owns the pin, and DTR while DTR/DSR flow
control owns it, and it sets the other line. So DTR can be used
together with CRTSCTS.

Thanks,
Michael
