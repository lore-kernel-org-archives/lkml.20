Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683009;
	b=oY9knwUXgtLYeqof03r9raNmovuh6s57jPK/6HqV8mI3CpUF4II3hK1m5co1PGDZIzAb
	 tOtZgnpndf9XGu84bzYJqDajBRzg6/lkgSrvRSSyfkseLMlqfGigsH1mxmyOUis9mhtnt
	 EY/wOWnqlBmqEQUU4bvXsdvVNruWkha9WDO8dKIPkJ+vSKmEsO5QepEatyrWT4QO6RH+y
	 hq/VRowXzfC8AVjp8cRuNVarbQLrSzRxOvKyU6ZJm2gPRR22YFwFMwnmB2XHO0nzJL4f0
	 sauvecK7zO9s1dzo3PCtfV/7HNuBXLKIDrAswp9+2mJ1r5K6g3OZWeJGqyD6wbZil4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
	b=bQtzZ9OIH9jZtFYl9f7EZ3KhhncVYthvJ/3ZdkL727NAQJollctKDUda7dSl1D+sRXeQ
	 MEhO4YaXwwvAiS+8gDCgsvt5QuVFKtpuKxJaWQGuXFf4Nt9GVqXW2ekts1+J1W2RK18Qj
	 5Kx0up7dXKFGyveE/jfm8xH5bboJJ9I4uZt1wDhUOs1EI7lIaBo+sgUlLlujjeDbnNty9
	 g5Vj6vHmvqc6b/DBroHyAHGU0zQTH0lgocuu6RDDOJFOuHqr4P6FjszrqRphNhpDKMQ1n
	 Ylay6CiM5Tn3tBUGLprf5NKL0Yck1ycLrOs2LOphYdtMHUcdeTkjpizRZOleMzr5eLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ed5/AR8L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3522606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3522606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ed5/AR8L
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso10939335ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683008; cv=none;
        d=google.com; s=arc-20260327;
        b=cU/HWIsZAn51vWnTqZntqvHJWNvx5j5tlbBLwzBdfHktc++55X39IdRGsQCr/3VRgv
         Hl9X7gUqN81ok41w48gWAndK4JPn4DvRUsPEvIXeWmlnolVcItnF/AhAOH0PMmv8k2LX
         ufvlKSN/PQSCuwLo2HAQi7dqR5vMhT709nPkACfbczIDz4OERyKS43KalN3+TVNppBj9
         jQ9Fc4/JsCTs9wAzBqRypK/n99YLzysOr3t2a84c2mbrSxUMAlsxoNUXkVfmyCny+kkU
         OD9k68sRqO+dytT72TtQwiGuVXLBVfWLqAHEG7ZthuqvHechrhkUG9XLDEWlpzkgAUN+
         e1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        fh=aGsZDGhe4hQ7FZKpNkJ+eTZH9LfMfUbDobOSsl3iaAQ=;
        b=jjAPZpjR7R6+uz+yJ10HaWpvQ3FNSKoaEVI+BtZMls9IRZ4g1HtcfTI+AwWC8uBlMo
         mteq7KspT5lx3YjeTaYkC8s6ntfhyG5ajwO05VgpfqUmKlSqOOWnE1ImfRKAFkTSfW2E
         xNTJhTOilrZfxBiO6IhfsLLLqZWwyW/0MNb5+aQklZ+rLjZBQLNTHFYbedfuCeqd/e8o
         PtKq/gPm0fchsxWj9/LEckImiVGh7Wz4O/qRizMojELEhhXQHXgu0xczGrQxAEJtmg/o
         l0Vi3nG/o9NOTzNi4/fZGJZnR2T2adMiyH/NE94IiHITL4+YQarMi7Fs88j2FU3i9vVz
         8yBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683008; x=1795287808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=ed5/AR8LX1QZTDhIbHcEBTJRhK/otuKy09bVoSRxvd8kBmgwUeOssZgQXYCkbNWurs
         O3Xfr7yfulcOnUSCxgW1aQKeZ3OA31cq7m0BSRm3AMi0tHy4vJI2ecG1kFc7ff9UNmNu
         CukSzu6El2BTqrtQfdgsP8pxSjp5kAFtpLD7JI6ZacmKnWHQ1dOJZ4Ywf6+JIScdzIXU
         R97MZdgGTwYx+iMNuq+7Nk5SX9r86ioR3Yzh156PG7hkRdW9tW5VSIxSZri3ubgujlkj
         XKh+XKpHmx4GZvYiOAHwI3YywCo0ljTrUzKUfKsp7NnI4/yoRGTV4EvNZyOkBQa6UE05
         pOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683008; x=1795287808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=vDo5dObi5xPjsh5Ec+BorsedRSQy6VFdavug1uX9T2EyZCEfc4MG6reuBKXDNmBq+E
         PzIawgRkz8oaDS9LlJH/Fthtm5M0CGDvyTidNym4IS/4MqXIJ2D4tybu2lFoj+mdBLq/
         o4JU+N/ilK4mu+InhrapMzm0OuBqVye6krQbG+PmOEyM+BNa6v1tqcs97jWDByyh155V
         //PfcRFxhRDl1aY1fZoVgMW/VDSIzY4X9i5nvfDYN+K2MM3Di0h/7lehGo0w71qHCupM
         lgcREVnIyIVZZOSeGXK0Xg0tnfmalq6dYs5koU0Nr/eVWIu+K+5goSiMcZPec/6g+KNw
         +2ww==
