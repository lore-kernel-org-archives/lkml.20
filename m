Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD77379EF0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748123; cv=pass; b=vE5MjJxdGhquTsppu+6I95sH5McquTlQpwtKE4LY80hkvT4mXywkiPCgH7H7+3r9qiIcsSXPoHClOVsCe25DobaVaygTszaUmyD9RMPXtBrohORwOQSAKfxTC76jAaENZr0P8udssJlJb4dR3xQnNsgCoLI928mesM9Rucn9UsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748123; c=relaxed/simple;
	bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m23MdqpKaorHiTwB2DvIcQBx+4ufkusfT4jntXK5AL6IopLtURJoC+82wJ6huBvH5GzR8Kj43NvpQdtdh2jiKl3H/gG5qO5znNhXqvfhqXLhI/RBcAMBW9BiKWytBYSRf/TEvCMDN5+PqFjPXhAEs6Z5vvwPpDttF/Pr+Mh839Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3HCh/7O; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3HCh/7O"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d7200b2e15so31389465ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788748122; cv=none;
        d=google.com; s=arc-20260327;
        b=MxlUN90VWe2dyZOU0ydHn3T2JCfIBlicofjrXzWtvSAw2zDJH+BxeRgqU/+zqpCjwA
         /P27VysFoUa2DWGV9Orgc4iW0uLF8i6SLOXIXktZY/NkPqaHQDnXslqYfMnWzWoa7a5B
         bgQjrKn6KSQJTNTC+AsodfAC0NFnPOnc2SXFTa/oQmrZqvCqAMeK1fzefDFUV/5mcOny
         R5FHKfyK3I9FS82JsjboT+DLlLC9UZHdAkB+otKYnMPvOUcMmkk+HRJrmS9bdzRQaRBr
         39/FZEF+to6nOv7T/3L4hXtSnc/Q/vU1CLFhUy3Kjh6oLNUoACxfPNcWh8amD1TOgTsn
         Azaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        fh=F/r134lzJ1pDt5gYBmz1k0KvudCYImWcncxQIdtiBAk=;
        b=gb6RzD1CATcJEynJGlAH8X9O0TO2XsniJFyT8mfhvhHSBlL2e9raZf1bfiDS5ZyUmj
         hmzurO21zpg5NWF7aBitrjI9HPdBpaz5DUsEkWi0JZY45XjRAuqioLfIJ1lEo/kMSvzg
         0dexmBU+ZYe3UkwhTHhibtAjx4I65SMgoFJwXklA4RjJdLLlMVCY7ilN0Ci8DYdK3UvT
         4eJpfYYWvEN0FMKV8fiQYpmCoF6C4TeWHT6IFm+i9qCvpBMUhKequM0ynIHjC6OYsWxy
         nrV+P4a8L1EtXVciEkDT1zQQBujvJ/bmGnWQYffaxevcBDOCKnMjE+mvl/1Qh9aj4gDF
         1sZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788748122; x=1789352922; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        b=O3HCh/7OjR9v7VuPiINgLCKklDTk+L/8CpWGlMmvvDFWQooaRjyMLNbP4lF1/iUDr9
         ZTTyILY9R14Do1VJ8Nn3qedbzltYNpxBsCazfPM/TvptqORf4R3d4rG6fVCFvCQ8L5s8
         4An5mcA593D5EaAEmK/k3/WQE420FEKVmaWNBG0jv8FrzEQvSTBQ3ESHV4FXrgRZgsOu
         YLyTW/o0eHbgqH7p+wmkPqIMLBCX3o+WewHBSM1AbGHFOsDyEnsyKEiVG8KmzZuzLrRZ
         FJoNUKKGd2FwHfD32Mx8mvhb8YOyWMm1exqqBMBi5b2pp1/7q7JX5O165TmJLiGB4cpm
         sVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788748122; x=1789352922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        b=L9GgdrXdnHp3JlRtk+P+rMc65LchyK0C8GvAd8dbi20+uf2c2MflEvxSQZCL+mpTan
         1STuepQi2iCD2IBfLnrSttsN2EORHL++ah/DIMikIu3UcQOkmZBhCF/JCK0d/NclZbJB
         0oBuLZ5JtTO90wT9a7TLY8qjbwfwry4kx7IecHLjqhnxnQWR5oL2TXdkbpZF/BdoDrXh
         8enxQCnaEMGIl3AqNeOIbhOVZs0OkSvhzPH1xJn2pVh1ZRw0XX7U2LZtEQ8mw1mkU/FI
         +hKiE4ASBJ3WNMKB9VUFIPt2irRMK5ugMSQI7uX4ffsPmOP6MMzOlpyzMMds/bDZ5HAl
         m2nw==
