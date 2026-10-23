Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714360;
	b=J7q6tan6ywuIpR8hY+aZFm1ahmkz/2nw3JBLTFslbqoRbqhHiZDJSwFffPOk3mtGADmM
	 zLef8Qyz0iPeZO75zqtZsqT+EYzVio1WKvUQDDeMp9tUXXfu7I/ibDDB5lS1a4x6OcGwH
	 eQrl/tj/qlqPDLSA+iy//cIy/I61nNgbrs+kqFnzKHOvghK3DJ10UblWj8bBFcVmC6Oxy
	 SDqdGTpRxf0EV4uhib4JjpIPU3ApdUYYdEzInuKgxXpe12E27bWiouo6D1h7uVdfsd66m
	 InQY1f4mt//eyb6r+GlLOqqWoPzSiP/0yKLpapT+6gOKeIpTy7AaUeIwaj4cQZXlTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:In-Reply-To:
	 References:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type;
	bh=o7AUohbGGUYWehwvXPNQa29TKzcuBRBjfzuu7lokhsc=;
	b=KUaQdK+7ixULvhg9OxllMDgaqU9PJ5XSfZRvFBB9/ocW1Y3PJe5Eaii+xGyl7B0n+Iot
	 +kYw+4gCX3nJPzJ/emADivXN9AS+v6LhMZqjEh6AFZdkaw7ExSpCkm0ht/273fCTvEuDf
	 9pqFYo8YeVaI0G0MUv/XSv+WocfVAO1g0ztMAau8OW8Y/cGubAcTLUCSzCzFVS+8WQEBv
	 5XMGEE/8+Xu3eZd7u+JYVl3jyHIXCNOL6va2CEiIw3TEM5cmN8w2AXTp9hGhEyF5/zYKZ
	 37lLkTXvnmGD/5D7iZzlzpLPMFTf2DiDf58klpUyuV1ZUrvqFk6UywxY7wkkDM972nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=accountshq.co;
	spf=pass smtp.mailfrom=accountshq.co;
	dkim=pass header.d=accountshq.co header.i=@accountshq.co header.a=rsa-sha256 header.s=google header.b=kRPNVSak;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A68606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A68606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=accountshq.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accountshq.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=accountshq.co header.i=@accountshq.co header.a=rsa-sha256 header.s=google header.b=kRPNVSak
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so471328c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=accountshq.co; s=google; t=1792714359; x=1793319159; darn=vger.kernel.org;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7AUohbGGUYWehwvXPNQa29TKzcuBRBjfzuu7lokhsc=;
        b=kRPNVSakfPFjUAevnWOhm2l0uE4QpbUF7GAyp4c4ZkgmQqdxNn8TestRe5ewtE86EL
         Cw0CbmJuXkSMEUH6WgY1pS/KjL7rO9F8LGLxWpCqItsz9OZ7IOJrIWF8yUltr31Exm3+
         pnMl1I5lPCAwPimeLfw4RgSl2b5aqdnYrooGVIBHcRDof+f/9t1TCngBbbIreraMJEC7
         JB8kqSUPPLGUqUKSZMScqwcRjzxRCYgJrClYMN6+43/K+VN4dUEJAIB8h9lVfcpENEUw
         eRlLxcyMUwOYJ2/W8xCevVJjmlHYM2eKLFLi9fJ4GXOP+8GD3j/rHK2W1B+IFb+QTSK5
         SOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714359; x=1793319159;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7AUohbGGUYWehwvXPNQa29TKzcuBRBjfzuu7lokhsc=;
        b=iVCKvChHTHmqqIE9HtMrSisNR6UDCDxHjsCHIxGZBrMiPufpjSUl7aJAeze40qVc2d
         f7TFuI0xZIWW4wiHDiJWes/Ja8SRL074MJZPndvbdmRkjK4hpSPyqm7ZhZwL7ImjQNOa
         LY554GcOdTTO5UYvlGEobRdmimGL1UXySFmer3HamhVi07TlFlLi83rcQDNqj4Nut5DK
         /nOamPxSNhCcJnKUblpGSV0CrbJZH3lL2HyibwL0whoLxwSAIFo/X1yJq6kOwfXYw2Lm
         v0AjvW4EVhmvur3ArC9o+MFcCtzJLtH80itSlWgzMTGYWPJ0zmzunANMM4rw2zhSbZ4m
         xEcA==
