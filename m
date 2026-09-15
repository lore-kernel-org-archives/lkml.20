Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AC3A1A55
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459105; cv=none; b=UbKN/Q3IgBPCK4YIGm4gOkbKDn/rza7juRJVs97i6eahEipVjf/3ko1D3I2UCOZo8h/B8d+GxOEW9In3fKivRsOI0RcaAwaY7/jYvED+gS9Og94yPzRfjVEN+pW9aN0Iacsb1ZgmZLXBm+y1iBs+tFCit0fNPv47zIWLVHna4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459105; c=relaxed/simple;
	bh=ld+zAQZvreuFI/Niavki4jrtLwrfxVLG3N2M+Al4Ybs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbhXrQ2lUL/8GImQEGXnpyoCpDu10VopN52MGlJcqP3ZcnS5KTjU6mQdyk1mbMfBzYCRdJDLY9BpTrn81hXAksRvvFDxiaHe6qxBb3VBixaRhMOn6Bcvad3DKnWcqtcEU/oetkmHlUbqzoR9SHqV5mpfnCyg606+tSh6hz6eFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrE/SRla; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrE/SRla"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso5407958a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459102; x=1790063902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7YW75YqJGurWAq2WY56DRuhTmlKAK6YOaluv7gSzBc=;
        b=FrE/SRlalGhafrZ7ifzSKI9ozf41HCv7lJfdh7z38SX3FqdQbgR7ktwOYlXJd90TCQ
         o79LnJIWbok+j38/N2cIukzRiT9aolADNCYjhVGI1F4TT65z+xtskihpGfbArhR6TMRf
         4H6byheaaC3NCbUn2GqKVYus/qEcXX77xifjiV5qrKvNX7P5n0b+Nxyia8JRY10vvDcX
         chhJlvlfotQ+wy4puDpbVzjgUlfwnZH+EO+tPBgdY0PjE7kcShzewWaJyfpRGWoytKoL
         4oppUXoIskilD0UXJYOdppbWHZpG3A5buJrpdEC5MzyADwUEcmetDjSAFMozLMOv7lOf
         oKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459102; x=1790063902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D7YW75YqJGurWAq2WY56DRuhTmlKAK6YOaluv7gSzBc=;
        b=QR7fb2x3NF+/3b8vxHVfL20jy5NtEIbLkOLUN/JIzDnaKwug93vIo7dV22fsqReiiV
         q2Jf1JeYXNaBYem+C272jL2pa0LCHcuDQsJXwg2kkqpC/LmE5pedo+dtBrdp3ov475fm
         JrZVoIucMb4VVwCUbxcdha46CdZUCLFh2kn0S/HUvzMUdfg7nMJHnDiXOSklCLfI/sLh
         1+8JsnzE1HoLprFq3R2wxI3FzDCUrZSI9jnmekqRm0w3qW2qkuRcvPKVuHuTma9Fmlik
         OFDjX4uzy9UQ+ifSXVdCTkU5bfT4kj2cffnvQJJnuJArz23xWkemYVdm/xTWLSg+apBc
         s8sg==
X-Forwarded-Encrypted: i=1; AKwUvByXCEbVfnZA47a9hN58UskMiSfQdbWcWBoY4i61UHegS9ttuUY8JQ8cOR+MfhWXN1p/K5SQ5YZS8ML14zo=@vger.kernel.org
X-Gm-Message-State: AFuF++mH0K5QTuVp0PKlESuwS9CaxkkUdBY6gYRrJhZ5QVyFn9ZNhbks
	FtPr6pricFraJRj3aUqlc0Qw0tmGR5waC6Ba0VBl+PRcGjVkXlU8M3+1
X-Gm-Gg: AYBFou0NS3NypXVl7hxzHb1eRaUdanB8QcIGxgXOqTqENJAgq7U5X5RTBVPxYWhqlKk
	JcCtfWp4Swys5scjYbc0tCHPs5FmaXN2Es5GWFJDO4FUtDM3VvnEb51FirWS2KWT6UXFP/AIv8A
	cE8F+I35/xEe6/Ap6n4z/A1WgIRzcRSGL9yrjrktMmUrpSSP8h4y7DY8PBdWX2cw/p8dHvtnHcl
	/pb58x8fgEoQ9/IH4F3++tZg9uIuQzfAJtN5QxC7Sxffj2AgfeE0gBuNIKAz3qHMF29kDP5PSPj
	ELxupf/rAcjFi/g2+ZqDye03ckBMob7+hSMzk3n1b+rTfV3NN2AreRrU9he558FXHO7rfu6fjBc
	eGby2EQniLbOvQl/30XYjn1uwiGrrOJ+0rccrzUDoKmH4v8oUcBeSBX1CGJPi00dKWuQFTmRjRm
	gbONev6cey79p/MmPmHtuNmj+DSLYz1fw5Mwj2Ao60IY18mxHmEal84g0fxaOxUDOt+u0=
X-Received: by 2002:a05:6402:274e:b0:6a9:cb12:b867 with SMTP id 4fb4d7f45d1cf-6a9f62134f8mr4169183a12.9.1789459101475;
        Tue, 15 Sep 2026 00:58:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm5243054a12.31.2026.09.15.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:58:20 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:58:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH v2] staging: rtl8723bs: fix lines exceeding 100 columns
 in rtw_security.c
Message-ID: <aqj6mUt9Q5hO8abv@stanley.mountain>
References: <20260915072923.1014216-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915072923.1014216-1-vladurares@gmail.com>

On Tue, Sep 15, 2026 at 07:29:23AM +0000, Rareș-Mihai Vladu wrote:
> Reformat long lines in rtw_security.c to fit within the 100-column
> limit by splitting function arguments, expressions, and moving
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
> ---

What changed?
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> @@ -112,9 +119,16 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		keyindex = prxattrib->key_index;
>  		keylength = psecuritypriv->dot11DefKeylen[keyindex];
>  		memcpy(&wepkey[0], iv, 3);
> -		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
> -		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
> -		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
> +		/*
> +		 *  memcpy(&wepkey[3],
> +		 *         &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
> +		 *         keylength);
> +		 */

Don't worry about polishing dead code, just delete it.  (In a separate
patch).

> +		memcpy(&wepkey[3],
> +		       &psecuritypriv->dot11DefKey[keyindex].skey[0],
> +		       keylength);
> +		length = ((union recv_frame *)precvframe)->u.hdr.len -
> +			 prxattrib->hdrlen - prxattrib->iv_len;
>  
>  		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
>  

[ snip ]

> @@ -1300,8 +1334,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
>  		/* conscruct AAD, copy address 1 to address 3 */
>  		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
>  
> -		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
> -			, BIP_AAD, ori_len, mic))
> +		int bip_keyid = padapter->securitypriv.dot11wBIPKeyid;
> +		u8 *bip_key = padapter->securitypriv.dot11wBIPKey[bip_keyid].skey;

Don't declare variables in the middle of code unless it's a __cleanup
variable.

> +
> +		if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
>  			goto BIP_exit;
>  
>  		/* MIC field should be last 8 bytes of packet (packet without FCS) */

regards,
dan carpenter
