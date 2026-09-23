Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF45339EF1F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175794; cv=pass; b=l6uiNWkO0k5aKilO0ZTBgz5y8T5mwqtzNb5DS8loHVvz6faQ99cBAQNDvwWvHYPMw6s6rHPY9UzBAgLHW7+v2SuXVqKHy7MQKrNEpe2vwJ1p5C7h3Me+jitHO+/ZlvRjuJMOzvv83pwzcJkSSUjoNbYHuEsSbUjQcff5g8Y2KEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175794; c=relaxed/simple;
	bh=VFFiy6i7m4Wf/VzuM6iynbm/hGQ5/lbbEMnpZ0Pnm8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZvhGX2tWVku2u+NKa9pAlBL1FNSZXYiUWMjHJwMCDcNec0/b2lpdWlor6Zocf3u6S24OnVWzq2trqqUJHztXII1YwrSJOAlfdaNr+kP8okjXFxjjKdnGaHAoj+Fvg9lauIjAXROR7IpAtGlsCX6zdreYUM8ybwSEwwmVY2bA/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxAAcclj; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxAAcclj"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd1d91so11966747b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175788; cv=none;
        d=google.com; s=arc-20260327;
        b=IyRq8mvhNKW86MkaTOoS9aSiuQuRDIuD3HgF+1X3AH46AKYJ/to7P25ss8+3Guuv67
         vpfBEoilcshkSKrWs9ey1BBzB1kST3FADMaNkgfCamOGcmxQ7qZDXEVQrZuNfAv63bds
         L1no+ybnC+juUa3PiLXIE7I/EtdBgYFLMRIUA95A0cgeYysUjQWXjZ/sqZ2syN/bszaT
         EMskhenwX4867GEUVeePrmH0Mtr0RN/wls+LSnJWxT0a8OzCwzzaL7/MQrEJnzUReUqC
         U2uz+weP5WHnWZ1Kaz8ETdSIQan6f0ljBjNbf8oLZkIfGhAHfXqE61ZSWt9mKKOUuc0L
         XfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        fh=JTZk+PhXDWDAeB+m8AlfbckoUR+JgIx+SDupJInvJKQ=;
        b=DEpUIlp6G2xiiOIKAJGVsLiMGLnqfH3pt2nGEKiUhTPaYPDefATzN9mvf6IuyS7Q2i
         3rwtBgUsAyoUDHgQ/wn8eDAIq8SkYFm7Py5QK2Hc0Y7Yf6yJ9Of0qRTkvqp95A6IvU6n
         nDsAySMGPfzUXLhMOkPxbJYHMmSia+CzIQWpHolMg2N0qet4AYzeACv/yWG2Y/5NT37i
         0nRrTFZfyuF2MndzRerzGTi8OGwEVnM6GBTa0xyWIaNW1v1xIlSaPTyL7XODUlUqPacV
         sN0dVH1gBOuSwb4Yn59CFHliBMgsQ0AenuxoXI9c+WiXnYJAGqVdH7JBSPBrmnrH7Spc
         L2Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175788; x=1790780588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        b=gxAAccljm/dzygN8M5Tz2lkdDl8h0J+Rwx5bOM6KXAUbSmFEsgpuoyz0QXiGAyih97
         OtDaxqDm5Rxc9/PULh/3CXQ+fTe+ONV80wpj3x01Zt+jQu4U3yMNEVKh/5oJS9bdLWxN
         LkZSknXdGVbpQ4ht0zjxlH/+ZNIIdUBJNs89j5QCroXr/EkY4305FCcVK4/OCwg/QxpF
         qlTqGQjSn31vjG37ncbwQec0nFCqSYOGItBreutZiiOXss99WyymvDxlevgsui+/7ko2
         tkhKSSJfd63INMVZAYRO9Sv0MRCTqOMjyyiI4oXkaEL7hsyh7sAXlfe2diOk9pLBNk9G
         9MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175788; x=1790780588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        b=2yYlLNTzZuR3BVWE9Z5FjMnEPNF3tUTLUSOwykG9JbHrepsAvpYJKF+4evXmwZwCdt
         zoPbm72RvHY7LXZDsu2POxk1J1N9iZlMi1hguWiCA4V5S62k3EbQEePoScjPq6rEKL90
         3rp0ki+PqcTH7RdHqTPTOCCSYHbVCzu7L5W6UcargeJrc/4XND29QRQgwoStkDFbQedo
         tBXpr6BFb3WEorIha51SaFUse5ROWx0YERsATDrZ9rf8xYx2AaFOjhNHE85AbkSLHlyh
         vQd5cfG71bvRxRE24xJIP4gu6X9cRsXa82cE3RPizTDoZktKpPKBEKYRKho26idAbdw5
         DhRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcWdNQHifYBC9Lo3t2dSqwptwgkixzAdwkBHcwQOdTI465wqkgW5npnHLt7d+J03QvcLGbp8Q1kMK83q0=@vger.kernel.org
