Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323474;
	b=DJRXDg/H6CGcmfPAaukJdE3eTPDR6E2IVr2koQKgQdjVmDlTvMGYrkHQhCN0o05MltcS
	 tEaVgTstku45xSgMTYdmiKu5txb2hS5AYKFiS6Wctvngke/O+6dCkWO1Ic3edr75glX8K
	 HvU2KH9+b5IPgWyqSN/DpPvDmj39XEexzblc8UTUAYX+DYLTq/x2PYxi2uMQR6rDmKm0f
	 l/MbXmCaKdw3e7b28eoXny1BILAOjGmouUAh+mvS1nM3+UHCheyAksuuffg9qw0AhvNGl
	 88LhEHPY0AYDzWpl+HZ4l6VWVIhjrpjtXJ+Tnrk1kjsUzU2jjEuqvuyFFj7gJ4shRGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JfImUIKbgBOvjOPJtdSabfWvasfWg/hSkuUqdlRqigQ=;
	b=UPHcyruf3HgC8l/7JCRdJGQg41dp8axb8Pn3PvX2a9wP+jjfI58DLl8WYyunHtR280Fc
	 mVIZCXjLVU3QYzEdJI1p33VEL8h+93qufbOnvH8/n8AFFgwxFY/5IAFnAMeKYayhcsdvs
	 6BDeRNJzzvEKw+dCNehffX/WMkceteb/3KnGviLBvu1UTQv55DezX47T8LHP7ulooww8T
	 PZlfe5Rf4s1OMq/nH0euAZzYFccGbDTNtGVqXBKEodZtyYsUCcpE3b4HaDRGUFs0w4UDl
	 qzKevqCNHw9I+3PXoYtIIACy/FhXIiBp8tmaKQcFe3/y4C6wEOU38G9gTzhIHWW0pvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEkxyspm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F15606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F15606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEkxyspm
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b3a332105bso2511797b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323473; cv=none;
        d=google.com; s=arc-20260327;
        b=nhST6XDMXYanZglCYUehJ+hE2H9UnVPbH/1PEDo8rkrKeong5Sc5KOgTbXUEyqSHsd
         RFGgQw4IxGYBmeu9mqAjvycDC+cx2ycpxCbdrK2Srh/4c2nayS3Aqq5iTvE3dcCnOZVy
         7Nd0O4hX59XOPeCtlvsPCBJJd6sH1DTcs9a3oQoPsquZdv85m+2jh2tpjRKId0fTsfuV
         M16QvLo4MFcRVJpmjuOv2NQcLrUonDWojn5wrD+rN7fjpohKo34uXGdoxCgOpFjfWymq
         COvVdPamiuxr8Dz+OXeN24JcUeWwigwKlzAU3uUk0R9BIxODr8eRrIC6BoUZ3T3USfGa
         5Z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JfImUIKbgBOvjOPJtdSabfWvasfWg/hSkuUqdlRqigQ=;
        fh=RS5LUk+EIXVF+H4xYXVcc45l/KssbUFcxSk44dkrKS8=;
        b=UCuA+mFSBzf/Iw23dAC+rLFUowiyXlH4ycTvH1tIpYXrIPmiGmt2NBKZqW1ewqYPlw
         TwQKrwkCT7XsUgB5MycNyrSAGblC5TVLadvYNUdSGPjNYeRMeXxKExCEwkTjTePkzUKu
         Mv5zh1t7fnb1SIT37ap4MRgFqfyzOyei4g2gbRLYJr2qg5Tc012+K7SRuKkq5cwb4qVm
         0tjviThifWa7+PX8XIky3wPTf6XDw9Hb5IdYqzRNKgbNhD7GAU1cQelQSELajPzJpDD+
         WRR/L2yhXT/nmYslXHL5NeBc2+sBaffdl68zV17gYChxOdAEdUm1d+a0fzehnih+H0h6
         0zdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323473; x=1794928273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfImUIKbgBOvjOPJtdSabfWvasfWg/hSkuUqdlRqigQ=;
        b=BEkxyspmKNnBwgGD1le3LUrb6O7S9br2n9OnXxyeKH4vPKd6lDXl68kyuhSP5MbCvr
         6c4sPDhrHcgdHDrzs1BeIRwb4segvJ/I+JsnVuU5ZJgf8sRlb6eTp4TF0zerTYF1p1jg
         5OATx40g9K7KyUGFdH/8f4VJy0RUNptqnMTXwJ2eriPsp3/1FTTyj6DPRM2l5QkFJ28u
         4l89PKqrvLF4M/WoBpDrvpg+mzrCJaaqZaugKTzpSlPSF2Bg/Uz3dyqGvZNGI8VjZeeO
         x7v7Mu5eQUqGM261FojIPuwuss6/0nK78r8diDzbN1eVDnAoSBGXSpbE302W28Jtt3gl
         suVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323473; x=1794928273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfImUIKbgBOvjOPJtdSabfWvasfWg/hSkuUqdlRqigQ=;
        b=M2pQbwOxM00+lUnYQRxTZWQBmNEZ5RIXRStzXKJnEHP/FcLkSgLjo29VcYv3alRU85
         2icXwHZC54iwtY7QrLXYPPJJhztNVDrKlQP/zVzEFlBhpZoiHRk7Jz88jYAKXWlOuh/t
         s6bjQzktCGUaE4rQFJkaA5UxLzuSq45Yk+5FCvEUbhF1OQ9tBveH4MVTw/Zjhk3o7CLC
         x8VsOqVAdVQc9AOTMfaggfBFZrd8UBmxUd9GfoUwGux859fLjTPeMABiK2Xvdqqx+dzn
         YZVpxP7HwQE6vrfnUj8xwe9PeLGPsm0OxICF2VdaikOqwsMsZdLhrkHRzsddwdEu6P/H
         CsFA==
