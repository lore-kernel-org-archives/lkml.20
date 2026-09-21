Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1474F404B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013908; cv=none; b=fOhzgM1PiqDBRAAzFokbtUefbA+/Mqt/Bv1EdtSlUdqRZFs80WlwvkXTWM8843i1gDnWqyjQp7yrb0B5Ho+v5+cqnvFAWY4Elt1F58xVWB3tU0CNWGd1CF7+YQTfA4B9Cycel7cQJs2Yeldm52gqwFbcB2IkALO8TQp1MXoMX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013908; c=relaxed/simple;
	bh=TtGA8FAwyVtKQU6ihgcUHLNc6TfPrbRYp5zBdV15gjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEhT1V4tJuIWcFyQ5psRLyVWRSEHVjLkbizUhPRaHYHObutc2aAtDypExBt0mrv1MVSFHAOuSt3U1VLso3W8JD8EVETgJge1PGvcYqdi4N7vauG9wPQQUIarMX+kMNgJKWNP4K9ZkZ2ZBGGE7s79sEPBYdLoaBgq8GEuO7zJK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldSc8iWA; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldSc8iWA"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78565b4db77so1694895137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790013905; x=1790618705; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3q5Pn8PVukD7VgmCNiRaWY+I+xY+HmDF82DkgaI6sqs=;
        b=ldSc8iWA0jR9mXQ6MkvFRmFVzc94d9Y/4jOcf0KmPtui36ERwQ2k7wwwg7wmSxrdF0
         gthI3ddsJ19mD8QXe1/sEVq2XIUUEPvxyi4ww66lTIHu7kdGX9TtDG7keOrJRjBJ7W6l
         6UGOO64XX6uY7hAIhkrI0k3sLbB9jLn1I6N4FzoMcv5MuG+DvAGtNxRF37R5+HJPIWeN
         1y7GqWEGQoxBVzbhkyNgH+V5Ex4AuocLrRf2B54ywUqr0rUL4J4Hbt0JedY+oneOPnij
         EBQiILnWEXxZmYLMI9sN34D7Nj88kZ++phy7yMyM1A8OiYnvmHRt73ZQNZRhM0ht83Yc
         mOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790013905; x=1790618705;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q5Pn8PVukD7VgmCNiRaWY+I+xY+HmDF82DkgaI6sqs=;
        b=nnKm9561dmGU9BeLVRioqUrsvcTA5LcxL5LUMUfKmiAsHcP02QCEIqE/JP+ViYG3xA
         7ErV83Ub1BOHnPkmj/5ewz60AxpYBTlKJh9goMa6cnRGOhiydcvO6r06Au2iqldX5Noa
         FPnsVC5ZpOAlHoRH7ZW3JextvI4jFzGzZkItWkwlKPmK9VYHS1Qd5Fyv49cnhl2fvJFH
         c70DqvHrjLfGD3hl3BnpWaKUSuPSm1RpCUn49GIEPEX5it46hGbQOgDbt0j1+XDmutrQ
         JEqsYxLsn5u3quXcv3Gb8tzHJl/60aliDQqrkauFGtWLrupKw8Ed7OoJ/ZoQc7TxhiQ/
         025g==
X-Forwarded-Encrypted: i=1; AKwUvBw4d5xnHrgzByHzwq/iVbt0eAI91O7paifbi230vglw2obcgMfG/+1OoQkMEhVaGOTCEK0fepKgyEOxXFk=@vger.kernel.org
X-Gm-Message-State: AFuF++lmQIkz9cbMR7vyn6c6vVL6R4QIsxFoL7hROKlCj08+jpq+fT3j
	IbfW5KmenY82HQqli4aWTqTg+mZVPp8BOGIuPkfHWpaFR0X4T/5IO85qkgIyefTH
X-Gm-Gg: AYBFou3S2Hi23H5YPrayjCskpQWgrYCiGd1BWajoR3WZIWIdHZQoMRTBXUDy9zppL3+
	cXeHoH/0grhAw0HC3bTTXaWo3X7WR01L2kQ0DjUme/GPoF5M2az/8Dg74f2EB7KzeOcW1f/5DTh
	UxAgW+1Qgzjf6t4ZySVjwPaPSW1cGHvN/3Bxy8IQIWaBv2hC8+XNl6BwSxqjOi2GnkMVCKKc8cu
	xlgb8K4aI4Ue8UH2R1jqs/YA/Hn3E+qHZNZjJtD48vTjKuLstRNQ+35AjtIIWnLn2BFtfVJ5Q9J
	mkeriYFmBqELCXhmG6Bt/aAI2zWwsqJT/Dn1H50yyOepy+xtR8Q5R7CIUioo3QRLGl012G0+34/
	RciNfelV3/zOrGLxti16XgIwB36/is6ZLlqXX+JLvRhG9saA0COsHb9L+8qNdhKJxb//KFtPqc3
	wcEsCe7gCa53A13X7cedLDej9tkEp+OBtHC4dNgzgMqCsA5udW9Z7T8+Z0n1ts2f576g+pn8wVM
	9ybOAEcffzkBLs=
X-Received: by 2002:a05:6102:4192:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7a55c886d2emr6384562137.18.1790013904968;
        Mon, 21 Sep 2026 11:05:04 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7aa86b4efefsm736826137.0.2026.09.21.11.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:05:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:04:59 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Frank Li <Frank.li@oss.nxp.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com
Subject: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Some time ago, we had sent a patch that implemented the .get_mbus_config
function for the OV5640 camera. This change was necessary for the camera to
work with the i.MX6 after the v5.18 release.

    https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u

The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
implemented on drivers that don't have dynamic lane configuration. There were
proposals of implementing it in other points of the camera pipeline, but no
conclusion was reached.

We are planning to send the overlays for this camera for the Apalis iMX6, but
we verified that this patch is still needed for the camera to work on the
current mainline. Below are the commands to configure the pipeline, which
explicitly require a .get_mbus_config from the camera driver.

    root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
    root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
    root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
    root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
    root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
    [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
    [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
    root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
    Unable to setup formats: Inappropriate ioctl for device (25)
    [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
    [   62.616204] ipu1_csi1: failed to get upstream media bus configuration

I am not very familiar with this subsystem, and it's been years since this
discussion took place, so I wanted to know what are your thoughts about this
patch and what the correct approach would be here. Was there any change that
would make this patch ok to be applied today? Do you think this still should
be included somewhere else on the pipeline?

Kind regards,
Leonardo
