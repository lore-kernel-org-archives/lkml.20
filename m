Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023331F98E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310454; cv=pass; b=L6MxLyKzKM+AZEOiuoGoC3txvwjayXz04Oc54KmdMbRr935GadCrUrhjIe/1kG5rJ4FIISWj9UvHQL0twL+UfT/+QW37mEUq2pA5rbZ7FTLT8nxvYxffk4rKPfflgkKHASecVaqRq8RRT7FneqTfllEsJ/24VYlF3MlPxdFA5fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310454; c=relaxed/simple;
	bh=RFnfFx9RTdvOCnsU0TTMCpbnhtMfux2qTLts+7Snz/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emAvwr9RPu3RMlgsXdSbetqE0mTGWt8zKJBV/L3qd0j08CcyDq3U9w5kdRss+3sGUc0voB2ZT4lpJuBS3t/wC8P97jjRY4g8czGkL/DvhvlB9rpRHFYHUj3GIDUI8Tv/eBuW6vkSXJpzwkbxKSHxnUqAyLjVFkNWzNFz4+gPnBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAafAQhq; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAafAQhq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4b037a2c1so373300e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788310450; cv=none;
        d=google.com; s=arc-20260327;
        b=Ooy66L3liJvf4nZ9W9XylOhBhCEiMBRI+p1dsKgiP84udHHOuupa3gXX4C2hpMJx1p
         A9asS0BfD38MuW1/GJsXAJ0n5oszIoXxFEpxI7zOpMXrr4kzEHpdUcVOma1i2yjGeaBh
         uWBdtnUPMlSRCNBUVT3pPXQDUPh9Tr6Sabbjcsv0EyFDvDWqABLczCN75pnASNW1osxn
         0jJCpsuZPm8yynjuHfr8ugBoX+mGUGFVpYvwQ//rDk3QhUWuBdjtL9RDVCAMs9okeFpC
         jKrmd70UpDwpn+Ch4iLC8V56MPw8ytbugI/YkZpyRm3nRF5KDkPvDGLrWVpVLEob59Y2
         5GAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20kt/f1ijP4E5zyvH/913zv3ShRzKiUURu6289Mp9FU=;
        fh=msdIiWtkPww/8OVX5tXJshcGobgyV+ytWMksYBZkhq0=;
        b=sB56sJ5HjdMaqN6UhKn5CUL6K8fByuV8O1i7ez+79gCxjGsyWwCl2lx0uWOtFRuh++
         gnP37JduMx/E2rVvbG71Jp0VygaRRlsweRoPqsXSqe/Wv3X/V0ptn/L3iXTxHPbmG7uU
         HL4n2pTdqhE1kYXAdEx+Qzxh1UCrp0O9wfYHhXHi2VdfgBep1s6RSAw80BFIklq9Z01X
         GYInCbPSepw8s86u6ljO0mIazjbQ6P++wl9IqRLhZsbg76htYzBssLBLVMQJnymDaUAl
         +SUXo9CM2aVcPN6GUpz0LAPn3UEYSjIejRjKRYxo2CxoZouJ3dDM6awYvkkAQ5UdKOsA
         f7RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310450; x=1788915250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20kt/f1ijP4E5zyvH/913zv3ShRzKiUURu6289Mp9FU=;
        b=MAafAQhqJES4bpc4xD+cDSDZG3B5vGzzbeHcC0n360RmuQOanbeYJ8vc46QdO85WXB
         pUIa1IEBEYwbPFmFvFsqlMfqmi0q0SxzmSamf4jqbQRvCx8BZ1zbykF0+FKOqTeCFKqA
         vasgB7jD2c7rii6fC1n9IDuS6OBrWYLURLg0R31VSi2PsFIlpYLVr2KumNkbfrbguufH
         l0Q/WYiqbU3/55HA1BjOreLMieaHQG3r2EcqELyJGmySQiXph1sJh1ZVSg+em/Fa/UeV
         PQUIniWyQkv9mQLK5cn2v3E+9erUPKJYUQ5quf9oLu48tC1ZRRHevhf7UmEsFkoChZK8
         I7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310450; x=1788915250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20kt/f1ijP4E5zyvH/913zv3ShRzKiUURu6289Mp9FU=;
        b=VwFA+q+PqCKjmSNj/vn27lKTiFlBho8bdr20BQ8tNZpMqkqHsC1qTklt7gFkNHfbeO
         izT2wPtPsSvSopTxsBh3bTjjaKP8imvqecR76hK1KyM4k6hoVNS50Bt2St701ZIcVLvZ
         TBANXRtCj3gqcELRcNc27ss3EwpMN00Bb+oM15K5xbKNWZ1aLq/yMb06v2I2YLFm2hss
         FcixqPjmLUwN1IvDHWGNrlZ10BGR6j64XPlcZoLi0Rl1egx0KlpOgdyFJFIpnbRHDgNv
         CtJrGhqcxqMm5Bn7e2cOSL5KP3jji9sjVzVy8AcFDyjv8C6w6QmP1m9W26S3EXt8fY6h
         nGUw==
