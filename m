Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93843B42E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678611; cv=none; b=k7HB7PuafmlI7ORxYx5dQ9pMJehngR/wGqYCgb9+dOQ7QN4h5IeqvlxbhsWA0FfhtLb4hVA1t8dAeomDfpyyzs2a7NVMUfLfveZL+3r9W+/E2uYu3XwcvuPhIdbkl6m651scLmYGFwPZ2VjluiheQcuRcnYHlAmumOpmBkyFDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678611; c=relaxed/simple;
	bh=6rDteH8vS7udJq9ISI9vCJOm6KNKVIpUeToGR/U/a48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dg6RQAdBVZ0KoEoZnd6gqGcSXyeBou7HG7rLatqyaFuIAt62gjq61o24FY6ueWX5G1MUxr4x5JMa/w8eNL1u43Q2WRImy+PigGY4m/mlY1ot/Zh3V0rsWC4VOCpngsTeuIKD1M17BxgFvfWvDzCOx03sQElCJeHnjvKUbKfOBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSQ/2hWu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TE0MqMu0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSQ/2hWu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TE0MqMu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789678608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/Cg05CbpIvavYCVyx9/3zE/8H3+/AOemaPQ8wmlxF8=;
	b=XSQ/2hWuqwP9l4ttS6hPQrk1ubxbETInh3IsLd/ZtDYm0TpWyXX1CqVcorZzLiOGNDaWvX
	l4BCBGA6T5wV72t6RQXLWsJNrCJ7WESyDjgyRTrM0YLAvxGhF3fNcGa2fl5cg8+qMCl5n1
	Yw3sNU+swbnAS+ndAHWDiL1H66MmmBY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-CwA983EMOfm_ERMj16nA6g-1; Thu, 17 Sep 2026 16:56:47 -0400
X-MC-Unique: CwA983EMOfm_ERMj16nA6g-1
X-Mimecast-MFC-AGG-ID: CwA983EMOfm_ERMj16nA6g_1789678607
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso12207585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789678607; x=1790283407; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K/Cg05CbpIvavYCVyx9/3zE/8H3+/AOemaPQ8wmlxF8=;
        b=TE0MqMu0TrQzz7CfF7hfktCGE5uHbP0gin9qs7DFMRwZotQ6lvZ/tYZ+L/ucZSrZcw
         5iLLZqUPCyi70rlwPSjvdUJ6+/MH+4JfHLDGZptbwh2JIMi3NKiYoi1Z7TrfTQmHVFDo
         pyGoisyC5nqJyECNQenyf1Qt/iPgaeiO5NktMsNbJ+QoJMypcg33w/fK655tCkp4IyEX
         M/7AmXBcfRzcwfd/qdOqh2pWV+slzi07pH211Y24v/uyfyE2PuzfqE6rX5eJIcTTxYkN
         xtBBCwCuIAtgyqIh9/IyY8lrtGarWdiUn2bWLlnboWZSvIW0wnwztg+SbbFACBO+oGcE
         sUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678607; x=1790283407;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/Cg05CbpIvavYCVyx9/3zE/8H3+/AOemaPQ8wmlxF8=;
        b=nZRwC4f02jb7fZXHxUvQVKheCpRP27o7KWTr5h1FSIXXwSveqblOjvuh7GhhiwLwEY
         U68+6bgTNILIf83Rlg3EKzTn2uUp5tZIwPmN/MkaRrbzoernaiTmycqRLowSqExATBQT
         W0VW5yiGcg3mZAftaFI0izqh/sx1arBSFwHI8XCGLgD8b5zS7oPtsfes6WEltm56NZca
         qHuHMGWxbt1AsvcJrtS0LDs4uMuhKbwV13/dQwBy+4GyqZPnuuC/485zK9QQfmf6wfAH
         dS9U/Sod9ISAQya7x3Mr+LoBbxlGTWmLp16XmrxpvFwooYQ6iJKNoJkTYlKZxMaAVID2
         70aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWZbIA4zAIKzK2xIMfXAg+NSdp9FMUqJR1EM+hLB3034AR0Xi+b7fyawPu+QJqrODsjC2RSpJTPfo6aO8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4yzam3dXDJ5pAS7H0iFiDCpTB36zhsZF2vb84FUaF4EwyPOgG
	d4PEya+r41Sem2GHqY9fO/uvh69IEnOioyR5BXz/Ww6syq6CSZftSuoStrcivKPalgRndpvDB/U
	XGhminxVESrh0slFEj3dzeZttM5fs2tAv+/Jqe90eJIvJO98rjoCkpMQNB+hbWt9EhA==
X-Gm-Gg: AYBFou0izal1PCFFAMiqh9j0WotwstBKk7asrOIp9+u5iBEKdYHpmt6EPtBMLvG+1mg
	So2UU+0fWkp0e2JBC7yzS7m+cJshqzguHAm93Oa8sihX84jmctVWjOWPZ2rLEhQhmIONr8l+bQz
	KQ28/8G2zXoHFQGzGJX1EJbsM1pKhNYSozseh2lCONm6B3jxlvYO7+7WPJZ9X1xC762ofeu6V4K
	+0iT7y3OC3rWAtOK1CVXs91Oc48Svi8MyrzL7qI7L4DaR8s7igX4s8KblixY902NiAWuho0sO57
	TYZA1y2lCk2MvadCU3Sv1KvRtoPM7VDTtKoBsVb5h1x9SeyylYe6wiFsk7WlXmJI+vzUCEnI
X-Received: by 2002:a05:620a:8086:b0:937:7836:1501 with SMTP id af79cd13be357-93bdc6a7a23mr29332985a.10.1789678606712;
        Thu, 17 Sep 2026 13:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:937:7836:1501 with SMTP id af79cd13be357-93bdc6a7a23mr29329085a.10.1789678606225;
        Thu, 17 Sep 2026 13:56:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781d94c0sm539461985a.10.2026.09.17.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:56:44 -0700 (PDT)
Message-ID: <ad023b5df1495ced25aa681d10f57628df41ac13.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] drm/nouveau/clk: fix list cursor use after loop
 in nvkm_clk_ustate_update
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2026 16:56:44 -0400
In-Reply-To: <20260712123616.1180830-2-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-2-postadelmaga@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

This patch looks fine to me, but but if this was posted by Dan
Carpenter originally would you mind switching the authorship over to
their name?

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> If the requested pstate id is not present in the state list (or the
> list is empty, e.g. broken/missing perf tables), the
> list_for_each_entry
> cursor runs off the end of the list and the subsequent
> pstate->pstate !=3D req check dereferences the list head cast to a
> struct nvkm_pstate, which is an out-of-bounds read.
>=20
> Track whether the entry was actually found instead of inspecting the
> cursor after the loop.
>=20
> Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and
> engine clock control in core")
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> Note: essentially the same fix was posted by Dan Carpenter in 2022
> and
> never picked up; the bug is still present in drm-misc-next.=C2=A0 Credit
> for
> spotting it goes to him.
> Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 572e63846..42f3709e0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -479,13 +479,17 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,
> int req)
> =C2=A0		return -ENOSYS;
> =C2=A0
> =C2=A0	if (req !=3D -1 && req !=3D -2) {
> +		bool found =3D false;
> +
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

