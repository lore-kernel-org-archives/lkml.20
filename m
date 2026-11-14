Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632467;
	b=YYZMxAYnQJIuCrOOyv6NyKD+RExQiMM4fO4t5/tVA9eDomDGhgS7yQQB7m42hMZJQVsa
	 uAIU5O/iXKwl9ysE5L1DqQ/8Tc3Gquy9sCiCkufbw9rWiNkdOBBUG52ikHIMrULg9RH0c
	 byrRLfRfqF/E6b/3SHfn1BDUSuwXXsolJEk6xmqBlyOzojlX5jKnH9NxchlsIp011xQ3s
	 jKhgAU70gCLkWYDRjYgKXHNMUJyuYHH7m962oKd8i4l6o4T2BXZXU7FnmEEjk0SEyRDb3
	 swaOpG69Y7w7RYB7IXsoVkZ1zcbfpkvUiHt2/UG+MyhWPSDVHMYwC2u8/iekvgsALfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
	b=oW1KVhhpdrn6Ods5AzHoyg9hNSeNAsgSTnOLfTtbmkw/O7qPIlYhbY5bYCX3wZgnMQPt
	 X7f7tTJrx1tqxlQVgilKtaU22zlxsbF7MuaglYqfoLSYhu7SM9BOpf3nLx8Y4NDHuYGBr
	 AdysP0xlKBoKbhTe7I1lakuGyhmLiNrwI31PpToOdXEGtOZeeuA1J97Z3pVnzLmdqGLrl
	 swEc3Gduui/mqtfqXjltpvEraqEMIHFHV2Sr8lNcN94VUD0Q+M5caNceJCd+0AJ9iDfVD
	 yI2eq8uONLjGpn8nayPi/wIsBT3JBN9l72I3uPZgDrb3SpMQkqYVFjWw/lymqH2V86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gwsh/icK";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E247606C213
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E247606C213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gwsh/icK
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso312634a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632467; x=1795237267; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=Gwsh/icKTb3/QeE3A1s1aZIu8OXdTtXq96YILfq9P9Pawq4oro8j7iFiTyJay+5MQT
         GwNeKlopwVlq3/w99sAsdSX2OodzTlHh7EQfv7LxuK8zLWq2Km3NK5Id5pFE7KGHhTda
         SAgvQ/60PGQmDUhqG0q6GHqjq1b/p5aV62QtQwE1r4p/3cuIUNeYoebbkV3iUlyROj5O
         PUyuo3sefMuLGzwthk6k0R4S+YZAc1aT+NteSikZ6qQEHY/d96/eDgR+uNZCF2rowgqK
         hQulNaBKvYPdblAl4AdaOItGpGUs65u3DySK28wIoGY1O0LP2zzbreieIfCIZLDhi+8/
         id3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632467; x=1795237267;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=M2t7+2aJp8P9Y0ffankv/cF3/gBrrRlpa9l5c6pPxqG128AXdm3go6Fko7Ta+3AGpk
         zS0mUruiAF2jarYrwFN0iEKHJ35sXhgxH0jWUS56C3JqkhCkMTgyjWllgzV+Y/io+jib
         CxHXwmLcE8R2y74wzbB52umyVdcW1gkVGQJGLQ6qVlVdBZ855K14twSwiagM3L1kBLfD
         8gqL7Hu/cAK4CWpYu3+FKE38743jetc8kRgffMHJa/P61q/w6mIXR4C01N3n4z+VMHcm
         WDbrj7pBUCp2T6dVUrvZFaY+WDZeloTnMUUFh14MEsFMPQK8S6ajQtCNy4LhKZI6lL/B
         jEbw==
X-Forwarded-Encrypted: i=1; AL+hErEJo+4+6Qj5GysoFg8j2ygXtYcbb6IpPJ6y8C7AGdVohzdOl1NEP9oTzlbZjz8wi7cnup3aa5GopFHXkYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wHI8DrjbTl+QDKsLKIWVdwNdvDTPSgJyprID23XAK+bDKRd2x
	MM7Dr3ckLLtIfWQpJtXEGxZgonWYtLWBoGsnQvgm/WeHHIPf0snr6uft13GhIfoOsdU=
X-Gm-Gg: AYBFou2O9gOphbbeuqpVNouk3D9WbInG6ESrd/ISC0wfZoWvNVHJH2Mu/6ZtjGsbilV
	zHLKoKOappYXo9Ph0WyW8T/Y7CSx9v+/1nY38lXUeOF96Ar8rQpZZnWtPcnFThMR9V03xdlaznx
	M8sztDBbDVdwRlS7VuvpHLOfeN+YLCwkSrGTTB4aQZ7rKlNWnV0B9tbpVXAeNox50bSskdutRJU
	9/FQfJN9tfu4ld1tDrt4zvhVnnt53tIPLVEA6+uvL9NQE5pc5Fir8z6nOPO4gpW1LogXxcDjEbO
	IgxPuPgI/A5WUZCXvuKlPfBq7I4trE5tZGh7KDXlLcih+msF7Misr1Znd50ujRBcbuyprQfFOP3
	v4+V+LCsXBTpwBNNDpuc4vO47cxxVXuE9eWTuE5AIU8ZkAxIy4rSBWoSYifa87k3aOzGJ4+5qsh
	Vh6UoZyIQqL8z5PS2d8xQcPeRor6PDT/ypio3q54q2fdO0To2NFg/7xuob3ZkUjCNlkHbtPH7GN
	7Z3yU16qMRgK2zSuiDFo1xT1iRYaGCkjHEdGiQ7v8y94E0CyD8ZNFjXQTOw2j01Ai4yxijOInQG
	u1tw7dHTUTgC4LaSPT/5Tz6HkyWXamy4RfqyLbOVaWSRwE25RMryty75oWANOdsErTAWemPofI6
	r4ZrEEoj6ql+Y456VUzv7qA1q6uI=
X-Received: by 2002:a17:90b:1b06:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b1b0a0e7c9mr7131064a91.4.1794632466846;
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm125917a12.12.2026.11.13.21.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Date: Sat, 14 Nov 2026 05:01:04 -0000
Message-ID: <179463246494.3611640.18079808669048880957@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Detlev,

One more data point for this series. On top of it I have one stream
decoded on both RK3588 cores at once through the CCU, as the Rockchip
BSP does ("soft CCU": each frame goes to the idle core, and the CCU
holds back reference reads until the other core has written them).
For a single 4K stream that gives HEVC 227 fps instead of 130 and
H.264 121 fps instead of 67, bit-exact. It needs two v4l2-mem2mem
additions, so that the next job of a context can be scheduled while
the previous one is still decoding.

I'll post it as an RFC once this series has settled, so it can be
rebased on what lands. The code was developed with Claude (Anthropic);
I review and test every change.

Arun
