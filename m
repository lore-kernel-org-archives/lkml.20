Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB49480DD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404103; cv=pass; b=okg9bqhPO2S3Q5IgA/rpXhBMFBfkEYfQ1Lvh5yXTPb9ua+3aBeBMXzjRMA8iEsxC8HO8G//BwQQ3ETBbkJUJJ6wUDEKlgR+SPC15DCCsZfH3Z9Y041MXQVhtU4hGUUn9zvPH207s2OpXHo2YV3tCCCqaZ1vAGvaOmlgJEjW+0hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404103; c=relaxed/simple;
	bh=/q5dIhtpofhSE1m4oAHrTuiE9UJu/GiikLx6MGqPrkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELudxWB7U9w523FjAyVg6JqSPrzM2W8kYqv2K2ETJMnRJ/IaaVvyV44E1AgKzRuZH+8kMitRv4a00J+23mq5EPhw9f+RK0AFNsD5uWxo9ZsOx57FvZvYiCWNgeutx5ay3SngPnZyllDiw4Vxg8Z0auVtrMHyVWmHL8/1Q/nw2c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdG2lcsg; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdG2lcsg"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so3738755e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789404099; cv=none;
        d=google.com; s=arc-20260327;
        b=UyYnDjgsE1iklpVoxx/LnVJyuP0WBI62th1OInw01HxoTo/pqjCjhUGuMDCfc/zvq9
         GziEO44qBpwUr3uoaz2T6J1plyHrfa09GgyaIXASI2T2l4PWPbpwVkN6NwjI/sXLpOCa
         V99hedrPa8t9dQ4XCnFP0LtEXSXbENGilgShrcoOyvLlDX0m1kJm3C5wGt68nrNeq4KS
         z4/nGac3Gh9JVVWE/rSoRJDWOUC7I4VDtQk91pnd4c6Ue60JksRFopn4TlJy5w9q4Bdp
         IwXtOBmAKhntR7epxlIUpW5XtH0Gntns/IprcmA3lSgEKfa/d3ncoc3rTk4EZZ9IGIkG
         W4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5QBi1hlywv0v1qX0CmTELQD8b5TmnWXgJFp53lp3gw=;
        fh=trtH/YfEVT405uvQe6vvvpqOGdhUADd2fvK2yFxqqAI=;
        b=II4d/AUdWEtzvYDxIeB9cU3pIioy+ZZF99icSzyw4AyxOBlQHGBKFmhIj2+qvQHzoS
         /PVNQTm1xNPD7cgv8rw3JUZNLAv7zr+EJM2dvnePBBR2dR2bnjLILBl4xcBYZEmWeTjw
         f+BT1eTLYVKCxD78zCcx6cNRE1UA2F5vD0lTdP/JpRmY8YhqOWDREs76PAdred4C2vn0
         HUb0Bo0ubm69typbyaCagek7rArD5Hn0Mm/jlm6QzSbZ5n5qxqtEZH5ket4G4ST1P10m
         5RZlIv7bAokgi4UpIVE13oaZn5+5YRu4aIevLaDj5Axtx+ejr8pHoGmvlAUQcSqkaD1R
         mF6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789404099; x=1790008899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5QBi1hlywv0v1qX0CmTELQD8b5TmnWXgJFp53lp3gw=;
        b=cdG2lcsgrLq8z3j5qKnh2oNQ1wncHd5/Nuw4dYW4Zm/4uAvLOzdu7cFINBnytL7BPm
         I1ZuI9+5OUmC3F1ttPDJAd464JVXcglkkaQBjsDB7EL0OE8sBCbcrOmHn5NOmNzbAC/N
         zWNxIIW+UWsgMpFkKHH2Q76iBv84oZww9l2w6cy9HnuVUYyUQ1YIf0JjpZweKcJ8Oad7
         nCOJDAT7LXtmggmJZu0bc9xGcQcJhEkNkfXrTAOaOTmnJChtDIUV8DKLp97iK9noamJq
         l+Egw+CWdISJnjECmPFs1c2kWkiRcv18WbMX55FP3Ks31urQGXsWp+sXQfaXpKD/ZJKV
         FoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404099; x=1790008899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5QBi1hlywv0v1qX0CmTELQD8b5TmnWXgJFp53lp3gw=;
        b=c8CuJFaHo0neO4zYRTt/t0hOCGy1XG3hXFqKZYMnZ3XJs2W0eG3gIRsMcWV7xeK+4E
         tS+1cokS0aQIKtLmntMfWg2bw8b6RzY9tZnV/JX0luExxcs+0qlh3hXyxGyBhPxpdaYJ
         plmKdeQ3SFjyTBoOM/PzP52+Gfkp84kE/nYquguJUzktHvJ6JqY1q/Aj/f8iwGbE2b9x
         Ku9L+/ZBqJ9NGYm1CVzEosqzydr8JTU6tRF2rGgz/0YhB5kXK1vemG1h2VT7O8qo505K
         8yYXq0ym3Gb46YDgkjmoIP3ut+YMweGRt73idGhovRLPllhkOvEQyl8NdgmlJbzco5t8
         HMhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8YePfPfjj4VKLWv6S8TXxek+dAnnyC7SjSzls506p62a186PHBHzbJ0xQSk0oTpFooR+MIWnAVk8SAfA=@vger.kernel.org