X-Forwarded-Encrypted: i=1; AKwUvBwoSfRiUsRtFxqYnAoqcm14gquvDmmRTCV/7xHVfUKqKhwPrD/6fUhrZtTh04o++sbj3kc+1YunAhwV/zA=@vger.kernel.org
X-Gm-Message-State: AFuF++l60HkJz3ybw1wolAIfO1mT86l4B1lW7OC007gyN09bMvAlQpZc
	1j8hOshunlqBttVfN7VNSL7REMMaqa0w5pqtuPz5swJ7d3HdwkS8NAlgInlzYB/xjGf+NvtbBkP
	/QRahJCFhErCDFC9bR4JQXuUkq7jIOymQigHh
X-Gm-Gg: AYBFou3H/wqAP2wfQsUX3IIOo0DWdRizQ6zwvJKU2RAjVkg74mMnMtZ5nDJZ4wDKM/e
	tXX94ROadCCOy7+XLwROWXn6QqbZ72eLfbFhjZVX/bL0khz597Gxbao2PZj31JAyEi/bvNBjhrD
	ibOLEt33WQ05LyqIkfj6JX6kle4NhL7fUUMnE99L5Z/7mN3EgPP33L5Sa4tJ8lF+ajEFWljHwUE
	ybsDMwUkNaxQJvH1g+juXcb5wtzxuNiwmp7J2VUeCzXg4lz8xXVR640MQA0ugEUwEcqPVGL+e1H
	FLZ+2GrCmPLwfLlkq96ON7LNnDLXWbVP4RqwaiD3tM7Nh5jBgP5h2prRkw2MxoWUL9yl3p+ycg=
	=
X-Received: by 2002:a05:6512:15a9:b0:5b6:4ae:5b7e with SMTP id
 2adb3069b0e04-5b6087d670dmr333682e87.28.1788310450047; Tue, 01 Sep 2026
 17:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-2-wujianyue000@gmail.com>
 <20260901153852.GH3004@cmpxchg.org>
In-Reply-To: <20260901153852.GH3004@cmpxchg.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 2 Sep 2026 08:53:58 +0800
X-Gm-Features: AcwNN1WdsLO9CXMYEqOR_Ua7Tjqgcr9nM6DFjE7XoaqIlPyPKD-vrcyyMZ7-qdk
Message-ID: <CAJxJ_jh_iQfQzUTFgu6BxmZK+ddQG7sWdL_iFFyb6E2xka9+aQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/3] mm/zswap: release retired pools via
 queue_rcu_work() instead of synchronize_rcu()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 11:38=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Sun, Aug 30, 2026 at 07:47:29PM +0800, Jianyue Wu wrote:
> > When a pool's last reference is dropped, __zswap_pool_empty() removes i=
t
> > from the pool list and schedules __zswap_pool_release(), which calls
> > synchronize_rcu() to wait for readers before tearing the pool down.
> >
> > synchronize_rcu() is a synchronous, potentially long wait.  Replace it
> > with queue_rcu_work(): __zswap_pool_empty() hands the pool to
> > queue_rcu_work(), which waits for a grace period asynchronously and the=
n
> > runs __zswap_pool_release() from a worker for the sleepable teardown
> > (__zswap_pool_empty() can run in atomic context and must not block).
> > The grace-period guarantee is unchanged; the retirement path just no
> > longer blocks on it.
> >
> > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
>
> With "release_rwork",
>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks, I will use release_rwork instead.

Best regards,
Jianyue
