Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7A4A68A4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061394; cv=none; b=WqCyL0zBiFU649zDcTRl8g2qsHmO29xVszqpcmuOFdQao5IgSr2Gk4JafAj80lvgK3CLKppuELdLTs0IuraeF1dbTWxgLTGm3eaJVIWd9KjzjUBv/INpGnFVF5p7iB2134DgUSjUyr3dnqUngiLNGKDtwS/aQ7hKYELfq66kbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061394; c=relaxed/simple;
	bh=GZfFkmFPdQF/uZACubSWUzTLe8ySNGi7t5OkcD6f9Vc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XGaMEWEMpu/anFNZtJCz7CyTMO75F7YISBMqMr8h8+vYxOo/+KfJ5vRMZtjCiSR3M1CbzxMbiH1MhoP8wEaMhLcSqR0dYEt+1tR1EW78d5nc/TxCs10azRiDcDt5AKVIPjeBmCWqgeGQVsXy2ySSRsXWtJnW83iIndS81buzlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJbMyBdc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Erhd+Y9l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJbMyBdc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Erhd+Y9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792061391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YcmYNt/gMhxdaIj/6PLYTkAXyAHJ490Awmdvej+Tuqw=;
	b=bJbMyBdco4sJzLZmKZYFwgFn3tnBKp0x9aZZMNlbt5rdaYVTYnxjSOSNEaA0Wuq3HbE76N
	G1K9pH1kB5GOfttGgtdqlOZOTQsTVl11K/Hk3X9y5JhndGvJ9NLYgawK3eMe8sIjeoy5cT
	e/PUrQyq0PpdqX47AaOeRtkIUwvHMrY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-2BmIOslLOaKwptP5FQuOvA-1; Thu, 15 Oct 2026 10:49:50 +0000
X-MC-Unique: 2BmIOslLOaKwptP5FQuOvA-1
X-Mimecast-MFC-AGG-ID: 2BmIOslLOaKwptP5FQuOvA_1792061389
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df730c035so278145f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792061389; x=1792666189; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcmYNt/gMhxdaIj/6PLYTkAXyAHJ490Awmdvej+Tuqw=;
        b=Erhd+Y9lQdQH3eW9fmf+ArlpfZBGgIwgp+9DVL8RbxwPM7XCG+mruQfA/NZMkFlrr9
         UAs3I7FqfQtOtMY/K70RpqTDrJ7RuxeYE3PYViFqpMOIPfpkiJWv2IxtRlq6q+8oHA0Y
         r9VapKewCVASsjFGXVRnvL0tucUiUCw/hv7YaiqE/wF4vtzKBpRHiNgKnKCHoELMkIKp
         x02bNlzt7LsR4qjn/zD+WjTWoaMNgZrAlxcdmNcp4zaVEx6ks7ZNjr5fwhasdlneXqXk
         cUrwuge/mag1ply4g084k1m9xQvkLc1suqxPXbWnDvUella4JYlotlxP7iVIzcuda/67
         iDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061389; x=1792666189;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YcmYNt/gMhxdaIj/6PLYTkAXyAHJ490Awmdvej+Tuqw=;
        b=157h4wd65zZDBslWh0dUibd17296qK/xzVJYO0zzj1Iv5z8ILRpoR/v+2yVVzzFUkL
         ElKI4x04/OEsRyW2odS1m+YadLc86neZ3a8yLzYdWiF6JRie1qWdRKGczyyzfGYati3M
         W3oz0gn55rMsHrn5GWMjqoXvtrRdlOupTz54fK/9dAgt1KzKH0J0BKyn0uHlS8eu/Cv+
         Jwx69GrGmJkAXmBB60MRtzSqtUrla3eupn1Z5cmIES6CXE/gumolDda8PWAxeaiIAkzn
         1Sn7C4rquLfWaRUhOKnRvscz8jJ2XIV6qhZp27voHM+xNa1abIjOSoGUCt7jx0bv+OgU
         Hs/w==
X-Forwarded-Encrypted: i=1; AKwUvBwp6pKAWWuRIFccbFp/qyt7vEwCWyaq4JzWkdrDjwcGIAaPF+Bbs0h4MBfgtEyyOCXsExbKCbIHvRMLDBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1xuiztoPmnpKYISFJMkByBRx5rMhDBLvwO91J1kIALC3YP37t
	xDTTFbDIQJP0FNvTAG5Q8Xf/VUmuCmTDGnzcI0oCt55OuMz+R/WtLaxSKN9ePr7xCojRwRVcfh+
	a1agClWvigfu3we5Gkgr14AKjQ+j2Fba+HSK4g9PkxrJayGhCK5X8RwX+UJfMfeo5Bw==
X-Gm-Gg: AYBFou3qiq1z8SJQp3sxXFuD3wuontWNOrnsbHFtJ7q0mX7Uwx9NMIiiyJ6kghCXDw9
	lLvnI0Z4tujrNKLyPmwEy2O1qoMSjRYcyHgyRIkq8d9QVrcO8hiz2VEC2oyPzJ9SNz9Ij9dIX+l
	26BFb/kXhq5yUVflZh2Gy15YSRx/e/hAg3ucsMVdH+POFERtbqk0hJ2/MNGoB3i2Jag2gvDtHI9
	1c7iwDQCN7wpfiiA0Y/raDqGuv5gxJfVX6uKTDwGYCoyx2FpCMmUzf4PpcTmRqDKAegNZjyrBWQ
	uhz4ap3nY+4sSQ4Px2WZos9urrU0cRANOVVztJSrvTtH/FDl9LmIZP5xL6amlv2Ub2tYD7JRAKZ
	x1GotFMwko2EtBM8awgX3B/xXxE+Vj+gU97EQB+CXlhzSag8LdF66l/Sdi6lfrDm2bA==
X-Received: by 2002:adf:e185:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48df56dc2c4mr3636388f8f.13.1792061388867;
        Thu, 15 Oct 2026 03:49:48 -0700 (PDT)
X-Received: by 2002:adf:e185:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48df56dc2c4mr3636319f8f.13.1792061388254;
        Thu, 15 Oct 2026 03:49:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm8405153f8f.6.2026.10.15.03.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:46 -0700 (PDT)
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
In-Reply-To: <xlv1se27fddc.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
 <20261015-drm-ite-it66121-log-probe-errors-v1-3-7fd6994e0be0@bootlin.com>
 <xlv1se27fddc.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Date: Thu, 15 Oct 2026 12:49:46 +0200
Message-ID: <xlv1pkxbfdbp.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Luca Ceresoli <luca.ceresoli@bootlin.com> writes:
>
>> When drivers are working properly they should be quiet. Turn the dev_info()
>> into a dev_dbg(). While there, also make it more informative.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---

Ups, forgot to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