X-Forwarded-Encrypted: i=1; AL+hErEqGWm7hKHfahhJzQGP6Zpa1NEFWSweHDR4OSL4gKICSuOBoIq/OtFO4kVszMHS0kHCB7Qm1TYCfV3+2A4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ggP03Zlu926YGeRo0jt1GRGGgkVpiT+He/Tgz/H6NAiBHcce7
	0zZqxfPlY9xhSespjgamW/f19P2YtnQ9yNhHZZOK6hWPO6S1l5oost/Tgnu+MZAH2FsWAICYovz
	wdHdPrEdqvNwO9PYyKVrfn6Jk3ZfmRvI=
X-Gm-Gg: AYBFou2sIlmYx3MkS4ZCdivOS479Izk6phyhuO0BllFhavfgYcmoGGfo3Y5IYUEMOMb
	TXmoYilqHuVcoZfyZW8+en3QIpZriy8nId/z3bJv5PPc9nqzoz8+Ig1ojCFhFiXpLpQUQGpnHt0
	fW5Wpd3F6hYvn15Rp87ZkSAmzuCIZwlsacePq/v0aGWJBeqTATGD2l/cbpLBtCZ19JPfoLE87te
	5mnc1vUoJj4lbsGWwW55gBjS1kVg57m9mHL2lodcyoIc311NPx9J+72cVyc65/Pv9EGNx5bl7t6
	Me6mrgd4WaaexX+UgPi2DRcgwZzCNUb9cqkJgi78LD0Xulp17O5KidbMoQurOvKGMzCXsBiMll9
	tXn9zEh1xclAIv6uOsDX9msQuo+dPzphMT5GokPxMtiZM3FIzqS8oPmFahADk7KuCeZ9eXYcJTb
	jx8jqtYYaxjrUKwl/i6EWyOtAS5sTTyzZTqLzLDlEIUzXqGy+rgF0AMft0
X-Received: by 2002:a05:690c:f8f:b0:8b0:cd32:b8dd with SMTP id
 00721157ae682-8b392630812mr20533077b3.17.1794323473171; Tue, 10 Nov 2026
 07:11:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADq=QSxw-5LstC5McTqfsp9NaVrsUcemepw2g_TJXNrdpgFdRQ@mail.gmail.com>
In-Reply-To: <CADq=QSxw-5LstC5McTqfsp9NaVrsUcemepw2g_TJXNrdpgFdRQ@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 10 Nov 2026 10:11:00 -0500
X-Gm-Features: AclHuK_GUiwCVuUhAn-ajDH8D9wFR1ipOXSYvJeuudI1cZ9x_iMQK-rERRc69EA
Message-ID: <CABBYNZJ2zD42-szQ5KWExOVkSLPmO8AH-FNyO2Eq3V4bfSrVxg@mail.gmail.com>
Subject: Re: [BUG] Bluetooth: stack out-of-bounds write in eir_create_adv_data()
 and eir_create_scan_rsp() when a controller stops reporting LE Extended
 Advertising (seen on 7.3.1)
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Piyus,

