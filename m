Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BB411661
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376058; cv=none; b=VW1jy5W+IOkob9e1aV2dbbUlJVwmvyLZyVPuOxUaP5Mu9Wk6Hexk187q+g2XnpTeOxpEMl42fsP17mO8enXHEcl3Q56JBMiydjHFyP+g6q38ivmIKLNTywpAK3JzPuOBw+7NFMCFvt5z47DbIKeqyAIZ45NXyq+mHfIECb6kvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376058; c=relaxed/simple;
	bh=qFnrZ7EQGr/Nuy+M5wyfqqYr8TfZ+ni22DbJJQ8c36I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tD4+b3ePD+dFwbnZL1miadQlXgXJ+wr7EQtLG6VLmGwdkemaPhEj8dc/atBmDM8YoZ7ucev/EcSs6FQHtjHsRxypynedD/6gfaU9qw24rxnYnk3h68C3rtg9q1WFBLXJbwNAykxDUfn3NHMRp1BOyTPEO452PPjUC+MnsXpjJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTeOOUfv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTeOOUfv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so2345426a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376048; x=1789980848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wa0N9b93v2KYOcx/Yzu42GebihJotfz/VPHeWZU/2n4=;
        b=QTeOOUfvnMJc65Jxu3+9WpewRvq5oTQRW7exJmTc4udDU2r38KsrptIHkNtGiEc9Np
         1z3ie3aueF6yguPULgNw8dHY9X4zCoYq1MLyYyW9pwSjdG18l3/YWDh8oODm+ZXjb+ak
         2PaKu631LWDKhAeK8nk6dpQpytnHzb1ZUIQ6n7iZNjquRZ1QyFeShcpwEdS1tX4s/2Lg
         LC4TJLXsmastJOs7JtMMtOVkAgz1lqEvdnS1LQGrR6EbFxqzNivvAM/rt/yY81U/O+Lv
         L3Uc+YqLipgsu6amL5gv9EJxhEsSa+yW6pXmDhpyKU5D3BCmciyLev4UQZU8eFg1SezS
         FXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376048; x=1789980848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa0N9b93v2KYOcx/Yzu42GebihJotfz/VPHeWZU/2n4=;
        b=MsvENffqcvzSwhvhIv9uAuMYxVlcksGAhA1mWq5XvgoT2C3ZhdqV4flRp5jEVCQsBZ
         BIziYIvEJPErWn3mOm6J801lCcZ217ldF4OC0freaq9qQ+7BX5eS2dp/hPl7FyHHYgT5
         SHtQjiN+AZFFbimfGa1GUEawcnjIMAzhCtIiaeJcTHpaijxciXKOcJ3Tswy8ADzm2tRw
         TclfUQLteubZoZXmSOZdAkUQke1lrbU2x/Bt/Scwy+9ZjOFPrUIOQaaAlmjzAGKZxDiM
         8G7UGDJaxiXgJSnEu+3lhBWKxTDqLzEc4GBX8y+SBpZy/A92BDAGjN/9tjfVf6ZKVdqu
         XbHA==
X-Forwarded-Encrypted: i=1; AKwUvBw27tB6kJ5+V8f2eLweacBubEmIUpwYRJAM+ComNRsFaM+5qMJVdXhEeL8Cuk/evHzVx81RhtFG4dzQyH8=@vger.kernel.org
X-Gm-Message-State: AFuF++ngSe4z45/PSzp+IQtqerlXD7Pa914cEB7nIC5dHfGCPx4xH7Dd
	xn80PWMQTxYGGDa9YytWwUW4bSriyyi7sieSh4vatAKYJZoEzYUdGGdO
X-Gm-Gg: AYBFou09wpeysTR+GOv5e5Yuf2AkMvyjGeb6ILcxWX4hC9ij+ugQ7Nlr8xWLzrqZ3gM
	/e0FzWrSL3hU9BzkKt2X4FpJIesgl7Zjq/jglh1PGW5YnA1WIlkmux4gFThsdLU8Iq9DFvavNxU
	8e+5P+5ABKzrksTa2xY1/akZR49gkZLDJ9LT4AkUf9palOo9ojuNaB8mmBuGc/ktq1xN5BlcWmX
	cNbZd9T9pVH8T1OncNzWGdNzhCkNwgycE+hYohD/knlZZogum0VtUIzjULLpW2nwyG+pYLZ0/Tj
	lBreEaSNH757DrnnVwRMdc2oQb5vSQ/uqnh2w3Gd2kiXyhXZJl3l1ubGF5gO3uTaOqbmxWU2R7d
	2i4ib9gIAVXo/XJQjMHzSxa7hqMH8AFuVi+aKDh0Vi597CyXfHHeZfZPbGZHGbzpdxjCPj7gCpn
	C4AZSvq1dErat6UxjtMWA68aWssYflUL9fiAWaUvhKb7yprAQklvza/ndCNJMz0a6p0mYu
X-Received: by 2002:a17:907:7204:b0:c26:2751:3da4 with SMTP id a640c23a62f3a-c29b86141e3mr110973266b.13.1789376047594;
        Mon, 14 Sep 2026 01:54:07 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234dcsm394388366b.21.2026.09.14.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:54:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:54:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Gabriel Changamire <gaberashawn@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: remove unused definitions from
 ddk750_reg.h
Message-ID: <aqe2K0nVppBFSidV@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com>
 <20260913040140.4517-2-gaberashawn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913040140.4517-2-gaberashawn@gmail.com>

On Sun, Sep 13, 2026 at 04:01:40AM +0000, Gabriel Changamire wrote:
> The sm750fb TODO asks for unused code to be removed. Of the 1203
> register and field definitions in ddk750_reg.h, 1046 are referenced
> neither by the rest of the driver nor, transitively, by any definition
> that is referenced.
> 
> Remove them, together with section comments that are left with no
> content beneath them. The include guard and all VALIDATION_CHIP
> conditional blocks are preserved.
> 
> Build-tested: all driver objects are byte-identical before and after
> the change. No functional change.
> 
> Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> ---

These macros are just documentation and they don't hurt readability.
They probably improve readability.

regards,
dan carpenter

