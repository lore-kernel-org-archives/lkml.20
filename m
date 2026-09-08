Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9156B874
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883375; cv=none; b=OSqJQB9kOlFAjCfiOeNemPLgnuoMCj3JXGMHAtqMXoPRG7KBq6k6QG5vIrc/JdFeBwrtOl/0Ne+zVuz781uxhRTrORvQLDURCX7bYC9A5AVYIu18WZGt+iQMRZiGO8Q+OQEA3PMaqi5X8vkYwDsGVzVZVh+CjYVMbZWn0u0FpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883375; c=relaxed/simple;
	bh=fowOda5nGupsFf01k/omN8c/riu+f+Ge/XDh5veNoF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdkq8DIB11cYqUAXW6dM0Nqk7Cp+mrQGP42Dhlrhj+9NFzc/6/U1IMWub96KTxxlUWgzW7WVe7zRqDN7NJTsiuSltCx0kQPPmf9zypTHXJMDQQYA3hpCc6yjO+AVKH6wl9yvyerLMq5vPEP7D02UESChIg8Ib0VfGDjnBoB0qJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrFHqBHG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrFHqBHG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d715f4a587so66844875ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883373; x=1789488173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eqXOidO4jwZuxgnfuLYDm8pckJde6bH8K5OH3Dd0Jl8=;
        b=LrFHqBHGZ5pOQIFSL8qXbLkGPsQOTVFWV9aRqebWXyIlvURfeZIofRtLcGGnvvm/me
         4ue49ADo+4+GU/+U0zglry8JEQvcPNRa+TNvP1/AyW7aVXZmuTmMDL/CS0+9GfMSJl+J
         EdhYpL/lPp/gjoH+Bd9kHPvBqbFTalsN+CrT/k6EO5B/S2fgfaIhjoQNpgFZ2kPHAMRY
         drJ+zX9v6V6gfDkZv3cKxhvHIKMNlZXxlaLM2no0Cysw0PXPmQ+6LfgflqhynIJss9fc
         Su7CHmpcETr/Br6grTe26ysFc2pmBt8RxFH8TNLik4srhFyhhLLbnjgJSRNnsKAJwGmH
         gslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883373; x=1789488173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqXOidO4jwZuxgnfuLYDm8pckJde6bH8K5OH3Dd0Jl8=;
        b=eMVO6QdJ5qCqWOSTEtG/HTX79h7h90WR6FwwYnxyke/HyiksjVxxUFFYi3XokvOCMV
         PXYvGztkPkVs9bfamCaJp0nLQskLXs0sRyIsCtqx02ao5JRejbTC61zAizMRJaKh+PxX
         CYyjQ28zEmuZbH0FUFek6IX1WlyXHMK+r3MeXjL3zgMJPr6kJoRsr1fove2mw0KM8QB+
         OOnqf5AHQFAMA6P0kM/5FNjzN3+IpBsNuuG5rnmOgKOReZiNYlIlnSRDldfd/AdSjPe3
         2yn9ot5Od/mkYywn5x2I17yfMyoMYglCdkxQ7msBcGJIMPjjmrgjDP8ppnnTd4U4mn2P
         BA9w==
X-Forwarded-Encrypted: i=1; AKwUvBx8EEgNNHREO28eXh2SeOVBKvqdtMdRiLttvlpaYpZ9+NTTKyukZ+ud463/HWOH1ovPPtkewuC59gx1cAo=@vger.kernel.org
X-Gm-Message-State: AFuF++nOa6viDiVb2GNnruV7jkWmxmxZAfUZVJIijVlEEcyH9FNXeptk
	9lnLZAvRJ3ByyyYet3jsjegF9L19sPzW6SuvkINEOp8FrUTeSANmcjWE
X-Gm-Gg: AYBFou1chdPByeJI0vCA1f75VquSx6urL2nGVGTrwodHEvf4g+cbvc4++VHNk2vCrE/
	ryOLxiael5YPxu/36oxfw6C2TJv1rr5qTEr/XoxWDm/3i2GTdWq8v5M62+HzJEp91Xf8Nxay2pj
	SMQ0HAYuZIdCOxXCJcAe8Ns3md/PKU5+DG4EDJOgzxe7JOQLeMao8tQKc4PXU+LyonDkVXAFAT/
	YF+eGv6zKI1W8nHO76WPqbZ8GzkMB+VMik4mfLfRQHsWeKkkeIUIulnuG1jzozG1GQRGBrTfcPZ
	vPEE7ZTZiEe7LCpKFgRxpY5zd7ART6Rm5JoWMw0ptYk7ccNkyK5DdoKx2LVC+uPIRkCrdUziknv
	IkkqQHvyZNyPXpM4Flo4BPgCuNi+1kP0N54KXPQGnADvHPKoyKTtjjLTxFunaD0hBAET3m3Kxd4
	tOx79BEI8glhsvN/dZcuNn4NEIk4u5BjsPuG2D/xl+YoRD8/2+SoTrqGwcssHi/SrXlKhYeEP0o
	Avl7Z8DZxtg
X-Received: by 2002:a17:90a:e703:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39b26226de8mr46784266a91.19.1788883373211;
        Tue, 08 Sep 2026 09:02:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd15asm27266561a91.4.2026.09.08.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:02:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:02:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: fix typos in comments
Message-ID: <4dc6a708-f134-4a76-b363-1a0e405920b1@roeck-us.net>
References: <20260904114249.26515-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904114249.26515-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:12:46PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied.

Thanks,
Guenter
