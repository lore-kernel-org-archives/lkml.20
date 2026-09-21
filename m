Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63182493D31
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988331; cv=none; b=LNiE57eLLXqLScRuWKgQ577XBlfbYyzILUkWSGeby+LLbIWEU/8rC4U9MfrNiHBL4fCOA5x2g8TPf4SvzFDLix12PvpAnEzAcNSHkup1SQICbJZMR2OZ4vEdw2EXJhgBkVRTV7fAo+SrlCvYS9Be2Jy/fPk+QJY35LKGf2ihjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988331; c=relaxed/simple;
	bh=9d+9ZBvxo6G6q3+OJNAocJqza+l2mLOys7SvfT4EZYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElIGmLOLRdFHWrbqTdxbjrrUTEBx081TJ+xdcmWjmxLhKkiVJvue6F0244bPaDq8g6Gkh+lCfMgKDpRXREdMHJ3wA/J0ZmvcX3lf3tQNIIXRiDWgpI4L6jJPE3KJ/bOaSADgIGx9dX1rehT9Asjn7xv2mRA2ce0BTYeB515d7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVpF/4Y/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVpF/4Y/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so16459995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988326; x=1790593126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7gJgiKzwHYQowFViJmep5j79EdGUMtu2GzF/1ItERw=;
        b=FVpF/4Y/gIh7FMCWrtBK7h7XQ6wDsnZvMDOSyk6xhiqrTuvT0Qc8dLqwiTxp66vgPk
         +U+gC2cE+3N1E7oeIw86Z7unHMIEirBI0V6VeuIs3ci2kgzKPqrMPoVYb2prHkvhTA8t
         PKc3wRA78LFzjba+qifcEZ0UvW6pJVdSr5G2OJGTFSZ4SMzvHtQ18q8ELsY2ZiM4Xtud
         bN+wV0Ik3FGSAZuoZsVDLjlaEr/dKBbELKcwHjSTWFqY4LVQ1EJ/UgkkKTKPP0Sp8lca
         8ZAgr4H/TWrOQL932zIEtkHiGRf404f3fueAs+hBE669WY5vfYNO7oqj6dR3o0Comu3m
         q3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988326; x=1790593126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7gJgiKzwHYQowFViJmep5j79EdGUMtu2GzF/1ItERw=;
        b=oMIwCeBN61819stViQkE1HDGjpKssdMt6f8wsa41zYBbYbRCTgHkXOWOKZWsyq6xOu
         dDq3DrDo/c+3OSLm5GzfvaV2wd4ynPEU8EnTcvIXmPCea/6IaHEL1Sk+/IlY95dXIgnW
         TRFbSsWVIz9iUNzrOUI6w0OrG+gFikbZ2jNuECvklY/yU9dBqe/HerCfi152Xtj+4rj9
         RUIt5pJh29293PnzMIAUjSoCf6q50bddXKCM7nyPjSwVlsXx1pi2krlkfkMqrmzdA4mB
         porH2xw1W49Usum8dEE05KYF2mE29qC3aJJI1x7ixjxqGvlvrpp8ss3UkeQmJS+QNwv/
         A9vQ==
X-Gm-Message-State: AFuF++kvQvV0K04dxG+7g2RG8RXpq7BJqeFpWdhdMHptE79B4tQFxhLh
	Xlgx+laKfZQfQtcWUx602apHZC2tgudKraiP9uKqMgV/CaA7pMMZ0T+I
X-Gm-Gg: AYBFou2AZUaP7+tkL9JHKPz6AFT3qiEqQTKQc2rc9raIoNjo7mvOFqr/8BsEcQeJUcL
	fY7ns++bEsux+UtOR4pomMz7TCLC/RcfiPpyV0Q0eUPDkWIiVjL7t4icSnm4elK+QIv7gnfOd2P
	dLqx17jfmdIdvafuS4hLcqtSBkL+Li+RvRq0EXWnAzbH9gQABCwI88U8UklGnRRWxkvQd4YOSQE
	QAKkxgdadYV9C8P8bNVZUEqH6L/O4yplCtkoQMAzqusjHEmDNWBEmUQTgWuAFlpP+q7LxbfIKrj
	MDEFZKQSpdBHHiXsBFFOUFK0Gq/jUh8n0lvnIkChrsCSnqCfIJD2Y3DwDGFpdqlaNn+nz9m9o5O
	NdCv74oPK9GZTdppZIoj62TgFAcUP/PI6GiYHKjzqkYSRDFmDqrA/Zm1J5YS9GUgArkBJC+fnSA
	7yw0V+DWczfpLSz1AgdEBeE2bkwLHK0lay2MyEaHy5tNRVptvhtZK8lrk50gUclOKQOH7lLedve
	jKw3UT35zqvTjHicrdyNui3on9M5eCYz7ULKd11VJBtMs0=
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr184267135e9.13.1789988326343;
        Mon, 21 Sep 2026 03:58:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:7e03:5f00:f6cc:18d8:115:cfda? ([2a02:810d:7e03:5f00:f6cc:18d8:115:cfda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd757e97esm5954785e9.8.2026.09.21.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:58:45 -0700 (PDT)
Message-ID: <82fdf997-1e9a-4d67-88d3-fbd8a795b7bc@gmail.com>
Date: Mon, 21 Sep 2026 12:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
References: <20260919130853.3041614-1-peng.fan@oss.nxp.com>
Content-Language: en-US, de-DE
From: =?UTF-8?B?Qm9kbyBTdHLDtsOfZXI=?= <bostroesser@gmail.com>
In-Reply-To: <20260919130853.3041614-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/09/2026 15:08, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/target/target_core_user.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
> index edc2afd5f4ee..425ad1246a75 100644
> --- a/drivers/target/target_core_user.c
> +++ b/drivers/target/target_core_user.c
> @@ -3006,10 +3006,7 @@ static ssize_t tcmu_tmr_notification_store(struct config_item *item,
>   	if (val > 1)
>   		return -EINVAL;
>   
> -	if (val)
> -		set_bit(TCMU_DEV_BIT_TMR_NOTIFY, &udev->flags);
> -	else
> -		clear_bit(TCMU_DEV_BIT_TMR_NOTIFY, &udev->flags);
> +	assign_bit(TCMU_DEV_BIT_TMR_NOTIFY, &udev->flags, val);
>   	return count;
>   }
>   CONFIGFS_ATTR(tcmu_, tmr_notification);
Reviewed-by: Bodo Stroesser<bostroesser@gmail.com>

Best regards,
Bodo Strößer
