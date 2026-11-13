Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530233;
	b=K0KEUJAYinbVsx2pL9ctkGl2moE+6kvn36CLDEVFpJ5ffuLEnVPQ2EwlhIF+3yKXp5rq
	 hky4HY2GNQ6PRK9aFs64UzCgtpoEkcMoE+ZoYAWEUER1b8V22iJikDaxleKZonFncgYIz
	 tYK0GEBhLguVj8tKqBtU5er4KTv2Dd/9lV4+eCut1xMbhvHLjzolQuhJVltEPLDC4fDkL
	 ViYuuykoa19XhCTOxppUtHudF3DIW3b2qVXcy7U8EnGEqPKioktiZlh3QaQqW9oo76uE0
	 UOaf3mZSMkgWbJ4cdTNCqdQjyO4Xqo5jdJ0Z03jfjmCloUrxP6MfJEJZCHBulQseSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
	b=owXJHAbRMkvLz9LI95xWgzeE8UM4pp7AvefWA2FnaMAYCxXH1ScFlrsj4KoqQ8XX1Zbt
	 tpHTQKi3Wxb7R7ueihbCyybNSIToRi93Kk0MslmzEHn8PpCz4hLtTf9Y2jZhhZNX1vBkm
	 PwLBno5FfxG3PGNRT41vW7T8Dmv8A6b5qnugwti91L6LYKD+m7bT6U8JH0O8DtNVsQrWK
	 WCgACEO176N3rDyG0JWtgo8BsWY0srBg02lVAmxoVcS+FPBOfwhTuJg2xXwsPmavP+KKA
	 gC1+sy+eq6o2OmJUUK1cW5rxZsrd1ybKKERxFN73op6dcUqatomtQHT/3KY2VF55qtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDzIygvm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEACA606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEACA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDzIygvm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5963405e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530231; x=1795135031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=SDzIygvmmeQpRTIoXUL0i85BGt0NConZfVphZQcxvJppqnb4I+v5ANOEPmm2W0YRhz
         6HlYIqqCIL6XZ6NLlujRNoR0XRwUjML36y2x8b1Bbc3ajeu8tWzolBiPKPI3BPet1gqL
         hPHGevUkZa/Pp+UBbZHxGzut4ARbk6rADHTs5gGXSqjGiG274QFlGtBuOo2SCUcATIF0
         PIVqJLicTtC4MA2vzB/vahIkoISlNbKv6J0pdjPwqlVzCtpiinm9a8/ZiM4hKnWGUEpZ
         8ou0GFhUb/cxDa9CMfTXTDOpo5U5WSW0+6Trp1HGoVwknHHJhCJKIyhKh2xy1+DvrQQL
         BBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530231; x=1795135031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=bblLsPBKOuIvlQCayXsOcjoncMooYFOct4BP3fEOKcnF+yy2wrech3YZegll0JejrP
         7pPuf+eAh8Rpv4HE0EBzh8MTmBs6z9m9uAcXXWpJpmotxNY521A4/gvLUFHQ6pmXM1/X
         10AFNl76ZilU7ymo/pzdBOKK2klI/b5/J/hPaW+U6X0NAh5l5Cfml0+LXksrvcj0887M
         yM/maIhY8rmR8gUKpZuaxTjF/SEuQSY9//WkEEnT6kNR5bv7OtFASAmMJ3n1I/Bb9jn6
         DbIHz7tAyxR1aiBf0RJ5M/pe441QMaoIUvRAAtdQHCXHHitGW1qt1kmLaiIbhvZY/vb8
         3eeg==
X-Forwarded-Encrypted: i=1; AL+hErFPZxbO40+V0xqjpeMSVubCaLS9YZ39nNzmWedcgQA9dEGssACOLW52t+MgyDqdtQHFRPo2QCjXb/jVf2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gkVy0K3yAGAtFZ7iDI4xDtU3Z7C1mGBVZZlH3AEj+stgOva3w
	Sapk+eldzHQvFXU7DjVwbsxRtz/0MNLfj4dqI7q6hkQEftP43U4tArmj
X-Gm-Gg: AYBFou1rcESNPhLdhtj16aivRPUr69yYAVtWzFt89nP59DK5Jaqw2wu07QwvL19ySUY
	6gcpj8JxLYYIxAWFHirXm0shIp1Thr2WmL2uJkrRL9gxOHGW66IlusN2syYgH/51IDs4Dipqxus
	GEBgsQn1rG8TSqezehMX2bjuF/vKVETIqAkPQ3NpfsQRQDqfCnd2WybhZUgjf1RUok9Gn8MJfgM
	51fWMuClcJHTEqOWm0e75WdmR0vId0SVK2uHvJ4EYLDO8i72LodU37a7mYgNH2rabuwgml4oJAu
	TcDcoQdvjYF61SDXfzcCPRBpVYBchAffoKuA5AG8ihRgIfRmdnhoamaGjdgmyA8FzImVrM1el6G
	OLj64HXJt8Al6CewK6101ckfsXFgDoOyk8zyKi7mZyfz/6Nh8VP0Gc1menhRqacRlnlIk43/svo
	PRQuu5S/pG88heMdnE/xT8KTVx+5OsEwHHrIBWkLa7lJR0v7pCrzly2s05YuaoHWYftjIQMiMNg
	O9dG7dsiN5eSOpe7COVcL+gatMgTjb9X6ljDpq7iQoOojCvIYb+EIybRb9FGHO6gwfGUP5VX8Vn
	KIztmf+XXp/SGxus6YDx3BiSQwtNCWVjS44pKzkTan/eHOec2VpHMMMvRjixMAxas7gDaSxRMDb
	VupQ/QHCNbNjqRP9AvQzj5F+BEU1UJqpzTrp/9qg3LZACH4d/NKbBMO2E/HezQY4bhrpBHnUMXR
	i3al8HJ9SJGY1Mac3l
X-Received: by 2002:a05:600c:4e92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4bb55a850d8mr18959695e9.25.1794530231396;
        Thu, 12 Nov 2026 16:37:11 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f9e5asm102305995e9.0.2026.11.12.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:10 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Date: Fri, 13 Nov 2026 00:37:10 +0000
Message-ID: <20261113003710.3666410-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
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

Hi Andrew,

Andrew Lunn wrote:
> You have phy-mode == gmii. Such a PHY does not need a SERDES. We need
> a better understanding of what is actually used here.

Agreed. gmii is just what my driver has always used, I never measured
it. I answered in more detail in the PHY thread, 16/24. I still have to
find out what the link really is and will do that before I send the
networking patches again.

Best regards,
Navid
