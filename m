Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926353CEB84
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691909; cv=none; b=Q7i40DMu8fvki5o8G3VNihkBdA0emzF2QTQfJbnzrsRqBZe4h42QC0UKyKEn3gfssQlvgcf5b6N9oqQ4+MPK9lYHZmPcDHUGO2OHC/iQy8X2zGjpI75wB23dIX3nSx98C3CafaBwZTThI+pCwRQR1NuxAIXlW7u2zhNDmwbeZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691909; c=relaxed/simple;
	bh=OlffDZMRMS2ndv8YS8rwFWjtduTwlkZNDnY++bHpfOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OViAL0o4JPaUbWPdSPkn+oewgFYjIva6rWvAPZeBr9N5b8QC+xMLV+fqn8k7/E9lHInfaKhUCj7fExqPTFRT5k0JhHnUfXjL8G+ZyJD7f1VVO/jp0jGwlcCF6GGBiolVwBTyHOGJqKZvVyMCoe24wEt8grhTTw3cch9B13juQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdUlK/hG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nb0fyeeR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdUlK/hG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nb0fyeeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790691907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pu7oPNmHjtmqs+iRKMrkvvCNESbJDKqdyDR6B0f2918=;
	b=BdUlK/hG9qLoVp6afBvCGcMbaYPRsOI8H5vNXDGyaWovunGOxl7wHXzEaxxYudg8EkCtc5
	qXnjIQNCXbw8tYYI0t3RwOylL6jbgpMP2ljAFggUVGx4FUD0PXjP5f+jCGMpjomsgJgofd
	hfCph+AqaHlbq9j4n3Z59aeWxPl9avI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-WK6g823LOZmz2a8GeDgP2w-1; Tue, 29 Sep 2026 10:25:06 -0400
X-MC-Unique: WK6g823LOZmz2a8GeDgP2w-1
X-Mimecast-MFC-AGG-ID: WK6g823LOZmz2a8GeDgP2w_1790691905
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0023f2b60so13606325e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790691904; x=1791296704; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pu7oPNmHjtmqs+iRKMrkvvCNESbJDKqdyDR6B0f2918=;
        b=Nb0fyeeR65YAt5zneSLl5DnM9GiSZq+peFhFgbJZtT5CRtv4MGDyGVYIBDLFyL7J/z
         flZsvjPjYGMf+evB8Ziszf+msYz8sdn9EYYc6XHGYsjHz0njYw0/9izq4t2DaNPE89s5
         Wd+913LyMjJLBfgf4ZbPXaAcgPLlj3QDUkTsqT9LFLcCqPByBl7ZlezLtpO91oWsw5Py
         cHu+q9MT6itSS5ThlW/YvK6dkEjCIxgYqnMlceV3zMWUcY2OWd9SvvaOOnEyHOqNzi38
         OUpJDRfBlxch3eXJVNEX/FWozYP0k3FQlxXWx5KxizmQWE4mhmyv9pgLI38PjYIJ2SgT
         aZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691904; x=1791296704;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pu7oPNmHjtmqs+iRKMrkvvCNESbJDKqdyDR6B0f2918=;
        b=e3tCAf4uCd5DcTvai7RYTSR0iaf8sumU+CitRkQTY0ziKjYKBRo/P96AQgyPTtr97z
         32caClMu7aXjA0aZprcpDvRMqFIiAjnCbH3/13L+E7rmbysTOb19GmXcOvqHZY3Seo3k
         fLC8W6dgX5Pfnk8GIiyghttU4qRJZCbkUavkoWjyI4LbmG47GPnPK3WJIpGSWoMMFXKf
         bJ8g3aTRgISzc85R6C/AIGnV8fucM0krSRkExvKCoWGxrXBCOTjmqSsbIHJdDVRZoetc
         8YGt0hdY52rei6g5PUd128Py9UtvALNygkZ7k9MpqTNl8+BC63zfAOlxfN/JZuhJY15v
         B4MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvGRIpegnVop7wj01hzeP3YSgZeB7pzYCeu+RA5CuEbRvQJLdL5KXHHWwwZKrvf4UfnRHp4+Qvjz8FQOA=@vger.kernel.org
X-Gm-Message-State: AFuF++lnDd0KpleGl8EwfiyLohttV4QgZvBamLEfz5hcr4CoJkjCOkzY
	4LKA5ub39OSLYTTAgYdrjc4zlbGrQkPpvRxhAg/zhVLLDFVgiPBQDYdETZilahAkjf6LEnRIX+4
	sCPd+y77Wlw/mbNKIbHd/wUhq7ySPpRIE7w58Ls581KXYabRi50EX4DyypgJ0OrPkHA==
X-Gm-Gg: AYBFou2N6wWwhBf4QNMKoi7vwgqKtR2b5Ju1K1Zme8W7o7OH5/KfOD3IbFW+BRvbNnm
	m/EpOWHCabYL6NzQg4mQ7pd3AZDlKgPtwDGSgPZ2I85Zr/u5lU1WS7gaeZf2z0l8OsL1QAyUHm6
	WK8pN7QZZ98wqo2Q2z4eCZ0/kbapMFSkQLrPdgXpmw7RCVuEy+HZxxe0+/kMsIJj15mWHImLYth
	2kad6o1R3WJgLc7Dkt4epQRV+w98NGfkyCwXB5F4JyvwWhuTm7yqDJ8t+okQJKMA+64Fv9wi6O5
	L5bSGAhE776vEkEBp1Xp+t9Ylu37/FyPXZKtogjZTyneyya+FL4nEsMqVa0Bv2VCOCydQXe4ywj
	FSjFQQM/43pP8kjcq2mewQhNumEOUH2aO6nAvLH6Uqnomf7MIDL6YIMbN0z4D4E1ckA==
X-Received: by 2002:a05:600c:8719:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fe66c6373mr304983465e9.10.1790691904556;
        Tue, 29 Sep 2026 07:25:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8719:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fe66c6373mr304982775e9.10.1790691904159;
        Tue, 29 Sep 2026 07:25:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00ebcd353sm101132985e9.3.2026.09.29.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:25:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Piparo <holofermes@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Amit Barzilai
 <amit.barzilai22@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fabio Piparo <holofermes@gmail.com>
Subject: Re: [PATCH v2] drm/ssd130x: Set the address window in
 ssd132x_clear_screen()
In-Reply-To: <20260922225445.1525837-1-holofermes@gmail.com>
References: <20260922225445.1525837-1-holofermes@gmail.com>
Date: Tue, 29 Sep 2026 16:25:02 +0200
Message-ID: <xlv1se2sdtj5.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Fabio Piparo <holofermes@gmail.com> writes:

Hello Fabio,

> ssd132x_clear_screen() writes a full screen of data without setting
> the column and row ranges first, unlike ssd130x_clear_screen(). The
> clear is not reachable today: the plane disable returns before it,
> and the encoder is powered down by then.
>
> Factor the range commands into ssd132x_set_col_range() and
> ssd132x_set_row_range() and use them from ssd132x_update_rect() and
> ssd132x_clear_screen().
>
> Assisted-by: LLM
> Signed-off-by: Fabio Piparo <holofermes@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I'll push to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

