Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178144;
	b=BEso6aijCGfBErcvcqdctqDrG2QDYFneNJGNIQg8TVdUPQjc2Y8d0/s/rYZgWJta9eYS
	 ct/z3+/Ypsk9OlQ+nq7SfdWjJKmXYXLjfX4BfCs8+UlwI5r/TxzCrru0vnzWAWvsGZLM2
	 52Os48al/PQLqLq84iCXMEiXoZn8gmhtIY0MYXHllHStWkcLvP+m3H+fP8VFk13eYssA2
	 2eEtGz7MBgnR+xL3tTM1vkI/wrsAt7d4x3rnWXlGCQ72ZYArUbHL8zf/3Cp1N63Oi7Ddr
	 RN/J8bATYCt/fSH9rFSZNZjCOO0FUSWINpxnC57A40o0TPfAvuVnx7x53LAur8146Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
	b=xTmHEluvpeKxnAv8geNqlgVSXRu61KWOJFWEa+r67DjKn/JUjJZND05ybFl6Xs4XT1Xq
	 Q8g0OPLYG7Z1k/19G6AaxTTXdh9tLh3Ebq5cfekLRZ8sTpmOBEUewDmcq/NkRfONoOI/c
	 +ekg6V/5gucmkpPaxVYPLkAEreJQ12V/Pd3rLTB6lkGnUFMennBWcZUfdgyfaae11dNzG
	 G2aN5bOSgWtQQTJIAPMtiTnyXYKTScSn+EqU9mFxjAkZqPGy7/pUxcuyLJh621HtSYMFi
	 dHwWFBjIOGBbVOpwc0OqMm93hCc2EXE7qbdB2LlDhzH3vCpi9cpt48Sqq+75FsoQohg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMjuJJqQ;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EDB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EDB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMjuJJqQ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso319189a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178143; x=1793782943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=WMjuJJqQEieWppwvO1baYD6Mf7PCfEoQtWeF8Sp7ea1rMGjpU6FWbaKIWoNqDibVHU
         i5AU3opSogd3nC6tqGIXZsrkk2WJfNo6HaAnYWEDFOMMbEjj10XtQmOQP3+jd6IEgu9m
         +roJmSNfySpcq0NGKLakQ6h8ecpMUsvIEybKD/fdJxe7PfVAzWtHSakz/UsO+qo/LjUV
         OEyerTjA7IMl6SLphu11DHtAE73/bKQtQiXzpgQA+sK86ywz9KAgPZhTHO+5OgiESVZ3
         izrequLpCAltOW8gQi6DaEcUkg5BeNwGjMFzAw9uPnzPnNhTxXstTMgyHGHQT1cSe4Zm
         MX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178143; x=1793782943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=EvISVsExaYDcsLvBVqnQnmdxNGkWFlfIxRsMdLYHEfVEWS3W7kQ4SQMjakeMPkrij9
         Gwv+XMzHm6VqkLvaRRRkSBLqCn8gKf/1p6eRKzYKrGiseFFpGjs7Z3v/WuRVeg6x7m86
         d+qEa9L3aE+NSBbY+J5Pif09F/Im21j25gCf32wE+jnEgZoe6koIoXanNLVNN8+vXhjs
         F0xEjbBY7QTNDG3c9fkrB5mZinEAU0/R9BPoAJ9CyleF1t94sOKN3ISPxBb16E5GXt2F
         B7aLF8lUeAaxfs3VXy2lDtsM9jeEkym0EFBakKaP8PFpfDDETZcC3DQ/1qPh/o2P/Jl/
         LC8A==
X-Forwarded-Encrypted: i=1; AKwUvBweCUr1pmO6EkzyopyZjxWyh3Jy43DCWbI3+j9eTN5qWYGymq1Yiuucuz1BcxbgCrMjp8bBFeCDNGdjVbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHl89VSuK5NCxQZZwU9HQk3TCCIk9kTDHi2wTGaQnFGB7j62mo
	ynwX8dp3NsX1U8cb/Q5K3mHhV0j8ZRDqosXXyIZPIL+1mnx9aKn22qMl/cgiQw==
X-Gm-Gg: AYBFou3ysGAE2nexg0jr51hMjemij0dHvWksE+Yw4pCOsmLkel8V08pe8k+WSSLGFl8
	O1axYPyYt7NwGiPVKIX4OHDvO+hnf0o2EnbhWhLDrQm8+UUqmkGx69MXkBvGU6GcvMeXmxXGqGd
	JfjUjF+PLc4TR2mtLv2GJv/PgtwnAqD2czJthveeDAGO3u7vdnFXXilTLbEv+yiNVTfVgcvbWhy
	c+m4YG53hJjDFzavaolzKuP/pV+2RiXjUkpa80q5LGZIQBce6nmSxbcY0br/omtClYb7Nok8xEE
	7gChHEoohUj8iiUNBCtuNC9cIVrHfto2RrrV24Li5Fy/Evoknj/eb57XeFpjzWDCss0iPNMGvUx
	bdKtz5LpHCaHLqhSBpKIs8eNHP0gwhBLyfryAzyzdsaLq9eAEymzSohmQUu6zF5HZAmxuXbY40j
	FjyhTfVBGtLGsZhg2RjxWfNm0bZBhcYzYNqiyaWql/Qk/srlVGgOLJmyNCnJcm7fu04/rpXBpmf
	zOzQJR5C5A3Nh9QVvYALjH++nWPZ8BkCPYvWELfbsrxOTbhOkOcxdPu7Zd9HUGGnrs15hJjk7Nq
	PcSDelfBfD/t5tnsZw90p5MoWzdPXqXjM3nERSd5SeyMFxLa
X-Received: by 2002:a05:6a20:9e48:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e9023e52c4mr1537814637.55.1793178142953;
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm3790062a12.8.2026.10.28.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Message-ID: <116227fa-96ed-494f-805d-ff54aeef545c@gmail.com>
Date: Wed, 28 Oct 2026 17:02:12 +0800
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
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/2026 11:16 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - remove the duplicate properties with dtsi for mqs1 node

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

