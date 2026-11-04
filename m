Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793819850;
	b=qxsg37vmddtuw8kYvBMSeZItPabCRk6ZqnXhUxk+LVPV+866Nv+JWRod2IdsEAGZdxVU
	 DQyiVPU8H8Ybc2EorYNNz2k3ztq97YjAWjvLJ9jXNA80pPSuMUcbLitH38HhIo8jIXnWv
	 2LeUt4LmIa0V2+wdawFf56WpSr7ZB1vqq6MwMQiq7vNzxUfT2AKKrrFMLnXVLdb0E0rmi
	 PWnw37kNyNQb9Ny5y8ffH9wlCOG106TNEcAvEIzMOUUJndOUMs0Au+182GOBbqNwlNVfJ
	 3ssFduOEiqAFylPo2jlWGZiGqDuyGFM3Odz64KNYQy057zH+gIGYu7JjgXdlrD308ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X2FkZOaTFMA6Pn4J0yswUwZWXL0yiL9M7M+FKObeBMI=;
	b=oLew2fVQtWBo+6xn3G8A5jzmUQeiq1/e6cGolTJb7NL1Sugr1WoKlo7nCgNvwo4tgN7z
	 rsVaSokUwI5d9mPLuP1GhI2tEic862i8WJyYoFNOwFhy6GFMayYZrmwNQDhgPlgBin+lD
	 UXJ351RLkiLsl+2wfNMjCDQvqspVnaU4Y2Rwb1mznC+XEW/l9GQLblzRwPYSUETpCw4Ju
	 uOkoe1nWkaHJMcxdFOC4msrSgGR4UCcVh0HmYzko+ecTaBNQ2mAYvGfEhIO47MzpP5mYs
	 4tUQC2Coe9pkBXuhwKaG6yV4PCpe38lHmFDttUdABvolZU/4cLa8b5HVRhQEXbGVgNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DczrfccH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8660A2624
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F8660A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DczrfccH
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0dba37a7fso10434417b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793819849; cv=none;
        d=google.com; s=arc-20260327;
        b=nERIDUY9Qz04+YA4VMIwPY1JtGpxABbRSOQb4inwsb6Sc+TSxOYDJx62mL1zPPoVX9
         tMa8Ww5QXnMULppOB5oA2YCJ/GWzME65ie3QUgcp78F8XUiOESkMTLfZDmWPGHwextuw
         JP+Ti8PJnoU7bwh6UFInKzuOmjUvnkNR96ok82bMX9pvYSE7NsI2h3TnRcD5vs1CA0UW
         qNYCvW1u5Bvghm8wuuQEDPUIUSVNBmllh7K6BbIJAW6upLetnjiBGGmST+4iVAb8dXWy
         2TY9K0572gz85huCrRr+P8YaGDzok94thHIWpC/At7D4vvSguDn7oErrVCD5YRnrkr7u
         N+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2FkZOaTFMA6Pn4J0yswUwZWXL0yiL9M7M+FKObeBMI=;
        fh=2W7TWYtFU0bn27Ew1lIw/aJwj+5ZRKTgY2bilIAUiYM=;
        b=k5zdHi9eobwAIDSDWlUGr0a72vksMB12jNvmk6/ysTCkc77vmkOY0gqcjAduFCu/ua
         5p3mhsSLmayA/0pXlBZw2LO4SMzTr9hgA67irtSvOFIWFh8PAt3gMdaEuII9ZhP+6F4s
         gyy+xXO7B4jEUWcZyHQAB1u4tnG+U3w8N/HJhlJ1ExGKw5F6jeuAm5XdYHLiHcrmf721
         x6/6isv0BdAbKfg/i46LIk5WFYgMbCNrhP1aMuF89RHMk5JEnYoBBb3VL11rmtmwifld
         6O2Ik6LjjYgI+xYIdk25n1NUYoJb4+0zOfQ8tM55i2QNDKUoAb1tL0onmWmAUtRxGoDk
         6yhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819849; x=1794424649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2FkZOaTFMA6Pn4J0yswUwZWXL0yiL9M7M+FKObeBMI=;
        b=DczrfccHl1vCyfye/MRZShyO0W7Vf1kRuO/DiQYoaNOH03T3Tz1GxvlATnfwiva9JJ
         1M3f3I4rBWdMsOqaySVcF1FA6RC974QbHcUoLVxb1R09dVZnNQ5NHrdDt+XIoE9XzOGS
         usa4jLpmdkL8BdaovGZDewJ3dtam3tMC0x5SvxGrorazWbpGtCxXN9ulX+pikgTWS4WY
         HONca1YNCn33KM9j66uy0zhvNK1GU/4/FBAI0afGcOnF4v/N0tzJedr/FbOhp45SyIpW
         JMioSuqPHkhBbxRi6EVwS79MHxwxzdaOe3150wKDvfPte+5o7JuDIb96uqYgdbc8Iw9W
         I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819849; x=1794424649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2FkZOaTFMA6Pn4J0yswUwZWXL0yiL9M7M+FKObeBMI=;
        b=YoRI6F2OMHhxvPElz6GZNtRecPlJ63lXyQAZdP55i6RRzbusk1m2wZp/Bjtr53zfiL
         fOh/6sGboqQk1piYWDrjJNklGpPb3OYns+Ajf4zB1avar80x0n8OkqpmG+q//PRLvobu
         6w88qQznRFM1Qr/HbVnuUx0hsZNTwIRKIFbYhFGJm6Ka9AOK64cMKApZ3ypvO9FD/FbN
         zznxc9mORIMZ1W6tCvOkB3iEyx2hCXGjXShf7CIpye7McjuOtvQmqYBgGyz1dnZF4CKz
         BRxWi6jN+g7PdDDB8reZ7n+KtpikKnRseDjtOWcp59EnhuNAcFInhQn0rn8Y46CI42V9
         UzZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY0mf4rXC/8cLUx+W1HYN+uAq+nlTqU7JEOYTQhrMn5nXmgL1oWVYK5oOClJ/aTNhNZJsyi1xr8Gp56xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3UTon/TEM0Dimwo4nm2O3W1jqqKHd4gEJbDrDkTtBrceck9Od
	4e/c32kFBAky0i5xJdvbAodxKTu3Gr6+7KOSKMX0yV9VB9FuGfOUNbfGf4z5wM9qCR3wbxyCw/c
	pcNpx09izfID1XzvoHwA9KEwZhg35mmU=
