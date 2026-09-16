Received: from mail-ej2-f14.google.com (mail-ej2-f14.google.com [74.125.228.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D894A9D43
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596445; cv=none; b=qWM52hnv6ys/IAWNOzcvpfQXxFN8ldrRBHhfObY9DGj7aK1KlKZK3d7hs56hdeXJRKaWurH4+I36A25PQmb7KL6E8m9U5QpnM/MOcNvDD1yRPMkCi+guJ47aHMOTFyB7HEwtHjXIyh6dcCyKHlSA8iyivWiQqjZynOci2dIA1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596445; c=relaxed/simple;
	bh=lt3BikJB93Zkg8UHHA0fVUsHS8vy+oVkjtAS1xezz34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ4HvWh9zYWjS8MJoVsfD4M7eT2DetFK3uPYamgORip1GYspwS/qG0Qb22fE+j5zNy572sBG7l2VwDfcIzQ9BJfLcKNazTI/o0h5IdZUlLZMn2qIhIrykxsbK1v8vLZ0P4Xr+ZgEtH1xThGnzDO9K4HZ0jK71d7YxQKDTLG5MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8ihtO+e; arc=none smtp.client-ip=74.125.228.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8ihtO+e"
Received: by mail-ej2-f14.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso41325466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789596431; x=1790201231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRx2j1EfmgsLJaRhKgwq7WbmeY6pd50RmhdABMQZV3M=;
        b=U8ihtO+eg1Efs6ifxvQM2f0DjdsanfbByuwIjC7BKvTD/PizZY9HPgu1uOskg/eN+G
         8xm1MPkDLtYs4C4F/gsDX/KBwxsMosB3sPU0ry6DHZ5Uh+tOHbj66BPjTTR8Kp3Rizp8
         WSEnFVuiSldakwBRtI3YXeYtjXHwzCJ04XPU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596431; x=1790201231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRx2j1EfmgsLJaRhKgwq7WbmeY6pd50RmhdABMQZV3M=;
        b=rjx6wwy2NGsKnthk6R3jH/bAux2BVdMIDd3xBdE0DA00d9fPTN0UZBzXaZeDdF+Bsl
         hRhXrEKCdQlXKSphJEFw+4DCHuIvo+kOxPAIyCvK+oNz2Iym9WnzdcRIXLPi10T9Jtjm
         fts0D8j3/e1VjiqXv85Lb8t2QPlTfwgmjik1hzZhSrTeKkdia/VtAe9NihEl/+U5ZEq5
         Dc1mpvZl/3RkkFCP0mpcHwmVJXIcTaDFKxeJSVuEADe8Ar8M95NgNK5b1OtXAnU6URLZ
         mY/Uj3k+XEZhb3dUDMEouJ3Qw/6Yr/NTJMgNPi06WO6p+EmCF4BIHFQMLE5wrSvr84Vv
         B4xg==
X-Forwarded-Encrypted: i=1; AKwUvBxV07ayTazM2K/ulbIRmxY7h7ZT2v0r2OSM1hj6Pf+AoD9lYmDvasilLgk9Hhq9zfnb5gn7tg/LCeYkV6s=@vger.kernel.org
X-Gm-Message-State: AFuF++ltm8ETITFS9VgwdWpxqWEPpjTCOVDxmAvfLygocmEGmr3MfFHa
	5NIa49bUby1GELZbY+ofTqPMd7/1jGK5peWSySuJ+w8DgVQlaJnXa5eZQ4pCbor4nBJgytnOWlO
	IIEY=
X-Gm-Gg: AYBFou1Yna/gPIgxK0BGXVAZ4YZXaVZ2erc/7o1PaYtzLFnVZyNnZVnXyIVHL29UhaP
	GFGBV09tsxDF3c177rrwHnd6BBS225+3mgzebEcCWB3wk3W2uG6qhS5mtBR8ng1mjsJy1bfiq+y
	b1LPjCpz8dseNDkCvryL6mN8O+UwKjPz9sRa7ZdCLey9ujYmVdpz8lGvZNGpsxqp/ghPN1aVyJq
	lERCiNa3IFZ7WmitIOrZTtMppILkXHSiK2gqjt8srf4CMO2ztFRQRBfyS9ZEmpnzN0DrSBlNWKA
	sP5QsSUj+XBnAvI/vPmSz3xkSMhTPit4IOHDFe8y6N6lfXyuiSRk/Wxnb2iSbf0rfo7Qkk3eDvJ
	5fCr8iCbKGnSxct3L/+QeaTt6yP7WiZqYlUP1nHn4WY5EBhqvMdHU0pH8cN7aFLJVebLxWwNELo
	d1YGBRohmF+FnLy0kCH3/2NTMrk0wLL7ZCOMpaLKJtxxWDKU5fBt5EBtdcR/25zhPo9xBfawVRG
	XYCE05HOHdrxd8zSj5Ip3yPPojdvB9YSlOqdto=
X-Received: by 2002:a17:907:f509:b0:c29:f5d8:9c6d with SMTP id a640c23a62f3a-c29f5d89d0bmr65739166b.28.1789596431151;
        Wed, 16 Sep 2026 15:07:11 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5baa11sm205323866b.40.2026.09.16.15.07.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 15:07:10 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so1221465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5wGwYpXUhSrc5VUir1l2OZIWGVswP8uWMxaljxH5S9qq042ClA3xMycukDFbneBEev8HJpQNNOjcjOsg=@vger.kernel.org
X-Received: by 2002:a05:600c:3b0c:b0:49f:bc28:e8b1 with SMTP id
 5b1f17b1804b1-49fbc28e978mr56379705e9.14.1789596429113; Wed, 16 Sep 2026
 15:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155730.2077434-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916155730.2077434-1-vulab@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Sep 2026 15:06:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WU7yOQWBW4SEMcHTwXxvNTMqO4P0DABaeQ6mBw7h=+Bw@mail.gmail.com>
X-Gm-Features: AcwNN1W4bKNukAgg1BwCpMhcUy96SsDz__HwTsvy2JJtukIrTrTDwRV8nOIqNGU
Message-ID: <CAD=FV=WU7yOQWBW4SEMcHTwXxvNTMqO4P0DABaeQ6mBw7h=+Bw@mail.gmail.com>
Subject: Re: [PATCH] i2c: of-prober: Fix device node reference leak in i2c_of_probe_simple_enable()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andriy.shevchenko@linux.intel.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wenst@chromium.org, 
	wsa+renesas@sang-engineering.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 16, 2026 at 8:58=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> of_get_compatible_child() returns the child node with an incremented
> reference which the caller must drop with of_node_put(). The error
> paths release it via the out_put_node label, but the success path
> returns without doing so, leaking the node reference.
>
> Release the node before returning success.
>
> Fixes: 897261149d25 ("i2c: of-prober: Add simple helpers for regulator su=
pport")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/i2c-core-of-prober.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-p=
rober.c
> index 6a82b03809d4..603de487ee2d 100644
> --- a/drivers/i2c/i2c-core-of-prober.c
> +++ b/drivers/i2c/i2c-core-of-prober.c
> @@ -354,6 +354,7 @@ int i2c_of_probe_simple_enable(struct device *dev, st=
ruct device_node *bus_node,
>         if (ret)
>                 goto out_disable_regulator;
>
> +       of_node_put(node);
>         return 0;

Sure, looks fine. I guess alternatively we could use
'__free(device_node)' for cleanup, but it doesn't seem critical to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
