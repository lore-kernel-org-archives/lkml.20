Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B2374170;
	Fri,  4 Sep 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510765; cv=pass; b=NfG+0vzFcRxCX6H+57a6NWquzFfrAoDTGXx1L2MCYwESlbvYCarOXDyz+R6Akl2Ur1z0QP3Fwiid9n4nn84j7OyUdkhBi0wqQPz3Pv181dGytsHs4jOLdP3zsd3wCI0DUbp5fCj3grwAQNPoxdEFLSe4MZzWXZOc9ifYzpe31Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510765; c=relaxed/simple;
	bh=A1ionmqEKEm1l3GkCgfBlnSZcWiyCYVR8Z2r/mzbFkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLMhlACPE6uMI3ehKyhSlXScqFqquWBAg5vY36boGoxXGGZh0P+Wbj9OIYQ3ob2pSpgHzhurhTkniZ0AdzWWh6n9/T0e1MhNMKoBDZLA4WBQB3FPda71OxX0rAOd5W7/Nv7w+KmtjFmyTKRxrpcIHQcUVa80vt9FFv/+Ig2eBd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=eRBk3PQn; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="eRBk3PQn"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hbqTW4GBMzyYR;
	Fri, 04 Sep 2026 11:32:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1788510751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28IRhM3DGeS+EV/r35VdFhzkgDyN7jtXsP2VUHTMJ48=;
	b=eRBk3PQn9dfdUImdybXnvBluEOVFeOBqbFLLvbHy2deJMPG2M5iYfwwLb2eAH8HDDXCzL3
	imQmKERpmc8Zz1cw65vFQiZOKSj7xM4jTENm7cj7V7K82tngqtaE8LIGJNGADkhC3bE1A7
	aMYt2LpQZhT1unxvu2dcav09Kl48/78=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1788510751;
	b=KFbmpax1iENFpDy+wLicbnO96pADg8RQvqegCs5+G5e12FFNanA7fC5lIDz1Vksd2wbmxk
	hflzxKWTdQ+j7y3XDlwKGbcKPfKBEy5PQLekX+iKFWRPy5PRRsY1hIL2vt3Bz9LT1OngoB
	HfH0h7b4uamMolblgRI+Gi3YZ+/vR+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1788510751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28IRhM3DGeS+EV/r35VdFhzkgDyN7jtXsP2VUHTMJ48=;
	b=PUuBjQ0ccE/ODPjigu9mxRqx5lg+XFHwHAyuj7rsvrkVDSrRyVGl/SbjH5R/fMeZ/j2wss
	HkWTyydSinihAakaQpUimPN7EayNbRciqp4QBHKIBhOUUzhEDxlQoXH4AS/rllsFqqHU5U
	EsKeHvxpP0yTlrnisboxfFPIr6XLi3c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1A676634C5B;
	Fri, 04 Sep 2026 11:32:31 +0300 (EEST)
Date: Fri, 4 Sep 2026 11:32:31 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: imx471: Add line length PCK setting
Message-ID: <apqCH5zmpHdgr7cT@valkosipuli.retiisi.eu>
References: <20260904075113.125751-1-hpa@redhat.com>
 <20260904075113.125751-2-hpa@redhat.com>
 <app-yOyzA32vQE7e@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <app-yOyzA32vQE7e@valkosipuli.retiisi.eu>

On Fri, Sep 04, 2026 at 11:18:16AM +0300, Sakari Ailus wrote:
> Hi Kate,
> 
> On Fri, Sep 04, 2026 at 03:51:11PM +0800, Kate Hsuan wrote:
> > Add the line length PCK setting to the IMX471 driver. This parameter
> > determines the horizontal line scan duration and is used to calculate
> > and control the sensor frame rate.
> > Set the line length PCK value to 0x0a00 (matching the original value
> > in ipu6-drivers), which maintains a frame rate close to the datasheet
> > spec (~150 FPS in 2328x1304 binning mode).
> 
> This fits on fewer lines, please rewrap.
> 
> > 
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/media/i2c/imx471.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > index 4053aed84340..3c939f2a9056 100644
> > --- a/drivers/media/i2c/imx471.c
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -91,6 +91,7 @@
> >  #define IMX471_CSI_2_LANE_MODE			1
> >  #define IMX471_CSI_4_LANE_MODE			3
> >  
> > +#define IMX471_REG_LINE_LENGTH_PCK		CCI_REG16(0x0342)
> >  #define IMX471_REG_X_ADD_STA			CCI_REG16(0x0344)
> >  #define IMX471_REG_Y_ADD_STA			CCI_REG16(0x0346)
> >  #define IMX471_REG_X_ADD_END			CCI_REG16(0x0348)
> > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
> >  	{ CCI_REG8(0x030d), 0x02 },
> >  	{ CCI_REG8(0x030e), 0x00 },
> >  	{ CCI_REG8(0x030f), 0x53 },
> > +	{ IMX471_REG_LINE_LENGTH_PCK, 2560 },
> 
> The register definition is nice but there's already a control for this.
> Could you do this via s_ctrl()?
> 
> There's also another set addressing related issues here
> <URL:https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@redhat.com/T/#t>.

Wrong URL, I meant this one
<URL:https://patchwork.linuxtv.org/project/linux-media/patch/ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu/>.

-- 
Sakari Ailus
