Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8E38AC88
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803017; cv=none; b=NnXz8VaF+NApGxJn5XIMeEO9V6/gNfkrYfhOWo1qScNP/D+vp8/6mx4NEuxvf8Z9zQ/kk/7v5cfMsCLA4OrT+O8/APgcfixrjRk4tUzEwSW8hMck209r2N5FHX8DfupZ7I4Fe084BM/4RJIASUgcqUyUFKvjXCDHl93ATNwDU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803017; c=relaxed/simple;
	bh=0A7pV1a7CKYmXnn1A7cvl103jyF3Qb8W9InhDuuvFiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luT/NfMiNRzkc5+2bMY9xkTjriHAakXmZOnPELOvOil9VzzJQI2Anc8RPjhw+hCbZiUlLATNAPcHZ5kHE32UGVM2VgUT7Qkw227EV1maklS3NC/MdqosrTcDvZ0PksYoPW1RDDngt8HQTNlgJ7/jWU6xbLFpiud7UMKspB/MpVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq9Fyjl5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq9Fyjl5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1347064f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803014; x=1788407814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaSfFPZdEGUZY6hrb44h13Q/oeNF7xyFzDFwnZ79Vrs=;
        b=iq9Fyjl5/6NLq8OQQxL/YR52Y7T5kmv30e/zWlyeEd2hx1UxxymRo53QacOu0SFKzc
         F3cazlEO0w9bwggHSKgj+r0sPNrvCFawrwHd7Gs5CsJkTCo66isqb9X2LGTBgHr5pxzA
         LDZwavjs0zHH74ZbEqtdoTIJQYavbcmmsLyLFqL+5AERKJcxUyp4idSVr7n3bKUHdkVZ
         trNDYRFdQ6/mp0wRx85/csyZxhieJEgAtsZb1TUA7+a//j3oZi2+O7kfXaXacc1VRtX2
         HY9eSCsxzPsQqzcnUz9T/7Zm+JaymeL4NpvTDIz1KZvMR/cc+srLPq1YycOzIC0K4NVp
         el+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803014; x=1788407814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaSfFPZdEGUZY6hrb44h13Q/oeNF7xyFzDFwnZ79Vrs=;
        b=V5adnJjs8al5Rd/v6qmgijIlBYSawnfvgIf9G3zqCOCDMuK9Ay5Ze6X0yTr9pk+MXL
         758J/UT6gjYxgUEIFoACMRm50m+TB4IpHDKmmaj2T8Z8Vpz20qzrEhul9iRyHuNtrVR6
         evyWQBWC88HrbV+aQvsBg9I1/ber1LsbGqPCeZzfwIJeFa6WzuYNXtjRsgHRP+XD+I7j
         LdrfwGlD0PqcD2DuBjd/OD75KLtIMz5spTYCo3UHtM+9CznHiOLvlk7W36pOC5j1KU8D
         qmWZj0uC1YoJ7t9oj1iZn+DzDO+RvmE/oKp7nfEzC8XUWQwSGMTRe6JIHoe0pyhhmMDH
         AYcw==
X-Forwarded-Encrypted: i=1; AHgh+Roy5KbLuyZI1FkvaR3eFToynO/rUQoTYSBAiLhjtnII+dIsH8ZT8hb5xaqntSic+l4XGKj+3kA5Geb6SdI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6xIngYfW3BYScBpyBk2pzlOu9zQKoBzcEWzFuKy/XziuNwEgi
	Dp+tWpoq9Hx5l1alkBK0UcGsm6og5LylIVqAJO/MaxKWYexXfix+qdwL
X-Gm-Gg: AR+sD11g+dMMrv022zmT+n4HoF//Uj6g72x29HRMqsWjxnBsSrA6Pf3HTwICJ07FRE1
	EArufCWdSXlyBQqdg7IoOhsZuEqdCyWE2bfWO4/IWxRZ6eneuvnMxGqq86DFuXTjZnLdJawEfpH
	vXiwvza2LNs1XaNb4Aw3wSeknbs3F0fnG3oNbqzSND/YzuZ+5BR0GaQMXJJeQJfor7Z4wJbOvPJ
	yV0jnK2rxeTzhv3DQmfQMOwsAvEhfpBau6BrrtYU9dtksXQZd7j34ZrA1YUEZRtjhhrIHNx6GoR
	r0SYMKA71CRdvQFG2E2nrxeai/OZpNptrPHgY4K1Ii8qVFcPGoXLCvXrNZccVtYnV3Dx23+44Hs
	1UrgBKGkK7IOKIANia6xA7CNmZ3KJxhFLZMI+oQSz90usjcAsGu7V1/65AjqLIq7Zlji4E1bhfO
	T9v7F6HX6IloCplJPiydejiQtxcjqy9Z/6+cyF1lk0Y7StPYllUT/2dDWf0EeB9GPoDnFbfcQKN
	Nb//atP/UXdGU2WjZUW7OFZRUmzdVenlMPW0MV4wAs9HRgiGlJgt81AF7iFX1zUsmlLVk0yvnOm
	xOhaztOfOs03qzj2ypCnI7s=
X-Received: by 2002:a05:6000:4384:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-482e2696b9dmr9922200f8f.3.1787803013701;
        Wed, 26 Aug 2026 20:56:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8fb5sm5723467f8f.29.2026.08.26.20.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:56:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 05:56:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <ao-1AUkmBM0lVT97@gmail.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809180600.6049-1-kmehltretter@gmail.com>

On Sun, Aug 09, 2026 at 08:06:00PM +0100, Karl Mehltretter wrote:
> This patch changes the xchg to cmpxchg so that the active_asids is only
> updated if non-zero to avoid a race with an ASID roll-over on a
> different CPU.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> This is similar to the arm64 patch [1], with the difference that
> non-relaxed (cmp)xchg is used as in the existing ARM code.
> 
> This is a resubmission of Catalin Marinas' original 2018 patch. The
> original submission was not merged, and the ARM32 equivalent of the arm64
> ASID rollover fix remains missing.
> 

Just a friendly ping in case this got missed.

Thanks,
Karl
