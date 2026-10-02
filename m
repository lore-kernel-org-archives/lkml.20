Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763B363C51
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945515; cv=none; b=Epo3YXYZ6L3tzmShWZBAoobwDR5cb2ol5IGu+LsSwLSsPZwwmuZM9p2S3Mhs4ubfQRVHTmEGC7S1BYsalcdc94DYMxlqEyV+Ssb0mEZz83y1UjCHMJvQKLGr+v/DgusaCCN9qJa11TLIMItAqimuyjdS29VL8Y7jybVYuIR/ar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945515; c=relaxed/simple;
	bh=53D/5/B2wvX6dN+ASmuNpK0/77E27Hvucfz5GPvSt78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hVrsXonxXSh3y9Z2Vl/fLTfsaurjdp4h1rc5MB2pfiDATkOEM4py0RLY+CIfNpkvr9S8XSTk0JslPYOdnWJgU3BkP34bLLUUwP9rPZ+lIrz10jBwcGFlnuL5VCzDFtsSpWUBaGtztw5ju3Odu62a6o3NfcGSbcG6uKsbkTnWH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiAzmk6W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FvIgfvvB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiAzmk6W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FvIgfvvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
	b=NiAzmk6Wx/uo6gP+bGspvIqcW4/tzggjR+c+Waz5L0ptwKMozTZa0We3eTPP+jdF7ADJZI
	MSa25urOY8+w60hYi2tvrk34rr9y2PC2IOUik9pTayLkEMIEFqqbEN6sGgnbC/+WLxTIah
	WOmkqGN2svoP9WKRNrlKsyXPCrdV3UU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-nHC5s7zMMuqxxYiRMYeKuA-1; Fri, 02 Oct 2026 08:51:50 -0400
X-MC-Unique: nHC5s7zMMuqxxYiRMYeKuA-1
X-Mimecast-MFC-AGG-ID: nHC5s7zMMuqxxYiRMYeKuA_1790945509
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-487038bc9b8so5595815f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945509; x=1791550309; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
        b=FvIgfvvBuVEH4fr+bliuLq0Y48vr5txV1T17UVja8VSJ+cqVnB4/TV/AzrhyM5X73b
         rAtmS9/dMb1molQLQex0J+wzOHAPAaiE7sXecz2TcCyH937yfL7U0dHffXFPvF8Gh1pL
         87Z/7tnAjylOuvVsYkq89ICc4i9gzkdbKYWs5AAA95vurR8asCQxkMAZ/oHTTVQMM+sl
         NrmZ8SoL7HKmIgC2u/lyK0G5a/YujrgxzRgizynFYbOIcYgYWWbwMfO73Wj0/Q9bUssA
         z/tTaz0AMexO2V5nMZCArw+FngEEQwKzBIOtqf/6CY5zLmc0eDlWEiKD5k29BoMErxIP
         6wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945509; x=1791550309;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
        b=m67IFU1N5aOvTdZS8mjJXYk4oZc4hjhBSkEtTq9q87sBibB1nPAtYpqkh7ScVkA0ZW
         JYjqym4JtaaNfMndWrEqexjhnv3uU0X+OMMI0eZkKU8Z/ZaM3MuVaUePp+idVGxyrHmz
         XatZ5yAY3rPCacWEXXbicwEHpl+QT6HwDAX7VEwoVyVh/sodLUPsm+V9SEzMlzi3AI28
         ARkNf0Vk51E0I5P1iiCgINQE6pA/AGcgQbnGqG9Zh6PJ1lxBvuXoIAvV42Fewl99D4mG
         FV0hqIQy24HUagFraTTzS2S4vA4zZVruSJImV7Opdk4IIVugX3E9zKtXAI6du2gzsdYb
         Jd4g==
X-Forwarded-Encrypted: i=1; AKwUvBwQ1g7JYv9ZSX3DSBvre52warRKG56H5jB5wOvrf3MFkag/oLBKRmUTNmE5uQUwCrsFMbe+ByBx0e2W34o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKupG4HGv2h5AAKpCqhn6CsZPizLFJUkhiSogy13v3bNusFB9Nj
	z3p236CGUj6a7M+awOvAGdIUfri8Q7fuMznyTq3tyjgNu9pge5vb0xLMVvVfMtts5tPLl7YgA1c
	plUhQ0s12BRuxTB4QrQaiSnMfBhtZQwfzqrwwTqjmXI75AVmynMssZtlBagPvEjNFwA==
X-Gm-Gg: AYBFou2TR/liIxoT2peWGuaEINoVTUPQoQ2vleooE7PSRydHBHrowCV6dcCCZEHnCKe
	D6lKqDOK2h6Jmo4NqxWLJBQfqc6Yx4GYrhw117yeGRWW2/D3oT1tmtCrt9q5wtGZLJScyZo9hLY
	uExybiMyJC6AqnoRY+3N6fzZDWgSEJbFERIxqeamPBuxRUlyItOwmf55LjyxiJFXogpGThcTQM8
	mI8JP4nmmBX2UsY7tb1e6rFU35EFpQfzIuUtjUeSC45+vdGHo0GQTe0qFl8PkI5Ls65sl93ju+G
	YCNf65EkCBe4uBXYviTgouZy7TBmO5R2TtSmJDekcjRStDOp9KoaxQU2uxCd7BWXCiFNqqeBx4T
	a63MupMiuCZxXPpn3CDAcKyD2stfl6NzUd8U+HCBKfbz9Rd3qJFH/N6Qf+t2a97dvRg==
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263171f8f.17.1790945508869;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263100f8f.17.1790945508338;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm5711527f8f.37.2026.10.02.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 6/7] drm/verisilicon: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-7-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-7-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:45 +0200
Message-ID: <xlv18q4g6za6.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The verisilicon driver does not require anything from the simple-kms
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

