Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C003515DC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655590; cv=none; b=DnZGTHZpHZhnH7SwMEi0nli8jbLspcoc7DYUWzkG7qc0TiRC/srLdR266o6peF1vU4SbB+R+zF1/k4DGRaiN6VcShqOcknmdXzlOCXeLdcYBT7isBH4AT7szzTuNaSOjx/XTtCObJGOUc+04y/WlAjTEKw1M3vrn2IjmZow/yoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655590; c=relaxed/simple;
	bh=wMNhQ+eYspo2MxJfF9CeHWaZbuypHhZaD8KnLapNkL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8P6fwdU6mV7A7LPecvlmDeCbnH/q6eLvAz1f3JNEBK9jcHd6er2+yjXBcA1LPGTSvqBzBihOHhSMNNuPbQE52KHfvYcwXMcfhRO3vnA3ZophK5AS1VCSLTt/2LZMDTA6ustVN/Ha4r9tcTPXTJ8E3FfSlmH3KmAmX/36kzpnIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjNT5YaQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjNT5YaQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a17baef589so5198855e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655586; x=1792260386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2jVrgH55k3k3p8kJOIrXqSnnuHRHhh/LASrNcRGybI=;
        b=VjNT5YaQiLXg2bbaIBTT9SgvV9leUI6f6KqvbPTvO5UTr4eKNSsRph8HuCReK07Yxz
         XCOoG89ceG6Px2we4RTdXu/wOP85kA9GC+cRM2idDmxXP6iafz3R9OVse4lEqqNdraly
         ZLNFl81fzfiaVDtfd4MAk+7qOEBCDW4v056ngHhoF+1pTbalOkwgXz9QDfvPdfaB9X0f
         FkyBvzdQssB6YzHadRJtqDv/pcWSUwLCvZFLo9qq2SgUBZcbvJeERO2MVupQaWDt5ztL
         IryR3Y1m9r5E9q04L3ho5KqfsPhps+ySxfEv6WDgMDilFFa758VHpiAcW8J2R751mxXE
         m/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655586; x=1792260386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2jVrgH55k3k3p8kJOIrXqSnnuHRHhh/LASrNcRGybI=;
        b=JC+XJem+5no+hA2g3eR0aFyuNRnwj3rHwG0nJqz60DbsaaAcwtG/4z56wjwXiLayLC
         iP5AAQnBAA7411iGQG/Dv8rAAwWWGVS5Lldb3O1dy38qvLapEiQoHbTMhAY5fstHNnXz
         IO+kGfI/W0LeQ8RDw0uPAB7fZN08dWMI9DxeeG1p6S7UY002B43oAw6bi+T+jwIKH4IP
         VfdVY63jFqg8JVjU7MxM/MG/OmOc3rssVl+dt36lqahV/T/0zj168e+E3UYBygHh+dUX
         b1IUIdMjiYzKDOvmyA8MLcDKYl2indCtTcjrriQl44FtvNV4krXLGMPTiURQVujG1I+6
         yuzw==
X-Gm-Message-State: AFq9FYLX0N+uwjQhkQN6yqCuiJfVKu5mwVFyPokaiPd/Koy6O4EbqDOv
	ExygrS06r05sG5B7zOzUHo744cpgq0h/uzuVbb8+bAMH6Jal7XBXrnRy
X-Gm-Gg: AYBFou2V5iMyhR/THLjuokInCHJF3Qy5/EoxrEvBMp6L5MD3DJm2pN9nH/CmsCQJKDE
	97oW2d7C9CzY57JjO08xYXXWRY5mW8wMeliJTj1+egTK1hHLPYpAniJfdqLrA3GcwJZHE8f7cza
	fR6S4E6tz2dItWfkO8JXKSCEt1J7774OI1TfXOpH92LoGbA2AGdPCGuEK83jItBzWTFWppikrkP
	I5VuisMpRQPAFM/chsjWAetj/P+3YIYO4lSCShqiF83RRk8vCj9LB7FbTWQpgkLQGqq2bT9YM79
	uppeLRFbdJwXGLtllvaWiPW6A2FvKH7PMO4H7JJ2MkQ5yWmIe9u2AN5L0RpZ9MZkrPbUt0+WygF
	VD354blNy4CHjMoW03alTmpsfxCDk9zUrEhyP/5Zp1oVJEQKTxxkxztoTsuJk9JdzzhsSGO4A0c
	Q2b0vYGZ2iOtTGkeujsnYfud9xSkqeonvNBmxQ3F0mK14Gza17Y8wqIGlnZlZQ1cS3iz4GgOse7
	vj8dPGahScBm75DOhvB8ibsLTiUr/nRh3ju0ve9Fd9iNNUr/ZV2TufGlFzGyHIs56/4mvd69Ft6
	0w==
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id 5b1f17b1804b1-4a18e47a88fmr86024185e9.7.1791655585959;
        Sat, 10 Oct 2026 11:06:25 -0700 (PDT)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm187867575e9.3.2026.10.10.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:06:25 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xFbSi-00000000WC6-0NL4;
	Sat, 10 Oct 2026 20:06:24 +0200
