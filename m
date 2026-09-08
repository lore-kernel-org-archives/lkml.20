Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D504572688
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882884; cv=pass; b=qTNNi6FLYkjx9HmndNxsovBvBdIGWMIjF6mV2EKsi8UbkvflJvYT+2AP5ADFug0yVo/gixFvZtDZdIJzFpOFTpB+S1cbLoopTopWHWr4APh+cQI0BDgOFEw4obrQmSwMx+Z9BsBzXSDEZ36jzTID7y0lGwvplksa029ZfR8X0Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882884; c=relaxed/simple;
	bh=m8naGFUUK15OK7RhREJs9bWygJEJ6IkQJ0hS9/AKPmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgbLvOR7mTtfTYSbaK05fcvEcqblwffPKu5Vt60iqWx7CpdtiwuCX3PC/d6lP+15Wv1LyQkcbK7tph95Ayj3Rxrwp1zscvdgjbDBmu2g6vjXKDDMXTb8zkIqdx1/pQjSGof+u0hluYem96KNaXWkf1xbHRv4fVfwwad83CCulW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peXBH2a2; arc=pass smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peXBH2a2"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-744b7f44933so949526137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882881; cv=none;
        d=google.com; s=arc-20260327;
        b=gmEM3iLXbzGFB0eDSlQwcSy4/8HwGnng6xHac120e8dSTnC9pkkpjFoyjND60CSnUR
         GEZItuKBu6S+3uEAsoInlXj0z1va67CaHd5QlFBKDvlSeqG3Zi0eI7NgxhSkADejqrxK
         1eakDkoEzLto4uW8EogmSj+5m662V/e9xQx7SSoVie3qFl34yVsVveMiL9oA6ovHIbWf
         9qM/zRpS2PiQwnNXrnrpYljjpbOYyVDvbVPC+Sgafsk89zejaxso2En5O8d5MkQQEtA5
         IEMd8EfkjV9/rCw8zzwoVaHcpsKzdvLCj9r6DGM0gyBLU2tdH3Y5Mi7GvCfguPEfRhGU
         /eJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m8naGFUUK15OK7RhREJs9bWygJEJ6IkQJ0hS9/AKPmg=;
        fh=37XFeVv1MWruny0fHwxo+Sq7m6F+K6OnKxliqFiSVPs=;
        b=FRdvpFnHmYelZEY9XsLTYHuV+cDw68C8IuLXAojD1AD+oIZq+poycyw1zhEscvCoXn
         E+W6xzO5pmifwqYdUPLsAJrTNnKEDJzOlXiIZcIL4LpsjqfNBRGQ1gunR9+B77WJSLl8
         M3Fjthz9YSNjEUczxEALoWkxXFja2jtDWAVaryv+3gpsOLhFLKVf5AcBPYO0BldwhKnn
         CL4JMGcjctJWUowMT2NrpUhwwp+80L97douPSWxlit6emeGPEZmQiLnfl1hMgb72QYuf
         Ev0gjd5Gjqb5Yp6FiOEkRXJCKrKvRemSagGyaDzMIsQTHEDOWOAdWoVjEl9rBmRgYHpc
         KntA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882881; x=1789487681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8naGFUUK15OK7RhREJs9bWygJEJ6IkQJ0hS9/AKPmg=;
        b=peXBH2a23fSed/p+ckB1kajRvnn60mDjJi7RJiS7nFs97gWq/6m66ODfJnFPFrXkvi
         Rsx1Wp0OQFM+zaQ1Z5s8/eNBEhHkQFqEON4+ODNyREVmVvSIHsjdLPjz2CJ41GrsqVBH
         J8qiQj2wDk3flVW36QwyuVSUG7ywKXFAAlY0rDSiJrSZNctOL/Zrjd3HPx6S7QeO7AuF
         MCRfuI0EAlgxbX16R/JnwgTv6g6MY5pfhr8IzpNLjOE/Tpy21viLrqoDeVTPEasD+nbS
         zTGMF6Km3EvbttKwc63XqjnfLv/8+SZhPODhHHc3c9NXeUmuUOQx8NdqxeSZpVv2GhlX
         VcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882881; x=1789487681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m8naGFUUK15OK7RhREJs9bWygJEJ6IkQJ0hS9/AKPmg=;
        b=hKOp0q2K0ulqTVBzeeGFv1GM4tY322KQcjRv9A8TW/EUGXcH5Kpv4iY6C8EYpZTCn5
         2sve5JlwMD4pj2ZTWrHdzBDurqrzVPYctb8T1hwm6rtJ6PZH3HS913rr5T+pLa0XxbUf
         MuPsx1HbSm3LJADR35mROXf7JBlg2dE0+oy303uwdlEMC7UOF6UcoiiqWC4tnDAQ89E8
         oi/666/uBsUKZ6hBtLvGS1pqwyFpACdWkOsZYcR/yFWvJNv4dB0q7fmGqIj+PYLxKjXr
         jAs1tS6OJX8GL/7JiiYCUgA8Jd4igArQY2jLuSXT2P5E7eZFwrz5Plo7Jnc/pdC/DNrN
         AP3g==
