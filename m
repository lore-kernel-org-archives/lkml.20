Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485789;
	b=bZzitjb1cRPs45xEMSfkz4LDfYqTfPBFLRU3qWYRM6eF5p5e8HvJYN4LrE1NBBfszYT0
	 5QJ8z5pHW8C3efxhzFDAFHDW1+956OWVEYKrM9EVwWYZHu+P31uWYas1a6Y/YslpvME3H
	 JAUT/6rUnPdtWT3T7qCeRw3gCMx3/4D4y/Bbs5fK+0AZ0a9+KCrJiQI8SqRv7290YgfnS
	 OQJCVuO9pOLvUZVNt6n4o0V2qE9IErNmfZWRw8dh5Ap2jS+p3k1A6rD9c1TsDT3A3CEoY
	 wKDfG4bGpJWbpAanQP4erRnM77FFqvWdpNEwcncr6Org+KCJh48bXxupn+8bwqzVxOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
	b=AauLBU57GsAca1fyT+YKfhjmHvsE9f5nF+nihkrmtI/d1viosuqneyu+lsQ3xn/yuy+a
	 SfGDhOwi8RyI5k5tkygp077wydh/OeuhIcMhgCfS9jDD5gQrKmgT/ATlQVVSNghyPG9+O
	 SYojdHLKrT181SpCz9yl8/uk3Cl1FL3GF0G8zXKXC0MuThUJ/I3dL3imcQ9E/tlB/ZRBF
	 trqan9LgslM3BviEixUZn9rPWahxNtmFfZhFhvKRKaqFEEDccuwuiGUrKkwYbmtInPAk2
	 F6esKEhB1hzQokruaMHCZxemJFfDwzsuKgLOG/PtVjhvzatkSDZePhs2DhD/Ws/THOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dkamjsEH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29883606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29883606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dkamjsEH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso36909755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485786; x=1795090586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=dkamjsEHnqTTm6zxLCGGvG4deMHTQmxQCtrCBf9PPyGrFgo9qqByuBksWKD07W7fHr
         wzp8xNUgoFSEqd1EJVbs10N8xgM9XNax/C+w6Ktu85eOAcokzFKJCZGmnbsIETFrJV15
         pnvuzQ/EkOAUvNtdPn5mXnG82eZ8FRsNs6GdeGnB+8WBcbNJjMiRpq3tL8xvq6+cjnkC
         urcMm04MvwQV+JZnxAyCbtz60yZG8vE5o7gTz4uu0F70V3O+W8Eqc5jEYPwAPKrYKd2Q
         Ii9hSrZ3oikGd+qDsmdioUPFjHOoM/9bbDgh7miAvN/oHdmpLLOvhZXVSDXIz90ffenz
         rtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485786; x=1795090586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=QcseYci4L7xkhJRq0mzFPE1UzlNFFyXSVVwLI99v0+4KL8C18WuX/x9t4agp/8QvXv
         B6CNZi5c2v/SYhUqaK5ZWyCQohwHCu0tuikYHK8iTHTk4NoyvulRxH/1soGYkMdJL2ii
         hogJTZsPKrbWGRgHWxYUTBTq1ZScKYUe0nmaHx/pA+w/qY8rIqFLtBwkyDqDV2n0mIps
         rXD+v+SjnzYr+WwpQYl1GOCGAw1PdR+d1nO7YO9qKdPMII39LsrQ0eImAt6DwUpJqhPe
         2Ln9w2pXWlxLuMq5Z9V4kgRZXY/z6H1LfSGqrk5n6SBlpjbJN62QC7Ytpp89f7ySqS6J
         3Vzg==
X-Forwarded-Encrypted: i=1; AL+hErHWKBF3x1qUY1p4BQ+2eSgWUI7kiJc3l+h7W7B3wl0oOSyjvfZMSqrKAyNjQQAx7RWcgWhNvWkMLf0AUUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CqP9OUFrtOtWqgfVD04WKlHHCjwlm+hBPFlr8N4ANaC9KibAs
	z0E6GGN/VkzdEl8hLIgWe+G5YOdypCcxgeoh3l4UbPdNucTIonzNUXg0nU/K2Q+GRMg=
X-Gm-Gg: AYBFou3knaH12k5o2Lpcv+0g+9P0ZbndphTq8Bd/e+xQ0LGq0rvlJTq6FN14LCuNcJl
	kgQabcbMYPNfDmgyBA/Un65qPajkUX7e6gLinbFUFMxD41DYFVsfsT+8V36pqU2r/RdBJ9X1O4W
	mjv8efpXm7voAUYiRZA3mP+U8dPmcxHtuGy5r5xOj5PdW34Ac3z9nOGslleMMfrXZfsUtcsN8hw
	loz47z76kJ4QZi4vdIU11k2e9WTkKjSN4LyVORPC8kfcecj4VMzxym9dXqjPRjuYOX4UqrsW4u1
	op35uxGjSkZw1FVJR2TxBxgkrxLl2XmwoxxrZZ/g/lr3zYYT/yfOyI3d7qt7nZ/apQ6upvgtXeu
	BMZvY2zyI0JzjzXJPgYYu0QCrdPAEw2iL6KLrkUX5AWt4WSsJ71ZhlNuSrOlL0cCw9Q63aQPnH/
	+cfCxVIeb3+JuwexOWHh3SUgtUaOIvAF8ojQUWhfHEr+tvI1H4JwrF16VZxJhHDCnqy1Ck3po3Q
	NjPqHxBJNOr+OuRWUxjJUgcYw3KBR+kd1PQ8KEQWfGsY8dEg5Oc2oqLynBB1QLe6GAGpuB5bsVQ
	T7MFfSfsUyOCSCNFfqyC/Ls9AEwI
X-Received: by 2002:a05:600c:4504:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ba09375b67mr98996565e9.14.1794485786500;
        Thu, 12 Nov 2026 04:16:26 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm70743175e9.12.2026.11.12.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:25 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:20:23 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
Message-ID: <avWvB1MV3BMAnJaO@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index 2b942ca7196b..e81c5b295a05 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -180,26 +180,13 @@ static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  	seq_printf(s, "function %s", fname);
>  }
>  
> -static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -				     struct pinctrl_map *maps,
> -				     unsigned int num_maps)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_maps; i++)
> -		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
> -			kfree(maps[i].data.configs.configs);
> -
> -	kfree(maps);
> -}
> -
>  static const struct pinctrl_ops brcmstb_pctl_ops = {
>  	.get_groups_count = brcmstb_pctl_get_groups_count,
>  	.get_group_name = brcmstb_pctl_get_group_name,
>  	.get_group_pins = brcmstb_pctl_get_group_pins,
>  	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
>  	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
> -	.dt_free_map = brcmstb_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
> -- 
> 2.34.1
> 
