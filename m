Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [31.44.14.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F393DB63D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.44.14.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335336; cv=none; b=H5ePfaBC2F0vnvuiASmk9BHGfaUSAKpiLsZHaaUvViizABVB9xtMWDPLMtNiNs5+7Hi3EgHmPYdzWVctN18BCAYkNOaeVtk4WOmqd8+RDU6olshsG5SKJ+QnbswbvfmgH8uffax0Yn3WR9jDxBh+W0Qw10i1WKQkz8pDI5YisUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335336; c=relaxed/simple;
	bh=bVN1KRp2DD/OQeZrxLjQ0/qs74wCu2Winmbl1HuiY/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4bmoWTF7i8fkI+7vNYmYyszo0ov4CDeSYU/zHeJDFehrufIom+gvpFXggTs7N5utHwSfCJZvKcnIyImgfNGKl5OsruP8ARSI9ay8wfghPFCk4wR1jLOcpnLoq17fqZ2bGdj0vz2N59Nm+rmvE/vWkSW2ZLKHRNUxz4rb2VHKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=fail (0-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=PJr8jEnS reason="key not found in DNS"; arc=none smtp.client-ip=31.44.14.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="PJr8jEnS"
Received: from mail-nwsmtp-smtp-production-main-68.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-68.yp-c.yandex.net)
	by forward502d.mail.yandex.net (postfix) with ESMTPS id 0115EC013A;
	Sun, 18 Oct 2026 17:55:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68 with ESMTPSA id KtZTV1Od0eA0-hlnsRmK8;
	Sun, 18 Oct 2026 17:55:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1792335323;
	bh=vzBVOUtKyyoFroNm4iVEpmcXXVes3RUOJ8PFQFjx1gU=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=PJr8jEnSpkqHoZ14IgIN7gVD7qreKkY3+paZ/mAalTf8BN5QTyoUQh2aL5Bh6tB2k
	 UqTqfVQr0/mqNDvrv1CPYgiQHFqdPIiN5Cz/pevmXEb/sBt/hX9lKTdkZPoy5mGP/6
	 5twSE/hHyDbzOuhBiXTUeAMhMe5lvfCgQZL8rRNM=
Authentication-Results: mail-nwsmtp-smtp-production-main-68; dkim=pass header.i=@sezginduran.net
Message-ID: <7ecae15c-ee7b-4e14-a63a-e870564d160e@sezginduran.net>
Date: Sun, 18 Oct 2026 17:55:20 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] staging: rtl8723bs: remove empty if branch in
 halbtc8723b1ant_RunSwCoexistMechanism
To: Nithishvelan M <mnithishvelan@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jennifer Guo <guojy.bj@gmail.com>
References: <20261018033144.865-1-mnithishvelan@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20261018033144.865-1-mnithishvelan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 6:31 AM, Nithishvelan M wrote:
> In halbtc8723b1ant_RunSwCoexistMechanism(), the if branch checking
> halbtc8723b1ant_IsCommonAction() is empty, leaving the assignment to
> preAlgorithm in the else branch. This triggers a checkpatch warning
> about unnecessary braces for single-statement blocks.
> 
> Invert the condition and eliminate the empty if branch and braces,
> simplifying the logic and resolving the checkpatch warning.
> 
> Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
> ---
>   drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> index 0613beaa37..dfe921033f 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> @@ -1903,11 +1903,8 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
>   	algorithm = halbtc8723b1ant_ActionAlgorithm(pBtCoexist);
>   	pCoexDm->curAlgorithm = algorithm;
>   
> -	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
> -
> -	} else {
> +	if (!halbtc8723b1ant_IsCommonAction(pBtCoexist))
>   		pCoexDm->preAlgorithm = pCoexDm->curAlgorithm;
> -	}
>   }
>   
>   static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
This driver is going to be deleted in the next release, have a look:

https://lore.kernel.org/linux-staging/7e53bd59b7b146caabebeca4347674c7@realtek.com/

Regards,
Ahmet Sezgin Duran
