Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114496;
	b=aaTOx6pXBzinvxHhlp2BBYsL2rYVNSuUffsbCIrqPgDnOgrqBIt6EZHg/MbGMk+8xmr+
	 ug/nbKC8kcP3cBVSPYDlj+N+a0v2mI2fxqNjilJwtCK6fpBTHbB/HbBoZr7rcjdspm0lP
	 m66/kmdgEtlAhk5qPWSZWAOPXtGIZpmDxCs6HDFSyOvWEHgGhmuoCmeIlOfongbncgoZV
	 qKPb8KuOK3CD2lJh3UbejCT3MZNs/0sPWoY0NjOyOfXeY2ZIOTl8imAECgB5HTDwl0bZs
	 WbBLNMkAwm6vAaeySEho+imgT5rWg25Q8UfxtzUUdqzZHPCuPR2aA+Vz8czCofhx1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:References:In-Reply-To;
	bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
	b=DEIeom7JvU4p9thXMGof0KjEMx/yPWULRsY1rfKMBcIeiLCyXDKmvYK3SDZAFI39We4v
	 4AvWaGseCv+ig+BWTq/7cl1i5cmaUqeo4MabhCCzwdI4FnHNGxM2ybiEnb9+bwT67Km7M
	 aTFPJUrb/EuATlIwFpHqibARiCzf8KsQUoVP7RXh8YzAEG92LpBAk1jtNRdjqQAP/4CyR
	 lqMkkGq3egZ+MQxoimimbARTybVjmzS+RWhtEbCCgH2mXEB5EOJksxHGjsCb58LVyVoGF
	 UtB3KUOWrlbvGGXpsgTbaLabLxFLr9cpi0fhiUMqLpFCNMIO3RmLHHRnWLcLDHWKbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mycwa3Lj;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mycwa3Lj
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso41959a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793114494; x=1793719294; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
        b=Mycwa3Ljz3PMgTATSXkD/0igHVvL5QzqIzwVGRON1FfP4vtsAaxBwW4R2GJjRa9PmT
         p8YpXPLssxVlFE+0z9QXDHSOQGvdYFIZjbDa/ZOKYVpIBNZn5XZGH8Tf4RBXz00iGc5R
         7B+zvlRG9QZYfPyHkjVJh2tSstM60xE64Ma0I2ftMAlhoZUdw+1119D2OeMjMd5gdFyW
         CUa660yqsHdT9ZNAcmDi0370RIjt7/+fCy3cJ0muReqWsjOBP21UTbrE1fZBU4/uyPmi
         EtLWPXgehhd0gYNn+wvuGoA1fUubpLUo7vaUXB8RhQ9HxHVnZUWkRgaX4dmEycR88M3P
         Aexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114494; x=1793719294;
        h=in-reply-to:references:subject:cc:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/FO+PXUBDG5O94y5lMD0CzRnK3vjDG2tM9yXo+wpAI=;
        b=rFCjCNpX8wJxMYGopoZ1Uqu5Ze+PSdLgc2bBPIAlAluwTk2e3awcDlFrBZJvRf//Zi
         6Hn9ugXzC+BnfI2DfZpY1RAZyVbz2q90rttzRb5XDUvRo2tIidwZjZkTBX75l3BL5NrF
         vik1V3LjDUUBT0mhiaD6jbK0OY6T8+NQP+bitjeotr8jPA3g7xAvy8cPXd2/MY1q8Kyi
         zX66a+LHYWqAhBtDRCXaNss8BaJ3jVSo3VgRYvN79/CeFyiAVz5m1Kf5XvMbJS/sdsmH
         myroTurmSfOoPazY3tSmgrwGl0LgM2P0200j2GBWsGaJOLocPTevcCO2+zz7JQfxL2EW
         7WxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQvzM+jVM0Mi3GJL79PjRYCP64S0ISj0wZCTsZroFTAxDMvfilmsAK2JJGmUiZ3EiBBoq+NTce959HQbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOlxDoQfbQsiKHHCxInYRNZ98V7iQwVI9x6H7DxkNkI5fc7VFU
	IzJNZGTYs8uCPOLuwlSjkTdr7kl8fFBdtK1rfO6Igxcl66t8wO1UjXiKvQjLfJpBajc=
