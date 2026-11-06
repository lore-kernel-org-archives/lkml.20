Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999605;
	b=Glk/dwX3bUA+OG2QP4IEieZ7yhTM5a8v0Db28M67VWe/bE2tU9BbJEzuqwVvERe6mBke
	 Gskh5oLB9qmvBCpBKKsaVl31o9jhhOekCx3421ARnBytNOoIxDCWMjv9FVIzMfOpfDlGe
	 2Dyx1F1GHyVsdPBmyO382dr7Xm70voINHGk0M/sBOBU6kgM7V/v3UJ23hyGhfCM/H47PY
	 Bo93hKimCJ8XTrMW5NwfalvltvPeyJ9JZ6TBJanqLf9NXJgjuqThcaKKJZyJkujNcekdw
	 almDve1d2ERZ51L7moXHWm5riABjh52LpZpGPBe1vSpPYyylkpzP3byzqrcxi9PLckQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
	b=XwGWzGU+kfcTbqKWnoG8gD5/8kJL6z1gwGt8HH2qc+0eXhWmlYVtFlLTxYCxA2t0iK/N
	 uDVY3rWkBKErF5TbWPqatgDggbqnW4eFpZLDwZkb19qvcTN9uM4+Y2ZZr4sDt8C7ShIDF
	 DtHAp1OuqQ3ta+apcO/s7/fjOyYkEPjB8Id/ElT1nvPbjAvwEZBBWX9Nt4dvdOs38M3Yc
	 G0xU5T6DF4AgSL03M7HBN53nqy0DwvU9JfO7doTmBxT55khR9iM52pD628V/XG72AJv4u
	 1m8lxN3dMfccUO7b96kcQAf3woBrhyC2ijvX6MvRs+NSqpNd9OmHA2Yg0d3kGYDu7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bs7/5yc0";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A083606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A083606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bs7/5yc0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so973092f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999604; x=1794604404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=Bs7/5yc05ayHXSEmEltmPv9usXB3iLJ0UIPKGnnUPLtEgiJXu4B8k6wHDv4TBhOAcN
         tgLilyMtppezqIKxWKh8yHwMlSFWMPilP8OKolcj+vpJG0jm6dhM9KlYIdRqsVG76ZkD
         e4bge8pSpAaR2jLhVnsVK84CAV/zEdHskcfyosoS9+FK41zPy94ZAf55XXK2sHHhB1LH
         jHtUZXNW63rzRAqFlEbuhf+zGppUs34YvdK1Yp/Z2MW/95AUzL4HxVJ8JG7bQmguzxgF
         LgC3vzv6dEL74Ceuctm0x5fGvAYFdv/bayDZCdSHS8Kh+xDM2aALyK5xxWSozuaID8Re
         ELAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999604; x=1794604404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=bb1ds1N9qa9E3EMZMvx6Eb8K+w4FYXgC4c7q6AL+N61cHc2dQbQzttsUXvZ04oPkBJ
         /vA0fcoQvuaW22lkRoaNxeUlxQrflJ19Df/E3VtYQrzo9EfB1Px+cI8os/Qwc4t5NX/J
         umhJ2s3JTI0j00qoIWd1bu2VOa+DG4bYGRbcWQ4QuZg48dykLnYw9sKXRVD8PayDBuug
         5YxxzRBbzjisXFWuApTn3j6KaVh8bI6mcuwdGogHhQRLs6iJ4i63Dz6V+5GZmdoS8S5y
         Q/Js/R3p8ApO/kFkLEHNAHLtT04o1+ky0BL64DfG+7QHyYa6xubJVu3T/yS8q999CdO5
         8oPw==
X-Forwarded-Encrypted: i=1; AL+hErHr9MATFpRtzP+8zTRiC5oV7q9wdN2Sk100fvUaEo56xtmgdpvZho38E71SpPN3ktdSArWmV5mdzcG7RqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jQjf9n+LrRGQd6YAhG2/Z5qtKyXRumadpam3Qolu1201JlMt0
	d3x95CJJMENYWBulC74dBAvIvMZZh3BGCGvyTVw5jtUxAS8apmyMSPy4
X-Gm-Gg: AYBFou1zFPZPPhth/RQ1XGKkIpa23matWnmvxHSWidYUMYDzfUVTiyt8CjlFU9mTYs+
	X/IqCEEjfqA4vZqOArk6anzDo2lldCfDRa33oRawl2oqHPBw0+kTdGOromt+SIV78mPjr8hJpIy
	o/H2L2hDhqr4+z/qQwGUQopr7VsCHETuF2NfA/wakotQ28gbTXBQflAbYHuSr800cDBAiodgBnM
	qlwyUr0BvQfS9Dp15Nr082h81xRlTODzeBA3Q6bL/Ako9cu3KQUhZYOXekwGdr7M7Wjlc4KamBD
	vSS9Fto7cCWPpsSguql0yjb5y0uoo2HAPTyniAR+t/3pwCAHd357EtZto14VBIlMqkXYjILOXK2
	C/cT6NmY/NoASf1bUOU90c/FT9gXz0UgC9SnSSAKCwrt66HLQhVF0HgRiDyjW3+cqzyC8VHH6IN
	dT45pq84kzxPFU4XoekVSMjbly/JRy6Z/6uVaNClZblWWlwVjnUFgGH0PB+kCJdlQlFgGYfFV2A
	oLQqumYlHLtDvYc5CBUZKzm39X2Skr8bmtU22eT17E0JJTZW3Ohj9NKQDDm2DkWsMDjHd1+hQue
	thYSvXIfe3fOxsjglv22W+GxdR8BGNHM
X-Received: by 2002:a05:6000:26c6:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-49272d1c6e0mr6959875f8f.4.1793999603662;
        Fri, 06 Nov 2026 13:13:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm5824696f8f.27.2026.11.06.13.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:13:18 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 21:13:11 +0000
Message-ID: <20261106211311.73460-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
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

Hi E,

Ok, fair point.

Conor, could you please drop this patch? Apologies for the hassle.

Owen
