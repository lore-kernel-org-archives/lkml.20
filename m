Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63947045E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863017; cv=pass; b=dsQzOyAckr2Lr73HHJ1fk9DncVN2y3r3/ToRe8zH4jyGjHQoW+FfM3j8P7OtyoDzV1ABTLiuCd7cBwdQhQKjOUiouS36BoHtg4F4EPJlPhJSHQQWI7d+thWCNxbsMdo7dNDfkPw28fKODp07KKP0qQLbLuDwFyaivuY/F7Cb7iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863017; c=relaxed/simple;
	bh=MbMgHBJFJm36HYiK0t4H+NweIDkiN83bQwLT2J0xZeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzRGejIRqrwl0sAhEVlf+6VLR1AqCgTTw/oykI8jiDmHj6dYvwOMcuQOqkMMIwRBzfmXWqrqldeqvTPfjonOM4H9Bku/kXhmOl1TJ5kG+gN/bIfqADg1MGt2HC2bAEpDQ17uy/FQen5X8KMTuShuGILBtOLm0JhiTHnIH/zWkzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0oZisPj; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0oZisPj"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6790844c9b0so1757411d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791863015; cv=none;
        d=google.com; s=arc-20260327;
        b=gnnrp9u8jHAsMtkh1GTFODdHUT0OMy81LUVpwPM0eWGidwX6yB9Zd2SRSak4FqRf77
         BXAoOFXagTAG2OVsldTPHwIgb4qUVeQyaUxN/3xy/4D0k15ML50PdOvuSVk0UIfnH/Mi
         QjdG+Bt6d6/7DpQVCbVxioMbYITZ1a9pNwROIeuEyxmjqZrZbsDeggBBeIChk4EiojNq
         uPwj7A5uQRnHHPglL4RR3JCamEype12uO9jGH6nsFCQIZwRL1VRHEtD7DzJPLFA4bpnA
         IXxfPnthgzdNnGASpXR5SPAh0V9nhGlRwsMH16nrcfNhjzxHmKXcTENwOwhaFb0Tr+9a
         tk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g1Xe8/t57+Y9BLtJJ1DCvjjCumMN4aWsrAavgy8Razw=;
        fh=JJu1pHVe0QAXu4saeJbXdWl+6Da1hhJCwICEsgozrEI=;
        b=O6ql4y+uOFP3Xc+476oQTLWff1eTAbeGLMiCTJd8GPPlI+d+sksCGhBHlws8YqFXZ+
         Iuw8kP0A5z8XQ182ofaoUZfnqqUgJbI1QDhcYgWcYIp/g9KJNmhMNKZruITocgICcf2r
         S9hlVCtKCIZJhFlJ8+sZ9i0iW4RGW6LDN4Ll4KGD3TzZnYC+JUqh8tKC7LtaIK+hZEwn
         bFjNhiNBfsjx6a3AWSTJ7twn2WZTOvZVfJBIE9ulkYVcuHYDYM0zfRiJRL/WG0l0v1Ma
         uuS8IebC7BIvZmZXx8D2scm7POVOlAgA6nAm4Bj4uk8ti8EPmMGxAjwFzZXwYHQ0lmMs
         H/kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791863015; x=1792467815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Xe8/t57+Y9BLtJJ1DCvjjCumMN4aWsrAavgy8Razw=;
        b=S0oZisPji0I6Jptei97TSSfraRyUPiWhH/2M59f8/P30bUtl14Csg9c7uKlzO3p97B
         BTUWo7TwvAIa6R2pVaMLo1HxAcVzRwffMd98slLS9Zmc4kWhbgx4vz5kjDlTpj/g4azc
         D+Emqny8AfJ8nzEP4fmhrrKP519AkatfNbh81/QnfxPkp7iMf1OqEKfpkxdnlo4LObSR
         zNq5P3LkmGFXfZHJLTgoGaijKJhPxj8Kvs82CODbCpQR3noun1qh6l8T8QyNofQ15CqF
         nOBLTDQg5bW1ywc4SQeN0Oke6AnlxW21tbArXtkXbYLNK4FMJdRotcE5MPaMzRLrslyN
         +lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863015; x=1792467815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g1Xe8/t57+Y9BLtJJ1DCvjjCumMN4aWsrAavgy8Razw=;
        b=b7Vgk2Ke0gwITv/cpp0xvnbt14shE7D8nEC+6n9YLeeCQmv24Odt+qy2exN7iZal3l
         idpkttxGt4A1bGtoqanuEz3gVMgQAw9oqyde2JHTGxO31X0CRV1oIsfWx1Z4+HgC37rx
         tiuT9NdsNvFnez+W1pVAc/NJExAxv/8v3HSmSHM++qIR2kLarc+erJWxCG6XEJmEEPtd
         IMOgxJJ/vDa6N6+xNWGCPiFID9mebAV1/tssrRcVzFLLGSLSYKL0mzysCAVuz5gIGoJ3
         mGQ1L6nsdm94xBMfb7LEBpW3OwGOCBiUIcamIuWBLmQz2B5TUKlRt9R257/NL6YVX3AE
         fOlA==