X-Gm-Message-State: AFuF++kRG2jjy0FABqsCo/uKQ/NTv2FLP1eY7IXBOnPI9NimDdBsrTNh
	1RWjuo/YfjwVDEXUZl1j8K5MVQpG0n6aKZnzv/rHU32BKfZFRJHEemTb5BMsZW21MDJDgTRzQyj
	vlJULJr/cUzPKq0bqhngsJqUVzZfKy7o=
X-Gm-Gg: AYBFou0gSoZn4vVdsja1e2K8ARPKpwCxpERtRh/5S13o4MT1jxRadBSbm/bkZ0w5sV3
	LLJoJXNd5f1Ur6QKrpz2+kSnyQMvH+oVnqQlzq/DoyMZ2VS4XnqquR8Nyf3JBI02ftUG/nAPmXC
	UIuxeAl8eNosGqlfmNztyq8IVBYHC2nUhfC5A8vegYVWLGR8CBwFy9AWWiYgqB0hzIWnIqapJuZ
	Plx3+HqugmOjeuTrschTpu81C6CsVJxIxzyhYy4m8YqalB+ZJkvpGrRxVjgRCt1QG2ZmyuGF+N4
	AggPuBk3xnRZdlqvh1+8gN9qFBDm2/aa+v+OP3HMz4siZ9N4z4dUJ5wALu5GIgC0WABjACHuFds
	IO4XyD0qnF4I6tuTiBgypmFnP6IljqoUae1kuwDeyMs8=
X-Received: by 2002:ac2:51c3:0:b0:5b5:e2e2:5f2e with SMTP id
 2adb3069b0e04-5b8ae66be2bmr1075835e87.18.1789404098900; Mon, 14 Sep 2026
 09:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-bcm4356a3-bt-v1-1-ce44d0abb5db@gmail.com> <CABBYNZ+553teDOW-43qkf_TCyNr31LP8gS1vQ7YfKvAZ9UnzLw@mail.gmail.com>
In-Reply-To: <CABBYNZ+553teDOW-43qkf_TCyNr31LP8gS1vQ7YfKvAZ9UnzLw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Sep 2026 11:41:27 -0500
X-Gm-Features: AcwNN1VcyFZN_ANvu-LDP0KF6xMSQkAjdjBmvwmWiacirlX_7whxioI6fOHD5FI
Message-ID: <CALHNRZ9FeNaT65WTEJAe8H9ux2CtGVkdoL1-nDVMrdGi5mTxvA@mail.gmail.com>
Subject: Re: [PATCH RESEND] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:13=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi,
>
> On Mon, Sep 14, 2026 at 5:38=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This patch adds the device ID for the bluetooth chip used in the
> > Nvidia specific Broadcom BCM4356 PCI-E WiFi / UART BT chip.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/bluetooth/btbcm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> > index 463d59890befe..14acea7325478 100644
> > --- a/drivers/bluetooth/btbcm.c
> > +++ b/drivers/bluetooth/btbcm.c
> > @@ -506,6 +506,7 @@ static const struct bcm_subver_table bcm_uart_subve=
r_table[] =3D {
> >         { 0x6606, "BCM4345C5"   },      /* 003.006.006 */
> >         { 0x230f, "BCM4356A2"   },      /* 001.003.015 */
> >         { 0x2310, "BCM4343A2"   },      /* 001.003.016 */
> > +       { 0x2409, "BCM4356A3"   },      /* 001.004.009 */
> >         { 0x220e, "BCM20702A1"  },      /* 001.002.014 */
> >         { 0x420d, "BCM4349B1"   },      /* 002.002.013 */
> >         { 0x420e, "BCM4349B1"   },      /* 002.002.014 */
> >
> > ---
> > base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> > change-id: 20260717-bcm4356a3-bt-cd78cc0f42e8
>
> We need some more information, such as:
>
>     Test log:
>
>       Bluetooth: hci0: BCM: chip id 206
>       Bluetooth: hci0: BCM: features 0x0f
>       Bluetooth: hci0: BCM4384B0
>       Bluetooth: hci0: BCM4384B0 (002.001.025) build 0000
>       Bluetooth: hci0: BCM4384B0 'brcm/BCM4384B0.hcd' Patch
>       Bluetooth: hci0: BCM: features 0x0f
>       Bluetooth: hci0: BCM4384B0 AP6684P CN iPA [Version: 1030.1021]
>       Bluetooth: hci0: BCM4384B0 (002.001.025) build 1021
>       Bluetooth: hci0: BCM: Using default device address (43:84:b0:00:76:=
93)

Sure. This is from a Nvidia SHIELD TV 2019 Pro:

[    9.802656] Bluetooth: hci0: BCM: chip id 122
[    9.808481] Bluetooth: hci0: BCM: features 0x0f
[    9.835172] Bluetooth: hci0: BCM4356A3
[    9.837341] Bluetooth: hci0: BCM4356A3 (001.004.009) build 0000
[    9.844428] Bluetooth: hci0: BCM4356A3
'brcm/BCM4356A3.nvidia,p2894-2551-b00.hcd' Patch
[   12.171393] Bluetooth: hci0: BCM: features 0x0f
[   12.198153] Bluetooth: hci0: BCM4356A3 37.4MHz Class 1.5 Nvidia mDarcy-0=
108
[   12.203520] Bluetooth: hci0: BCM4356A3 (001.004.009) build 0109

Aaron
