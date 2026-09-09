Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2060356751
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940849; cv=none; b=YwdLSixO0KF/3WVZf0FAbI2N1lDHz3qxYewE3ejasBoIBsQS+vVlqkTDXzSdLQy+vdMUfFBweD3/8Kj2SUQPpx2dLEYE/Qd67OXbIWR3HC+8QuDE4t5DZLQSg6O89SpgFFD9+9XWpal/guqD27R5pzfg/eQ0oQ4Ms92TGUoFtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940849; c=relaxed/simple;
	bh=aN1MVkOCjwtOucEg+oqql9Bc/Rq8wSbHbAKKZ6P53QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbXe4uA9ewCVMXuNi3uUSCEGdaNJ1ekTERzEPg0hNVvaTxuQJSWXx85UatpbwmyMg91O1BHSUIu0RJzzkK9P+Zf9VVGH5xotnx720momayh6ixKvhZANcmWKgPNjgPmxKr8cpyxD208+KEnD6GWB2DyORnC+luQPzG67svdFV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2eN8CAY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2eN8CAY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dcff8f44f2so5152795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940848; x=1789545648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=C2eN8CAYzMx4WTAcGWVcwXErM0jOxTQm/d9Dv3GFEbwR8VQGxz8MATAew1M4kPZkA4
         +2OX1NgIAIu6HM+c2Dvmflur/YREZcONrVjNHzgZFERXsKDXofpXs+IVu9Kzm6e3tpDX
         EPbp51rKc7PuPOvaL4e7orP808wu0AI0EAimfJGbDmb0IYiUTQD1G/ds4zaXQ8h+T1pJ
         LxsexshAxAkttyec5BYidKWvJFll9R2IsZLVhQmYfASYikwANWgb01fsWbgHw3soSmAD
         YuSThxA2VaZ9YYXElsmWmhZ4d+Hl02uaiWfYm/k3MogZB7cer9p/wmt9lLP4b0/omwR+
         IbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940848; x=1789545648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=QGmlLOo6R33FgWT56tTtu6GNRx234I6wA3hFGbblOMcQFf4xwng15jjg6sBQF/jC6N
         bnwV4bJAlCQvTP8t2rxcAfQmCm6sLThbiPcz+Q02Q33B+c+pvyGlOyZ0j0eMYbnJrAxA
         p25xhmf69awsH9lPfc+e1I8CM+hkiJfoOs8a0VxVx1EHFCEg9K7JqS6evtC26w88Y95z
         iNLJlHhGXejRYc8VbVTbGkxOvxciiQVg0cWQV7XY2XSvuvPMU1CQLHMB0p06bLSaLYrd
         9RbRERcf7Wt288rS9WYxOn03TmNgh8US3ntBtPegqSYvHqRa7nk+y6v1/bp2U3lCFLOf
         Nz6w==
X-Forwarded-Encrypted: i=1; AKwUvBxrOos9UnpKM97JCtiHejDwbHfBgqb4tgIUYVKdJyofet6GxbjAhOpmkIGocPgv8LB2x8nkwImTpIDtl1o=@vger.kernel.org
X-Gm-Message-State: AFuF++n8dLl7xqdIhGmvxPfENO/7D7dWUECDBRVGNpb2IKYM6slhk39F
	KrzJ+cR82AEnvWFwOIm1Q+lemh+9FTaEEcCoLsYOCNvjaa204IK/5rkD
X-Gm-Gg: AYBFou16d7RrCadLHtZOoK53tDrz8B3WKRtNp6Y2CK+PzoLZ1cecOIvYzJnBVtD5jFA
	r02SRP4vfIuez/gagK7GzFXxHc5DXSYYH5ryEQ/jHvFR4GhjgkyKXpyY7rtx+lWM1ZjCW5rB8p7
	h496Rr2cmkYr/NatGMICJTPIKKll4nGoeeip5aXHLpU6MD1OcCDguM2yyaqX++ImYl3GGg5ueT/
	BGy8VWykzNsCeSf9b/ebGryowD35A1ojdVdqU8VZo9AsPzQagMAi5zAZCKyDdFwXVBZkuJVyTEQ
	LuX+46l8KuPUee22vCBuqIjlxrzIczIZCClus8/Idj1epEOUbsWlCmCTXv2c6oXJEPzy4ODjycN
	x35x26c4fodf2ByTKeSnIWcIC1PdxSIjbPTq9HIajDtlBJW7NTmD5tXPdxeRnEF+hN+fECrJeM/
	b6qCqNWkJp2a2+u+O/SNIn3TSVrO63H5vhH0XkpZWi9PZ9HGfV3FdIT84+rOuzjKhjFG2hEEXkz
	H+xdNtS
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr497594465ad.0.1788940847987;
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db56c2a1f1sm37775965ad.78.2026.09.09.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <aqEQnkrPSKB-3fam@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_jh_NAqHnIlZeu@ashevche-desk.local>

On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not supported by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> > +{
> > +	const struct k1_pcie_device_data *data = k1->data;
> > +	struct device *dev = k1->pci.dev;
> > +	int count;
> > +
> > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > +	if (count < 0)
> > +		return count;
> > +	if (count == 0 || count > data->max_phy_count)
> > +		return -EINVAL;
> 
> Elsewhere we distinguish count == 0 with -ENOENT.
> 

Is there is an example? I think it is suitable for its internal check 
to translate -ENOENT to count 0, because no phys property means no
phy. For a get helper with optional semantics. I think it is fine
to return 0.

Regards,
Inochi

> > +	k1->phy_count = count;
> > +
> > +	return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
