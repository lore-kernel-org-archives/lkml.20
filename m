Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECC38AC7C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975184; cv=pass; b=RV5oy2nOqDs2grP46EzUc+nNPsyEm2wOVbpArHQa2XYR3lep9BVfbBcq9bgIYy0QaPkwxIbIpcUw7d7bzJxnfVWlNzftXabARraKCqI3yR2/gjxD5XRQsYKdDkHf4NvSv6VVhMNxaMNSTUp10a0rMngx2XdqQTFdF5KMHrf65Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975184; c=relaxed/simple;
	bh=re78z8VwnjJVx6PndmI2PAAf2TcgSUlQDvgcNiuRZrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNG1WE/nWKE20aGMtrQQm9hOX1vOeUfbBWzMEZqoKk558NtiGY0SLk4dxZpnHDxzXn8EgdJ+SCSDkmMqZQArhpxjNnrmQ5MWwSH+hoCUwsL8tJXnB1HhRIRXHSLywJVlQFcDQ4IR/VQUb+DS31JG9RqRuExFf38cLMOU5MPbJUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADG6rdp8; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADG6rdp8"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso4263939eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788975182; cv=none;
        d=google.com; s=arc-20260327;
        b=leXDY1ydKT0CqvAHj/8qpxdTmzmvdko4axv+i+IV8xYH6sE+HbeeNMJExzNwOAp/Q8
         CJyt+oToz84eU1eshbTydT6WHEsDMA7JQWUUPf15MfACb0ecRF0IF+gJ6Cq4ppyq3AV+
         /bpc66ZB1qswT9wg9+ZzcbRKrvlPZUlkZdqO6BSLeo/lu0jhbZDC/7FKsWTCec/GHHjJ
         oypqgeVPqXJGeJNE1pUuMlh639rKIzNdyvnrUkXHIn/aTTYJDZtZn3Uh8tC20BNd/XMP
         xXswHCBZJ5Vzsv+6MGfTZJWmjBOjdNT04HFAHKYtvUh30yTE2i4ayQ+VynH7kJnZOFac
         OFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9a7q+yhTyBJfb/NQ297CJoBt9orarrovB+ksRg7mIgU=;
        fh=9uf/5zqqbUdT7s6CAgh1+3i97l37P2F67Aiu8aLUunw=;
        b=AKKNe05F4BM47bklrz9mKcEOLrS5UkcIgApWqaEvsvfimXXewapc22P9ODJH7rqxNY
         r7veWrBoZqYOw+F3cHRDTQPxO1PsvWkVVeOMNXK4eHbxfWWTGy1ZMhZedHmHdtRpbQ0l
         6C4+3m4I8yjE9OQQBcym3wKxpG+ethqg90/k7ytHHNUdPnv6GCumbpiAZWMygn/C+OjL
         Ia+m0fIQcWxEFLkwIot83z+imNoc26szV1YoIKt2kre8wFADLjpEWjuMfqIJEDrPeRia
         B9jOYwUKd9dLrOQHFLBfayQTAqQJI0xG7IazwoE1C6uly4QArgRH2XWX+xRJIUrdJlOm
         pOjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975182; x=1789579982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9a7q+yhTyBJfb/NQ297CJoBt9orarrovB+ksRg7mIgU=;
        b=ADG6rdp8GtsFBUcgn/wTSJaeqeeI0PMoTvWlO92gN9zccB5KvqB0puRKk/hy4sq0cY
         0vVju9h3vj8bXlxOaVIOWy2Rhtl5dSCRhaTaLOlIOCIsWLWnAgTpCUyQXaceZFC0tBma
         1EwTMkN6Jj2Lb58VSuD2OujV7K/LS2s0SOANRYlmdFqyOjJMt/mvnMPx0ke8MK919JgG
         cEOE9suznYw7tEttKH/uzz+E+ci+QenpBerq8wM2NFhLa6vAGCj4e9FtmWQFbUwcY5vS
         K3ENyXVV8Q02KpWY+7Krfd/x6ZAUqvU8Ak1tdWByaB1DrBDh/4MQp3a+IwPMI8Q6RBxh
         XYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975182; x=1789579982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9a7q+yhTyBJfb/NQ297CJoBt9orarrovB+ksRg7mIgU=;
        b=OZiw7Wp4Od99q9aiAVcVrXjSzUQljkb0lJuTeXw5K6YKMqQ2lpHF/qvItAf/ZGWHMh
         5gRD0kITgkHaU4Mw1ibk3opdBxzeG6hJ9AY15V7sd5iXswH/kq9i1ytg+6o2Xp8PM4rL
         dbHb0eBufLHJpuqz84yql79JFMFTQTQceApX+g/5MVVKheePqr+iQpCWO2iHHdhAkFQr
         0H54Jz4GMxodBn5uMuJKJWWZe7+eefHLrAwmBudAopLU/E1X0UlIb+xsQioqkceJHc79
         yqxTQV9kJWZ4OzrAymlVH0yA7vSDo+hTw5iddcqKdoCIuGCf4wdpZIsT3jobhcoMS/42
         REXA==
