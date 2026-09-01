Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286C37A481
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253950; cv=none; b=mIgA2/6OULpg/CUf7SD2zTlaAsaKtquU0jrM61HP51dE0BY5f1+98ZxUPpE6k5Qm//sj0GeysVJ7xL3UE+wqYl1v599/41ZIt5nXS24m1Hda/qx57LaqJhlHy5YcfMtXUwKjefOZtyw23YmkJuLNrMnPR4xMyeRWNtH45Y0a+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253950; c=relaxed/simple;
	bh=dNZS6phNGqavzHTlc71cndsIhlV3NcT+3GrBiZpj7ok=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XA699jUnr0EpLuFTq2KPYurBygChMo2DQu2NTwpwVpQx3KiuFoJhrFy4xFOQKq1Hf9YrVqRfSER8t3cJ5rLRpsLWniFBrek1jzsHH5eVmKC/YNrpd5mDEuHF/Jec0oMa1+IipN/Hy1yFUm7xam3/mPu/4Gkla84zKRlLtC3Y3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mekN45yG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mekN45yG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so623168f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253947; x=1788858747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TlUfV1W2wVGJiIoux61PNOlqp07vzGJ/19zLvBmSsQ=;
        b=mekN45yG0urlWnrpQoL37TdWh8HLg2ZFUxbleQ42fK098jxYya88pwwqxC9jQGCelh
         KOOMx5lnikp68chXTd2/unAWtHIAROPjLzzTcA0wlLxoHOQPNv5zOJtBmwYaH1NhS53c
         ljamIyq690fEHpR7rXf5URcSGC9n8XkqBEMVD+l+hZ366fUndRZlwCZ/M9oDyh1uLrBn
         ryktXr9uc094BNQYIPWrweJz0OY8NOP1I3uoED4RgQalq1knZpd0RmFBjBuoIjQdlbf5
         jVck49f/B5ZWv3TPFXoG18QYqmbK0EhuXnVSI06hXcIzYwUy7ABqMfgKuAnufBfqDiso
         RsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253947; x=1788858747;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TlUfV1W2wVGJiIoux61PNOlqp07vzGJ/19zLvBmSsQ=;
        b=k1DKATNC+jrj0RfYFZzvuxjxxIZe6dn3M4mO9+8wl3JFndWm3FfWJtddmqM2HADYR3
         er5/U6KwufAdsYqqdu5P94IYG3ACr1GxAh4P3ruajV+FRd3SQcH5b5O8s47vsadgjRHb
         MXYARw22TX1wTa9J4YId9D0gzLny/EoFtu61DmpgwKHfLGuK4plRDZVoeD6Ahy+qjAcw
         LwX8JDNQAkDIJ0FEPAj33oJ+tVqpUgW6TU+bGyT3VGC9LJfqvwdd2ZEWsnqEcehmMX2b
         X1B/jdk4ybSbydpy8FF93+o7dM9XCQq1URxKCUMJegz9rNWwn0fecU5at4il4uHfay67
         nmkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAIsg3ywicS5m7rXrBaUzejuoU+c09SlCjDua2P71LcvoqBXaO22ME3nTTJwS1liow4k9oPOu48BZOLng=@vger.kernel.org
X-Gm-Message-State: AFuF++mm/VXyQlf4gHh9Yw+tOoMKxAQwIaO4d1rL45OKYxubQSD1FfeB
	0slyiTYy38zXW7NuI2E3LJ7BcxnSSrtqC3P2IvVNb9kBF0VyqPnQKY47
X-Gm-Gg: AR+sD11jtEDLwVCD8xfBf6SQMwZKo0q7KNw4SRg9C9r3yATLpyxmDnI44sBr/oHiGZM
	f2MLnfHYqf9ikUuCwazg9VDIwPcLH+rrAZKOYWKiC+GQ24ZWxLzioXfmp+OpTKdzRKmIAyU4RK4
	hUBzVrJ+sN5qSEjZIkzmn/Q8Q30XxKgQWw4Wl34b9x3JfiV3JzVD3WkpxCfS2gaE96yWrLpRpP3
	2lBYmyJ2n4ygei0rZqCCens18gWI0WU80d/t3gD95GPuRfr19qcoqKzH3aZhFJq/dc/wpKmmd/7
	BMdFDkujrU63GzIMZUW0KD1LOl+vkYY43jOR0aOsPC3bfMTVCRoEkN52Zi6ohsqmwkN6NdcoXjf
	0jUKIBcqjDAhpWEOpeVu0XNBlqs3qMvNRWtAZC85YU9lhnUxuuv1iDiZ7j/uQFmW3NjfukWETYW
	LS5zmix9cQADcj6ycDd3pZ7AHXZYBbG2Bi/FZP8ZQ0fMxk3QnJu3CgRQxqNqibzwK66kgtrMxxF
	UqHZesQGXGUnj7K0hyzApZ2s4MH+l+VQ3BE
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr456328445e9.14.1788253946713;
        Tue, 01 Sep 2026 02:12:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm53004175e9.15.2026.09.01.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:12:26 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:12:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: use strscpy() instead of strcpy() in
 virt_vbt_generation()
Message-ID: <20260901101225.3aa0f0cf@pumpkin>
In-Reply-To: <20260901050241.359490-1-hrushirajg23@gmail.com>
References: <20260901050241.359490-1-hrushirajg23@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 10:32:41 +0530
Hrushiraj Gandhi <hrushirajg23@gmail.com> wrote:

> strcpy() has no bound on the destination buffer, so convert this to
> the bounded, always-NUL-terminating strscpy() instead. The literal
> "BIOS_DATA_BLOCK" (15 chars + NUL) fits the 16-byte signature field
> exactly, so this is a no-op change in behaviour.
> 
> No functional change.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index d6e76ba31d60..f2527e26cd1e 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -151,7 +151,8 @@ static void virt_vbt_generation(struct vbt *v)
>  	v->header.vbt_size = sizeof(struct vbt);
>  	v->header.bdb_offset = offsetof(struct vbt, bdb_header);
>  
> -	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
> +	strscpy(v->bdb_header.signature, "BIOS_DATA_BLOCK",
> +		sizeof(v->bdb_header.signature));

Pointless and potentially wrong.
Both normally reduce to the same memcpy() call.
If the fixed string is too long strcpy() generates a compile error
whereas strscpy() will silently truncate.

(The '&' and '[0]' might need removing.)

David

>  	v->bdb_header.version = 186; /* child_dev_size = 33 */
>  	v->bdb_header.header_size = sizeof(v->bdb_header);
>  
> 

