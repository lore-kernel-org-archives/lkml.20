Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293713C8731
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945539; cv=none; b=rwLLml29AUSAkz3It4XpkmMdvX2HdcPl8u7L/WqcnX1i5/5j4cO8jpczbn4lhq3MNg882PBgvXHXJpwwO/w7TTvt0CMBl5VOsMncUFjggcJfUWRMqqi/dG2NDst5B9CfrmTSkosUkq5brfBJxGl7/jbkJTRS0XVtX9KqfIaEda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945539; c=relaxed/simple;
	bh=f6JvRf5cXMcwuYhI5B1gEJ3HcRG24XuF8kIGhCAv6MA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aOq/NusNnyweZAjlHoXyJ+6aEgE9gzf6a6k5vDcQLmaZFW8PhX6KS5HJM8ZPK+5fJhODYc6I+6amhwrm3PNP+hbf7+r7v8y9fea++gh34L1iwqCQWaKhbu0xZIT8cRe27kP2WyH/y7Y6/1DPf68SXcMg/UhwZeKbKoZjZvD6MWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0fzFgLo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5j12ljp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0fzFgLo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5j12ljp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
	b=a0fzFgLo1Znmomj5C37P84t9RmLkAKa6KC7Yew4YFvPbq2zU+MlDGGcDLtlviEf3KZ+L4U
	EZuaxg5v/tBsE8wj10I4S/VpqybCU7BPxDl/EKBdYdU1vf+VKlbF1rmhjTCmKSWcc8dOpz
	efb7u6qiO8N4qgTXQOkzRmRQJkZNZO8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-5Zu-NR4CPwaGtJGcvf3tuQ-1; Fri, 02 Oct 2026 08:52:15 -0400
X-MC-Unique: 5Zu-NR4CPwaGtJGcvf3tuQ-1
X-Mimecast-MFC-AGG-ID: 5Zu-NR4CPwaGtJGcvf3tuQ_1790945535
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0101292baso36816605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945534; x=1791550334; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
        b=e5j12ljpgLBlTsWL8O42KOp2GuPRy4s7QqONU/B1mTGQ1yAlRAJiaZWd1dOPBk4H8a
         /TKFVYdqpjTzPVzMDdOwul7J8JA1kVBmcwqmwDUObBtvvnbsHVmvQ6DMh/twCN61ZHuZ
         s6kprIuybBT7RAb2Pw89xC7OXhioHUlF02Ui+DolOzvj+GgCJ+tcS+3pKeXvj5bNHMm6
         DXsqKJP4cyWgD2QtJwnNddjYTq0WWcD7h1ZvoIkC3PIyXJtB1yad7JVlXw3Pz/ueCNRT
         9e+19nfPLJt7wY4TOlZkGp3fx5j9zh5iwYFr4TfsGfTRNvcyoUDhILNVVMHTGgrIP1S7
         T5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945534; x=1791550334;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
        b=2Q9HY2D4YwR4KCrdGt4iZ3rkoSsHMSm+ZehXUjOvfSxZbji1LXelFgwzAtbZVREBy1
         HCz2LjjHYn7EJ83FsWWXRb+f+Dp6D7ZXOl0vnRutG7g4LpoUrsR6FInwXc1j9wqohxFN
         8lEDGbgMYZ6ln7aaWQgzAoro4tSB2tSjmn4oZ7DBEeXhEawTv30g7o4RifgeL0rs43vL
         rvwFRdmx58CZTL0PsLtoIppKnHt4kEtie3nMgbtyRyeZsJCdz7dzCgJI/KxOKTSbo4rX
         N185Flg4aHDxl6R0uLZZ8jAFlTrMTSsKBGe7Fy/87w4dfl6uIRYvyi1HMySqIZ8t37QI
         qslA==
X-Forwarded-Encrypted: i=1; AKwUvBzITA1ev3N9Wlqh0942T/axdFPrrU3XtTK8HQjdr7+VC9NiYyEmyIfBnGmB2oBklWSpXjLSq7FOTRHazeo=@vger.kernel.org
X-Gm-Message-State: AFuF++lGEhBbD5tNvCoPmWYyXATrtuobaZ48fXGyHF57dHTPjFUlo/Ed
	7N8UzFAjHNUzmtlLTfLH9nM3f/e9ok1LQBEJk86qHLt3TH/uuSJ2+20M2Yf2OTG8yzjjgWtlGbQ
	b5f6yY8On2JceMhBGCVJ1X4v0JcORu5pcMC182Yh+lvAo81NgJkfV3hXSiVQoIDwMXQ==
X-Gm-Gg: AYBFou2DM2b542tFe0s3HGblptiYRYH72nJSOJrgdPkRN8wjaJL+UhKG3UhIwEOXMFy
	D/WvM4QlqCLNzZ5dFyk+tt8h1jUnV5rSitf2HvPbBT1kZ+to74PxoQPvJN9dWaEHrFFxqQeRwsW
	hvmhzW7DU0OBrGBkSU68RKX7eQs5210BwqwW7EkWjsiKshqD2dstZFZPi+287MMgdSiasedrwPR
	SW5RClLx7ONs7UZ4cmSjYOwFzdR/LGGnESLdHC0C2XTYdPP5Yi0miSoaqrga6mJSbgBt54JwKz9
	dBXk2g2mvsp7+e1LPdTwrDYEzoVm575N5wUxCohrOFeAeTvnt9oVaT6iPuaEldQGIOkZOJn82lY
	VBmlRpOL2Q/lULH1jIGNUcaIhY7z2E93GU4kIZNBRWuOiDJDqonkjWA26GrYp7WJdLg==
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591545e9.10.1790945534478;
        Fri, 02 Oct 2026 05:52:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591275e9.10.1790945533987;
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38105239sm7570526f8f.33.2026.10.02.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] drm/vc4: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-8-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-8-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:52:09 +0200
Message-ID: <xlv15wzk6z9i.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The vc4 driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

