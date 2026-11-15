Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760581;
	b=fh8no/K5uZYjzpnUNKs9+Ymt2262BnVJJ6Ckrfd7eCVr3Q6nXiXHgB5MeXr5tt/Q52Ge
	 kswtqcP+3qKYhpv6DBpjtcXnPac9lXnTepeuVKoyaFpJCTPeoU7ir/Bt9U+sy1EIzx2ip
	 rE2jraZ6iwS4UH/ka9L2+aQIRmfTRl+NiDzxDDrCX+v+j0V0eaW2917jdrSaCaUOm0bTX
	 gDBsru7co2sL7si1x2SGyKoQg8Z+asAnUlCJktvTRyLvS9zX2eu5SZMA17fKwjfMswVxP
	 50+g7ETbOvd+d5v6FD4yNofq1xezU5COS/v6cmqyjUWu4CluZQd/l8m3kg77Y7Wo4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
	b=ULuIxUec0K6sWdRyHlo2k1SIm8p6nmLgfYl+LlyLceraAl2KUcpu+flwSIO2IWUofpbN
	 6ChwBEL/5M/ckeVf67Kgot8ZNyfJ+2cij1ztSSdCvXVKXBkXpWspqCijOoMokDHE0ZNqt
	 YMWQLe+dfS8BtSjvhEs4JMa6qS9PG89GqQG3Do03y3ujdkVEi05MguLWbl1OXSLbqTvav
	 a3P79w9d6nlAiwQ42JOH51y7Lns3mn4L9RwtQi+oeOsDE6wpj/S7DRluIa4GpFlSuUqKl
	 4TCQ59cT49JVxScD62PRPIPZcMmWeuE78fYmMEVAMUCvXSKdYhbkwd+TSs0WzUgdNJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZ80BckZ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E746606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E746606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZ80BckZ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so3864624c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760580; x=1795365380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
        b=GZ80BckZmfwrmcMdj7bSpBMIGvsoD3Kn+Ub0cMxLIKcCi9Tw27r0AykRfGxQkW7tDK
         e9Ghja6TTMm26IVf2LEmAPmg7prXOrqOYE0cW4AGBa5B50zTwJOMKuvGVMyDXiBQpUm0
         Vpq+DpxddJnjcdy0BypQZJrQ+iuaG/8i6cMhTmaD3ejbQSE/Dl4ryRliIdndveQiNLZl
         MxtKJ/8rDP5pIWN8V/p1TTwYFfahZpYlNruLmBnI3wub/2bmcC9dNa/ZxMRLeceNfnkq
         P5Mm/SxyZYtYT224i6CMynOedIWpObed+V5KrYL55+w6Ndf7swwVuLPP6rC0Ozmf3eA5
         jMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760580; x=1795365380;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
        b=HwJsZZ5G7WzciPIgphcsVQg/vFhQa1TYx2x6Trsq5MRSU40FbRI1jyRgkc7ud+yTm1
         nmXGNv2HlnlUTKx4qX0OX8UWJYSlbIu0yd55O0DzxuSM+CZmwlmRL+DhfLCrDp77Ga+o
         HzTMRxQCjq8o6PLCsgP4mZgLZoyI2zzURnkJg/prLGuj0LOiWZb9nHjEjLJVTaTWjfhg
         ltiK1I1DT/aNBu+uVxnexcb1w0q/uqPjMexAFmKHZRJ8cEZCH1LzVqdOuFTZBw2yEBsZ
         Cldzz/O67qut80FJDF0XpeVvfXucYuziG0deFsiVrQl19Zs5kqOpZ/GexmQ0Z5ZhugIw
         LqZA==