X-Gm-Message-State: AFq9FYLP6hT7gNH89L0H7bLtezKrDizWj8kECMue0Ry8Mov1hWUgcWh6
	TAa5cxhvoA3o1rvFVidP3qoErhTrZ3annQUO/n64iisBJJFmYfuvz91cMPKc9PncEx0M2yHT23E
	L0ZTInw==
X-Gm-Gg: AYBFou0YQ3tHl74noy4ah2s7AOA8hbty5LMLt8M4BLC94UHWs29kCwEKaQyTKghI7nr
	reKYSWuzXCQ738LRCsupwqBQe59r6ipCK17w2Q/iZ2dxPdxqCDkOz86fIZjETHFYXTcmxa1MGQd
	J4FtFx9W2g0ezuKLjhGyWko8xaVbswzGiReKXaCX3eTh5K6rQ8i3yNT9e1ICozhfTgPvTIajKAV
	lfXlh3UF9UUJFOpaLs+kdOV9/JJuKPgAAYpbmSBk9GR9eT/otVzHsK+2gATbwb6oUZrR4Nf/Rtq
	/DTqgZlPaeXdVgfOrT0QJxSMGCsoI5eS8pzUzYa5yl+xdR8NSw/tejcsWRT/abKQjAzss7mInqZ
	K0ENyYaFzao/izGcQmZi0CeyEOJZJM1xN4Subfst1Hs0MqzGaWSBCFm3pNOf5ajg4u3BP803og+
	aa+t+ExJ8pGsqPGpJGEEcw/rVx0kmlS9MPRnXy4tWGaevzwwh1fBbh410jwOlAKKGRx869H8TQG
	1u1kFhVlDA9/gBi2nDan6ZNPwGVOeW5T1pDdYZvX+eBQAOIzechjbyVV4jxUo6qcAsv/Iiw38fZ
	bX/YGQuvJaCwU1CZbQG91NQbm8JMdI95G0gWEEv8VeBcBZA=
X-Received: by 2002:a05:7022:1183:b0:18c:640f:7f48 with SMTP id a92af1059eb24-195c7c753d6mr832262c88.44.1792714358563;
        Thu, 22 Oct 2026 17:12:38 -0700 (PDT)
Received: from accountshq.co (ec2-13-208-223-1.ap-northeast-3.compute.amazonaws.com. [13.208.223.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d89b1fsm1353746eec.11.2026.10.22.17.12.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:12:37 -0700 (PDT)
From: Noah Simmons <noah@accountshq.co>
To: linux-kernel@vger.kernel.org
In-Reply-To: <4f11a7f0-5e8b-413a-b3fb-c90e9de64361@accountshq.co>
References: <4f11a7f0-5e8b-413a-b3fb-c90e9de64361@accountshq.co>
Subject: RE: Content Collaboration with somoslibres.org
Message-ID: <64ad1a86-2aa6-4ffa-bf79-ba42d7798e4f@accountshq.co>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 00:12:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

Hello again,

I know you are very busy these days.

But, I would be so glad if you can take a quick look at my last mail.

Thank you for your interest in advance.

On Wed, Oct 21, 2026 at 10:53 AM =
UTC Noah Simmons <noah@accountshq.co> wrote:

> Hello somoslibres.org Team,
>=20
>=20
> I hope everything is going well.
>=20
>=20
> I=E2=80=99m reaching out on behalf of PressWhizz=C2=AE, a digital =
marketing and SEO agency based in the US. We work with many brands that are=
 interested in publishing sponsored articles on reputable websites.
>=20
>=20
> Could you let us know if sponsored posts are available on =
somoslibres.org, and what your current pricing is?
>=20
>=20
> It would also be helpful if you could share any editorial guidelines for =
submissions. Additionally, please let us know if you allow content from =
niches such as casino, CBD, or similar industries and the pricing for those=
 categories.
>=20
>=20
> Looking forward to your reply.
>=20
>=20
> Best regards,
