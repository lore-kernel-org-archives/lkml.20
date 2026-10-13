Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEAE545DAB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922362; cv=none; b=DuJ4EJuLuqnNLtNDyez8XJspg5mfSipWo7gPLJekhGBxjwzuP+A5Bpl5ezYq8xtUPzNlNT+fdWxIIyqdPqTzzEkysXtZlAAJh8bOfTpjhPYh216rb0kAv82VlzDJCkm11uEmRgPGGkQZwc2vwg3I6qzCmYtl10mkXQC0KSpot3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922362; c=relaxed/simple;
	bh=FHANVY32iP02su9AUQalbmIEZKYbDkKq71mSU0vrOUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNXCUlhbLBKEIzGHMA5BN+THn/cvvgKqutDDzxd7BycH+TJn8NMkkeVcS2tGvZBhp1DJf21wtYZu1MIARbsJn+xuYR4XaBkKEXBH9FjbYHIQO9W2iLKSQ2Puf39YlraeEsF0+m7EbAIXtCvk7sCrS0NCr1tw8MgXTLZtbMgC4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=OBrqSUrZ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="OBrqSUrZ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5338f65913dso38483451cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791922359; x=1792527159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TBoL+oiZizwoAHZ61Saznx7uboPW5Y0xvzJblrFEHM=;
        b=OBrqSUrZiwDrlzhZy6SHKJv2M5/oITjnSKlvgyztDe05OMulV/CmQsBtFksnlkus/E
         nj910qWcfxiUVutqAJtCfUZzMlUMPHNdgQV1x8+FEKyltCwcxaBDvyCsN4qMF6U9nCWi
         2L1vO8103dho7Vr2mBAtBK8wyEFJ+mNSVuqIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922359; x=1792527159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TBoL+oiZizwoAHZ61Saznx7uboPW5Y0xvzJblrFEHM=;
        b=sv5YZy+O2unPq+CYgAhvzsGYdes8gkq6Soricf/2cmb+35dloUtXmUALnb0AE5s7ij
         OmrPwqWAVSdE7buqdH21PqXpu0GexzGMLqxRwzZ8BcAXq+RsTWb4hAzGLj2mQz4vAtg/
         gKQzEZ6q8oSF7L3SUsUH0PAlHB3/da2Hg9m8i3S9UkQT2NnvRA6KJeakpFIk/PKbw30k
         z+68PmUqlrZpvF9942DFdeCS/IRer8RH7W6cMcKSjm8TlrCYz+1OaZft00JJOrJD/fHn
         lxA3xlbfcyANUSh5jwlPvm9OMyJ3nvaGch7L7SMDqKIi88RdoLyYfRCzvfO9Ceof8kSg
         QurA==
X-Forwarded-Encrypted: i=1; AKwUvBzJtdIGcAX+zrDb2b4aN8482NmBAPt+PGzEKHRsUa5ye2EguSvwXEsZ5hvVXDUH1VWByDG3XPBkb6jfn38=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNAaLowwoylHzwanTjttYQD+GOBcxWeIEG8K8DGI7zY7zuJpW/
	Jw8IJKmlVyVlv0/n4S729wRQNiIgBWthiE95ImMK9Jalz/EONiqg7XwsE6dtWWLTIA==
X-Gm-Gg: AYBFou3H0+3EC0S/O5ZQ5FY7oKwX2TXuUGxDBotBNXP4VfyTVKFtPPV9aAwZhs4uB/F
	hEMmsxAHr1BJ1kvEnDKY6ZaqfzS7QEwbJuyV6kYBu1NnbZHnAj/mhgW9/JXl+G34TM1mcHEkYNb
	aCluIyrjULmfZ5aaOOaVKv7VNU3w5B5W6/EHeYBCgWoL18kwWACNCAQOs7cbOWlxWUxARsXUGct
	uqrprud26vant79Uc10Ycg+YtBkrwb35DsPa7DMIid7w/MQZUc3+GG+PXORiLCn1faxXMTr5oQX
	inEYGoX46y3D0Tz+S8/WxMZj35aoc8n1gjx1d9cxGhObkcDfOgMar8WzyceSjT5GugUxiNXY2ji
	X/o9NXqxBMsD1EDOELGD/EYUSz/7pPufRg36SnVqlLtnhEqXf78n8+5d6PQ0pWUvASPRyQbzAbz
	stLmi+VGUX/vD7yiFIY44uEW31ynCBH/k93+mp9C9HjE0++qbYfucay7Z1S2SR0SCWUw==
X-Received: by 2002:a05:622a:5988:b0:535:dd8:b12b with SMTP id d75a77b69052e-5359faead5cmr230417831cf.13.1791922358809;
        Tue, 13 Oct 2026 13:12:38 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm106156091cf.28.2026.10.13.13.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:12:38 -0700 (PDT)
Message-ID: <fc8053fd-5831-48fb-98a5-f3e81323b51e@ieee.org>
Date: Tue, 13 Oct 2026 15:12:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unused function
 'to_fw_mgmt_connection'
To: Jeremy Dean Clifton <deaner92@yahoo.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261013181707.29830-1-deaner92.ref@yahoo.com>
 <20261013181707.29830-1-deaner92@yahoo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261013181707.29830-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 1:17 PM, Jeremy Dean Clifton wrote:
> Remove unused function from greybus driver to_fw_mgmt_connection.
> 
> This function is not exported or called from anywhere tree-wide.
> 
> Confirmed with git grep and cscope.
> 
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>

Looks good to me.  Are there other unused functions
like this?

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
>   drivers/staging/greybus/fw-core.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 78321be80013..46b35ef55090 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -21,13 +21,6 @@ struct gb_fw_core {
>   
>   static struct spilib_ops *spilib_ops;
>   
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev)
> -{
> -	struct gb_fw_core *fw_core = dev_get_drvdata(dev);
> -
> -	return fw_core->mgmt_connection;
> -}
> -
>   static int gb_fw_spi_connection_init(struct gb_connection *connection)
>   {
>   	int ret;

