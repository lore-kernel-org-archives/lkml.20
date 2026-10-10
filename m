Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A21361651
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655202; cv=pass; b=oSxWR88pT1FBF/w8ICHs0zpkypUvfDxMQ68HOL7/MMg7vD+gmAsnBkqoe1BVTvPcWI4RxT31Otft1wWGOAWQ/jA8qQVK8vdjDNT3eP0y2hvGVp9QlvjdIpY1SfsAt3SwYEshA/hiCaM0gyrgc26BwyBZ0xTG8k4dqoqGvwSsRKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655202; c=relaxed/simple;
	bh=RRaKBHfesnMj/MQ56/1YpZoTCrxeT4WyUztjdaRJ/BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnwEKRYgRRfSJZg41982P7u3oMCezLrpex6K9PraauyFFzJoBq1OE+xmab2N0BfxdU4DT1x/j6clGt/unseiYj0+j8HNk2VzwtPdxRbVSwuzKDSmUiN+TxftJSiyjagKU2g52UFsXbNgBC5KYFuICfxUGqlzKIHESXmvMPzWRl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOoz/Xg+; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOoz/Xg+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f48d91ba7dso525159b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791655199; cv=none;
        d=google.com; s=arc-20260327;
        b=KO6RQ5+bmxBcIjtFEkYOsW/n9YDhb/il++OsXi76heSFS6Qg17kP2wTiAzqpXdWmqV
         PZRm9saUZO5MQtAOgAsG88j/qqrZav/Caif+4TXpvwySQWiFhTLMJBtIusJdI3+x8+xA
         qxpBkV3wb+PsuuJANSH8VOSGhcgPgrEa3yo+TKEM9e4Ibv4AMz/VPNnjqv3HDae7VH3w
         ZWIYkC+1SgLulnovveYoQfUDKHLJJEw440b3WgxV1nb18snPJKKztkOsEd/6eYcceGxD
         sUt+B4RoMFzl/OMH9Q6C5fKhQftBqbkoHuAk+IByqexgCxJ4oJu+iLMMWrFxuLcSKZcL
         Stvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8Kusf1hH/TH2DSJRRPTz+9MUvUE8UuukGJs1Nu4sUY=;
        fh=tMf+TKWpv4nxu8lWxt6cJK/ZQHA4sx9wTwgYrdD2Y8A=;
        b=C2wOx9U+xR67prtX9HrkxGZiH0ib0mO6IX2vYqP3hPVUa6yzh4vDor+0Z2d2HERJR9
         JW4ApvwZjjF9QRr+kjt6bvjckCVDW7XIUmWIkRMlaIlR7lb018A1ykcYYx9rmgrLbqaR
         sQ127INJknwXlmfqG7y7PmmktAyYUmj0Xah2zWHvPcdlaKqpleE0NOs14mHJn+XC7a4p
         ahdMK7Y4oGAXmOCANgDJILgr2F/zoA+XEpoIUOB+WcLg8FM7uHa8WuiL23WiqJEm29Kl
         nz4KVV6lLIE+c7pXjwUhdx1xvhUfNkkXmHJ35AHYXKkIviijTDtYiR7OeI3Gx1EDI+EU
         yftw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655199; x=1792259999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8Kusf1hH/TH2DSJRRPTz+9MUvUE8UuukGJs1Nu4sUY=;
        b=OOoz/Xg+V32Qj9en3Gmc9HwFDs1v270dJtyHowCL/ZeufT9GnuLpFPWVx70F5UJ79s
         Jsms1PgrqRikZLN/41qbvBIzauVoXuk+UG9jAf7vqNW0DGEieKCzM+P3+MT7NPmPBQjw
         KCajBxI8Jk6bjFURdARnSRQ+nw3N3i9NgL4P8uNqzCWzyLM+lDuwKOO6Y1bj3npZv94u
         owRUxmAJpW0XID7zIDR1jfcJvTO56D0Abwlyc71DacVFal4fJh9tWhrfTvzBJYHx2S0s
         woJAydVepydVH/zCfAj7NeediIhspVPG/D2UPLSyX/5HxbpM1FHX7fzzEjjZQuiht8H/
         AXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655199; x=1792259999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8Kusf1hH/TH2DSJRRPTz+9MUvUE8UuukGJs1Nu4sUY=;
        b=H4kndP7qT2cNWK71NKCehBxFARKb44OaRG1X7hOm86CzRUCiMnkLOg0Mutfl4qMj1R
         fdVvuBHiIIEIQ8ZOYkNKWp4Dg8i1AlSL050sobV5ZOz/If/QLEB+TlfDAE5hsC4Db/iy
         1gA1kifxQg1dJpeo5Bl7iRxWZmudWG01Kp5qTBsZzlZn76g11haH2AhTYIUHn1JKhU7X
         M67hwzS4PJ5e4VbJ+1yKYV11DIK+Uc7d59k6b/02l/xQ7/VMkju2CjjkqmJ0aTyOpFA7
         EViVZU1UrC2XAXLsb5Yff1WWSFhRZC21YTknEeCE+dfQSfexikl/bsGWEo7kHk8hL1yr
         xLIA==
