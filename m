Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4E64AA4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573301; cv=none; b=szdauJvwL2SBwuMtNhJ2gKdgGFRQVZYCaYxYamEkMmb8PpPXPbYO3BEf9CRzqnAa/+9R2znrTFYSffPaZBw4NruF8Y2HA07websNY/Uq9wSlQfz1tzV3qGXfGZcpPEHBWrISKuEJwD3rOSemcOZx0Q7P9HVnrxVQic8UP+Jf3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573301; c=relaxed/simple;
	bh=OOn0xZ7VgwYJFiGdKoUynLwL5WCaLjCsrzuDl3/CzZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPZ3r0iA6RuPvrhATcW5oeSSMAqxu8p02cnJbosI3Gu0vr26ComvC4Wz/yblXTZ0OW4gn8tl4QJqmjMeDLcv9o7MJTCsnpgb/ezEOrU5rKisek5TH8OY/vgV3BxQsdxHJvNfS4U7ApJfh6VDnzynu5PTGHJvasdtCDJKUN6nQqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQOOgtEr; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQOOgtEr"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so1650916eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573299; x=1791178099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ygv/KFDM/0BHrtQ7A8PLOkcBlFsBYDEx0B6l5c8Mm3A=;
        b=YQOOgtErbRh1QNWOOMOpYHx/WcqXVmRy6lISlfxctRtVngmxggTNTvr2A5xUdL0tp/
         c8u9SYo2/5TLZ992tSck3po8R+2bdmcCELtlTNKgf5Wlmsh74UKtSOdx4Hw7Mui2w4dY
         s/bHIeqhLVpSOj/sB40mllArv+fg5isq/d7KUrJWqF5tocIXtINIvBTh0v9DXggH1v1A
         97uJ90zj+gOsFH2Yafekf2L5d7+aGVeqCpPv9UffCKFQHUXR8CMWJ0Lu6mZ3V2SC7wef
         gwwZ85m/dPDiL6nipVIghUnBZ5wlMRFbVakq+OdXp5Sh0HsgjadVSrZBzXIN1GTYLsf5
         77hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573299; x=1791178099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ygv/KFDM/0BHrtQ7A8PLOkcBlFsBYDEx0B6l5c8Mm3A=;
        b=GKIqXsxl1PIRVkjpA//0L895sRRi4tX07K64kXxS+536xXiW8j75Xs0iiJwTM5yQsN
         /KoLXNf9avx/MaRpzSy2AFqM01EXQBUSS+bTECRitf5OgXpry0ThdChjNllv2wjHx6zU
         dscfG9zhQsq1tJCYHsIvnWdQJ6DRjjfOPkdbkdli8kulgTlJIBQOm41H0slyeeaSEFu4
         lusXkvc2gaO849i4jz7vr2yIfoiFxQVFVr4VDpRCWg9t+zA6fyvGv2HUn9uZuRRd51+b
         JGEoBWwl+9C98JxKfIu1M63dMmiHElHQNUXa6I91f4U8q8vBk59DniqPpOnY6JTUNG4k
         onXw==
X-Forwarded-Encrypted: i=1; AKwUvBwWSd8Rkr7aydZ4zo/Rnj2G7Y6FVC23yGBKfdVNDaXR6BmGwp0cGNlUDpB8jlMclSlI3Tps2iIK+EAOjTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1QMe4dYj2VQsfydTou2KbZrQLyUG6Eg9vrKf0IQPqK9QVwqWx
	HhLGUUDWy7cwQjL9HFI2QidHEoEsdezZMk8gSmgJKHMRt3jREygwPJLa
X-Gm-Gg: AYBFou0mHnFjfG1CGZ3Tao3VWlH5J3RVOBS1WKCCPJPrszH2UPQ5qCu2PJ83BrBUNAl
	/8yQZg8q1fLUKa18hjoDHPeMlzR7rgDdg1cQYwsKxRMq+4Oaj27xPjWhGrHLABDD7XDEj522d7U
	K1ZW2pwbbZq7FUS/vXcHrOIG1vVJzQ/EMbavwqlXAUs+WlJV2OiIeOQR3m9j5riD5jaWLrWb09N
	DJmDE59/tJpR+2FaRQPOCn55auJImHP+e2HZcGiyDHbH4iQOQG0ImBewYXiRsfkmVtf7/4xKNJF
	0whqHmjNh6ggjEuG2V9eoGfK42Od6Fli8jr6m+uk2vXjBm3EHob0HlHDb7qq9Qn230ZRnHlaRpY
	ZIhy9u/w9JtV44NAZM6eT/K10Cd8usnir438NAlwiJnuAkboTqlboNSgvzpudf4zsbAOL20n/YG
	LlCW3jcemrfb03IqKqZPAVX017MmG2t5LiukJ+Kwmo8SaRlp0QC2HnklqjxRhqOMPUAcA369NpD
	Jq1jBNUTFPbt41hVPNHPgqDpyrtPjjNyg8pn2GS
X-Received: by 2002:a05:7300:3081:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-343ff9f3572mr7944608eec.9.1790573299211;
        Sun, 27 Sep 2026 22:28:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:526d:2f94:503b:aada])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3475546c982sm3458936eec.5.2026.09.27.22.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:28:18 -0700 (PDT)
Date: Sun, 27 Sep 2026 22:28:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sh: mach-x3proto: convert gpio-keys to software nodes
Message-ID: <arn6r3RohRPJrk0_@google.com>
References: <20260704-sh-x3proto-swnode-v1-0-0c039549dc46@gmail.com>
 <20260704-sh-x3proto-swnode-v1-2-0c039549dc46@gmail.com>
 <d3a2875ba34bf10ddae3626b77da071cd4624348.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3a2875ba34bf10ddae3626b77da071cd4624348.camel@physik.fu-berlin.de>

Hi John,

On Thu, Sep 17, 2026 at 08:49:15PM +0200, John Paul Adrian Glaubitz wrote:
> 
> It took me some time to fully grasp the rewrite, but I think this should work as expected.
> 
> Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Sorry for bothering you but I do not see it in next. Just want to make
sure this (and others) is not stalled.

Thanks.

-- 
Dmitry
