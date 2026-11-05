Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889339;
	b=OhllmJrL4we7WL/nm4SGjl6flxm6F7m49mAPddn6tk+q8bPEVR8gT3RaEhj011eQKweh
	 0ECoZbTSeX+hoW6pHHpyHDOFKvwPylYzfjFLtVNCWWT4leEthqYib96S1k7+0gxa4qW39
	 PB1c+bG7ALWWf/mF2SUto6X2cnqEMzsQ6GnsjTwUtRhu29ww8vRYxKTRv1+4P6hb3QeET
	 UsjyjAG28mWpGzr9sSZ2HBjxFMMv/p+WqM9N7Z0uGAS6/eL14DGO49MdzKkU4siRyliOz
	 kshQLN6WNmC90C6Ee58v3Amj1XjbtHlhvks3Lp1cZBvPF5WwFQUCvs1wghi0psb7j8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
	b=hE5XOz91M5XrngcY5ng/mtYiwyMeVjscJZWzquiMOA80g6b0dd6+18tc65SCrxZL63an
	 YaV3q0bz4CwHWplMg1JhwmNN6oI8T8nwKx7LGiNG3/iTWapO8PgGPRLWdeWDoLysPzGH6
	 Vj+H1zce4NTtlVdHIQo18WGYY8aTR6kdS5U/+twQRDo6Y5NXp9h64sgisUVlk64Y48fD6
	 MFBxd12y8Bj2eVpYf1EApTVpgqHVsbWR+Kmi8RjWsb+fhvJMe6zLd0Oua8s/TcdjyWbGd
	 oWXVDPYbBIr03e07k8UrfJtf7ohEZqBAsG2WLm91HplKUYT3dYAfE2IjuUbDNSYT9HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Jj56YXnH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17D8606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Jj56YXnH
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso780414b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889338; cv=none;
        d=google.com; s=arc-20260327;
        b=qJly/Dack8X/sPtfBFBHEDmSwCMRgCxsnRk6H9m5hX1IJrdtOkLlcwrVWb2eOXQAV1
         Xr+nxJymlU3NuKB7aFsUxoqyAvrce8PKJ1zCez3NwWzJ3ixSgBVbTic1COy4OpbWMHrQ
         tXFg5fU18M6PfHdo/f/VlnXP3VnJDtKq866MwGxoWvayX+Rc+6xPpHkj6mbjm6JDqvZ1
         KAaLfc2oiue/64FwY42SvYkAjG51/r6dcnPsEE9vMGIuInye8qt33Nom/8j+4kDuRouj
         0j+W6WlqiyPkbWDLolR5S6fob47fGOeAVwG0s4HsIBBf2Hz9bKiGT2JcdrGxZiyVzkJS
         cJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        fh=WtRHpYT/GyrJfHlQpEO7cNyTODlp5b65Lz+3jZ0aSX8=;
        b=mvIXWFj/K88oA++03fS1gNO7sp1AzZukYkn/QPofhKqxUtf3sPrvXox3oFZin6kLpT
         Fci5B1xbtZuA5v2g2KZro7wRgz0XdtEAHdu1dk+/ewlO99EyImMC8KsqlUrQurn6ylUM
         rmgfRvtjZfHUnsrajq/VDZph5Vu4X0kTIShYocB00cMxaak5gJxMidMD4GTywK5Dmj74
         q5xSxaZ4jTfayBC2bqpdr4TlcFZeLg02QYwaSaqqPCJx4cwy6xORW/yhSFX4HthhXLRF
         O5Ku0nZK35vZ/L7zzOOyzvWx9Bd2Dqd9QhJKbE+J4w3biZRR+zoANp29k0y85qr6huYP
         jpRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889338; x=1794494138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=Jj56YXnHPNA9OiS+U7LQcVvDZoE3GLgUOYtK6RLNXR/tTBFNM8x5JOBWcUhpMwSTHi
         UfVr5BsaD7/XNQAGRXG3zwTYMDSOfWi5H0IygQgmw5b/6xHk/KqqxTQhrORfMzFk/yfU
         xBQxED2Z14vNAb/mS4Ch+zdz0t4jk/4G9T40sEGTvwmsMleECOf/OAIhIiW8CtbtHZjI
         XfmAiUczaElrnOBr56j5D9fgpj2s3vCui/iRlDTyS9uR9ML8ymfXxrykyGVWw9X6O9tC
         ilgrXT9RVlPxoCLCSYf2TrXrCTxxhHPFTGVgTc6N2JF7ZitJrxOhH8YL7jGmW56g2G0k
         ffmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889338; x=1794494138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=dkxu6G/3tPQTObR1ZdCjpPls/+DWov8msO1HsQhtxTrKtZQua6VQnkGbJHh5M6Mt4q
         bkKgD3NmL3WMGo6gSl/Gz4ha4xaKJT4t9VpKRT1rf768GmX1rRwfa+VlU0VDGsbWHTYa
         lxMltGPMFJeANMlcI+jSjyFOiUpbuKVGk2k0xhyAUBLJopKOhIuw9bWQ6b0HjtQf1LoF
         a7s46Gr3av8dEv/kRDGsnHcCuL5E7SeGcVqlCoi3TZHM8dNt+3jKt1trLoDxHoGgr2a5
         lkyFC3h7tzEvX/o348pNIB0G6IZ5lRdqdqLh6klBDIMqw1Jb3vXqBe8bc6dAppUR/9EU
         cHZg==