On Mon, Nov 9, 2026 at 11:57=E2=80=AFPM Piyus Kedia <piyus@iiitd.ac.in> wro=
te:
> diff --git a/net/bluetooth/eir.c b/net/bluetooth/eir.c
>
> --- a/net/bluetooth/eir.c
>
> +++ b/net/bluetooth/eir.c
>
> @@ -300,6 +300,16 @@ u8 eir_create_adv_data(struct hci_dev *hdev, u8 inst=
ance, u8 *ptr, u8 size)
>
>
>
>  skip_flags:
>
>      if (adv) {
>
> +        /* The instance's length was validated against max_adv_len()
>
> +         * when it was set, and max_adv_len() depends on a controller
>
> +         * capability that is re-read on every bring-up - so by now it
>
> +         * can be larger than the caller's buffer. Refuse rather than
>
> +         * overflow; a truncated AD structure would not be parseable
>
> +         * by a peer anyway.
>
> +         */
>
> +        if (ad_len + adv->adv_data_len > size)
>
> +            return 0;
>
> +

We probably need to unregister the advertising instances if the
controller changes its max size.

>          memcpy(ptr, adv->adv_data, adv->adv_data_len);
>
>          ad_len +=3D adv->adv_data_len;
>
>          ptr +=3D adv->adv_data_len;
>
> @@ -342,7 +352,7 @@ static u8 create_default_scan_rsp(struct hci_dev *hde=
v, u8 *ptr)
>
>      return eir_append_local_name(hdev, ptr, scan_rsp_len);
>
>  }
>
>
>
> -u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr)
>
> +u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 si=
ze)
>
>  {
>
>      struct adv_info *adv;
>
>      u8 scan_rsp_len =3D 0;
>
> @@ -357,6 +367,10 @@ u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 inst=
ance, u8 *ptr)
>
>      if ((adv->flags & MGMT_ADV_FLAG_APPEARANCE) && hdev->appearance)
>
>          scan_rsp_len =3D eir_append_appearance(hdev, ptr, scan_rsp_len);
>
>
>
> +    /* See the matching check in eir_create_adv_data(). */
>
> +    if (scan_rsp_len + adv->scan_rsp_len > size)
>
> +        return 0;
>
> +
>
>      memcpy(&ptr[scan_rsp_len], adv->scan_rsp_data, adv->scan_rsp_len);
>
>
>
>      scan_rsp_len +=3D adv->scan_rsp_len;
>
> diff --git a/net/bluetooth/eir.h b/net/bluetooth/eir.h
>
> --- a/net/bluetooth/eir.h
>
> +++ b/net/bluetooth/eir.h
>
> @@ -10,7 +10,7 @@
>
>  void eir_create(struct hci_dev *hdev, u8 *data);
>
>
>
>  u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 si=
ze);
>
> -u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr);
>
> +u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 si=
ze);
>
>  u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr);
>
>
>
>  u8 eir_append_local_name(struct hci_dev *hdev, u8 *eir, u8 ad_len);
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
>
> --- a/net/bluetooth/hci_sync.c
>
> +++ b/net/bluetooth/hci_sync.c
>
> @@ -1563,7 +1563,8 @@ static int hci_set_ext_scan_rsp_data_sync(struct hc=
i_dev *hdev, u8 instance)
>
>          }
>
>      }
>
>
>
> -    len =3D eir_create_scan_rsp(hdev, instance, pdu->data);
>
> +    len =3D eir_create_scan_rsp(hdev, instance, pdu->data,
>
> +                  HCI_MAX_EXT_AD_LENGTH);

Ditto

>
>
>      pdu->handle =3D adv ? adv->handle : instance;
>
>      pdu->length =3D len;
>
> @@ -1609,7 +1610,7 @@ static int __hci_set_scan_rsp_data_sync(struct hci_=
dev *hdev, u8 instance)
>
>      if (instance)
>
>          hci_dev_lock(hdev);
>
>
>
> -    len =3D eir_create_scan_rsp(hdev, instance, cp.data);
>
> +    len =3D eir_create_scan_rsp(hdev, instance, cp.data, sizeof(cp.data)=
);

Ditto.

>
>
>      if (instance)
>
>          hci_dev_unlock(hdev);

Next time, send it as a proper patch, so CI can pick it up and Sashiko
can analyze the changes. Also, and also address the claims about it
being material to security@kernel.org don't hold anymore since you
just published it to linux-bluetooth.
