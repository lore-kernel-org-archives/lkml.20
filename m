Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08C45FFC3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432316; cv=pass; b=XmzaPYEElqVa1+hWWIamoRhK7E54jORHkdUl0bEIjjSIk8X6jYkcKNe8GbDBAbgg7DVpfMs4jCP0DIlJOHllP07ulnLvPB4k8LQ/3xwSKvJDZntmmeomAdLTCVgtbWJBeiHQxsDtbOwqF4ro/VpRPGOkonK/dmflUsO3iLbnBS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432316; c=relaxed/simple;
	bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYAVvhJBWUC4LACRbSMPpkuHeBGCv8dKZVdyxXomDOy9EG0XNkK527cPzddI5Raj8zv/xoBd/uc/jXChAICxJEZoG8XWXGGMMQGPag8AtSR6+j9CAzdpyCkR9XYoylmdwYgwaVlbNWHsyKUiZrGh2GFAYdPlvXXtipKHC20aXCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7WlaipP; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7WlaipP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1943570b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788432315; cv=none;
        d=google.com; s=arc-20260327;
        b=K/Z3lArTyhDDSZPTRQtyko9G0BPiSAXJe6FGRcNmM71C93UhDCS5THPjUOwwdRWAi9
         qMSLjaFS64Z2MzLypPcjsJtI+hKMdIDWvF7op7trsHM4GkxSRFHBwFTPGDu9FprsU1sT
         LrVCqQjY9baO6VZA0BXRWmbLMDtRvMC5HZvL+WYUJj4p2bHHls/rxuYrhz0AKZsPHEfr
         vHwjOpAufsJC53eNIfMgBrxJJY4waRghHQoM+qcb3oV5aH4UKy/TzFAILFnRJuGvfIub
         fxtxUYGpHvsDE/gDf/jxFXbM9yyc3xS20l7PKkCo4B9KWT9EO8ScEUcW/HF7fnprlNju
         7cOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        fh=XWkJ3GqBn3K3eS7v6iPp26sakSksMrLpfU2visk9IUQ=;
        b=pzYmqKbQE1WzyslSaskGmfRUfPCcZ9BMwHUnBKr8WO2Os5y30nEPvUzTYgWWuCf2Ir
         8fA1oEUudpSX6GfgaZ9Qnb94G7nX0cw7vTP81ZzGlW3ZhdwMoJC5/lWEFH0Sq/Y/Eakh
         +XdtNg/PxxmQF7J87GVjC8lLjeVU3imUC0g5/BPwIjwrAOMBlnb/7eqBB4ako2IfICLr
         3YqqJKPaXYxeFpBMznktG6Y8dOIKJwdt3Tj65fK0STRkqzvvx7fcKYWhZrgLaWGwONvo
         RKKh5BhCXEdtjF+HW627ElplXpz49ZGjQFD9x5hLSoaEhgOyFQ9eDIYJ186amgnefL/W
         +c6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788432315; x=1789037115; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        b=V7WlaipPCMCSNOBKODUtdVgLuZMdrvhJlzJkJLRLwDZWPzhA5OkVG0eYxDO/qrEKsG
         eLTq6GQBZQsQjOU1caWyqT2d6Bf4I2ruCHu0NITjY7Y0FM57mYqQrzI5ZfVqYIak1Sgt
         CE+dVo6+mm6kJvuh0YER/7Bpkmosc9zFhNb6U6zvgrHGSanG56yDAmI9aKnBHaTQ6YVJ
         uDpM6zA2lOmZWH2mUoKyqSLZUSaHUoRt02KYmUUCJNUBo8J2cVcWWc1prmd5byELUx7M
         9oNb3GNDOZSQDw98VNTpuLBspNRUPDamIk1Re2MVtI1wJLucC7Z+yOwlIU9CcQIZqpoa
         24Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432315; x=1789037115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        b=F0wj0iNRlC/w98f/UMdhZZGlrueKruarpo/UnZplLsrTsA4UGyIpmhnPvUNyHX0vbj
         /tq9ATTlZYC5e8YEg9V4SIY3yhoOmK8w1NwObmDT4rV183XL7gTZZjYO7zQ8baHhZOLD
         ExJLosTUPaPuahRtDle71S+vs94JnFB/Av588xSRJfnm4bbPve4miOQUN+ZyBJWbeR/0
         1/0nd3cDQdGsdQOhm6MZWkVSj960H7Xr59ZmwNXokZCvqaF7d4RbRev7Id4tIbDyEfT7
         d1W69xtyF6KB2rIBcWcximwvYEMm7/GiGxIqYkCNlWmAf7OWU/4IYIeFLDZn1PD5ZZyM
         KxVg==
X-Forwarded-Encrypted: i=1; AKwUvBwZql5pl3JudV4PaCtRZ0YJ49eJ3I2PUw7izRz0VhpVrcHxbnsIajl84lukWX10Oh9BNdLYRp4ScclPvHY=@vger.kernel.org
X-Gm-Message-State: AFuF++laR5tBPsZxY8q2gkhggftgvpAdhlYx95XHJNEg91F10CwH6lNu
	+5/R9VWcSNcvnFU3rsNgnB7gpey8LxZnZPeHgW4Q53Qd038bv9EgZawN3qIf5l+j+eJ7Yvoj+aS
	6zkb0ebTo2aIvldRfSNeveiqFlp3UvjM=
X-Gm-Gg: AYBFou0G7eQS5Khk4NfvYJt16qWbR9BrkPoM3yWCSIddE9Ts0nmDaKGHi3KUcNY7wfh
	JcceVzTFejZY0KbZWay3ZEGfU5bj2rHJlXrKdlaj/OLqLs/Le7nn29qttcInVohjXE8uGLNfiB7
	gqnISBOpYWZ7hl9+2b65uvk7ZRVNvC7TC8J7+7BAS5EUYL2gI6xTAPd3mDicCp+4PHMGOzWCEzH
	Rh3W2fMpAxjv9Fjs+MESzMsrqWJVYzZsEBWYnL8MU1AQH3KKB5zpoAvW3vqyrXwnOA8iIDnrLrp
	5y+W6H8cYpAmHF7dzhuryLNgrjX4Wx+CsiW/fYWo+Tk+MMdD47CoNAemGcCobGsybev6jqjNP9x
	QfEo8v0c/HTQGSJL69yG5+40QPEcZASibqqSEHLsWv7MAGl3l4dvXew+oYeAmRR1gams=
X-Received: by 2002:a05:6a00:409a:b0:84f:dfa8:57c5 with SMTP id
 d2e1a72fcca58-85ed398aec5mr16632746b3a.13.1788432314612; Thu, 03 Sep 2026
 03:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com> <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 17:45:03 +0700
X-Gm-Features: AcwNN1WSJhqM0iZz0vmdxNeM9znHr1Ya_X824RjSXnv6-S-4Z4zMmbAJxEGwZ6Y
Message-ID: <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wei,

Thanks for the feedback.

> >
> > Fixes: b86bcb299092 ("net: fec_ptp: Use platform_get_irq_xxx_optional() to
> > avoid error message")
>
> If this is a bug fix, it should target to net tree rather than net-next.
>


On a previous (different) patch with a Fixes tag, I was advised to
target 'net-next' instead,
so I submitted this one to 'net-next' first to be safe.

If you think this fix for commit b86bcb299092 belongs in 'net', please
let me know and
I will resubmit it as a v2 targeting the 'net' tree.

Best regards,
Phuc
