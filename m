Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669B310651
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788125016; cv=none; b=tSacN+Nx0s+cT9gLDR47iYNIakQX3LuF/iVAP7roIjuF1fGeI+lFD+W+FeNBf+HN0TxvGAqvPSafEzolTElNYOomrQ/TG7+rbyaiHccM7v4MnkgfmxxwITFGqtoiLIJMvoc1x7RyP9BI+GRonlwMUyraXCCryHs2/h4op1NTETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788125016; c=relaxed/simple;
	bh=wBPH+Rk3uwwSH+tiyptG7oB+B0g92L3qAggw7PluSjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewF3ajvoo5+IN26VFPnqeo7Wuuj32Z9rW6qsvFvGRcJIhbnckbhvWQGd9mTLHDmY9BJ7OEXaGIMvBAxqjZ8i0oXUK1B1TSFEvjJS0o2ogfL7x/RnumW6KdzvDXQavFiwz0D7Wq/CJxMUO26L0QOuPlQwde6sMIy67FEo9yUPx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so22292095e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788125013; x=1788729813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KulJb9m4lyjbS/Bxlru8m+jiMLlRHaAM9CjPiqQQbHY=;
        b=KqVxV9LmbG8ImcvtCCqY72p/+3UrR/Rfh+bJm7GDq7c3P2fgdD4Se7VaC3uXBD/J48
         2yCy+FuFFNjrfv6Eyv7uZcNCAnajWuaPP9R6r4e4l3LDNJZ9Zl1v0DajgsBuaWNFvEva
         Ggbz9a0CUDfOwYL8kwWc4GCkigM2w6vaTYKE2748JMfefMqyhXXYyJgBmkUaYZGOysea
         kJuaacpgsdZfZHW6CyYWUwEmJ+au02Ui6K84K0HgKBmJNRAMGHXvEG91xTDboE9WvC9M
         uUmS3MnwIZwfU36uqEwnzvYtE4ttIKNLuVAen7O4+jDm0yZ8G4Fz0p4vAmCqCb9bEBVL
         3Hsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4jykTgAdNUyJfDZW2mf/RwLxF83E/SS+Ibub66CMapnqgCCJmkwE38yE8rAxpYTFS/KLnGBAvhoc9oMI=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgwixJ9f+z8wb/780d3YHGTdHtoU1bF7aVY+2IgkmC9Zo4pyZ
	OntuvV9xkeXuOh778WP3mU6R+wIP+tmJjOYauAIDqQfR5k7Cn7udvaV5
X-Gm-Gg: AR+sD13uPn5kGkXp2n90g3JVLghLrl8imZJ//I9BkaF4jdyUdseX7cWFB4xU/h/ifjg
	O+9PSsSQq4bdTkk7ZQGn11VBFW3lkI1G4BoAnati45DL0jokik34suXJ9lKED+qyPvXW8iubGFw
	2VLFXaitcFqBoEklb0qX890uDBrtBrgWpfIWuhgUIDoZTj1NXCZsBEfN8puUa6XSd8KdT89fjUB
	FbUx7W1UYZ3+mGaFEd89jjj3ZL/jZkzyY/DKcfIXewiOVI98wNEt5ezW49Zj1f8+o+IxUY8UIYv
	eVYLLfJWext4wYZvvsGEiZs2V+F7nn9ex7rVKvSZM+3QcU91sc1uCZVf8YTC52o3LdWrijScfQA
	8Ab2uF29fBu3lDwh99iKHCMK1AaycxFkROWN4lDzM/SMAz753njMcn1NKiGRhYs2d6Ces95SOZT
	hFrLExij888M5QMbK+9n5USjrY/udiqSFNgrJZDApFpAbq1+o+iEv+Oj7QCKuxDsWp4hoF1kH8d
	uoCzSt5W6xQaabYnyTjNA==
X-Received: by 2002:a05:600c:6088:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b91c433a4mr342610655e9.11.1788125012656;
        Sun, 30 Aug 2026 14:23:32 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm219625835e9.12.2026.08.30.14.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:23:32 -0700 (PDT)
Message-ID: <499d5395-3055-4968-8b73-d095ba427134@grimberg.me>
Date: Mon, 31 Aug 2026 00:23:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nvme-7.3 v2 4/4] nvme-fabrics: add helper for DH-CHAP
 secret options
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
 <A234F50F1018A58C+20260827130407.1391174-1-raoxu@uniontech.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <A234F50F1018A58C+20260827130407.1391174-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2026 16:04, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
>
> The dhchap_secret and dhchap_ctrl_secret options have a distinct string
> lifetime because their values are authentication material.  The temporary
> string must be checked for the DHHC-1 representation and discarded with
> kfree_sensitive() when validation fails before ownership is transferred.
>
> Add nvmf_parse_dhchap_secret() to keep match_strdup(), DHHC-1 validation,
> failure cleanup, replacement of the old value and successful ownership
> transfer in one scope.  Both secret options use the same helper because
> their parsing and ownership rules are identical.
>
> Keep the existing replacement semantics for an already stored valid secret;
> this patch only moves the parsing and temporary allocation lifetime into
> the helper.
>
> No functional change is intended.
>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/nvme/host/fabrics.c | 48 ++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
> index 24385e777307..dc8883d85f45 100644
> --- a/drivers/nvme/host/fabrics.c
> +++ b/drivers/nvme/host/fabrics.c
> @@ -725,6 +725,25 @@ static int nvmf_parse_string_option(substring_t *args, char **dst)
>   	return 0;
>   }
>   
> +static int nvmf_parse_dhchap_secret(substring_t *args, char **secret)
> +{
> +	char *value;
> +
> +	value = match_strdup(args);
> +	if (!value)
> +		return -ENOMEM;
> +
> +	if (strlen(value) < 11 || strncmp(value, "DHHC-1:", 7)) {
> +		pr_err("Invalid DH-CHAP secret %s\n", value);
> +		kfree_sensitive(value);
> +		return -EINVAL;
> +	}
> +
> +	kfree(*secret);
> +	*secret = value;
> +	return 0;

Looks very similar to nvmf_parse_string_option... Would this be better? 
-- static int nvmf_parse_dhchap_secret(substring_t *args, char **secret) 
{ int ret; ret = nvmf_parse_string_option(args, secret); if (ret) return 
ret; if (strlen(*secret) < 11 || strncmp(*secret, "DHHC-1:", 7)) { 
pr_err("Invalid DH-CHAP secret %s\n", *secret); 
kfree_sensitive(*secret); return -EINVAL; } return 0; } --
