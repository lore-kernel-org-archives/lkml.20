Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5629408
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156295; cv=none; b=WWsavuiG05oiEyIF+fkXK5NZwDiwhTLqGd4AHTdfNp7LfYaTBJ/XfyrnS9x9VaibRqsYRoOyNZuKlNkHTEp2zAJnhrF+y38JsLXfCL+HGaMM1zM1LdH8DhH692jgeFScaLzkLHCOUFqgRa5PS+hKF5AUo6NtILFY/l7bHKMm9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156295; c=relaxed/simple;
	bh=5cyvu/196NUJ+2V0psX9wZ9QOGyNYgCM/yD+0cVP05U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvGP7uTpQBjBjhdCV2riUZwght51U6TtOo0Nbmn6XG+/qJSlw5AswL3RKgTFtKMfPFSruMFGljAPQeNzo+sEXlkK91fIwefD68fhQndsHq/RjW6miS1Ry3L8jdrD9rZqNQX5rDlspyprxWJYxSeuH3mO3yHNvQS8a7a4ikA6WOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXsqiBii; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXsqiBii"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2403174a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788156294; x=1788761094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0PJ2y/FfJS/eSstN+8fj99mvu+UkmdEPeEPTUdQQoxo=;
        b=LXsqiBiisdP49HQeTm2gbM6aguyg860Y1iH+4pxr1vNtsYgocw+MTOZbinR7Fq9wxg
         hcuSsCwFTpNaVk+iXobSpUlwPi96FMpqrd8BLTmJ/kWfH47XK6O4rASIjcFdnkkO/xww
         UzQO7jU3TC6c2fw7TPKIFbx5PqJ1ZQxc96uWpSBYSz6E4JV6kxtk2Rynms/AUpR99Xa7
         NRa5wTcFef2me4bIUG/pa9QZKvqqHi4b7Xsbz1hwV2Jyrmh3QTLYPBo2IQuT2BKuHlQN
         2ac93bs+66AjNkRHsJg6ozEaajNlib6QZ58+g65XbnXFKOdapZOeLm85RI4Ntf+QVSMo
         ui5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156294; x=1788761094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PJ2y/FfJS/eSstN+8fj99mvu+UkmdEPeEPTUdQQoxo=;
        b=AzrKSI0l/HD8AW7LRoeq3DRaf9Km8mrQhjnQCX3sp/sGgbC1cMMvlBMXMNASu+iVZa
         95/eYrFN9O9EdjsG3JsR5ldRNOpu/Ts5yzgf7dkn6oKNxsxGgZHTpQ5g2BuljQnUWJZ8
         sV9o18ELbVXYXUWYgBE/BNAPnIcXp8Daa8rU9pWEaPAUbA/39d8M6IBkE7h11lAhQZuT
         niW7T0jrypJDiDSJ33qE2NcjwITDpf4ykmyanZSP2pL/fYfJxO5lqPFNF9242dClOWcM
         gjwreL7UybsZhiWaO7V4FM9Fmx6tuHj01QY/lLcwX0iMH828jDPLJP9bdfwH5cEJYjeD
         OuuA==
X-Forwarded-Encrypted: i=1; AKwUvBwcA78E4uXjMiXHkaTDRLiA2vdd+8rRBsaC/PbBVjJnLBdYUA6NC3f5nG+XpatQP/fbEXh0YLmAFCbX1VU=@vger.kernel.org
X-Gm-Message-State: AFuF++koAgNnwag11GmpnicJO6c7tHYC2mmk9sEW3F8RbFyJ3/OSvuRB
	Y4i5oK6Ru67s8aRlRDgufc2GZsTt19D01ofhKbL5LilcXmJPDSsEtjUW7GD6XY183nU=
X-Gm-Gg: AYBFou18rIDDF5E46ubPZTMJmRyjarXcOLf/W8BtH1q1Gl8KihDV6RinQ84GqMVbizy
	COOUpUYkhdg4oVlmchgYbScVDR09OHw5FHARZ3gyVbpWWCgrU5iPW/UdrN9KjsVLCptQc/4f9lk
	VnnMZP58hQu9+UiDlMHcJXTh4ajeV0pkPqKWCX/wbCPeogfAO1r8Fx0n4IzQyiNp+PWk078Dajd
	o+vXSKvz8lsaoFsG4RXdp2a662UNSh0+RFgHU+KCNnJ72f8QFvzQE2CyWJLbS1QqqNbCz5HPZoF
	DhK7mYP+GVcJayEEdQmrHLZZHUbtmTnVrDGldJivUumz3VfX1oMeQLf2BApg53XbPFr2DV4fTlr
	a6EkkBJl6I2+cSv56cc67ZkbPkOsXwGNaez9HJyPoZNI/H2wXgZrN5oJXAEN8mNta750diUX3g+
	JbbBVbtbSNZ7krWCSb1Y0k/v1urtmlwmNNKqi58Kl7zA2Ra/sfdqgKb6RbYjaEIuw=
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr37395830a91.14.1788156293562;
        Sun, 30 Aug 2026 23:04:53 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm22805738c88.11.2026.08.30.23.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:04:52 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:34:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <rob.herring@calxeda.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eli Gurvitz <egurvitz@nvidia.com>
Subject: Re: [PATCH] OPP: of: Fix potential multiplication overflow when
 calculating freq
Message-ID: <apUZgrCjLxN-T031@vireshk-B250M-D3H>
References: <20260826131957.1063765-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826131957.1063765-1-colin.i.king@gmail.com>

On 26-08-26, 14:19, Colin Ian King wrote:
> The multiplication be32_to_cpup(val++) * 1000 is performed using 32 bit
> unsigned integers and hence uses a 32 bit multiplication; this will
> overflow if be32_to_cpup(val++) is greater than 4294967 (which is
> very unlikely at present). The result is assigned to an unsigned long
> (which is a 64 bit value on 64 bit systems), so fix this potential
> overflow by casting the first operand of the multiplication to
> an unsigned int.
> 
> Fixes: b496dfbc94ab ("PM / OPP: Initialize OPP table from device tree")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
