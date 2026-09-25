Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72C44065E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341258; cv=pass; b=K8c3dJPUoxCwuQvnhYDTyju/e5OdiI6x99S64C+nrPFDRyeYUzAe8QXbkdhZDfJ+od2DzZxX4WtQxoM77oH4WxjRBojwFChQRfkUVYhTgk8+owd+yrJmQ/CTWNSGPClb3zOvTZ85HZdYBj4knZfKaDgB8pd6gc5dJnvxcaBve3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341258; c=relaxed/simple;
	bh=88zp11RG4j8iYFg2++fN10FbqRpm8U939v69/2jFPCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoGarSM77N16MHkirqznL+bUU+xgvp79O7OJf7EpusEtwh5i0ThsU31Hn7m97wwKuc4lOdHT9VwcQjDkO5g3t20x6GelKD+dpFU3wTQAkCRl0N3NRHnzlWgz0FKsByqJfXHTzMdHTINcYWILE4mDN56YJius/7YwRIPOZvnsKWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPaHV5sH; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPaHV5sH"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a2ffef2so409067b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790341256; cv=none;
        d=google.com; s=arc-20260327;
        b=dOy3E7aWzWChxIgtLdDqIPuIMdhvW3iGUfsjw82QP1VNbXh4jLVWD880NqW7IZ1KCG
         6toqvnEdyfzn+q7Agn/9PVWNqIdf1W9PyhNAQoBS1tbYhADVroVBWRSSbUrf4FCJQo6G
         XNEGmbtcKlCG/sCTae/0csQkNeGquMlOs63H5lMS1LszRCTQ4/i1WPW5nyEv7nGNeEif
         A2ip1dtqWwujSdDnb7Rxpv5fhbu8eE7XaQDs4iOSADxiwl7s48t3lAYdDWBxEEpcez5k
         7flMPBJxSmHzKxtk7B1/7R1iZYaP2yIi/v//EAFY0DdITOZetoeVtoTaXFbilx9f069K
         j0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MBaQ9LVOrjLaMIJyB1YHVFLBYO1gU4YEmH2n9HVOEPs=;
        fh=2qxG8vuaXnnOFd31vPjj+m8B0y0XeOz8h5wONmFxkS8=;
        b=pWciDliWU5ru3Hb6uikAdIhuVFimHqwWCzgV1b2i/ixO3+bWTLgxsJnrcxMAuQNtvf
         kizXXhXCuaW2kByBWZCc/BiVp3/swT+3OhqP6GEaiJUM1IgetXlya5xZeGAcOYH4hGs2
         9TuEaOQZBsPBwHZvGPCnvBFhVQSBtShuguTVbR1hx98DPqg+3PR6KjEvs9sTTiu/Zen3
         wG6zGgFhnVSoQmAk5t88FHKv4UyAOt9dLqnHZ+UwqmLksTtToWIQmAS9F4NNvaBGIQtE
         E3MWmT/mMtP1yRUh8ANXSiUVmYyth6ouN9FwvHWm4vVNaGQbHF3E6u8pAW0JRQEMxnIt
         ewKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341256; x=1790946056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MBaQ9LVOrjLaMIJyB1YHVFLBYO1gU4YEmH2n9HVOEPs=;
        b=NPaHV5sHKhSNySUlj93BDfUFY+mBMlrO7zMyiBAJ4LbqoDxs+0UkTfA43NhqsV5crU
         aDDxwYO/pXaogHmoRjEujZHYq50Zxx1aUp0Y1oD1RzHLJwih823pTtzpRivo1EVsY9q/
         Bvf/wViB42P1fQrwis43kuxsgH6vxhsggzzyI8DPMh04chLZg+9/JLEnmS7vMNoxDCXV
         QysVZkZcyqAaKq4z3tJZ9cJe3YzVfrVLVab6OQ8RM7OUFAPlMJUuW/GXjUu796lyFsPb
         CcQ9XO9ao7O+litldsTYKJ4v47zNuzApQuhmVDMy7OsG0BQx55kqbl7vTmORueuTDB4a
         aYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341256; x=1790946056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBaQ9LVOrjLaMIJyB1YHVFLBYO1gU4YEmH2n9HVOEPs=;
        b=LI7B6MRtwBk7NLCm1ZksTrKDHE7uUtN2xuybtnidAAOndqn9h96POsepiUj1NNJI//
         0aoRUN5l/DydxlufUFBRRmVubYITNekP7NPqa0TJcZqsFmUB2jXFljVLDiJGdFiqNkcg
         2LeEG2PnfSwDShR3ZQsdV8BeOPhpY9OO5BBFHZD56icN/YgdsEafuVRhCq9w8zSUtPlA
         BxuC2Ujy888U0UaqM+Mj2Ua8CRE/BfXfpA3rnVeji5ZaxoF1co3CI45sLL9nKznM627/
         EKcuIYKVXJRdgOCj/jaU2hP/bubMON9i+2fhJyXO1iPkJPJo2HXrcEHiHw/6UL1B67DB
         gmag==
