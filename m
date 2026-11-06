Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966969;
	b=A4LAFZSU3jCjvRo9JiixjTqdM3UPksCeHF+ZeEmGnVvKQLjHGRv9fP77Z03fSSIYME4r
	 a3vT39uBKVid/q40h0jCGfswZwrmLh5kZY/RiziQR90seNzM3fY7OKjMyfnbLi4jhQAw1
	 Tuu4LkN8N5rgeoo9EMTQ7i8BSJ07HsQEd3YeSPyEk4y0q52Xw03F/kJ8S5UFE7SKu/EwA
	 MVadvk/9co9kJeUcz+Js+TpnhqcS/o54EyLuqvQjbplZv/rWL8Xtpni6YBaVLkqfQUynK
	 VEVMPjdbvZuyPV9LMVX8Pti8M90XxnY1hq5s4zrmrGCL6ffCgXRfQgzSisl6lw663KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
	b=rGRMYZkGjcXKsx3GTOB6HSCHMAnwiE68Mzp4eKLbdxyIIt5CKzJLfCl+BeHkkdHedyyb
	 +G09KE3tiS7IR+Q4IldaOs2Mw2Uxnjcb3wynoHl8cMOyRgbiRifMIFsqnQwcv2+ylhgWz
	 M5rAf/JMO9tt2hu+uSqxV7OzHQHKYk1RCq29sYKmQ01K2oQMOd4XNFEeau5bJufKpMa03
	 Syda+X02gyXWPnbAKfquYAy2ARAWatKWYWYVR4Cq9tM9gY8ngGDx9SEcagRv900WJhajV
	 n7mYFirFWdqEi6vmmeOBW0Zbw3s/LP4926M1FsQOSCMeEomLKXjmgkN7pn95QXayqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnVPtQ4h;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E881606EE9C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E881606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnVPtQ4h
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so6051855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966967; x=1794571767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=LnVPtQ4hJE+U8U1nrrid4USihyS/c14UyDvFeS0ZGtc9o3fc1Hg3EihfVvpNGfy5ER
         ZWRfiXThFLj3CY2QtTXmIzdxXERWVPqfBSnciPH/RSPwoOWASsb0HT/wxQpHUBF+Kkxr
         oHCJLGwIu+lDbfqW/N0gpQW2B5B4niRWQQLo+0tuysrU+u18G07lrkCVUpUPD2QmynsJ
         oNDGP1g7esOS4dD6qpaDed6UJWo8yU9w4jsMI0VJbVQvqePMyR4GVT1pho/rYwlWUCkU
         qwixXXKPIuwgUtqIIcS1Sk/bEtycg8QzbUWc3IVDE8Wye192mjss5d3b7RZSFn1Pt251
         2NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966967; x=1794571767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=nWU/I6E8NPg4hSQ0kO+CcCReMmYyXw0Ks29G3kTButwrX5V+DLKW43xclt6Y9nrtnt
         UXsGDPI+pRrTNhS+8ZDqjoDrnyn5kznextqN+Sw5qVDNrkvar0r2y4VM7TpAZskilV8M
         +kdqI/7eTNszPV3KZoFvtAPNupACJYu/pijuUHhs23XeWOW3zDPvcVacCp7LLLKgR9zn
         d8Hred2aEtfsmE296cGU4EtI9ZkbiS2q7HPeBghuDN36Y3rce63pWGMS9h+LFQ7qPULh
         oik0q3nTBfew+nu4e8ADCh01C0WQAIh0JXj7BKcDguUaPt68r23RRvuGLPdVEdhcH09E
         8VSA==
X-Forwarded-Encrypted: i=1; AKwUvByBtZtWPu6I40i0J/qhjou4zjiNYWqd6zY981rO1NFRCM+wj5Swz1gyCxvuR3O6dJRLOJ5Dfhjz9fnlHwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g8HbhW+Fs9ya+py4FmX3spZEnpui1cTh4aDovzRgZcnnbUU0G
	Zxn6KkALZeBFG6+xUtxOT5KBodwAkYQEekT6n944duFLEv586TQCyHru
