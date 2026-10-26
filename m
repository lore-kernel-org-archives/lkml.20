Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006909;
	b=2C4FDbK67t2cKxreR8HKonTocN/5k0B1brvCK+ar4Pat2Eh2DSdmB5d+mZMOKVrpEIT9
	 bKpXXCc4CkhOTkSjNdUBloez1ancoX7qGuk8qLoqislNzjGqWvAXTjEh+gTUYlyIP6Pkc
	 qFP8jIjB7lv1WPRJvFeS3v0x3Po6w/0f8AS3F5u7lnzZFLAeJqE+g6HV0SfDPijggQ1RP
	 Nn5JdIylTgg1X94thzhzQo/mH+C0pqovjUyIZ49DJNjXtF50B21tqcvMuQ3dWhvodmuLy
	 9+ffr/zOzNIvMgVpCancImG1xDtA2U8zucCk+9KehUc2b/YiXe1/N2AcCSqsXAQgUzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
	b=sCXRlCs/eyg3XipWk77zq6G9mFLfrBySw4eCzAdb3gIa9Ig7+1jz2+mmcjLgLqK5A52W
	 IHbPUSVyVbLH2ooz7D1wKRabwmjDAurDnxyovYNHKQ7qb4tPsczRbBu9LDltYqN9k3eC6
	 b6BS15Nnmx+K93kOTexn0EjTDUlz5oa/sqWT+O3Vz0rxBhOyKYbwyfqOOHKua63Qmz7sV
	 spEzI6zfjaBZAM4DJhzgXGuzSCjZmkaeH0dj3PIcv1No0uHorEHdWIvKR1dKo2ee3uJ34
	 NlnBNc8YsSq1ZdTKJxkpkibXF3KrtCI8YJVjgZUJRtFGWzzax0E4ygVYh4E5krKfUKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hgCkt4L+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B3606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hgCkt4L+
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dd059478dcso1976189eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006908; cv=none;
        d=google.com; s=arc-20260327;
        b=GpyDCw5cLwZJwHkxLHlf4VURnA6qqpBbNlnM6fucYNlbmS0K6/CD6mR8c+/3iDOtK9
         ysJkTktxwISlsycKc9MVa1g5+Jn+Q+jm89goG5Oa9azPe2APdAKqQzJUoFsRgceK9l3Q
         9UMD1+xuh8j6OJDP3VqSknaP0nmG8cYVXbgYx6gd0aLLXDBJJCT1tvMPdrkuK99XDAgl
         3C6tn2NkvU4baZUQY2snaFVvo4s/6hMF3EUNhAW3XIQ4KxHggYjd90OoFMD0ZAeoR7D0
         2CVSvyEsl53CICG2lGHGtQ7SSUMAR171MDJi3FrOVfUp60glU00emFB5cVZ+VoxEVnbM
         uhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        fh=9ttjlbsYZCBpUpdyG/KqMnn94fSUwJfHwAl0FJ8DoUI=;
        b=GQSivoa/sLQ347LktZ6t3uSkpaOFyQFtSbmtNXHfLPjel8NrpOVyozBwuysRCmhRxD
         Yfv3+nS9fW2fYTdCXsYJxHZlgeSINqxhLcI6AxLAOnGmxrsl8bx63NXnTqX/Ac10qTxY
         AuuY3OG6vHAcO4LVM9JeBSghASOLWxC7ixbSg2b+R1pwkS3dzEbyZacs9m63/tB1osFT
         PYUyaAopwjUcJQBXUclMgCK1a2hOeVkbkyQgP6I60PZgXt+WbZ7mtCKf2+2m6ZxUaDJa
         C8qimrp9uELu6xDcJ342KSCNQN/tonGBUymd0L9VmSdMJbthLv6Q3cSbTDLR1Cpvraod
         FM1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006908; x=1793611708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        b=hgCkt4L+YfAYccom4a6uIl/crkODZNgm/zQC2ZdxHmYRrxbpnx3jLnjPKRliRmG00T
         iRIekG1wAK5gjf99qCOUMM3/yhR3aASm0IcaSHVB2zB94Usr/DJIHWsbKzXTscdCDOR8
         2kUjvAX6tujWR7tAopC6/hZ1xB5lw/RBgqfF6DD+9nm/E4pGNAh0FIXJpfD8YlD7Auxk
         twhWoBynWg0YEimUa5CnveVoba7ibXt5KlyWT75PN/cvNj7ZFyEerlE7Tfgx7lCfYzgw
         Ynoqt3iVURjbA3LmhJR4i3iRsuQyIuWElmRxvKjQhIKVYkhtjR7GJMsppTSeZwE2Rgok
         Ha2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006908; x=1793611708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        b=jQNiGzOggOlxVxADQC+6vslvDBTSXT82r/L7FYWAdOifBHYFWCZLY8UdvnPebC5dD7
         xjTfd8lMIalbE+7itnBpW1Ck1DaR7wh+NmJPxWTxVgtWuqG5Zh6wgpRnXjd5q7b/kgoK
         xauVgPhKM/0svgNLC0jYOHERteWX3WyxBzJ7S7OdL1ErudAIZynQ3a8dNGQCxryE+fTH
         lXcDP7E2DHrR6aBiKTB+OEOPxDfIlYgqN6kPdUElmYS00MISD75ZScjEwwOow0BMHU3N
         2EAhlDsPafc7SV4Z/ZT7EP1LtOpDx/Ef22fnODYnSWBmZA0hKrBpUChn7Qzbjca7xNMd
         Fgzg==
