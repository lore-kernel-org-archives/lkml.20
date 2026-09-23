Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BC847A877
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157243; cv=pass; b=a9Q6ROfGKfu7cQwVs7SZnUKBOQOiUBOOEr2m6xYuAOPtQhn+HnwxXweQrh0h8NkHxEZ8Ng2sxOyKeFP3tSVBsaYW4NfqH62Q/p35UVMagJQVc77RhCDdu4a/ESIgBWaipkT4Qta/eh4TwBeUB3HxpbapgUHuMyPPCKTzBj5DRd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157243; c=relaxed/simple;
	bh=AXXVx5XU+TB9L5Q8qwCBL6GPvaVFbZgEuiAnwyAkIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLoMCEKhYyqz8mWtgYDec9Rn0jqeSk+YTPrgCLZ3+JczioL/8UndbzQ4+CxcnD/5f+1TFi1SlbNj8f4RfTDgEjhxgIz1hSHzR28nhONX6ob5TqRLKHmRik0B6hWZ3NqVYGQCJ4Pf+0hqE91mmhgPhvf+86PdcDB/BmYbU94MMUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=atN66gT6; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="atN66gT6"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d4ddd179eso9596027b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790157240; cv=none;
        d=google.com; s=arc-20260327;
        b=RBknlXSjEJTxNAe4KvJPlS6ZpBMCFWME8R72lo4kegSNqTVkoI3MTrOEcxM9y6+xaI
         xCyvbb20eSWfeO+eZqChYUkZHA8zqbnOn7EgXyQRGMLQPh9SbwTYRiFIIfKZBBACHLeK
         dGPMw4ehYvckc60BVGN9TpUb71f/mHWkk1688zMfHx4t2OUZwN2ByODTrWB3Cu0/Mkyq
         e/cXohJ1aXwVpq7ltJKV6wcLntlju3tVQCjLLkDUoNgO1tCaTVWvDdB+t8TPE+U05+hC
         1h+cPM/DUO/4SE6j3YREufn9CpScROzOWkKHlVHdseIxG4z7pyO47e21lWja7ltei1c9
         a0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        fh=QsNWp2NhCE3arznAR6rRFWl0c1KVPTKjV7HX2zvEyYY=;
        b=mwJjARydmxq4lY9XKOD7isB4xZ9QzvdcuW2AtktC+4AgyefrW8xYLnlquNc24jUVpm
         PL1ohyURD2PjZW8rDhUrLXsRvj319hoWzCZGsJnRY7Kew8QmWwgTnJwLh5/2d8Jjvu9L
         Rlju87/wIs3hCtQvtynCtJcjATeRjUu/tgXCf6ZPJCZ1U/OA2gX1IbosXOa3SojUWev4
         GR9lGh/RJ1lVK03eV/JR2gYFqMFyq9FqFP1a3avw/d9Bv2jSOH67d1Ad/c4MEFhOc/Hr
         7NQ70qThjLO0NpTbyV/eJ7xJVOE67njBCVZKFpvzz8Zy/wrTt3nmA7Psie5N9/NgXyCi
         89pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790157240; x=1790762040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=atN66gT6bnNKklAIcVHzeU9pOFj/S3Nyb9J56sQEB305+t3NHsN5DYtD/xUA+Km3BZ
         7BiUFacVdWq7pT1113uWeiDYLrMZKY+C0Eht+VKYXu4pYLdgiyr/ptzLlIJoXzR5nBlL
         U62JRFkdJBvbv23nwif42YkmJUpcrv0Opq7D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157240; x=1790762040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=2G1YfyOvDqEmaKRFEZp/iGQWPNa1egSLQnPmD3mBpBv9BfF+ZC4frmMRXMyWb5Pz9N
         +aMFhQ3/nXJduenLXuHnDlMjBT7yr3mLKxQ6NUgxGoqOOmYmi7uPok3njGHxMkNObzvS
         Ht3PKpAque1H+Yu3nO9fS4UUgydWTp2V8tcYSOqWFOGB4EqqkE3T1aDNVs9xRtsoRlfP
         f/MKQviK14KHNd0GR5BSbZ5xhIU70aYUsX9uowFqlXl3iOK+Yhd+DBSlf5bAuLNnyOIS
         bwzVjS3ATtfgExvOfTOotGH1m5VP6zSaDswclOkd1VjnoZ9IjJSaw3aHSf3yNBdvQrpu
         BTRg==