X-Forwarded-Encrypted: i=1; AKwUvBwXRwG4KxZY9+2V/oeyAd7AyiF3v39ClE+InPpXGT5nIjdZG9GOeJjFRYWMDAz8kh6VG6zd/ZmFsLm/amc=@vger.kernel.org
X-Gm-Message-State: AFuF++mcNESJD1kDohwm6akz7b3rlDOvKVCYbUnnhA8MNR1LIjLF4/Wo
	ivq7OlEME3iZc0T2nn8aksNq36HJpYaWWAgG469w65CjF8ctg/Uvt0r/wuPSIsf5sYqJ0OmV7Uj
	z23TCcQd/XYU4uoAB3YFt+Zamy2/MUwE=
X-Gm-Gg: AYBFou2/KFdvNzcm7W7t5RnMfJxNyV32arYdpNlt19SvY3hZakAqpUsBhmJzSBpCoNv
	8zQb3MVVqQozCLSPfNC4W6b5cVKnl1DYE2SwQHwiQqmov/s/Tv4TARSNY0tmQ1d3qMzV3kpiOq8
	qYcwatMXPqeWcfLxa4cy0KTwwoPQaXeOjcFSlgQuqDJXbk6gKtNHghq6J4Hd1WqgcjWChc1Hxu1
	dqY5FJJdEhmk9gzmYoDAtOEg9zfwRcOJVG1uz0Su9NtHuJ7LNDQL1dESOzXhWF5DChE2FM7gTOs
	/McoRdIpDocaTKfvxPccwejyONLnvZMWfsW1phhFXUXdXQIUOIb74vUX5W/dxL3ESxIyH4gjDKs
	9kD8m7MmC3bkl3Gnq/4xtYXJnVNxyZQ==
X-Received: by 2002:a05:6808:1a1a:b0:4c9:6b4d:f2f2 with SMTP id
 5614622812f47-4dc640ac175mr2018463b6e.39.1790341255580; Fri, 25 Sep 2026
 06:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923021945.2203368-3-mmyangfl@gmail.com> <179030278415.2160803.7209731671356572587@kernel.org>
In-Reply-To: <179030278415.2160803.7209731671356572587@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 25 Sep 2026 21:00:18 +0800
X-Gm-Features: AclHuK_s1xZW3aEfZCQ2YBSdIuy4mHtVdZ2xtFjyf74fEZZ89cQUVcbRlNpAk5w
Message-ID: <CAAXyoMPAHrfi9BpMxs6PRttmUx7E0tP4Xwp_+kwvH-SSSZ7P5A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/8] net: dsa: motorcomm: Split xMII and
 SERDES port masks
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:19=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] After this patch, a GMAC port that is in xmii_mask but not in
>   serdes_mask gets an empty supported_interfaces bitmap.
> - [Low] Two comments in yt921x_dsa_phylink_get_caps()
>   (drivers/net/dsa/motorcomm/chip.c) no longer match the code after this=
=E2=80=A6
>
> Pre-existing issues:
> - [Low] The concern: the in-tree binding example
>   (Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml,=E2=80=
=A6

No real configuration is affected - xmii is not supported before and
now (as in TODO comment).
