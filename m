Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543204EBAD9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061335; cv=none; b=axgQwu9LRpRrVSm+UGo78fOPhEIZ/L98c4JQwcxSqbqwjuUkawZPKadykoW34QEw3IjICXyjPnWPgsGucBgRCfanoTqyv5mffxhZ4CaoS//VOxNHHREQIqc/jTgloW8GGGePCZkXoXAlQhiz9h/P0M9EURUjU6OrNFd4rTnrOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061335; c=relaxed/simple;
	bh=RpN6E4WZheahMumO3urXk2ghVLNyw9TwqMMJ0iWbnJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DgfNw8A5kz6sVsNTke7Z+agL3BWOMV8/h+TOCNbdXc2y398cBf9PgvUkdvwHPZWBeZzA6o14WQn5wp20HNOLVdVhC3xxmYRNBp0U+zYPVq6f9Z7+VuC4gbiEiNEg8anjWEBTTVpK+2ETckjlxWEc65hX7HZKRZDE+LaeUY2SOXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QfoNsspf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKvL92sH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QfoNsspf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKvL92sH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792061333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdVLMAZy6yX+rhcPQgA+e1xHnyjEu1yIo4gqZ1n+w9E=;
	b=QfoNsspfJ9srtkjjI5NlZWv4AAax3ZjfVlWLJMyf47lDoOpY7VP3a499JbZXlNhW+w4+B6
	4ZT0urqMOZkQbS35uyWMcEs09o1CwVUyf9t9GyxhER2r+0HkzgwOwfAaOkN5ZXkSa10P9I
	elmdVulVzXWLii8r00M7ZG3jgwZEM90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-iDa3iv1BMQSfHe2lEmS4sg-1; Thu, 15 Oct 2026 10:48:51 +0000
X-MC-Unique: iDa3iv1BMQSfHe2lEmS4sg-1
X-Mimecast-MFC-AGG-ID: iDa3iv1BMQSfHe2lEmS4sg_1792061330
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c437ae81eso1032181f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792061330; x=1792666130; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdVLMAZy6yX+rhcPQgA+e1xHnyjEu1yIo4gqZ1n+w9E=;
        b=fKvL92sHSuRsX5/dr/wIVonwLCBwMVwzeAxazEnBFNfO2cXzAKTaL3KaB0dqo+YZwg
         GMbpFvuNenUEFQgnHKliPmLHtq/6sYiofzkiyHuheXSemUVtv5GgSGvaBiPIVenCFozT
         oflmA+A33szGMF+TBFWpaue00ZBJKGWs7z9BIRdFapeHsH1EJRUGKozUvI5TY8HH3xqd
         vTOv7JlROABUljZTQOMEs4nUVytAk0OptIm786X3Er7RQxWL5pldIQBU69zkph5O4EIz
         lX/lQU1hYgGw77cLUYNbntat4SFF4GGxEksU0uwt35N6CvRg8flt17/xTYLBB9HvsQax
         ql2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061330; x=1792666130;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdVLMAZy6yX+rhcPQgA+e1xHnyjEu1yIo4gqZ1n+w9E=;
        b=PLkMjNM4/g9iakhvKU1/sJ/rgOnhjGjprF0HuuopHTRDDXGxkPmeB3ygwu+ToYmhVQ
         q9e6DDwLZHvgka3H05KWxX6CLO1C9bSYiAkCdJVMPb3d40EkmWrGel2zFr9IJqCZhOBW
         reYXBvzAkCjpNLlE9zWfhWTR22XbA3rF3RJWqct06EtDe6PDO1cqEu1zn2Sw96f5QoQI
         fmNjhTUgCWWlwdRwQnfUeSO5G5e8g7oZcWlyz+uggeSxXZlz5VIes+j2kIIBoBOz80xJ
         YU7b2w8TyL3b5DCtcpuGLFjAjH222NDbOwUYMTsrxegLDZA7Rf92Pf8b9m93RpV4KOQV
         xhxw==
X-Forwarded-Encrypted: i=1; AKwUvBxYD6pIAM08mFvlPX/IuBNeinLRhXqOr/caQJRNeH8EuYR2/3QKUUS12ysTK9t0v+LQIZwElRG90mhlLyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgNiJ+wTF9HkvTrR5I4hZl/OVobyLv2yRdAkyoQjDoAaqWJJf2
	VGOcj8CcngwNO7EWOWr5OP5usNB4hSlyCRWVPTd8HBMyVxbOS1Af6haO4fJ8H8SeZT6OxiDcFKb
	J9OzX6t7imUxHyoOjpvAuTr2ZSlQK4Qbm5RprszS8pSRO6SjmtgeX6hHbIWeFFb4PEQ==
X-Gm-Gg: AYBFou1rJ8f5k1+c/bpgcmCy7bW8uiIQmIujY67RPKu4l1JJO1uocku/R1IyOEklcdf
	DcB1mZs6ZGxxSGDW8B0ZcIYS7c/nN21hDSaSjMIxnuRWErGfYnO9jSUOWDP6Un89XVG5VLPnVYk
	Ilum3fSWNChdnxrpzqiwnWvDYvDR8oYihl00rJpGbhQVTfootHK/GF7JdwB231svZgYBgOgnuXA
	ZK136v5Rr/FIsij9RZ34q+G/B3E3dOonBwokZ9Zhg2iKPHmjGjbb3qcTJ1gSzv2rLsr9SCoO9GU
	lgl+1Osle+hEjGWNLV/JW9b6jXe45u5ewSh+NeKUpXHEDctaUtXxcXGYYcuDPIMIVm8NuOdNwHi
	+UQXoqiQLOu1c/7MbjLu48Cq4fYyxrO73IcK7eavtJnauXdGRaaA0jtsgI1pVZOLPVw==
X-Received: by 2002:a05:6000:26c7:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48df851f00dmr1880330f8f.24.1792061330373;
        Thu, 15 Oct 2026 03:48:50 -0700 (PDT)
X-Received: by 2002:a05:6000:26c7:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48df851f00dmr1880255f8f.24.1792061329842;
        Thu, 15 Oct 2026 03:48:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df50bd11asm3806219f8f.8.2026.10.15.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:48:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Julien
 Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: ite-it66121: make successful probe quiet
In-Reply-To: <20261015-drm-ite-it66121-log-probe-errors-v1-3-7fd6994e0be0@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
 <20261015-drm-ite-it66121-log-probe-errors-v1-3-7fd6994e0be0@bootlin.com>
Date: Thu, 15 Oct 2026 12:48:47 +0200
Message-ID: <xlv1se27fddc.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

> When drivers are working properly they should be quiet. Turn the dev_info()
> into a dev_dbg(). While there, also make it more informative.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---



-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

