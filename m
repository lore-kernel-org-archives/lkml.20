Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046108;
	b=g3+bHVFnmoYVipwl13ZbUcsHRtKMod5qhqnSBG8HhJgtxqO71jl3KofQaPx9SF/1TrfG
	 gGiB/TuxRSWLE6ghnkGDohgINc3nsV8vGDWjiN5A7d9gxNqhJ6k9Pt2yFM05C6tuMnLbD
	 VxNz8Ib8Nrw0UqwuGuskjLHdZcJjbPRCZpxLv2TZliIKS/3a4N175SbB8fMFLG6+NU4t7
	 F2hWS8qQgZ6kwbSUwynqmSl8LSVngOn3xTreWfx5k0+aMRnEO826zcpYoTIiJq3GWfj4F
	 N4U88v+5ZL2uNTEfNecSly1kxeZbNoTmlEc5b0B8RD8sDIJOxQwgphyKtS95dZ7uh8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jExJ96PMaFTbUZdk2gtHqLJIWFN42YYYs3WEkMaD2dc=;
	b=mOmvPGPgwgtlMvKjU0PUcUdC3FUtbqgjaTZWDxdDLfJvEC/D7DsAX17ENrabh2tTX1ut
	 01HTOVHpAChgn+NXcEyt/SHSdKNhiQGuK8TKCTAnMwKzAYCDp2xOCqh1HlrvyXRSfS1cP
	 +ueUEYVf2tdez67xJoSvskXfLQiSopxkSfWaVu8THwGiLyynJJixDo+bGdNTxUyUhSWEg
	 CUqd+RDE7q4kUyWGcxdbiQYtC7pbcfz2K7Twhq1fdNcAM38456YwXdftbYct+SDF48GKP
	 CdhVuN4PPeh1NQ9xSLHjn9Ve432EGFU7Za3AHa6tkDETLUYLhGZimvYuIGKnIhnXYvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN+dPhvd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8E5606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8E5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN+dPhvd
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c00ba845e7so239859e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046106; cv=none;
        d=google.com; s=arc-20260327;
        b=U4f+z5jM66KGQkecUFK1H9Hu6WKlWoepckbRV6Ujx6DXbu6sOIoI2llyM6ftH8qpYQ
         50wWE6pkTa08PZ2U3G3sNa1m7KRtvT1knfVieF8Zu3FAejMV0TR5WMhDOlb+NVnrtnJf
         wkt6jtBDEiGAYT3MN0Sq37d//BSGTVkBcE0NDEG/jztOpWMcx88PlHU8PV+AtaT3Za5r
         ACwJC5luQiipJu8uoWSjpFRVQ/O1nqFvV3xyBD3kG5jCkKJqeWHciW5FjiG/DWmbs8mg
         FjApNp6YMVaLZFbpPSuhV8qcl7JmrEPk0CfR971qpJLYyV2nNpFBlrZdN4HopaP0byYC
         FuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jExJ96PMaFTbUZdk2gtHqLJIWFN42YYYs3WEkMaD2dc=;
        fh=dfgxR97dYuJG9q7Ki8k5M7kPCpc7fZn4Z3/FUhCXix4=;
        b=Zp9dbkmHmW7vXGFyTLuxwxfKMJoam68rsgAKQljMhQSHld7ccEsS4D9dukqRjjR7oL
         /lzTUZX6RAwM7aCx55HKcK8EmPu0rCI3PHc/KMIUJXkuKFLd/xchkTN4T1W+BMdC6nWE
         XtdsS93Xf8iKnlBuKfyqIP+cNQUCCDpEAj6bAj9Q14SIum6oD89ovcWL6U6JVF5ipAnA
         Att8DhNQsMZD7N8gDf6qLY2HDKpk/F7VTHCn9g0swTrez7ePRJSvvVtz/RxtfKqDCYHs
         zxjBCmWHCeX03eY8upEpd8bm87Ts9YKnT2OVK961CPiYbG9i/io5BR+dHtFhzlwZPth7
         +ZqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046106; x=1794650906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jExJ96PMaFTbUZdk2gtHqLJIWFN42YYYs3WEkMaD2dc=;
        b=dN+dPhvdmc3hxOpLSltkJ3I0neMoCY2UTOHFkaQXiEvy3suG9U4AvMj5ZeRmpspmLq
         j7CcLNXppwPPFaCJZVvX29ax2sLdg9WOvZAr9ehhkSEuYq27a4pGgGqJ+qkAm3rwiRKj
         xivYQx5qFIXFlXRXQmzyLSxpQcH1F9aPZrHoFkYmZWihwZW0O0a3NYlowKSTuf/9DT7o
         5S8tAdOrzzgOz9dQsDflbbtxh0S9+OGI/EQ8MBdq8/CoPd5cKYb0Z8pxu7gReEsD6PdE
         11uRjZ5oPaX5ZZGK1BqEFfcCBZa/XgYATFu3IDPNy9PRvzwNBXXsZTaaXhKog0wgwCSy
         VQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046106; x=1794650906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jExJ96PMaFTbUZdk2gtHqLJIWFN42YYYs3WEkMaD2dc=;
        b=kVS3BYMeX5J0SM1eLp+MPjru3VWAE48kSjMs5qyh69j5axoGDY8dxwtAte/AmTOSJ6
         8+Wsql2wiHtWHB7cJFvO+cAN6YEd+Wac07796gupr5Jl649yItxj82/0YmrL5eG1EPph
         aX/TgFVnAy+DCEoADAr2QN8/LLlVZKpgsrTTtOdob42ANFnCnCqOBUmVxGbYw/2DiRAi
         mz9lMXTiG9+N/H/nPb0Cr684vF46ZpFf5Q/pa89Wm9ov70+mrUGmOGjST1yX5d8ETXdn
         cXwqbTlKEOZ5JgzqBaCxbFqbk0cvS95eI24NoT1zIzj95O/IYwKrKq66yhLmxYATTO4m
         if1A==
