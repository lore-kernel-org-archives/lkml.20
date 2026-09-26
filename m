Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A8378D8E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459586; cv=none; b=P7ExnSgXji6qaJ4xExwBz3aRj1zUbwufuorhnhD3PoBLgNxmTv6X6qmjqPmIQriyHsh3MYTqG635MaxsSVRUz2fKx+tJ6HBq1GKd8MlfHbp2ZOzqKE7j5n2paBXqOemf4+L2ABpCIusce+U3pqRCpM0QqmuHDteVsyQoMSyFLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459586; c=relaxed/simple;
	bh=YTeFp0jgejLVrCr+rBop1YjtHx69pHPQUyGMwzRTHmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXw3LxWWDiCfTYPIL0bYOLaEaroEE0L+r+nr4clFzkPDquCNeG1ST0WEvsewLfXrM5G3crWSOyq3ss5EYLcoBzrs+dQwlYogebqOhHwBK8VsnHf6ZlVux4dRuhboSCoysApRsW/sW8ra/ARd2jCt47q04+AxsQoFswYnlaX7VyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jNHVzV7e; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jNHVzV7e"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id E53F8BC6D2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:53:02 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 6A9DBBC6E4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:53:02 +0300 (EEST)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C34111FF313
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:53:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790459582;
	bh=YTeFp0jgejLVrCr+rBop1YjtHx69pHPQUyGMwzRTHmE=;
	h=Received:From:Subject:To;
	b=jNHVzV7efZZyvrLmv6LKvW+258JIMpUTEYBG1/0M7+d1X0EO5EP9AuxDD71Bhf2xd
	 7TrJv5MfxOaxyhwkIP89ozYL+ywhg3QxncTdaB/wC3Z6KFABs5cEhRLWpbZqPFQ7Sy
	 thfSPtCJuvI+RHzcqjAaqreO++sB6lRu7dvt4zOYQwkAC+bn25N8fxlYlGXmNJpfIp
	 TtXU6yeiVJre/xOsC9UwEpM0WEWcBptTeOFxNgUYc8E/V+e2cqBBngqUoWtQBmQdru
	 QhA8dSYv7gbMOlBeqqT6IWRNn1WIzqBAiCoymKGmKKvZOVuj1mHGwgaqSfvBJ7CPXe
	 YMWfrgZ3m1m/Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-8631d0023daso970970b3a.2
        for <linux-kernel@vger.kernel.org>;
 Sat, 26 Sep 2026 14:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByt3FPZl9ikTGrvvbjgduGNslsKxJAaTBm+/uqglisPRyUjo+L8PJJuJsgsXw5WrXccg9wpNSSjuYfn7oU=@vger.kernel.org
X-Gm-Message-State: AFuF++mc4IUOJnGqEkxTEJOugcQGffjhg/3UdpO6hTfjc0GyH1hbTXds
	5IKZbsFXt2WnmtTb9dD6Lk2l1423Wr3hEJ3FbGNU68yM/JnZrXlruj/WSfLbHDQquHyiLwny/AC
	xE31V0+xOo/2L5Z7Yr1q6WLgkO3vt97c=
X-Received: by 2002:a05:6a00:4650:b0:878:34d7:699f with SMTP id
 d2e1a72fcca58-87e9b79c67fmr7387971b3a.47.1790459580452; Sat, 26 Sep 2026
 14:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
 <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
 <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me>
In-Reply-To: 
 <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 23:52:49 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
X-Gm-Features: AclHuK8tcP6Ds9UmnsZwAsfoqjeG3H1jn48p6kEdNAPV_V0A8eC1PMP2fUYc3to
Message-ID: 
 <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win
 5
To: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179045958204.826495.14200367195863718499@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 23:36, Alexei Solcanu <alexei.solcanu@pm.me> wrote:
>
> On Sat, 26 Sept 2026 at 22:32, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > in my view adding all these functions is unneeded complexity. There
> > should be some simpler ternary way.
>
> Ok, I'll inline them as ternaries in v3.
>
> > Are you sure the correct number of fans are populated for each device
> > because of the visible entry? If yes, it is fine for this hunk. If no,
> > needs dynamic population for the struct in probe.
>
> Yes. The hwmon core only creates the attributes for which is_visible()
> returns non-zero. On the Win 5 both channels show up and work
> independently. Loading the driver on it with gpd_fan_board=win_mini
> works as expected: only fan1_input, pwm1 and pwm1_enable are created.
>
> > You also add a board match for win5, but doesnt the duo have two fans?
> [...]
> > Verify which duo-like devices implement two fans, it should be all of
> > them. I think Cryolitia has a Duo. Win Max 3 according to my GPD
> > contact has a duo layout. Unfortunately, I have no users so no DMI. So
> > it is at least Duo, Win Max 3, and Win5. Then make it so only these 3
> > devices (which should need no separation) report two fans and two fan
> > speeds throughout the driver.
>
> Agreed. In v3 I'll drop the separate win5 board and give the duo board
> data two channels instead, so the Duo and the Win 5 share it.
>
> I don't have a Win Max 3, so I can't add its DMI string, but I'll add
> the duo board data to gpd_module_drvdata, so gpd_fan_board=duo can be
> used on it until it has a DMI entry.
>
> I only have a Win 5, so I can't verify the Duo. On the Win 5 the
> second fan's RPM is at 0x0476/0x0477. Cryolitia, could you confirm
> that the Duo uses the same register?

Actually, recalling what we said last year duo had the new layout but
only one fan if I recall. Cryolitia can confirm. Then, only Max 3
needs confirming but even then you still need the new quirk so most of
this patch is good as is

Best,
Antheas

>

