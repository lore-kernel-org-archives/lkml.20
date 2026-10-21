Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586187;
	b=wVFavhD6HqrE7Zy+IW4mS0aE95m74NtmVqy3fDuxVVbBdvtvmrJUdi7dlUwUmuw77d4t
	 iT4QXIES8FPMTKDIDT9UHX4/gCxBIznvehFsTtDeuVIX5FuDcL1Iw7KTdOTKAQlti76du
	 Ot3DqwtwkwBCTGpXYUCfgY+QlhoNz7JIIVJKkzojwBJ+PXRHx+ae6H4sK35TRkR0WFz6S
	 RtZf4y6eGGiSBg8B0jyIpaQW77jOVR+TKP+rFhoi+TKsVty1CSEkk1KImbmqNAPg6i3qo
	 nqc24zt0ha0uyrugd4p1tWcBZVKzS9brYibfnDngLp2QFNxmmG9xpUUL9TA15qdi9aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
	b=YiPRbKCcTePaZ5xMKeg5IvpNm+7U2xVzaeT5Vq6uwanwtRwBeHnQzf8QZQiNydDv90E5
	 ETSS3c177FBst64+1thabtAeuaSwXku/sW+4gN8vnAl1w8XVqN7BU4W8vw8PpJWxYw9EM
	 Ckcx4FLhdNcg+wH+eDTbBzTXscU4FqjSo6ykSqwbZyPBE7P9mfOd2GeKI39S7d0Hl0FMd
	 u0Lf892qJAEJksFOS2gACQsN8K/DfH+u+3Zsco4JTCFUcIIky6FjNSdvYI2CNat9aCt9T
	 bYNaoeeZOKK/jzFcERDcKWwrO1p6Ov/bjG9p4T31/hba4XL7iWnkYUuZue3NziYvfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qgLDCNV/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135660A4ADB
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4135660A4ADB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgLDCNV/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36681e85e87so1304517eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586186; x=1793190986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
        b=qgLDCNV/ZOF0YzIxaW5n5UDtDQEI4IZeI2Z8Wv2mfwPgd8Vnx14Cx11H1OHmGicI/d
         qEKDqPOFGd8HjbRAMtFvf2kItK0as75Akc37mOWCkNCT5Q5aFgmnrz18ZwAUs5vYc+Qt
         DCH4WSWz6nJxd6ASBDvG/WckvCRE66XJWxv4i5KxJHQpQFKzROlClrc/NH18zHPUliQ1
         fSpZOUr6Mi+HuuwP+dqZz8hLLMvWdumaId9eBTVsIl4ji2cpPH+X6V9HbGvMAbi6KqQY
         p1vhNSBJ3A3d5xsyVlb8URFgmFskmbKbboGXuEQ7mzKYT3A87QxvNpm4GzBG0Le1rLlU
         bwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586186; x=1793190986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
        b=ChCPRmzGplncJHYPoNXTCb5XUB5ebafJa6lazh5B9STnOMtHscM52stgvKVuSPhtbB
         o0GzPDczeZtTUi3yLqqxyHnouD1JRTFTGZSytu928LGtHm6gDf7ZqMDFCdVdVo2Rbaaf
         oANL0DILFIVFNR/snPbeNVGoYmkxUJuuMaJ+BT9orPbk86ufbuwglzu1Up+SWj647VqK
         14Y+0bNmw76kDhUekIpFaxWmZky8Pr8YCVFEtFdKqBxXxpe9HBTY26y5U7TpJoTCPLQ/
         dXKTN8tbeJvc3zGFtPPnDZcEbvcKxjmLdqFpqmzQ2ZEbzw/csHNuI43erzSMH4wiugJV
         cGNg==
X-Gm-Message-State: AFq9FYILHl1ROmP4PDyeW+4abUq1FycUe6PSYO2oN+jReo2MfLIPL6m+
	2yIG99GOuzrrCfXW8i3LjHRTZN7Z/b1Fw4DLqZwfO+oeWpMfbuHZUelE
X-Gm-Gg: AYBFou1NEUsl4sfs7ps8mWMfUs4Nl986keseS+lRd1GPWVs8Zw4Ermy6fqg6ASxE3ga
	PgW48t79fazRhMnwKxPj6p3Q2JAtTU/XB1psbyjgb5QttSJ/Uend42mIw69ZKKg4vqahCpcDVZD
	tn5kVCEQPDPT4a8OgSn851y9+mLhdExpXYFbVtKl1ACiWVV4WxB1ro7aIPBXrKD9nHzPYD5v201
	K2CcL6mJm0V+mdKjES32fhZT4so/xRfZ5cyRbuYmpYs0toqTIy/xgARrBZl11dKkYt+klUqnib5
	dO00qFqfgU8nwPtyjRqXgbjxKRJOWET35eAf2q57HOpff/9El5HQMnBgadxZAajkq1vN+3RCZkz
	KPgnrJN9gAWHyyurpoRoSJiQQUhBf9/NOut+7DUKlQeHunxTk78S9XJ7MEiVFP3gskmATM2ukyd
	z4mnfufm/Om0udoeC+hP4OS6jOGKp5bGapZsXAeaAt03Lcssx6rd3TNaQ4thIniLF1/qmc1L65+
	J1YRsUxiGc43aGJ+GEPHe6EGj4tXLZ3UeOHlIM4+0Y5oXDRE2Dtr81Iw/8cRagnWl+yo72jKB5Q
	+WD1p37L5/wkxQkk+Xg=
X-Received: by 2002:a05:7300:c00e:10b0:35b:d329:9f3e with SMTP id 5a478bee46e88-3674e842a86mr3427400eec.28.1792586179507;
        Wed, 21 Oct 2026 05:36:19 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:e587:7022:9bde:e16f? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm15270240eec.26.2026.10.21.05.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:36:18 -0700 (PDT)
Message-ID: <5f8047e2-9803-451e-9a70-6b9275d4ce5d@gmail.com>
Date: Wed, 21 Oct 2026 20:36:14 +0800
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
Subject: Re: [PATCH v3 1/2] platform/x86: bitland-mifs-wmi: Fix response
 payload copy size
To: TuteMthCD <matias.civadda2342001@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilya.gladyshev@linux.dev,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, chris@miget.com
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
 <20261020234927.121570-2-matias.civadda2342001@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261020234927.121570-2-matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/26 07:49, TuteMthCD wrote:
> sizeof(*output->data) copies only one byte, leaving the rest
> uninitialized. Use sizeof(output->data) to copy the full 28-byte
> response payload.
>
> Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 44b16b7b4034..522b38e9755e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -265,7 +265,7 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>   	if (output) {
>   		output->return_code = return_code;
>   		output->function = function;
> -		memcpy(output->data, payload_data, sizeof(*output->data));
> +		memcpy(output->data, payload_data, sizeof(output->data));

Hi,

I've included this fix in my v13.

>   	}
>   
>   	return 0;
