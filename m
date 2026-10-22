Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672308;
	b=SFfKfCIzERJqvI8KjHYo0UEhYBc80yHchAsvRE7TcZpp60cy5dHoAQB972R45F8/nCXY
	 mA8IbIFIVeY1OkQtzJV6DDL6gcUpZa/p1CkuhnMd0vZNpAEY8CtTZGse9zagOx/DexxBw
	 oNk4kiwe3ITo0pyfsrVim1BX4JS+WKqIReKNWBpTuOtWaYeEKVHnfYhwuQoiO99K6WBdF
	 +7kKrZ9/sTEQkhBxrJ9XjnqznBzlYn4Cyt72pmyU2EZJOiAGt3PacnfiLR9/Kx51hZC6o
	 zawLBCwYE+hrVVNtw5E++2Mp8Oh8s989CBBadLCGORBeZ9B6gfOSnxXgsq2C1Z40DSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672308;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q3ZydI37OZ1HttKtAROplMoe1pmYAu4UxWQIezUQ4ds=;
	b=vTtxIf6PY8VoKsWglXg1DhYscO4jMruPM5Ws5wx5pmZ/Oegik9YfltoCyAzowp/NSN6u
	 6aNFQdScyPqF7cUhBDwW2Cdq8K0DNMIzUmnLK7hya4ufK4eTR5jOHUSqY69QugZ1Y8hZC
	 bKxqAlyX2r9nn8wYLKFTiCke8BPcWV4uruF9GzZvrXqHzropQX4nOmOL+ul8JP9x0fvu9
	 7Q9IheCWAmoHvr9QjdFkrDD2o73Fep+TgjVfDEf4UbYhmqH0lYZLXnkgi8r7RGXOsw/ZG
	 +lrs+4g/bw78JMDNAgsUQkSoAB20fLEKDUvuCuJsW+KBkIH5WSxL3vVfYlv0b5smZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sezginduran.net;
	spf=pass smtp.mailfrom=sezginduran.net;
	arc=none smtp.remote-ip=93.77.172.89
Received: from forward504e.mail.yandex.net (forward504e.mail.yandex.net [93.77.172.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF64606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF64606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-64.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.yp-c.yandex.net)
	by forward504e.mail.yandex.net (postfix) with ESMTPS id 4280BC0297;
	Thu, 22 Oct 2026 15:31:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64 with ESMTPSA id XVbdv29gRKo0-p52WTBnr;
	Thu, 22 Oct 2026 15:31:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1792672296;
	bh=q3ZydI37OZ1HttKtAROplMoe1pmYAu4UxWQIezUQ4ds=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=oC1uG78peWml1zjKElT5ZbosVOTtZavm/eI0u1yAOxdsxXxX26SVdkFnqpW5eB9l0
	 rwq5X4kG6y/Lwd17sfJ9CvjswmgZHLTadjI/yLFS7ozUdFhBSXZlN+lS+sLe4Y17xM
	 HL+IA+bKyCnqsW9Ej1HzcGl9UHbMIhlCZPoM0I9s=
Authentication-Results: mail-nwsmtp-smtp-production-main-64; dkim=pass header.i=@sezginduran.net
Message-ID: <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>
Date: Thu, 22 Oct 2026 15:31:32 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: rename
 rtw_setstaKey_cmdrsp_callback()
To: Linus Probert <linus.probert@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261022122234.443631-1-linus.probert@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20261022122234.443631-1-linus.probert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 3:22 PM, Linus Probert wrote:
> Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
> in order to conform to kernel code style.
> 
> Found using checkpatch.pl
> 
> Signed-off-by: Linus Probert <linus.probert@gmail.com>
> ---
>   drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
>   drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 9fc62cb1ae01..81aef5ffe685 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
>   	{SET_AUTH_CMD, NULL},
>   
>   	{SET_KEY_CMD, NULL},	/*20*/
> -	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
> +	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
>   	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
>   	{DEL_ASSOC_STA_CMD, NULL},
>   	{SET_STA_PWR_STATE_CMD, NULL},
> @@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
>   	rtw_free_cmd_obj(pcmd);
>   }
>   
> -void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
> +void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>   {
>   	struct sta_priv *pstapriv = &padapter->stapriv;
>   	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
> diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> index 75a774f8c4f3..9b801a61b69b 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> @@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   
> -void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
> +void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   

This driver is going to be deleted in the next release, have a look:

https://lore.kernel.org/linux-staging/7e53bd59b7b146caabebeca4347674c7@realtek.com/

Regards,
Ahmet Sezgin Duran
