Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29B3033E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945482; cv=none; b=uH1icNk6Y9lM5GC8mOLE8B2lfSo+c6Zk8us/GqQwCPRPI/YkIQwisKn+g0laDfz3c0Hi6VjrEOa4zZcId8uwPesE7K/O9wR89q0Z6RhlFCpiTnZ3OwBIEkNuXa59e7rOqpohzABySe04Uy30wWih/83UGnjXavh8kfuzzRh8tY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945482; c=relaxed/simple;
	bh=Eea0KEkQbSlRaY4fITFghJeqNRMhlnUIBzIPKXj0Z20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AkIP44ZPoDDfNGTEWVe89yc25/S+T9nvb/4GJzuo+XORM5OrmgPnId0Ayq1siJA9gozW3hHhWq1ax/fpr0AHIcdFa6hn9tiWPQjYhq1dmP75q3C3bLnCKVZ3uTr9AA/GvK0vtD5tEWeg76hywB53FQ1P8SkAmRNliULi37iYm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atIgTIth; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jy0VyC21; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atIgTIth";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jy0VyC21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
	b=atIgTIthjjOpKzHImRlDobJ+m2Iyw8z1/NmGSnbF67y+owkubwGOd3415wUIUamObxr+3A
	jeeDe69AGUSQ4ZePWxkBFThVBjyCq2Kfy4Ah1dUEl4v0Uvc0Xzo7q+9RDhus9xbBiW4RZ5
	uwqvSkZyLrX1G9GAusMUaaaI6KV1cSc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-UX7Yu4SFPmifKoes33UcLQ-1; Fri, 02 Oct 2026 08:51:17 -0400
X-MC-Unique: UX7Yu4SFPmifKoes33UcLQ-1
X-Mimecast-MFC-AGG-ID: UX7Yu4SFPmifKoes33UcLQ_1790945476
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so13376415e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945476; x=1791550276; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
        b=Jy0VyC21FB7hPBPsbpYcTKSKdx6JK3KajQs57X0i4g6XhYCbeiDpVa7IxvwLtS2NyC
         wtA8f9F1mPnv0rm5qREaTczOo5XiQf6vtB2kSAjdOca6VkkIdQ3uafv+CiviS7a624Ym
         TOgROcPjkqPDajlgq1n0PUhAkIbfM+bWznntorKiVfl0Ombfw2NpK98SHko6YX7RjsDp
         d4mtsYmfVWkhgq8XOtJ9nsJ5OwCDO0SQ2KeFhbSw2AHZBqNJ1eVwpxkAHkCw8BBS8Ndq
         5phZSektZo+dy7jpaI6hbv4WvMZMOi5BCKGSmbXnGdti2PMKM40Esvq1N+LUCo+pCn6t
         1Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945476; x=1791550276;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
        b=utG7HUQvRW1xr6o3prP789oazyc9H/b38eIxG76WixV/3Tx9vKMB6RJU00QeNCA9LC
         fJih9wjTJQJn7i9JQ2I7MgfKShftef1hRWFNeH3iojUH2qMWhThC0SDvcdqjqlMOv8B8
         +BRv1F4HhQFNVYE7O7BXd2h4jG0wZME3pBpq6nD+jV055xvPQpM7OUNY/obTm+4LZjQc
         dVRcdamAxNlxCOB/BR/8qHLhhntPVDeVgvY0uf2jq7q8iv1BX2TQczficbw95052blH9
         aa0zURrQcI2dbM9XeTDsD4M8VSTcsbaLeR6upR6pTshC+Qi1Ft7++877yPYcZOf5vubM
         zC+g==
X-Forwarded-Encrypted: i=1; AKwUvBxtODcLO4WTnjU0m3VW9WYfv44hQT3+4/33O6RHY1zNw2kaz8ZbLtYK1an/iH5pEnKvHOwdKzDggYuEFDw=@vger.kernel.org
X-Gm-Message-State: AFuF++nmCiYIoTx4EMgDZw9pjOzg3YykjD7hXKT7NbdQbivhyvTlLT21
	CDxPJsNR12d7D3Kz6IRkg8/WM0g+lc1g+SU2DCO4U00xmtY1M8nwBgfI86Phm/sXd3BUPZ+I7Aw
	jMAgnrXeKLPovdn5MFug2lZ+oLM71mHkIkLokVI1rwgTp8Ydezk8NRTvJ26ZzmYDFPw==
X-Gm-Gg: AYBFou0p8t4ac7eqjDegRIdZsgBBgyOfcjZurQRVw0MdfL10GMW5/dYXzezrpxZUXqb
	qLLuNXNqL28gVnc53+jFT5IBjr5uGJ7DqdXF3GW3CVi5zGeLdImOgaEmBLpC2teUdNgOW5Tnds9
	UN+HuNC3jyrAHb6ax8ZN8Zp1DCsJJsTGe/NOYtiV/TGmMiWqBP+P1zsTn9s66bQtOerIg9FpVaQ
	5QKQhvgfZ0uLN4KZ81Fuq8zAUuidpWL7RSXO/MeHO6oTM3KrVUe/74fNqlW7xmAJPxssYqRg6iF
	vJv7FEgET9vXbjghIPs3Uzr4moNcVMZ9eVMNtsDBMY6wV7LbWZCwievpp5DEyBPokU99PCD5bcK
	Hx3jljyQkXwIVjSuQi6aga6AKzzeizrUskTcXLqMbOXkUNycXKYULdgiw6I68Q1jvyg==
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216615e9.1.1790945476440;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216415e9.1.1790945476056;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm88527965e9.6.2026.10.02.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/7] drm/hisilicon/hibmc: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-5-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-5-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:14 +0200
Message-ID: <xlv1ece86zb1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The hibmc driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

