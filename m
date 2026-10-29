Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793236894;
	b=A2Y9oc5BWXQYjB+WCjP+Z2blqu8XyY9x4yHrVUM+tlbImyDO9GAuiTevNUvjX/LSguyo
	 qMhd7OFirhfA++wc2+evZM/n8RF62anCyo/bJMjfjgoYw498Jhu6MCzTUQVf0z8DxoRGO
	 4/g0DyuMwZ5mP1hEoK4K3ucYKGgeNAZWwDXVIQ72Or4Vj2e2tkx05NvgF2EvAJ2ON+JnV
	 yX0X/c/7VXH48jcm09QHMiMukDUTRVP3q36lGUs97BwUVu7wtXHa55zKY7D0N+d30a1JL
	 fCG2gB/K5XOxNbkRJZZsE5TgsIHVEurfllIw/NCo7/lUaj5L/76lCixRwcpythzmZ1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rnnlnm9QbOzUFhPGhE2nJOVIwlLBGc5RigKMKLFD+10=;
	b=coQbn9x+CuBioZvuTwwPQA7CB3htskT2t9QH0zbnWMCSJK+LRU7UGwpooTpdIPb0nou/
	 1NDx3iLBALvW9boo1vGPwdkwAU0GbRMivoORHO0UBHSV4HhLqdJ4+mpJSU4JIVRs82Rdd
	 TW6N4IsNr7c8iFfO28uMsvOdcPATjeIBDpUGQ4eSTQEUYD5w6A5kI5p/V+vwbOimZ1BeK
	 bwdOkne0tN6rZbt7NzD8Of1vHXbf35neMYS1e4Vq92IFGobXx6txa6L9rF996mpXesYpo
	 tophFFXCxaonwHKu0Zv4nBfviDfV0XLAIh1YMc72WgGiFOPH30jOx9rU3VvGqem1pWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzE7wKCZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E389606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E389606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzE7wKCZ
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab43af5e97so3125077b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793236893; cv=none;
        d=google.com; s=arc-20260327;
        b=PZEEcOgQTTmMotkOGmwkZqqH4hpxpYEl+iuSuOfXDhprGGp3UcfyAu001vWWlKeuVA
         tGyivAMaqFifCp7dO1PH8ekks+GBlxobXVhJXLBPwhQIM4xe+umSIl7YB2MT3f/a2wSf
         60Py7g6WfDUBVIR/HfL0uxSpLbcb9i9LHu/cqlq25WBUM6eSoEp9740cVjDPYvhtlIfH
         W3X+coWuJvtXi4RIsH1QiIHTNQmsNJZal4EZmwql9G+KnItnRc7AgQLBcTi/3ZHMEGEw
         8/YybnWZM8sX6jOjGR3rbe47gSMrYCvF9knFzFfwYT3Jq0XUXfqu1HIM1iek93brjAwF
         XkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rnnlnm9QbOzUFhPGhE2nJOVIwlLBGc5RigKMKLFD+10=;
        fh=0VR8OG/gDXxUmIazpbhJbGJVW3xlPpbisADNVDdIKic=;
        b=W/R4hElaxf2bXtApCgu6TSjeBfMZZ2agwHcNtps4V5qtcPdpnlPGhkmA1xiIsFbpeJ
         rhsu4oFSBuLonAkSWQy/I/V3l+bYHG9t1InVqghIS9SZGpRk7qirGMI0eXg4En2IKDqY
         krR/6dRcRPEBSJwHGwSdpHIk9iqz4Bs1AluZSfYIuZqn082q72/8OWrOCUBzx54iw13A
         KbX1NhYoVy2dLp2NXBCk/9B8ckSv9DSc+bHQ+JFGOzVIghZWvURlB4RKM77znZCeMzMw
         zWnMNEO6DCqpqo7d6CUkjbXYoWY+zRq68boFvCdb3jxJVzl3TCTGr99+2RDmQhBQsXhX
         D+MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793236893; x=1793841693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnnlnm9QbOzUFhPGhE2nJOVIwlLBGc5RigKMKLFD+10=;
        b=RzE7wKCZFfIARIPFFqduXiJ/xtizECR9afk/A4x3sLYn8gOYpQy6b/LIP+Fk+IBgIO
         1eu9mn4cXgM7Pt1uiNikgwIfE5cUa89qAAHkUF4A4vXXr4kGxnqyBaxyquNAc/s4+5Tk
         FnBfIwSwExMD1F429Yfq6yVcDAE6mrAnAclRHpPYltXmpqoEACOKp2YctjSmq78cZsHe
         g3DYmOGfaQf8QC8EjICAXSo9eJZPTyyhVuyoVVgKESoY/cu8JbnJj0pqcsswjbcAcdSG
         wOg56dLEtokkpmdBSZMv4vdBxlmyoEc+8m1ZmsLTNIyqn6xEUw6IaJpAaisU5vdWt6sg
         CGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793236893; x=1793841693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnnlnm9QbOzUFhPGhE2nJOVIwlLBGc5RigKMKLFD+10=;
        b=Aba55cbSU2JE9i3MtSoowjLonhx+OKS4x1SeDrceHl8z5e5vsk4zfe4gBN/sEgzYz3
         e9M19daa1+PuELLBvga6RzfHpHpXDIGTLmbzTONEt5wJmrQDSDwWeDwqpXElx2b66yIM
         D1F7TCcClRkT4AulxKz8SZ1EWq3rhf2xGedWFDGzWgh290BGCInVdC92zOggUGLkQbdX
         Vx7jJSxYY6sZB/2JsxsiNiSVLa1iNYN0HoXEmXijpXgD8r5N9e1+9j1yJxMDwLefIMlx
         ZO3flCGksCG1nHOBis8SWGCgv06sak1AsfBl1JDByBbQdgVEPj5RrRyXoeX5aP7Tko/4
         igfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdAlqFGP7pud+SYxUodqBf25CCR+GLIWEjsVnN0PXRz21rwIs3in+u/0kwmPMxqjykI2uQeoMfLl/RMnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyhlybux8rRR5DCRSp/7dM4ZPjOU8wLHk1QuLivwI/R7htUO03
	MOu/g3RSLT8PyIqjd/TbSbCP6I84QTV6pTrHlutcwzECxY39N6w7qyS/si/r5oOzLZ0vL8CIy8N
	8Fib4NmPHVuhw51DU6eWUo/AiVltiBROL4g==