X-Gm-Gg: AYBFou0UcTwxYIWHIhnN5MKfm6HwCQMjd9k6TwOFGA1Kvt7QTIxalfF/jRA+AAMR+89
	idgrWBfPE1Q4E0zqhkT/AifC3mVFWapvXAAfs2bNnSY1X8pGVrkYl8qeb+sY+JACy3TjHwqMx5P
	4yGtncGNGpJrlItYrEos4Ipg0rbHgipWuZEzEOWaX1WzGGQ2IQQj4LKXKvqlN9EiAlmwRbIBc25
	9JM/lkIunt9mOZgLTiuPJFYFiA5mDh8TnfZs10dh+Bnd/oRdD3NVhWPFS3j13A9gUJOcBkVaPk+
	YFyMs6WixSTLhI6OWQU8O3H3+yKhBDmHrYxQo5vDDVCQzfMnNnrvZoXl3UVRkLQkDm8cXHX1RXg
	6ZF26FE61zy5bbTQ/wZFZPPRibNRzID6PS/hVzJd66OF//3lXKVVUJ6I9YvhWAYw/LfFGn4Tpiv
	zQ3ZaOIjehy7gUkAtffoiqUyFNC1cPm2ziwIcuYiSJe1EezF1wtqLLf/7WCq6K2PP930ABe2uls
	fcD3/uwG1R+XPLmBKWmVE43h0MH6fKsIUY74XCLWwgGsSPGzkuOmRxNN3vMJAMCLJ5fFhHwdkW4
	2yYCRbkW5CVhXSHv/vcZ3LoBbB7CF2VZRedk21fqRhF344XJX5adDaQy2nG8J/oxNBufea+ZvAc
	8G9LfaFIURCu/fB0=
X-Received: by 2002:a05:600c:64c5:b0:4a7:4697:dae3 with SMTP id 5b1f17b1804b1-4b6dfca2330mr40505405e9.24.1793966967349;
        Fri, 06 Nov 2026 04:09:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm3526249f8f.27.2026.11.06.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:09:26 -0800 (PST)
Message-ID: <6aedc376.79189afa.3a0b25.2405@mx.google.com>
X-Google-Original-Message-ID: <au3DcuM4XQPC-Aus@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 13:09:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>

On Thu, Nov 05, 2026 at 11:47:26PM +0100, Andrew Lunn wrote:
> > +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> > +			    u32 regnum, u16 mask, u16 cal_val)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +
> > +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> > +
> > +	ret = mtk_cal_cycle_wait(phydev_p0);
> 
> 
> > +static int airoha_rext_cal_sw(struct phy_device *phydev)
> > +{
> 
> ...
> 
> > +	phydev_dbg(phydev, "Start REXT SW cal.\n");
> > +	first_calib = airoha_cal_cycle(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG5,
> > +				       MTK_PHY_RG_REXT_ZCAL_CTRL_MASK, zcal_ctrl);
> > +
> 
> > +static int airoha_cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			 u8 start_pair, u8 end_pair)
> > +{
> > +	u8 pair_n;
> > +	int ret;
> > +
> > +	for (pair_n = start_pair; pair_n <= end_pair; pair_n++) {
> > +		switch (cal_item) {
> > +		case REXT:
> > +			ret = airoha_rext_cal_sw(phydev);
> > +			break;
> 
> > +static int airoha_start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			    enum CAL_MODE cal_mode, u8 start_pair,
> > +			    u8 end_pair, u32 *buf)
> > +{
> > +	int ret;
> > +
> > +	switch (cal_mode) {
> > +	case SW_M:
> > +		ret = airoha_cal_sw(phydev, cal_item, start_pair, end_pair);
> 
> 
> > +static int airoha_phy_calib(struct phy_device *phydev)
> > +{
> > +	phy_package_lock(phydev);
> > +	if (!shared->rext_sw_calib_done) {
> > +		ret = airoha_start_cal(phydev, REXT, SW_M, NO_PAIR, NO_PAIR, NULL);
> > +		if (ret) {
> > +			phy_package_unlock(phydev);
> > +			return ret;
> > +		}
> > +
> > +		shared->rext_sw_calib_done = true;
> > +	}
> > +	phy_package_unlock(phydev);
> > +
> > +	ret = airoha_start_cal(phydev, TX_R50, SW_M, PAIR_A, PAIR_D, NULL);
> 
> 
> > +static int an7581_phy_config_init(struct phy_device *phydev)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	u8 phy_offset;
> > +	int oldpage;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
> > +
> > +	if (phy_package_init_once(phydev)) {
> > +		ret = an7581_phy_package_config_init_once(phydev);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = airoha_phy_calib(phydev);
> 
> > @@ -88,6 +1610,7 @@ static struct phy_driver mtk_socphy_driver[] = {
> >  	{
> >  		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
> >  		.name		= "Airoha AN7581 PHY",
> > +		.config_init	= an7581_phy_config_init,
> 
> > > There are 4 phys in total, only the phy with mdio address 9 has the
> > > calibration capability. Thus only one phy at the time can perform
> > > the calibration sequence.
> 
> config_init -> airoha_phy_calib -> airoha_start_cal -> airoha_cal_sw
> -> airoha_cal_cycle
> 
> I cannot say i looked at all the details closely, maybe i missed an ==
> 9 somewhere, but to me, it looks like two config_init can run in
> parallel.
> 

Hi Andrew, in v5 I converted the driver to full phy_package_lock/unlock and
I set the base address correctly to the hardcoded value of the SoC.

This permitted me to simplify the validation code instead of saving the
phydev for port0 in the phy_package struct (a much solid implementation in
short)

-- 
	Ansuel
