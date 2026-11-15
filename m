Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782304;
	b=AIKAxrPfQLQfVQii0j8CQBKgv5K0alH9AloaaPTpObzTRCQY709kp++f7E9wem5kL018
	 yuGxN8oGoPBjquSN3YlF4+OLOE4i8p6doXedWTr6UMANpRzRSsHHMPg1EJPPf7fwO+gyA
	 79JJVAUc7GKSfjZJJjU3E1P9Pdqr/qhb5uuUgAn4Bx6GPOmANbTZlWoKR+7drcOD2Dfq0
	 fqM2xTNfyKhJ0zkSdaQ5dyNHiBxLXGyLxjRPT8tC54p3tQ6e+ceqwEXgGhQX/xOnf/kd/
	 DHLYNOmT+iA21AD7KjLelUoXZKDuxDAz6AZiu59Tm0HhJmDktZKHEVHxN+dEVEo62Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jP2BTh7rVpWo9Im/wV5enbfenEoL6kTHcUKyx3s6YMc=;
	b=sBcwHjVEe1bUoq//JjrwKcMRUEAcMG0Aq+bzsPq8O5sJuhiM3+y+eKiqlALRQChlrbLn
	 UNSPHeZbLx5YuxDL37a4SrlEvaadys4BTmQdb0qg6rn4cIHgf9zK13lM1gw5wSBLOs/Bo
	 giwozAflqpPPp7FupwhoJSunxQv/Dnh0kEYnd+F0j2OEEmjdaTp+SVszVlvaHtmlQn2KV
	 cVKwCkTvbMXmIbOqRUpAzh9/lQaV55E8GAD/UN6tHMZQ2zp0eRPwQ6AgSNhI7474GGG3L
	 oS2gIi1oJyR+x9frykw9gVI5romKDXOsqlDwqgZwQFs2XOypaIhWr2FKWBw5YB5pAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3lG3ihj;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF013606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF013606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3lG3ihj
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso3546937e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794782302; x=1795387102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jP2BTh7rVpWo9Im/wV5enbfenEoL6kTHcUKyx3s6YMc=;
        b=j3lG3ihjCmXBRSjnJqfN6ORSYkKfksPwGSeBXneAiBHnDt/KFj6KriUjeYuN+YiuXs
         K++zqwRNb760hiJ7UBo40cdx23MOLJ4f1kvArUpP358FKJPhYZk7Bw+6FmKzYG/w/DoI
         8r9a+IiyvkRU8BR6uhKUMmLUIr0jnPUncUyY28/0J4JK6wSG7U3pVfMIkUgHCIX0nwPK
         +/wlx0iNi7+k3XCyauiBMkhYq8F4xiN3Z8o/bjO2gC0c5fUQZvPVUY8ycrp/9hlbAzHg
         xi35KmSe/ag7cDkawGFUCb/G4pQzByS0eb1GIxnoPwvB2Wmn9ylnYl6XRcMdnHAf6vdK
         SDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782302; x=1795387102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jP2BTh7rVpWo9Im/wV5enbfenEoL6kTHcUKyx3s6YMc=;
        b=tEkNTFsn6LZnwaUTzdcFsy/4s84uuzvQ3k/ztFZWhkVNXoiiqtUK/bXkQ23k1fyeyD
         sgIKK9UVBh42TSnwHp/Y/3e8UOffR+1TJ/BEX4Du48FdiexLayYbyTQl9Q8FE3x02Mu+
         3bByjz27C1tS0NtRqImODtypCmNnxUc6om3/eUL9FPET1RNtNm3UWj2AhVXpuEOLEW0r
         PLOySTXODionsa6VbN7DUNKNyWAyhs0lzmPQp1cspu8TQBBcm8bOWIXAJdr2sFp8J1xE
         NJNkFpTWgSRTNJnLcdzPMM7KyMfabnpj4sJ+IrGjztTV43QiPE5gbw2h9JdbNbL/wOqW
         s5Ew==
