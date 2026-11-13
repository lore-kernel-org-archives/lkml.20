Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530179;
	b=CfBofWdUWnya0CPmDcQAjPosCzOR80Pu5UbNZ9O8bldE8kTWRFXaFO6RP5goyKrq/V53
	 tojLLo/4GFDFAQricBTn8mWzwcgKsg9Ol1aQwPsRA6Le4I3kl1OAOCJpSko495wqUy1h4
	 U9yi8u42yoaC9GFleVhm0RB60SLgK7RFTN21N8ZiVchlQG/Zs/isaAdfsLJZFwXv4eHXU
	 yDeqAWYd4BogEFe3onY6RWb+AX/g5QRA4HzhK/+12eA0f+ebVLMt4IgLbiYa/pXkNCmvB
	 eg6fyIaa23wi6DOy4tRxHj+vWyNzEOpgslKfInNTc6oBkqcHwd8OzDs/7vmFqr2sQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
	b=QJePx0WSz83PFuhdZdmvICv8w5I+99Zl+lOib/vkoSBCjgZlxRVD0C3H2XwJ2eJxDnCv
	 fe1YGkXleo9oqKNERkpakxI2GLFMXjChje44Nfscf69EqEC4e9ii1+08pPaJ8ZE8jBDKy
	 p0LhAb9iDu0hE+xQ2tH6wSu9/Y0iMXNc2tQQDV2yWB416x39q/R6xAiu2gzU7mHRUComV
	 CJfPU5YUm5VuloOboDaKjHMt3p2czTdDenreEdkJV5C1yGQaVei9OugHnSMpBia+X8Tkn
	 zHdPL+MaVckJhYeqJdslidetrrURxXJsu4ZCMr2fKsGj5ImPpk0sebQocxZnNhqew6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUoE0zDn;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E41606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E41606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUoE0zDn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4560565e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530177; x=1795134977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=OUoE0zDnOEgkY5AdkIZgNGZCY5rZ7kVZe9xeF8ZtdE/YaCVQR7s3CONhj34hhbi658
         Kc9razRVctDCPlCEB+ytHyVwDdnfRcBrxUYItXaP/7L4rgQ21mDlWH1cVH69JeYQqVYM
         1+oKvqyiSyTUb3hujawgfubIgPLUJ2BNJTKYhothStclFey3tNeH5jgI1YS/qmRs3OiG
         kJxGYwi4RO3Evh3z5DvWFkuffqxw6e+5iQngAajrgWdPzAIHvX/lN8ObWd5XKubie3y6
         YHRm8YIwSzycuQNYQBnSxGyvAXfpEFtqUC73xSkbdQ/UIbgEe+JSMmdYy/vMN+qZAAHl
         0ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530177; x=1795134977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=q7r3MfkdNOpp4IqlSzAlMzB4flG3988yrl+9aAxDTtcU8nv9bGPEYBhWmJwia8HWep
         E+JgdiximoiQ2/GG2FHIXmM5qRIeMazDE/aJ+bjypihBrki2xjGf7PJjbjmJmavWZP7a
         TrksYBYpR1kWFKSkLzFYHexe02yM5eNDb/LbHheIQ4g2QDhaXLrNLzWeNJHZbBIplo1I
         oFs3befOSiynwbF+9+8Ew+DuRLkgxkbXrYcZrvhmMPNROZOE//gRnr1yqPFLHsnXzXm0
         Hq7nOV+j3jUmrEcDhtIizNdZqj3RSF7ZjWC3qjAc+KcmgUlI2ato1XeVeSjBkRGw62sq
         IhmQ==
X-Forwarded-Encrypted: i=1; AL+hErEOnRXH8QawS1U+5z5ExrpmLQIQSpZTV8T74gZmTl35CntsZxheKosA2Xiv8P8AJa2EtY7FoPPnCThKfjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vo8ISxw5YcUs/s8nM/6cWxRDxTP+v74A4dhuwnerGXG/IqeqP
	y7derr+7jDxT9yi9alSfHWZiA1xzYAFH+T6Wi8ErjWndfpXbabXUxY/Y
X-Gm-Gg: AYBFou0rd7MdGZDGQuKzEgKZK6FVg55QEaVddjgHLI2pHrUzcAIUbtsnhHrrjEeJSAp
	yyQQnQAsvKUswZZliTakyDV7wyHta+nNDRI16BEUnFarjMCWAErKvHDlJJS5+AA+cOT4H7oqvjH
	78CN8+WhA8biULsbxKoqK8EcmIErkwXnHgquV4l1sIKGFq/riCb26A1gu3qwSC8igd5nhKgK5Sf
	PhT13nQp+75/tANaN8jAyKGPR6sEMuNLsCMFTqV4XEdhWFlzjQ2IpSnXAXPfb/BO2fymyNMxnO/
	3esojzp3KZNzZHDaxJxL8GGRfvyzNMyxUWwOvesAnk57fE1QWjbpChqSN53yuqWYqccuq0hNkUg
	F8xRTQi6cGU+J9eKIwELR3Cyv29u28Luic5iwMAoNEuGaAsh0C9r10jJvO40SNEuOsxHHYEiDoS
	duzyt4z22y8Y6dX6ICQmgtoLGabxocdp/tq0XW+hhVH3SdGZ1gqktS7aVLtMr5VbhRRBynez8qY
	gnbeFcU+yplfocup8EgHBwH1P878WQMPW5WNOp07WOFtaTK1wJ/MKKEBRgcE2qqcUG6E2amtp/a
	NU+W712l6KhMm9E74D+/ELq9Hhi/g1bAvOgrMLVHmLOy2NN5RfY5ccp0d0/0AQMOA0SMw1ZBuxy
	P5G/Rbsmm2+qvbjjCaG2Y1aXn32iVuo3vuRZ0mP6m7VCgUBexNnKLTr8M9IR/OEBwhN0j96P02D
	1q7l5UwLqXwIPaLaUb
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr12734625e9.34.1794530177039;
        Thu, 12 Nov 2026 16:36:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm1812441f8f.27.2026.11.12.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:16 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri, 13 Nov 2026 00:36:14 +0000
Message-ID: <20261113003614.3662958-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <20261106101307.3936492-1-isasmendi.agus@gmail.com>
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

Hi Agustin,

Agustin Santiago wrote:
> Does your unit really have 512 MiB? If both sizes exist, maybe leave
> the size to the boot loader or use the smaller one.

Yes, the boot loader on my unit reports 512 MiB, so both sizes exist.
The next version will describe 256 MiB, which works on both, and drop
the pp node since nothing uses it. A comment at the memory node and the
commit message will say how to use all 512 MiB. You can enable
CONFIG_ARM_ATAG_DTB_COMPAT so the boot loader's ATAG_MEM sets the size
like on your unit, boot with mem=512M, or change the size in the node.

> As far as I can see nothing in mainline implements the cell index for
> "mac-base" here, so all five ports get the same address

You are right, nothing in v7.4-rc1 applies it. My unit has the WAN
address at 0x36 too. It stores four addresses at 0x1e, 0x36, 0x4e and
0x66 that are one apart. The next version will use two plain cells like
you suggest, 0x1e for the LAN ports and 0x36 for wan.

Best regards,
Navid