X-Gm-Gg: AYBFou2XO/Iu5GiwpqraXzTuudz20nl5GZTnkMksF6UsDWmpCSxxA5z8Vh8JVtg0PoU
	1tuNJVE2nQy3qqote2Ac26WUr1KEG88gWUo3T5f1Wk0v3fD7/Ig12WD4WGRAeM1Ga57mTw4u8Qd
	ZriPi0v+aTqiVRm32TsC77aUAJxhjF0e5lPEdqLoNLh9H0Zbk4X57W+0ObJKuRKXmU+ylidtg8H
	dPsqD9fZk2aEcgBuaCbSvzuPNwIo5TCz5oy07emK3dgo3mSbPtdXrmSafeC2EIB/lUBaQ/EwXet
	mLXZgnXpvJp6UuYGfZA4OcGKSRWP1hcqm05mzVLV+vfHoNH9ZC4kgptOya/aPSZI3w3ltDz1phG
	rvzSMbUYxcEwzFbuylFOxHila8LRSRSlkzhzEMgniAtZTGUHnvR3D+P5ym3IUt+lRGOY7YkG/QN
	HYBwCsnIWumt0nzH5WDprq+crLsgOvbnS4W70kjZ7p0u1bYXiOQhnri6qQNKzw+Ohe0cwk9/UJi
	gPKeAWRSTjN7M0hNGGVD3jLiN65LbKQCYrMD02tNvHTIwNowmGtQlWq
X-Received: by 2002:a17:907:97c8:b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c46bdac62famr1094811566b.6.1793114493665;
        Tue, 27 Oct 2026 08:21:33 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:17d2:d825:e2b8:2e8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm24538097f8f.24.2026.10.27.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:21:33 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:21:32 +0000
Message-Id: <DMFQ1DZZPBFX.1XLHN38PX92AF@linaro.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>
Cc: "Alan Stern" <stern@rowland.harvard.edu>,
 <linux-kernel@vger.kernel.org>, "Josef Bacik" <josef@toxicpanda.com>,
 "stable" <stable@kernel.org>, "Rui Miguel Silva" <rui.silva@linaro.org>
Subject: Re: [PATCH 18/19] usb: isp1760: wait for the TT clear in
 endpoint_disable
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>

Hi,,

On Tue Oct 27, 2026 at 2:57 PM WET, Greg Kroah-Hartman wrote:

> From: Josef Bacik <josef@toxicpanda.com>
>
> The driver sets qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer()
> when a transfer to a full or low speed device fails or is unlinked while
> it is running. The hub driver stores urb->ep in its list and
> hub_tt_work() hands it back to isp1760_clear_tt_buffer_complete() after
> the CLEAR_TT_BUFFER request to the hub.
>
> Nothing keeps the endpoint until then. isp1760_endpoint_disable() frees
> the QH at once. If the device is unplugged, the unlink of a running URB
> queues such a request, and usb_disconnect() goes on to free the
> usb_device and its configurations, which hold the struct
> usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
> and, if it is not NULL, writes to whatever it points to. A change of the
> configuration or altsetting only frees the QH, under a callback which
> has loaded ep->hcpriv without the lock.
>
> The HCD has to wait, like ehci_endpoint_disable(),
> xhci_endpoint_disable() and fotg210_endpoint_disable() do. hub_tt_work()
> calls the callback for every entry, also if the request failed, and
> hub_quiesce() flushes the work, so the wait ends.
>
> Fixes: 74ad60292bf0 ("usb/isp1760: Clear TT buffer on interrupted low & f=
ull speed transfers")
> Cc: stable <stable@kernel.org>
> Cc: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Yup, LGTM, thanks.

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
> ---
>  drivers/usb/isp1760/isp1760-hcd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1=
760-hcd.c
> index 6c52c6f59d69..3cbf5fe3ed34 100644
> --- a/drivers/usb/isp1760/isp1760-hcd.c
> +++ b/drivers/usb/isp1760/isp1760-hcd.c
> @@ -2071,12 +2071,23 @@ static void isp1760_endpoint_disable(struct usb_h=
cd *hcd,
>  	struct isp1760_qh *qh, *qh_iter;
>  	int i;
> =20
> +rescan:
>  	spin_lock_irqsave(&priv->lock, spinflags);
> =20
>  	qh =3D ep->hcpriv;
>  	if (!qh)
>  		goto out;
> =20
> +	/*
> +	 * The hub driver still has a pointer to the endpoint. Wait until it
> +	 * has called isp1760_clear_tt_buffer_complete().
> +	 */
> +	if (qh->tt_buffer_dirty) {
> +		spin_unlock_irqrestore(&priv->lock, spinflags);
> +		schedule_timeout_uninterruptible(1);
> +		goto rescan;
> +	}
> +
>  	WARN_ON(!list_empty(&qh->qtd_list));
> =20
>  	for (i =3D 0; i < QH_END; i++)
>
> --=20
> 2.56.0