X-Forwarded-Encrypted: i=1; AKwUvByU9p1tPSM5lAZ+Jt+2MC/739HSt5qXf/ESbQZuA3M4A5JhXN0KJm5tjNyRBKCfxHM3VEADAE0Ynoy1Has=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXJ+5q7kJm3wjOl5nqQv6bqc5L9CEviIFVBAjvgGdQDAzhimO2
	df/zvMYTH7RQFYBlq0chhu6JhBY5i4FQULW5wv60tYnjEO9Vb7bvjMQPzdAXLia296UlV+zQ8T5
	SVFofIGgk+rcNBfmLliLa2xuWKAwjor0=
X-Gm-Gg: AYBFou3+vrFWtyFKES6A2O6pPk3vhdS68WvQ/YwuqCLy99imP87X7SYzj8ijs6fp0hh
	ehYjKn455sQKCxZoz/mdxpIFn88gS+l9FizaFCSLRtjSD4tu265HX+EuONwxi4VmngeDuzrZNfd
	ievrR3QVDJueq7JaQKTkZ1SNjo/9y0t2Cj9I5nTq4Pe4wHB8GRNrc350I608+MFmj263+QRGvrI
	gUZFialv+Xi44rCz7J9UCyoebicGyNleyGROTeKLXIvsBDKQf2A2ngun1ZxoFUgZ9VubQOBKgK/
	ThKu2g3Bp2GYoOWkH19VfC6FqQNl7G7pveSTdcvw2SNAyx0UAfx0oGnLw+M8Qz+lACMLTXcnhGf
	IwcSWcrh/bNSswlgXsTy+uTAfBk6xozta0L2VIoTeGhrZfE3AooEoGruNir5tz8qcscz+Ij0=
X-Received: by 2002:a05:6820:a502:10b0:6f5:467a:aedb with SMTP id
 006d021491bc7-70ba0b235acmr2055206eaf.6.1793006908009; Mon, 26 Oct 2026
 02:28:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026044523.18516-1-himanshu.bakshi478@gmail.com> <at8bT7NCQb9XvGoS@ashevche-desk.local>
In-Reply-To: <at8bT7NCQb9XvGoS@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 14:58:15 +0530
X-Gm-Features: AclHuK-u4NA6gcabskiGpw2QnFryhGCL2JKlsnkWAJ3_x92psReB-EPZC8UQQiw
Message-ID: <CAGLmz9LqD50zU-BGhaVQagJWTtGiEZ3ucDxbSVSbnd5_=6Y_dw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Where is the changelog?
> Why do you think this patch is anyhow useful (based on the previous discu=
ssion
> and your observations)?

Based on the discussion with Dan Carpenter (error27@gmail.com)
It was decided that since this macro is not being used throughout
the whole kernel, the macro itself be deleted since it has the
replacement being used.
