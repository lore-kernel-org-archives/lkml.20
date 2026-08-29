Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7E21CC5A;
	Sat, 29 Aug 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787999633; cv=none; b=sVFR5GQQbC3+L5GPsaGDN7UhN3aPD4W144sbd0F+6EgkkV3cPI7TfboWfArDlXDPHZtqNB9HldAFi/DmmLqi1puIjKebVLg3uVqHbqekz/xkza751wIWV1HC145xjYM+4+jokFaMdWzvzSRPOsq4rLlVubQVBm9hi15+EIbSWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787999633; c=relaxed/simple;
	bh=CyNWbqL86QD6plrZ8pEUR6ItTzNhZ/6s7RSwkp8kpT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqc5SgW7RSFoId1jpS2QSp6V1dv7nB40CkYljbTjZfRm71sZqUsTgrI7dt11iQNKX2zpveTbqm5own1SG2zgMR8vha06AIwUTd2rI6U1GHMQiCKcDs08w4HJYKlvh8aSwTIPaRlVSVaEIfFcBmgpdOhR7S20UoDqrZyBPXYEgF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=0GHt0P9k; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="0GHt0P9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1787999627; bh=CyNWbqL86QD6plrZ8pEUR6ItTzNhZ/6s7RSwkp8kpT4=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=0GHt0P9kToyAp6beaGLI3dQdGDqSckQOoSKTXPTVtPR4HLOZ1mjydlT91Qk1n46ZQ
	 lrhUC630/THI9mklFmeKs3A+6vZKEpgocaSoS1pifjy4KnvnEGvH+j4s/QwFVZYjbn
	 r3yRlYm6EIq4owpya3g/KuxWDLD4qGzUTXjL3w6Y=
Date: Sat, 29 Aug 2026 12:33:45 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx258: Add reset-gpio support
Message-ID: <juugztumfolybwpomnrzt3gssto2yh3h4rcfg7cghcb2jgwdau@tw67ppjr6hz4>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Muzaffer Kadir <muzafferkadir@mainlining.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
 <ccydtgy5lwhesdlg5mtbxllwfcnzhm3k7g6m5xyyhprwizooof@s7qrku6yvqlk>
 <8ad49542-e88d-4ac0-ab12-ef84382d96d7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ad49542-e88d-4ac0-ab12-ef84382d96d7@mainlining.org>

On Sat, Aug 29, 2026 at 01:28:31PM +0300, Muzaffer Kadir wrote:
> Hi Ondřej,
> 
> On Fri, 28 Aug 2026 20:16:30 +0200, Ondřej Jirman wrote:
> >> @@ -1128,6 +1130,18 @@ static int imx258_power_on(struct device *dev)
> >>  	if (ret) {
> >>  		dev_err(dev, "failed to enable clock\n");
> >>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (imx258->reset_gpio) {
> >> +		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
> >> +		if (ret) {
> >> +			dev_err(dev, "failed to deassert reset\n");
> >> +			clk_disable_unprepare(imx258->clk);
> >> +			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> >> +			return ret;
> >> +		}
> >> +		usleep_range(400, 500);
> >>  	}
> > 
> > There are two times given in the datasheet. min 400 us between reset deassert
> > and ID register read over CCI. And minimum time between deassert and stream
> > start, which is 12ms.
> > 
> >   https://xff.cz/dl/tmp/b8efc244280a2b35.png
> > 
> >   https://xff.cz/dl/tmp/ed9b967a140bd347.png
> > 
> > I wonder if this driver satisfied the second constraint. That may perhaps depend
> > on how userspace uses it.
> Thanks for datasheet timings. There is an existing software reset and 12ms wait call
> inside imx258_start_streaming function. It should satisfy stream start.
> Please correct me if I am wrong.

Yes, so that's fine then. :)

Best regards,
	o.

> -- 
> Best Regards,
> 
> Muzaffer Kadir