X-Gm-Gg: AYBFou3l/acR7DJZ00GsvLo3qHCqyYoc7GrL01+i1NPr9jGlSOgIVLvlE+SwOhydqGW
	3jYBYTRDGNjI/+5fIFIwl5q+sD4UsaXCzXG+QDNSo4X95ciE6+12a3rPLdVcm5Au6gOCZ4y3tSA
	QOJqTwrof2aSWOkcbSWxZHOZgqvpX1ML79KixFHJdjARbH5bVVfyXIvJyeMGRYS3oyzuj8eHTz2
	TyZiX+wPZ66AGJ8juFm4ClZBroMELj45WqqaWrlU/OoxjtB4naQ42In1qLGYlS0AbyfDWJ1wEFn
	RvUwlXs6/TmKCQw09hA0/y5MbpEnJ2vvqyxa6BEwmAGM/IMLP/bJYukAOidecfzgjJV+DUIDqJM
	yNx5qPToFPv3uIS3K3vagcHk4dXM1idR5LRWtonuolCcgt8heAqT3neVLbzZo6ZziR5h6kxwNlt
	2fns9/7h6yYjIeL+uzESNAA+NalXlFnjPRyS1V26VvTA==
X-Received: by 2002:a05:690c:e1cd:20b0:873:5c7b:c13a with SMTP id
 00721157ae682-8b1c68bc542mr6313507b3.34.1793236893060; Wed, 28 Oct 2026
 18:21:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013032742.497402-1-cochcoder@proton.me> <20261029001349.1031535-1-cochcoder@proton.me>
 <20261029001349.1031535-2-cochcoder@proton.me>