X-Forwarded-Encrypted: i=1; AL+hErGJvwJ6HnX/dkmiFqdyu6TLsPHG/y8HmZBa7FbqbZEV2dEf2JytnbfZ2cTD/2RBWYXP5NIqaFyTwIL2cR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sg4VkdWgSNBti9/IgVL/SeMQuVx+1vlv9k7miy0zdTQj7gYek
	uXjqTJE9yD6VdDcpcaJ6ZgHV/JkoIsqVoZ7ef6+iUaWZD1kruLQPW1eeRJHKgiBj
X-Gm-Gg: AYBFou1xk88oJcYiG/hpFklx4C+eyVDxz1FD+xSIWdVwcryyzwJAToVDDphmhDEv+MM
	8ywelj0MLxhcZoJd0wd3SfA3agZT5V67bqaHHlMaI21j33K+3xu3UM3n21jmEkhXym3A1kiAfSt
	AeXli+ZImC+fFKsbeUJnA9V+7g5+wjLj/D9r/lhrcxfBiTSrO4Uh8sN7aupkN9WqvTNW5jhraqw
	Mw5Yr2JK6Df6eTWaWfq9lLszKP7/+6L2Epjhl/f4MJhFbpgl+J96zOSt9LfghntGEJmV2U0gvJG
	lFDv4dGoEfUOdNTv5n057jan5nqQ3D6Nd6r+L0B+Q5SQbECcjY2Gr32Uq3U3b/FH1JoA2y3aZpv
	kRp20ShMEKFjrJy477i4zxr/8XiBg80a9tekgaE99J1OQUQix5qOdvsG+XXog7RZD5jJAg0Z/nB
	3Ea+kVy3/2dYV6iz4jpyNZPNcRJEfPZ63q6/s91eMgC7HEx/61zDpbFCMCWLkJngDwMp4/awCRx
	4JsMZD8g4GK75T6cXKMxQN1luUhCdYI0sj0GX5tOddOD4VtEZdqKm6Ul5AiNutEKztHiZ6ZqLII
	40/5ccdRmNPJG4DlevgYKpIvtzUsdxgtus6IWCByX75Q9FyPnmb/OQHv0snpczAVC85otpWUVrk
	R4ovkfVphG+3FMut6gay5eOltOSZ8GEpn4kbxFZM=
X-Received: by 2002:ac2:4bd1:0:b0:5c1:4817:2c03 with SMTP id 2adb3069b0e04-5c164ebe9cdmr3717369e87.36.1794782301710;
        Sun, 15 Nov 2026 14:38:21 -0800 (PST)
Received: from yantra.. (nekmmqvelexmc8nt5ae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:dce3:b876:6f6e:9706])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171357477sm2759609e87.74.2026.11.15.14.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:38:21 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: Re: [PATCH v2] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Mon, 16 Nov 2026 00:38:17 +0200
Message-ID: <20261115223817.10568-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115203150.7faed0b1@jic23-hlaptop>
References: <20261113230241.82046-1-zoone.rupert@gmail.com> <20261114013817.476f8fb9@jic23-hlaptop> <20261114083525.11972-1-zoone.rupert@gmail.com> <20261115010203.2a939bd6@jic23-hlaptop> <20261115183949.11591-1-zoone.rupert@gmail.com> <20261115203150.7faed0b1@jic23-hlaptop>
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

On Sun, 15 Nov 2026 20:34:11 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> That all sounds good.  I tried to apply it to the testing branch of iio.git
> but I'm getting some build errors (+ a load of fuzz). I guess this
> has dependencies that I'm missing?  If they are fixes, then I may just have
> to wait until I can merge back into my tree (after they are upstream).

No dependencies. It is based on fixes-togreg. On testing probe
hunk no longer matches and with fuzz it lands in
dps310_fifo_interval(). git am -3 gets it right there and it builds.

I can send a version on testing if that is easier.

Thanks,
Rupesh
