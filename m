Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426561;
	b=JeSYdr/yCUsMuPcJJCghIsY0h/VWRtviNr0TnVM1i0updLwUUXfUoKKX0MjcpfKFTPVn
	 5yyyppK2BMYQeJ4PhEVb9MjGaFooMxbvnE2RYAaKRVk5zsn2hpaNLBkcBiQLrwyl1HGJ6
	 OTqf+hOyzjdo+XkVlTWeL7MGP+ivZBve0KSZjSA5V9CE4zmS8uR+YP6WhAisQQdc2y/vb
	 ppORQ0tugvrP/zgxhUKeTqEzcqQrm5x6ntzyOjaECaah3IMx8egIWrp6bnYpHjEwk5OzW
	 gI3RnK02fCRdZQ2a0x6taCHFnLUjEgKL0Ev5btB5f8Jz130YQS4BdBm4/QFrMO6k7ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GrCovIoPNBvb4tsR5rxNuYJi73Uu0w0ac9LyvXjLqk0=;
	b=UsktkyBLeYwCflLNSz3E8R/qqppWSqFF5Q3FG+J12ijj8BhOLIpuA1B8riRMGZunTIdt
	 0+6UWGGAK7mybpPSnEuOvxp2Z7nEpraIUGvu1A6RRgPL8laZAh7gTmz67ze0F38FHGAYG
	 0IWgI0oIDIWJre9eLPge7mqTXfkoHwoZ+dZsZ1ReaVOXW5eZ4WA7kb3RVNUtHz8jQB53R
	 nYdfiRlbpAdOnQB4F9zBCGCnuFBT7pGtmwKKZR2AHhPXwFNA/DaDuej1fukW9TXmM4gU2
	 D9a9I0vXWymjZwIZ5671iHuV0o8Mt1U0fZZGGpUz0tB7DT3WCsnLdSPLDHWKMk0sCdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dyveBgFZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8942E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dyveBgFZ
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c24619b19so3596276d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426559; cv=none;
        d=google.com; s=arc-20260327;
        b=g5Vzw0RaGqU/1S1ILiI6Sise1OZnYxs0DPVx+88Q165BQ5u6FiaSRaewxLJQlrDEqm
         O9gz3tEur4ynQ1YA0XMbqSnDmq/LkAjtoH70D4JBUPUTxUJOL6BwvjLvPD5a+BT4Nlzn
         tvRzPQfY/6e6NvMxrhMdrrhPXFXT+JIrYjaTSesxPYJQyO8gMMQW6vIrZ74+l1F4Tx/C
         Jx4Km8uHTYDbM4lHMLDFuLoieOln60vq1I3H7xtDSOTKIs5j71aR2FHficIsNTQhhhRh
         ouT2ZFulEvabLyyW49cgRmihq8cD/dLLDRJCGrG7V4ndNkOay4W1sKbPqGM3HVaU8hQq
         WnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GrCovIoPNBvb4tsR5rxNuYJi73Uu0w0ac9LyvXjLqk0=;
        fh=7uJfAmfrb7yjfEoigUrMi6ReGq774LcOpWxBBQHONHE=;
        b=gXqsZhFTNihop1smN2TF2oLWVKSeLuLskHdhwdZb/P9TFJ+ZjX6fYGNX6ZoE9Ziqdn
         4GucCnaDu5j3wbGluRr037L5mFreCLBNQ/GMYtOqUZvGTxILP+g2q3b8U3LgGD+bDhGX
         gH23tiYIEp9Dbg1KKWnfaQl7Npg0lSVQi/7/UfFt7cN7L2F2abgV4eJ/giHarsyAN9QG
         NYbhlmyzCJrXirxF/7yWBAmYR9H6DgUndsxCY3zdAShkLu6nB8xck5giKrtl9RfaAjKX
         FYUSOc17D7CBj52vGDPdn22ORklRko4p3GrmOqEpWsohAFMuyer3gwIb2pLsNbzHFmBr
         DtSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426559; x=1795031359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrCovIoPNBvb4tsR5rxNuYJi73Uu0w0ac9LyvXjLqk0=;
        b=dyveBgFZOSJ1AmxXJr3r+ZDDSuXIK8tQ0OFELTZLAYAsiF2dsH81Vwlxok6b9fbMEP
         t7zC9+EVmwjCOK/QC26cxcLW4IRQaCqP2MWTQE6YzfWG2Tdz2wb4hKYBcBSXBR17Ok5E
         t9vjzioN727NkjJgM1q/lf+Bz0BiED/xbQ9wij/mDpgxo3CKQWQeDMdIzWZXzU0SojWg
         6OU7onAy0aLRvH79OTl/RFgBqhggobkzHqNNIsvr92IpPrypxp+hEcRfuhZzqQvnqbQ/
         v+H4caZ+ytIGVQJd2xzECjkICGv/CIdiWdg+/dHQ8CTkki1meHdcYGi+McEBPK8z5fgL
         cmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426559; x=1795031359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrCovIoPNBvb4tsR5rxNuYJi73Uu0w0ac9LyvXjLqk0=;
        b=RuSMthTS9otoOgZYijMQcwJV10anrp39lKMeJmQV3Iq4+o43zNTaDfJFJyBz6/a2tO
         qexboLYyurZVs6qZn842eZu47qwUHIBfOGX4ZIMeB/ibmStOAMT48xW+w8asc9mR7gMo
         gKeTb+rH7Ub/wXbAleHKyj3fOcG1Iu95eOpGBkoI2ibx5x5IIm+S52Y9XYWDUIS8gcal
         JRooSj0m7RR24u9/Kgv1iIAZA2P1A77RX+yDLiM3GgqFlPWyPRoYmkc4C/9bnGy6TxCj
         aA4N3QIVx3/6wTXB/opAl5j4lLrrz2croQaXb8jN4Uqr1ahEQzpNQQFlCxpgjkZUwfwM
         9xAQ==
