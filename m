Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37F48382E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392241; cv=pass; b=Y9uEg+HWO6QMO3Dwrm0gW2xMs33FBxNo/N6sYgobCEL3GcKM3s+/uWlQADeQHgmTSeNAOmGAicPDWcTqQiOCQdtTXi06U5YPc4Rn3IiGBDxZmHU0npOKYC8/46Yo2Bi6/rEDILnYK8fyN8U60tNbjIlh7/yNSFRYQbvyUITgPmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392241; c=relaxed/simple;
	bh=MrucJgKnCH8Qe8dHK7tSfYbP1+rchG4+5cQ79srr4Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tf6QoRgxD2rXKCM0cFRHrGERJ6JIr/GPvMhFjIlP7vO9hwwaQyBsb3GdXAelAE5Q2ei1eyi/a8JeoGqW42j7Qtn5vJJtrIpo0eVtgwoBnJkem//1ojC/+0McLIzMNxwSPdSHU0ekE4TIfatvOEQa11ANzO1PRitjmLMY9dBpuiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=CVbI0SSe; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="CVbI0SSe"
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 505563F185
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792392236;
	bh=fyMAES43nV/sif9SKzr97YR4lZsRCc81pqe+ceG8i9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CVbI0SSeANErqYzIs7ahLEFKS+wEoCBMPvgba8wGlda5Cn+o/M0fQRKl0LNA+w5JG
	 CjJAqZovw1PFk2TPEk6jh2IPHY3KUdjBjsbh35Gl9VZLJBUC6t+M8QVp8LquacGKgA
	 +EVLqgiAkRd/VDdYHz30cWo+DDNBO6H0JnXUX1ArofBJJV4TfSiDKyx5AxrTIQ3ii7
	 PDkpQ6HmxOQYB1clikJs1HSLbH1cRZ5nISwwH0ClKxT2KswVkSoWesVe024FXzlfgm
	 exgExSrqG+yMaotCqOSUvaXrK5wQ45PXrlOzVIkVIr0kl4veVRsn5T85KWU9BxSIT/
	 G/dvVQWL0UM0X6rlyOEYY7KALFM3OBRseyMu9ozAC+wmvk5iq4/pdqE50YY3EC/2xo
	 j86y7GpPFzjqi1U7gxRNH1irIyt09HNUmnyMHs1R7Qyjz/cKvIy02L6Fo7406c6W1o
	 j2Fz4Ez15cc9kZ4/Mw9j27ld16sJjQ/LbB+wWkHLOikxOrc/XyjsYYOcFVBv9jFSlE
	 5n4ofnNNOHkpDejbkKzHTxDjX49ch29NRpaL/BZ7MIS8iLiocQn3ov+axkTX9tvttw
	 vzLAV5BVxkX4Hp6ClGECUUavsY78CDzu0bsFgUMq7KWlF1ifxWXsEmdUgiGOyT8NDe
	 IoLopCneDm2e5R7OKncJoDLw=
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5437a1d6688so405797b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792392235; cv=none;
        d=google.com; s=arc-20260327;
        b=smp6s0ux+00FGwHSjEYbn/CnI0gPeWf4fp01S4446LcRVSof2XtNe5qfN1BE3N+ZwB
         +8XCEz6GdXz0LEEqiyzfeqsb5baXwGUlMm57Q07ZqxQ0Lf3mjFVEoDTZ7LOvO0fjaXzM
         N0fo99sGgQIJQrA2aXzHC8ux5Jo7/ljByyXFFREW1EU7KdE8ENXEV3f+N8iEKHQrk9RQ
         f7XHWok08V1KZLu3iXYGMaVKSpoMLXpTRv5RBr/0sUMW4N1x9RmM7xDskdaDQzz8SaE3
         /XjX1MMMPLVjeoygLtHRk1jv7v1oP+btoE9sptkm3e6RjXGm4Ubn09ZcYwY45/2H3AKS
         1UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=fyMAES43nV/sif9SKzr97YR4lZsRCc81pqe+ceG8i9Q=;
        fh=CA4oneFS3htUbYHBqqrcxAMa/+11MLz9/lj3K53l2UA=;
        b=c4p21N3KPAr71uxg3qg0n3XwJvuzxBucKxV5MzkXVocqok5TVSaIM8DMzRZl3da0uF
         a2A6FE6Xb7o9CcBLi5fRrQ+SXFDP8rGkB85CK14SdDPkcvsXoxIwWJdeRK9FObUmbzbN
         ISXHSnCdxf5rbsegPVyaq2PzeuoDFj8PboQqyANsoIy/mnC/4TlKZIgoCNlMFHdPG7Fz
         K/Edd9/eP2qhrIOVt37Xue0CtNg7/R4P0y0AD+MKlDYntbKBZg6iP/P3GtvyGQsreV8M
         wW89zfLSEhD9ZbM2wYFIO/ihb3dC2qMjOD4L+fHpqwFdDOQ7Ct1VFOn07jqKYkwZYp6D
         h35w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392235; x=1792997035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyMAES43nV/sif9SKzr97YR4lZsRCc81pqe+ceG8i9Q=;
        b=hKKuPkmdos40EBHfEWfV8QdsyZpwjRbvRySaGNuCr91T+8ldxJLTBjjiMvPe2U+4ir
         3pWRk+i5qeeR5VPcPK1PQZLF5HulPW9RY0EiI2jwQvxIMVO2Q5Yb6ehWWHAQW4li0UtM
         h+sQRMiYvoQMAIIpm4NblSjUT0d77RtUZAz430cwJdruZIry0c2QHpm4neBfszlm1YvQ
         ddiI/If1AZZC+f7cCZg8LNp3sQcP2ziUQw1mHY2Z6gk2lzQ/c67tUiVIsEMuoQm6ejtd
         S0/kVr3iWsvxRnxsp+U2rpmmd0ZNsm3nKRkMiqRW2IplGNPq4vtjOjNRSUTaINQOeDNy
         U1og==
