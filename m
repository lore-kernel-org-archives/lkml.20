Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C19547059
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667406; cv=none; b=Z7Omb/qOVCYIb0QxoxSaJeKqV52UiouQprcaQeVODuQrpMk/1gRP/7PvkgAfsCXZuHSb5MOJhh0lqLyEcklJQVegYiOn9ui8fAa5FAk6oniBAAfNwHs8SfNouS7BlLSyzWUOXr8TWZr5CUI68NV9QcBLkPMjfVOm875Ks6/gOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667406; c=relaxed/simple;
	bh=kxmvT20bENOkL2EQz4CX9Gsm4DHopRLHwVAbk1QAa5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSrYsK1xZnL8KVk4rRhxmag+qzTnpWA0GeGqF91TZml0n8QThdOP+sojmxZIO84KhpsFrJ6O1EpZFzoaJGRvfXtmTvU2Lxjx++KZPz7Xk156iU8pmt53ANLjfbv9ByvfI7OuBsJdsuA6K5WkkvxZSjUoZR2Jd38XLrVZYDC9RTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G4/CgNPz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G4/CgNPz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB9E34E407BD;
	Thu, 17 Sep 2026 17:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69E0F60580;
	Thu, 17 Sep 2026 17:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43EE011C787D7;
	Thu, 17 Sep 2026 19:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789667399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=koYHEmHF992hOO59AVBGv9/ygNafcPNBRRwBEev9dCQ=;
	b=G4/CgNPzK5E12/9/EmIjENcc7TwannYkXgttdS+iILgEN7rNK/7/lxeRP4Rs239QsVgmen
	Rp3kNHvYHrs3mGRmJrvApN9xaKwcGKQuTpPWV6yz2JLBGdat02GKuHEFpEGQrQ747dGkU+
	MrXIpL/cxj/qtmOthtuu5m8HTGt7YKHhmsyZXx3xMQh/Z+CDaceLZMKhx9wW6l55R7Ma1m
	9QBma3nANPpD6Zct7/pj8wZZXCkxDgSTTzq2drihxjgANR+lqsFWiErbW2qWKmiX5ShCFX
	J1M84qWKPQFODr/Hpe24iPlkSckPc6Tzx+smdmz9A8gYEIG7KlS1SsWJnRGs5g==
Date: Thu, 17 Sep 2026 19:49:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: broonie@kernel.org, chleroy@kernel.org, leoyang.li@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, qiang.zhao@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: Fix clock leak in
 tsa_of_parse_tdms()
Message-ID: <20260917194953.69dfd873@bootlin.com>
In-Reply-To: <20260917152719.2160395-1-vulab@iscas.ac.cn>
References: <20260917152719.2160395-1-vulab@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wentao,

On Thu, 17 Sep 2026 15:27:19 +0000
Wentao Liang <vulab@iscas.ac.cn> wrote:

> The error cleanup loop puts l1rsync_clk and l1rclk_clk a second time
> and never puts l1tsync_clk or l1tclk_clk, because the branches that
> guard the transmit clocks use the receive clock field names.
> 
> Use the matching field in each branch so every clock acquired by
> tsa_of_parse_tdms() is released exactly once.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/fsl/qe/tsa.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 4a88e54d25b9..94691369353e 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -865,12 +865,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  			clk_put(tsa->tdm[i].l1rclk_clk);
>  		}
>  		if (tsa->tdm[i].l1tsync_clk) {
> -			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> -			clk_put(tsa->tdm[i].l1rsync_clk);
> +			clk_disable_unprepare(tsa->tdm[i].l1tsync_clk);
> +			clk_put(tsa->tdm[i].l1tsync_clk);
>  		}
>  		if (tsa->tdm[i].l1tclk_clk) {
> -			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> -			clk_put(tsa->tdm[i].l1rclk_clk);
> +			clk_disable_unprepare(tsa->tdm[i].l1tclk_clk);
> +			clk_put(tsa->tdm[i].l1tclk_clk);
>  		}
>  	}
>  	return ret;

Indeed, good catch!

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