X-Forwarded-Encrypted: i=1; AL+hErG57lE/Dz9n7hB7taR8x7/qUXQ3VajTCazpl8iheYA80u56aDtAaaVYpllxXr7MTULdNbZi8DM63fiLHzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85HGV5GOnyn/JBpx4j6rF4UeqHZR8b8ypc68iv6QhiJgIw/1f8
	7q+lB6RDoi3R1HhUKZZvfCRcWR8QHWWsquZt0+jyZ9bcY/NryRuKBcfIyqNP5ljyRaD/xrfkRP6
	OLuPBK3/UwB3pT1ccnWWh5AjUCiIABsw=
X-Gm-Gg: AYBFou08ki32P4uW+iZHIjwqt/pztZTgCl9LF0Iq5ouIfFk4pVPs0Ru2IBzkGxNMEoS
	QDIuDN8kZgbmU+3BXRQYYYuGoY1lz2RQ4Gn0G9AG8Rx1pBh/KFwmpEyi404Af0/0wpyQuw7C9W/
	d2PWESQdA3kRaJ6xeEAnhiX8w6j9lJa7c9M8KwjSoqOxl2/7pFZMvtZjm6YNDl8RJdlk6vAzy8j
	JarHbaxGu0jojjTdOLWbALjPMI3xEXpQ/7NlZOniuDfHkQZaIEBlaDYNTsaKOoGL1waIVb7Nv97
	PdSGS7j/5pt3E76+badTA27pS8aS/Atxz4mLrarx1GcslkuXjzL4pe7FpYxDOgslYgAWW3t1itM
	+Iu2ZTtKSn7zH2ZMPOE9aF/KPtkaHjYcQzSskNEdkJwJq9nImM1aQxzoVgVCXfBunFAneVr2/Gm
	Jhzr+nO7VNKeFPkBEwGQMMIn0DKwO5V31JVIhnSnYGG9tLy3c8wXbHOaRBpeM=
X-Received: by 2002:a53:cec6:0:b0:679:9e0b:dc4a with SMTP id
 956f58d0204a3-67c67f5905fmr1755689d50.49.1794426559390; Wed, 11 Nov 2026
 11:49:19 -0800 (PST)
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
In-Reply-To: <20261110175334.676816-2-piyus@iiitd.ac.in>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 11 Nov 2026 14:49:07 -0500
X-Gm-Features: AclHuK-nfByfHGxFAPmMdYDp3chGaQIH-KV5UpMqKHJaLwdjvVYyKqOTEoEvZVI
Message-ID: <CABBYNZL9GjdZvU6Z8B2v5_5iGXBno5K-GvqkKfX5vjEaTkV9vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Bluetooth: hci_sync: drop adv instances the
 controller cannot carry
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Piyus,

