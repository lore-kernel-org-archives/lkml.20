Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378EC2EEE7B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088425; cv=none; b=InP9BoDOvD5fCXIHwr4M/OJ46K830+GYE4HgR1RbUfBZ5zGt+MNtl794z1utPMWvdonAhCJNoGtW1EyPYvU2j9QRRkHfqMvvyuAUHu6xbi/DfH2XQx6VhoNqByKP8mja1RHC9T0QeAIbIVp05DjRRULST4EWcpX5BA1w6sLhZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088425; c=relaxed/simple;
	bh=OqXFjvnETKnZkgSEP93LpkxnK50xsFmFRYWcS7eArz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKiJ/YqM+q4N9SqzBgx8LUmRxM/Y+3OJ/iZ95DcGY694xMQzTzDN8nMFLdFDRPXItjmr0i4najeUo/rgiyh+Ne3C8iJsbKmQIZTnW05kfuHFAr+B5/t7DtPxnKjOPiAuZpMhxSw1lC5EjfKUr8YJtTZWda0Pj8Y0ey843hIw9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDR+44zX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDR+44zX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso4187915ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088423; x=1789693223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OwtI7CWlRkyrPnrz2sqZ6vjS+KPfHfly5lWTKQf1EFk=;
        b=mDR+44zXbEz+pnRJXyLZJVyXW1WU4s6WPpjv1wimVKFRZEZnLNOUMZcXshU4+wYogc
         s18EEfu+9t3xjQCgH0CsA4nT8NsY8m0J9m9d2cDDoc9Ffz1RYInJU+MUBGpfK5sYv3W8
         MfUSdUc9sjUDURJquKpFhJyhVpkhHnCHiJ3Pn2VUE9NO59orkO1MYUL5JybphNp5k9uR
         SIYl+QUqrDhbI6wZzy02IQipq+FWKOD8CZe6fAmNJxNXZoJzbJTyCP6oCUdCT4JLvwrZ
         Nt4lLOKx7kNI905ZbBKMwO3mjSSZBR0FniSO3cJEzHQPzvmmxiAqCWQmlvPdRUDqnC6b
         ywFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088423; x=1789693223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwtI7CWlRkyrPnrz2sqZ6vjS+KPfHfly5lWTKQf1EFk=;
        b=pCWrKE4a1r351noeGzUGmJK7iKJvrDrbi69nazN79qNt24Dr6KIMUmwS6r7/JnlWgm
         dqar03I9Ni8i1fcXgLm8Lvn8W/mobjL4d37f3HtQ7aWypWK3HWHtf0w4fX/gvtedaV6L
         BekSk2Dgn8PvCsaftn/frxg3PYHsiKBKD3Rx2gQIqWsu+F9kI7nR+A4D8mq4C/0HrWso
         MIGI8M1Nl5B6kLfLlGHSWcIZAJAU/7elNoN9bV2xLKggvH6yzxMwylfaml6tfYCGh+Z2
         /CXQmJP8cejZK/5xuhrJ7kgexqkiNzPyt5f/r5llCvcVrIMdXwRGI2/0VvaQf0lsv0U8
         dZ7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxacAsV5H1rt5q45BVrK8kXL44r3XUSqg3OzNu+UVa4lpXfI6YEETUvKEmVN5hhJTaAwh7VCJMUOI0EsKY=@vger.kernel.org
X-Gm-Message-State: AFuF++lGD5MCdNJ9zHLX0peNg5RUJsJu5VWh42pPRoNh+94y+bnpDpvH
	wu6lWneEkioG6p+bi0sIB+MP+TjHaVHT83n2+xW6dRUN6aFhVcxVSOhX4nxyuw43
X-Gm-Gg: AYBFou1+ya2K1upMN+PtRM0Wl227XThfTo47vfciV9Vd0VyNXxTKq+jt08FyGStWADy
	zsJ3egegFyPbnAPRy3118YOzye5z+8bPkKdGhTE4ZqSq8qI9yCC4BZiBZJyiJpc2D3ra15LUfsY
	pamg5sMibSh5OnQkArmAXNLNrpD67IfecJQeNzVgQDxOBsclrr0LWwfObdZ2tsSZvEsEB5aTaXA
	24sPe8ainj+C/Ens//lS3utWg12Fu7oUFn3DMebGwk/9cYFZvOCTO+6yqqcsqtISPnpwviD2gbM
	FYkXyFB9B4gm8VzOD5XMowZVoCiB4g8izLr8j0z6UwsFRxWToPzhN7R23nqyq42lTqSoSys7bL2
	q41tmVKZkRckBchqaws/X7CpFX4XMiWQs6RO+ohCNVzwnptF6MdF36hLWdg4YPadGuyDdgvuhCh
	Iwy6hNnVgRNejnbwCf1IR+4Fr8qv/npGCQFN+9UapCskysFdBjX6eHxx3PFj3sBqEWB/CZTvsmc
	zRvggD2DjC0U3lEchV51G0=
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr2334224a91.6.1789088423257;
        Thu, 10 Sep 2026 18:00:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm2130555c88.6.2026.09.10.18.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:00:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:00:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Message-ID: <528d6e7d-dcad-4257-9aec-92a46c7fba81@roeck-us.net>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>

On Thu, Sep 10, 2026 at 09:02:38AM +0200, Paul Louvel wrote:
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
