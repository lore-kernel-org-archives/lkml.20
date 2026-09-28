Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D1396B8C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631817; cv=none; b=hY0wKUcoiwkH4mi2QwbrVvwyOHJX5Dofyu4fAtM2ishOvkzvoLbn/pqghkfKAUQgFCWVenOGdbcxon4PDSMwd4LhXUYQSSMbMt/XKsEe2y591nBSHxxk8X+8BiqUqefqDmfJYcFevwWGxhjq7zABFUqf5L2Hh5Oq+UJrqfC4DSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631817; c=relaxed/simple;
	bh=lolwbi7BzgsmuaWUMs8RXInBeiNA5YPYs075xjDFuJI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nFlF9cfS/a2yn3CGwDfZPsojB4b6mcJHQ1ELmot1qlNexxMODSHmybtiJXpyoZHDCRmzm6KMIKWFaGSEyl3NqE8cc9j/TefiHqReMh/Hn995Q3XCwHZizuZMeqd7+VoYhZ4I1L9DoTLoXceDtbAKU+r6EYOBSgGIxRDKyjjqd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDpUH6gT; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDpUH6gT"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso6186248b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790631813; x=1791236613; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aUgUJEFAJxW4Agj9ChYhUj4PsOMZgwR99tcMvPKR8w=;
        b=EDpUH6gTM7vM1OXi8yCTQOJUlAk/wImBdnFMDHyWScmSsaINBtuqhN9t24V+TkRZ4G
         wrUopqNcx950PmvmYTAqNHnrNiiGGRoP+G5ITiZG07vDxCxxyP8HczxwCwYt+oC7Azpl
         jN9oM/XtAY9vsHIJ+pVysOpuLDYDmhIbKPhtJyDveDJJL8EohMV3j/0QYXZ25QBLH4N3
         oH5VO4CAM52pBqVuaQUv13G234gv84Qy5id5gLGltXF/VJYqa0ryHWitihsFrfs2PUCN
         F2NLwjpd3grGM4Y+Re/Afv3Gsb/yeeqezgAXScS56N9oN6xc8h7dFwS/2TgPi0cOnsQ/
         QMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631813; x=1791236613;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aUgUJEFAJxW4Agj9ChYhUj4PsOMZgwR99tcMvPKR8w=;
        b=xKb/LFHKp+IymUrxjsnp+rTQOi8gkD/i5cXdiM7QU66AM0qAgdZyZRxRhjWrmJGknS
         A1D53ZtDCc4XoGojRHBFho5C6hQjcts3YuWqXvDcurROJMyn8YSjBwWB8dzeSQOYHbEf
         Rbo8MWUktEPGr/UByNuIO5Dksxw2gAZFyu4dbHQynbu0aEVr+KQ/Jcdhs+aEd7u3Y4w2
         LpBtco/yLbJBQBvqlP4tSKzYNo4w3mvo4Rs7GhZVqB6UJQZxmfnw+Y5MrZY2gciOBGuw
         Uu2gFgzzMQf00NhCkvK/HJxmNsyJp5/B/WzNCkvZCXioq+Hc/BEC9sof5MBCI3ojyvK7
         SZeA==
X-Forwarded-Encrypted: i=1; AKwUvBz922IibUJRoleSkZM8xu1mKvxqqROg8XgRA6nooatLiAuYRl7/3FoGLWD/TuVmleCcZH/+DeCy/b/eMNU=@vger.kernel.org
X-Gm-Message-State: AFuF++mGbgeGhbF0GMkP1wnHlJCmM0sFizathvv7Bpm4fhNsmLdDm4aS
	Si16P+WfnbLErhX0JfyPMwHhqi4oHqFHtOkU0930JvBS1rWqyFbsMsC3q2NYdlj59lcs3cb+RaJ
	MIzpX4XzvhQMEXBoz7vfkVNdQOw==
X-Received: from jaes22.prod.google.com ([2002:a05:6638:aed6:b0:5ec:8614:b65a])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a03:b0:4cb:f21c:a795 with SMTP id 5614622812f47-4d72982efa6mr13977211b6e.29.1790631812905;
 Mon, 28 Sep 2026 14:43:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:43:32 -0700
In-Reply-To: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Message-ID: <arrfZ5CYyLt0vwu5@google.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
From: Justin Stitt <justinstitt@google.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, peter.griffin@linaro.org, 
	linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, morbo@google.com, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="us-ascii"

Hi,

On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> From: Bill Wendling <morbo@google.com>
> 
> samsung_banks_node_get() constructs each pin bank node name by copying
> bank->name with strscpy() and appending the suffix with strlcat().
> 
> In preparation for removing the deprecated strlcat() API[1], format the
> node name in a single snprintf() call, which preserves the existing
> truncation check against sizeof(node_name).
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Are you forwarding this patch on behalf of Bill? I see Bill as the
author of the commit and I recall seeing this in some series he sent
earlier [1] and this patch you've sent doesn't seem to be a v2.

Let me know what your role is on this patch and why it has been
separated out from Bill's series.

It is entirely possible that I am lacking context. Please fill me in :)

> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 5ecc9ed4c44d..0d639eec689c 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
>  
>  	bank = d->pin_banks;
>  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
> -		strscpy(node_name, bank->name, sizeof(node_name));
> -		len = strlcat(node_name, suffix, sizeof(node_name));
> +		len = snprintf(node_name, sizeof(node_name), "%s%s", bank->name, suffix);
>  		if (len >= sizeof(node_name)) {
>  			dev_err(dev, "Too long pin bank name '%s', ignoring\n",
>  				bank->name);
> -- 
> 2.43.0
> 
>

[1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.com/

Thanks
Justin