In-Reply-To: <20261029001349.1031535-2-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 28 Oct 2026 21:21:20 -0400
X-Gm-Features: AclHuK9OA0TxC5wJjdXKN1qLToHFtxzFnXDBFSFw4UfMSYDfsvibt7iWShSwHz0
Message-ID: <CABBYNZ+wc98wyH_rcuVZUTjy1neDb7tDr5mvCsn3_jvY9EPwug@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Bluetooth: btusb: test larger LE packets on
 TP-Link UB500
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marcel@holtmann.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Wed, Oct 28, 2026 at 8:14=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> w=
rote:
>
> The tested TP-Link UB500 (2357:0604, RTL8761BU firmware 0xdfc6d922)
> reports an LE ACL length of 27 bytes and eight packets. It accepts
> 167-byte LE HCI ACL packets during ASHA playback. A size-only test
> streams clearly with the eight reported LE credits retained, so the
> previous shared-buffer workaround does not establish shared pools.
>
> Use post_init to test a host LE ACL length of 167 for this USB ID,
> without changing LE packet/credit counts or BR/EDR fields. Refuse
> unexpected initialization values rather than applying this diagnostic
> to a different reported buffer configuration.
>
> This is an experimental RFC: 167 is a demonstrated working length,
> not a measured maximum. The appropriate general limit and firmware
> scope still need confirmation. Mixed BR/EDR and LE capacity and
> exceptional-congestion behavior have not been established.
>
> The ASHA 7.2.9 trial completes all 3269 HCI packets, including 3243
> whole audio SDUs, with a maximum of three outstanding packets. The
> human listening verdict is CLEAR. PipeWire and its actual 4608-byte
> socket send buffer are unchanged. Increasing only that socket buffer
> to 8192 with HCI length 27 previously crackled and underfed the stream.
>
> Prepared with AI assistance for source, evidence analysis and text;
> hardware playback and listening were performed by the submitter.
>
> Assisted-by: LLM
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
>  drivers/bluetooth/btusb_main.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_mai=
n.c
> index 92a78a7e6..2b955ed4b 100644
> --- a/drivers/bluetooth/btusb_main.c
> +++ b/drivers/bluetooth/btusb_main.c
> @@ -2972,6 +2972,18 @@ static int btusb_setup_realtek(struct hci_dev *hde=
v)
>         return ret;
>  }
>
> +/* Private diagnostic: test a known accepted packet size, not a pool cla=
im. */
> +static int btusb_ub500_test_post_init(struct hci_dev *hdev)
> +{
> +       if (hdev->le_mtu !=3D 27 || hdev->le_pkts !=3D 8)
> +               return -EINVAL;
> +
> +       bt_dev_info(hdev, "UB500 TEST ONLY: LE ACL MTU 27 -> 167; LE pack=
ets %u unchanged",
> +                   hdev->le_pkts);
> +       hdev->le_mtu =3D 167;

Try checking what is the maximun data length it supports, since that
is a strong indication of what the buffer size should be.

> +       return 0;
> +}
> +
>  static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff=
 *skb)
>  {
>         if (skb->len >=3D HCI_EVENT_HDR_SIZE + 1 &&
> @@ -4715,6 +4727,9 @@ static int btusb_probe(struct usb_interface *intf,
>             (id->driver_info & BTUSB_REALTEK)) {
>                 btrtl_set_driver_name(hdev, btusb_driver.name);
>                 hdev->setup =3D btusb_setup_realtek;
> +               if (le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0=
x2357 &&
> +                   le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D =
0x0604)
> +                       hdev->post_init =3D btusb_ub500_test_post_init;
>                 hdev->shutdown =3D btrtl_shutdown_realtek;
>                 hdev->reset =3D btusb_rtl_reset;
>                 hdev->hw_error =3D btusb_rtl_hw_error;
> --
> 2.56.0
>
>


--=20
Luiz Augusto von Dentz
