Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B14AD4D6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844768; cv=none; b=cF/ZLQlm7sxhPayMQBGRlDf+nC+zQbB0DjzSo7QYn8eqWk5Ju5ZZkYAO+AvHNCT51G56H5khmrDI86FBLrlaTMKFZ6+sR3CACgsfCPfu9nA9eiTNDFkKri3X3yQdN3FRZk79BNzJytPf0n1jdLTjLw0Pr9UDGA0wyvtdwqddGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844768; c=relaxed/simple;
	bh=aoLzZOMCzAOCOPkrrQLBypjhe2aLbOL5ucc0aOFIkUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NpDfripbkyatL6QVEVVFjwSkse3nqVsQQgmSxty+7kmXw9QT/50vqZqNrJYJ2HflSCUpV+ylr6ZoLA4QAow942OC8X/8/ysmkjAkyuHXbQUNNLDp+XnA9OFDMU60I08BjHe3DUmg1oA4SShzzoKIV0ZsnQ9fsOKt1imHzr8879M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EX7/kNkQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EX7/kNkQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so36951165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790844763; x=1791449563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI99x6iXcwFo3VPCWbeND/NaXUPvhkaFwC0UtW3R7XY=;
        b=EX7/kNkQRXbZobGz8ZWRft9yY/Z44bS1q7BKlfoOQ2KFX8hSt1j1IO8DB6Y7QHfhG7
         mbzwJptHG54u5PnNFkWRnXuXO+aYm61q1x/JFsvcXwXjt/jP2UHxaD2PIhpghx/qE198
         S8WCA8kyWWtX5rL4jIZmhXpAwKO5E3mNqRSxznYZknPmSpHUw+MJ9EpP9fKftoqmAh0c
         qrXm7/68u5f2jpgbXJAHOBdmhYJGE/ncXvKtBz4EJn/rRu4c5B1fA93+WdahDPceZeu7
         lC+Q47Uki99bseTHVNozmk5hG4n1p2RPbBhLG2xZnbQmWGPz19vvZYXQ6v+ZThv4iCcI
         POrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844763; x=1791449563;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XI99x6iXcwFo3VPCWbeND/NaXUPvhkaFwC0UtW3R7XY=;
        b=KoH/9W8wVpwBunx0hh9vCQ48Obat6ncBEVTzzRxiR82Z2C4W69607WxbqUkT/7/D20
         KNaitqAcoDRNnLR7qY9zKhyE8D4g+4dKR7IFLAZ4kKKel/VmZduTSbHMqXubaRFib05z
         q+n2+IWANkYoiTYfqUPjkMbTkHKvWRjyYPhf7VcrfWAYOieW3X9X2zmzIKDJ6du9oP2i
         b0QRzVeIgLjfD9rDCIt73vVH7ZBF0uaoyj066xRK6EvOJmLXhYnTYYmhcguqolggjLSK
         RoIVI93F0LlEieFAb81I7kKW1zMu9Uxx+h1PoS1bh4GSThAgniHSuk/phFhjnS2c10kH
         /sgw==
X-Forwarded-Encrypted: i=1; AKwUvBw2iR7WIHU0li0r7AOCCSuRa6TaZpu6VdyB00S05cB5zvMvezqz3FwtJVypn32NBC3Ie3FlCgBq1kH7kR4=@vger.kernel.org
X-Gm-Message-State: AFuF++mmGvfe0Lei2JYAAMYqNgw2Q29lzUqTnhgkFthYkSQMV0oS7EX4
	ttQfZmQ+rI3HslHu04BX93qcUJOo61shBbO+wzgfZDqYJI14Vcu6YzkkkiPpDWAnD0U=
X-Gm-Gg: AYBFou2YxAPWWfNJE8B+ddvksziMOB5YT3Zxf/B+EjmrMpa4HQcVqyviv+WNvXOBRIG
	KHdro+qcowvLGF/Kqin5znkrRU8CLoRNpnlu8ZNlDYwt5z+BSVkfi8nhKX6SFEvtKI1uEa9QJAT
	uS753f725mzFyg2+L17YNMilSrGY+VXGXu2eA7mIXORA/CyV3XrQ0DNlizzi1Zv7lnsHdRA/1I6
	ru5LylRMJOpZio5vstSNncuSssigyfzsTOhpy0nQpC7/XIP7lSjGwtg7bmfLM2aI4M6XPfcYVJz
	TxIIzDf08Ellt/6TySiht3XDrRYYxDSvzlNm7R+6AUUFbbaCL7y6rsLPAQS6hXyMrlavAj2BvdF
	Um5Nv3YLb2LHSgwLij/2HCJ+7PugEbHerJ50g+W6dG50gPmdObx/LUsNKHsDd28LCpSxQsNWR5v
	jQxAvGFm2CM4XnI4irM5mNi8LFdXSFXL8YA5VChwrapiEpvfR8JJSHI9XPhgTMPzpim/8Z804Ls
	PI/fkLBRq1aenVmcg==
X-Received: by 2002:a05:600c:46cf:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a01f9e631bmr29144715e9.7.1790844763564;
        Thu, 01 Oct 2026 01:52:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2d732sm4569062f8f.33.2026.10.01.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:52:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20260930114907.153690-1-francesco@dolcini.it>
References: <20260930114907.153690-1-francesco@dolcini.it>
Subject: Re: [PATCH] clk: clk-gpio: do not blame the DT property on probe
 deferral
Message-Id: <179084474931.13445.4177948830664076778.b4-ty@b4>
Date: Thu, 01 Oct 2026 10:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=202; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aoLzZOMCzAOCOPkrrQLBypjhe2aLbOL5ucc0aOFIkUA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFn75KPulQkmTVsq57DSbLvz7Mmxb/Y3dGs4n7zjdvuyV
 otzUMzBjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEOZvhn9lDJrV7Uu83Vufs
 Vi33fqS36fmik8UnCkW4Gz7O9J7l/IuR4VHt0z2/rGyLk5eaZNg9LD7VGH96z+Wfjx6GxgkVWTC
 8ZQcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: clk-gpio: do not blame the DT property on probe deferral
      commit: d7e7f791c1997f500ad8a9b1f7e0855d61011fd0

Best regards,
--
Jerome

