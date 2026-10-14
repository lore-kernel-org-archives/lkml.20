Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5351C049
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987076; cv=pass; b=MJhDAarJDOdwEBtBHqszOxGZv52ayLMWnflcdfDJBs6v4O87xXNKGHTZq/4kXqYm9HfkKuv0B/mEO8JGxNhXXKa6NtWdwBRioNAMDPqP8+tWIWPebKgSDck5INza3AtbW0n73GXn99eU/hGZLTrNZEh1jfZCqu6/c9qli7re05g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987076; c=relaxed/simple;
	bh=gOgXWgAiLPMDOKk5JN79DS2i3klJD3/ywfwgxlaWjnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXRkEzBpLfTzcf9kD+AzoUjy3T37vDcspG8iw/MJPRQiWdcPRYDtCU3RmUpuBRnWZvh+VbuLug62E4rte52HZqpLO4P6lPE/A86we+1I8BOTeZPBpQOvec3RMpf/IW7S6XpKpyez2MZH6C3JVfaNV3jP4Cw38nfT89cZScBcpEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=T1JRY+h6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="T1JRY+h6"
ARC-Seal: i=1; a=rsa-sha256; t=1791987050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BdQKtUbE6btzoW3tphzG9X0WF4HVaRG64stM8RZAKZ6FzMLkzME1LMqHj/CdIbtHQXB6JgkY3CQnhx4Vg4/5OaWCLH+fNd7/cYk1xml5WnYa2znWtvdA3ecRdyPRqekCN83yA9cVzBs94T7ysDuTSA1s9W1RYnf9/zjaaSWqdy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791987050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R9R8NWPN09nGxU8zI3h7F6yn9XPsLeLZNUGXCBmw2dM=; 
	b=BUWM8ATrGSffdgwE4F3vHZ+YW1sfytrP9s/3LB/CCHwdBR4sP+MJ5/IfkaoJuOWJrQfDfzb5yFUOe6sW+xaLrntVhBPzwsqDWNIXiuST3hdjFyAqArLRjfXQEaBGE5UKY11/mY/3f4Yzum+3EnX7QTup3peqPy4jKExgJDtWNFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791987050;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=R9R8NWPN09nGxU8zI3h7F6yn9XPsLeLZNUGXCBmw2dM=;
	b=T1JRY+h6H9WRaTrI5CDwjIV/FsYFu+Vh4mxx4IEEP3UeCfPyRQF8FbKPAkLD2nvt
	fyOMVvyb3k9mGidBjuR1kdkdiJwLRCfuzqUIcXeKFXxofSozlOfs9gSqNS2r7D8fIQS
	G929FB99wE5keXeuGwTtDGACGolBNM3voFLMs19c=
Received: by smtp.zohomail.com with SMTPS id 1791987048034761.1535266303295;
	Wed, 14 Oct 2026 07:10:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, santimillang@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Santiago =?UTF-8?B?TWlsbMOhbg==?= <santimillang@gmail.com>
Subject: Re: [PATCH] drm/tests: bridge: Document struct fmt_tuple members
Date: Wed, 14 Oct 2026 16:10:43 +0200
Message-ID: <GKOThU5LQ3KRb4Bp1kIrzg@collabora.com>
In-Reply-To: <20261014-drm-bridge-test-kdoc-v1-1-883f7ec8bcfa@gmail.com>
References: <20261014-drm-bridge-test-kdoc-v1-1-883f7ec8bcfa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 14 October 2026 12:56:02 Central European Summer Time Santiag=
o Mill=C3=A1n via B4 Relay wrote:
> From: Santiago Mill=C3=A1n <santimillang@gmail.com>
>=20
> The kernel-doc comment for struct fmt_tuple does not describe its
> in_fmt and out_fmt members, so W=3D1 builds warn:
>=20
>   struct member 'in_fmt' not described in 'fmt_tuple'
>   struct member 'out_fmt' not described in 'fmt_tuple'
>=20
> Add descriptions for both members.
>=20
> Fixes: 082fbc179c01 ("drm/tests: bridge: Add KUnit tests for bridge chain=
 format selection")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606120201.5E4O2N7N-lkp@i=
ntel.com/
> Signed-off-by: Santiago Mill=C3=A1n <santimillang@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index 15583ade8494..b79d7b8b2d32 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -123,6 +123,8 @@ static const struct drm_bridge_funcs drm_test_bridge_=
bus_fmts_funcs =3D {
> =20
>  /**
>   * struct fmt_tuple - a tuple of input/output MEDIA_BUS_FMT_*
> + * @in_fmt: input bus format accepted by the bridge
> + * @out_fmt: output bus format the bridge can produce from @in_fmt
>   */
>  struct fmt_tuple {
>  	u32 in_fmt;
>=20
> ---
> base-commit: dfc3c7b84d43e7de918686e5cd7dd49196a5f45e
> change-id: 20261014-drm-bridge-test-kdoc-a46e4183b670
>=20
> Best regards,
> -- =20
> Santiago Mill=C3=A1n <santimillang@gmail.com>
>=20
>=20
>=20

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>