X-Forwarded-Encrypted: i=1; AKwUvBwhhDtOniftO0FxGAGZaaemyOLPudRyQg2odpGUwvDJQBe12UmX+mKG5toFh2hblOYdWkr8fB/KXrqmKoA=@vger.kernel.org
X-Gm-Message-State: AFuF++m73RwZ9/N7pBwTp7rSDusbMPtErCT2LSXyReHbQYpN8p8oFJwq
	KMykp4QLIAznG9gDm3yct95NKvSPirTi/0k+H0fnFRguBxGCnyFBsQEuz5+GSV0vCv6FD486hbu
	aFTP3PJRAaivXCgpQvDczt+Bnu3cxu7svan+ydUMX
X-Gm-Gg: AYBFou34RxoDZSsMVLlx63SLk1lZi0Q06UlW1cBpyiWXW6dBD43xWV7eW9mRhVRgs+I
	kxDDWqW7q32avYq5K98GuWUqt7CxOJylOWdcu2LNKdf6GRLYDWxG7nMcSJLQTrYtFShNlfzKMfC
	1bvS3HKV1P8ySP+DZirE4spj3AV8p2vA5K2Etc44XGW5d/jy8HNw9PNiL/QbetWFr/5Fub0Alu/
	Qc0eiYjK0Qyxwv3w30G6FeG/0Z1L+HBjVEhJZYmaeng09LloN227P2wCwruJ/dsE7J1p+Z3dFBj
	C6sIMQxfcZkekUBYW3nwLwgTZNqb3HBky3HcgR7D4vXOzXoAzugpmm7W
X-Received: by 2002:a05:690c:7011:b0:89f:4c20:73d5 with SMTP id
 00721157ae682-8a457891187mr16275917b3.6.1790157240628; Wed, 23 Sep 2026
 02:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
 <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
In-Reply-To: <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
From: Ying Hsu <yinghsu@chromium.org>
Date: Wed, 23 Sep 2026 17:53:49 +0800
X-Gm-Features: AcwNN1XyckWCvbLuUPclr9L84lJ4nL1-DpksFwXIj_myJJABSYaeMKkWJtFwAPA
Message-ID: <CADwQ6b6626zB1+Ms5JOSjp3fP0RJrE5BiQFqMh8Ra1c_QFVgmw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Bluetooth: btusb: Fix leaked runtime PM reference
 in btusb_reset
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Archie Pusaka <apusaka@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jing Cai <jing.cai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another way to address this would be to let the USB core handle the PM
bookkeeping instead of doing it in btusb.

On Fri, Sep 4, 2026 at 4:04=E2=80=AFPM Jiajia Liu <liujiajia@kylinos.cn> wr=
ote:
>
> btusb_reset calls usb_autopm_get_interface to resume the device
> before queuing a reset of it, but never calls the matching
> usb_autopm_put_interface.
>
> usb_queue_reset_device ends up in usb_reset_device(), and since
> btusb provides no pre_reset/post_reset callbacks the interface is
> merely unbound and rebound: the interface device object survives
> this cycle, and so does its PM usage count, which is not cleared
> when the driver is unbound.
>
> As a result every reset permanently leaks a PM usage reference,
> preventing the interface from being runtime suspended again until
> it is unbound.
>
> Set BTUSB_RESET flag before usb_queue_reset_device so that
> btusb_disconnect drops the reference. If the flag is already set,
> drop one reference.
>
> Fixes: c9209b269afd ("Bluetooth: btusb: Introduce generic USB reset")
> Assisted-by: Claude:qwen3.8-max
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>
> Changes in v5:
> - no change
>
> Changes in v4:
> - do not return if BTUSB_RESET is set in case the first reset failed.
>   (sashiko)
>
> Changes in v3:
> - handle multiple reset requests int btusb_reset (sashiko)
>   set BTUSB_RESET after usb_autopm_get_interface. If the flag is
>   already set, drop newly acquired reference and return.
>
> Changes in v2:
> - Fix the race window (sashiko)
>   set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.
>
> Changes in v1:
> - add usb_autopm_put_interface after usb_queue_reset_device
>
> ---
>  drivers/bluetooth/btusb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6f7946709266..61c18402911a 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -1068,13 +1068,15 @@ static void btusb_reset(struct hci_dev *hdev)
>         int err;
>
>         data =3D hci_get_drvdata(hdev);
> -       /* This is not an unbalanced PM reference since the device will r=
eset */
>         err =3D usb_autopm_get_interface(data->intf);
>         if (err) {
>                 bt_dev_err(hdev, "Failed usb_autopm_get_interface: %d", e=
rr);
>                 return;
>         }
>
> +       if (test_and_set_bit(BTUSB_RESET, &data->flags))
> +               usb_autopm_put_interface_no_suspend(data->intf);
> +
>         bt_dev_err(hdev, "Resetting usb device.");
>         usb_queue_reset_device(data->intf);
>  }
> --
> 2.55.0
>