On Tue, Nov 10, 2026 at 12:54=E2=80=AFPM Piyus Kedia <piyus@iiitd.ac.in> wr=
ote:
>
> An advertising instance stores up to HCI_MAX_EXT_AD_LENGTH (251) bytes
> in adv_info. How much of that is accepted when the instance is added is
> decided by max_adv_len(), which depends on a feature bit in the
> controller's LE Extended Advertising support:
>
>   ext_adv_capable(dev) ? HCI_MAX_EXT_AD_LENGTH : HCI_MAX_AD_LENGTH
>
> ext_adv_capable() reads hdev->le_features[1], which is re-read from the
> controller on every bring-up, while the instance list is only freed in
> hci_release_dev(). Instances therefore outlive a power cycle, and an
> instance added while the controller reported LE Extended Advertising
> can be far larger than the capability now allows.
>
> hci_update_adv_data_sync() picks the writing path by that same bit.
> Without it the legacy path runs, and hci_set_adv_data_sync() writes
> into struct hci_cp_le_set_adv_data, whose data[] is HCI_MAX_AD_LENGTH
> (31) bytes on the stack, while eir_create_adv_data() copies
> adv->adv_data_len bytes into it. A controller that reports the feature
> on one bring-up and not on the next overflows that buffer. This can
> happen when, for example, a USB dongle answers LE Read Local Features
> differently after a reset. scan_rsp_len has the same problem against
> hci_cp_le_set_scan_rsp_data.
>
>   BUG: KASAN: stack-out-of-bounds in eir_create_adv_data+0x2ab/0x440
>   Write of size 220 at addr ffffc90006b679c1 by task syz-executor
>
>   BUG: KASAN: stack-out-of-bounds in eir_create_scan_rsp+0x119/0x1a0
>   Write of size 220 at addr ffffc90006ca79c1 by task syz-executor
>
> Both are reached from HCIDEVUP by way of hci_powered_update_adv_sync()
> re-arming a stored instance.
>
> Bounding the copy in eir.c would leave the instance registered and
> unusable, to be retried on every bring-up. Unregister it instead, once
> the features have been re-read and before anything is scheduled, and
> report it with MGMT_EV_ADVERTISING_REMOVED. Userspace can add the
> instance again at a size this controller will accept. Dropping the
> instances before the list_empty() test below also lets the default
> instance be set up.
>
> The removal is under hci_dev_lock() because
> hci_schedule_adv_instance_sync() sends commands, which cannot be done
> with the lock held.
>
> Fixes: 112b5090c219 ("Bluetooth: MGMT: Fix always using HCI_MAX_AD_LENGTH=
")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
> ---
>  net/bluetooth/hci_sync.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 9213e3ef9f26..ee8b1cd9dee5 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3608,6 +3608,34 @@ static int hci_powered_update_adv_sync(struct hci_=
dev *hdev)
>         if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
>                 return 0;
>
> +       /* An instance's data was accepted against max_adv_len() as it wa=
s
> +        * when the instance was added, and that is a branch on a control=
ler
> +        * feature which has just been re-read. Anything too large for th=
e
> +        * current capability can no longer be rendered: drop it and tell
> +        * userspace, so it can add the instance again at a size this
> +        * controller will take.
> +        *
> +        * This is safe as long as there is no command send while the loc=
k is
> +        * held.
> +        */
> +       hci_dev_lock(hdev);
> +
> +       list_for_each_entry_safe(adv, tmp, &hdev->adv_instances, list) {
> +               u8 instance =3D adv->instance;
> +
> +               if (adv->adv_data_len <=3D max_adv_len(hdev) &&
> +                   adv->scan_rsp_len <=3D max_adv_len(hdev))
> +                       continue;
> +
> +               bt_dev_warn(hdev, "instance %u too large for this control=
ler",
> +                           instance);
> +
> +               if (!hci_remove_adv_instance(hdev, instance))
> +                       mgmt_advertising_removed(NULL, hdev, instance);
> +       }
> +
> +       hci_dev_unlock(hdev);
> +
>         /* If RPA Resolution has not been enable yet it means the
>          * resolving list is empty and we should attempt to program the
>          * local IRK in order to support using own_addr_type
> --
> 2.34.1

Sashiko flagged a few problems:

https://sashiko.dev/#/patchset/20261110175334.676816-1-piyus%40iiitd.ac.in

--=20
Luiz Augusto von Dentz
