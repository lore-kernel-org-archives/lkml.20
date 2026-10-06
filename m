Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F430DD00
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791316821; cv=none; b=hgO/93akNd/3dufubGmG5qLnnUEMmZ3x+9rRHoGKIJuyEc60xzcZvIvqxVtB+DCGk+N45oW1ZSitay3YodyIUQ+g6qyd+9FA7CS216Xr35TL3dz1pKBl0xjeI08HYatKuqMYE2DJQ9ZSztLeYIXi2/iyChCtDCItUO3typ6nT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791316821; c=relaxed/simple;
	bh=7SFqUvYZyEeLgvCRE96WwdfkhzXxHXTyCW4wbZFK1EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz1PIuQMmrp+8Ur6wrmDDP1tKFU9/ml8A5Nt+HG1oHN35aMJzNm5FrZglD5ZXqLlSo3A9WTAaIRKGXW4TtEGfcUaY0DiQxTdizWEVlmsWtc/jUl6GuKTPJ/KqX3rvuUujpVfkT1301YtR1dOLMVvIHD928bCuGntD/Z2NuB1X1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=bkyu0B5Z; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="bkyu0B5Z"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1638826a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791316819; x=1791921619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cW3Rtfy0hQP+eT8zDQmID+6Pmx2WSOpAfGo5d96jXs=;
        b=bkyu0B5ZCTxvmgCV65RVWCb4Ei8+K6XrHLpKiaM03i0fSDsChjVA+9iN8olUZrgJUB
         Na6ah7gGyMJk/RhaRMyhRXfKy8U4wWXW7UuNUkmcV/yKEoUuWXEmNi+WfsmCQrDXSzxp
         1lQkBp+GPIWYXfbgQZGOlE/C8rz+ewoE11DOCI48PDgVLKWPhreoRdHCdEQA7b1HV/bE
         app9Pbn1sZ/0JyK3pZhWG6ew1RkJPRTWYT8JKbE+6jvjcthK/TYhAHDBMf46E6kvuJWq
         GeqE6KY8LCZ4tlSdjgq72fnhK+KHoW0+XAG3VFdMBYiQYflkSgFd4Jp3R+LttGIwrA4k
         U+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791316819; x=1791921619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4cW3Rtfy0hQP+eT8zDQmID+6Pmx2WSOpAfGo5d96jXs=;
        b=cMltcqxTe8mOPsIaoYpUeaxBirbpJngX9RdvkLqG9z7IOnve5vfFfR/biOhoVuFqgz
         XkwqytRaA3ID1aBmbqqDyuJH9BzY8IXL1GWW2ValEZJ2TwXqPUpuPJg/UxZHoiscQpfc
         GJGuIUC3kLAADaGPL0GvbySF/pGICSFE5gwcVsw3GvwT26E6MZURqXi79pFOmQnlbfhb
         ShRQHQOueg8t5rLc8eEj37aakJoAl4nqejFZtP6iVWuptB8xgeAkH1GuN/dusnu0yCIg
         jC2psXznyHl7y8nvT7mbXZtEpoeOiSkqzYvLZ/PZ/ytmiMKFgkd/9zrzp7On5tWFRiBk
         ZNnA==
X-Forwarded-Encrypted: i=1; AKwUvBwRUOHr3DuzHf0CfZqXfZ36NLYuMUNiLhAEPB/F69dFN0WZUzWRPAxZi9h7SlLGpjpAgzPeeDVrdRSDsqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/03fDuziy+WMLb7CWrkfu4I4GOjcxu1XyBWpOLtrsHISK4r5N
	BH2S0WYStxOmjDon6+v3nRMH35zvCOn/WHIFR9/nchwEnTBS3jpzvxwBF8sVxS3BxHc=
X-Gm-Gg: AYBFou3LuzWpYomkdpZdyRTVLdX0zElB0UxQUlejW6i9RFOPEG8HQ14B2/DUZ9HgChe
	5V3IrLiGuo+rdfnTslpijuR2ymFdrVZLngaWvgJTMnjD/VLSSAM3n6tC9ub6lG5jNcHs04msyqb
	kbZQEJ35eH14sFXgI/UMeVu9V87b6jj0W1nnR10n5hZBdQwxG0Oygn6xYwik09BV/Py3hCeDmmy
	EJLGspsvLHAv+NDuIt6uNrq2TLgORIZL3Z2yb25go8RK1OXkkUbsrN7HvUgEp5jjFfX+jMyk7An
	VWchtlyoj7AI2/U930/jWFq3EhhvQUT87WMhXZlbD028gq4suLUB7TgoDCESS8OkWjcBgfdea0Y
	5FaNIXecX5iFRfWZvaFMjt0j1atS5+WL07Wg5VJMPFTRSvrvn0g9A9rZpL86UWFFiDB4J74jayl
	GJTHXPlBeGdiHhVoHgKCYHuTMarOhyrs6I+QY9BdyVrZMc/LW57KBOrjWBJjLPJHSrWXrASzGKZ
	UGIJ6Frhok=
X-Received: by 2002:a17:90b:2687:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a8a0f341e3mr231885a91.42.1791316818489;
        Tue, 06 Oct 2026 13:00:18 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b7727a1sm951252a91.17.2026.10.06.13.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:00:16 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:00:15 -0700
From: Joe Damato <joe@dama.to>
To: anmory <anmory@protonmail.com>
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC net v4 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <asVTT+FQPowDZWea@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, anmory <anmory@protonmail.com>,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
References: <VyyrJwrwBZEIGezDRJP8QPxbcsGROaxnmohLCnzNQY6sX5CEt0BK3AEC_0MGBx6OxGf4H5UG_xQcqgtAonwmXLdZ5Bd3INWMsof8Oj6ruqg=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VyyrJwrwBZEIGezDRJP8QPxbcsGROaxnmohLCnzNQY6sX5CEt0BK3AEC_0MGBx6OxGf4H5UG_xQcqgtAonwmXLdZ5Bd3INWMsof8Oj6ruqg=@protonmail.com>

On Tue, Oct 06, 2026 at 04:43:42PM +0000, anmory wrote:
> Hi Joe,
> 
> we appear to be hitting a very similar issue to the one described in
> this RFC on two Broadcom BCM57504 systems.
> 
> One detail that may be particularly relevant is the ordering in our
> reproductions: on both systems the AMD-Vi IO_PAGE_FAULT occurs before
> the NETDEV WATCHDOG / TX timeout.
> 
> We originally encountered the problem after updating from Debian
> 6.12.107-1 to 6.12.111-1.
> 
> We subsequently reproduced it deliberately on two separate systems.

Can you provide a sample program or explanation on how *exactly* to reproduce
this issue?

I've hit the same one you are describing (IO_PAGE_FAULT before the NETDEV TX
timeout) but have not been able to reliably reproduce it. It happens fairly
rarely on my systems, but I am very eager to debug this and fix it.

If you have a way to reliably reproduce this, that would make it *much* easier
to debug.

Thanks,
Joe
