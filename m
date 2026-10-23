Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770362;
	b=kGoV0TVqbldcrhAbTHPqye71yvc+NOVYC/jstaKMFOt98lkKRhOIuzKgPIh3R3TZ8s+5
	 ZdKUsMI2zpVYZoeye9Gfl5u/nkLRu+9v066sgUsl5CylZUgW4S0WwNJlYSxTEtLX8GfKj
	 2OMuizoubqxcG2/uuMryQ2j/6fnCdfSdDaztprrW+zzo9n080fk4/QWrmFIKtGcdjIIpA
	 RlaMj2xLmiRQjWcWPHpiJ0GQiX/ElLurUoM+WGVe0uy1JdSPU3n9vnlOcy3C87i4MgYaS
	 LZMF0a81WhMjPkgskIT5LHVKNPgTlDpsgyCI2IY7qN/heiAb/DCXBaNIo2q+BzJvJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hiLF8Sb6ZE8PKxF6XenXykYK2FM9iTh+tcFLw3gA7F8=;
	b=r3SlgK1fa0wUALFVA8nMl1Yolb6B4AeUk/TWuaKdNwAN1r2fexYDig3lqK8+Ntk5rknK
	 As9xXyAXgF3HEmCXxvjoJCBGWYcAHSOQOveRmg7b7KnLlMOPVHleMga6f6YBiet9uK95p
	 uceSCRyVDrbw4Sewpk8VxSwdixqhWn6gfb/UQXhHANoht+Ri3VhsPcFOfRCjclCVtundr
	 PGxdr+6eP7VsK/tvaWfyOJ1Pvw3DHupbe1COOSn8XKIZFRgifaxS0qN7ynYJsWCuhbzaF
	 IA12XxXM55TAEIrxocOtGbMLMAV4oJZrSht06VQRLMSecSbr24MBKYNRm4wRWflmefg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="H/rGCox2";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC34606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H/rGCox2
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1096880f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792770360; x=1793375160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hiLF8Sb6ZE8PKxF6XenXykYK2FM9iTh+tcFLw3gA7F8=;
        b=H/rGCox2Ri3EV6YamfyYW/VByMCSXa1BmS9JUpaiz+VY/iByS6kua/DavcKedW1JWm
         2pE8avfT4y7DElXl45p9h9bD+Muar3gPZqG9uxGxWjOIM6xX4Vx1VWNonZk0uXZBxm51
         JVTI/sI4HrN1CYT7QUfRNfC5I9TciZTket5yNyFi8Jac/s0m7/b1VZTQLcjjALd42vlu
         kTGGpRrP9+YsKOMWZXxqWz435YmeR0vLIS1SmankW3ot6Jnxc0aiduzYiB1pxeCTVnrX
         ucup/lWqIe7oJgSlX8jK84REu9IBDyiqVwPyRpbvex2ETAV2vb4KT1d+mn/CMFTD1fMB
         DDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770360; x=1793375160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiLF8Sb6ZE8PKxF6XenXykYK2FM9iTh+tcFLw3gA7F8=;
        b=u1OK5xar8AvOiAnd4lm04XfOMHGSvLTGrDbaps91EvHBoqSUs/knRHxH9cY8TzyQ8e
         jJq6Pwfo5MaGCSE15o5G8H0VtgeA7hFAkrwWzgACojkAFrcBRxd3h/kv/GyBj/Tem4rv
         OOXqWaDy1PORb0G9pgXlUXHWGGfYlAVx0FoRDrQyDaANu7do+n30zO7wJKt9ACn+hLlY
         MHRSlI5KniTwg6li0rAF1dRv44kzHUn7/CZ9Nw8VLj2Tzdme5H/nrO/pPWA9SzZTEkMc
         NUoAXfQjiF1PP5Mn08U/IynKLd8kEyyPzQ728DONXE/Nb7UVgPannz3q9cGStAgy0Ihg
         +kYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBcHWi9KlRPAuP38MsFhaDsTbfQ45CnvuV8IL64uybB0y4PYlor6C6OCYHht99xcrwQ9PbN0vV7cSC+Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZr/LHYZqFPIXkla6rVVi9pCVvb3dIrfghhSBnJzwtJTvwQyUa
	W8eo2gFfizFjn/q2kfTUiRV4COjw5NP81w9A9RypCflgOtCPRMD4km85pENTX4A7/Fw=
X-Gm-Gg: AYBFou0HDZX10Gr8EDOuoplcrWdIrf9DqC0eTidhyiimu+Hdyy3Ud6Tsyl7H6Ug4hMM
	L+xenLRJLKU4CZzbMIZ843bYz1Z/i7KRpR/MxjshhRIU/rjIpPaXTasVdgGwT6fqkV9BiC0CWVM
	8xHuyYhn8cP87l0dS0ExUbOU08VGoZfEEWhv9UJxJX6auQF32XXiidEc8XrLI63fgOpO/Tn39x1
	3CQ3JBaVzU5bCETCGnfb3nKPJVBOknSZeWhNriCHaVpFrD+UXHBd4JX+wb44Fc6o47ltuu9uW68
	zSmrJJWqGc5yOvAZUQGZoGf2TreItN0ANq3HN5ZPasjOStSY2LRvPBGbTylHP2WFtXS5/xE2Gvz
	NPFCqxH0rJJF39v+tBzsJpJxcwlbhBN8p1O86+y12uiejeVoXtEZrpE1Sdxq2VCWO/TfccBQvdv
	mNuvNkxzH8LJ34+Yyc3K9JoVdntR8VgqEImJDOHC7dqxxNvbsoQxM93O/0c4SmmG4PFes8V65Ss
	M8I+2ZamQkCIBDIYVoX2U1O+wcRVazXGYcXiks90lyP9+0X59KCOZmxNA==
X-Received: by 2002:a5d:6e5b:0:b0:48d:f5c6:1a0d with SMTP id ffacd0b85a97d-48e385ac3e3mr3197306f8f.15.1792770360484;
        Fri, 23 Oct 2026 08:46:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40e830sm564857f8f.35.2026.10.23.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:46:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:45:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: akpm@linux-foundation.org, lance.yang@linux.dev, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	brads@mainlining.org, neelx@suse.com, sean@ashe.io,
	chjohnst@gmail.com, steve@abita.co, mproche@gmail.com,
	nick.lange@gmail.com
Subject: Re: [PATCH v11 1/2] hung_task: Reset warning budget when problem
 gets resolved
Message-ID: <atuBNan3opPChDj5@pathway.suse.cz>
References: <20261004163610.413506-1-atomlin@atomlin.com>
 <20261004163610.413506-2-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004163610.413506-2-atomlin@atomlin.com>

On Sun 2026-10-04 12:36:09, Aaron Tomlin wrote:
> The sysctl hung_task_warnings currently holds both the configured warning
> limit and the remaining budget. Each detailed report decrements the
> sysctl, so once it reaches zero, the configured limit is lost and cannot
> be restored automatically.
> 
> Keep sysctl_hung_task_warnings as the configured warning limit and make
> khungtaskd the sole owner of the remaining budget. A check that finds no
> hung tasks reloads the budget directly from the configured limit. A
> successful sysctl write publishes an atomic reset request, which
> khungtaskd consumes at the start of the next check.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Suggested-by: Lance Yang <lance.yang@linux.dev>
> Tested-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>

Just for record, the patch looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
