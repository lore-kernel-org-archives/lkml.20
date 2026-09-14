Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A5483817
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396286; cv=none; b=nUJfmAaleBaXm4h7NplsgpvpApKgezvUxpDfRapA6KX7qPgKN1JYWWvuffSKn789vw6u3KHpdt5mmbwbaSP5PBjMQhq1Wr4QF36d51o3rQlu48Nx71UJAbVZXYsslDaa9v1i1uRgTdCW+7CndDjFfodFhRlYX2GGdYgTl32kk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396286; c=relaxed/simple;
	bh=wxBw97D3n70QL3zmvWubyM0T5mJ0kFxx9ywDlXKJKE8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=exIN9nbsIx89DTbCANkbVNfUWIkexvuVoCsWvxx/3FfF3CodGiEZFLasmXoBmQXK+mcLeE+YpArt5s9H7XQAQV7SpuNGh25dTKz0ixpP/N/e0RkkAeZCST8n3eTcIwHnSUl88iQ6r3GKzJfAk+pXvO4RqXYUmgbzQHdvsAHxaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1J0c01B; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1J0c01B"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so2597484a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789396282; x=1790001082; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wxBw97D3n70QL3zmvWubyM0T5mJ0kFxx9ywDlXKJKE8=;
        b=w1J0c01BB4Wc/hIVnALfDO/nJ7wV9PyhPx1QLkZR6/y5eEgy2MQhaA9CrnuGT0C9ov
         NRnsnL/8INBnbni/otjlfmFpGe7pCN9fuFhGlZ991Qn5+HShoizqVXgWVORane49EiEp
         6+xzBGXwiZUU2FOxoq1fLJnd4vq4G9sFoZgUz2IUnX64uigoHTuBea7++RsLmGqR0UoQ
         XpWzbNuAsWqjOk1gNP35hvpHZwN8+q8V+8BPOMzxD77H3ZopujXSWNDpSdR7XSNI5Ur6
         7OlDVZABQ8AVOXgxNI5u0DM3CBOiTZmp6mHVUYUaMJIVVmpZQTb0qmbTnPqH4b4TM9BG
         cx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396282; x=1790001082;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxBw97D3n70QL3zmvWubyM0T5mJ0kFxx9ywDlXKJKE8=;
        b=AIJQUGjqp71+55ADyoOnd3r7mPB70zpK9+sqFeQ46uqaBgMqpFbrsxb8rMI3URCLuN
         Vi8xFVOMUl5tA8PTeJQoR2l4+i6b6iXdea8tgBVqIlcUyHU8Z/SPH/3TNY6I+LAe0e+d
         SDZruk2kObY7J3cAWwhwk/LjVRuDG5D8kg3/6StIqoiEAIY5H5fMQEww6HGmso88pNQG
         bP/Sn1XoN5wV+Eq7VDLx6ZI3YmorFEnyBh7/LHr8+MCF26X6Vbo+cFaQk2gyLuYQOUbm
         pwDD1UHOhq4dDsYCANGEooJ+AYMwvy85TNycuasF/Stj0IeQmXE34gJOV7UpJzhQPRkB
         w8lw==
X-Forwarded-Encrypted: i=1; AKwUvBwE8CIPfBtZqI/KI43g5TrQSteO5p1e7vN3CctFNMqlYIc4k5lo/HguiCc23ZLFIKtVBXRM3iWrpPqeIQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++miQpVEv1pAgjodcceGNX4Ox3sA0MComVtCVwIZvbyi5GsCE0l+
	EdvBnRiaCWZHSzxL+hrV1jld/3akpRloE63S8H1jzNsN34/UO5jPAaNBBQnX2uawj2c=
X-Gm-Gg: AYBFou3kHcIpMmbodNahBKLE7nUk2Y/GEfSOFtNvpwKM/goTkM+tc2VA2CPoHzmjUvE
	iuA1qGbXckCAriLmcVqKaVrxyzKuuWN0+MRwhijWTrOugc7pvlejZ3EvydN6mfaJqZpQOycEBrf
	uVZkvo96jTNI1Xupb+4BNXeJhOAUQt97G5TDwUU2rskW4dNhmmPjh9fLW8kWS6im/KzZruJzydn
	7RVdmLweiQO3cil6/bP5fTmFrT8BsjfYU3JPnDV7f5sk2PjOu2SpNz9w0uE8Ia/mmMfXxbNyk22
	NlDAUP8NshV/YAiXj19PTElM8+ILYLfMw68LmMDwPRhm1cIPLQZEeHpZ8O9CQBskmvlXAovw6eR
	n61tQeFO46AfLNVoAOO5IJ1C9tta1AMYRxQe6hj8tv9kimiadvTFgLkEk+hBasOVdfgsiYbAdKz
	7I0UjsAedM8zhepGQfNmtg84mXNL5/4YtXRJtbLd+DDigG1/5RmhAeSjJiNXA4ik/UYBq12tz1M
	bQ=
X-Received: by 2002:a05:6402:1ed0:b0:6a7:e514:1d85 with SMTP id 4fb4d7f45d1cf-6a9f624bf08mr1626452a12.13.1789396282078;
        Mon, 14 Sep 2026 07:31:22 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58314fasm4317005a12.3.2026.09.14.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:31:21 -0700 (PDT)
Message-ID: <6b9d4e9f8c16c6db084402c54dcf1b046b56823f.camel@linaro.org>
Subject: Re: [PATCH] buffer: fix NULL dereference of bh->b_folio in
 __bh_submit()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, Christian Brauner
	 <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, Srikanth Aithal
	 <Srikanth.Aithal@amd.com>, Luca Weiss <luca.weiss@fairphone.com>, Jan Kara
	 <jack@suse.cz>
Date: Mon, 14 Sep 2026 15:32:40 +0100
In-Reply-To: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>
References: <20260902013357.2815214-1-joseph.qi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-02 at 09:33 +0800, Joseph Qi wrote:
> Commit a2c924c240e7 ("buffer: set BIO_COMPLETE_IN_TASK for dropbehind
> writeback") added an unconditional folio_test_dropbehind(bh->b_folio) in
> __bh_submit().=C2=A0 But jbd2 shadow buffers have a NULL b_folio since co=
mmit
> 5febcba29792 ("jbd2: point the shadow buffer at the frozen data
> directly") made them point b_data at the kmalloced frozen data rather
> than a folio.=C2=A0 Submitting such a buffer during journal commit oopses=
:
>=20
> =C2=A0 BUG: kernel NULL pointer dereference, address: 0000000000000000
> =C2=A0 RIP: 0010:__bh_submit.constprop.0+0x87/0x120
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 jbd2_journal_commit_transaction+0x932/0x1b10
> =C2=A0=C2=A0 kjournald2+0xb2/0x250
>=20
> Hit by the ocfs2-testsuite fill_verify_holes test running with
> data=3Dwriteback.
>=20
> Dropbehind only applies to buffers backed by a folio, so skip the check
> when b_folio is NULL.
>=20
> Fixes: 5febcba29792 ("jbd2: point the shadow buffer at the frozen data di=
rectly")
> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
> =C2=A0fs/buffer.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # Pixel 6

