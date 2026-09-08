Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13053FD47
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871747; cv=pass; b=HvMUGHgfFNRiThRioOU+nyeuOYTKkkV0ifmGuesDeBm62bmhVFvC1I8jPZA6XYvJi85WT3Gu2VJWtVunaggZfmq79h+eOpv7pif48w1VhgBZlS0Kz2bA1KovJsvUdGCYw/AGC6D4SLrCyis/gIGRpM2dxUoglTX7COI4dXxpgwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871747; c=relaxed/simple;
	bh=78Hqg4JS69EObpzSUByjTj00CCKytaf1mVYb9pI6H0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovmjnT+nYImsyrBG4vjSK493nKg6pdk4jams1JUiuZFgdnbavUnMyKaDVH/+qF5nCHL+DDss5mgwDCw8OVt4nj1ozSnE3Wopav6IZYgaq8T8u1ziNyxdpe4TQLWfXyVOMVwOAIgbj6arQ5FIJuk16FunqSgRMfs/fE7FXulNWmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sico+Lp/; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sico+Lp/"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cbff85fa9so53687086d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788871745; cv=none;
        d=google.com; s=arc-20260327;
        b=rjNLvLotMchott+r9S5egfIJUSLB7xILoyEcPlL3EvFa+EKX8UHbcmPCU8HB/ROkGE
         z1DXwKUt40be21TMIA8NKhA6yfDQdVYQMxOfaKp4wg8LG8DTdsQt/eEFW/v2pb1k+tR8
         vfDSDAVKsVHn1cWFJsaZMfWsE6JNR+bK/kan0k4nGUZ1Q1ie1CNMMiYJIu7f4+O4iD3G
         cF+XOXspXuejLwPu+up5JSgtQa5xSwQ26qInVBpbesXBfjUniwrSpO4djFLa47j7Hwgq
         PskVl0Rse0PiKoiGOp10bEVhtkjCkDvgtx+hyqfGo7I5jCpICJJHDXlpx7C0dUCqhbn2
         lrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        fh=2COrdVKQOGx42xQwHpzMh0zDxZLBKuupwFWaF2b/uCI=;
        b=UWZYerMuGkba3BY3xdM9KkjPCPs8jC05xzc6YsH9TFUxtIbDEUbGeHmp0+s8Ufm8co
         naHrl0okct+9v0KKr8WOko68hKsnJDtfErsNhUSNJdF3RoTEBZcibAfi/0ccSoukt7Mf
         xXNVUzmWJwAJrej+nCG77UR86aSDDfrk63bFMT4LDYnze8aFkamG8yM1wQOUg7RIOdqq
         QWrXN3u1jFNpab2wTWgDsYuIWHcBbXi6lA02SamNQmrRZ16HGPjZqiYOiVQC+d5rB1HF
         BxNOyyXuifkYhNITP7SfX+sE/kiPq2LXfztAAzWWV3+ltAT+1yoOGUsLpkCN5h5QQCHv
         lWUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871745; x=1789476545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        b=sico+Lp/YysyRP4xLdqM7A1WE4+dF4Hegp6q5agjsNxHnEF57zInxfJ0Yw9u+hkPQA
         ycm0Rd4EjJv5y7xEtcwZ08WaxdGO5bq1n+QEKwMFpAg6OLPTMbKBXBAb5+4m8+dqRB3q
         +M2e1K8jcAW7tqZ/RDaKBAe5u0DXM1UcF/byGenCybwLNSgVG8OqWklcHXzME3Hq0H8e
         lD1RQ1ftn6kDGp2BLHOzrgMS4sLTF21K9krSK6Eps7pH1q2wjOi7cTEmUbtr3HuXl1ge
         HrbMpd7d3jM5KUe6Ixf3S10I2bcpVKU5yQwYr+bBRlyYdcPYjG4L6gi++V3snEC8YeSt
         UGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871745; x=1789476545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUiVqNsH2BqPxyyfl13B8I2hyyPsofxH5VCL45yPH5g=;
        b=tWELclJBx6C/jXHKjbf/Ee7sYo5On36YW04sAc5y5DBzZSbIjiLVZ1sTYjuEaN5K6r
         Hjx07fwAicQheMZadN1BaTmfOfsrGPaYKgODjSbisaioIickG2q4dKudBJ1jYZKIuRX5
         O7ImuNBDJqe9HS1+VypM64lGbj7Dl90j+v6f+3Zr8KeBt9l0slpLTKnwjSjxtQPJ2C7t
         AQnCRUnQGRznyqiZ59HSkabisX+u/RMkPq3XFkGa6u6okmM/Fi/S2WQOZKirWTJNWX+o
         EIQ9t3JrTSlp6PuPyIAbi7fbVE7XChJXCvXRzw9JegfnpThgLGgAM/Xj2DPXP9gae85U
         LJNA==
