Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6CF58FD1C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986575; cv=none; b=oMqDaSZfdn3YrXUKie7HjoU5Lp2VAIJSZV1uUyFT6uHY/0ae+GzoixXTojJ8CPm90iDTbPZCZGNQ2eSq2I/IaK/IlL0Lgr12qAlUy+Pyd5nr7mnOju0sAQmCN0xmWEkGj9Oqfw8cOXCV52aWiIEQtFl/PKTzYOXznk3NPSl0uns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986575; c=relaxed/simple;
	bh=E7DWEF6kIazrc+lVVClekzdOah7P641Dc3PJ2nRN9Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmrn7EbioWXvTjQrOSxDleQg5HpQls7ihJVLpOFMvPivjnsiiIm5L14nsEZ9aS+l0xpvZYhbeNDcChjyLE8DBTBuMiKy9tzkSkhxTCRdgz+VQCFJibS7fTyx3OKqWsxmbFKNx4hoEgSf2gzcXeKHUOUuH1YWCj+153lmQ1W8zmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzutj+q1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzutj+q1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dcff8f44f2so15075255ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986569; x=1789591369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=bzutj+q1Fppr+Gt9UeN9vABv3gUmz1FwFsm//AkzqFB/cJoa5l/wuPpFwLHMwc+Wib
         nDgppEui6tU5k3BWZfuv60DElJ+ybZaXpmcQUV7Ja89RhWUqhFIBm9C5CPeFUPD/aTvh
         P+ocq3ccwaPJ77XXCx3Gwm74BHkgd+iQReOKa+5FOItmOE/WaOsRXLHyVy/C0yfmk5BM
         8yJEzdpi9Okz0ydZYilSs2cbv6Gnguaxw72tzxF48pcu/Chua1Cas4kqqjbSTzRLzjIq
         DmNUJmDrURL75lZA0VeWNmLmUWPAumCwZuslZjpTWgVmjlUNwt2axVVAO/ZQG9KFBseo
         NOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986569; x=1789591369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=DHfXDDSjsqhcomMpqOjEYUkp4k8v2Zh3dmIa1E8Ih2yhKe9dNnDx6W3/FhtCMXz+MI
         Mhyu6Fg068K+CS14GRJhKSpkqRdQ8Igk9cdoNXt2uclFNeGQ93AGnOufkyNFirqN++W2
         hDO9SIqGoAuqB/OTvBMuefHowPf+TIgdfnbH9lPKB+2yXLR9KLe/cA9CPZ0aDK0d0Hpo
         ceXaTiamI61YHonO9hUTay93BOlIA77sSwOSYuF72lZPaEPZzGgT/N2/99WxqH5cQoJH
         Jjv7cwhsi2AU+MDnnOsaP1RfJNgrDxafec7iFh5FDL73fGLeuGR6NBGU/e0Hk6Aa4TyA
         ZoMA==
X-Forwarded-Encrypted: i=1; AKwUvBxB+pv30Cfzn7Pb7Pz+y95nCdVGjQMKzoODrN6T3XSm5XTHnKOHT3bURWpsyKRgp6gaIbgsxswbc10J37I=@vger.kernel.org
X-Gm-Message-State: AFuF++lfFS25bhCNi1ljS0uX7bIMB+Ofa7WfnlLXdpu8xt3FEfJInJkc
	qOwN9DuKsHUDf0BVKGZ+BgKbDF3QSWOnEozhHfYkM883QcFz+7x1cFx7
X-Gm-Gg: AYBFou02u0U4jT3xMDie+ret2DKtqbcn07/dvUzH+f5v3Rb4obaNOC+UPgPHQL1MR6o
	8Ne4ZCsjs7sIxRqosAda8YJY38wKqxrAzkDli7GRiBAXeIczcYv9+hdwwA3rrCG31HWjXddb5s9
	/NVmV3/cCZ+Pk5JiEu+OtzTUKtOe6zqd6LxdNz4/XLL6suK6R8+KLD1GyrnNisdLF4PTtehtIRQ
	PjeeA9VkVisoLDhJS/mGJvdGLyCksQz3DBU09Z57icrDlv9I6EK/q6d/Dgy8AMam3oio8tVGJOZ
	/sSb0cySRDHlMT0Wl/vvFtgycY9gF5lT6PsQKAiYKNr8CREzFPIRUkFEZcNIc3BayZdpVRbH6cY
	Y2XWPorOfnMEAhlP3F1UWZdJ4RfJlz3lq5e6v98rbUOyUclwa4MYUvKGd1zi4rkUegCkj9eMeIG
	LezvD9bmG+MzXfhFeGTVd7EWuS79YDG1Ny9Hw1O+6UYdu5RYxUi2O6TSRrjfyOcD2dkuM2NKIL8
	taeZvHCfAdt
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr59642710a91.2.1788986569020;
        Wed, 09 Sep 2026 13:42:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d774197c4sm1220340a91.8.2026.09.09.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:42:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:42:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <6a212071-3b1a-4dcd-8d9c-8df6352813b9@roeck-us.net>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>

On Wed, Sep 09, 2026 at 09:38:00PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter
