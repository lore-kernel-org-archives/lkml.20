Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F34CEE44
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669175; cv=none; b=X+kuz++oR8p8uDGNI3l2twne08QxhxUK5DLp+0L0To29S9WpC+Crkey3rXuESxHV8JvJBoXVzI3193/tny6+juhAoYZoc8HkzVkaXL+eWGDyHLqBNsnPCw03YnKUMhhsoZ9lNq0br2cNt5ZJSSGCLuJJ5m+RIlvng4KtrmKV8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669175; c=relaxed/simple;
	bh=Yk+dsBCvOCH3KYRJfgG+xXG8w0PVzLsSfAJEvJo42do=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZtwE6PDZeF2FmHn2rJEZBx+wnWyWavf3eW/7bMXawiM3SG/S2j+mdKPWvTwWYWgMEdkb8LgHa0D2d+2csu/83nRG5syKCrMEfDttICD5qCTEp75D8MO0S6RBCVHJso+K1200HSlAZr384TGPhw6xULf/zDFj/sgtzpKIIW5i25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQ1kgs5Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vg4WZEBk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQ1kgs5Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vg4WZEBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789669173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EVrUJFQJF3dnaOQZb2Gx1UGobWA2s6Fo3aIIPVgJwM=;
	b=eQ1kgs5YRkdxVIaL8ISyVhLYqxwnhIWVNc+ATVOyF08s/9kHlYq80n7gJMTsIl93IhQuHd
	8vzivDZmumQlGpTI+o2bVdoggHuU1HXS9iWUgwudbCYFIQpieuUdUpzxAV2fa0z7WAIfdX
	0QrOX1jze9Ul4pD9RVq9Y7HbsUypM90=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-UUSYQxxcOomL5ufjX_EI4w-1; Thu, 17 Sep 2026 14:19:32 -0400
X-MC-Unique: UUSYQxxcOomL5ufjX_EI4w-1
X-Mimecast-MFC-AGG-ID: UUSYQxxcOomL5ufjX_EI4w_1789669171
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79630cb8723so340571137.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789669171; x=1790273971; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6EVrUJFQJF3dnaOQZb2Gx1UGobWA2s6Fo3aIIPVgJwM=;
        b=Vg4WZEBk9FPzRD5wJvsm7ZKp33KpWqTyEz3KShV1o6tSIJwJyyedZl5AFH5MWBr82u
         ncUdV+UCLyT04cpr5T5K+194PiZsDUf2oKhq/mXEcuLoZO6/PIVokc2gkmIZh2qGdEnu
         uZpJOJwTWUd3CKSRubUa5lhCMHydtUmiWdn1jT82WM0pRlTLbp8W4RzpuD3257mbZP3y
         IjdZIrYhGmze+NC1aEoTqBqpj/DkflTyTyhFOIFJos0uEgtco7XVmmtOF3ETQ1sqwU24
         cUsyjA4GRWPPE2JNF7ot3nbiatxTS5b5DvXtL9lksccFvB3HTwolVP2PRgJrSkCSuh7W
         gdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669171; x=1790273971;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EVrUJFQJF3dnaOQZb2Gx1UGobWA2s6Fo3aIIPVgJwM=;
        b=WaH1+3pw5aYyfmRSLPqgl9kkfF4vDEvDFnptiFojUEAQJ8PMNnJcMXVkDz2a9+OGfo
         gbYD2chbwDuLaYd3YXfMCovR1KO27JrUij0+1pOa+Ifr0T9F5jdJJiauEMKuCfZPc+7f
         9d7rE3y3znmAjRORvnptlL+j9//pa0F34GbQ4aK90b09itOAeas35Z71pgwLfbhBz/vW
         fYml/7r7fJkbU51kKpOVufM4Ry4vGR2tSlxl38XUyjKmvAtkvzwGznyGaYH8GmQaP6O7
         lGD75POE3vaFBj4H+zcU5r8MA7UxIbfBoK/W1qWD0cxyQmlyHTvW0LiJZtmiI8WuJwRT
         dkMg==