X-Forwarded-Encrypted: i=1; AL+hErH1bcSO4/WmbpSFV4ZVag22xik95x2UnnPAJ29QWfsS47EqouZ0bfBevNILJbkZm3AYpoAxowe0OCqmA34=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j7E9XJ0IWpZoaMEZ2J8cC/dbcwRtIsSNzcfcTmGZy0/MY8rI/
	IvgdviyRXbV4ZtLUGG+CqZxctVp3GbKnJCgAIWZlpiKYiJ2pZ3HHOtWKWjd9a8q+qjrcICFOuqP
	wOqwARfl2b2WjAjM3/qvMX9XWclZxx7EDqBM1Ka7OkQ==
X-Gm-Gg: AYBFou2lULj+3xyN+w8/H3wsXwphINYsbYE0HOxJ+AZvurcmrxNf932au2MK6K6odqg
	fRoUk8B3GJrkUK5WmW6H/8uW4/XHjfcVL8TLUdDSn0MBO0tXJ2+8WRIU+Cc0U8QR3K7zhMQnwfM
	wtyb+PXGnu3GR9iLfMT8a1Tgqt7JyspIa30WRlz6AfgJwAac4cT1M8i1r87TuwDinZUTEPNQRZl
	f77GwxGDRdjhmlWbQr+S/EonbIbj4Z0JQnzsfXlzlpkhqw3BvL5o9Fnths6GynKI4TpXyL4xJmn
	QftIbqzMI31r+5zjPxHrYAAXGn2FNS8GQdEMKDISvgLOfsrv8tnLoIiTv1pHYVYvvrmsBY/bnoE
	frC3r56YaBSxwXp+COTqnYkwiPOFruXcvP2wegZduS7IMFEDgF1JhWB0Pn1hiBTJes4SSxJ8=
X-Received: by 2002:a05:6512:3409:b0:5bc:d39d:9b38 with SMTP id
 2adb3069b0e04-5c003a9d0d8mr1491121e87.32.1794046105997; Sat, 07 Nov 2026
 02:08:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101153000.20839-1-ravin.chokshi@gmail.com> <DML5U1TLCIEV.1XRE244JV8BBF@nvidia.com>
In-Reply-To: <DML5U1TLCIEV.1XRE244JV8BBF@nvidia.com>
From: Ravin Chokshi <ravin.chokshi@gmail.com>
Date: Sat, 7 Nov 2026 15:38:13 +0530
X-Gm-Features: AclHuK9wPLzSVwo1lCdFSDzmbWfi_aLkHtcPoTRq-44L11cNLY7egC1NBa4mk8k
Message-ID: <CAJxH2C5XUfTJY7RQ4aRAEu77FThiGvatLa6cUSbuwUbGFFfE5w@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem_helper: Fix kernel-doc name of __drm_gem_shmem_free_sgt_locked
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	lyude@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 06:17, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> This is a duplicate of a patch I sent a while back [1].
>
> [1] https://lore.kernel.org/all/20260622-b4-gem_shmem_free_doc-v1-1-85496c597b18@nvidia.com/

Thanks for letting me know, and sorry for the duplicate. I missed your
patch when I searched the archive. I'll drop mine.

Best Regards,
Ravin
