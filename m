Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E6434989
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985608; cv=none; b=ah0w3Zqh/d0Zq/sIJyStAGL7w3fJiN8owZ+3rkrGdrWTEJIZ7p82JyrZ15gyXzetinqMg151MllkTtarptHu5qarBPIikCXrU+w+CbZwqbrErVJ5Alg4cQf0J8ptL70a2D+gmoDGrBTu9O7MGImit9gxx+I7vdYwx2nVdtkgAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985608; c=relaxed/simple;
	bh=0p8Nkk2uR5bJct5mDj70pGBOis/omuOo7vuJrgv65Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0Pv/YJSIyOrnBPV0oDQTICtHF78zDzNi8erlzS7vl/22uFqfToHq/Yt+2aRa3fLWNKFkGV1EAnYyhVBodxUIt8NEvaNjlSTOLg0MoYP76MKwMC/4a31btWbfgTdaTdnmiPRnHaDGapDwmsIFrBLK9yDbt0KG4VdvL85qptCFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AohOgggQ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AohOgggQ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so185832a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985603; x=1789590403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=AohOgggQ5aKgD4ZkgxVcEE+fpiUWut/XEwN4ZefwAqF2tJMDvJmFbw2u6kMkQdMP/p
         EiCMDLZl/6CRcTagFPiboGekl9cTt9AL3yGoyy/B5w+l2x+rXzXKZH6/r0Jv9Xc2Z3pi
         Xuqq5Hj5otbjR1ia9cfAWv0IcDh1m+7mk/SwkHGe/rfj9Wwp+0ckBwtIpI1prwRXSbcb
         H0DpydB6uKg1gSbtSgplpW+LvDWaYBlUlzkM0Jk+fQzcxGlZXfs6n+92wY2dKilOHrq5
         IOBS9kfebFvNMszjaHxB9wZz4ZM1cK135TuTfmY8vH/P/nLANeV/v1Bgr/zoAuqn3ltB
         4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985603; x=1789590403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=nJakK/a5pW56VkwbQ05p2yW4UC4+A9I8BCw6C+K9CbOGc97E7EGElyzG1r3KTfi8RP
         O5fblxjKaVPva2fxX73+Dnt0w+CqDLWq4S1zBwlpR8QYiMfXqM1sLSv1zxb91JgU0utJ
         J3Jvnc5K9fHyzh49Dmjb5gH028Z5O+T+a4lDAaW3mgz6nc/L6jN29B2pfuknYPWJN45J
         A3X2Zfql4DmZr/8Auyy9HOfK/80hHZrYBpEJq8mklS9GZcu/zHxxEeH49gDRpZ9Fj4HM
         j+pd8SntFymkjZShElAZXJsftpBAdmPVPWpr7BEWlR+mSb3iegYs0K8inBkslzE4bKW/
         EBGw==
X-Forwarded-Encrypted: i=1; AKwUvBw6YxD3Y9RibG0vJWkU+x8T+AOKN4xtXBxfkCIsAaDc5rFpv9SmUNVQ5iB99beXV36i5+HApIU8UQcijk8=@vger.kernel.org
X-Gm-Message-State: AFuF++kmHLeS03jwheQsu+xntlxcJz9uXYKSEX/v4gFGmvpYYgtK5K2v
	xcFuYdx+ugPPBfWnmAZJIgQ95n5joJEmWHhEIIB+O5dNApj7uVrQs2dL
X-Gm-Gg: AYBFou2h1dZL34rTNrH2TFVP5efkwG0cMtzQuoZSaiWF5tJ8SK8l4Fz06Uej2d0VWzJ
	hqG4V3OdF/dbyLPG1FqULa1TkID38TjLSlJHP3S9tgD4DQ3eX+FB+foMqnmkz6Dy7g3nwon01JG
	XZGn9qJB/OBNd44YsHV4cYrvTiPPdgyTGyw2Ip7KaCPL4H2v+GjrCXJ/GroqBhIWC3NXtbcfrgV
	NtcspszN8GUjOrnJvDQXgFytc+BI5xqrKkspquqpP+WWRllZqgAqXzaGdoVWpdFV0o/U//Czcv/
	eED2TX6upex5L23xZBXXWUL14amVyeJkNz40mvqTeKpj6u6516vp8B7LrXzrSujBwU0KLUtGQED
	OQL2FuiK0yYI+Nl/knBqFWSR4KoPsbfYRCFfJlOLaA0sI+Z6UNrkXJ3pinJeSH26xVJotlkZnbi
	LRLZGaj52ENtiPZ1+Xf8wBiZ16iWBpMIvkuoi35uEUnDFI7GrTBNMyDyx1zF2+faGk/Z7BBJOAO
	DF/XG4RQHZZjahfOiIbrhg=
X-Received: by 2002:a17:90b:2f8f:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39d779bd533mr1151278a91.14.1788985603264;
        Wed, 09 Sep 2026 13:26:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm1175896a91.15.2026.09.09.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:26:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:26:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Message-ID: <6faf5d14-1698-44fc-b4d3-492f567c6172@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:54PM +0200, Paul Louvel wrote:
> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
> 
> Also add the NCT6122D/NCT6126D.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
