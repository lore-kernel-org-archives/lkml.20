Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA533C73C1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499124; cv=none; b=PlnqHPiaF3jgLdyRXv6OIpW6tncT8pZPrciU5XBPGjqiqCC4ik39/X/L0h14gj9kQ4V4F+eDikJ3b1XX0hY0sGjKLT0+1bs0CQgEUr5sn1qeGiFn7o4zmUIya8hXp/Ag6OxxEapS6YyLIiTsKVL/aSJ3O2jwrxh+aPCMbi03VD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499124; c=relaxed/simple;
	bh=YT6LdJDZcgJoel/pQalUJpytYLyjX43h0qAkBMmzYhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=beW//nXOjNDYgXo97/BdNm0P0MWK/bYtrCdDVPwjZvIQ+fTB5UU3O6WwmqtKbox7wjVdlIZc8Ein1ScVYaduuZCDlgsbiknt5enDKUjm3FMmBz3VM/6msQKqYlPg2AqWIgNFHNbeyJJQ0tfyBtgqhEknHozTMiuqMb3SH1Vdwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ososcwGZ; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ososcwGZ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927085153euoutp01bfa267ab6ba5a1acd52352409393f905~ZIXT8__EU0533305333euoutp01e
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:51:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927085153euoutp01bfa267ab6ba5a1acd52352409393f905~ZIXT8__EU0533305333euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790499113;
	bh=TL2WWCHAv5jgtlCzKv1V0I+GLkNMiDKcRehtweoJ4Z8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ososcwGZ4xfr/2WYXIdWgJ04YNs2w/oxKN8JIrxSP2NhuW0U6MJnH98VoQs6RAdII
	 buPZaQBZbhpAJyRPOv+MjTWIZJI66GP/mEHV8wYK7ifJtO+Nr6Yz+Kdxw8sZgtttLS
	 TD2FkrF65rme0ROEVgVLnA7UXseF1oNF4Bbqj+zU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260927085152eucas1p274e0c4d85641cbbc5e727b4b559d21cf~ZIXS8Kxee1311413114eucas1p2N;
	Sun, 27 Sep 2026 08:51:52 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260927085151eusmtip17821e73d4d34df7984d3e446c0c89c58~ZIXSnxm0o3108831088eusmtip1b;
	Sun, 27 Sep 2026 08:51:51 +0000 (GMT)
Message-ID: <9274543d-c569-43a6-888c-9b74d1a8c92a@samsung.com>
Date: Sun, 27 Sep 2026 10:51:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: inno-hdmi: reset DDC segment pointer per
 I2C transfer
To: Dominique Belhachemi <domibel@debian.org>, Andy Yan
	<andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260528184145.384114-1-domibel@debian.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260927085152eucas1p274e0c4d85641cbbc5e727b4b559d21cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260927085152eucas1p274e0c4d85641cbbc5e727b4b559d21cf
X-EPHeader: CA
X-CMS-RootMailID: 20260927085152eucas1p274e0c4d85641cbbc5e727b4b559d21cf
References: <20260528184145.384114-1-domibel@debian.org>
	<CGME20260927085152eucas1p274e0c4d85641cbbc5e727b4b559d21cf@eucas1p2.samsung.com>



On 5/28/26 20:41, Dominique Belhachemi wrote:
> The segment_addr and ddc_addr fields need to be reset per I2C transfer
> to avoid stale values. The reset wasn't required on simple displays with
> only one segment, but modern displays with two or more segments end up
> with corrupt EDIDs.
> 
> This was found on a StarFive VisionFive 2 SBC.
> 
> Signed-off-by: Dominique Belhachemi <domibel@debian.org>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
> index 5fa533a4eb342..297be02bbd58d 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -989,6 +989,10 @@ static int inno_hdmi_i2c_xfer(struct i2c_adapter *adap,
>  
>  	mutex_lock(&i2c->lock);
>  
> +	/* Reset segment_addr and ddc_addr at the start of every I2C transfer */
> +	i2c->ddc_addr = 0;
> +	i2c->segment_addr = 0;
> +
>  	/* Clear the EDID interrupt flag and unmute the interrupt */
>  	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
>  	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