X-Forwarded-Encrypted: i=1; AKwUvByyL7cWpX2xx/Syd1sPEyGXIL4b0r/E729xreMWfCD/s8qHuw3+NFv6vrcfQ9WwsMGUm+OyyvRyrTMq1H0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2gzF3RA6VhReOLrCI1BvBAPVd8i1SIAgNuQhOpNKtMeV21Ow0
	mE3armTHaTMmilYJkD3+Mdt3s1X05IxMzo4zQqtvqHLL8dldN7HdobCo+ewN4DLOcmnZ5upiVIj
	1GBC5LfjOhRqJg6zztUp4m+xcanei92w=
X-Gm-Gg: AYBFou0dGOH9R9CXBSO3bYr5qOymJe5b/KvOAhlFGevYm2YkTeiClutfSglapAzChg5
	J86fYzqDIYQ2K1KeDJYO8gyDT+Hqkc+8F2t8cn8e6mngptTI/vHlhITp/RACbVIJfpuPSdbtctH
	NgeKxzyxVkG9Lq6T69p2/aAOj744yPRlkQxDtIlrcMEDQOZwxoF9/Z/75RbUT8sA1YEIc2tAl2r
	qfaT20cDyX270wO+DiEOCJcDjw+SkgdB0ixjSNmxnnhz/VTVTBI26IwU709hYFCUtEgQVZ0I+wo
	vjqcleEVFrqBuUFCvuvpYRd0VR+CQxKQCgRR19+rSYfM3T19LpsYfxkSWsjhizybaGUzF5CVLOp
	l6r5PiQ5PheCNP+7v+P8vh/8HqijeaI/kfzK3BptuI9Vc
X-Received: by 2002:a05:6808:30a1:b0:4b3:7da2:f393 with SMTP id
 5614622812f47-50c52471233mr6704569b6e.15.1791655199462; Sat, 10 Oct 2026
 10:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165825.359259-5-mmyangfl@gmail.com> <179165246658.434549.13789649791572206324@kernel.org>
In-Reply-To: <179165246658.434549.13789649791572206324@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 11 Oct 2026 01:59:23 +0800
X-Gm-Features: AclHuK83CIhkKI0SXuptnmlX9MwXNcY8gSNZtizFBXcwCcTNrzVJ_Ce_8IafsTU
Message-ID: <CAAXyoMPnoTvCiYanrYCrfY=u19+-7PQkQt-SbahuiV9RRwijMQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/4] net: dsa: motorcomm: Add TC prio support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:14=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] net: dsa: motorcomm: strict TC priority modulo check breaks
>   auto-allocation

Already explained in the comment. Also we already reject some rules
with -EOPNOTSUPP, if returning -EOPNOTSUPP when skip_sw is not set is
a problem, that should be fixed by another series.
