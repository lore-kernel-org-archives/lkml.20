Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574833;
	b=o6iQB3gndcA3pbYsCi4QMeJ6EdoqZ8higu333nmcWcRh0kO4PZk76TytMUn3II7pfWne
	 wU5Yhe6QBEBH0gLc6RDWS/rikFKnnZXdcakK8t6vXNyn1OzbyTdIhUWibNPXnoAqQexv6
	 SQKqCyVP2G9Mv2AMe4k5o1iuou+9633kHbAJ2H86C2x0trfdwAR3AQxqM1C29TfLnzgxI
	 EZa4yy8hAm9K1QwSc+0LF5yIRi6D1pH37JVNxKDeaGB0xx9PwZ/rPTsiKP0PDWG8ekZAg
	 zVuiznoNypvsY9SCBx3ka0pOkcl9wdkl4pG4zUeOf4tdGUFlZnLw7bT6pqztLDmExPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
	b=MtR8x0aYmMuJhr/fE9IgoYnQWms//uZrTddCcmY2vaIFxr5jWmVj3PWVLTJqOanvHNez
	 9yyxDKR1KtAohdOO2A7gepXPjU4TFIdHwxM/1RW+W9hwNXf4UjVTT299Y1jRZZC6iBiAj
	 j5UmfdPsBk1dIcxxshXUke21Okc5/C6a2Wtr4nvGZxTcIyTXqPZpoRl2i9D1qHBNn0Y95
	 yhj4LRZuGNdV0LD2/4MFYiPgJbMdSUUtn2pFKloIJvoU28ibyb5hpW2+Tj7YPd0acvgAp
	 nDJfvddWM3pWuQhSorjBYWqnn+nJatgGTGNBGtFVCpzXt+Fzxj+9TAsvyFBTCvOWo8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MIJrvosy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MIJrvosy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so2833635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574831; x=1793179631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
        b=MIJrvosyhchoySA6M2ALuD2hK2i7sP5TXboHiwjpDDDnGVkv8xuog2A30lshVg1tY5
         o64M3aBqnP9h8QfrR+V2mbwqpld/OzqnxelyWx7m5BqaVd1GMG/vWjeHbJO/HsAJguQp
         4uaQZz13+TpRFNm70wAukTI7xNn2ieLfPJtaqrAv99DOsLWIDmud38yU+fczSnZw2G/Q
         7upiFYKPYutM7qQO/kBDezbI4Rha80n3nViPTvlWRJz3vykLrq+wEK3+rMvmm96/K80A
         ZimIIpqyqRA6z1HUiLd3+GlRNkLrLSm7/C6gEYBCl6LPKBqMuQL+ckk/yIRVBDD4NruJ
         FiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574831; x=1793179631;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XQkh9lf7wElzJVQsyWKbD5l2m4uqHSi/59IR73vHTg=;
        b=OQRiH/9eNpx0Ht9H4BiMVxkh8xY12mv0tNehuyez0/shzJJsR80gLKkGbnp8b4yS4t
         HDfTtdWSWDwRWCrAUEYGJCAGwm8fMzmSttDAgINU1v4ESTLxIIdP+OhGRot7yl3dblPd
         Is3kJzIa7u9VP9HXo/4GTkUH4uodK2u1hEHmPAmSl25BylZsPe8RGlyeBXxlJgsUbmnU
         PEYfKAQ3Yhh1TKLqquFM3IW54CW6mDsy4AkOhc0BKzELr6czegbtlCxc5LdVoSjd1uy5
         2Mzd5fnFCyRmpQwVYyZ5Z9aLmT1gYAiuq3XowrRFs8Ch0DrlzS5hWRg9M6tSDr3lG6X7
         LEMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwes+PJEdkPAUzZvhlFb3alAn6zsxD8su/B28HB+Jte3MWFoz2TepkCXsdCcB2L7Q2jYrXsaM4PfLeCreY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL1gdpukEPhwy7ItB7fhBrNx/o/71OFR1I5vJnXn3zxwGdag3d
	QlYuKovAy1k3tq8LV7eUnAylFOKP/tc3WkfkEmHxq4Iuom3pYeDGNrv2
X-Gm-Gg: AYBFou0Fi/cNjUjccZzwihi1JNjbwSASNxVF2LlcZdubjrKs9lW04eQMjwOKssqZrYh
	F5BWZHZQMMmhAuHNTs6CzV6zkEzJ71nLvkXGEUHgh8q7ZX0xS8aHUqOSCEpaqJA9N+g6ShnIpuf
	Cxsq+SOKlF73KHrfMZvFZM1qWGhrz+2A4bAiFrH2VFdxWPXHxXtaAPwYREPESkKNORq9vT0MzTQ
	F3PtsZhdGyvYLI47SwIE4RkP7iOgxRfVegZV16ThdSYXTblpeiAoRs3vDcAmfTgjvECDtFDnVkN
	0F3MqEcqsmmGykPSmoLYWG+ee5ZH9AVLQHq7N48Hh0sRrNWWssa3UcZNwY99G+0UjJW0PwbA276
	Hw7Nut+tLMMblV/4sAh3a+ihAI+j8YKVQCPXakvup7IEhH26Q2FdLTzS51cSB8KNOLcEj9wnehl
	hR0UeHwA3nGrDzJ9pEbVd2Fmn0uzomhy0MiAsOQ4LJ+cGmRLumBvrP2BJ8IEJOATOILFpZ+Hz09
	a9GpqCfwR2ClueXfiuvp+s9gKTVZMINy5pAo0HjF9yjXHfBrrwbMWCi6Ifhyfq4g+w=
X-Received: by 2002:a05:600c:34c4:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1fdd37971mr30903995e9.19.1792574830916;
        Wed, 21 Oct 2026 02:27:10 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm129038025e9.3.2026.10.21.02.27.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Oct 2026 02:27:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:27:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261021112705.19fd90b8.michal.pecio@gmail.com>
In-Reply-To: <5510281a5d91bbd435d9920431a3fa75@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
	<20261002161828.365ff859.michal.pecio@gmail.com>
	<55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
	<20261006125546.10471489.michal.pecio@gmail.com>
	<64515dfd9a6cd8c3f5665e72a6bf6b81@linux.ibm.com>
	<20261015103307.3ba25345.michal.pecio@gmail.com>
	<5510281a5d91bbd435d9920431a3fa75@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 15:40:24 -0500, Wen Xiong wrote:
> Above patch is similar like my V1 patch.
> It works fine and all usb devices are showed up after executing a kexec.

Thanks for testing. The big difference is that my patch does nothing
if the preceding xhci_halt() completes successfully. So if it helps,
this tells us that xhci_halt() fails and the chip most likely locks up
right there, during xhci_shutdown().

It probably fails due to some devices that are connected and haven't 
been shut down normally; I suspect that nothing bad would happen if
you disconnect all devices or unbind xhci_hcd before kexec, but we
still need to cope with surprise shutdown somehow.

In such case your suggestion to PCI reset may be the simplest way out.
It seems we could either call it always on TI chips, or automatically
as a fallback when xhci_shutdown() fails to halt the xHC.

Mathias, any preferences?

The latter is perhaps a bit cleaner and more generally useful, though
I must say that I tested rebooting with a bunch of devices connected
to a few different HCs and all of them passed through xhci_shutdown()
successfully, so the issue isn't widespread. I don't have TUSB7340.

Regards,
Michal
