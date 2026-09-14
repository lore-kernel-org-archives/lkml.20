Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE124A0938
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399891; cv=none; b=VYbHHLXv+qQdUsHsEinRPCtJlcp4oD8OtVeUUbNRcCbj2sdwcRco+k3hqORCAwna51ENMzemklbZQXE3kCHPPY752aGLXxtSsCDjt5v3bQd/rhJjwn5bZ52LO45QO+cN5c4wKsOOidvS0w3ZHjbVUInOr9ahzdD35GL1lsWwIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399891; c=relaxed/simple;
	bh=NMWkk7VqLSEb5X08dhPbCYxV9CArNelOzi5HrhzTRB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRwCKmVKb13nsGR3x34g4JFJUDAoR/DrDhKzq0j5xgcN9rTnRgIOY/y2BY0bWQVuesIhSomQXQV7FCPPi0+m9BZSGEV+gZQbjeKGH+z41qf2p4Da9yaGo2/c1pp9ThJlTry/BCVtupMOFMcJfNWJ4mbDOBmZUvg/Da8nk8uUKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8ZpZK4x; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8ZpZK4x"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1135693a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399888; x=1790004688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80/p2r+sK8JMp9zNzEgv5gzx5JVorvjEM6vLrigBwZw=;
        b=h8ZpZK4xMWTqOqn0FwqEmd00rSPtXSkB2uXS520GtEXk4X547vQ5wSCxBrYebbPUw+
         VDjHsKUDZ8pCxo1fOZRsIavf90DRgWetwNHC1o9t3Kq+VhNGLzYuDF88iCpr5AOJw9xc
         190C1rRzIXf4Y2qkhJVggnqzwC18TkBNdit0LqMe/6RHusZxwmNA7pG8Bh5t70SFln5Y
         miHSF5EMxZOEpNgCRLTPlfofSRzFG71XZA0Rihyc2YWqUdKhRKeaOrXi8ek9QBcM6SsD
         fRzT3wrTuyl7SRyYwaqSOaj/EdpzPJUDXEAAfn65v4Qa9XtNQDaP2hs6o2OLEJTHh5GU
         SXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399888; x=1790004688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80/p2r+sK8JMp9zNzEgv5gzx5JVorvjEM6vLrigBwZw=;
        b=XJyWQlOiypD73zEwGiupyPeW6Xl9MYc8iM0RlZd/5IY/qkMJty/zjkYWjz6lvWeNRJ
         GFgWxs8BdeW/5+KVKc7GN/2GNMe+Ak7W3TSTIboHgHX07Z9ZiHNPm3aWUm4iAcb1lMBX
         R58KFRzQzqWKWg2C3v6hWWj87dHBEBUazUkfbRF1tMqnDm4fS/KTIPLrXgicesM1bC7/
         TzZGc7YSh5AMU/u9leOLSFiYjHlAIde1L+qmvf1XHvsibykMuG5qbS3ftTADpr20VHf0
         eP+fYXnLj+iAqkMPM6hy1PGUA0ArguKV9Ssjxp9FqJnJF0/NWHvdsvDDT9Zt/WutrDsr
         iHww==
X-Forwarded-Encrypted: i=1; AKwUvBx+gYhNehL4MhOLL1PT6qAaUDkNctwZUt+LExBTXt98ICw6R9j+pDFxrB1U+rFfFqc0S2JDvJkCb51d3s8=@vger.kernel.org
X-Gm-Message-State: AFuF++nsLcKibF04xqtRCQXuyA84Cxt6SY9VYkMT6rRJVm1OpsgvGO73
	4a/zzd+dXy9ShV9b2xHUJIkajwDL8+wWRUn3z/w3Ktovjvr4zo45gSL/
X-Gm-Gg: AYBFou1Kt9sY06EOzHRMzsgEfwM/8ZlSObjt/GS/AWkwx3kiFUjkNu3atZmVJj+Km6Q
	88Wf++nJQS/Lqha78TBpV+6JCZbHxAOc6I1FR4xQazjRmxL4SrpaFinFzAaBZTqzVN/KyNPNkop
	NgOOTpCG5PziR3e0+n4KMGtJ4H7atNJ2J8Lu8AhUYxvI/S07aL4pTFJ2gsl+UqmGEIXOMq3VTxX
	zawBLIYyne5SSU8GsJso9fj09LvCM8sx4lBUtyeV1rw5zbfcmxNVnrt++FwqxgbMgNpnJl+tKnm
	ENFntvyWsvoxe9TW9EeGSAF44PRkbQHUDOOaYaL/YlEy4OhED/kqbPXi28CBblej1fp5qKzJm1H
	AetU0a9gv2qMYyfnRh7gujdnXYvxXG9SM+zCyG9YeWLVzGzcVIkgnoPtsgwSOov5udqvmuRXU5H
	0Dvz05ES7j9O/rdE1E+FhlaL6ICOkHrIzbKYXCb9r5D5KYL1YcfZ28tq28Ce8GbzZ/tDl1eCdF6
	DSQ+pKWt7MSXg==
X-Received: by 2002:a05:6a20:6a0d:b0:3d3:af86:fb94 with SMTP id adf61e73a8af0-3db406baa5fmr6579605637.26.1789399885429;
        Mon, 14 Sep 2026 08:31:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29ebc712sm4804163b3a.49.2026.09.14.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:31:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:31:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Rudolf Marek <r.marek@assembler.cz>, Sven Anders <anders@anduras.de>,
	Jean Delvare <khali@linux-fr.org>, Hans de Goede <hansg@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83793) release probe data through kref
Message-ID: <49f5d298-e250-4d18-b99c-aebbfe0ef458@roeck-us.net>
References: <20260914073638.1662500-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914073638.1662500-1-lgs201920130244@gmail.com>

On Mon, Sep 14, 2026 at 03:36:38PM +0800, Guangshuo Li wrote:
> w83793_probe() initializes data->kref to manage the lifetime of the
> driver data. The normal remove path drops the driver-owned reference
> with kref_put(), while watchdog users take and release additional
> references through the same kref.
> 
> However, the probe error path still frees data directly with kfree().
> This bypasses the kref-managed lifetime and discards the initial
> reference without a matching kref_put(), leaving the reference
> accounting unbalanced.
> 
> Drop the probe-owned reference with kref_put() instead and let
> w83793_release_resources() perform the final free, matching the normal
> remove path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 5852f9609d21 ("hwmon: (w83793) Add watchdog functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied.

Thanks,
Guenter
