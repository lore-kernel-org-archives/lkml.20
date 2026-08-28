Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BA281530
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919394; cv=pass; b=uw+W5pfF9RJbWMhH6C8CYl1mv5GL6otoydNk2jzIEZDYj7Z1OYz24Q7+QpeSa69+pBsXq9xJ31OIdYR9PtvVpj/mYbMNSxPXxWrWg3onN23W0k8kgqcXv7zAgpPHk1/ZwV3r22k7J3ACFUMSl/zrRPijvau4ZvGPozo/teLuwog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919394; c=relaxed/simple;
	bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN3FSVeActIBcWteeate5XVsFVIL5R3iiOFDjc5AA2AInik84T73J2MIuVENonFUCiggGLZtQodDC7hv9chAObptguc8Bkpb7327j5uIqe0TxH/y/Kzmzvkv/Le7+w0PtYlETJu6eZZxKc0+y4AGd2kKSyk02r8QvQRVyHwUl4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2FTdRX0; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2FTdRX0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf110997efso794455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787919382; cv=none;
        d=google.com; s=arc-20260327;
        b=rA6aQZYOGmuMM2s7bnqYd+Ejw4BPOj+TjCn1TGsWnZizxgrFmUCyuxK0+QFrBF9b6l
         QV8rHUwgYPNxu5hi4P3ivb/JhlE/fWaw5DKb3XHaCpBNbtutDbyc9ON7d4zWZn58Ku00
         ELQ/AJTNJYEeATgvHb1rAdiCpb/uBRll5lHCj2ICczhqKvP+p7Wzy5UfCdE6r/jg9qVO
         JPYz1/TW90nEQSM/DyDU9kVm4013sRbOder1mA3SxP5hckFvzE6Bke09prbDgmLYwub6
         K3sg9Xso2an+3bwE5SssetlxhCF9Q8WCoW98Kh3UcNsiwwSn3xh2n45tW+UNy4pw6k5e
         RguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        fh=nwP7xaRnKNg/3SiTR9y50MsCPZr4iKX5rHDa1qm+O8I=;
        b=l+XofKuTXz0S03GA7LyN6imuVixLK+9zjzLeSFTm+NIAbc3weFVkYMvQlC3yOmcNyX
         /aqE5ZRtC+ANFqYZvnOwu6mT5wwLFmMptFu0eQxguxYpXzD6awzmq78MKirlVeWO2ZGf
         Iwe0dMKfWFerIPpNelvvnfiT4lBq/ZUcLDVk9oqfeQ2650aAP+FastpXGUJjfUo6BVTS
         DLQyIQBNIFXih+la9tl49BGfneF86zCuAKJhRVpfLJbOAaOdX6UIV5/6qV+HIWS+E2UE
         qI1OI0AKaHhPbYsTBB6TUVkQaL7V+Q7cdnIa+sxuy1+7Fxfzid5BX32rC5hR5ad/ljqB
         ZlXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787919382; x=1788524182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=l2FTdRX0pJ1Zck0LH5A2ibgpLNqckDvw1X2Qg548zc5grBUZtoWWbQTJLQ8V0Rs/6/
         yRrw0VlqynoBKIgKY3Jk3BFdHRoQXQq8iU6JvaamWjTfiz1n9YrZFirmcBPyuaqpmzPk
         7q2zq1gRD0/hbV4lhjzK8BR8L5nXvoA0KcMYxbygXXpCaF4PS254p+2WF4u8D2z7HfgB
         nZMXj3vQMB27xT9DXBy7dBV0ebnqYlA1bvLxWhi2VXbvRPvMLIL2Sbe+5MzkMr8ec+2E
         wpNbgoKm2y5/i4Nzs/kxBfnHPINcumKgVsBzIOFmJRPrETxHweuSpq9cgU4Re4tuM4tn
         c0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919382; x=1788524182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=R3G5hMXTPhDZdAb+9H8Rsgln3cUHkZ/m28B4EZBAHfpFQtntBTQOHv0nkf4+43R27M
         be8Q1gqm6fxjxC2RJhmPCBRSHMd85qa+bhZvPHzBUd4gm9mVhKDMA8F/UhrtF3wooFoB
         c7WfzpgcB/+8m6DTltaIiPnJ7Z/KK3lAmLqaRL6hXVSsA4IRjE6wp460McH22VJJVkQd
         w+QjWMfNO8eKquiuVm/D9acRlKPfx80488+CtG5/yZjElRM2JvDiG6Q4RbnWfwtFhsNk
         vDqQmeVpjgmGjl/EIdRZbcAvWYS3GfRTB8DTAFyBCoTz8o1H6UOR9eN9j54JusPOErqb
         5Xfw==
X-Forwarded-Encrypted: i=1; AHgh+RrRvKlmF3JbFW5ZcBzTc8ab+himkqdXNFOI90zCHGsvd1ZTDjd1J1AVXsyytkLbviVdz1PULFki+ErMq/c=@vger.kernel.org
X-Gm-Message-State: AFuF++lstaralmN+ck34xycPXmdvVqrqWxIU7lYyjHiPRcqAn7lfSy3I
	DnFW0bzkRYrLweN+uNv4eXZf5aIghP1LjUB7ihFcBwdvUhJL21g4LqcoCy+HE9mLQi9mcbZsSWk
	EBjGOmHH/AjWXknKvUUSMj9ez47DrHEc=
X-Gm-Gg: AR+sD105qATRiU/vqUL5uzajGDbD7p5asm8Kwqi9lWSVUGU/lM3wvZu7tKN9tbHkPma
	nvoE5WfenorvTprjUYqxZgNo0PSmdt8PXzAxVm5vdD1QLNjeGesL/3T/ti0hhgmamci0VmR+ulF
	HsXf25huCY35ugcinMUiAVFjtrr0hGEx9zCUMJUMnLE0XbD9eR8gno6ryNjfe/KoJ8NNW67A3w6
	2Nz+PMWpnJooKhpkGBp2UNcNd7x77DdLnWDka2xyI7quYNKCt9MkAvpCDcLE3XOF6lab8K60xQL
	SXqTDF3rl1CXdz6HpWOxibSVuY5fdCP781GhNnAiLXEujkJidjcm7y2LxsQuPJJJL5Tpw03LSoU
	9RJ3TKSyo/DDQ09b1cfuUeLhN089yOU6BzAKhZcMI7CeLGolOiwQzE4ohFaGM
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr61601145ad.0.1787919381589; Fri, 28 Aug 2026
 05:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-nova_num-v1-0-e21f17ba4127@nvidia.com>
 <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com> <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
In-Reply-To: <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 14:16:07 +0200
X-Gm-Features: AcwNN1XLnWNk0tl21KUKDNYvB86AzsWOBloGy7JyyvYK182UvGVrdB50k0AdYw4
Message-ID: <CANiq72kBF4xyKpB2oSvq+MgRuT2xk-VYSbtXW8HQaT0wmc3ehg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: use kernel lossless integer
 conversion module
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, ojeda@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> But honestly, the former would just be unnecessary noise. If we don't do =
the
> latter, let's just keep the nova-core num module until the dust has been
> settled.

Yeah, keeping the nova `num` for a bit sounds fine.

Cheers,
Miguel