X-Forwarded-Encrypted: i=1; AKwUvBzxZSmUisFXVfJggFLaKJg+VECvvC+4yWTjhhm1nEurXI5q4FDJzelvHIzCsiS5qV9jhHUza0+pXaYazGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lF83YFJDlZCTLbJBAejzWg24n7l/wykyF93uajpy8GHj6sQl0s
	Ko7n528aXi1+PxQCIxIDv4OeghOB1CDPRZ+IblA5V5JoRbBlwMunOEzJ6bSII3u6c8uHOheU1lh
	vofZJVF4jQwykcHpu0djqooG3uSMQEhfNaxfpZVHVoA==
X-Gm-Gg: AYBFou1GzxcQTm7wv5yS2d2vvapB/cqaASDT3pClO0uOIaysxK/5cKcvXWEXKsCscec
	SnM4tzNTJYtu1j5OtEWWXwcJWZDH5ZYz5VZNw5xuH3zwXxdU2n2QhD/WYtRtTn4DgQI0DwG/OUq
	9e6t7P85NhFZz6Z+IE5+Kymtab/NACJadyrHIF/HQwdFGtWYNeREnkknYIScBSsoa09hHt4LL/+
	zfvmn/lAfqi6x5Oyvbd/wBsUNXoLLA+fn2PU8/nPVS59bI9NTnARVot0R88wKatu0wp5HBdbrck
	SxuCzlTCZp+VoPOTI7GuE4zsdPVAPyyt8weL88+0LyRzXdA=
X-Received: by 2002:a05:6122:338b:b0:5c6:5fff:f2c9 with SMTP id
 71dfb90a1353d-5c7ed41c953mr14439622e0c.4.1788882880956; Tue, 08 Sep 2026
 08:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823142620.126424-1-shlomojune6@gmail.com>
 <CANn89i+5o16tSTk9MpLE24nCAn+SkMeZvHv0W=MqxnXGZDBBiQ@mail.gmail.com> <CANn89iKck9W0KB8Sp7OFDQ+OTFJnBpy=jsmQbZ+VYhrm8yOUgw@mail.gmail.com>
In-Reply-To: <CANn89iKck9W0KB8Sp7OFDQ+OTFJnBpy=jsmQbZ+VYhrm8yOUgw@mail.gmail.com>
From: J4f J4f <shlomojune6@gmail.com>
Date: Tue, 8 Sep 2026 23:54:28 +0800
X-Gm-Features: AcwNN1XPIJ_-7f0UpmEHZhNDAtBZArjkgFp-nC_du6g8-qb2zRaLlPZ5d23i7Vs
Message-ID: <CAE_LbwkoQMYLXzOi_RwMcxuNy=tMo256+Xj2Ac+0W7MbAv2yLg@mail.gmail.com>
Subject: Re: [PATCH net] net: skbuff: reject invalid pull bounds
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Following up on this, are you planning to send a V2?

Yes, hopefully next week. I have a few other things to take care of
first. Sorry for the delay.

Thanks,
Shihuang
