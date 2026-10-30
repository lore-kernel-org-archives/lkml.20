Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358154;
	b=1ocjEMn8HqvQ2SOXvRT2XJiuguI03x6z4wSIi4gDjSjAMSPyq9WXFcsM48KaduRevNNd
	 9Wtx9C7mAUD44tfqnH+SP9nP3H5VYTJFRBB/OCJh2iRJ1JDOdA3COfYZluqWhh87s7/Hv
	 +i6thwajfoZvSxjP9pdhmFnTcLPHCMERxWsHyQc9u/Jpd38ZQo7iXX3lb/c3KY0AMMQ1k
	 HoZvuT5R2U5+NK+jYeaCeFe9kB7ovmvxr0aq3w1Xpc1frmZabKyZNqtT0CWUHnuoiSsWY
	 unz5tD5NCQhXv/1QkqWBs/pz5K+K4K0LYDRrkLMzOZmMOT2HmlxW+PwbDB1YmOezPLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358154;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=n/U4UFdhwELj1O+Vs6zyp8TwuLl7zda066w0LeaYSGQ=;
	b=OWFYlESIgrrK++qMMaMgP36tS5FpzqWyQYN0csHkhPNDy02SjeSuwJ3pU0E81Nojl+Xj
	 fD6huR1Ouqb8I2tE6jIwMNZzibA0PjgZbEF7eAhTw4VPsWdwPjxFrVE5c5FWL90pnCRxG
	 zvUAy1m3cHmx3y873LdRZ1O98EsBtwbDiyCVEyfzm8TvE1nf6I0tlis3VenvvmKxhRFi9
	 PuFZfAOgOb+lUSXdMunEFZ5xHRGlOa/UDmSz+x4CWTtSbTrsFaOun+S6DrsNBoYKe3icZ
	 +bONnCGnml/s2B1ERJjAuDSxN6LkX7pILYEcZJLOXeMhfV3w3rVozlOKjaG+xfskl9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=SZUIkM2+;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944B606A335;
	Fri, 30 Oct 2026 11:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5944B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=SZUIkM2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793358150; x=1793617350;
	bh=n/U4UFdhwELj1O+Vs6zyp8TwuLl7zda066w0LeaYSGQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SZUIkM2+aqn1kcSOJTL0DRdGbW6vqyDRYAdQwHuCrQ7NcnO5Qe5zQ36kUXeTpjfdE
	 hyS4fnVlw/edLaq6DljE5GgmA4VNPxF2KNUMO7FSx1gIct4gS18aniUORsuqovnSlT
	 dagJgcNh/J2G6uoloGn+0KyGbTj1DeYOHW+siR2BAMJg0QNu0YpqnbAfA0sqO1IP0k
	 waRrrwFs+rHmZ/AYFWvH7JM+qKkQop+yVQwXT0QMiLUyiynI0lL4H979kJ8deNFGgn
	 cu/Pc/whOiDTcsDEIwOcICS0amGRK1WgqHH8YmkI1TySvkJZBUS1Gv+wrgFdgElqPB
	 LCVhXWKjo3J7g==
Date: Fri, 30 Oct 2026 11:02:23 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] media: qcom: camss: vfe: Clear active buffer pointers after flushing
Message-ID: <2e978b38-bfeb-4120-8ffe-285d7afc8195@nxsw.ie>
In-Reply-To: <20261030-camss-fix-v2-1-51fe96b348cf@oss.qualcomm.com>
References: <20261030-camss-fix-v2-1-51fe96b348cf@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: bb788ac2e24ef4863756b9a446a9821755acd510
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/10/2026 09:47, Loic Poulain wrote:
> vfe_flush_buffers() returns all active buffers to vb2 but it leaves
> output->buf[0] and output->buf[1] pointing to the completed buffers
> despite the lost of ownership.
>=20
> This can lead to subsequent flush or completion paths operating on
> stale state and potentially completing the same buffer more than once.
>=20
> Clear the buffer pointers explicitly.
>=20
> Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
> pending buffers when streaming is restarted, but nothing guarantees that
> enough pending buffers will be available to overwrite all entries.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c2=
5a7
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> ---
> Changes in v2:
> - Remove unrelated changes/diff from this patch
> - Link to v1: https://lore.kernel.org/r/20261030-camss-fix-v1-1-ecc170342=
d0d@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6=
e57f484a4e41898 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
>=20
>   =09vfe_buf_flush_pending(output, state);
>=20
> -=09if (output->buf[0])
> +=09if (output->buf[0]) {
>   =09=09vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
> +=09=09output->buf[0] =3D NULL;
> +=09}
>=20
> -=09if (output->buf[1])
> +=09if (output->buf[1]) {
>   =09=09vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
> +=09=09output->buf[1] =3D NULL;
> +=09}
>=20
>   =09if (output->last_buffer) {
>   =09=09vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
>=20
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-camss-fix-4972697ef90e
>=20
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

