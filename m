Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488250;
	b=gW/Wcey/u93CEnzF3fO9gFIThHHL34YxzObPQ23igN4Dk41vXoWr+Z2vhbn0sL/lZj0e
	 t+/QgZT4CwbuHCPpKS4H/l5qr89vVJEB3iluuuWHLErqLqhEdA4A520fUyE6DzSD/1Dt1
	 op2Fo2dnIVCwov4qXYpm0GMcYs2aeHusoTlj5T5Ur3TzDJk5fVk8UqyD30m2C9JiPy1Ia
	 GGHwkV+UOrKJC92ch4X1URZ3PiQGZj6DCR2apqyAiiQSDOnfqzwR9ToEUTjQ7XzU4qcPg
	 NzW0zExAUlHxl7C+acvQOItYo6w+Yc4E2DEnww/7w3thmVqMZQ1JSkhbnaLLg5N407Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QwjtaejwHcpDXMAslS3uVhsx3lI/CrcCuwcEtURbnWQ=;
	b=qFyQxK5REniIpiu7f0rnTKEUBNXgB61enHAAQgztV8zmMza6MSsadwmIBJY61JhCFrZj
	 7gyzyVYumbzfoBERhhLaRXepSxqbztARQ11q4OuYxGX/GqP6/h3+VSjM1Vi+ld61bGlpR
	 CjUHrpKK0K10jq3kn8Rg8Mz7d7zFWp+E6PKDSlPlvRrhuLCDlc7xlqtU7xW+FGr9SHfRa
	 lChzIVxBGSPrRiCEv1ytl3yd9jrOQxtbYcaNBeg+0cIG+ZleIjlehhHYI7B2b8A33dMdg
	 M8OBYFkYq7ZXQGv4YsLiiNnSuHFrKmYCHeomefZTE3WqHgYREnniNsXaK1WQjJPkeJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Ck8de3oy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98667606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98667606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Ck8de3oy
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so4835746a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794488248; cv=none;
        d=google.com; s=arc-20260327;
        b=nvqCrcE63tsH/HjAvV6okHBH1eZJ9vjxAErSg3fE00+6ySYb1ng72lyuRo4bWAAor4
         YhSTUe8H5/kWj9aDnhfW8fMqMr6x1DY+ToSQlHo3ftQH5sFa04c1C54l4rN6q3TMvYAj
         qrJGsSOTX8iyrPJTl2yxJB4saJJpPQ7+fnSavUMyX4DD9kKi9T+Ykb8GdEsL7Q6xdzMN
         zgBijzCFlRXde0H5qWpGQUEj2+fB7MV5Bi8m9hIKxkpekOZjS47wBhHEFVB6dmi+awuT
         UssNSd/PhaJoHruNahwI6uDBduSubNKQslPxLkPUP1CEGSQ/y51mxJv+u+73x2X/+SQS
         eXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwjtaejwHcpDXMAslS3uVhsx3lI/CrcCuwcEtURbnWQ=;
        fh=0eNsufIYuafSasIK2IkgC9Tn6OKlDKVQEFlBdOTi/Hg=;
        b=i80i3+KmThH09V4QSPjtWVhCmcvs4xWgJbqOwN1lAde16tu3cLfs8LhHuf0QvsGAtp
         wy+61kdE3XAnn6Js+PTikr2BuYOSlNMIYByNp66Ol1YC0y6UrdJtnrAs5kZlC/fz5Uyu
         rJy6A12MVBF1JQeHhXoKoyhAilr3d+oTmGvdW3NOH/G+MEugkXLYjdN+Ph+iEwG0Eq2E
         /hhe0HUKPcnvYDsEaAV01d15I//tK31lwHuHzAa6ZbbtFeFkitFlgOXpUgSKC4QNG7oJ
         d5qeXY5tc2Z7VgxFtMoTIHIaZr6yJLUNU9B8pN3v4s7vrKHsPm1T+9Ux2eMfe3NvluZG
         XOiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794488248; x=1795093048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwjtaejwHcpDXMAslS3uVhsx3lI/CrcCuwcEtURbnWQ=;
        b=Ck8de3oyVOuBXjWWNERiRX6kifNx8Y6MwGVEyjQs4mgvSRlaUnGfKsMDQ7pOTpUSxF
         LLMS9doO2ZHoyUP0Qx9wiKw4888CBVO6ETO8Wk8/v9kucYwkNb5A1MZa7q4Apcf5fFIz
         M3MM7Y3BrI2lk3WEZG2+KrbFX8qXRLUMcKjr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488248; x=1795093048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwjtaejwHcpDXMAslS3uVhsx3lI/CrcCuwcEtURbnWQ=;
        b=jCfM1itjXF1uOgrBBWiV2F6ogvUQQRJF92G66C1UO7E+u8W++zNFzU3lcoJmHZ3l8L
         jBNx4kLme9QSoW/qVRdv0h4dWrd3/DI3oI/RQJojqw3oqDVsOdqOYh9CSbL3UfFka7VR
         zS4gISCdQGnBwskwXMSwfwHex8InlEqYBL8kmpsWtnwKAehMYab8ReJ85cMp1qTmOJ5K
         SY7mXyqrbtGjtB4W1+kj4kD+FcvOku1nA9jQZgw/2mXC0RHPKa2wcTH3tsMZfvXCscUQ
         d4SLX3ESK2YpCaVJD5EzdaOh6StTWENny2gb6alhHN32pFVlc+AcH94lh+nh0Fpxgeuj
         ewgQ==