X-Forwarded-Encrypted: i=1; AKwUvBz62r3HRsL0hGfQZGOsdLenO2ve4kYqPXv86XzGwBm05bW7kD7ynBIsgB3QMkgvhOjwdkf2d3UN5dKogCM=@vger.kernel.org
X-Gm-Message-State: AFuF++kt0m3gjf0uz4kEBoNCtd5PufIgXYRBLGoRV1DV99a5KjKAJYu9
	F8TA6zMol2Q9CD4j41In2eDTm7cVR1mGhr2ksOX+h0kDi61uvT5Gjrn8Phu9FHwUdu4f+IjOv57
	KpOPjS+k8zFBsGvkhnk7axijIhyzFr6Q=
X-Gm-Gg: AYBFou0Pl4BkGAOAvsGamELdEhVXtTukGGRV0cai2iCX+fAtuubQZSzQQHQW42pv492
	Q3dczT9QSyFM4VQMjXpsJqvSLzU2jZXk7dGtPEGpDDQztOTBJdTTVcadSdSZfpxPjs9J917h8r6
	2lxtBuBZWYlnr0nJkjA4imJqnrNup/wJdjyr+EWvyINy/r+j6t5YNcB6Gp7YMzjO3kQaIMOUfIl
	ruROiCQlCTEFACn8xcKRluyD94qn36gzYOpDoidaOKNnj5zZ2RIbwBd80I8c3rhI8FsoIJNd49w
	uy1XpYbZcGrZywz5iawWYLR4m+ewehNs/odySbqq0J9bn5VZkMrZRAwTDMBJvGAfaNewUf8D1E3
	3J8V5w2l47GNA
X-Received: by 2002:a4a:ee1a:0:b0:6b7:8415:d78d with SMTP id
 006d021491bc7-6b78415d867mr18306497eaf.56.1788975181984; Wed, 09 Sep 2026
 10:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906131414.2683362-2-mmyangfl@gmail.com> <178896697251.219967.12696740711142321048@kernel.org>
In-Reply-To: <178896697251.219967.12696740711142321048@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 10 Sep 2026 01:32:22 +0800
X-Gm-Features: AcwNN1W1AmptlyO1-mcwo-J90MQOa1tlXZ-QA5t7ssmOONEuEN1r8iczultO9bA
Message-ID: <CAAXyoMNMU-Ly8o0uvpk=d0WKvJ0o8hsN-5NqfGfu4fB=pmVttA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] net: dsa: motorcomm: Rename MIB stuffs
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:16=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
> [Severity: Low]
> Should the comment above yt921x_mib_descs[] in chip.c be renamed too?  It
> still points at the old type name:
>
> drivers/net/dsa/motorcomm/chip.c
>         /* Must agree with yt921x_mib
>          *
>          * Unstructured fields (name !=3D NULL) will appear in get_ethtoo=
l_stats(),
>          * ...
>          */
>         static const struct yt921x_mib_desc yt921x_mib_descs[] =3D {
>
> After this commit there is no struct yt921x_mib left in the tree, so the
> comment names a type that no longer exists.

Will fix them in the next version, please do not merge it.
