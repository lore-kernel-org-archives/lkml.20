Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD594C33D2;
	Wed, 16 Sep 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577260; cv=none; b=GPrRsUK+/AK8U82BBMi9zG+IC6ilku8u+VSrb54Yxhgy26p68fbba6hnVelYw5QG+P4rUe23YhQiaGRgEgMCo8wUY9W1MsN4sV46F/+Xouew7wcV851xXaera4bMTs4h5oRuPmkZGs7RJ9/btdeJrcRc9Mvs0Z1RNOqzfa3LyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577260; c=relaxed/simple;
	bh=nB8I2mJHtj2LVGrzSxwkKViFkdX+jVq6NArxYJyiqP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRtYn7opKu0uB67onNlvBwtHet7ElLphELqXlKCjrfdnYt0mKi/xJc3/44S0OJkiUO6YiJdNGfZiQXr6G1RS04LfwSZe2JtQ4e5ZZFx3Gu4cckW4A8sZDhiO9+02rzt2HulvSnjGy6qOmsh1sckdtWOKd7IPtF93dYflQRXL9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HcU10ct7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HcU10ct7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=m/pReaGcQBloqHwfBBNKip8dAqTAvdtGc/NR+RSFxdM=; b=HcU10ct7D0UTLMn6Sb8C271joC
	eA4ix4s/6pKd977bC5ORjkSkFz8AIOQvZi91mF6BfbKIqhJIMAkxrfhfq9r+JBJIwh4jepaeT7baX
	sSzKAkzyIrKvbmyd67QwANCH+JF0hK2vwjsqJaKztEcrf2OAxhLzLeGQ7topUCmx0gyDMGmtHGehu
	TW9g/Splq75ek76OJjp+pfrIh4LYfTbMpC2wIbQA5hgx7l5NzhH7McJwk8ctMEklWAsS7UxfDMiqU
	/h6vlBH9GtaR0mEY3r3Rcj2iZHAYL74M2woQ+LP0wv1A6Qd8LSngYyZDC2dGYeOKCg2TZmI3n7KEh
	SE3MTP7w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6smx-00000009mb6-2H1s;
	Wed, 16 Sep 2026 16:47:15 +0000
Message-ID: <626c2b82-9890-4b4a-bf91-b028018ff8db@infradead.org>
Date: Wed, 16 Sep 2026 09:47:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: doc: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916113524.304863-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260916113524.304863-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/16/26 4:35 AM, Manuel Ebner wrote:
> Remove needless '{'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v3]
>  - removed the change of the placeholder
> 
> [v2]
>  https://lore.kernel.org/all/20260904120737.758809-2-manuelebnerli@mailbox.org/
>  - rearrange lines in diff
>  - fix commit message
> 
> [v1]
>  https://lore.kernel.org/all/20260902150510.706055-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/sound/soc/dpcm.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
> index 7b6aeab3c..3ff13fa4c 100644
> --- a/Documentation/sound/soc/dpcm.rst
> +++ b/Documentation/sound/soc/dpcm.rst
> @@ -358,7 +358,6 @@ The machine driver sets some additional parameters to the DAI link i.e.
>  
>    static struct snd_soc_dai_link dais[] = {
>  	< ... more DAI links above ... >
> -	{
>  		.name = "MODEM",
>  		.stream_name = "MODEM",
>  		.cpu_dai_name = "dai2",

Looks to me like the struct needs a closing "};" instead
of dropping the '{'.

-- 
~Randy