X-Forwarded-Encrypted: i=1; AKwUvBztcPTP4xi/dTbJBtKqtJDxg2aoCfFLStabVb0x4JFql/2aXF5oXhnhdY0KK/yAip7XMLGsF2WrAup+Mes=@vger.kernel.org
X-Gm-Message-State: AFuF++mC5ofVBu4TN2Jeo1Y6+BDKcNtlGmtMyhMOSLwppiptZ5KxcJFN
	37j00ESXk0Tc4IIW5XG4r2O1XifUocCPdhrqxXUsDZgpFOfmM2YsHx7bsjAsZM+zs46gZNtyNac
	QSCxDG0zKq5XfxFa0qqK9J2j0sJ1530lHT1PxUO3veXOxhgtXkaVLlEHoj0kAN0qVnQ==
X-Gm-Gg: AYBFou0GLfmxPghjtwWrjldCHqHMjhkQXQh2yoXd7YqSA+kG9kVD0MFOyJ6/9ApMiRO
	KGruGzE8N6SQU7346f5B/XnF4m2g8jIqBpWYfY/dv8XxYiPvo9grDdsheJSPlFjQtAPv5f2JedL
	icNk+0R1oXyYX+FJLq3yoh/oXd2IdsMatOg3ecdboBpB/31NIRT3MpmYYGk7ZC6krd8TODAvRbW
	W1sCOcUM+FdME3PedG7Xd+Aicx+0M7n9TmAIbhUIy6F1RLAWuxk7nX8+5yzjw06ZnPuiznmmpIp
	W8F+fkiCjOR5vzdkhLXyFLCVvtYWkuk6eQ1pESzOBbC7AdB6Lrd8oLdrQ74AiJ7JnIikuRDt
X-Received: by 2002:a67:e708:0:b0:797:e5aa:61c2 with SMTP id ada2fe7eead31-7a024dcd2e6mr7627693137.3.1789669171519;
        Thu, 17 Sep 2026 11:19:31 -0700 (PDT)
X-Received: by 2002:a67:e708:0:b0:797:e5aa:61c2 with SMTP id ada2fe7eead31-7a024dcd2e6mr7627685137.3.1789669170960;
        Thu, 17 Sep 2026 11:19:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e292ee59sm4120534137.6.2026.09.17.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:19:30 -0700 (PDT)
Message-ID: <d43ff56c010c83fc4cbef634e7a632940f5d20f7.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix gem reference leak in validate_init()
From: lyude@redhat.com
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Cc: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch, 
	tzimmermann@suse.de, stable@vger.kernel.org
Date: Thu, 17 Sep 2026 14:19:29 -0400
In-Reply-To: <20260916180202.2090231-1-vulab@iscas.ac.cn>
References: <20260916180202.2090231-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a bit

On Wed, 2026-09-16 at 18:02 +0000, Wentao Liang wrote:
> On the ttm_bo_reserve() failure and "vma not found" error paths, the
> loop breaks without adding the looked-up object to any validate list,
> so the reference taken by drm_gem_object_lookup() is never released;
> validate_fini() only walks the spliced lists.=C2=A0 Drop the reference
> before breaking out on both paths.
>=20
> Fixes: 19ca10d82e33bcfe ("drm/nouveau/gem: lookup VMAs for buffers
> referenced by pushbuf ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 20dba02d6175..c2601b559947 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -513,6 +513,7 @@ validate_init(struct nouveau_channel *chan,
> struct drm_file *file_priv,
> =C2=A0			if (unlikely(ret)) {
> =C2=A0				if (ret !=3D -ERESTARTSYS)
> =C2=A0					NV_PRINTK(err, cli, "fail
> reserve\n");
> +				drm_gem_object_put(gem);
> =C2=A0				break;
> =C2=A0			}
> =C2=A0		}
> @@ -522,6 +523,7 @@ validate_init(struct nouveau_channel *chan,
> struct drm_file *file_priv,
> =C2=A0			struct nouveau_vma *vma =3D
> nouveau_vma_find(nvbo, vmm);
> =C2=A0			if (!vma) {
> =C2=A0				NV_PRINTK(err, cli, "vma not
> found!\n");
> +				drm_gem_object_put(gem);
> =C2=A0				ret =3D -EINVAL;
> =C2=A0				break;
> =C2=A0			}