X-Forwarded-Encrypted: i=1; AL+hErERyba1KGtxQR1fzx/OoPuGwFvWfXxjDni9uS7BOW1btyaDZ5UgGdN1sL4/0IOGlKGyZwJa/WFAWaTdPAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KhVi9xWu/lA2bUsv36fSEiZik8c0IK5YL8DnQyc7+Ach8LUyO
	C2+hL3b1HOeTY0Nmke+Sn4dpHDCMgPZQgZpkX95JQjp4c766PUeWBRAABeYh56geJfVjevof0nh
	F3V4zGqSgeBVHYqLt4UXrMi22uBWHfC6FQQ0ErHNf5dHs/0ockc5YNL4Pi3qr
X-Gm-Gg: AYBFou1+A5dYvDQxYU4ihuKG4r5iAN81veJ5seIx5PVWEGLhyrMayBE+NfkwqqJoF4U
	fHiUpT6RxDqFFNghFKS4Q6dHBEml76zP3oBwiWTweyfne+i97httOueK+zpXMWbnT/id3XB6GpU
	5vuvaAKUQH2kyvWBniN3GivV/ZJo0M21r1I10dOZlZEiHyxhVNCKkOANcBkPsREMoX46Ig178NG
	IsZFVkrifCMQMzuQ/Ne3y7Bx2pPp2h7mHfhRRI85a3B9FLzGg6WOHfffqGZMeNG0qxApWMNavOp
	7nfymdGhzw296ltpsuvgaWgGzwatmpQNchn5G2978915sysZsCIflzG1WRabH3IVxYkGYG39XAy
	8Rx7+K4bcX+Rnqg98fba2GjMCr14zx8g6v15Go1dHDTU+chXS9e0v2DsfihxQ+UihJrNvn894VG
	yx3dPY7BXlvXMr2oAb3VMGaracb81caQGQPYlWR6jKwAkYDqYpt1xsAZ8=
X-Received: by 2002:a05:6402:4407:b0:6b7:b0bc:f4af with SMTP id
 4fb4d7f45d1cf-6b7b0bcf5c5mr873269a12.7.1794488247914; Thu, 12 Nov 2026
 04:57:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110175334.676816-1-piyus@iiitd.ac.in> <20261110175334.676816-2-piyus@iiitd.ac.in>
 <CABBYNZL9GjdZvU6Z8B2v5_5iGXBno5K-GvqkKfX5vjEaTkV9vw@mail.gmail.com>
In-Reply-To: <CABBYNZL9GjdZvU6Z8B2v5_5iGXBno5K-GvqkKfX5vjEaTkV9vw@mail.gmail.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Thu, 12 Nov 2026 18:27:16 +0530
X-Gm-Features: AclHuK8hls-AW8yfs8-PRYUOyj383dNj68tz1FvuidA2KViMtTYZ32vFMU0YiIw
Message-ID: <CADq=QSxbEXxgbZry=d0F5ACxNUST_u2fChEc8XgZ3YR-zyOmaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Bluetooth: hci_sync: drop adv instances the
 controller cannot carry
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

We just submitted another version that addressed the issues raised by Sashi=
ko.

https://lore.kernel.org/linux-bluetooth/20261112125420.3905719-1-piyus@iiit=
d.ac.in/T/#u

Best,
Piyus

