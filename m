Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE874F93CE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744426; cv=none; b=P+suTX5pjS/foWD40oCNxUxog0D/4TsaMFwU9yGHAtJ8/lPpDi3jhc1IKWBjgB6u6pDWkudXeKFIiw6Qk2hpCr1gZiMIwrVheVOY0/9oY6JR0OLC5J1gPQ5HKM4LWsHd4hGLYXk23Z3tKaJM3lxfjoLSvv5pp+KpbkfWDFLKoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744426; c=relaxed/simple;
	bh=L3hJDeFUAP5rkvJ1/WCwL3h3Wqb21Zns8kRsbWr6XZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3BoaW8BY1WKZW1VrDvYFRBD9BoFJtNm5xMeYv+uwMlZkeQQoj0HJOS3+wsYEdZhVH3ETy/oDTSUOu0Jby4qyCsUdGmCIrmbAaJC9I9j2a5Xm5pCMLh/hPINu3Ega9SVjFx7ppK+4brVro9Efo1+a9Wdl4dDEXZeHlcNWUDqjo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBtswpwZ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBtswpwZ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398c066106cso760677a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744424; x=1790349224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W86cY0tWowiWw7DIUFz4jJRwOitE5r+Lq0ZBB/NLi6Q=;
        b=PBtswpwZJqEL42tUDSsCvd395vRFc9ndFb7xWzvFmD9gpp2gd8hSg+mRhFxEUODExT
         oZF1rF/1oBElf244stkzDlvllAgcJzr4SRKKeOEVRaMp+wGB2SnNUJuz0JhIq1F9elW2
         Yd/cIIwEd4hX+dcaETOJe45/uDVekm08Cyzk7v9pRS0dSI0aSGLSI5+PqSsfWWMNgUB1
         v88c7JQaCQjfXu+/ZPzWsmD/8Z7GSlU+iCkOCUuPe31oTC8ivA1r4WbQx51m9os6o3Mk
         h/zYyFaXmtsb/VO3xWi91ogKDACWLqOcbTcvD58pTWdWBf7LYfKRpfTKlE8PCPFJJHSL
         Jm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744424; x=1790349224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W86cY0tWowiWw7DIUFz4jJRwOitE5r+Lq0ZBB/NLi6Q=;
        b=HQFa87cmaOZe4Kn69dQZiRkykUBmMc20turUH7hkU9JhcyeSxZ/XXDLgkioEM7h43D
         GhbCuBaH1L6e4exYCzzBwYrfc5frIzcUXgZ3xNOVo+qohRY7YpZZGAUkkNJi1+VtZOov
         z87b6L6FNPis+W2E4ei9YyhVmAlK2aBeVgqi+CyLeIX2b2YzPbqRBwHjck08BNSHmtoK
         KUtF46Ahvx8uclvQnspWd7ylSHrzBvBocizwI7H0OB6ZBBeqbHUQbh+sP3ZXYvyZgeEz
         OZfoywZZR7XEXRdpw/trKRxNPJE6SMgTQTV854GMVPKEaIeMaCs4b/uX0w5R+GBLKRCY
         RdNg==
X-Forwarded-Encrypted: i=1; AKwUvBxOS378t1UUcZHlIgAw+uhv/54jFcNGGkQdSg7rv5yiuVGZsFK8NA28dv+ipn0wASxejAH1+H7r7iVTQ9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lt+L+mp3kaieTqp1zbMAXHaGiWwf4kPLG5gEEbh41YxnN30/rx
	D1oGHav7JEAivnsiW/rqwc1ZWNLXvlYa1BoU5M4TBlGinvwpaFmbwYuP
X-Gm-Gg: AYBFou00VcZ0jHxnBRu5lR3K4RiyDKxWbvtBdSuVL04JMtGirFficgvrWt2HDnZeLbd
	Y09pFYLeDgS2vtv8CYgJdXLNkj/Dhfqi+jyvSY3Y99q4Bb1oRPcB0+YJq+WXLT68gQtgK0TkIef
	F7rmv+NrCcQfJKTNjWF+x2O1Hr2m2rImgDgUQwYc90cCGNr6meDGDlw9SbQuRU1RCwntNnWm2zq
	yvklxgPFmgczGcKYD9Itmco1vRe2ynStaKqwMdk5Bjm8UPe9gvkygZs/ZTwdLi0h/VvDN6wSMOI
	NxguXQUcudIC29SRQ8RFuSsunOU9bqYq55cgh/IF2IdMJXHVQ5/B6tsCUOp21pgrhHc4BpxjqX5
	Kh6xKjibJgrmIHPrWytLO2dAefr/kCztf7H6Dc1Hg/ipmlheAu0/ikC0yW2LO4+yJyShpgvVXSH
	4k4CkXyRbTaMewY/ntdWb1kBpFenQzp0FS4JwJTt65rPv6v7pUhiyOnPaaHQLNunEYsiXKthZiz
	uwxuxOM+0V5uegEpdHGaeY=
X-Received: by 2002:a17:90b:4c46:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39e54922644mr9263498a91.0.1789744424139;
        Fri, 18 Sep 2026 08:13:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm1726870a91.3.2026.09.18.08.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:13:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:13:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: use assign_bit() where applicable
Message-ID: <a376bdd4-edcf-4db0-bf6f-fe79ba14a6f7@roeck-us.net>
References: <20260918141915.3023207-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141915.3023207-1-peng.fan@oss.nxp.com>

On Fri, Sep 18, 2026 at 10:19:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied.

Thanks,
Guenter
