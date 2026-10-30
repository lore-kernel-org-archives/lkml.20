Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365668;
	b=bGtuX0SqqikTtYv54aBNTq1MxxkUewIFv99tf4wPKniD1bl95Pa4GJ0pyu+gqfWb3Kfk
	 RLqaZg4qRJWWH1n8LZCCx+33n4AVvBfxCrXg1uYWPeoaNeButuXiDTCyl9tamzn3jfngu
	 sXOfOxCXE5v4QcfJ/hyaKK5xKWqQF09T0K3irVI4xrtN5js9v8gjtsMkv3A1l2qQ9zxJC
	 MAzdddp1LnH9sBUHYtUOtzrQrgY4GQqoFz6v+7Bp+uGDU3c+NydB/wQqJp9byJq6RvSE2
	 u2Flru69tgq4ww7JLpDSpuCGaA0nnMqSq3Jea9u/AJK/rrZhiOyjYnaSrizkvCJRbxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
	b=dUDXiHfCkNHVxSEuQgTwLCdjykMkqjyUjDlGxX1/YiWcjz9BKshFn+yVw2jvFn2a0JBo
	 FgNgF2Nw/NYPAnHFnlmruXFv44yXgsOH4w4gDWfqtpgvkQaI2oOH2Wmj/Oh9CWXwgkNPw
	 kXrjxRAcZa+J97LOggcWIJ13m82gqX8d02xw83ENHxoXpsrc6vdn1dkKDu+lcHtjhSOnq
	 2dkbbOWPrcssHlIohkH1XFn+HO3Kqzep7bp/fPhQ9x2cvNNGhH6sozQVNpDjheo2007zB
	 U1mPiNiLhKZvrlIB9xmgRk51qI/aJoAyMADTUsOZsJCEuGZhAzQRSjOVEkq+3ZZtyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso308069a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793365667; x=1793970467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=kAsJs6idydB45DbKxh0swYdwPWoeUoz1fMSGuSg9Z10c1chhaLoD3NptrwkZkLa8WT
         MQDu5Iguv586MYJ7G0ZC8DGNqd1vZ0N9puv6NuMN80cQa1qur3iLqUZJRGjEIVUkhWKB
         7XrW5G3zFjWjGzpZl+GD78rr14kcNm2HU98isJRTU7hjAslGu5Cb30150/cSqUDwb523
         04wscuBw+kp8Y3+caUYCmfoq5q3eSp1K3mjObUOV7IAk7OaBJAhBvv1wK001+OnCURDa
         BnqqyFvr/lkDI0S8TIpcz+w1RWkBFKthZFRYkm57tJkBwAhVJdy67PyN30grm8vXRg7v
         Y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365667; x=1793970467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=L7/7jkzji2GxvF+HizNyLvUvNhp7hsXMtj1ok61MNCxUGslNjk5sBKKcQpeTVpYUdM
         JWdR14vb01RT8ahJoKmomdObPn0DBset+m3g2hczNkYUXwXeKUYtxH7RsdbQ8Pm/wzNq
         mgVMyEl2UXsmUqSo7YenJRQsbbZdy82sH/91BP+2wlizTMBLHUoOebaZkNj3CfwahiYM
         +CBTHkihygtHnY7Q8tIFH8v+BBScXSatxgOxUlon83LKU+8YKswV/kKzkSnvFSihJniV
         xl9qyNJTL6C2rVExfdyHBdbupFxYpWD0H6Nt+FV2PjvyCN7+V9E/mcsbMNnIsijF5572
         qlUA==
X-Forwarded-Encrypted: i=1; AKwUvBw4rXtKCBfv2G2VrB+nav7214e6eqh9FVNqCqytrwwfhHnFphfAmjkdarDFwk0+pw2mpUer5bjlGvK/FlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfD99wE3Na7QDJFbf6QMM2c+z6Dq6OVtydDIzU5g/5vHSRdzU8
	mYmGUz6zCwCB9W9MH6M3zx/Omu/hzcqeKMiL2KHbGNPu7ydnx5r5n5AitME7H2f7SA==
X-Gm-Gg: AYBFou2oX/FFkX6Kmu3vFd+RDmun+AaRnhNR3dUx6RKnwnLNP2FBt6+sOYgJdbnuyVH
	MUGWJXxpSz1t7+otaF7JfahN87/TbvbUaGTINkst7AHASIBgco7DwjIRlvuVyHbk5LwoH2KGllf
	otq/ZGN5+3S1PETQnwoTTejJQyIL4fRuA5j/Ua81xyEa/OqcfOl3ajdXdtoqagGBdviUJrKJB6f
	keSqY5VMhN3ICSOjhnQKBXt66vvvkeLzg7e/lxrlGACJnHz4GfTAetexprOrTzFcRlyC4uLYwj6
	xLcDGFktPXY3edbeug8lhxU+ViwCVCHMt3XOb5FHRiZwejcZnNAAgqhGvS477LvuykSIrpwxnaL
	EUX40RFxCJ8qQDpQW9p+W3wFzzTxGpDr6ErC6nTMEIDAAFNF1SK2i45Ume+2s8NNLqFTu+QkCjV
	vKIJdPbnTEUdIWMuUEarPUGgc5vXHAlPZYDhZfMPY7OUlMNCaKTCneuE/rNni3kVM5TTilkyoxc
	vPKtwXyKpkcGzy8Bo7+UihQOePmXcNUkhnNwOzz1/09ekAd2dDJm072kjnspgztGXRTnZ13i8UF
	f9LMF4juzEJA8jmbiEGy3hLg/0hYBcrWN4+kxJS2swYJs/2pkJwEU5q13JdSBxujncD17kLpF6j
	qfkTdwspUOQL2+dnA
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr1634562a91.48.1793365667017;
        Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm8733413a91.0.2026.10.30.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:07:46 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 20:07:42 +0700
Message-ID: <20261030130742.3211592-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
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

On Fri, 30 Oct 2026 13:24:49 +0100, Arnd Bergmann wrote:
> It sounds like the underlying problem should be fixed elsewhere,
> possibly by preventing the deferred probe to be retried each time.

Hi Arnd,

Thanks for the feedback. It looks to me like it is probably possible to
fix this better in the USB core. I will attempt a v2 fix that does this.

James
