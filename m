Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF673DB63A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140748; cv=pass; b=buCNgCetbS0vcmNsOX6a3V2oPVkotl4FpfTaHrsQsAxkIiB6vuFRoPnHiySIOTP7ngTfhGyyO67yoD01Rbxhl6IyQXyZaKK42zjbZEkdjn6AKNH+lKZBgX8lqsUqtycrBEaMAm9O7hh6AcD6bgvfUlLBfJHbLstllhToxVQQ83Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140748; c=relaxed/simple;
	bh=DkIYo85Pn4ngA9GK0ES4cPklKc4uBJicpFFxWLmU/j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtZsmLcHC/85sXCqPGtiGucXRkr0B4lJNpaIFD063F4iSNVBjdwPC8ZpMkgG/p/0WWJhy2SjJTprKX6tbHj7aI0IqSVRRfnTyNPb66k8naVkvKKJu/cnqMqnlrmheMgcjH17sfXCCQzecg4EARTndu5j4Y5Z/i0BRSHDkLDW6Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbJL5Q+L; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbJL5Q+L"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1627044a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140746; cv=none;
        d=google.com; s=arc-20260327;
        b=b4jOOIebfu7luMpwbUyO+5maElnJlauzSkvZHHBZgoXLnqy85Iq14ZDTC0W9UQg72a
         Z8yA1T6KkNLcSrjeiX/hNiwlnuUGFZy49Ts0byoP4x1KwUC4smsgLNEKb3q5rCQUZ+iq
         A1HPye6v532EHd27K+/Z3arZu5bhGQKuIhI4cvvmlQopjVBUFUDgErmOPlHwHrw0pOJB
         YtNH91f5p1R7vz/G5GQFDMkAoK9AkcBvXGBmpXTrBEh5OAkn5I8H9JUSMWOxl8N8Kj7I
         gC97VXjZimjS77DpnYowWFkg3kaazIvTClr0WflZ/s9aXkdF2zK3Eg2xuEDacrOeZBOX
         q7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfN2aS/+tGG4m/Gr1t61ow0ODqlfB2pmuz3SNqMPHwA=;
        fh=ZfDwicCpND28868IErm66xWo7LWagM3S9ibQsKH2AsM=;
        b=JIlETpcopng8iETh7PMLfEs8I7QLeaciHs3qiXtiJSjsbM9/C051SN3sdZbARl/qFH
         P42cAKbXX21AEwyoQxtgF+dLrtMXgCPXx6Z3QQv5kYdZsF7DCbcvVhDvDmwAPqToggIR
         rPHULCGj42Mp71X3/uh3k5r/CoUY3Rl+ETBkuj3O/WCD3jXSwHStnQo1LLjBg5wv0CMt
         u45z62Rbghz91S2uFBgPMbiHm1qEzChWPXubPoqTaGH+9Ol/0L1gDPfPUb3lZwdu2zpw
         paSK0XdhcfseJZy5DTkGvMzWWcskBG1uUbAgEzV0gPHMjrPi8H1TOfd7epFM0ygIJgsn
         hmSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140746; x=1789745546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfN2aS/+tGG4m/Gr1t61ow0ODqlfB2pmuz3SNqMPHwA=;
        b=gbJL5Q+LJ0n9G7KAG7wJgDHlMO3iWS5DWST6P/kfuZNp8CY854vIyRfMOflcFJyRTN
         j3SLWjWmQJp84f/GN2MXjAhYLOWVAd7rOEMdQZPb2fYZpYkB8T54nJ7N4Mlp2lLxi0LI
         FkfTjnnCkVKoUmqOTBgWh6gfJysyWMgjMUkQRhQH5lCtwef7hGcKdX3spYK1ignWe1k4
         AJd2a72RXhZM/gNlir8fgxkmmoGaV75XsuXr6MTmaT/JVuWW4V6nNAL8QcjfFNVml/2Q
         fqzEWoCFI6tuA8Vq0mqACcyZy994Dj40Nq3DqhUlNWN9wkj3g29Fg8rl62vvwppvHgAN
         u/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140746; x=1789745546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfN2aS/+tGG4m/Gr1t61ow0ODqlfB2pmuz3SNqMPHwA=;
        b=lMHC7BXESZbfeYeOtcQa3x0v7CiVLImClYuAFS6A++LN+GEARtq+TiEDKf9QOuOMIJ
         5JjAKga8P7ixYxJ3oNOU5KHszaW4gzimqHVYCP3Kmtt16hlHUbz6yZr25AOVeZV3BiQy
         goEW9eyMLjEe6iJFc6VTLQtlGzH9T7hRojLmYKyqpFyobmCVDbl3c7HVexiSut+wb90s
         /+2NddTMJR3MF+UmK/A2QyvWpO3QBS/9EMhFyEHPLSAFJWx8Wor7e19sOOBqHEOYgpBG
         RgPVmbMwIRdcIO7hP16dPWhWAmRGmNbqIfa7B822l4VraaRgtfJFbJinlNCYI1DJJiR1
         Etqg==
