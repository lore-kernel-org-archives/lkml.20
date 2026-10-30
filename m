Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.74.137.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392074;
	b=oZ9uVxrqktoeeAkGqFVO7QQI4KfUdgzqbRI8pTer230PZqFGgQ+5ddKD0bSU2ESfiutQ
	 c2ZDxAvjkkhrq5i1e+aY093ihzI8lk8/ojrHet8lTzKxQRlJ74qGMBsVmnXGKT9DRvqkE
	 I1CrR+Ntc8MSCLgnzyGEeAHh4oP4cpE4o9Z4T6QA0MJJ6zCW6TuYJRLXSDYLJRHZ0QB4o
	 9OSgtnhaGa7SE4/ZUw4QCxs7kJwniThVCPoSoOSHku8MvYbUjR9AnmHdLgxk4mAZdgcKh
	 bYeJVpIILEsJaC+vphGgfBja52Y0BJt+dD6aYsIi3Kp5K2yGq+y2sGKY4qKBQRiSEvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392074;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5xXcIDxiVniNGdcbQJ6nFzj4IsHGrxD6GcvvhJ9Jcnc=;
	b=mIab0/7njD6vXT9A1BA9L7KMxthPytMc/PVktirF7aTcpHLhkEfmzaQ/dsI2J2DHlbVV
	 3xYTLxRk5o+Camz4SOPAPv1to/Gb2CJKZnkFUmN1ysdpnRGSglKsUVpSgi4P1nd9YIXPu
	 Fcj6Ok3z7m33Lkt3Zhi35nr94pChQSLtvRxgCRfYcCLnSr1lvBwJadmUB3qE28x+rrnHx
	 MMQzvDAkyAcOG6NZw/smdp9szVpnoAwaarN6sQFtjm9bKFiwuguimar5hY02RcadbVEA0
	 vnscUPRQgnPQLaWctIsqCjroHsrUKWqZ8yw+ogVuKzJo8ShE+xspY/wRMaOjI8BChCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atmark-techno.com;
	spf=pass smtp.mailfrom=atmark-techno.com;
	dkim=pass header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=gw2_bookworm header.b="Qz6wV/h+";
	dkim=pass header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=KBww5V3T;
	arc=none smtp.remote-ip=35.74.137.57
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA349606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA349606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=gw2_bookworm header.b=Qz6wV/h+;
	dkim=pass (2048-bit key, unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=KBww5V3T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1793392067;
	bh=60Y9mp/9FBJ5YXY0MpcbRT4JhDkOWUwbs9rLePa8GmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qz6wV/h+plEJd+K67Vb5tmkZWeLR+wDLDtj18Yg8jDfEP/cvYmqStznT1yUO5Oa9R
	 0Gd2fP/UDAfNu9qCjmz0dHdeVJZN2PFLDE/Xs245jF8aqEyNQ02etJGoWsCriy6hNK
	 nDLZYBGkccOuzCWBysOiG/vo/T3qZoUBJCbR5PBJAV9YERPaCZSmnuFGHj+pD8DaXD
	 zk3XptScIGbLi8bJ0ln6v60T6zJWXxzsbp5bOH/Ys8pRmjfWcgT5jqlT8V4e0YWNZL
	 VgKHg0i5piN1EVNkRWtohxGj0oSJ3jGKoQI7946AtwhhhhDxe2eGlL8mPbF954SSjm
	 A9kWzTF7o3/ug==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 853C44CE
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:27:47 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=KBww5V3T;
	dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id CD68E3D6
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:27:46 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1472137a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1793392066; x=1793996866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xXcIDxiVniNGdcbQJ6nFzj4IsHGrxD6GcvvhJ9Jcnc=;
        b=KBww5V3TPYMUXEMNVXYyOE/FV8quiZl8H18D8zMs8HCjP3FUk6EFx5TpC3vWms4TWN
         HVWt8PIZK1z2w2TMYcCkVLa7SVXqDODk4pX84E/3taI5a0cjTx4VZrmkcwuapezHGWGj
         9wlDJ/SD6/oJGxv8h1EA3rr/jjW4oThK8Ld4QCxhvkxXVyVMWBoF1y1TQXnU859VLPtU
         BbgtqfQu/epbKbouMgZzAATgU6Of+BbMUV9QnztQXMaUozfNPU73guK5uQPPvNBCFs0R
         MwyRh5M2OVVE/+RsgPf884z54urqzs2Xb4+oRxeyJe6Co9QoJxvbtcaimXnPsKNFCuZp
         uouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392066; x=1793996866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xXcIDxiVniNGdcbQJ6nFzj4IsHGrxD6GcvvhJ9Jcnc=;
        b=EXTTURAgQTTDraHy3wXbJdTtzm8gmGQcH5js7GkikgzCMPnvzNpFr4OdWalqwosQhS
         E9JwaUKH8YA9tcOAtzjdXmqIxTNy6M4AIoWGoJp1XB//hJ+99KeUimA62shm4chni5PD
         K3jIUNYqcrronE12bxOPIZEcNwbCl+Vhvz9ObyJmmG77PkGsHiJDoeVDdzdZLhTizxqz
         hVy4GosllrEcIprWuFLab9A37mNZJ8+P8xFkQu0Xf4bqdPW2RdMRbA+V3LMTzot2J6Nb
         tXZ0zCwcfAc2e5Ri8z5uO8SjvJEOoxirx+3ORZIBLLVXSD/6fdRy/dqVQ0Y4SIH08Ulb
         sdsg==
X-Forwarded-Encrypted: i=1; AKwUvBwQQMcJ06WrwCRNoAaMM1dWMY2S6xuVanLwBUBl2x2JWSm+8wXmLepT/5o5GUAltzA2Z6RzYRHYFUyBTC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Bwb1OMDVMYCysI5Rxm0kJVUgiNuGzAQmQwdJ7VlAZG7oo+11
	HDyzvnsUuvg7s2xPliU267IKmigWfBbmAx+8IEYThWACCSDgrXBUqbdUw4KKvgnU3dAri6qlyw8
	HPSqcUCxGigaqF7I45Auvo1vLc/biLDfslVRpP1Gvo8XjZ0v4idVtetzDVdug3JW4WpY=
X-Gm-Gg: AYBFou1SNnSA2A4cNXyNS5/kpH1gNkNAmbCEEt5Jcdh0sdKr3RIqOGWg9YhnZZhNYxM
	VR1SXjyOfvNLWjOHjvv2cgxGTklH7DOILwKUMQ2E/Ub71GqkiZfeeI03KaKXIa00cPfByKc3UuA
	qvs/7W9bBykfZkMbqsT/5VvUyJSK7bshe9jVKsIgXlyGH5jDz8ZhEh4iVt2X2ONHMpj4q3RzMB8
	OpEwd5MAXfH5Y+oyU0e2tX+ueowcNJV8Jai5bkz16TmqVz6AU3HcOw8jaj270L3jBWcbt3Rc2IW
	KB59od+Wq+R67hV7uqULyfzTfoY3QGXlUs8DSdOcw8SxKDBzvptWgdWHt4ok9EE9nAi6Wiw2jhB
	FQpqTOK2BGhVFT46cfhzDnIy9Fvw8Vl/8Xz4la8iYzmNqCAWm5XGMQIHXHJ3Qj2jEvh5Hmbp63r
	+J/KDwpV0Uw0dB7HwngGN/
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr2859639a91.41.1793392065719;
        Fri, 30 Oct 2026 13:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr2859629a91.41.1793392065287;
        Fri, 30 Oct 2026 13:27:45 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3ae84596e3bsm5414317a91.9.2026.10.30.13.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:27:44 -0700 (PDT)
Date: Sat, 31 Oct 2026 05:27:33 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daisuke Mizobuchi <mizo@atmark-techno.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
Message-ID: <auT9takcaT1TWj0W@atmark-techno.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
 <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>

Miquel Raynal wrote on Fri, Oct 30, 2026 at 06:45:26PM +0100:
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -318,16 +318,11 @@ static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> -static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
> -				  struct mtd_oob_region *region)
> +static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				     struct mtd_oob_region *region)
>  {
> -	int num_sections = 4;
> -	int offset = 64;
> -
> -	if (mtd->oobsize == 256) {
> -		num_sections = 8;
> -		offset = 128;
> -	}
> +	unsigned int offset = mtd->oobsize / 2;
> +	unsigned int num_sections = mtd->writesize / 512;

Ah, I couldn't use oobsize for num_sections because of W25N01KV but
using writesize makes sense as well as there's one section per 512 bytes
chunk, and this works for all devices.

Good cleanup!

Reviewed-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

-- 
Dominique