X-Forwarded-Encrypted: i=1; AL+hErFd/w+abkGhGAp8YGERZLTjh+44kxOqAZPEAo5C7RGENcZBFG0tZZ8i/X9cTJTuXtJqJ76XSN0gT9YjbK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEB24JW5xLjIDS95KbyjJ7/yGUWX8eCuAHwH5xKLL698Yxgxt
	qrpdtvBHUd0lT6XiB3EW6ug1iwMCzLcdmwWYkxpJ/PLBVrApQy+KyMpJO4+UAclDYGo=
X-Gm-Gg: AYBFou0zgfCou7fo+aGrgj5xeBxS7eeitvLB8ScAv+DdwtG3x3TtvLBs41jIZFs/VwI
	sA2mKsVNM+JuYSDAJypCNBgVQi00qtFhWGtjEjocpsELWpy23kNnPtDVKTtMO62cKYh//A045rj
	0Pf5obsDTqlbq/tN/ARxju/2nbGldWeOQAzdszYEXV25d3YZLUDoADvD3QVcSGXgSj4qRSZEFc8
	pqakP+Svecc5KbwcCmncCAU9ONw0w+CokrhrTtIfoGxrs1qm9ZMoPnZ3hILBoI8ByxB5hsG8HWr
	c+IYkxnQ/3kTBGSTIfMP5QO1e2H6t7M5ncIVyh/LamZk2kzxVyCFV7qaNYqeNkbNtzH6asF3SQ2
	jZezO9+5XKCqiIvHgXSe3EIco6RvQ+kMKFvTeBJtfPZSE0eRutStetREMULpQRna3JB5KFVclmu
	CSL9nuee+EGDB32KNciCWK2UgTycJKOClEygtAs0Om5vYbXWf4VGWyV8GHlhYH0a3dTcFK6Zytg
	pCXAzyc/nzOkHu3cGnYqbIMpE2+fO/Eh4yjXCMI+v2bTuP1T+FmgocnDYJ/SWsHLovMBxScjOhg
	DJXVPlLr9vFj9OI3AY5vAi3L/dRy+iqvXbE2l96b/cVpYt6fJlj3Z7W74gGKOyHwHP/5
X-Received: by 2002:a05:7022:f211:b0:195:9228:50a0 with SMTP id a92af1059eb24-1b5030f2c79mr8305725c88.42.1794760579925;
        Sun, 15 Nov 2026 08:36:19 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm24135548c88.2.2026.11.15.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:36:19 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] io_uring/rsrc: failed file update still removes the old file
Date: Sun, 15 Nov 2026 08:36:12 -0800
Message-Id: <20261115163612.225619-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi Jens,

This is a small error-path issue. It only happens when a fixed file
update fails, for example because userspace passes a closed fd, so it
may not matter much in practice.

__io_sqe_files_update() removes the old file from the slot before it
calls fget() on the new fd. If fget() fails, or the fd is an io_uring
fd, or the node allocation fails, the update stops there and reports
that entry as not done (an error, or a short count in a batch), but
the slot is already empty. The old file is gone, and if it was
registered with a tag, its tag CQE is posted as if it had been removed
on purpose. io_install_fixed_file() does it the other way round: it
checks the file and allocates the node before it resets the slot.

On v7.3, updating slot 0 with a closed fd returned -EBADF, posted the
old file's tag CQE, and a later fixed-file NOP on slot 0 got -EBADF.

Moving the removal after the new file and node are ready keeps the old
file on failure:

  -		if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
  -			io_file_bitmap_clear(&ctx->file_table, i);
   		if (fd != -1) {
   			...
  +			if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
  +				io_file_bitmap_clear(&ctx->file_table, i);
   			ctx->file_table.data.nodes[i] = node;
   			...
  +		} else if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i)) {
  +			io_file_bitmap_clear(&ctx->file_table, i);
   		}

With this change the update still returns -EBADF, but slot 0 keeps
working and no tag CQE is posted. Replacement, removal with fd -1 and
SKIP behave as before, and in a partial update the entries before the
failing one are still applied. In next-20261113 the removal still
comes before fget(). I can send a patch if you want one.

Thanks,
Cheng Yongkang