X-Forwarded-Encrypted: i=1; AKwUvBx4eLIIhicJHjhpen1hLaaWN3Jq8E//f1+Ph9x5ubtov2UAM6NzSdrE79yRy5OjcD6oMnNvuMzo2K5a9AM=@vger.kernel.org
X-Gm-Message-State: AFuF++kr/BNMvFOfakjKdmT83gRubdHuJP0kCbsgFvFytUOvZepB6Ker
	tMgtMCf9axGrJJXPzQYMz8AahgnKQViyKucJvPOUEcln5NMIkx1Lnc1LGPou3TQLn/gUf3/eLuN
	PMP9yVX/8VRir3iAky6bFwhJHJUIkDZQ=
X-Gm-Gg: AYBFou3Udi+nOGAOfX75pPRgenTOFKeFOZU9mO4JuMsCPa36jZw+JMIGzgqDxSDUlfu
	HMeQMwr6iePgcMqP3sL5YknkEbjeCbehZ+Zw3UL1xtbpqC6CzsYVMvg/4vr6H2cpvsUg1QUlu0V
	tyxQBIhD1uot7dtvk4OB4DRardKPQjvitA9+7qqgQOv0I/XZlloMJsQY2PWdW5QHBivq5cUb+At
	RtJtMgx9EtNvlno343xyAUmIR4Aj7+/K6nRkvc8EuSorpmvfYY7fZQn5229zK9Ja15OZRTYUOoO
	PsoqF8EjAVY11amGzlxzxlP1hnMOU7cjdxsT57EA0Ki4lJX7JLrixgJUkZhgDhvCgE3dFBl630i
	aUCjkiBd2hoWm2A==
X-Received: by 2002:a05:6402:518c:b0:6a7:ee54:f897 with SMTP id
 4fb4d7f45d1cf-6a9b56a48c9mr2177348a12.27.1789140745444; Fri, 11 Sep 2026
 08:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911144204.2089401-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20260911144204.2089401-1-dmitry.osipenko@collabora.com>
From: Yiwei Zhang <zzyiwei@gmail.com>
Date: Fri, 11 Sep 2026 08:32:12 -0700
X-Gm-Features: AcwNN1V_cGfwO5j1Bxt8GNsLjTC8MCOtlSabaRFMfY5X1VvYPK3yIDdCB9APKfE
Message-ID: <CAJ+hS_j5w1sfpLS91HC_dSDgdK-=0z3PemY51hUbJVLW-wyF1g@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "drm/virtio: Allow importing prime buffers when
 3D is enabled"
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Val Packett <val@invisiblethingslab.com>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:42=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Guest userspace may import udmabuf to vrend. Vrend doesn't support guest
> blobs, and thus, further 3d operations with the imported blob are failing=
.
> Typical scenario of the problem shown with mouse cursor RGBA image import=
ed
> into virtio-gpu, which previously was rejected by virtio-gpu driver.
> Revert enabling guest blobs importing into vrend to fix the regression.
>
> Link: https://gitlab.freedesktop.org/virgl/virglrenderer/-/work_items/674
> Fixes: df4dc947c46b ("drm/virtio: Allow importing prime buffers when 3D i=
s enabled")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/vir=
tio/virtgpu_prime.c
> index 149e6bcb5878..ebf471044d06 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -349,7 +349,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struc=
t drm_device *dev,
>                 }
>         }
>
> -       if (!vgdev->has_resource_blob)
> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>                 return drm_gem_prime_import(dev, buf);
>
>         bo =3D kzalloc_obj(*bo);
> --
> 2.55.0
>

r-b. Thanks for the prompt revert!