X-Forwarded-Encrypted: i=1; AL+hErG1tXGtFdRBSjOCHyQmqsyqLlDGDKDkuZqcE3WZ1wtY8MjN/JQa0ntt3vEMseBILa93hehsaUYeKTKB9qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SroN1mfIIbK/1GLYqSqAM/ycplJlJlZZkdj5n7ZLU+UGlvCUA
	Ft5Q/uFsa185eYDD6zSCOi00S85860QU8wcfqgvCCpff1ycP2N2qbkBw3/Fio9O9JosH9pIuAWV
	rZ7Jmwa57nfpC4UXtuhpigBMHk3U73g==
X-Gm-Gg: AYBFou1bAtmdKdLxyjYcWBwHFVlacSyE/56KwXwX/zgvQynlviKePj845lvOFf92+og
	DcAGxcSa8LrstHyqgBqaXqN5d3/GIDO4qVlTw4SI/pN97Kz89W8P+vnxLe+Fqwl2/2Nr+/HdX6W
	/KJOmcnJNSM7ireojXIgH1YpUKUVvBk09R7RkkXivmDYLSXpjdHCIv+Rb8krQMzkVr79277BVuT
	l+p2ZyDtjQQE305x9WK981qwx9hM05rrXY2DQHX6+94ubepcBEOWRuuRGH89A2aiO++aE9Fzktd
	T3H/iuIPBAHnJY8e93M9crW9HTtP2JGGO5XHW5i46o9LsZvlg+utWlvIRf/au3fVE4zHKgkEskH
	E5o0nTSG+5ToGV2eFPzMqJSc6nc6+MmLIn0Db
X-Received: by 2002:a17:902:fd85:b0:2e9:734c:5025 with SMTP id
 d9443c01a7336-2ee0da98dfdmr60035435ad.21.1794683008249; Sat, 14 Nov 2026
 11:03:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-m52xq-nfc-netdev-v3-0-725a61ce4148@gmail.com>
 <20261112-m52xq-nfc-netdev-v3-2-725a61ce4148@gmail.com> <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
In-Reply-To: <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Sat, 14 Nov 2026 21:03:16 +0200
X-Gm-Features: AclHuK_Q0fCYoqErL7BMlQPVGQL9gfpYv5yw5VBHiZrfm9MfbMBI5fajd-Czxx4
Message-ID: <CAARotke1QDxr1XAHZhDBtq8nSqXzrbZk8pmdyy7ceK9ObBHNWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] nfc: s3fwrn5: i2c: Enable the pvdd supply
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

thanks for looking into this and for the schematics pointer.

I don't have schematics for the Galaxy M52 5G, so I can only go by the
vendor kernel's device tree. Its NFC node describes a single switchable
supply: PVDD, a GPIO-controlled fixed regulator that the vendor driver
turns on before enabling the chip. None of VBAT, AVDD, DVDD, PLLVDD or
TVDD are referenced or controlled there, so on this board they are
presumably fed from always-on rails that the OS never touches.

With only pvdd-supply wired up, the chip probes and reads tags fine on
the M52.

I'd rather not add bindings for supplies I can't verify on real
hardware and that no board would use yet. If a board turns up where
e.g. AVDD/DVDD are switchable, they could be added then as further
optional supplies next to pvdd-supply.

Does that sound OK to you?

Thanks,
Asdlerto