X-Forwarded-Encrypted: i=1; AKwUvBwgO5BG+Ox/1SD0ScRTaM1atEysjxIdqgYT+55JFE/bJ6QTH6HHPC1At4oStXSYLeptJLwSXmbZIou8DT8=@vger.kernel.org
X-Gm-Message-State: AFuF++m+jsnN0M2PybphCVJz6zq8hhK1ZPiByDtNSOfIzwBWkGubQ9au
	vtY10MIS5Z2Quz/v1pvXAvUFnBW1bl9+sPwSlQi7rnnB21Q9ypjAGYykBNNedmhUIZ32Kxvgfpv
	LaB1KZ4jXOwM4THVt5OXXX7GSzvNE5LQ=
X-Gm-Gg: AYBFou1II5v38BJYW/5ZRs0xD43UtGgk4dWlGBRYp8nwhOpBDFvbG9/o5oNI7gB32jK
	3PHhJZ1GzMLsIUpr0113RhW+1vnhNEGFDVsbw8qr/UN5q0Zev+iMJGlCKDnKYj2GC/CN1rx0fhP
	ya8/OGPAn3pET7H3RWm/ZqDbDPvDN31T1y+3NI9+ysqrpbcy6n7wapzOlGMcF6X71+tP4950Sxb
	kEVwNft9wBCGgK/ofkw7wq/HxR7csrtSleNLErgUdNpvOjh8yurCPEd2ev3IXV0vYYb5Q6+ES8B
	tzK0UbAp23D8gqnhCqREyqe2DSWrMVZ3V5juNgjOsHKfYtD6YC4CRrqnazL1hEpUMkMsJAtsnvT
	tI/7jpxmlEb+7CXNNC7eWH2jjaKFYqVWtIPAQ/XvdWY8mXe5mp/pX7k2M
X-Received: by 2002:a17:903:2349:b0:2d0:cc92:f7a3 with SMTP id
 d9443c01a7336-2db125a5535mr296058245ad.2.1788748121672; Sun, 06 Sep 2026
 19:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
 <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com> <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:28:30 +0700
X-Gm-Features: AcwNN1WcmIfrIxdZpRQHswHCpN6F3ZPaKgnosKc26H5L6i-cyqOgzdxXQl4mPdE
Message-ID: <CAABR9nHUXPL8dV8iqJ-x4OWRLw-qRm8MTq_QDTEJ94WhLWRiqg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Simon Horman <horms@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "swboyd@chromium.org" <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> >
> > This is a pre-existing issue:
> >
> > Previously, I suggested using request_irq() and free_irq() manually,
> > but that would add more code.
> > Another option is to replace alloc_etherdev_mqs() with
> > devm_alloc_etherdev_mqs(). With the LIFO cleanup order,
> > devm_request_irq() will be cleaned up before free_netdev(res->ndev),
> > which should resolve the issue.
> >
> > Since this is a long-standing, pre-existing issue, I think it would be
> > better to handle it in a separate patch.
>
> This issue is currently being addressed in another thread:
> https://lore.kernel.org/imx/20260904-fec-ptp-pps-event-uaf-v1-2-9af446be4a11@cherr.cc/
>

Oh, great! I see it now.

However, it looks like that patch does not fully address the root cause.

There are two places where devm_request_irq() is called:
For PPS in fec_ptp_init().

In probe():
devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
0, pdev->name, ndev);

The approach in that patch only handles the first case, so it does not
fully solve the problem.
