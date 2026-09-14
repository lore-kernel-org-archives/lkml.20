Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D65544781F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389589; cv=none; b=JaR4xqfyx9yL8EtUBMSx0XxgigR2YxFcO9ccLEWmajh+uRWtedtLZyk+30eK8qneeVQB9ulRix6gTMcm6poFJsHnLLKOAO4FBDV94bKV0HqVvyuwIZwrjqbTM5KmGcFSkCB6mwCDtKYKuV7ibNipGpY3fOxC+/TJ6uCGS2yYiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389589; c=relaxed/simple;
	bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcLOUyrrssGznQ3b5IPwX7Ua9OKkg93jLlivxcyjg9b5aCbQms4UkZ2rKdetPsnhIh7NnLbg0GbGnI5p5BNTHTEgjtB4BA0AVeFGL/CqXUksqNxvqCBOnr/wmZZRqE83BhoYkdTIZGCeNwXX55M8/VpFDiRCqKg+pWz3Rn2S3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm0R0eCr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm0R0eCr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8813745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389586; x=1789994386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=Mm0R0eCrqc7dKBJXEc2108LWQqYgHpDh2NeGwHjyMgkW54IsZ06E6yNGBfXYXAhyVV
         HcCpkcfmGLZNmtzcmnS/4kaX0MTP1rA0ZugIlLG+G2wAH3Jm/+KVxfrLIlzpvqSAs9AH
         1IXOj9Gfq0kJfT9y+m2ioAbKnSgin096v5Oxoha8y5URiemnRYXp0xmU1iQZhpVNJ1QG
         UPWfPU0Rr7uWnYBhymIOS4Uos8DXtWNZn0jVR2exlqYqiV8BwT4u5Dff8B48VEOXHhSA
         inYRKxJiFtC70nNf+nnwYAI6rojrYEc2boOB77bLQqYzG1IOaDHqOwFCwoXq431Zyc/K
         2Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389586; x=1789994386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=j8CGfGSGQ5BZ69+wSx3lfdUg1xYpPT/CaJv/uF6hMwTw4P5k+WxdLyDw9ReAlbpadw
         YMvTacWiKwWqf40q+IzjKVtY5vym1IeAA7lxeNFr7WqekcANIxIR4cG26I+A15kGPTe6
         9zsG41/VUj+1osUqbvf+cUIn/t9y37csRwYCRsiG09NI2ML/tySzAU1d0cYpyQgXGSC6
         9NfXe4pvP+UiufhL1Zj63vbZdG3fdcBPEWVzUK2LlJx7oSqAZoXb9zyDJpGwOH/RszLn
         sz/zKWMG7zzxTIIFvMVMAc1TCwIbf25VQbkyhvtx+OKhKbLu/zT99CyyuM5tra8GD2Lk
         bbRg==
X-Forwarded-Encrypted: i=1; AKwUvByeN2MXIsWYgfX0WqGhZW9gUl2N6oqrdg/SB++RzTAUFs7rD8I1J5p+y5K305AqrBhkdglP6a56onaxaZk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntWfm5qUyiA/6SOx/5whwB4xgKj+2qn/ma3Ma+UeAxSLrsmIGC
	X/yi+C7oE6Pze8ot5JJpmuwsEbeLVwHMPERFcjMq/IsNwGvu3GxPPmRl
X-Gm-Gg: AYBFou3rtNRc7SbUQLcpoyGzXMQjt1hGQqXKrVaVpsscWH/xYnG+yKtEiuC1qo9O0wY
	Gb5u8WU2I0qlPTn6SZOtAa1O3yiPRqhkTtg2qFvQ2hkKQrrg89geVkPqChVynXuy4KtCzV19fVv
	uLNFYe29rVtgteJpKDIuaNm9dqN9yUrfZxhOHgQbEc3aVEGmTIhmzbTgKYd/8Bm2ta4QPVyPkK5
	gPWpnPYPWDFcHaSqquemYuYc3+01BS1jhzWtQWuxotcETmVN93CfUGFa4m42tKro8AI5dI3ORMg
	BdGUn1NnfuBNk+NOzB+HOya0fc7E+JFfoeH8+pvl8srIAy8nZVl1Lprd1uPNzhz/QHpn9+UZ4as
	+Qf0ovS9T235OZp76M9NT5VuJPmqb/CqQXHJCK/X/6t1EAugjXzjQsdwkE3QqAFVpK+6dM61S+u
	v17WavvVq+SghjvjDaOzxKPYG7ryJWNC7CIT1HZpY9EmoTGXqApbE+SIDR+dyBiHqeM1gH0RNle
	tI3
X-Received: by 2002:a05:600c:4f41:b0:49d:38:afce with SMTP id 5b1f17b1804b1-49e7a6868c0mr31405635e9.22.1789389586006;
        Mon, 14 Sep 2026 05:39:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm26035194f8f.26.2026.09.14.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:39:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Mon, 14 Sep 2026 14:39:44 +0200
Message-ID: <20260914123944.149806-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

On 2026-09-14 Linus Walleij wrote:
> This looks like something I could apply separately from the rest,
> can I just queue this patch in the pinctrl tree?

Thanks for the reviews. If it is all the same to you, I would keep the
three together until v6 has been looked at; gpio-mmio depends on this
patch to get correct answers on Vybrid, so I would rather not have it
land ahead of the rest. v6 goes out this week with Haibo's comments
addressed and a small pinctrl patch for the CONFIG_PINCTRL=n stubs
added. Once that is settled, this patch can go through your tree and the
gpio patches through Bartosz's in the same cycle.

Best regards,
Mehmet
