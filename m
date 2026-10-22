Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672448;
	b=FoJhqQdcyYa2IzBWqFQ9xMP+rxQ/sEFkb1vLCwA62WNYBNeeTCncchth/KjsImfaOuo5
	 VReINv0RhhmK4HhaFnbKhGzF9HHQ1Sh9zgEdqJBArGuBhyhYkDFV4C832o5xI2sXJ++d4
	 cGF+PSyEfJY1ccWzNBTYZcMv5xN9R63ePLv+XXGGpCLSlCPd2AjB4wD2bOngpMyYGt9MO
	 ShJqU4nqYCcOHqjDsn7Fc25BBa9KP7nBovInpoNJw67JE4l35VCNffC+1E/OFOoUQCicz
	 Z7STT4S+tUPpnEN+Z5PHGfBK3BVAPUxlcTEDeZzJeStKwWw/SOk0UWwL3d/ePUTgmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
	b=aklfXzXTui8pOWwXGXj7rOyyRMnXK9Gus+xHg7koVEOpKDUx6DMfzSssbAweBbVfGUnw
	 wcqIeGRxUKBy+vcf9MIZN3MuFmoougZJPqSuVotXNhY92XvQ/+dSwG+A5FkT1SYypr8J7
	 Mzqw4eB3BcSPTDFRm2Pwl/0DrVdp+NA/jKg3y+VcuVk05QyFtoWekkZCVmSGf4bhKjFIV
	 xBhy+jebSsy+0uWJLkdSNECaGJnDYO64jdvuflQhIYQmuUN+TkW4N3R7UD2BIOSkEmZQT
	 xd8iPkdDa6okuEHX/qcLcB3CIgo5kpJ0uIb6AZcNwROlXUjLNaqxuq/pOUREmybrWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B4UWeMCc;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3626606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3626606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B4UWeMCc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1515283f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792672446; x=1793277246; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
        b=B4UWeMCch3f3NmEB1UPs7MZ+LF82OBYGUo52NzS4/GrraZ9wu76XBo0uekwtiaPlYc
         /ce5969+eJ/QpTjM0hzC6pz7e3kv6LS5TogvSV8rTTY6oOLuiclL3c5CVTKGhxyWQRpj
         mc77Nzjcm11DpNgv+DIqGQcIk5RWo2YyaoWCVa1a7sKjl/Kue6BynEbya3NiwMSTg26x
         I/pCrNOKh8pxdfLiWIIV9NObqKpt3vJLAXL1ayB2ypDXKcyjPhLlWn16qT6Lu7eO94x8
         70KYKL/w94ZIAUnheTcqfDdGs22h4a9DfvQJrS/ovhiGEsxuRLcj1tNOJA70Nhx+tm4X
         IZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672446; x=1793277246;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
        b=02skHTLmki1b0vw7cxEePZqHP2mWvPKJzDbku6muGtIQvWVhvy0+p1rAx9YwsknWrP
         61Rzzg9OPVAe695XP0OzcFZxEFo1noXytbL8ItgOpxUjhvjXxgZnzMBJOF2LmDSUogxd
         DNDO0/Eo6QrBaXvmlP0E4gBobCW8iPQxT4574J+Tl7SZxNEexQ4RfODnl34wzHOi9SUk
         mpYwDlqVhLhva1HG7yts3f1ZRVvDrAdvLl57jJCEmzURmzK2wmvmpuS3iFc6IuLM50D8
         nZc8GJRUIXkPlSl1uWv5Mefo7GeYagne2ltGHIVBhcEQ6c4Na55FCD5vsDy+/45ZUdjW
         MAmw==
X-Forwarded-Encrypted: i=1; AKwUvBxnq05bcv/nk9RhdP5dFGN6/uAS+skuUaMhsDvJi53UlHjA5PjKMCtIs1XBC0WhFpalpSAtzSbo4gD2+9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7zyst6kA8KDx8I0t5IIivLfGeoQvkveHpUwYJVeOmf2vaH1bd
	2Cdb2Ydgrxz6JXy0goijsAxhJ4m8Az6v8N5hhCKC0E8yzjbc/KWX5hPZuU/vDQ==
