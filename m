Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC747CC6C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754732; cv=none; b=WwQqe1c7Yoji9lC8ZTnUHou10k8Bp8aY78RKqzhr2Cslz1vj5NtZ/wSm8s/6h2wzbsZ3WC5KeYOTAXp9h5/yGoi44lqYZUEiKkMioelTqDNbwSYFdjlssgQZEcLigMwn+7RTbRIzjXzv2X+sflKbO8d1WIge6MnsC12/ZfBg60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754732; c=relaxed/simple;
	bh=L/+HlPUdV3G253wWJ1nWfhaV+A65Np60kcJnUHXWEmk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X64fEmiyT8IHY7la0RZIklOi02FWUMfjiSPgvgVvi75LigMSdypTC55n497GK3MuIReQxNZUDxpz2O5GzTutn+1ajihBxnn5SAmzDfsrLdY7hOzgdqUWOPEM3dhO0l3yw9mOEVAOgdsXRt68QeM/s2I3RoJO3hIa+uLZI2n9WJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WnbM7Zv/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ok1NedMN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WnbM7Zv/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ok1NedMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789754730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MrzAMtxqLSmsHZdu6tZejw7G1EUBpmA2nrahp3/aZ0=;
	b=WnbM7Zv/j4410GHOA8lY/0UJveA6Njh+9M9BFJNlQ19wA0RylwSRAL9prAO9RA8AAoenAF
	UAk1bSwHIyQlPxvEOKCL95zM4xeZOTVibJatMiIfLqSyC6dbMFQg+MfxA6zDMkXy/82scH
	LHBto7GcEjZhjrMJYlCLJFaTdf/LT8w=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-Zi_kspmIPVKS0Gx6EELFLg-1; Fri, 18 Sep 2026 14:05:29 -0400
X-MC-Unique: Zi_kspmIPVKS0Gx6EELFLg-1
X-Mimecast-MFC-AGG-ID: Zi_kspmIPVKS0Gx6EELFLg_1789754727
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb8f67601so12435371cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789754727; x=1790359527; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8MrzAMtxqLSmsHZdu6tZejw7G1EUBpmA2nrahp3/aZ0=;
        b=Ok1NedMNq1peSEkvia74ctX8wLN+deKQ8CgCVseJsFLb+ZiCryAcxIyTiBT82evymS
         jbhkfNpV2E6rwgXJHtnNic9hbY6i6MrNlTHur8AYFKXnvQyWh9QSxopIHfvM0MoJfKN+
         mZHiyirorkBw70M6tU9ra1Guw9KK4FELBlrsM6LxBha6pQALZ6Rx37XcECywLpHk62TV
         p3XGRJV0gKOMVO+FjpUxbZmT0U8zDC2SHXLoOJ88/UHyBTrXXEzYuGm0eUPohymk67tE
         WqlIY50uBKPa9/gLpJZhNUz1rTEyDtcRd0UNsk/WRdXY94Cdr8sbxjUnxWXIrcxa3Gqk
         XXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754727; x=1790359527;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MrzAMtxqLSmsHZdu6tZejw7G1EUBpmA2nrahp3/aZ0=;
        b=yjrdgFdllCudbNX3OeeDJnMyXpc/r8NSFdZ2vXfZLOwUjkkdysk366TArVAWl65HO6
         HRuuHS3rI9gpzsBX5cXvZPdbHdHva0/L5bhtoL74JNIThX/XnZVycGoiqCEGQVIPrlMk
         q+MQkMw9zP76IDoG6z1QoO8QrV8QmobH7eUgawpBCQ/0wheJDECoHQzi+CPj5aiX1yH6
         V372BkxJq1GOTbpWXYagSSaP9zetZMGgB0Jwtuzrg/cGjz9siMrPW2B3EfdrXjLMwO+c
         8LtzySWTUqPloRFL6F6yyurxXutKs7lb1l2/ZfmOh34/0EFMUJkGl8d0DRlX6xLRSutL
         lNhA==
X-Forwarded-Encrypted: i=1; AKwUvBwCOvpZ5iuOZJs4NhurHNtQalcy1BVIQ1lUw2/k87Hd8zDtJ0FdZFEMrar8yux0HVFy8Vg/ZI0CKtvwo5k=@vger.kernel.org
X-Gm-Message-State: AFuF++n9sCivJdePLMIotUrgqpGXwPvdgdR02O6c8eME3sHv4JqiSmeV
	EX2H2tgqWWyHUeCay4884gAx98LIHHBP7VaTkMlh1DKB5NxDU0Y6QGu8v+tUETtV8HVBtKG6mR5
	g40Prlxm4s8mkgldvwZcCg6HrQZjTF+U4ckZdQFfkEErlbNqX/IMDqJm1JeRrv4dZ9YUGmGfzoQ
	==
