Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703C595736
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988950; cv=none; b=hqC1GAEIdtwDUf0j0s2IOkjN3ZW+SdoA54cEA9I8idByCxiwbe935hoka4ejG5a+RfEmBfGB36wQybjvvBSQiTYD4D7hiVcZ114oAt9S8yyMMmDqvX5r57Q2mB7ohXXuHqlkLxC8/5sxjaH2Lu3EMY5CsdND5rJRUC5OhNt+9eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988950; c=relaxed/simple;
	bh=HtNWfnxnDSSWJZCxMLyZKzkG5I6ufKDMc1VO13LdMqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxOryCFlcgqZwJER4aDTcGwMZLSzeDkqF6wbLqEX4pTOeBZtCIpiDGUDck7hKftRGRiHEBwftSHoTxcD3fa18fnd+40JqgEfedy/koZ4THu3ogXVQ5fzd5/9IC2BTk9AiUuk60T7SKVCA5Ylj9EiTj+nkrCw07PuqQ2yFOMUxSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4eg2CVk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4eg2CVk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0220f2so558471a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988949; x=1789593749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OS/hMmRgJkhO3y6TipOYJ+hU/luwN7sov3GRLXL60Lg=;
        b=F4eg2CVkgNsS3lq5doiVXybDz1N4VTjpS1THKGLHkod3X9W2/d5xV5G+oVMrq7vPIH
         eGy8vMC++yCJ5dHHnNc/6AfMO7evKMGlRpd0xRICxALcDhS44xCTFIgeylQ7PP79XLvd
         G1lZuxEfDbBJ+3MJk+YQHS4CbTV3EKBhsEPCE0rWkzChJztU4NbKLQA6+sJPrpX7rMMg
         tZurWg52PcdsF758xuAhC5WS+Q73DjyiijOBapFDCN5V/Ikzu3rYPdzOSqf5MUJoMrKS
         VTJyPVhPkjQRTDtM4iiaSHQoAYjQ6IwqRHOCsVpYrArZmCvyE0t6yYt0B5beNc1y1rH4
         oNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988949; x=1789593749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS/hMmRgJkhO3y6TipOYJ+hU/luwN7sov3GRLXL60Lg=;
        b=XVXb+o0wXSmpOmZ3tXhRPl2H3cT9gwTcP8nVBC3wvU9gRmOPGe4ykSHCWxEsPPr0/S
         bOa+eAqry5Bpa/zyrupd7u0YZwPeS7GkrDjJl6BSkSaXrdPQMNCLrScpT0TXyD5FOo2L
         7F/pTnyqFlqwg7lVnnXMKBzyQ1lxjrH1QqrR2yFXjCH2u46300rbctH9kQ5bZFNKN3Tm
         dwEB+ORe+zRDqNs5yKEFQdnCeaHCS/lxzj2F6nT1NUxiCK2T3UDrgcf3DHEczjG7wsYz
         qPGochstPoh4tuOaCcCghpJb9M155GLhyn4eM5WuhugAjEmZptjcZXY19hckdSWxexVT
         BIgg==
X-Forwarded-Encrypted: i=1; AKwUvBynY1/xJtxBHK8+Ep5MMhQUds6BJhhdEQc/F1cDFCWjZmD4wjCWzg+uzAjvVFPLSU7zMvTSc7nn4B12CsU=@vger.kernel.org
X-Gm-Message-State: AFuF++nMKEHFcMINmWmGXLcekgKpu+XnGmJ9TUwnmfvL1+OgGNqihlje
	L1MEmAHWIFJbZgyvm7svvx2CtVJe0HFywRwjoXzDZX+6CIMkyqwCPYwv
X-Gm-Gg: AYBFou3LIT7O6kg6jy8xfH4vMlmVQ0Sj+WVPP/DUBBqaFyZ1TOSZVKVVArl2gq+0jRk
	Jpe3Ikas0+P63/wInBrrLVY0te0EgHEwU61+F4BlL7izjYwD1FuXQaLsSVonoR99jb5X89a4rAD
	1gpNjVObuYWsJ+F3xXcXYI+AVegnin6XE8AD8Sv0NYaEKtgBiJCOpn6YNHC+mLDA5cWvEFfxoA8
	jmxgmhgI/U7zMYOPYfUnbe9bV87PtzZyxrQdGL4E+FEumAP5SCVMZITgfEyeB+qZ6f0f5kNQNoH
	9mjGZQ3oeSKn8Yj8VnAL/mlagpzeuUxc1JNzpp5tcM6IxxFW7/jIChHmlcxlDOeROfiPN6FC7I1
	YWhAWF4pVfEWquFgGAxQJy/F7AY/+QhaUtCzANJDWYXR6TLTCGG6qRT2UbDT0fwOa5VYuA/Vx/P
	ks+hClYlrZ/tQ+92OIsiDV9kYL3Muv9qsHsBbeJk+cYvxeuq0saz1bMbxrgjHWNsHgjtYK8WUSJ
	YBlL2o3Ker+fw==
X-Received: by 2002:a05:6a21:710c:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3da39b5c435mr58092012637.6.1788988948772;
        Wed, 09 Sep 2026 14:22:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455406f14sm7598314a12.5.2026.09.09.14.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:22:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:22:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] watchdog: msc313e: Replace commas with semicolons
 in probe()
Message-ID: <a0514941-f112-4cd1-8683-66ea59cd894b@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-10-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-10-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:48AM +0800, Tzung-Bi Shih wrote:
> Replace commas at the end of statements with semicolons in probe().
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
