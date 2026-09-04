Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E13DEACE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511943; cv=none; b=evf6LAQpgpqQg9GUJf68d2sYz/tKDnqSSHR4zsvFoAHQhDBVZMXdaJo1MxFBvaROeh0W29N2NpUeaJ5h4e+e82hU4iez7fl3iv+7lknlyrIeNJClChaboFjY6uQ5PietE6uccDEJ2PB15bzG3XcvLG17pHgd2VIvCM3JYt9HfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511943; c=relaxed/simple;
	bh=iu1Id6ZH1mXL5I5l4nZ1kIGvKZv89vLUy86o/XSWjWE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mAawBbQV2Xe/p5+u7hZXN+434ogWv37es+Fpn3ZElyPqYziksC9OC19uiXXZhCOxDx8Om/cL8qW0L7IvSr3bSZ5f8w0Cg9Bjcny80IFMSLQNAKiQvvZbmsg3c0eFIlYqGz23W1tzPVFRhUiWTLV7F1jIYXrh/7y6WZa7vZBTKE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org; spf=pass smtp.mailfrom=sverdlin.org; dkim=pass (2048-bit key) header.d=sverdlin.org header.i=@sverdlin.org header.b=BeJLytZh; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=T4jrHjbN; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sverdlin.org header.i=@sverdlin.org header.b="BeJLytZh";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="T4jrHjbN"
DKIM-Signature: a=rsa-sha256; b=BeJLytZhry7mfpyiglLfkgX4RwzNsD8bqw1wSbbVUgWw6ryqGvbWnjZukriR00OmJuQxBSm5oHaBivXrMqV32MfDrh7crD7NxuScCXBN/29yxA8+UOHFohAvgLa2Ylx/TrdCsv0yI4T5veNHMEc1q65LLNkBvU1ntkhntVdJIo2vsgZE824yoBTVRnmOMU6BX+4UwXSqJxXl20TqIsJSOOy2/Wtyjax+CIT2iipSupW2fkoq8Aq1UU67QRTrYuvlhXEX4mBOCZ8DeVmwX5yDcIaC+nW0QIRquqnaFliZ7I/1/Loou1m+OFPqVfkbM32ykMwOyO1Hn5K9lvQ7QPqNAg==; s=purelymail3; d=sverdlin.org; v=1; bh=iu1Id6ZH1mXL5I5l4nZ1kIGvKZv89vLUy86o/XSWjWE=; h=Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=T4jrHjbNYmAjRABX1EP0NXoV7TZ7XClPj3QwKUdVQfXgbaRgcRKGo6lV19rCz8A5POOnQGH5TjNqdYdadKlO7NCPGGnXX6onk4/nh3ga908b5MXReO6/r09dKlS1Hfw0y+FJlBaDBdc8nUfo8gTflU3erFxYSwN5lPqhvWhTrmLlluB2bpNyImNfCb19JGHiVdZ2G9puSRpl/kZpfybHpkhf46xhJNI9xBfwwL25qfaloNIFbsjZlsOAZCQumuTRQzKjZfeuoej8Wne3srR6O7fKchz3oQhxaNicZw0q9lxm6YTxXk0izZkVYKipcH/g+ZfWTvf/uhTsVxMBwqHm7w==; s=purelymail3; d=purelymail.com; v=1; bh=iu1Id6ZH1mXL5I5l4nZ1kIGvKZv89vLUy86o/XSWjWE=; h=Feedback-ID:Received:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -572770541;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 04 Sep 2026 08:52:14 +0000 (UTC)
Message-ID: <84c4359a8b9f8db1a1c5102b91b1700759610b6a.camel@sverdlin.org>
Subject: Re: [PATCH net-next 12/33] net: dsa: lan9303: i2c: Remove comma
 after sentinel-entry in match-table
From: Alexander Sverdlin <alex@sverdlin.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 10:52:15 +0200
In-Reply-To: <20260904043724.2955444-13-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	 <20260904043724.2955444-13-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-04 at 10:06 +0530, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>=20
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0drivers/net/dsa/lan9303_i2c.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/dsa/lan9303_i2c.c b/drivers/net/dsa/lan9303_i2c.=
c
> index 3a09f3907f44..7b70e22371fc 100644
> --- a/drivers/net/dsa/lan9303_i2c.c
> +++ b/drivers/net/dsa/lan9303_i2c.c
> @@ -96,7 +96,7 @@ MODULE_DEVICE_TABLE(i2c, lan9303_i2c_id);
> =C2=A0
> =C2=A0static const struct of_device_id lan9303_i2c_of_match[] =3D {
> =C2=A0	{ .compatible =3D "smsc,lan9303-i2c", },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, lan9303_i2c_of_match);