X-Gm-Gg: AYBFou2WfeP1/KMbRRI1yjM7SUwdRcuSsTDXQpkdGvrACVONjxuqGGpvPWuzc2JgW3F
	k0pefQCnpGiX7Ihm5UshN8i/a42zs9TXsJF6iBAstwLKgmnEBdgGjURwEuVfd3jlNRKA1gS8EtT
	hTu7xI+SBQBwB7X2xuE+cHS3QsXh2sDrXqAKptbp/gkhxOkN7B9KFmpHNiMAkAFzBKG6Vk/gJ2v
	epvhfpQ5tS8vpvsnab7CXJMvjJexkLOMLWMZBgjg1LeU3d547PJjSzlBJPjnL/Ukx6xTDfP5v6k
	cVRp0h88JfGWLDTGpo7c8r56gXwbXCH2yBVHznGit9g48W8B6JUVypcpu6AFpPnsecNWTMqF
X-Received: by 2002:a05:620a:178d:b0:93b:d7a2:dd36 with SMTP id af79cd13be357-93bdca3f401mr534881085a.70.1789754727258;
        Fri, 18 Sep 2026 11:05:27 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93b:d7a2:dd36 with SMTP id af79cd13be357-93bdca3f401mr534873585a.70.1789754726696;
        Fri, 18 Sep 2026 11:05:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93beda709b1sm3179785a.7.2026.09.18.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:05:26 -0700 (PDT)
Message-ID: <fa3a44fa852c8fd3b86eeb7e03ba87692056fc3e.camel@redhat.com>
Subject: Re: [PATCH v3 1/4] drm/nouveau/clk: fix list cursor use after loop
 in nvkm_clk_ustate_update
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, Karol
 Herbst	 <kherbst@redhat.com>
Date: Fri, 18 Sep 2026 14:05:25 -0400
In-Reply-To: <20260918131620.405133-2-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
	 <20260918131620.405133-2-postadelmaga@gmail.com>
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

Will push to drm-misc-fixes in just a moment, thank you for the fixes!

On Fri, 2026-09-18 at 15:16 +0200, Francesco Magazzu wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> If list_for_each_entry() exits without hitting a break then "pstate"
> is
> not a valid pstate pointer.=C2=A0 Introduce a "found" variable instead.
>=20
> The check is reachable from userspace: nvkm_clk_ustate_update() takes
> the
> pstate id straight from the 'pstate' debugfs file, so requesting an
> id
> that is not in clk->states - or any id at all when the perf tables
> are
> broken and the list is empty - makes the pstate->pstate !=3D req test
> dereference the list head cast to a struct nvkm_pstate, which is an
> out-of-bounds read.
>=20
> Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and
> engine clock control in core")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> [Francesco: rebased on drm-misc-next, expanded the commit message]
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> This is Dan's 2022 patch, reposted with his authorship restored as
> asked
> in the review of v2.=C2=A0 The diff is byte for byte what he sent; the
> commit
> message keeps his original two sentences and adds a paragraph on how
> the
> check is reached from userspace.
> Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 572e63846..5da82db71 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -473,6 +473,7 @@ static int
> =C2=A0nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
> =C2=A0{
> =C2=A0	struct nvkm_pstate *pstate;
> +	bool found =3D false;
> =C2=A0	int i =3D 0;
> =C2=A0
> =C2=A0	if (!clk->allow_reclock)
> @@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,
> int req)
> =C2=A0
> =C2=A0	if (req !=3D -1 && req !=3D -2) {
> =C2=A0		list_for_each_entry(pstate, &clk->states, head) {
> -			if (pstate->pstate =3D=3D req)
> +			if (pstate->pstate =3D=3D req) {
> +				found =3D true;
> =C2=A0				break;
> +			}
> =C2=A0			i++;
> =C2=A0		}
> =C2=A0
> -		if (pstate->pstate !=3D req)
> +		if (!found)
> =C2=A0			return -EINVAL;
> =C2=A0		req =3D i;
> =C2=A0	}