X-Forwarded-Encrypted: i=1; AKwUvBzqWUoFQTdNgU/732G2OyemA1ckE1gDfX7qbmOyD+44oVgTrUmdnlAz4PovD5aMhrVUq6N0Qu2zPliEpzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJgE408CMZ31nIh2jmdOl2mKANIwvJ38GH+dF75Z9uS54JDuSe
	hl0H8KdKMI+HTaY6Ornkku6naCZQooapi2vrF3PZgaU5W66g9JBB4o8ls7T8vgit8jV/uZ53J7C
	O0lC6YWTgwzHy+GQD5fT0EIgu/a5+SMc=
X-Gm-Gg: AYBFou1W39xAX+UgYC46ubpuJCVhL2kicztLjfMqIc4rLTYhDgI8peuhP2/VQR9tffT
	yEzS2Ln4WduloY23RWGwwDazWNAfpNeuUiwEZDi0+sgyQOl1z7VEn6VaipsOKkn4mn3Xg5lud3I
	SfVTlFz/O0/ovaFwN79AwvLEyvJGl216nZVdXQXW2AQZxmRRR5+wDTYeiYZw5HACOXU3D+awWig
	Z5nZJ+CpuS2wqgLMOa/o4p7dmLaoQqf48ikOhj1m/2ACUpMImyEW9rL0XuMt3xeeuT8gBQUcpgb
	pWo4eQP8hvb5YdB74v9UWZJUbQy5SqJlBhe3yCzB+cXkMqQ9z0HQoi2hJw==
X-Received: by 2002:a05:690e:4102:b0:677:c605:b736 with SMTP id
 956f58d0204a3-679369ec2dfmr4046021d50.43.1791863014837; Mon, 12 Oct 2026
 20:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
 <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-1-674b907d0652@gmail.com>
In-Reply-To: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-1-674b907d0652@gmail.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 13 Oct 2026 12:43:22 +0900
X-Gm-Features: AclHuK9taASNrgAMmV3Z1NS8TfpfNKzvhhsyrCVDqQveBDVwje9B5oj9wzDDHuo
Message-ID: <CAKbEznugM-HxPxHwZ7RxC2iLC0TDH0qi9649hWATiPYXF+urfw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/imagination: don't gate the runtime PM
 callbacks on drm_dev_enter()
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ryan,

>  int
> @@ -398,33 +397,24 @@ pvr_power_device_resume(struct device *dev)
>         struct platform_device *plat_dev = to_platform_device(dev);
>         struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
>         struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> -       int idx;
>         int err;
>
> -       if (!drm_dev_enter(drm_dev, &idx))
> -               return -EIO;
> +       if (pvr_dev->lost)
> +               return 0;
>

'lost' looks protected by reset_sem, but it's read here without the
lock. Shouldn't this at least be READ_ONCE()?

>         err = pvr_dev->device_data->pwr_ops->power_on(pvr_dev);
>         if (err)
> -               goto err_drm_dev_exit;
> +               return err;
>
>         if (READ_ONCE(pvr_dev->fw_dev.initialised)) {
>                 err = pvr_power_fw_enable(pvr_dev, true);
> -               if (err)
> -                       goto err_power_off;
> +               if (err) {
> +                       pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
> +                       return err;
> +               }
>         }
>
> -       drm_dev_exit(idx);
> -
>         return 0;
> -
> -err_power_off:
> -       pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
> -
> -err_drm_dev_exit:
> -       drm_dev_exit(idx);
> -
> -       return err;
>  }
>
>  int
>
> --
> 2.55.0
>

-- 
Thanks,
Gyeyoung