X-Gm-Message-State: AFuF++nl4dIAn61tuunntwIYd8gcrbT1i5NfV/Ho5WHvRRP1LKSOay30
	PFOEQeGCUCnrHo37668qtxFkoWFxE1iUCh/RSD/3Pxy4mfBAxpM7nJIqsQGSCXqfyPx9OqdZF6k
	4uI4OvLKe8eXaDGoM89SEiZx+OJLxOMo=
X-Gm-Gg: AYBFou2YqryhbNLklL/y6o870pCF07ncqLfOhJGwRkYiz5yyzl5cHNy0dgj5y5XQqE4
	+lK5VOoDMZ7rQq5m+SD1kkxwyL7SwZ33B/xiQou9ItVmRjAIHVb00YgNPs0LluWqPRHe5hJLIAA
	giDI9r/QsFcmWlH469OL0CtKsFM1AviNOxTspkCQ9p5/BCTfqfj3hL0t4k9N4U4/LVVbMmfUuLa
	w4Qh8bbUW3utw8pQpo5esleIqAWcXkjuyofoPsuo7gYDVAsiFij4Pydu++TJfErHmmvBrL76w8p
	cltOOcpH6HldZFWxvMMGd5XU3SKmoJcIoGUQusvHsnI3tgy3IevrJh7h
X-Received: by 2002:a05:690c:6d81:b0:89a:63da:cbe6 with SMTP id
 00721157ae682-8a45bc845c2mr20714107b3.44.1790175787877; Wed, 23 Sep 2026
 08:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com>
In-Reply-To: <20260920055519.3778269-1-lgs201920130244@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 23 Sep 2026 20:32:56 +0530
X-Gm-Features: AcwNN1XS281TkGjU9vWolr0hcpYOQfQwJrTGBAS6vDHuzDaOItqT-Qc8-tIEa4I
Message-ID: <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@gmai=
l.com> wrote:
>
> init_one_mc() allocates dev with kzalloc() and registers it with
> device_register(). If device_register() fails, the device has already
> been initialized and holds its initial device reference.
>
> The current error path eventually frees dev directly with kfree().
> This bypasses the device release path and can leak driver-core
> resources associated with the initialized device. The existing
> versal_edac_release() callback is responsible for freeing dev once the
> device reference reaches zero.
>
> Call put_device() when device_register() fails so the initialized
> device reference is dropped and versal_edac_release() performs the
> proper cleanup. Return after freeing mci to avoid falling through to
> the direct kfree() path, which remains necessary for failures that
> occur before device_register() is called.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR contr=
oller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/edac/versalnet_edac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> index 3a06b41c1d84..db3bf5a1345b 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct =
platform_device *pdev, int i
>         dev->release =3D versal_edac_release;
>
>         rc =3D device_register(dev);
> -       if (rc)
> +       if (rc) {
> +               put_device(dev);
>                 goto err_mc_free;
> +       }

There was a comment earlier from sashiko
 failure path calls put_device() with dev->init_name still pointing at a st=
ack
buffer before device_add() copies it. That's unsafe in
principle (dev_name() would follow init_name)
>
>         mci->pdev =3D dev;
>         mc_init(mci, dev);
> @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct p=
latform_device *pdev, int i
>         device_unregister(mci->pdev);
>  err_mc_free:
>         edac_mc_free(mci);
> +       return rc;
>  err_dev_free:
>         kfree(dev);
> -
>         return rc;
>  }
>
> --
> 2.43.0
>
>
