Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B48293458
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881435; cv=none; b=DvaHg7/xJSepormJu8eBoxA+dBmlJFDOSQfUX4gSWmqYeD2UlK7VFMlEw9S0CkJ/2fzLGZwxn9Q7PlBdpdQdtGpJdSbrbfVWWg93E32eJlB9tHybTbUHdHpt2Ne122guWa+hZR56myWVAnkRAZ025kSn5/WRnBOfniRMu5F+BTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881435; c=relaxed/simple;
	bh=GTQrB6fHqvL+6UsnsGE2F005nwTcDsoCe/TNBa4j+gM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SrRLYVMM7ICWOuqFUbpsq5CV7iqP7GxoTUv5mnBlmZxectboZ7OjT1aqzwgRUHNezb6gutaN1+Y9jN505l/NdA3EYJjPNHu+JuRNPwoC9waumy8976ATyIrBdPFwcAp1zI+ENbIifLOsXRB6kDVEN66UovZV9YbGef4lfxzWsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djH2I1YX; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djH2I1YX"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0f4efe31so566674f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881432; x=1791486232; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=djH2I1YXE0D9+SOJ1sNcUzmwLybWDm6PRB/Y+vVxkHMYiomhSWVMqwLTWrgxb9y+An
         ryLVm67r8jpGpQhvntTzhiAFwrcp9wKaOPgclWvDaaD+fQPD72AcghCjavUtlOoCbCST
         cw6thV5gEZfdsl08/95/vDnsamvmcCER8TKqnePbqJY11fE4V7fR02nZaYuOMDI3gOuV
         UD8+9aKh1mxufH8BwzmMZzeJ+k1+CDKh1rhfBGaBSWpeebmsqE9m8CE+6pM6adFYFFWd
         biyS2ajqNIg7mQgBBmcbkw8bk7ojZJbEE1TYmLENcs5AKvVV7PKahk2fAirkImoOo6PA
         2RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881432; x=1791486232;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=2bKjPiSgjxOMcsanvY8FNdOl+tJzTNe8D0pqfeKxBZny04PkkBWJ5qR23kdjjJh2JW
         P+ZvvMzhrC0ig03Y8sQF7tz/AJOlrZFOUd8+kZ8XCz+vJ5dYDezkybhoi/5cXe0qCCba
         911bh01Rz7SKdWDjKsk2wdNFPhFo+7bPfxfMcZLmiHxYW/uGx6NRMGW4sHnUDULX2+QQ
         r80i/MUw7JP+EK9bQFeuifpQO/HKun2SD4wIk7Z37Zs6Yp5DdSW7sFjNQgHfz+zLGRve
         IMxcdfdVo90Z1igX+n/ayljeAN0pY5+g4LGrjEQlQ1qsTQ6bgELUiATp8WpRyBJ7o8HT
         Dr6g==
X-Forwarded-Encrypted: i=1; AKwUvBz8Nty8/V9IsLkv4d5ZWnZ67J8EnmHEkBnzDo2B/eq/NIJD9/taHTCgC9VmdpMhS3OYlvLxpPCeKRB1r8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxFqa0nIowqgYT9oJEjAr1ahl2YBDMpXO7auF0aCo2xf299bYS
	nmsFG/b3yS4329DEm1SlFMJAhtqt4cLZBWpV0BD/272kjSZqOBy7kvEV
X-Gm-Gg: AYBFou1hyL/dSCLp3FiMi+ZNbHUIYsYhOJhHJgsELSRZN3frgwOAeiF2lATgcgsAouf
	A8zhoNA+XCN8+I+MrqV5jCY4JpZQMtsNmWMoZZ+K4YukGose1+f4BOzuqjS+YyNVrvutSbV0gS9
	8BV+hsTEgLJMcfUTLoVD5g6RPE0FrM2jmp2oz9O+VFmxQxKwxsoe63PpqQzeto5ujL+F5ejQfZW
	I5FqGvv2edST4P59z+W+KHb+OotwJvGEYcZQOTlp/MDkOHodcTDL3iYB6N413a/zOPNZfOZne6v
	6bH21WZBkYDpzOwkdz+G43ElBxlLjT63I3WIhdL29qBvFy/bYwF9tuFJdlIhapTLffYO4+LKQU4
	lnILCafI1ZcO7m7xg4rLxKgV4au64rb4N0PH9Il3/F60FL9wBz5RziyD6Ra3IOthq7qAY5aviGZ
	v78PWfMZIV7tRwZiACD6Udd8fCXmjA4LOKvVBWU2ZzUU/dkb1vyB4Fj2/VMohP15N2kOa2dGRac
	Jb00hFH/b3Geglc1CwSosLlYsxOwSH7EA==
X-Received: by 2002:a05:6000:491b:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48b12729938mr853133f8f.42.1790881432191;
        Thu, 01 Oct 2026 12:03:52 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.23.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm222539f8f.24.2026.10.01.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:03:51 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 06/10] dt-bindings: serial: Add Cortina Systems CS7542 UART
In-Reply-To: <20261001-depose-jawed-f58674109fe7@spud>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-6-4617c4463529@gmail.com>
 <20261001-depose-jawed-f58674109fe7@spud>
Date: Thu, 01 Oct 2026 22:03:49 +0300
Message-ID: <179088142900.827715.5924606072568297915@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 07:48:03PM +0100, Conor Dooley wrote:
> > +description:
> > +  The UART found in the Cortina Systems CS75xx (Goldengate G2) SoCs. It has
>
> Different SoCs need specific compatibles.
> They can fall back to the cs7542.

Right, the text reads as if the one compatible covered the whole
family. The binding only describes the CS7542, which is the only part
I can test, so in v2 the description says just that, and that the
other CS75xx parts and the Cortina Access ones (the same block, see
the discussion on patch 7) are to be added with their own compatible
and "cortina,cs7542-uart" as the fallback. The compatible stays a
single const until one of them is added.

Thanks,
Fil