Message-ID: <f130759a-1987-4d12-a4dd-4bc652c66670@gmail.com>
Date: Sat, 10 Oct 2026 20:06:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] p54: validate firmware record lengths
To: Heyang Tan <thy15333007817@163.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20261010033724.1924-1-thy15333007817@163.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20261010033724.1924-1-thy15333007817@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

On 10/10/26 5:37 AM, Heyang Tan wrote:
> The p54 firmware parser accesses component ID and component version
> records without checking that their lengths cover the fields being read.
> A malformed record can therefore make the parser read past the record.
> 
> Validate the component ID and component version record lengths before
> accessing their data. The descriptor record is also checked against the
> shortest descriptor length found in the supported firmware images.
> 
> Reject descriptor values that underflow the RX offset or produce an empty
> RX range before updating the driver state.
> 
> Assisted-by: LLM Codex
> Tested-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Heyang Tan <thy15333007817@163.com>
Acked-by: Christian Lamparter <chunkeey@gmail.com>
Cc: stable@vger.kernel.org

Yes, I think this looks good.

Thank you and Cheers,
Christian

> ---
> Changes in v3:
> - Simplify the component ID length check to its one-word format.
> - Use a local bootrec_comp_ver pointer for version record access.
> - Express the 24-byte version minimum as six 32-bit words.
> 
>   drivers/net/wireless/intersil/p54/fwio.c | 45 ++++++++++++++++++++----
>   1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/intersil/p54/fwio.c b/drivers/net/wireless/intersil/p54/fwio.c
> index a3d9053f043c..b19d054441b8 100644
> --- a/drivers/net/wireless/intersil/p54/fwio.c
> +++ b/drivers/net/wireless/intersil/p54/fwio.c
> @@ -52,6 +52,12 @@ int p54_parse_firmware(struct ieee80211_hw *dev, const struct firmware *fw)
>   		u32 code = le32_to_cpu(bootrec->code);
>   		switch (code) {
>   		case BR_CODE_COMPONENT_ID:
> +			if (len != 1) {
> +				wiphy_err(priv->hw->wiphy,
> +					  "firmware component ID has invalid length\n");
> +				return -EINVAL;
> +			}
> +
>   			priv->fw_interface = be32_to_cpup((__be32 *)
>   					     bootrec->data);
>   			switch (priv->fw_interface) {
> @@ -71,17 +77,44 @@ int p54_parse_firmware(struct ieee80211_hw *dev, const struct firmware *fw)
>   				return -ENODEV;
>   			}
>   			break;
> -		case BR_CODE_COMPONENT_VERSION:
> +		case BR_CODE_COMPONENT_VERSION: {
> +			struct bootrec_comp_ver *desc =
> +				(struct bootrec_comp_ver *)bootrec->data;
> +
> +			if (len < 6) {
> +				wiphy_err(priv->hw->wiphy,
> +					  "firmware component version is too short\n");
> +				return -EINVAL;
> +			}
> +
>   			/* 24 bytes should be enough for all firmwares */
> -			if (strnlen((unsigned char *) bootrec->data, 24) < 24)
> -				fw_version = (unsigned char *) bootrec->data;
> +			if (strnlen(desc->fw_version, sizeof(desc->fw_version)) <
> +			    sizeof(desc->fw_version))
> +				fw_version = (unsigned char *)desc->fw_version;
>   			break;
> +		}
>   		case BR_CODE_DESCR: {
>   			struct bootrec_desc *desc =
>   				(struct bootrec_desc *)bootrec->data;
> -			priv->rx_start = le32_to_cpu(desc->rx_start);
> -			/* FIXME add sanity checking */
> -			priv->rx_end = le32_to_cpu(desc->rx_end) - 0x3500;
> +			u32 rx_start, rx_end;
> +
> +			/* 0xa is the shortest descriptor in supported firmware. */
> +			if (len < 0xa) {
> +				wiphy_err(priv->hw->wiphy,
> +					  "firmware descriptor is too short\n");
> +				return -EINVAL;
> +			}
> +
> +			rx_start = le32_to_cpu(desc->rx_start);
> +			rx_end = le32_to_cpu(desc->rx_end);
> +			if (rx_end < 0x3500 || rx_end - 0x3500 <= rx_start) {
> +				wiphy_err(priv->hw->wiphy,
> +					  "firmware descriptor has invalid RX range\n");
> +				return -EINVAL;
> +			}
> +
> +			priv->rx_start = rx_start;
> +			priv->rx_end = rx_end - 0x3500;
>   			priv->headroom = desc->headroom;
>   			priv->tailroom = desc->tailroom;
>   			priv->privacy_caps = desc->privacy_caps;

