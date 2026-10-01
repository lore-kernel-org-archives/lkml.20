Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678E93EB107
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863382; cv=pass; b=RbT8wWJRDvhXHOADxXS0z7wQhQsVTqZnBQlpFShIZMcrPlWMdsoLWcbyCV7ikwsOw7OatDOTYynl03ocg7p7TLOcWQUWvf7ifspYKqU/s+EwSQsn9KdekhSGfNEe8tSuLTWqnfMR1XjtiUwGdE2LW1gpR9+o/jR+XosmkE4LmmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863382; c=relaxed/simple;
	bh=d6FEHjro//70G/l/gSUyI1rn/GjbHT4yliKB3BRSvoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF6vV9Ip8UzVLW66xyy59jVCdPr9AQ7NBTfQpU/nDMQT8s8whqSQ+64pt0rCJyYCd1W+01VQziRFS4fPjfWPg+tDvORqqny5Xz2Z/Lj0L1yjDfB9d0z3K3UxK8eW2F8b22wRQQB8q7vV9JRqc7oXXkemZuPohZzVN4QEc8AlFxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzTgf67u; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzTgf67u"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so397836666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863377; cv=none;
        d=google.com; s=arc-20260327;
        b=HJQJw8deapwS4peK+FR+poytie1fklUTmRRi5WMeD26X//sgZ9NHL4KZWtYcmalYde
         HaSZvygjzUQJxA1RwI77jJpgYmPgjbsMJ2zBpULdXLdpDNsAkY7iBB4YTHSTSHJGpqDh
         N9EO2uUm1sq/x/sMRHZET2JL5Y2wpY5Mf30TBVHgn2UwL3DFF5MmeN4XeevSJzkJrhgv
         JdcVbHtON2+zdCFGgHL/F9Km+pa6spxQbm0e2poF1pgR8dF/CcOSDH7WZEfXTJV4rsx2
         mOlZkkc4gZfgiXPhWIbam8dg9N1a7DPeXl+cp7DcXKf5PtCk0HIIOtWifiFw1vQLly3a
         N2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        fh=lovdnG5e5J4eojBFlvR6hm/Ax3A9xjoxxl9biGt4myU=;
        b=lPbW9oIGEXCySy0ImfZ2hm8Bt8R2BXgUn9vNkWJaGmh3sCXSp1rg19BWk04xQRRD8/
         XxkV43tcnwj8x9XJsmevsdgZhYIL78jMdN4jJJohp/4bxgV7CazmIhh3mSh5ctL+N+Gi
         gq7mjojcPKwpz/yYucB4ibU/pReCt5jjKLjbilmr88cNLftjN7ARLNvqiGPtQ0QgwDwr
         tVPYgPOTbjPXwAsq/aPvOtCvt1+mbqmPJWLIm8DnEL5888BI5dQ91HA4EUWX6UfinVAl
         hVKWWUY5qpUs6jiwrMvseszcp7cm2Oiuomr7dVCE6ZnuU2tod1cJY6l06poEchGOhTFs
         vrig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863377; x=1791468177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=gzTgf67uUXHp7cQaKpcKZrOXOVOjCsA26wj6VM0QhdIYK2kg+pCabc9M6hgUqcz7hI
         M7BD5A27ynEu7jcN6wqK7jd9lEuUXDRBZE6TTNT8OlabQ6ht/xvz7+AvfmfkRdG/ioK0
         LgSr+BTY/5/A6ZekfTFBztWjCGz5DcmUksKpTzHE39OZjzwXbPkMcQDzf7/q/oOAiTAJ
         92WeOqByXw1eLscnUf76ioGuRH0S/isKr6MfSPo+71sa4zT9clyoKWS85xlqeJr3tlUe
         9ubpgCaCqn4O6zTvEDh1ZcwOpUidWXecwXPsxTiSSMvzAKDCQv/E0ZQUVNZLLSF2o5ah
         KLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863377; x=1791468177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=dyUrjPqikOMWMnMaP24WXVRb35XJEuLxqd+fWoESWM4ZaMLk/xqnBhiNO2ahHskvJb
         Jc/xsAjBNWRgQcxAEJTasVlnynPhFh6G0s5JRX8uClJjTCyShtWXC2DuFOYLlnLkjfN1
         NqaqLRsGFaMB+lZwFhLH5wa2bHA6wNC6jVRYQM4C+bd0XSFUqaHi9+HmUvRGDaggw4rf
         8vTXAPDb/cRejtVzKitolbuzyRG7etbLpeWnrSDqs/KNfwsr45jQ/dmrGOHW7aWbwkRA
         oUZZgvyugY9IGyVw8radOhOhA3v/RQEoTc7V6mhuKPymn5H7i8KRmVjSrOsPsxhDoC+D
         mMGg==
