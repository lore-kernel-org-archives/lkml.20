Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D469A2D97BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604846; cv=none; b=HHGJjCj6nGcuRRlBXSeT4Z335w7+TpFHcRD2cXmMBx6rmQ3Yb1hc/dv9eI9OcVFaTfXLS+eZashGiUOG/RYARPv7mNppkLzfcTCmgQ3qW0oSVYh+8uH2UXbXV1BWxShC0xw20snsElX6sN2xOFAPojpclTgWDyDXNPvBobwBjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604846; c=relaxed/simple;
	bh=urNLt+MFcXo1zGxLLMXC6gh7qBMMOtWww0XawOrSdn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4/3+j4MW61n/2si1mouPOSsiY/dcEaLrwa6i1njYYWXYtHwah3JRLOPB6578NhvK6oRzzRiHUdGB1+Wfh4IIdi35r3bt8x5RjroDGQNrkqmhYZNCh9f6P+wIV90bjr4HPGAFaU3zC+fnAAtJuDVT75i2EcfctjqLABpmCu99F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aI1T46P9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI1T46P9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd68a16955so2294665ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604844; x=1790209644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUtBGOjWkr3LDSuw8nQ/LMjNHkzqLk7G9FmrmWa6kSg=;
        b=aI1T46P9ittCMDXf3Gz4wsUiD+zgPE/Ey19CQpVwmBvXeTkCYgkAhKoR/UM7lbyRlo
         mpcQTN/TF7S/iHWGZm4RrLQzB/FbSzQ0yrmw7xGNMODN863QJmw5uvvmjWEaQGD4f5OU
         EWIGYGX7aSs6wpOFquXvFx3L29Ze9/SIRpX6S97oiTJhMbAYCjmXgyw4ZtQtc6Ss1aWj
         YwuI45FahE2G97c0oaSPNMwaTiympNaL6LvmpKSB91xzBHNN6cGcHismMxPCRLn0ejYu
         p7odNL/e1tdegraNWWy5LVV12t9Fko78PepK/tSdaos38FsEkTR002zpQsWCe1hANmcm
         fKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604844; x=1790209644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUtBGOjWkr3LDSuw8nQ/LMjNHkzqLk7G9FmrmWa6kSg=;
        b=QeImfSLXyc1p337ZJj09L6dSidouM5bKcugnqLEyQo4ADaE6xb9b7CT5k9G4DObZJB
         cB/QFdkN+vVx1TesoNa+DwGO8qjSx/a6XPG+iHqywGfYO6zvqr9KFeD6UXzUTNAPjyjL
         25ztxBr4Pkw9CmFsWdh2vwzGU02QghhOUsHACYZYvH3HAofYobcYQSJCm+e7W05iWPH/
         g5spLULhdXfuh5pAJ6zh70VFNs2oNGdeDxITqdaYJqiM/O79rzVQsaoW3JllSnV8JHm7
         ueB1haKY5xhTuPhDbPG7pO9LQL57NPaI3o+grJ/0PInoZM+QybPpv8NyGEhrK0WjdT7I
         qJbg==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z1iaYXC7wt7sE5lI4U7nD/hFEbYf26/6OUk1j49rtbnb5iYXrffhn2PQKUEbJQfIhksMJow9PlABV0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mvxfNaYrhfKHCasrOdaCEgwbRbVkM8hbi+Br4WOVKJ0OJooB89
	NKlNYHQpils3e+KeNsStcTa4kjzMyO1Z9mQ48F9U0UXWpBI+a5YgBAon
X-Gm-Gg: AYBFou1hR8k9h5BRqD868FGCix2YiGXJtrQKM+6ZNVbn5ZtE+UDRzN5fZhf/l93Ur36
	LBNnOA8yf9rctlf8mNFp/pvtgoaMTklyi3i7u0igAeSO4CdV6LO6ilhSQVuotdH5rAtTMPDWay1
	mDNco3wIFTsnrdEagh6K718uOShJE41RPs/Hck+/Md7LojxiWrERRdE79py1RTXAUYpg6uNMMiv
	UtSZD3hB06lga5HNT2hqh+jxZE/SYfiRa86wKPTuA4AmIPthuk+zjCCHAXxGyZKg3TUl56W6mjU
	imu8lNp9wvhXSpM86bQZytu3ujD6bQ5qBscWRzQZtfJtLHD8dkEewskhMkiFNw6VZ4xXp7bmz4y
	y8BcpTrem6lMWYBgtCWAOf2HMPZW/VRdrJ0UkGh+eC4huvWHnb71fvWilUvzHns+a6Ednpqvrcg
	thp0X4e4eBNWwimc/ROvooewUbU2mmqMnNU5vZ6cemTtmRn1nhg79TklprvZAPE9w5K/0WZcSDh
	1Z5RryWBmlm
X-Received: by 2002:a17:903:2344:b0:2dd:6a63:4476 with SMTP id d9443c01a7336-2dd9c8c778cmr20583725ad.10.1789604844108;
        Wed, 16 Sep 2026 17:27:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f338a9sm18257635ad.83.2026.09.16.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:27:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:27:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Baruch Siach <baruch@tkos.co.il>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: digicolor: Avoid division by zero
Message-ID: <cbb9a732-dcda-4665-b714-13a3d36752c8@roeck-us.net>
References: <20260913064851.8239-1-tzungbi@kernel.org>
 <20260913064851.8239-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913064851.8239-2-tzungbi@kernel.org>

On Sun, Sep 13, 2026 at 02:48:49PM +0800, Tzung-Bi Shih wrote:
> clk_get_rate() could return 0.  Avoid a division by zero panic.
> 
> Since get_timeleft() cannot propagate errors, check the clock rate early
> in probe() and cache the rate in the driver data as it is unlikely to
> change at runtime.
> 
> Fixes: 336694a01dae ("watchdog: digicolor: driver for Conexant Digicolor CX92755 SoC")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Acked-by: Baruch Siach <baruch@tkos.co.il>

Applied.

Thanks,
Guenter
