Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4B382F0F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788691459; cv=none; b=p/+c57yFXNJrjDoHn/aFGf/hhVpBdKWIwj24yzAxDzwWDEfctgEDMsfs/aTmYMIiOn7dGL/2mKTsChp903uxl1xDkC8Bu/JZYN5BCVgeUANGcBY1k5Plmf/dYqJi/WMLDMl55NniXHo5sRyo8MUPlQqRdJ9SFACkfZjbQSCPxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788691459; c=relaxed/simple;
	bh=Zxbr/MyJJe9YJZaEM1Cq3zqovEChybWZAlK04d4Du2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQpslbJ4kRgJcMoyxt5aZRADHrKkIR+hfzurFirS2worabzeQfmhPVf6n9Q7FOj0VMcNVTon0s+yGewC5kLFTEKthRzlKQqysE9ufH43orwB9qpdTt0S8OSEVHA+dZzhgD9x2G8Z1coMaufrBv0aT6rNwfvQ7edEeCuAVs4+67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evFPVG3w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evFPVG3w"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48436216a98so1602374f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788691454; x=1789296254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0/+wqBmIy7IfhisO1aQJ97wf2sAIX1/xLpRpUIc4gE=;
        b=evFPVG3wQ+UFQ8w7g9579d+7c01ZdLhq53tSB/Gto78WGim0KF3pAxMUYyIVCVYvWO
         rj+dWQbkRUl+CI591LjrDZNDPza5PLVyshElm+pui0SlZtHYYeVajF7R6AJwCeXJqduc
         x34HiLN65nUuto1jqMuN91OlvyMhpHgoBV5jHuFtwF2WtOAihnAAHhrlJXwiyn3Vs8ps
         P6BioTUdeKYhZudBvvpOGGpLYpVUUfiTy3suK60FyzKPw9CCn3H4vk/jCQyVMSxhWeqj
         ToThq2bbQC59nS8/qVzhAgdGBBh2UXQi92Ke2GNU1GO+h4kSQgLnJsowFUHxQIZbhGHC
         L+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788691454; x=1789296254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0/+wqBmIy7IfhisO1aQJ97wf2sAIX1/xLpRpUIc4gE=;
        b=bn9WgB5AiLcxc5FDwPwchL95h/JR+qAXDDpHMYxVjl5G/N0iJL6VVBhwd3Z6gJBI6m
         DliVszvotcHx8dOvfNa7paVlJ9J8WNH1BQnXO5w7U6Ds/NxeHnfDCQ7dS9YzAwPhJyij
         YRpOs0RHJ+jbmpTqE5VJ9c+tnid07a4smXPV3qEWyQrvSE/97tUzBldMBQ/a3gZPmzq1
         Tvh/lqYVbURwtLxy+ewpd66hzxjdai1HCmmAI0XVSoW/FQUdUwhEXgQ9DRd/QMM9SGGD
         hFedVvvUW/s/nr4xpKjUWEh/S6U16KrTbfKCprzugi9/cfn2l31q15y7x3R9AbIwfVLP
         95fw==
X-Gm-Message-State: AFuF++kS77hLpM6f0xJyIl+Dx/wJkFU2NPQBTKvWOxaeG7oQoqEGpvXC
	50Kl+BS32v0WzNElZfQhSCoSaK5p0v+ErG0Jo+L1YGzndVlMX0IzwQfj
X-Gm-Gg: AYBFou2DBP9txhk5UHy8x6U6HlIwDryOBOX72Qs6tvPEneucmea3GiQuCqwGIyGz+mj
	ui/4AqtlMx0Z530HH1WW/hoeLWn6dU7qnEjO1oc5xslgEInxKa0UUtXLq6zcIPcgrhmfRiXiJSO
	TKSme5HrfeI7UzCmnSKC8oJKGxxAXxXV1vhAMPNy0gEaMZho5rEvqfUWbi8CShavURPRkoo9KoV
	CAs7CU5xv34M4oSm/3a9O7vh8QWccot9VlMGOeLHBO8HlRSnn8B6ekl25OwaBxDWrnM6r9SNjfO
	Lwpoog5SFKemwbPaINft5y9nwS71bR05rUrFNoAm7uG7BpIOKVhIs48AIkK3iUQ+FUSnLYW3tRr
	ZyAiJhLXHrP95I5fXbD2VuU2BWoUHgbL0IccAJBvgstnOa3ehG4SoR+Bs5hES8tRHrb9hjDDBYn
	FrfDpKNnL6TLCWD3AoM+vno0mTTGDiecD8CapBrePZr3jCgpgDNioJJyZYpBO/ukmE38wWCQ1wW
	hjSDFDQd4Z022sGxWutdzx6qQ4gvExxKuylH0tXnl0q2lXteMdF/wTDPrbPcQx4x1M=
