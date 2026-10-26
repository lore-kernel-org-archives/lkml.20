Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007035;
	b=SnYHF2qoXuK/7OmFAI90FMtiM0qFg0zVHwCJOm/Utq83fgIe3ilK4orvRdwjMUo0Cj/k
	 X2pqOVlrdMbsIIoqbK546rYYcw2YauSXyTg+pcVtK7uMN44T0EyCWfyJ2i0carqacCL/j
	 klbW3vbTNzIVO2ySQqYfQyXGVy8tTOHkdgS7YxbkyGUXle3U8JSvw6XCe4EmT9V+om2Ax
	 3jefufgLxG0Sp6VgHXdNgfEAgtJPQFQ8Ves8k0z+8hmCWNvanuF2N1EOFI1P8Aru9GubF
	 qxVPcowlArqus6eF2Wm7e+uE9YboPkGEYWp+TETzO7neVNuN5o29DAUGqVrtAVyJK2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
	b=DOl4Hez+U6IMML/Fwrezy++yRigCajiTpLtv07O8u3dDCQOwvfup1B2Aoo1zJJAsbpy6
	 omdp3f9Z2Pd5m6KxG78RVxhGZoAy+Q2rcGHdfETGU8G3shmszdIgwxTSD21ZlQWCxvk99
	 tY2stHZ6Ae84+8PUSFjduwp5JJNENGk0gS++sLACIDsPuQo0fqBBUOugm93F6xwcRpsip
	 1LVueEQbk9D7kfSJbuf1ukqyBnzMK452ADzNm9Ihm/zWEeH4wysjly8iQQsAnPWtqd4hK
	 08zHUUJhEtSH8G8utBNoBppYPqixCGRYDb4Ir8pTmEZsDXvHxHY1yU+Nr0nyYxsZ2kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1EizSir;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FE606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92FE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1EizSir
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1904696b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007034; x=1793611834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
        b=X1EizSir/SPFC1iekp3/Ythb9HqjSwTXCN91i7egrkmk4EYyChYh4skg8qNN6YZKjG
         wXzcJdIMeKBFzSP0K1ePX1lsMvzM7gDcxJ4grEU2ZnFFOAXlML33Q6rGLj8IXv+0D7Av
         i4XZujl0NOm1a+yu2jrxx5j3f4yQpY0NCErIuA5DxxYZLY42EBRRGhk3WXqsRRUUrVT3
         GM17cV3bntBGvYAmiA45hnbap7exo1PvHdzq1YXgmRNCW/O8N41hCxufemiaqbDeVvYg
         cGDBKI75NNvJUhiO31WEEo/Xg+wBbYCQuN/OON5vN71ZzlD6lF48DLQ2ewBtFohGCcO/
         f/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007034; x=1793611834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
        b=pfjpKXS9R2a5BQhdbz0Dt6Lm5G3anJqTObDQreDt5QPnpkZ69xz2fbxi/Tmi6TznJy
         F/DKi0QQdzaKNxZ1eY+CevbaIKnORO4wUCsxnvo++ythIazrysA0FnuXVgRId28HKp0r
         SGbT7Z8MtEeRcaBJEQTeTdUwqNWtKjGldttxEk9da55oWtd84iOfIIZAeYrxjGblIy9B
         GNkMoKgiZIn6QcvG5ldTeel1gUjv05WSY4Nm2BIaAkxC9uHEXp7p4HY8DP8uMc2c1+EG
         rs8daxADo/RMvlqNLixhWFwhAE5ByIUnOvjwAk3GAt4CqqdzJTfqDv6YArE+MQwQqFYG
         CsLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9uelMRxDlRUyTyRsoAgF6rZo6TQVioUTnXpMPr65O0vXI0UKI9c1oW0txa/HWxk+VJ9bhorBdJoBnxn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYMwhO63ZxQci+cscAEaDeMB0L/TS0e8larM6Psi3fVgVyUSni
	kkDx3OhAygjcTx1MaasYMbZ4tXqWorvC3iVdDuMLMKtsE0vTMRXgVhga
