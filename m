Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637829;
	b=yhPpAy3JAGs/qoOuhGFx7Y5XWDIFOUrz5gH77wBw/EN8daSrv4HrgGrhqgu/bKZdzLMs
	 rRM2KcyxXTOJvWxZo1STyuhc6gweFOByzBc8z5yrgaiCdTBLi8fgnO8TnxUDmKzlUsBHN
	 0mPQJApd26dg8tb+QZjmSKr8Vxc7MCqWm+vcn3XxeN/A2hyOb18V69uCWYwlb7qb73vUh
	 wPGwZltGOvmbep89pXMkFzHzsxOuUcOtG5cacxUyG30yM852K98YfLEnTPhU3q4sZcNtF
	 2U1yF+7l6m2eKCi5y/Ab2UltonLJmT9g05TK82jW3XDP6NreeG4fHqZ7z3BDROWUXQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=;
	b=W1lF+kzlJ0QIXBs6dyyaTj7vjKtLk50gjIXGercgqKDpshlJ5AoO8PX9hI3NiGdHpLio
	 /uc1Y326ATucPT2z6l6ZR2XeCzaDrej+p+AWjIWFDVQ17fmQ6OOMglmHEJ4c5jeaawMEv
	 1hXlxbwiYxoOF55ENLXknEzimmGO6C2ONwQbCdjbOg4PCpJAxhypuNb6ziwpaEYlqMi1u
	 RMjyhFmnc08i0ZTCl7U9qoQ1a1NRHf0G2UZGJJFCd0XSUnQXeS2AcJPXfXCwg2g7q+E4Y
	 3iqKP9bEN7z+1sKNRvRAa1/uH8hDjz3nKiUEehEZKfJeS82zVgsnWlyYXe90kFY4JbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=An3Xo0In;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0168606B1C9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0168606B1C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=An3Xo0In
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32727835e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793637827; x=1794242627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=;
        b=An3Xo0Inbbs1zQVPQtC4k3aDYnOj2ML/JZBciVZmnb9RFDyA9O9280FogdBWeCich3
         ojIrRAwb22E4TT2gLSbRMKfCmnbZJ1q0AubT0IzWqcORI80tZabtzPtP+5biP2Piw7+C
         d7XnD2+kms1bx3I1SgxcWAE/b+Ro3KYN7zB52s/1R+OKEYCLGf3JxruFfbHifGmaj6y4
         /Vyh9NYdqSBymYg5owis6TBhG4reA2Wc1awPl9HL8KIu67mCGkkA38coSTnnocIv8Mpj
         oL1ZM0PwOyFauvN55TsOkQweKCusjmYrf/HsXdrArAM5k5L3kqBgslKb+CPpjPGjra5z
         3wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637827; x=1794242627;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=;
        b=W9Lb4oTny0Ctk7SjkbCQkqV2oKMAKazF3iX61gloj9sGsPXF7McNfEULv1KdOL2jAZ
         HiBnMiu+hhhzM96BGhdcoNoE2x+md4g+ALiotRvpnQrp5RQJcbEGJgORMqxB3kKnf/S4
         2q8i7j2vZlQBRVBGoz8c1br/x4kL42mfHtTfOu0TE/HS4pBRbUorINp4TZ559W/cKAsA
         At+5n6GAYUrFbvVS6u4ayVFF2TwL+mkc8y/718eDce5rtSJP1+NSa19LQyUK6OFDxBHm
         zK+6liBjB7hMAs7yTuGMdq6UaMdMEQDr4DJP6LHZsRtf4ltLOAcjc0EytaqFibWRJgv1
         JCGg==
X-Forwarded-Encrypted: i=1; AKwUvBxxPqSyU3hNTqMpJ8FxcMJGYtWH+RM5mG/7HMipzJaE4jfs5MrYJVKWDUI0VmP6oLNO2gIWj+63mLXM8vI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDFvC+u/ouLfv5iiC2mSt0ruF6H1t9GAGiDnAuDjZU6Zddu+3N
	ZKvb7Imlva+/SKwU/pp3RzNPXsXrrhVPTPabtcc6rTrKiWlo1p4ZosdhDgyT6usMTLY=
X-Gm-Gg: AYBFou0gdl3EYlpY/qISC7+DHaUpsGC3n7uvpxR9uN2J/vAVbxktby/SM3WS71oGKg9
	8eW5rbDpcJBNEzYXTkXtQ6fQMPZacdmkoCZ7i/7zLyBWmlWfYlRds+Yk1kxzEc9GaGZLsnReV7b
	CB4MBBgRJqFHj1QRFkKOOnvb2MLTqCnbgykhmqDIpFm37icfahf05qNIk6cuMKO7uw9wJJC1cpL
	OzHvf1MbVZoEVgMdyES6ruqCW46wR2DRIR03W33eRvQDPr9NpG0ILBIWqIndoG2gouCoQ5clhT8
	zCxPNGV1HlL7VZP0RwOEFUkr7rjOBXStAWBzc8fckiPB8SRADNZjDTbTcfbnkDXmK2h5rItnZlX
	LEfnw5eO32S5gzzgM3pab3giVMd0XCU4nFsV0KLKntwO4XuOPr9mAB45yzXdZzFy/MnufEXGcxh
	sO+/hp3oVmb08cxmP3JOFJ7M1pjQBDLQEHhF/wmJUbvml96iX9QDF+2ZRGToVIy4UcoUYWDL+00
	EDENwY/+p6kvTz63COWZS1fp1WI6J2Mgw0fys3wohsiyyKxgINH/Fxp5wXKer7/LD68K6/yNjpp
	p1KT6z7glfrOQyNfdgZK06KNsQFjeqMoxX8oSbL2sLS755s2on1scQ==
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr255111425e9.22.1793637826920;
        Mon, 02 Nov 2026 08:43:46 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm18537611f8f.58.2026.11.02.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:43:46 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Mon,  2 Nov 2026 16:43:45 +0000
Message-ID: <20261102164345.523122-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gibeom,

Thanks for looking into this driver!

On Mon, Nov 02, 2026 at 01:44:02AM +0900, GIBEOM LEE (이기범) wrote:
>  - 16 of the 33 checks of the model fail before and pass after. The 9 that
>    still fail are about the VEMC voltage callbacks and the overcurrent
>    handling, for which I have fixes that I would like to test first.

I happened to have a fix for the VEMC voltage callbacks as well, and I
just posted it on top of my regmap patch:
https://lore.kernel.org/all/20261102-rgp-67-mt6363-regulator-fixes-v1-2-420789a3113e@baylibre.com/

It fixes the range lookup of the getter and selects the trap 0 or trap 1
registers at probe. Could you check it against the VEMC failures of your
model? If it covers them, it may save you some work on your own fix. I
have nothing for the overcurrent handling, so that part is all yours.