X-Gm-Gg: AYBFou3N5hC8Blm6TKUav5bvd3mpDTr+jbZfpoeEGaNHPgipTQSv+Etzc32u14DtdoD
	1mj8Uczh3nU9SfP1l5p0EMX1aw0RP7w5wtyjlx7GeeGhwRgFjza9snoZ39bBhc7ilI4rIaUUSlY
	UUBm97T0YlMTbQ2t93HCO4EpS7ipPdi2ue1xegtfMP67l86Dk1gFUxYbh9exKEb9cGN5YYAKELa
	7JyhS0CdBM98H8Y+IN7KAqA21F+4LAXP/02pHDZ6ZWIT1i73PIBx6t05M/GElKvwbBoH4QJpqLM
	VTwnmuhuEvgTnuPAJ0w4Ihy9SMLNl8IEXd69nBhAr4QItpDidCJhotuGvzFVWmR0cDDdLTq7jC4
	FBDzeqYkDlYyMGstn68ytg30P38RIwunVXUqiaGtkw6f83GN/3kEmruRcFU0YoVQ2vIcTAotNWP
	4FMy+O97Un9R9cVsEQZncL2pUXhAboO3trj7EBOkrfcBEqNX1MJLsDKKC5oFOC8RbEH8Ns/PIYI
	/x63piXIrqko6BpjgMQ6KISBvQVnYoQZWJ4Pb/86jIum8uPPv04LyrHggHs
X-Received: by 2002:a5d:6f04:0:b0:48d:f3a4:610b with SMTP id ffacd0b85a97d-48e264bba16mr11294954f8f.25.1792672445705;
        Thu, 22 Oct 2026 05:34:05 -0700 (PDT)
Received: from localhost ([147.161.188.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm12345451f8f.11.2026.10.22.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:34:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 14:34:04 +0200
Message-Id: <DMBDCFV76Q2H.1AJ64YOEIOWU7@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename
 rtw_setstaKey_cmdrsp_callback()
From: "Linus Probert" <linus.probert@gmail.com>
To: "Ahmet Sezgin Duran" <ahmet@sezginduran.net>, "Linus Probert"
 <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261022122234.443631-1-linus.probert@gmail.com>
 <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>
In-Reply-To: <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>

On Thu Oct 22, 2026 at 2:31 PM CEST, Ahmet Sezgin Duran wrote:
> On 10/22/26 3:22 PM, Linus Probert wrote:
>> Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
>> in order to conform to kernel code style.
>>=20
>> Found using checkpatch.pl
>>=20
>> Signed-off-by: Linus Probert <linus.probert@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
>>   drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/=
rtl8723bs/core/rtw_cmd.c
>> index 9fc62cb1ae01..81aef5ffe685 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> @@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] =3D {
>>   	{SET_AUTH_CMD, NULL},
>>  =20
>>   	{SET_KEY_CMD, NULL},	/*20*/
>> -	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
>> +	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
>>   	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
>>   	{DEL_ASSOC_STA_CMD, NULL},
>>   	{SET_STA_PWR_STATE_CMD, NULL},
>> @@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *pa=
dapter, struct cmd_obj *pcmd)
>>   	rtw_free_cmd_obj(pcmd);
>>   }
>>  =20
>> -void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cm=
d_obj *pcmd)
>> +void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cm=
d_obj *pcmd)
>>   {
>>   	struct sta_priv *pstapriv =3D &padapter->stapriv;
>>   	struct set_stakey_rsp *psetstakey_rsp =3D (struct set_stakey_rsp *)(p=
cmd->rsp);
>> diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/stagi=
ng/rtl8723bs/include/rtw_cmd.h
>> index 75a774f8c4f3..9b801a61b69b 100644
>> --- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
>> +++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
>> @@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padap=
ter, struct cmd_obj *pcmd);
>>   void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_=
obj *pcmd);
>>   void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct =
cmd_obj *pcmd);
>>  =20
>> -void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>> +void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>>   void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struc=
t cmd_obj *pcmd);
>>   void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>>  =20
>
> This driver is going to be deleted in the next release, have a look:
>
> https://lore.kernel.org/linux-staging/7e53bd59b7b146caabebeca4347674c7@re=
altek.com/
>
> Regards,
> Ahmet Sezgin Duran

Ah, no. I had missed that apologies and thanks for the info.

// Linus
