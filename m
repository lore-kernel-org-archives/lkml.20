Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64D48FF82
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679609; cv=none; b=RfYIqWNkx1BVsmOzYdieXTKMrK2D3FsrFMi1xJEsY8xPH++YpT3IF2/M5Bzq5lolvKrPSI87jDisasnz9Aeu6iJLhI5kXLitYBF8tCiDfXgBP9XlJVXSzcgg/OSzpMDAOyZUIU4EMjAZPSFjFMVYdYBARrFAgORGEjmNw1jS8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679609; c=relaxed/simple;
	bh=7UGxLQujhSpBzmaGFRnJ8f4QGXjD260xVATTJpQHlCg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AaZfVkuhnmq9JZF7ONBh+ERdJmo7KXOHuweR/0x47pM+WUlsl84yXwTkLD8q2n9gLpHLiK0GoGYYOr0aC27janw4ZLnyDAngmLvw211NhYphFFQcKHO4MZRWJvUdLbDtJmyBoPYW+nv5pCj+jOOQe+lf9GzgYCeUwZsp/AchxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQMXeZWF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpAZbBo1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQMXeZWF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpAZbBo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1WRQ3xpv0F4/rm47tzzwq3oGBSMX7i9LTQrQwZCVGM=;
	b=MQMXeZWFbLboTxEJis/dS8C0xV2jvDyKajOCc1zoxFtk2PlYwyRKaGoY2p5vn1gWsfw+F8
	z+3QMFKJZ4YdH2/l46Z8XUkC8XoMjwgF/nUVakuSBuKelUHcejZ+wYDrEjyADtpIK4wFx2
	1BBeHasY3Rx7johVZjxCrgP7l/Bg7Mg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-Hneo24HHO8C02ns2XlGLBg-1; Thu, 17 Sep 2026 17:13:24 -0400
X-MC-Unique: Hneo24HHO8C02ns2XlGLBg-1
X-Mimecast-MFC-AGG-ID: Hneo24HHO8C02ns2XlGLBg_1789679604
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso13576685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789679604; x=1790284404; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+1WRQ3xpv0F4/rm47tzzwq3oGBSMX7i9LTQrQwZCVGM=;
        b=HpAZbBo1JUMmB6xmc9TE3p2pNB1Fq/+hlLjtc1pAlhE2VCK+KybJJ13UWCvfNTZ9X2
         3xXSm/4wQuhLc0SPYnKOYnm+Z6S2iaivsA71RlvJ7GpvF1gaUYv2SNmRGhM1D4cOv/kr
         C86mHpNc2fuewevr6WpiKocdlCKjG6P+nCaFwAwRpCoN/HwNhGk1erZ0VwtE35xsngmx
         9ygahByC+n1ShScFnJfY09Xo9KxjKdYEol+aFRhSTO596mHGKCBFxp0LOiXtQWeA2V+e
         N1MZyxtSN5occB433z5tmygrm5cEZb9/uhGttMpfSUl/mrXL1O+H4dyouy08TXcZ9EnH
         WE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679604; x=1790284404;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1WRQ3xpv0F4/rm47tzzwq3oGBSMX7i9LTQrQwZCVGM=;
        b=jighsn8qsYLS6SCHWlLhua2FClZ5SGO+pCTrgWcR1FLRFf0QBeRaYcpuI/LMMxgvm1
         YYEduJre8yPS6R1rRBs4iB8dC24LKz5g6KL3RtbZUDS8cIS6xSvOhFtPYpohVGQPppnW
         jzN5UTNnN17kxyxVbGwjOAD0fGbunpn/WQ6W1KTHQsUVbhL9iYlhObRlsYtrTN71SDp5
         yns4eQiAtvsYFheomNQHecc4jbNJkrdf7VQ+TUCcb5ozH8/w0fTG6Q6vBoMHd7nF8df8
         Qe2AfnnXlVfgJP/zkJzqaOd3wP/ZRAUJnxyXXnNBuk+b06HkmZrg7bkKYXDgn14kFbr2
         LX5A==
