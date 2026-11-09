Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203502;
	b=rHJ/aLAIXRuyxd6LMVu05egZb5/6Ptaa4KAq3cT9sG1xX/cqxKgYttpVlo8MIAboM3Jy
	 8zwLiHHFjLPi6754WrFxCy5jwF/I/NIk7nxykztWVbKzEy6KUySSy/v9mVq369+Cki2O4
	 4Lr3H7gsElUkZ1pwzmi/8JseAfQLlNG9dR3Mogd/JmaTdBX7PYF5kE/1olfEsyJ61Cx6t
	 fcgbBvE5QHetd29/+HTJH6BWG+NstYI2NopN5MuB+JziGv+1b1gU3hnBORTxDOC4IGzx8
	 MlaTbO/bBFjfetZLnrYOCHZAE/KVhMH9PufUZ0iLBUvIutySnxh9Wu6ItlUnbWa+AAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
	b=sofDVWorPCopFb2Rit08wj1h08p+3kG8rOug4LrLjwQFmtYDNoqNfK9wXVmE5ljYqfvW
	 5Ubmq2tJFwGDyXf5VR2Iw/OIDvEzE72s8/Hsa9lVA9HCYSmSC0D5EPjsTvyuuxYUuc8Ty
	 R9FhWWtzkomrpqsfWw2259mxy967ZHGJRuUlLrexjH6+rC554UBHaEVhkd0Idss4LUF99
	 6WudiVrNW6ZR0IBwKtodyTenrqHYXqJ3F6EkrlePC7R06L+wnpVAwWrSTecT7cJwqAnNt
	 WY5/pKmb7JPy8Ob1cfWFen+RohXwovwGUGESVNprjJSXVp9Kpo8cLXg3U/bUcEhHcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+Zvmbrb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1F606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B1F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+Zvmbrb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so372755f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203500; x=1794808300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
        b=J+ZvmbrbSp6HgpM55s5hsdETOnQVnEOUXj37CM0+BnoiyC0bVccw62IO+vNgVQDNxd
         dRcXFLUd2KB1ZcJv1721fx2SwGlNTFVgVmqqVgpHgzQjJY5BxFVFYDPOyYxhPjjdx1hO
         pWBPIl3kwgGZC49jPoB9Tj4i2WbysXFjXpJW1g/vdVcJO0YF7xiYC4crpt8b78AkfYau
         mTtSjf5jZGamLZbglSLJGTVHyl5crFRK0/Hn8dNToWAKvKFu6LktDHi9VeDA0fHcKqkr
         QFBDwHtNR4+zh5SefJNQ6OzgSEJY5lL1EVZCP+jjZzLZ5Vx44wvgEWOYdQVgB9oMwL7G
         lcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203500; x=1794808300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
        b=IBymgfIdL6fm5s74z+CbvqnuyvwW/+54ebVhp6JjWdbwrS/jzGvR7SzmsaFnuhcCS3
         CjVP5NY5egbU2gzyTmOnr/c75o1DnLDejoUSiyozdMbcVUT0Up/ezflFQPakE54sLl48
         omIeiOInitrrVhRGsacYzAt+rTCT1UaXw4UtF7m8QXsAEpjgklYjqqBF2AqwcoNahWk+
         lpA/aTTMiGiJ+JqbwHMOJtfr0Pe9xcXsRuUmtzWI3BB3Hhh5iqBOhkQOwHRknoGBFCUm
         qgQY0Tlg8eU1zhnHaXVJpO9HmFcDTKVu80XkDr1vk2De9g/dPcYsBvHZ2C2spiudmFB0
         KgVA==
X-Forwarded-Encrypted: i=1; AL+hErGMixWsRli4j64Ft9vEN8zeyAksEpbX+B7qeRxsyxIvflTTohHDq1kZZlHhGfsH/H11YnbZyx+DcJZIxHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9LUc+r6s7K8Z6aCOWnTMHTFTE641CLt1wx9mE9W9CTL/RY/td
	/2i0k1BU6cx1XO3ne/mkOmBKlZtyEXNY5vDNnQswNm3nUfM79SvZFgpR
X-Gm-Gg: AYBFou2y9PeVo6xC1mSUqMe4IDuqF7UMzRa90fXdDl+xlfMrprZGKIYefmVnJUVm0sr
	qYOhh8oSz6bWS0toJy06fCA4/tUzE3S7ftkNO0TiCbTMRhqnb2bEgQ9OcLLEvpPu1CO+n3JK6GY
	+czsAx46ernKEWMtlxNDGuqCm+NviMiyDm3oa/8IiKteeHLu1QAYLqQY0bqqjSIIdEAtgpoq48k
	Y7X+LyGU61f0IySanYP/Kz7jFEgodd91xN52mAWk99R+vpSsx7zsjEqevWRE3HDJoR+tAJRgzlN
	/qTQIVqeBnKQlQYps+o+oZeiv0gicy7Xq2+6oQ607TEuQMubkbz9wRy79OJK9y80Vtp/e6yBZqf
	r8I+UGG5a2Qgj3ka0HOM1nl80wURQ6XJIYI4i494tIvuATkAl3tgC5v41g8YuFq3GxxvxysroJx
	QgMFgeRnqtur0Co6Z16V9a08JTBTXzogJm8VDtUMUJWCen6nFg83LaqJvXLWEs9/uFF9a3QlLp/
	vIsHPySw7nUbM6UrYOemz0Jckksy5Z7ftoV8KIylX89Y/jkS8dC7ISp5vneM3QVN363h4oSoTM3
	r+DqyVKkQVgivoO6Qg4TeBOoRHdz55JjvUmCE6SUoBcIKGQzGm9WLzrQ6+wbUUkudRhYelv/QKj
	jYKt66mjqxFr8UP7tEv35WJbnM+W3xcgPlVMx1RtOctcwJM9zvDXvbzjE0AJp9IMe5g==
X-Received: by 2002:a05:6000:4614:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-4958ac94f8bmr5349051f8f.13.1794203499894;
        Sun, 08 Nov 2026 21:51:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm7968081f8f.47.2026.11.08.21.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:51:38 -0800 (PST)
Date: Mon, 9 Nov 2026 08:51:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newline in sysfs_emit
Message-ID: <avFfZ0-IYSlUhk4Q@stanley.mountain>
References: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>

On Mon, Nov 09, 2026 at 03:41:26AM +0000, Priyanshu Singh wrote:
> Add  newline '\n' to sysfs_emit() format strings to
> resolve checkpatch.pl warnings.
> 
> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---

Nope.  Search the archives (lore.kernel.org) to see why this is
not correct.

regards,
dan carpenter