X-Gm-Gg: AYBFou3BvwnQXvEcdz6GsLYqjBCNpyKIYgE19Hoaf+uX1tAD3RYbAV9fo0wl9JgrdK0
	YJn17aRyFcMnF0THcDLiKTu4Upo0rHmzcUrwuFPhv5Sh6jUKsOS2jnI8m9ik5VL8zqdIZbUMTTG
	+ub9NSLuBOJ1cdRhZ8f9eKMsvdIFb7PHYA3A1eU5kNb0uvtU35Zx5s/UuTquLhtc0YLhp8NCiW2
	x9ygRPTr3crOfY7oupuOr7biTXzIsXZ7JNFQiuAyR3AlxQnnbNAt0fVcO16ITKdiFbpi5R0G/T3
	trppHUlApPUVGx9nyx4IEbP4S13L06LgQMKz1I4ITffF9SPGypf0BYQFVCJf1xrN2lmxKbrx+Ly
	r3Euka84ThL7x5/I9shUpo/lX6zyXnUL9oKkpucGHJu5bopsXTTuPi2f9++Vya5wkq2j5eG84XO
	UJi1/M53H7A/iBcIfuMI3ZBuhSOKX4PdqZE8OprR9bElw1/ILz/6ZbKMpE3W4hq01JmDehX0AZh
	yculw==
X-Received: by 2002:a05:690c:ec5:b0:8b3:392:dc1c with SMTP id
 00721157ae682-8b30392e155mr29915517b3.36.1793819848895; Wed, 04 Nov 2026
 11:17:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102110440.2589-1-25031212351@stu.xidian.edu.cn>
In-Reply-To: <20261102110440.2589-1-25031212351@stu.xidian.edu.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 14:17:17 -0500
X-Gm-Features: AclHuK8Gh1sKwYgmSHyb8ITOSoc6I6dAtMKDKXBc5cQEbXG-axXVKo592cfZme8
Message-ID: <CABBYNZ+iU=riZ8MSTkbqv4vn0OJGLymtN98uJ8_0pw6hEaVWYQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: fix use-after-free in force_poll_sync
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi YuanZhe,

On Mon, Nov 2, 2026 at 6:04=E2=80=AFAM YuanZhe Liu
<25031212351@stu.xidian.edu.cn> wrote:
>
> The force_poll_sync debugfs file uses the driver's struct btusb_data as
> its private data. The file is created under hdev->debugfs and is removed
> only when the HCI device is released, while btusb_disconnect() frees
> btusb_data unconditionally. The HCI device can outlive the driver data,
> for example when an HCI socket still references it, so reading or
> writing the already opened file then dereferences freed memory:
>
>   BUG: KASAN: slab-use-after-free in force_poll_sync_read+0x129/0x140
>   Read of size 1 at addr ffff88800cfb7038
>   ...
>   Freed by task ...:
>    kfree
>    btusb_disconnect
>
> Remove the debugfs file before the private data is freed.
> debugfs_remove() waits for callers that are already inside the file
> operations, and any later access fails with -EIO instead of reaching the
> driver, so btusb_data can no longer be dereferenced after it is gone.
>
> Fixes: 800fe5ec302e ("Bluetooth: btusb: Add support for queuing during po=
lling interval")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
>  drivers/bluetooth/btusb.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dc7191bf4234..d928580512fa 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -1066,6 +1066,8 @@ struct btusb_data {
>         int (*disconnect)(struct hci_dev *hdev);
>
>         int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
> +
> +       struct dentry *force_poll_sync_dentry;
>  };
>
>  static void btusb_reset(struct hci_dev *hdev)
> @@ -4560,8 +4562,9 @@ static int btusb_probe(struct usb_interface *intf,
>
>         usb_set_intfdata(intf, data);
>
> -       debugfs_create_file("force_poll_sync", 0644, hdev->debugfs, data,
> -                           &force_poll_sync_fops);
> +       data->force_poll_sync_dentry =3D
> +               debugfs_create_file("force_poll_sync", 0644, hdev->debugf=
s,
> +                                   data, &force_poll_sync_fops);
>
>         return 0;
>
> @@ -4602,6 +4605,9 @@ static void btusb_disconnect(struct usb_interface *=
intf)
>         if (!data)
>                 return;
>
> +       debugfs_remove(data->force_poll_sync_dentry);
> +       data->force_poll_sync_dentry =3D NULL;
> +
>         hdev =3D data->hdev;
>         usb_set_intfdata(data->intf, NULL);
>
> --
> 2.34.1

Looks like nedev sashiko has found a problem with these changes:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261102113654.8724-1-2=
5031212351%40stu.xidian.edu.cn

--=20
Luiz Augusto von Dentz