X-Forwarded-Encrypted: i=1; AKwUvBx8h+FqT4NjzrHM9mqkYizHynho9CyoV67qp2wHDp9EkjXfNLWhHzPWEnytraElQg9PAXuzrHWA6vMBWM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcv5TyKG8y0vZsd9v4+Aw5KB12nk+u1vB/xRn/JivX+Js5LB/a
	VuHngGdk6QL01MTGRF5rvjxSw8qosAP6eRhUXVE8XoNnrT8fjTTrP6ksh/xDsNrMFsDyD3mEgJu
	IgSPluq7Hw8qLofKFDfAgoMCCPsaY/lo3NdzVOin3MJqDxIwbDo89gSTy9pZG2Q1lB1p+FoH/JO
	0SEFwXEbDLRP3H0UnDcKrUNFkm4QNZmtNl9454pnc7AvX8rQ5ciF1/nNkAVoNof2h7TcE=
X-Gm-Gg: AYBFou3QJ+BGGDxvte3aZQWT6ArePfT1Cs3EvNIKzcf9rCdc5ejtJoOJ1kS8D2MdHmO
	/FWHoHnbwvh7kCwpIdRS8Z5FzwaPsrmB6gMOnUOcGbXVvJjskQ0SbgnTt1YXp2uhL7Nsgkn4SCV
	Y2+6J1CKSzJpubt5kVbMFvmZ+9gz1t1uKJRsvI2kwmO8/YxSdDrARYEtSvILDhKRVOs0ifYmJCV
	COwMmxmKwKPHZDtLh19X1bFv+w08rSQ4N3dI2UZ2gArqb97a30lE97Zdpl97q79njtj6U0lNOR2
	WqVnbv8sr4LhLQ==
X-Received: by 2002:a05:6808:2206:b0:539:dfe8:995d with SMTP id 5614622812f47-53cd247b946mr6699894b6e.5.1792392235097;
        Sun, 18 Oct 2026 23:43:55 -0700 (PDT)
X-Received: by 2002:a05:6808:2206:b0:539:dfe8:995d with SMTP id
 5614622812f47-53cd247b946mr6699883b6e.5.1792392234737; Sun, 18 Oct 2026
 23:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019054513.1966382-1-an.wu@canonical.com>
In-Reply-To: <20261019054513.1966382-1-an.wu@canonical.com>
From: An Wu <an.wu@canonical.com>
Date: Mon, 19 Oct 2026 14:43:42 +0800
X-Gm-Features: AclHuK9fLzpi3LcS19a0dEgUumb8qZ0o-YCt3vpFNf4IyTCGvz5E2WK8J3ChTIc
Message-ID: <CAO4Mv0aNe=Rms2=C5pbB3SEDRJmNKW86P+wzdMa-dtfUK522Vg@mail.gmail.com>
Subject: Re: [PATCH] serdev: handle devices without an ACPI or device tree node
To: linux-serial@vger.kernel.org
Cc: markus.probst@posteo.de, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, jirislaby@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

cc linux-kernel@vger.kernel.org and jirislaby@kernel.org

On Mon, Oct 19, 2026 at 1:45=E2=80=AFPM ChunAn Wu <an.wu@canonical.com> wro=
te:
>
> Some drivers, such as dell-uart-backlight, manually instantiate serdev
> clients without an ACPI companion or device tree node.
>
> For these devices, both modalias helpers return -ENODEV. This makes the
> modalias sysfs read fail and suppresses the device add uevent, even
> though the device is registered and bound to its driver.
>
> Return success with no modalias when neither metadata source exists.
> Devices with ACPI or device tree metadata keep their existing alias
> generation and error handling.
>
> Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> ---
>  drivers/tty/serdev/core.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 7500efcdfc21..366c6d906233 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -26,11 +26,26 @@
>  static bool is_registered;
>  static DEFINE_IDA(ctrl_ida);
>
> +static bool serdev_device_has_modalias_node(const struct device *dev)
> +{
> +       if (ACPI_COMPANION(dev))
> +               return true;
> +
> +       return dev->of_node && !dev_of_node_reused(dev);
> +}
> +
>  static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
>         int len;
>
> +       /*
> +        * Serdev devices instantiated by a driver instead of by firmware=
 have
> +        * no node to derive a modalias from, which is not an error.
> +        */
> +       if (!serdev_device_has_modalias_node(dev))
> +               return 0;
> +
>         len =3D acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
>         if (len !=3D -ENODEV)
>                 return len;
> @@ -51,6 +66,9 @@ static int serdev_device_uevent(const struct device *de=
v, struct kobj_uevent_env
>
>         /* TODO: platform modalias */
>
> +       if (!serdev_device_has_modalias_node(dev))
> +               return 0;
> +
>         rc =3D acpi_device_uevent_modalias(dev, env);
>         if (rc !=3D -ENODEV)
>                 return rc;
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --
> 2.34.1
>
