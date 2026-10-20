Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792481250;
	b=nFChLzuuCLI43aS6hUQn3GDEoj64UMzxppr/H8sS9+HUY8xqremawpgDuiBaylokfJEo
	 oAFInK4KEd6j0wePq5f3ks6kqk1bMB3/BdqS0s3oUX28AJqTUsPYD6JWCmV3IMQrMQPIU
	 aGhVCzy4nUjG8P+fBOlGpkjP5z7OVnoXsecV0Ag/DSDfI6UknedE5Yle3g+sOXv7jIPbr
	 TGnCSo7Bl348BtgUGdUT0Aa7yDL6kJwx6wsprxllPybES0firPlU3YeZ3rBqylrLh4ZhI
	 BBLX8r4iTVw+ckPi6Q0oLAM8j3FErLiX0edYssmdP2qHbNTX49P1CYFnKmEbwjEy71Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
	b=O2RCtWtiTF3ST49LaMjH8xExboHg7sD5lgKQcXU+Rhsh6PEYS6iVSid7eKevZRQASO1b
	 0hld0Y1tQxLMB+258uzRWmUDEMdfp5YR9Op/zBsR/mNo01SD7Kg0tx6k/1KL0HwzXY4Z1
	 9NGhkKZsDuJYEATcfNr7r4uGFkYn7RDdpGcjEAWpm6m+v87/UI5MUhfGa7sQfFZ9kZFZt
	 6v/qj1k1iZ5Gsd9hM5Ma7tN3RLNXdcQc+BTH3JHG/3c8yln3A/u+CTpZbIZiVq5Z6ScPd
	 cmEIGuowJybIs42MycrdZpGVb5Vr/m5mGxWvXf0LnRO42imJqZMU7IUSdPhPP45SGoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn;
	arc=fail smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso5572028eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481249; cv=none;
        d=google.com; s=arc-20260327;
        b=FlC4cHOpLlhkyAbYO8Pxo13M29qSB8L/UyTPU6iv+1w+Q/dKzKFqnfPJGCMMv2BXZj
         6LXDJ6KU7BynmKbUN2tEqcXWgT5pAzrjLlzbqij5y08ha1/4WgSVrr/nv/vwf6TIbPf4
         zNgdE4rJnOyxT+AZ0gdcJQ3NAw1atTpHr5jBSrmponZrVfj5DotjzV9oI0K9vjy3gXu2
         RAGo0RplGJySdPVaXF2GBDREDNywDubhhrRx8ZpdhjiflPY2O0RyQZhM3XfHaqrRH/qe
         k+47OK9+PNnm0ou1bKhAWudbk/pCMrZqWdxRQ8rjtaFr2vhxL5US61czu3k6f0J6PwE6
         aQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        fh=zlPRan1SzQVMewlnyukOPC9uN5BRYKYQrme4TvjKfXY=;
        b=AsLLX0lTGj0UKT/8IUmFhcq6/ALG1vi6o5QIpT+jKgk7U38Cg1j7uIMg8qjZ/NZg0Y
         08OiAopNXar2FQ8ya1UwZPeKqELYaP0P9GMjL2wvF66v6MNrbL8Xbr6p/Vm1KzbySd8v
         9glxwuSNO+ZfETEKsY7TlDphjNTmvDyJdXFyX8qEYKEOf8MRSOSbGAkGUoaV3FartCv4
         dQRGh+f0a9dBr4srPPLqnsWvWa87t9h6xhsKxtn9oJqUGtVy7vJeY5aZhBjSOWbmo0cy
         sqsppS54h4xP/m+h4ICc2rn3tgljHtGoUfl/g0Gu0lVWweubt+0X0DyKJAKHO1X24ebQ
         HIog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481249; x=1793086049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=BSkiROCnNX58runhrTm481OeUe6TigS9vHK/+OpJrzISryqv6gzY1meZWXeXBK1TM5
         AC7OWBag1lIVxMOnonE9yViTuJFz8+NjIchY6oIM0Ms7rn26hIQRvp5350SzaxDi2Nr+
         AYxvqSFKAaVltVGTHYxUVSgKHGctsooVeSkzQUa0cEPLuxd6S8zkBcNqsYmZYludnRO7
         27/rpaV5jOvsgxXEYRNJPK06HDStg5yCj8K1nDSd7nR4jNMl2inCuFYB6qSlTIsDKgQX
         d4bolP76Dhzke2KFbwjisP6mXoxnu/0jLFvoOr3aGirCtZJLBN99e1IkjMwfT0FPYvyA
         qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481249; x=1793086049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=qdFWfdj81J/gkfGCHWJIrVYpX4lyxG8fDvKg5b/BAoDmAqnzVFR/m9OfEg/zQ7MWXc
         TjAlzb17VOvkMcvH1w27RUZXbCw32GNeNMosGFs3thi6VFFwRTM1eNA2Re2f2BQxutjL
         d5smGLLEF5nfIIoNL0JMTXDgkLdBHVnb3EAggOwBNQvJqc29m1OUKdMCO3107K69/sF3
         QcvYBuqhmGUJWRNXKzW0Sboc7UyXUTZGpuz++ujjkbBJNazZbyNia5GOd1eOWIdbi+Pq
         VcsczzND2aVSGHfGSGCsUhgp+uTxlJyThRClzjzEQR2R+KYik5TcOWQ48m8ppMtnjzdY
         EUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHaolGftcTrevU/qYpl60c89GdMpAQI5oQEb3O0JiHLQgrLih9qNYKSrkrk3hXJMKpufgl20ooWbKfm/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMYQWkqJH9T9mf3ynaYjq4IMjtNT4SVXpHfaknqkzlnspemiYY
	re2VXibWYJ1TueVWKtmV4WuogYZxu+xIeckKs5vXgvJ3TXZjPA8VPYoKfMNiWlHTQuXWWudUIrX
	w7xnkBn/KugFLjjZ4M21jJZ40JxWNsLY=
