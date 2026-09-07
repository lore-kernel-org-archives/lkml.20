Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA91FE47B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754587; cv=none; b=l/MVdEFXuUptrzKzsX670Wjelv+SqAARcTCj7ysQrfKCK3ntZUC222J/UZXVX5ktga0PO0Nfm8HnpZMLaq40S52kmDJafpfW8whinLBmBC4EJcKu1hXtBFUSGh4Gs0t65+q5RAKrYUlNANrhELWj3udHKYypiNX7ZAAmT8ivyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754587; c=relaxed/simple;
	bh=YuZmO67kgr8Ojb2QX3aBPcMQWn2OikGnJTU0dN3QqSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKKZyt/kMLI+rXkwST2nG774bV0zp17MVzcUibME8+xZrZ+T6YVVwFqEfytRrxgpZCq1Kop4KkkEo3tYVK65OKo76sIqdddJNdRQHpcEiQ35OuzEajERaut6xBr0mda/lz8+1ysuPn1Ab/T2m5lI0TkIZm2QfOMsebmLCVf5oOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y00NtrWW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y00NtrWW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d58efc7356so38604475ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788754586; x=1789359386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkIVypKcfB/jggtHKKOi/GTTbohNvuLt41URM31SjB4=;
        b=y00NtrWWu/vULnhx6vnS3yqS3cC35aZi0xAuQqjSCENAX8L2teVjWXDI1eCQQ5r03Q
         Yeur8fwRY2O44vy6aQfrsdNeHLR/3qw2eEFaTvVoOhkLOp15UVYebPAmb253Y5/2cA6W
         pGDxlFIFBrkIjfvsRLG0izmv28hc8NDp6OYoNZdwEpWRRxwspkzRzuaX2C3IUdMcjgZ0
         OXrYKQTwny03WPja/k3VtuZIuetTlwHXg5+U2dx3ZsuV463gz1MrknYU8UTmHqdBRNAv
         k4SzYcMvkSZ5RogHAwUa3ck6U4Xug1W+3k4h+iQCZbkAeV48rYLSol6f7yQmwDkG5Vln
         xPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788754586; x=1789359386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkIVypKcfB/jggtHKKOi/GTTbohNvuLt41URM31SjB4=;
        b=NSxbsvWSftvs5AQYBHRxg13R0lVa9Y1aWa2Y2o23h/UUoarUpcYAuyS+DNQI0DUutv
         ryfW4NoRyFQuLfw9WCbnG21udOtmAL/LdLyNd0EQfb7kBIhASAaYAMxLxf/Q5MtekPVp
         IAmfu0IJyAZJZa1MNB4s1vPNBJBwPIzbBDvpNgnEYo2s8ZUk7gKJMuuhUdTG3n+s15OL
         qHizdo5w79f/DwFoXkTBH+HLjX+rcrf39llPL8xZ5lvSvfHCMN4JQ1VwK3MfQLV2nmTg
         VDD2MQSFZ4ZUV6T9+rBG8WsnyrWp+N1ydyqtOKCzJzIR5G9dBqayeRAK+yMQcr+CBlT6
         YO6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/pHtq2pmkWVa9fN/HofDARQJl0dGSoy3aEBBR6meTIrjS1YTUEi8fkj7QPExPNWQq+fllWjxM5iNNUzA=@vger.kernel.org
X-Gm-Message-State: AFuF++nTTXNaSDegEl73Jvc8prNtMkxEKo9cE/AjfIUmrxMl+sMEjU5o
	nrsZCB18DTMmVa9dSqCzXnGCpr0VG5jo+bRxdPxmgITI3qsRDhZEMYR9bHi4SVn0Esc=
X-Gm-Gg: AYBFou11Ia8BNbhEA/7RTwDctmoTSVi8HZ+65JegIg1cq5jsRyoHyYvaoN1vd0b3x1M
	mjcfPsRaujQ1NX3vIqoxV1dESp61Vl07InBqrlK/1kSxhaJdIoWVHYw+aS00Ke9OG1N2rbkU0HK
	B1NCpDCFgZzIQ9Mgp80IWajFIMDLwBUsHGb4lpVc6UgODhuCebhXh/Nd4seOq28zznbHnw3U/IS
	Na6Q1xf0V9lCWAldKjWRsTf2lfEJtWFdEfVlFpt8RGpFCwdemSU0eUiF5GlsEIa68SxQW1xrTzO
	yexmiy0ohtWF5n4e+839HxglhF+YkxGVSp/e70hcipbSyWFZXB7iMTFB0CnDPsJvRCY9pTZI6w3
	PXH6mXFHPeu7BAWxTBRcP7bgp1KhcPIW0DLhtgOyHMspttRbKXqOgVaCRwn5F1EixO/PEnMLeYs
	OY+fPQ5tnWCRSE+AubD/Ch871p5WWUsmf4OglTcShrjiX0/sxg3cjUnplAm3IO5z8=
X-Received: by 2002:a17:90a:1c81:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39b310914e0mr17932174a91.16.1788754585600;
        Sun, 06 Sep 2026 21:16:25 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm6928635eec.5.2026.09.06.21.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:16:24 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:46:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: fix repeated word in log message
Message-ID: <ap46lbKaSMND0l_I@vireshk-B250M-D3H>
References: <20260904121238.22991-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904121238.22991-1-hemanth.selam@gmail.com>

On 04-09-26, 17:42, Hemanth Selam wrote:
> Drop the word written twice, reported by checkpatch.pl as a possible
> repeated word.
> 
> Only the message text changes, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/mailbox/arm_mhuv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
> index d4077cd49360..94e25678f0af 100644
> --- a/drivers/mailbox/arm_mhuv2.c
> +++ b/drivers/mailbox/arm_mhuv2.c
> @@ -610,7 +610,7 @@ static irqreturn_t mhuv2_sender_interrupt(int irq, void *data)
>  		 * iteration if the interrupt came right after we cleared it but
>  		 * before we read the stat register.
>  		 */
> -		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt interrupt\n",
> +		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt\n",
>  			priv->ch_wn_idx);
>  		return IRQ_NONE;
>  	}

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
