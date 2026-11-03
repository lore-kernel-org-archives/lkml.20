Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713962;
	b=DdXLKU2k5LYnqwoJcitBaqzdjzwrDQ8zgzepjXo997gtSoEftFL91OuHIB2u/Hdr/NhF
	 ugEvFIacAnIvsKsRL31Mr2OsEfkJQczRF848wruHXL7hi7mARbMUKT+Rde+RT8c8SARuj
	 brfqvPVKFncmFixGXRUi5QpXS92o1ad8VVCxvqsqVeCHsjRmn0+mmDux/jF0OuY/2FS2E
	 3BvvBa9HWKNtV7CyS5xMgfuY2PPXYT62iCvSdEFmraA5EoavKWRPVH0cTZ0r7G5Q4+W88
	 3NvVZirIth+YBQBG3lfN4GoPSDcbyPdJVoN5o5b9UGPPF5a1iFRK3qQBhzUHjD43bVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713962;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yZJfo9oYEeyXTDoCyv9KQAHG+G/ATpGWmwk6aa2xlaE=;
	b=w0212PQIqfRJcUaFLvdwBkMM9ivv8uA0IwtXDeWXDrfU3Mz+PeXzBXvdjOcur5s0s0AV
	 XjRAxy01Zfy5e0jVTaZo+6FrAUMMoWnowmAc7sx3B2dsihRDNeUZP/MeZ/uDQG08cqyWJ
	 ymhATot9k5jg9iq46bXSNtwmRkK4Cv89C+ERsIIIQo7OFvG6ESbaNdQ0s6s7Em3Ln2iqb
	 7s10CwmMH4/sC30d1SgsdZy/Xiq/Nq2Cgmd6okIOXb1nslRTf9gmjztZTXiWoMUBofmZR
	 Cq25G+YegTy08sR+hNMrlfrg9EqbHuV4n+by9+z2gmCzChGI+5j4UbL6P2hV1cfteRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOIOtxwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BB606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOIOtxwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0E11F000C1;
	Tue,  3 Nov 2026 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793713961;
	bh=yZJfo9oYEeyXTDoCyv9KQAHG+G/ATpGWmwk6aa2xlaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOIOtxwBaM9TpmgKwAgiGluslQ29Ry79BveIub24E0A0oqnxvr4QFKOBdqMQTiPek
	 GdE60X/sPS5Te+UcezZ+egiL6q4PS6R1RazPDa03Nps+ci3l1t0kEMa+tNO+at6Amx
	 d9Pwor/eFeb64bVHyrLd73pikpBeJnKkWWuGgexuyvrizAzjDUuLgjp94Y4ECwPVxZ
	 WH7DKO86yRgniClgZlFy4sPj79XUt780870vauaBvpVKlU9oK1/MvAQfGyukWxS26W
	 5xkoIm7t9pfdvh8/NEG2cMSqgs0BPW3YbEz19OgXK2KIaQwxnud49Od2nbzx89YZG/
	 Jkl4w/MJOKQfA==
Date: Tue, 3 Nov 2026 14:52:38 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: anna-maria@linutronix.de, tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clockevents: Match the CPU when unbinding devices via
 sysfs
Message-ID: <aunnJgIALzGyhO41@localhost.localdomain>
References: <20261101141120.367124-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261101141120.367124-1-thnkslprpt@gmail.com>

Le Sun, Nov 01, 2026 at 04:11:20PM +0200, Avi Weiss a écrit :
> Clockevent devices belonging to different CPUs can share the same
> name. The sysfs unbind handler selects the first matching name from
> the global device list, which can cause a request for one CPU to
> unbind another CPU's device or incorrectly return -EBUSY.
> 
> Check the device's CPU mask when selecting the clockevent to unbind
> so that the request targets a device eligible for the specified CPU.
> 
> Fixes: 03e13cf5ee60 ("clockevents: Implement unbind functionality")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