X-Forwarded-Encrypted: i=1; AKwUvBykg8BkkmpHFS2gm1VuFKpzhD3+6CNOrEsgllZjOffpCRYIRKFPatTH4X7d6okZPNqqHOtC1pSzBi4pX7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NmnzSQ/w6lfs015B39jqhyL15TTJII+rl19kHQN1CYX+0rr+3
	3k++VYLVX0L6asiFDWxMi7yVNrV/IWo/re92MiM2e7H/vMIpUbtgBVkDAtvlxyPBYxnRuFIh8Sx
	9hAtxMHPOTEPv14A+8jAj2o8R4GcI37yEgDLBkq1XfQ==
X-Gm-Gg: AYBFou2E0CyJMVyhFW8VBBxofzR++GkZZemm7Xwd5IUPIVVnhUfBu3w55VZGoGs3fcd
	SpiccJN7KFFO7PuO8JTV/GlIAwcGwxHi9v2XQQNl47XpmPV5z/XngAGk/5CC30hnrFi579uJ5or
	5YdoRgy9vhNmauWsGNW1zEmW4A9hG9/7rJfs5bsm2SWPYlbuaaYQlrZIoC+797xm/J22qlAN077
	uhRhOL3cy36TreSmIZnCH3IMyaTwy0/nqAOL5ydVRfz8SlNuBqyU3p8Hgd7vk5t9g8mxM11e/il
	m5Mu36twZNqk0IlG0ee57REeADi4OlrvGcscKxiBZUh0pl37fl6K6klSprDmRAqEXno9l9BXG0C
	2+YaxqHT1CXlRXnubkVtMR4Cdmgv/g7t9+fhN
X-Received: by 2002:a05:6a00:330a:b0:84e:909:ac03 with SMTP id
 d2e1a72fcca58-8a9be48c598mr16519398b3a.10.1793889338094; Thu, 05 Nov 2026
 06:35:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com> <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
In-Reply-To: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:26 +0000
X-Gm-Features: AclHuK__6TlodHOzyVdjm-UulEeYQ_S-cCkdzywOgk9TNIGTgV-C-tpWJDrX-8A
Message-ID: <CAPj87rOKJ_EEmSwkokjvqytgnzTi8V_EhtGywQHe7xeww+ECDg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hey,

On Thu, 5 Nov 2026 at 13:04, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:25 PM, Daniel Stone wrote:
> > But if this series keeps on collecting unrelated patches until Sashiko decides all
> > of VOP2 is bug-free, we will never get this series merged. Could we
> > please keep this series focused on the useful bits at the end, and not
> > keep on adding speculative new Sashiko-pleasing as artificial
> > dependencies?
>
> Yeah, sorry for that.  I'll stop here with regard to addressing further Sashiko
> findings, unless there is really something wrong introduced by this series
> (which doesn't seem to be the case).

Nice, thanks a lot. :)

Cheers,
Daniel