X-Gm-Gg: AYBFou3s/TpVy4tzW21Qdy9/E9o9t6DgaJLhn2bvD5JrzAg0AkuBtzaRfnIsjKmQQ6d
	CecAtN8Wqz1L6R1+/ZXvqv6OZEOSEsXilGd3+sQ780Ft9K0hIbNRDP7GjMPjpC28DvquUh5FHfE
	EZWgE0p6VyxbOOPHhl2fWn86FHOowPJdZTU58J27ZrfyJ75nZMP5BRCRPptFY3dbIVgJCPIzk28
	N+deRHYUfUKFjfFyoaR3oFbO8HtegtN0uDrROV/5A/HqaVwry3Y80ujI7jpFNpYITNSKcPXN38R
	juhGm5Cy9k5Ejy4Z1P2cCPoU/mnDwcdiiUNWQgc+0eBov9ofoYFZU3MTHtJHf39Jjm4p2ymY80m
	z76sNQregA5mP
X-Received: by 2002:a05:7301:140c:b0:34e:67d0:bbb4 with SMTP id
 5a478bee46e88-361a0e85fdcmr14132186eec.10.1792481248787; Tue, 20 Oct 2026
 00:27:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
In-Reply-To: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 10:27:16 +0300
X-Gm-Features: AclHuK9h-tQcbXrVM0viwwPsC9zuaQ4jRTMIV3P7VlE38_D0lFsuAg_ZHkgq7SA
Message-ID: <CAPVz0n0Oiok9vx1xmTPPpv8+iHCfL4XTE+D3jBMc1rUUHAftMg@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:5=
7 Florian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
> with the 7.0.1 postmarketOS Grate kernel.
>
> The system booted successfully. The EC identified as ASUS-EP102-DOCK,
> firmware SL101-0202. I verified keyboard key events from the EC keyboard
> and touchscreen contact and coordinate events from the tablet's maXTouch
> device.
>
> Tested-by: Florian Krischer <florian.krischer@fkr.dev>

Thank you, Florian! Your feedback is quite valuable.