X-Forwarded-Encrypted: i=1; AKwUvBzzr2+Q1LTCSENjFYVmFoeJSjC5632QmJI3HNzaLn29+nmkdYkH1xMTgvqhK3qim3hPWxofmadpOVvIheM=@vger.kernel.org
X-Gm-Message-State: AFuF++nVBxY92nsSF4gqPfebq+n5LIo2lRMJzPOhpJw1hff5hW4MgSXj
	rXS3l99dc5QqvmvagAeT6uyGbRQMCI6346BaM+rKdSb41oBDpQbeLpsM1YuGacc4fdpazcxJKiu
	osKFsytkaDNu2Q2Ibj+YhDVsPvemEBmxzR+0TD0I=
X-Gm-Gg: AYBFou0SkCo6rH1y8g3soStN9WXYomJyxZpq04XDqgyg0IV4s7POkgBjUpgKmR2MxIw
	6JvRXPfQO7SWnCpO5TgM7i2lc3CqT5gU7oNjSMUrtrifR22i4LpAi8NpRIxNTWX7loxyvA+w9em
	IPMbZwa9wJhzG5+F29X3n+uYwHOejb1gTLe+KfORiI/9O5+7dSRRwkrrMgjYcmpSbNPS/gcWiKr
	pJe9BujHpwbkRrI4hOpIofj+WBnGyM9Sg36sN8puVNwgl32ckHgdUUKbjVNPCEsV02a8MLHQh7K
	Ub7zYUR8POVtg9ri8wdYsF7uOZwIDe15IiBHPGCLZqCHW5q+/1/1wdJ/9K5g8+kAFviNscQGd8T
	OWe9K1elO2otASDLUNVgZqzqBVywN1x4zzjI0BbmmLBe0VqtGUcCqp+8HH1tqMrddqnjMVRYBeN
	qYxsWAkYT5Doh6/UWY6W4urQPTZlFD1F9ilMBDwnOr
X-Received: by 2002:a17:907:9625:b0:c2e:2275:1168 with SMTP id
 a640c23a62f3a-c2e33fa28d3mr242508666b.19.1790863377337; Thu, 01 Oct 2026
 07:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de> <20261001133736.802604-3-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:02:20 +0300
X-Gm-Features: AclHuK-Ck5Qo38vd623LvGwdR2qBOOVXPJ98wewQWMKyHiuuGCBfZRXpFz9rHO4
Message-ID: <CAHp75Ve1-LhMaLczyOyLYhXaHzhRVOTsG4Wi6c-KPT1VQJ-nKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct drm_simple_display_pipe
 and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:38=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.

...

> +++ b/drivers/staging/fbtft/TODO
> @@ -1,3 +1,3 @@
> -* convert all these over to drm_simple_display_pipe and submit for inclu=
sion
> -  into the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any =
new
> -  drivers anymore.
> +* convert all these over to DRM and submit thme for inclusion into

them

(spell checking?)

> +  the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any
> +  new drivers anymore.

--=20
With Best Regards,
Andy Shevchenko
