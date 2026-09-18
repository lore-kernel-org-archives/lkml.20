Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715C3B0AF5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730109; cv=none; b=tD1hG099lS3H5y41EJYwkSLuQdtcBvbjNtyCPVWKKJD1H1T0yzf98LWbtDJ18W11191XaDGfBLHFjE/qn2L/FKUpkh2f2oxq+8ZWocL8anY+wjV8cNNmwOIzTV13Npg++Og3MvLNJISNyGTuBlECcjagZ2Y6q70y4FFaRxD8Dg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730109; c=relaxed/simple;
	bh=ehQ6EL5eYKu3iSf1LH78bZZxbqgNpbez5eD6B71t0Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWvmuMX1RP2GPMGCvFhDL2etmxi3U4RdDYAZaiJLGeutR2MTjorICIoe/aWoJwJzU1QTC5b3i6TQ6unSrJ2UFRAU1Yylg+752YWFEwzSX0gEe1Grmbja5EsBhogF3Cn1nUTc0f3PVdEuFX6tF3i6r+LAkXnVX8cceiaWJc/AzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYUlOdam; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYUlOdam"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so4621125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789730106; x=1790334906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bm1O88nJb7wxfnFbSkqPNAcj4aNu4XSJLtoBOXrheo=;
        b=lYUlOdamJaj/Z0XSy8C28CXqFCDXH3rkazCDat/Fk1BeOScz7XXVMwyNWW37VWAlpi
         e5YXLhZwp6+XEO60DwWhSJ2B6VUgecl5+CCAZSryg4thdplgPYKoFCbfrDN4ckq+5Azp
         XB260nlXp/eiV4OwjKdk+AePwE+sCMnSsI7tZPyGp0gnr5JDkUZ3/c87lAXMOvvxB+cw
         ru0WwghDN+MBC8R3C5/OPkh6KzPngMB2kTiKcCJMTkqPTuHyGQ/wvDtWhbj49tEemdHn
         8wheIvm7mUnWtBVbKLxVwsFZwYWph8ay29G8e93gjNWPweSw6dfz9IjLf1lQdPHECCD/
         kbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730106; x=1790334906;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bm1O88nJb7wxfnFbSkqPNAcj4aNu4XSJLtoBOXrheo=;
        b=kiHutq0DRAVzgUeTVPA6LCcHaYPqFi2N8A3WbeaxpKiMDX/Q7Q03ZqyXaOp5Fb1kcG
         CnGiqUs92ApRFrkXG92w5whXReO0s+xih4INR+d07wPTPhFV70YYrQ+nIMNeiiXkLovp
         68360rx81B94pLgvb4qBSJ0NtSvfdVYhCdwhDZVDMgO4NepOEOZYX48YH3QxAXEzVheO
         foQ86LwoqNrphemgE1/RJWW2ERlcLaeat49o3wdqMQ3NpbFz3icDQwSWTAHy2T5bOCHP
         l8MgJZ6ixefAXk7K9dWzSesc0hfZ1vhYxtgBJP/AGkmHMh7n55kBhGqLRyWeLFxWm3Bw
         3pmA==
X-Forwarded-Encrypted: i=1; AKwUvBxHQFSj5M3fAmVXTnrbHkOAf/dlcgM5VI8UYU3Qdze97CmUxxYFtj+daD+dm10giJZBI0iuGSpUjceqS54=@vger.kernel.org
X-Gm-Message-State: AFuF++mC2KNi5UTbI42D9SfAc3FArK/dPbFQ+AsiPvJd309Dzfq4GJLn
	I8Z1Ej4q7sEf25b5X32hS0PD3gfDC2O7F+4W4ER2Re9a7H+DMbP6q+h4
X-Gm-Gg: AYBFou0Aa/yeg+otj86mef3t0dlz/hVQ1tApkykmM0rG44e1WFsofhcSG4nklaANObE
	J45/4v3k+fH4mzJiEIsUIHlRcTbDMOFo3/EIqkGZpfYUToj5iQo9aoTO+IopOv9MGLRcSkofhtX
	wKWSGfY6ztuTy7lw1AatkS5tdLukdZhQUvaK9p/2UJt8quMKXXnroHhJqNI7SHhF+MUH2zJ4OFs
	CBS0apf4HlTBl2OJWkGpg9KeM9fpLZZrQBfq17KBvV1zfiOfqUBBREDz6CXHsndBUL3iOUKlQ7d
	txSDGRe6OAKrH8uFqGNQdSWY4hPfq1oKe1j2LetwV9+tZEBbbV90s3c5aD9o35hixSFyyVOgagH
	OA1FbW6cLQ7ouGGwzJCQCzQXi6YsEGxOzIm/gznmp86aqMtkL5w6iOLEIB2Ksb8fdHRP1qcFEHp
	St1fzzUMh28LaQsavnTjVJJvCJ6RGoNcqdsripK3TWHgV3SZJjkFL1L5iAj9Yme5ZAc/icFy5Ec
	pHUrR7RqzCK5wV2RRD7ACz/+zoINABvhorwbj+ASKyBoUNTNB6pRLdZlABY4a6KJLCJZpwT7Ego
	wwHozP+6HUUxNdvFWCj8sSwyGtuUhK19A2pOLDgAPje5YfRPNVpcMBup66miGjcnb54iSZ42IaX
	fuN99nLRRp/quUwi/WH1MrnK5N+4C1zkO7bk4khLIwRBBDMXFZKhf6J2Eu3cv4yM+5In2daRwwv
	xdWcbx
X-Received: by 2002:a05:600c:6610:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fc573576bmr24991795e9.17.1789730105827;
        Fri, 18 Sep 2026 04:15:05 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd1dasm46893545e9.9.2026.09.18.04.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:15:05 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:15:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Markus Schneider-Pargmann" <msp@baylibre.com>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent Mailhol"
 <mailhol@kernel.org>, <linux-can@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] can: m_can: pci: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <20260918131504.00005d2a@gmail.com>
In-Reply-To: <DLIC0I1VQLHE.13KVAJJ5FUYZN@baylibre.com>
References: <20260916124236.1389-1-joshua.crofts1@gmail.com>
	<DLIC0I1VQLHE.13KVAJJ5FUYZN@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 11:24:09 +0200
"Markus Schneider-Pargmann" <msp@baylibre.com> wrote:

> Hi Joshua,
> 
> On Wed Sep 16, 2026 at 2:42 PM CEST, Joshua Crofts wrote:
> > m_can_pci_remove() forgets to call pm_runtime_dont_use_autosuspend() on
> > teardown, even though autosuspend is enabled in m_can_pci_probe().
> >
> > Add the missing function call.
> >  
> 
> Can you please add a Fixes: tag?

I guess it's not a problem, however we had a discussion in the
USB subsystem whether this type of patch is a fix and ended up
agreeing that it's more hardening, hence no Fixes tag.

Alright if I just append the tag here for b4 to collect?

-- 
Kind regards,
Joshua Crofts
