Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3836D5650F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972843; cv=none; b=sblQUCjUfO++QTg/4RVUKPFBsqcjsQoobA6buIXXulXayiiyY562VcRhRpiUxWJ+PXNX1oNzuOwyw4n+27T6jClh+N0l0uCJE6OxrReMhL+D5xqW/Xk2pZJ6IO5GeT2K5gymbWu78lqXrsM98TM1ocW3GJ1gruca64kGwJhbaow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972843; c=relaxed/simple;
	bh=eauFQLgabZtW6CryQKK8wac9Zt0p8FwVwlD3d0EZHNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCCzJMTGjN/qULzs4RocpfreG3NiT1H/lwUXyImXcbQk/E9EofzTd4saIk0BaXzPSOJX1KmcJqdgaExhS8tA73dU/4wiu5cxif3wwJQUx0OPmS9dxEeNC3unQJuhfoaDJp+DSjtnY7ehVEckPRMvM64yC4fDRIasyOwH7VRVDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE4ujsYo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE4ujsYo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so382224b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972841; x=1789577641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ciwSeHWBadqQx6YZVRZm2djgvhH+b+XMn6UtqaKUvdE=;
        b=VE4ujsYohOTmfMtMrWp0KY3Z8SppqwH+pM5OONZ4J0E0LgVFf13ex1LrcYkP+1Y37/
         +BYu/7nqKJIlnK2zwcQWGnEuL1MVsawvRNT1nf2+Jk11IEXmUvKVyKWt3+xxAsGCcsyE
         m/wmk9z9Plj5DUcusRtzOhGKGIixOfiXaSgiGznyrg/bWPW4xDJJxOMvgoB8jHn4uGVC
         P6/0iSUeSZZCpQbm3WElIg4QqVGVTYZ2t0s+HYpKQsnCUpbsr88k52iLnrkzRR6UxgtF
         WTaeELDDD6WcRbGZLubK/y94vKc8sc6NVaKYhVcFsKH8XquauAPI2oOBGK/LS+nFV29Q
         +PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972841; x=1789577641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciwSeHWBadqQx6YZVRZm2djgvhH+b+XMn6UtqaKUvdE=;
        b=iFT0qcLbCTh8DjjjjsLLxD7EQvnaDTAygsguzYmVkUAarKwXMxtRZdBFeyRWZpn0Rh
         hYhVgG2dv1lTWzPFgy3o77SIRP84vhl+PreldcQvNFKEqxWcAbYWHEXASwx0dBxo1cJq
         8ivrO7AwI5RNpyLU2j8tVaHjKqL/s0hcUzsUOIy288UVZSJ7Sm7uptTZKDsgm8LPu8Nh
         LHVOBGoBfKCl0O/FSLTnv3PQfVhx3ESHVMt/MycYYM9+A6wiN/W/qRt/17XNORBUO2do
         DLpGXAeRgx1h/BGDqzmy7xZaKtCYL+4OiD7YiYTWp4+LryOBZCSPlqXk6p8x/r7YIfIG
         fzXw==
X-Forwarded-Encrypted: i=1; AKwUvBxG70lCJvNjXV1Q0tpcux2nblZqj4G+27s7oMR+HunVZZbsdSbCX4OzriFr/HCHtqsqCnKWh11nGdhFO+M=@vger.kernel.org
X-Gm-Message-State: AFuF++kfRlZ4ByS05TIlwgxqvO/EAmMRtRHIhjcsaq5cjuO3gjlI6vVa
	KMEiM00H75oylIKBvRaXHgU2rlk5qDEPfOYzaKWZy71I+RjuByjlUeaV
X-Gm-Gg: AYBFou1VDOTIuqzZ16Uogv1Lbm0t9mERbEYpzvaIqAaA9SfXM0G1f97VKcGFQcTUUrG
	E8c1KTHYoVYnmzCe/d9M7QL3k1quWeosjxMV63FXQ1iQZjQna6MY9l0umQdmxLJ0L2IgEszKRHe
	2o3wKgaGfHhDCv4cjorbKiLZslVZzBYkHvEmAQqB4qyDLqRyYn4o0PPPSkSQTXRA4KyRCHF66DH
	XtBb1No1Q0PNH/2jWkf4KrzGSyk9KFGQJ5CQlufM2Wkb7t83tNeF1t+XX5S4QlGzRuuhbdSU0Dr
	T/YHi7EWcgWseKpYnVAK6cR6ir3sz63Ae3Qugwy7ryCDvGkleQ/eQjtVyHI6VJx6N0RwHKl4cNi
	92k4KnXES2eQriIgW4q8uNSYnri2w1Jvq4IomwL8eXMdr73VKzgisJdLI/I5Y+8FBAkjfQd3xfQ
	dWA8/5XYqAOTQF6ETXBV+4gc7XTBwIkwNCDEwJo9MJ0GL6p9wfqNcIfeYWRFWSTbf90i1nkfMjm
	St1VONPYVKCc/JinQw/9jqbPBWZBs+8UdVaD6plGzCnJ/cidgg=
X-Received: by 2002:a05:6a20:4311:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3da39d147ebmr54252434637.9.1788972841349;
        Wed, 09 Sep 2026 09:54:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm45655113eec.17.2026.09.09.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:54:00 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:53:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v2 0/3] powerpc: 512x: Convert ADS7845 touchscreen on
 PDM360NG to device tree
Message-ID: <aqGJQwB81hODuSIc@google.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>

On Sun, Jul 19, 2026 at 10:37:15PM -0700, Dmitry Torokhov wrote:
> The reason for this series is to remove support for platform data in the
> ads7846 touchscreen driver, as pdm360ng is the last user of legacy
> platform data in the kernel for this driver.
> 
> This series converts the ADS7845 touchscreen on the PDM360NG board to use
> Device Tree bindings instead of legacy platform data callbacks:
> 
> - Move GPIO controller capabilities into mpc5121.dtsi so all MPC5121
>   boards inherit proper controller definitions, and remove redundant
>   local declarations from ac14xx.dts
> 
> - Update pdm360ng.dts to use "ti,ads7845" with pendown-gpio and
>   interrupt-parent referencing gpio_pic
> 
> - Add "ifm,pdm360ng" to mpc512x_generic.c and delete obsolete
>   pdm360ng.c.
> 
> This change has been discussed in '24 but I just got around to
> implementing this:
> 
> https://lore.kernel.org/r/ZoNHLjmSvCN12vU5@google.com/
> 
> Note that this should compile but I have not tried this on real
> hardware.

Michael, Madhavan,

Can this be merged or maybe you want me to make some changes? I'd like
to finish cleaning up ads7846...

Thanks.

-- 
Dmitry