X-Forwarded-Encrypted: i=1; AKwUvBySiZuEenkXQxfjyiIAFSHf0dnqoI5/gD7+z4zQEMU2XVokBFTX/rYu5F7UWD8XPuAM/OsuuIDNVglIKXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLX30c77VUrFKZe/PLqIiQ2eJ/T51EgQE0tLWmyXTd2Z3oD/Op
	/EbRznW7G7tFKtctokNsxlY8msrU4JJTcG16PhCNo6lql25IFfelRSe9/c9YW8228EPHq6riefC
	Zgcmv9n1f9yd1RfFkT72ahYfI3XxA7nju/ZdYIPgp+JRkbhAeOLzo/leeD1tHPPZ1ow==
X-Gm-Gg: AYBFou1AiZgd+vfI7Sk2eE6Xl5eDjtkjV5cpPUUjLjPElbEE7I0mcqf8VrglveIa1Wl
	mt4wxmHS4WV67mRZMLn4x+XaoEvSOI8EGJR4NBxi1ox3JgdzZVE2kbYJx36Vxs5hW2445RjaL/4
	+CAlp0qBY27pEqtUa2oVxP2qGde8dic2g+EsU1f6sEPyL9u/Dtff2RczMn9/gS+7BAM34YWZKYM
	MyLa68MzPlZJZcULesLb/mBUEz7sfyGizcjUd5Soc1UsB+0Q0vFc9rLkHhsmmfbe637X5Qm8r37
	PaS23OreVdtv6w0vacrezeBYmXPX9HVwxwJzJn+GJDWl5FMtHhnbuXnFlV3fsIab2UGXYi28
X-Received: by 2002:a05:620a:4103:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bdc6d5f01mr40255685a.16.1789679603891;
        Thu, 17 Sep 2026 14:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4103:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bdc6d5f01mr40251785a.16.1789679603464;
        Thu, 17 Sep 2026 14:13:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7821d231sm558697385a.21.2026.09.17.14.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:13:22 -0700 (PDT)
Message-ID: <d6d916ceab76de14541a087c092cecf895c82164.camel@redhat.com>
Subject: Re: [PATCH v2 3/4] drm/nouveau/device: don't use the pstate cursor
 after the loop
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2026 17:13:21 -0400
In-Reply-To: <20260712123616.1180830-4-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-4-postadelmaga@gmail.com>
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

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> nvkm_control_mthd_pstate_attr() looks up the pstate at the index
> supplied
> by userspace by walking clk->states, and then keeps using the
> list_for_each_entry cursor after the loop.=C2=A0 This is not triggerable
> today:
> the function already rejects args->v0.state >=3D clk->state_nr before
> the
> loop, and clk->state_nr is kept in sync with the number of entries on
> clk->states, so the lookup always breaks on a real entry.
>=20
> Should the loop ever run to completion, the cursor would point at the
> list
> head rather than at a pstate, and the pstate->base.domain[] read and
> the
> walk of pstate->list that follow would read past it.=C2=A0 Rather than
> leave
> that trap in place, track whether the entry was found and return -
> EINVAL if
> it was not, like the other lookup failures in this function.
>=20
> No functional change.
>=20
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> index f2e9a0626..28702741a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -74,6 +74,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control
> *ctrl, void *data, u32 size)
> =C2=A0	const struct nvkm_domain *domain;
> =C2=A0	struct nvkm_pstate *pstate;
> =C2=A0	struct nvkm_cstate *cstate;
> +	bool found =3D false;
> =C2=A0	int i =3D 0, j =3D -1;
> =C2=A0	u32 lo, hi;
> =C2=A0	int ret =3D -ENOSYS;
> @@ -104,10 +105,15 @@ nvkm_control_mthd_pstate_attr(struct
> nvkm_control *ctrl, void *data, u32 size)
> =C2=A0
> =C2=A0	if (args->v0.state !=3D
> NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> =C2=A0		list_for_each_entry(pstate, &clk->states, head) {
> -			if (i++ =3D=3D args->v0.state)
> +			if (i++ =3D=3D args->v0.state) {
> +				found =3D true;
> =C2=A0				break;
> +			}
> =C2=A0		}
> =C2=A0
> +		if (!found)
> +			return -EINVAL;
> +
> =C2=A0		lo =3D pstate->base.domain[domain->name];
> =C2=A0		hi =3D lo;
> =C2=A0		list_for_each_entry(cstate, &pstate->list, head) {

