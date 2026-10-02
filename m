Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B0211466
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945445; cv=none; b=AvmuXv3TYzpuWnuY0PjDRy5ALwyMSW8CrRaBz+5eLAf0rHGxyAb7P5sjat8FkL5YrUH6dywU+MXOjoL3dnszsCpsVh1uEarTGmHboaqnHt/Tk48Ko7GzR2f2/w8q24iGB3jusco+CPK8OoCi/qnFAW6EK+WF1ZElZCQ0VPz3JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945445; c=relaxed/simple;
	bh=8LkjODUjCX5ThUzoqVO6sm9iNDH6/CxQcTpugXdKuOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qcYUswOtW0Xc8KBzUTcqfKbWCBOb9q3kwrdJF2esneUTnZ1AjGFT3hXFJ4Zh5P1dDy9gKhxot9yax62Po1Mwkj479rhtDt3nF125N+k9SspSy/axKVn/oz6ArFcff9UUfubKbArxbX4fEGqyB1U+uYr3GLHDlrZM+aGxMFnofzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejmaCF5J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L69ATRQ5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejmaCF5J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L69ATRQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
	b=ejmaCF5JNKIrKh55w5oXP7Ty09YvgzkDFQScpdsgCv2ZW7dYk6dXca1ZZuAcXgHn2/GbAg
	YCOQQEv7trOsLUrir0OjcPb7IddJPZR4U1W/om6GZc1TYbvoO+J6E8jR+xu0fIJrU5/X/r
	gWYwLq9OhNMFi3Ewd09bCNJ3Q7xbThk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-4DPbWq2KPKO07pAL3AQp4w-1; Fri, 02 Oct 2026 08:50:42 -0400
X-MC-Unique: 4DPbWq2KPKO07pAL3AQp4w-1
X-Mimecast-MFC-AGG-ID: 4DPbWq2KPKO07pAL3AQp4w_1790945441
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0185655deso48265e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945441; x=1791550241; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
        b=L69ATRQ5qL90Ce7doEQCsqYIQlT/pgZY6rcfv8f3almuJDE0EVSg1HI6wXN8jNxVsy
         W34YAmg76udROoMerfNcdvlm5Mu868r8a5lOaljuosiZtdKRuxdtXdsAcn/QXUO6ntmo
         0c9/vFokG8ikR//SB6UfI6qxc8wbYpVxfHt6pSBFFPKfEyZLAeZ1zG6qvO6ZG57IUX/L
         CkUL6vI+SUZ8v7dnQGecaFj8CcUE9MnYg4o4opMZOPzeqbH1VLH0Uj0cZpWV/YR9cNWQ
         Mb4hLtnhzb7FKmYDOrVFA3CXHQ0uU8fQ+tkfFJK5cfmJtm31bTDx4Jkm1/5EKo0tBGmK
         /M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945441; x=1791550241;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
        b=uK26bP+g6Hja5LYC2VTs8fRoXj7eAM8VFD81u9grhIFZ4zaQitaP+4uozO6cFy90ke
         LztKwUYDua1u636mGivt+JLkYCDqUwVpuOZisPmj7dv8eDU7WWthOWWj6WBJBgZi1h7M
         +LlJF9KjtlVHsz30LEOvdnfsIOeAthvJ3zfBO5I+I9nlPc7R6DcYN+SBHKQNPI9Y8Uvf
         GlZWKL5bSkzFFno85wgKz2/njjqi/1HGxCER1eQHrqhSYcy196gMKOOXu1IW4wkC9qGJ
         LKJWbbYO0yX28HVKGWZKD3kjbUAbZSveCaxQczdO1QKKsWJEY63M5jZEy7cMu50FJljn
         YDzw==
X-Forwarded-Encrypted: i=1; AKwUvBzK3ZXKn8ev7cR4pUuvfu+TeU5FQ4Hz5/EXmSoQ00PXrfuQRw08iOCZ8U6+nO4wRl2OpsMFVWRf/Af1S7A=@vger.kernel.org
X-Gm-Message-State: AFuF++n0qjJJzZDQ92vblp214uC5J+1QRux5DmlWfDAv6bQjVexzrKld
	KQ/Uq/EqSAcoBqh6ykic3glOkCHuSgvNTe0xnqf2+lsTrp5bjbGkXW7otlwDttR248N6xAHpVwC
	vNrRmRcnKFoHIs0/E3baAQ5YI9/m0woeShlzO0n9DTPXYfOausy4r9gfXBd085Qf8hw==
X-Gm-Gg: AYBFou0R9WRdhxqwpiQ+WFABJdmuj7d6P48uoboMW4SUEv/au71YaQCgJ7rHnza3ZT9
	Grm9uwyokJycc1HTWDsh5iEf+IQMAWWovfz+t0jbNDsE5puZmN+bby1tkOt/6MCtevlAdr5kD4S
	C8iCo3rNdJEn5gYd4mm3DWtALt3ZMjeQ6GDAOH3OAtBVqHAMyTz7D1/9xjZDHcNIf73WvX0QBsL
	14otTJmeSOrWkhX0KGiHPtNJq0Q1l+7AMg0bTVvNT1+uLEQDD2NIVCHHWfUGwhPYur4Urr3wusJ
	gek9+1Ds50hXLQItWMDhqvBRSTKdBp9JRh9CbmYCXSwK2SXBTq3UNsZZxjLtjr0giZ4UibA/eZT
	nmeoCcKmCtGrslUSsMRWqF3J5qp0RhnZtcf3np5oJv/2WVwCSuy7ebqN41voZGvk2hQ==
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922555e9.2.1790945440688;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922205e9.2.1790945440249;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm30310575e9.15.2026.10.02.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:50:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] drm/hyperv: Add missing include statements
In-Reply-To: <20261002124456.741011-2-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-2-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:50:38 +0200
Message-ID: <xlv1jyo06zc1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hyperv-drm gets a number of headers via <drm/drm_simple_kms_helper.h>.
> Include the files directly so that the simple-kms header doesn't have
> to.
>
> v2:
> - remove simple-kms include statements (Javier)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