X-Gm-Gg: AYBFou1H2yWinsgCHXoyG8ypEA59drgV/rTBkawyZkmuSth/81hoXLdAk5qxf0Jv8Oj
	NMmR8f5nTH+qLlCchXAOLaWhaPc/4Ww82c6lEyyHDOL1QxSSCrxk41dbOR9gOfk+mhIFtseQxMu
	eXbv8tB6G4VRSgF64cvWHqaUFjEjOtiQE34F4r6s8ENZgbxHbQHQtQkK8a1XF4Sx+oIkEUwJGaU
	ymiVJJGuy7aJ7pfXSJRa1JiMptZwnHiHyvwCo68FT1+m3kMWAN8OuL/KHoaBwzt5w4/GsZFR7f7
	ldpksPR3Y9DwRpECXFSbYHGWjIoec96ZTm8i+oS+sB1/BHBgkw0LHeMhivGGnv2e6rIIySBOJ/7
	I4P+4nM4bWrjIIrbA5V7rpIGzn4k0ltMxNJxSLMbXS1KjJ48G/HUF3l7fvm0voXPpfbgUC96ZIl
	gX2oxRhovWj5uwUW/53w5NfCytOVuqqa+YXhFK/l9vnwrQ2GZrNrbAKZaV85ebS7VKHJ9E5UbjU
	wXX0YQzbn9HndE/zdTld8QTlDstyjJ8jYTj1jcNw/jQkZD+imJuBTyAKctnfidCyjNB6iHY5/TS
X-Received: by 2002:a05:6a20:4305:b0:3e2:8c65:b229 with SMTP id adf61e73a8af0-3e7bfa30602mr3664594637.11.1793007034252;
        Mon, 26 Oct 2026 02:30:34 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccccf37esm1395979a12.27.2026.10.26.02.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:30:33 -0700 (PDT)
Message-ID: <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
Date: Mon, 26 Oct 2026 17:30:29 +0800
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
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-3-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261025195456.43414-3-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 03:54, Chris Taraszka wrote:
> bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
> the PM core, which aborts the whole system suspend. This happens on any
> machine whose firmware reports a SystemPerMode value that is missing
> from its profile table, and on such a laptop with the lid closed logind
> keeps retrying the suspend, so the machine stays awake and drains its
> battery.
>
> bitland_mifs_wmi_resume() likewise returns any error other than
> -EOPNOTSUPP from restoring the profile, so the resume is reported as
> failed although the machine is fully usable.
>
> Saving and restoring the platform profile is best effort. Warn and
> continue instead of failing the system transition, and skip the restore
> when nothing was saved, so resume does not write a stale or default
> profile.
>
> Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the same machine with v13 and this patch, without patch 1,
>      and the firmware in 0x04. v13 alone aborts a pm_test=devices suspend:
>      
>        bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
>        PM: failed to suspend: error -22
>      
>      With this patch the suspend completes, "Failed to save platform
>      profile: -22" is logged and the firmware is still in 0x04 after resume.
>      
>      This supersedes "platform/x86: bitland-mifs-wmi: Don't abort suspend
>      when platform profile access fails" [1], reworked on top of v13 6/7.
>      
>      [1] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 73be63146fd5..df9a931fa939 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -237,6 +237,7 @@ struct bitland_mifs_wmi_data {
>   	struct device *pp_dev;
>   	const struct bitland_mifs_quirks *quirks;
>   	enum platform_profile_option saved_profile;
> +	bool profile_saved;
>   };
>   
>   static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -408,10 +409,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
>   		return 0;
>   
>   	ret = laptop_profile_get(data->pp_dev, &profile);
> -	if (ret == 0)
> -		data->saved_profile = profile;
> +	data->profile_saved = !ret;
> +	if (ret) {
> +		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
> +		return 0;
> +	}
>   
> -	return ret;

What value does the firmware respond?

This patch fixes the suspend problem, but it hides the real driver 
problem (unsupported profile entry).

I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi 
Book Pro 14 quirk".

If result.data[0] in laptop_profile_get actually equals 0x04, the 
function should be succeed, but it doesn't.

Is there another no_set (for read only) profile entry for the 
performance profile?

> +	data->saved_profile = profile;
> +
> +	return 0;
>   }
>   
>   static int bitland_mifs_wmi_resume(struct device *dev)
> @@ -419,8 +425,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
>   	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
>   	int ret;
>   
> -	/* Skip event device */
> -	if (!data->pp_dev)
> +	/* Skip event device, or nothing was saved on suspend */
> +	if (!data->pp_dev || !data->profile_saved)
>   		return 0;
>   
>   	ret = laptop_profile_set(dev, data->saved_profile);
> @@ -436,8 +442,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
>   		}
>   	}
>   
> -	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
> -	return ret;
> +	if (ret)
> +		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
> +
> +	return 0;
>   }
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
