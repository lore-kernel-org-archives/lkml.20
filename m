Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038401;
	b=xn/7ZQvSKHGb5DCj1vRw7QvFnAamD9FnnQ0InC7X3vLTbJaZ/2ugNqF8z70/1s4/sGII
	 uhqTJkExe7MVREOVjy6r1rHS6Gv0/Wb0RbLybDd2SQGSpM/k9cGfNx9xV7QRyHQ7Gssf+
	 S0B/oOIJrB4j271Tf0PN5mFRqwvSVIUdNPDp/lo8AldQwBaObKgV2okX8t0tjKql7ewYH
	 7tnEOeE/UUnyF5DhcrvtdK3H6avfORat+oBaQiFmxCS2f+j6nF3zAxCYjvZ3ur+re+k+h
	 6YKrQK61eptrknAxdmaeVh5eF/uPIQFT9+OasKEhZhcOWDYRcAvc1mj1bzsdkkiw6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
	b=gtYxqcrEUP1aR41CcCHIIC9yGz0jYIYS16xaZyyn7+H0eHNhL9NIi7K2PJL5V8V70sOu
	 uf1FDvFL9xTseNfK505ONIB4E8yugQyx6pdO9qUhgE7HAd4X9zxzqFHkgYE/9Tw+t2nTi
	 XrMKyNtyPlJDon3T74CONREnki9xqDUG43c8G+aexI3Q+3MI0eCw4FEhqzPyrXaRX2qBf
	 VUhEEqr6nNrOs4TQM25kFLOO6O0xKGr8mak2B/4UcOd+GmW7QucS4grWdZzQH5YJtBl8I
	 RhvYAoAFWCTRe1q3GvJRe/wiLSsSDbH7TT2rvZNVrrY24tGOBBM/oG5aEdNppMBzPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rRPxGZbP;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6817B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6817B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rRPxGZbP
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso1331576c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038399; x=1793643199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
        b=rRPxGZbPGVn2FJ12jwrjcJXx0sbEqgV8x16QjbOjNwGRGTovHCPRbTjS4AL/5uKZDZ
         7fM6HHndhX8cgK8TwhQj45CP5VrVAivXGbw2ImQ7hS0RCc/wtexajeL/aOyckxWOZsG/
         QJwDbNHIE1Vv30Rf4l13iGij6UjVI2WpLgSzhDsHDDYqHG+mwjs4UkYkumcEVfCKrWDQ
         2f4EpEfmP8X9t3otHw8S0Fh+D70U5rLmb2ob2K+2+sgfMCmuXsklt1KG7PBWQvO193Ze
         tTjs08cGFHn5atE+hrKqtIBuBBqO4ofGXBVARzveI42gu9P3xvS422gXs6dmHnpKzH1h
         aXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038399; x=1793643199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
        b=aj6El6xmhfq6z8/i7BqQOyyq4Yq94Ob+jSJ4nwai9vejyCRS3WqhKDHRykpmPe1Cjh
         KA9Ys1tYhl7iBgpLq+BqIUIzxCaGXpRm8C8/jN12TwmYSULM4SqyiBTUnu1PhO3Y+3fJ
         vhO+1kUI14cZJXg5FXt6khRU9ZSMg5i12bh75hv7KbA1ypvoDo6Gh/ACiuwcDKDib0og
         K4Nhf19yZz/05UXa55NWWptQiOA7Sk2NQJvYl6Yo55psMYu83D4ivUMrwn2rpsncFZkg
         Rvr7GCer54CEPJYdgHvM7bAEAAGiDAJz3Bs2ZScgpajeQm5JksJlZADH3km/YQCw3IFU
         1fhA==
X-Forwarded-Encrypted: i=1; AKwUvBxd9gEUmijSNnhS7Yi6JHemeO5RQ/v+2W3gkvL9TpxVNxSw5ekGGBJ2fFNT6lGChcyXroZQ7geb6Q2GEts=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw13E+si8NhrceHy6ijq98BmVDF9mYCxwde/+qd5jU3lC6wWF2
	qIfyybL+woOOUDkx+8Fa9eudWIHzp644CIPVgcJWDa4bXBfykYI3iciVvRSAURJBQHQ=
X-Gm-Gg: AYBFou2yVr1jEHwLahEclI/Bth96V4LbWbvcJffYLRL0Sd6Ezkm3+hd5eSkmmEs1Uqr
	bNVbpmyX/n7qh6bQKbbOLfupVcwHPR6rXJNHLYTFqB641TSIZ7vKoy8qfTT4QKMg9WTWqqwfsz/
	uZvwwbvZHI1qtol7zshvLAYrR+ATTohd06q2u1ao7T4hHdNFSbGILBBDP8LTMp59Pofn2P4DQhk
	f1/uGFR9CnV4VHgRGUnZMitQTs+3Gv7j+kVGwgSxB3QTM4HHqFHkvt4UXk8dRQx20v0GK6GbKnz
	PRI6UzRR+y4XboqkSP9VAKgkSuar1RFhxS8oSRbcZSagrqgSVbkMZe/L2fhRi7t1mOuFM7TIJS4
	J2EsIFuOEJHtQMnAckW22y2vmcXKJ6m4e4cKljU5oBirx/KtusNi/akQ7e+AvcridN53+cS9Q8M
	oovjIyYujlwhJeWwjmQiD+kXfxwT1KqPunUWj2vNmLeC6ifvcw8DA+Hh0GfDPY7FjzlmbHNYNqt
	1vnU2FIktb+1ngteDlmYmsb/yw8kiEG+dKwZ9RmIj5Yl9ponF+QIuN9h04w6rDmBCNr0WON7qNU
	8ZrdvSKuWf+F1KKCU04ziXSkgOi95DTVOxA7TLs=
X-Received: by 2002:a05:7022:2227:b0:151:2068:e81f with SMTP id a92af1059eb24-19937022415mr16449905c88.27.1793038399454;
        Mon, 26 Oct 2026 11:13:19 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023144953.3584118-1-cleger@meta.com>
References: <20261023144953.3584118-1-cleger@meta.com>
Subject: Re: [PATCH] io_uring/net: Remove useless min_not_zero() usage
Message-Id: <179303839876.792754.4345795661172032065.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:18 -0600
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 23 Oct 2026 07:49:52 -0700, Clément Léger wrote:
> In the else arm, sel->val is necessarily 0 so the min_not_zero() actually
> always returns kmsg->msg.msg_inq. Remove the min_not_zero() usage and
> replace it with kmsg->msg.msg_inq.

Applied, thanks!

[1/1] io_uring/net: Remove useless min_not_zero() usage
      commit: 70884ea2d636611e547f3da85fbfb8aadfa2ab4d

Best regards,
-- 
Jens Axboe



