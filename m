Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5633431E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426267; cv=pass; b=cYhCyOnWj40sCVEoAtt+7rCOIJdnWsEahj9WfHMCztxF/9hwrhUUMgq7MpgQO+/t1uPwnQuw0u+MgWeKIZ73J5zYmcFaEprM2MJAs/2h6LD8o/iVxyWP9ZPMmmdgCY+HbYA1wyRyDlYA2TSSF+yFnPpqOwlKJtoCrhOhAaxbemk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426267; c=relaxed/simple;
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MfWGL1gz9sjjiBNYh0OUzx9R+/703zvLAMoc1g5qVUQw7HGjDFn29TzHFp5g62/0+DqGN/NJFJJwsE4hgrJRb40ZZEiScGx3W3dtGaooJhCF3oCj59LL1YOoAan5vo118At2DMv7sS4jhplJmOnO6I2ytIwCBEmSP+J7MJMYjf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=NtirWF7a; arc=pass smtp.client-ip=165.173.180.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="NtirWF7a"
ARC-Seal: i=1; a=rsa-sha256; t=1788426249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L1MFU3XGjQR3xnEmm/yOzXINoJasZTga1rCeK4laB3qEHzHB/D+vvXXibA7CEPdTDb9oRjRTOaBtA1KU2XoQyKzo3wVAWS0KVy5UvjAG3TUcxoMCEwP7wmZaE28bwbcBPLAVO2gBrCji2LZcTy9IetQw1pq5t7mzN3mrb4Xww58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788426249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=; 
	b=DTpdkBW74euXRal9u1UOinYclu9NIp0dTz+WnXvr+hE/RXmZkW7XSYKCDowWlTkpbJl5CCf+/B7NDXJFqCnvFDjmSlsy7B6SzKg/3gB5ZReOIWwo3caXr+mBeWN/PgBvljrAEzlJKAf7ybitsYIpJU+dyox9oPaLbwFjy0gTaMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788426249;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=;
	b=NtirWF7a0Cc0Lh1qAbupCDbyhSss1cFAHIGDmN0w2pFsGHTLTRxCQLcjd8cF/n49
	AwqVpUMcmweeNyTf/wqZ5uswcM7EsKaJPczjzMFptgivpiGlKEfz91y2BaKcD8Lw2Aq
	ui55znASyqR06/I+Tw4rIw5k94afctSVbMdBECAI=
Received: by mx.zohomail.com with SMTPS id 1788426248393643.0972373499999;
	Thu, 3 Sep 2026 02:04:08 -0700 (PDT)
Message-ID: <2c8405eac9e72409154c98bb31b3fbed10be5755.camel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Julien Stephan <jstephan@baylibre.com>, Chun-Kuang Hu	
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias
 Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tommy
 Chen	 <tommyyl.chen@mediatek.com>
Date: Thu, 03 Sep 2026 11:04:03 +0200
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
References: 
	<20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Julien,

On Fri, 2026-08-28 at 14:10 +0200, Julien Stephan wrote:
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.
>=20
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for
> MT8195/MT8188")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> =C2=A0drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
I've checked in the MT8370, MT8390 (MT8188 variants) and MT8395 (MT8195
variants) datasheets and 0x8f0 offset is indeed the correct one.

So,
Reviewed-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Regards,
Louis-Alexis