X-Received: by 2002:a05:6000:2c0a:b0:482:d94e:f33b with SMTP id ffacd0b85a97d-48586e2ea8cmr18284958f8f.0.1788691454427;
        Sun, 06 Sep 2026 03:44:14 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm21162225f8f.21.2026.09.06.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:44:13 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100)
	(envelope-from <chunkeey@gmail.com>)
	id 1x3AM8-000000007UR-3W69;
	Sun, 06 Sep 2026 12:44:12 +0200
Message-ID: <d739eb56-b37d-4056-abf2-c3a4c9ba8662@gmail.com>
Date: Sun, 6 Sep 2026 12:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Michael Buesch <m@bues.ch>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 b43-dev@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org
References: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 2:43 PM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Sure, for the p54 and carl9170 parts:

Acked-by: Christian Lamparter <chunkeey@gmail.com>

Does anyone know what ever happened to the trivial-patches?
https://www.kernel.org/pub/linux/kernel/people//rusty/trivial/template-index.html
Is this still going?

> ---
>   drivers/net/wireless/ath/carl9170/fwcmd.h                 | 2 +-
>   drivers/net/wireless/ath/carl9170/main.c                  | 8 ++++----
>   drivers/net/wireless/broadcom/b43/b43.h                   | 8 ++++----
>   drivers/net/wireless/intersil/p54/p54pci.c                | 2 +-
> 
> diff --git a/drivers/net/wireless/ath/carl9170/fwcmd.h b/drivers/net/wireless/ath/carl9170/fwcmd.h
> index e5bcc364f088..40554e4bd149 100644
> --- a/drivers/net/wireless/ath/carl9170/fwcmd.h
> +++ b/drivers/net/wireless/ath/carl9170/fwcmd.h
> @@ -69,7 +69,7 @@ enum carl9170_cmd_oids {
>   	CARL9170_CMD_FREQ_START		= 0x23,
>   	CARL9170_CMD_PSM		= 0x24,
>   
> -	/* Asychronous command flag */
> +	/* Asynchronous command flag */
>   	CARL9170_CMD_ASYNC_FLAG		= 0x40,
>   	CARL9170_CMD_WREG_ASYNC		= (CARL9170_CMD_WREG |
>   					   CARL9170_CMD_ASYNC_FLAG),
> diff --git a/drivers/net/wireless/ath/carl9170/main.c b/drivers/net/wireless/ath/carl9170/main.c
> index 61c7a1288743..21d8798dedb5 100644
> --- a/drivers/net/wireless/ath/carl9170/main.c
> +++ b/drivers/net/wireless/ath/carl9170/main.c
> @@ -575,7 +575,7 @@ static int carl9170_init_interface(struct ar9170 *ar,
>   	 * NOTE: If the previous main interface has already
>   	 * disabled hw crypto offload, we have to keep this
>   	 * previous disable_offload setting as it was.
> -	 * Altough ideally, we should notify mac80211 and tell
> +	 * Although ideally, we should notify mac80211 and tell
>   	 * it to forget about any HW crypto offload for now.
>   	 */
>   	ar->disable_offload |= ((vif->type != NL80211_IFTYPE_STATION) &&
> @@ -677,12 +677,12 @@ static int carl9170_op_add_interface(struct ieee80211_hw *hw,
>   	if (old_main) {
>   		/* We end up in here, if the main interface is being replaced.
>   		 * Put the new main interface at the HEAD of the list and the
> -		 * previous inteface will automatically become second in line.
> +		 * previous interface will automatically become second in line.
>   		 */
>   		list_add_rcu(&vif_priv->list, &ar->vif_list);
>   	} else {
> -		/* Add new inteface. If the list is empty, it will become the
> -		 * main inteface, otherwise it will be slave.
> +		/* Add new interface. If the list is empty, it will become the
> +		 * main interface, otherwise it will be slave.
>   		 */
>   		list_add_tail_rcu(&vif_priv->list, &ar->vif_list);
>   	}
> diff --git a/drivers/net/wireless/intersil/p54/p54pci.c b/drivers/net/wireless/intersil/p54/p54pci.c
> index 6588f5477762..68e929fa213c 100644
> --- a/drivers/net/wireless/intersil/p54/p54pci.c
> +++ b/drivers/net/wireless/intersil/p54/p54pci.c
> @@ -534,7 +534,7 @@ static void p54p_firmware_step2(const struct firmware *fw,
>   		/*
>   		 * This will indirectly result in a call to p54p_remove.
>   		 * Hence, we don't need to bother with freeing any
> -		 * allocated ressources at all.
> +		 * allocated resources at all.
>   		 */
>   		device_release_driver(&pdev->dev);
>   
