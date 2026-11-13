Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530185;
	b=2iAm3Rngoeh2qeVELeeYHNwfIlqKSEi96W6lB3cP26NdqkvtXsSspcRAJJi2gOAP6IB6
	 L5QfN2LSe1bSXBZQYPtAFUJUsxyUiZtYnkBQ0na4/GFlwZbxH3EeQYtKO4cD0m99wgdKA
	 GDzzDpUseykfwiIhA7HoltuZWhQjjiK1Pku5FcFh0r9/xHVn6bisOR+yt8I9mVxz2Fo6B
	 GMswtOG0cK8u0hnibOjTDyjW4N8Ym1l5vQ42IF/b7BlSPHqcFhWXBkunAG7OiFQ2+SFFP
	 azQ5fqusuzXwvD3DU4Tc4S6xeBHF5P7XD8i82iwUImuwt5jzs0aa1mffRQWK3dmdtRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=;
	b=lYmAQBWav6rVR4Pmqo9gNoHtIMu9lVBLzaxXg/L30PvVhiBOXf+fm5qiS+0RmWguiuhX
	 p5u0Z6beLsL+UlbMYLMJ6bA01tuFPLcuPgeVUSQQnZLCcf7y/XacDZmMzOg3mjxghFg91
	 QOtyadHTsf3DCeUVtTRqbT9IK0BfRj72bIp+LK3Ii5OPN9ychnb1cU5KXpwLle00S3FYr
	 5kA6DdbZvJtWMSj9hQAoXMTs+z9Fypp+BQ47EcG4qoDnoTje+1PiPbz5RecpTCz+di/aU
	 U3GGe7o+Q43gNbpPrTbI0EL3ALiQl1JBH0cDWnG7BQ+uIW76SWHwX+B/ac/o5YA9c4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c20milHc;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838A606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D838A606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c20milHc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so155347f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530183; x=1795134983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=;
        b=c20milHcs/ecpUyoygEbAtxUeymxvS/4c9tw/IMWIGVkUZpyOkjDWjcbNQtRjCLUdH
         lQA+oMCDS68wlxm6oqMNbmMv3pnj8F5legDld/DbxHJrPP2nZw8hjo+BcIKE7+R59LFw
         wSptjbueisx+xqR6JYDuVibVa5nzlotEuPFkOH0xGor+ZNDIe/XhaoGQM5sl+71vSe3g
         PbijRFWWBTIsvscc3Y7jT6lkx7JH+3Jr15ri5EwueEHGGq3jXrwj/Ey+xTgk0l3ozNX/
         Fzu9JJj/mjnOAOrnJ4NBLwsIfVJFVVqcei5Z78iTZL0GZqoJQvdWtoplKikoe/86MxXy
         E1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530183; x=1795134983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=;
        b=QCY134aILCcGAE/wWy41LlcqQ/iI3IfiHRiZZhOHUKHEQDs7ivBb8fvjTHAA7icW1i
         a5DK+3ElLx0wle8l7ZM0+UhrwdCjaHU7iqz567VP7SNR45W1oG8aq+mgQVFgVjMhxDnC
         yoUW2Gg849kYdEWEhsVLypMkJizUbh4GT8hzs2MY/yEQs6kpZonlhc9LUV4L1fTlWKWC
         Nig/sph/k9+xKrf/RLyr+NasSYpBu169smpp4lO9D1PXYXsfZxbutu3U40O/DDMxrogA
         23krUUzzd5WrIB+SaP/Kc4rPnxq7pkcSzbBsXVHJJwqf9Q7sMUoGr0EUYx1fmlfCPuqq
         BBnw==
X-Forwarded-Encrypted: i=1; AL+hErGCHiGkDsinz1WzzfLckd1TryA0T2yuYPUUjxHch+yQ1FQiUj8MvqBeG0yjtsbIzcxyGDG4TNefMB3YUcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iwpASag4hnuXblfiCEgTj6WOaacHz8r4jBk3FtoBo3Sqex8QE
	zgGUbZyPH9F4s8Xc2Xake36W1Q2NYQBcT9BGmMkqeDJPk0Xm/BYo9mPa
X-Gm-Gg: AYBFou3CyjEgYJX6vNhwXANP2GI4UaWHDOMvarirXWC3AH33aeLW1qTxaIWS7QBWg9w
	BLoS52LuDWc3tw/5QVYOtnzJdJdBEuJ13mamyIlWPqMN+2rnrywg8BMU0BHkpN7iUDl7It6lsjF
	BdYqtknvy7en+OPoL8vTZM/R96IF1oHyzs1WK+XRNzvD7UGq5SQx7n29l7jzXm4Y0d0HboBHLc9
	+6vrENDTeStKhZIjmAxbaMAIM6eQm4dGqGdP5PLSHKVs5xJ+OaZvUPxi/ysswFcvwTOKXMfR/6f
	KeZWvThY7iVv0K0iXpPmrWdXMbuZkEFHwdXIS18wslDyHpu/7au6JNplg30JPlp2TXfgdODWTTD
	ojsbo7yq7amFpZjgAr1zkRGv6Xusg0PRW6smY0r8px2m0S71wnIcafpwY86RdG5QT9+kZxz6eeA
	HfcviiGAXp92+QEq9dGjjJyyne4L0UfrD/YjWGWjd/3AOogX8C5OnbCIRaoFJ9XQPRZVFr/gTlX
	HS+DCdSzPjYfJo+6vaqIjFi4X5+4c4cumMpPqrD/56bBgniJ1ifJSNhR96THU9G73vlW+zo/M8I
	QNH/AoapDTwF/S6zUZndPJxY1p1ptpaBEUtSgCoIa2I/sluAupAoSu48mO1ru5A+ijxqN2tJC6Y
	5hkvFYQiPHk7j2mLvUopSj85heBYpEqzaI9Ucn7XwY6RAsAEFEKEXjAlCUW0+l60aV/cxQeSPlr
	/cQgFLfFYLy53Zy0WA
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb55a66467mr17360805e9.25.1794530183276;
        Thu, 12 Nov 2026 16:36:23 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm188421765e9.1.2026.11.12.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:22 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 11/24] phy: zte: Add ZTE ZX279128S PCIe PHY driver
Date: Fri, 13 Nov 2026 00:36:22 +0000
Message-ID: <20261113003622.3663361-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101307.3936492-2-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-12-ghahramani.navid@gmail.com> <20261106101307.3936492-2-isasmendi.agus@gmail.com>
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
> On my unit both read back 0 after boot: there seems to be no register
> at 0x1b0/0x1b4 in the top CRM. The vendor kernel writes these two
> values into the port 1 controller's "ctrl" window instead
> (0x09600000 + 0x1b4, then + 0x1b0); with this series those read
> 0x00203c78 / 0x0c46c24a. The link trains anyway (the MT7916 enumerates
> at 2.5 GT/s), so it may only matter for signal margin, but as written
> the writes have no effect.

You are right, thank you. I checked the stock kernel and it maps
0x09600000 for port 1 and writes both values there. My first driver
took that mapping for the top CRM and v2 kept the mistake. The PCIe
series will write them to the port 1 ctrl window.

Best regards,
Navid
