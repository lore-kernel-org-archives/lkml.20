Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632833;
	b=IJwwu28hNQ9eVD+XZXtdBt8JLCVNh/yEUEoVXKPVSookutx9pvKnn8TZnnykQMQACy4R
	 6SC4cstBeXg8a/0Ma3K1ASATHGYraKGyuivohV9qcHVCSiEz3rWmuBudZkI9DMW63/ucz
	 H0GY35dpBQNo3kEppSbH7oHu6/LjkcSMR3jeZWd2petiqm8KwKoDgC/aAi1XYkmrbaaCN
	 K8dKx0HRTHfuikFhhf00IjZkbqTFNlIjdDL+IIN3fpFC46x0oK6C2H7xqXXTBZUv/ZquQ
	 MQLma3vvEa5QMn2FweM0H7af5hm5BzdDPJSYb+TBCeWu/RDD3W83ztHEiU++qp5SreA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
	b=dZwRnKDtnUEZzMOBvGCSZvLl6iDhJNkAno4/2PkH2RYgzx8JSSk6RvPI98nCqBF8CouV
	 Fh4IIOh6Um/SRvZm+zryFrtHD9gGhtiXY/ruifCf7zKUT5MzhlqLIwoCfd46f7kPzhmSN
	 j7GvyOjX1LG0W1bwdVTQoIfNfJ8ucWSsUj8kBJ2htksay92TlVj4Ykv5Fxar5v7O9XZbM
	 dIjB1dy6eq91QMRHQvp51zXMh+T8Xh5FPn79FyeE/w3CKCjUuuO/xBsF1sti5jK3SUM9Y
	 xeJtdb6bvhk5bZgnDIieSSRYJP5YqRhVQyqAPEYSdV615oHvaDZvNgP+RWa2cV0jxPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ch6XNIY3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DFD60C15B8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7DFD60C15B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ch6XNIY3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20525785e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632830; x=1794237630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
        b=ch6XNIY3t6kF0pn9mtnGdyb7ik7pSmCyuebPty+fORrwuFfgVJJBcLf9A1rFnrR7ey
         eXDnX/pJYkVl9R9EwGMTqsCSFSlaxGDejoqtbK3VcDawlryi1ivKRLG+N7vWM5Llzdui
         Gn7PukEFyxcHYL+9FYwdjqnzO2SbBU9Jsd0su06Cz6mKZ3FsWiLxd3G0x+TeE714QsET
         UrGYM2rCj1IPa+pLmkNhp6sq3rjLi2fcCjgA0oo1hEcfaPTajHbBROaKaL4BHWbjchh/
         PARzTLmSSzaXz9Ag1zDD17FsvyDTCHAjToe4jl09oE8qNfcgwkhbzBrgC6//jx8W0mKx
         pOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632830; x=1794237630;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
        b=Wyo4z/pyhwbup+JttJUzZAVEW1yGeRcorT4JXHU51/LQBJiCwSt8avCEOuIKN1WuHl
         71zs144DnIPk/mGJhhFQnV88/zJjrvRzelVr/Dpm9bGdrDnBcAey5iQGiS6tqJv+6Rg+
         dxhoXdfU/K5Nz+dxV9rXWdgTZSlY5qstLlmegOkOx5jkKzWcyYNqChU8MrxoO0ckbTn2
         o8Q17LnATIOoVGMdexUusJ55j3CFesLu6HzISzzQE1bXOflySASyGkeiJSx0T1RpSFS8
         +2v8dbYWbMp60oBXT9lSH3tLZ51wGyffTWejW7aF4D/eJtCd2WeJHAXzqeeqYKCbunRZ
         LTDg==
X-Forwarded-Encrypted: i=1; AKwUvBzZJKwNwFp5XNN1Xw6GEcHnx5CRpOmXX4UsVIlhI6iIip6XPeN0+uklyLl+BgsmMGtyFOpYD5rsjUbPFKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/KfNp6DjyKos9CQ9RLDlGhrtcKuAIGiwg+sr9qexshocLtTgr
	rzO63UIb2kmGEMjzLGvuZq0jLCC5/UYibEMqm4Yk81/xvUlGIviKK/HBTI0PJyb4eEA=
X-Gm-Gg: AYBFou3liNu12rOXxLnVv3k2uoa+mB+Zsksw2p+labyddj9g9Fdkeg0EZXWG4vajBdX
	asPEAyoV2fnd/q1wGcRKiTkPrcqWurwPD6r0gmSvM77xg6n0R3yoO9uSrl+NOsD3euzMpMzTdsO
	RlXXTpTYcEjes0skry3GVnjGshDtZYNwkuEtJnf+PZ6F5/ZUztY7fE5JwIGegEy7a2sngkh/d2x
	VpNE0zYbea0AWyO0nALtgft0T3KzLh/zDyt/WE91m1nMz7jReWgmD+UJmQxbuSenEikcwR38Z59
	U7GMmIm2QblEMmdTeuZJy8cGhnkIxLVWKpDlFm7nkTpSqPJ5IHuEZ7X+GXo21iZC5T3d387T1O4
	gO8YiD1t9ymcOQdIiiNG5QhtEFbcQ1xQeOCyxMBW/NX2U9Op2POppTcvHzp5tlLOP0HMWVrRjbp
	PxNB3zifduzahHVaVRwBE8AGvJQEMn8Q8ueVg6sIicaQ5gduPy7Cj+9kEXi1sCLbsaRjBguqFul
	sGRqkXpLDrdZxk5DUSCfMeSb+aG4Ysl57rGSx49JEIkkPUgAbE+tCOEyy37rMhCO211xbZqtI2r
	1q8AAzp2ESDXf/wVzoXegbQUo3lrz6rAFsGZqqGxPHKmKoCg7yuJHPr9ofVH2u0jerOOpw==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr235421355e9.18.1793632829929;
        Mon, 02 Nov 2026 07:20:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm127731715e9.0.2026.11.02.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:20:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
References: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
Subject: Re: [PATCH] clk: devres: Skip cleanup action for absent optional
 clocks
Message-Id: <179363282435.2870673.13424521075621537004.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:20:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=199; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Yxcb0uqpdb4B4EpHRgmjN44BopM8a/VqE6zF93LxON8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVtmcrnilenNPtUrq9YX6Afvi24K9puZLbTx09eKaX
 xO37HU42VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJXIpkZJgXGfP2t9nCcP7p
 gj0+X/T/Ju1XZjkrVKMouui9xrZfMzYxMix3Szf5Fqg75c7a4/5Fzp+K1q4wn/xEzady/n2laxO
 jk3kB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: devres: Skip cleanup action for absent optional clocks
      https://git.kernel.org/clk/linux/c/8c30b4bf0868

Best regards,
--
Jerome