On Thu, Nov 12, 2026 at 1:19=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Piyus,
>
> On Tue, Nov 10, 2026 at 12:54=E2=80=AFPM Piyus Kedia <piyus@iiitd.ac.in> =
wrote:
> >
> > An advertising instance stores up to HCI_MAX_EXT_AD_LENGTH (251) bytes
> > in adv_info. How much of that is accepted when the instance is added is
> > decided by max_adv_len(), which depends on a feature bit in the
> > controller's LE Extended Advertising support:
> >
> >   ext_adv_capable(dev) ? HCI_MAX_EXT_AD_LENGTH : HCI_MAX_AD_LENGTH
> >
> > ext_adv_capable() reads hdev->le_features[1], which is re-read from the
> > controller on every bring-up, while the instance list is only freed in
> > hci_release_dev(). Instances therefore outlive a power cycle, and an
> > instance added while the controller reported LE Extended Advertising
> > can be far larger than the capability now allows.
> >
> > hci_update_adv_data_sync() picks the writing path by that same bit.
> > Without it the legacy path runs, and hci_set_adv_data_sync() writes
> > into struct hci_cp_le_set_adv_data, whose data[] is HCI_MAX_AD_LENGTH
> > (31) bytes on the stack, while eir_create_adv_data() copies
> > adv->adv_data_len bytes into it. A controller that reports the feature
> > on one bring-up and not on the next overflows that buffer. This can
> > happen when, for example, a USB dongle answers LE Read Local Features
> > differently after a reset. scan_rsp_len has the same problem against
> > hci_cp_le_set_scan_rsp_data.
> >
> >   BUG: KASAN: stack-out-of-bounds in eir_create_adv_data+0x2ab/0x440
> >   Write of size 220 at addr ffffc90006b679c1 by task syz-executor
> >
> >   BUG: KASAN: stack-out-of-bounds in eir_create_scan_rsp+0x119/0x1a0
> >   Write of size 220 at addr ffffc90006ca79c1 by task syz-executor
> >
> > Both are reached from HCIDEVUP by way of hci_powered_update_adv_sync()
> > re-arming a stored instance.
> >
> > Bounding the copy in eir.c would leave the instance registered and
> > unusable, to be retried on every bring-up. Unregister it instead, once
> > the features have been re-read and before anything is scheduled, and
> > report it with MGMT_EV_ADVERTISING_REMOVED. Userspace can add the
> > instance again at a size this controller will accept. Dropping the
> > instances before the list_empty() test below also lets the default
> > instance be set up.
> >
> > The removal is under hci_dev_lock() because
> > hci_schedule_adv_instance_sync() sends commands, which cannot be done
> > with the lock held.
> >
> > Fixes: 112b5090c219 ("Bluetooth: MGMT: Fix always using HCI_MAX_AD_LENG=
TH")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
> > Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> > Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
> > ---
> >  net/bluetooth/hci_sync.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> > index 9213e3ef9f26..ee8b1cd9dee5 100644
> > --- a/net/bluetooth/hci_sync.c
> > +++ b/net/bluetooth/hci_sync.c
> > @@ -3608,6 +3608,34 @@ static int hci_powered_update_adv_sync(struct hc=
i_dev *hdev)
> >         if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
> >                 return 0;
> >
> > +       /* An instance's data was accepted against max_adv_len() as it =
was
> > +        * when the instance was added, and that is a branch on a contr=
oller
> > +        * feature which has just been re-read. Anything too large for =
the
> > +        * current capability can no longer be rendered: drop it and te=
ll
> > +        * userspace, so it can add the instance again at a size this
> > +        * controller will take.
> > +        *
> > +        * This is safe as long as there is no command send while the l=
ock is
> > +        * held.
> > +        */
> > +       hci_dev_lock(hdev);
> > +
> > +       list_for_each_entry_safe(adv, tmp, &hdev->adv_instances, list) =
{
> > +               u8 instance =3D adv->instance;
> > +
> > +               if (adv->adv_data_len <=3D max_adv_len(hdev) &&
> > +                   adv->scan_rsp_len <=3D max_adv_len(hdev))
> > +                       continue;
> > +
> > +               bt_dev_warn(hdev, "instance %u too large for this contr=
oller",
> > +                           instance);
> > +
> > +               if (!hci_remove_adv_instance(hdev, instance))
> > +                       mgmt_advertising_removed(NULL, hdev, instance);
> > +       }
> > +
> > +       hci_dev_unlock(hdev);
> > +
> >         /* If RPA Resolution has not been enable yet it means the
> >          * resolving list is empty and we should attempt to program the
> >          * local IRK in order to support using own_addr_type
> > --
> > 2.34.1
>
> Sashiko flagged a few problems:
>
> https://sashiko.dev/#/patchset/20261110175334.676816-1-piyus%40iiitd.ac.i=
n
>
> --
> Luiz Augusto von Dentz