X-Forwarded-Encrypted: i=1; AKwUvByOgoDiZHRegM0WPPnKOBP8NS9n+AEX/DbSuluxHlZd/4zK4voBnrfyeQtDg0cxHyEYbTgishg6LJ38kmc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqAGhCs/4TMs7qjZp99z58qtr0gsyibHCO7WguJsx3aRhaS/Lb
	6MYsKBWrxG97PgPDu1V+aVwWgXnawlR2tvYkadj7bgFAN/+ht17yqDFJdMPeDj8OezyfMB+JUFU
	RbUEPHBMELq5KVaD8o5ERvqbDjhtybdY=
X-Gm-Gg: AYBFou2UTkbzc5weFKdK7RwM7NvmM8efRwBL7yrqTZCx45MTzInO/JB2HPIU3Ms/66N
	baabbFSvedCD0QyV5aFZkf3MTl5kuzWvKmFZOAO+07OEYOmOaVSiY8JKDOs9X+7aeOIxUs7Lx4i
	DAC4XCbneYHW8a+ZxEQG+aSAgbfdPgSv4SJ9hOGU0bklKAF7O1sjL57xTLC4cyaB1k4U5ny1paU
	zdUoxCKRZz0LrGM/dZBQT2ZMz0PI/FV4Aq5H70PnFD5CO56IjgLyD5OkZSLxRFJ+ZTwbva27/EV
	Cz11ASb2WHb+BuN+BTfdVch4hAnc2PKEu1yNP1fxF/DmiQ==
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id
 6a1803df08f44-9103efb48afmr389824056d6.32.1788871739943; Tue, 08 Sep 2026
 05:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-ncsi-over-usb-v1-0-6b74d2f1196c@gmail.com>
 <20260907-ncsi-over-usb-v1-1-6b74d2f1196c@gmail.com> <08083379-6eb9-441e-a656-0066c9006dd7@lunn.ch>
In-Reply-To: <08083379-6eb9-441e-a656-0066c9006dd7@lunn.ch>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 8 Sep 2026 20:45:36 +0800
X-Gm-Features: AcwNN1VVwv-AZVG7aa6d6kuiXNW-vhHZ-9WmoGIa_ElFwS3ifzk9WoGv7iR7QI4
Message-ID: <CAGfYmwUTsqgDQCP1q=XxCyW=R+a61urg_Jnnw_3-oJfw_BU38Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: usb: cdc_ether: add NCSI passthrough support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Oliver Neukum <oliver@neukum.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
	Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:17=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/* NCSI operates at 100 Mbps */
> > +#define NCSI_SPEED_BPS               (100 * 1000000)
>
> Why 100Mbps? RGMII is often used, running at 1G.
>

Since the original NC-SI specification was designed based on the
RMII protocol, simply set the speed to 100 Mbps as the default
for this virtual USB link.

> > +struct cdc_ncsi_priv {
> > +     struct ncsi_dev *ndev;
> > +     struct net_device_ops netdev_ops;
> > +     const struct net_device_ops *orig_netdev_ops;
> > +};
> > +
> > +static int cdc_ncsi_open(struct net_device *net);
> > +static int cdc_ncsi_stop(struct net_device *net);
>
> No forward declarations. Move the code around so they are not needed.

Thanks for the suggestion, I will move the code to remove forward declarati=
ons.

>
>    Andrew

Best regards,
Potin
