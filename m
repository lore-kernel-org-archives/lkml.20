Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD35432C2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418765; cv=none; b=JWcUqBEsdCLYbPwtuHsuKeqEocm2nbyNPfSCgYLagTeZIrQskK84WpDI1x48gUZWylmRnhdzjVbBX50cBJjn8Ehb3zgWnNS6/a2l4asxWWCBMfBnGSGFHKFV8Ej9GS2pU2/bbdORw5Bp2fPz12CSQZZxg4YMb+Ijm/93NOjKpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418765; c=relaxed/simple;
	bh=5zfJOePWG9cQZKW+DAKveT93n+pJBM0wTyEwn1E/Q0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6WeNkV5CI2vUvORsCMu+dhyzldl30ZmLxOhsy31bopk8sYF7U5cIyaTQ8CT4xkOhmgGxU70uqJ9beCTM2zWXRQhHpGCMmOE/WKLR5ZhvRuyBdpZffIAR4QrZa+lJrNmRCkJs+LPSsdP4RwJ6g0M5pUTPTzcg5Wfs0G4C5jTo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SyqATQST; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SyqATQST"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so19241155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792418760; x=1793023560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PuKD8pWwrD5rmET8dKwSXlefQvizAghuftBsvzTY3ww=;
        b=SyqATQSTxnZVs9qX+4B99GamE1AJBIOJP6t+JMmVIq7VzHfCwhN8n90yhErG+jKtQx
         FSAulCkKE81mI+perFicevk960+bzWZqerp+67gM/6FRFt6VkMNixQSGGrnZbIgejCpZ
         INWyCqvIXzKzpFO7EYwlitf9Eg51TLyNRtJlVn+uJ++9+ZFQHYPpAIG3WjNL1F+ZKovP
         k5OyOAMxyNTDSDYyJyCmADovvPF9bwPizCmRp2RWkEpbc6Dm/wv0vFZeL1cjA3jQP2W2
         K/z9mHDFy8v6yIsGGTp9gSSeIy69S5ViYjSUs98dwskwcpeFgXoMILWYzlHYVQc9dn4o
         oRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418760; x=1793023560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuKD8pWwrD5rmET8dKwSXlefQvizAghuftBsvzTY3ww=;
        b=lF2xhbcm1UjVozDr5bMzmpZsM3nWShhrMtmkGNFwY3ra8gxyx6RTaGj2X1FY2HfexA
         DJinGFRwKAP9Zs/UtSNzaG5zDncOl2JKukOkyKlBVeeNaSeP47GhPl9owFYzG5pRnvzJ
         sK7Zq2sMdh+D+NbYD1jr1+UZaQlWj6+xXcmgs4/X73WoEQodGLPCdHhc1sbKaxXh6xIU
         e5KV7y1NqmNLLeMO2oc+u7d5R8/zfiVjsWWp3nfwv3bftdDOx6b2NBMZd5HZBU0WPtQF
         xtZqXFeHwC/b1n4wgEW2ibim3HyDf0qD6olOus0UdJZzS1nv3Bpi17tpcco3xVQUJ50b
         L+pg==
X-Forwarded-Encrypted: i=1; AKwUvByLfybqyZivBLNACFGuWzARb9tpc26oCKROarTaI7APDc+evIAe9S0U/+j6ABrn3b5elsXAltOWawvD6Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTXHRh+97i4jEfgLG8LA0RrG36Z3t2hIEkPB9bN4VURgWno4+n
	pbgLczRbhSFsi+ab45kpiXUOchuKc16egnqf3Skmt3TMPNTMW06SBUBuHbrDBPnbIO57gpWLOUu
	B+Xqj5Zs=
X-Gm-Gg: AYBFou2t51N9F6lUog5JaOqc/JlQLuS9QNQ/cccu4dRJIW5QD2BMJZFYk4naoOk8UsS
	BJEVdge9ZAo6tkExGiMr86YtRtj6c7l88cxsBxVH2JlCp1Iqc7u+PEh3bo9aHqMUDq6pOE7sNv5
	9I6uJWxo+hYybCyM2CLgUnF9hjSTu/hyx04txrBVoogYGlcYnRFsBmsF39QLpOD+k07J9Hu+3LN
	rtZRDC0qJqeaoyIZOSQoSB/Ffc2cJhwK08yKqGeRThmy4Ju/8iaDgZvKpi+lcW7C98lxebLKe/m
	0sKG91hczGX2jEzJoPjFWn4D9d5t9rPf+bFbRmf8xcTKSxNZBPsnGM7ebsaOHZHu9Y4n2eNzGK/
	XYH/OW5pWgyvZhsa6iw0WQyv0itoob2wInaBK3iv9ahdxiU4NRKTGtRkvuEwOUZuReDRKQIdVfJ
	Y0YqBMz7t0IHmdcO82w1UgfeEJKFK2TBxY34lMp+7d6DzasnBkwDMMnhLHCkYBfirBbh1AMhmy6
	m+P8aeHdxk=
X-Received: by 2002:a05:600c:6994:b0:4a1:e11f:b2ec with SMTP id 5b1f17b1804b1-4a1e11fc152mr118593295e9.3.1792418760104;
        Mon, 19 Oct 2026 07:06:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm21941328f8f.21.2026.10.19.07.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:05:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:05:55 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chris Down <chris@chrisdown.name>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Make John PRINTK co-maintainer
Message-ID: <atYjwyAPrJIXf5Kl@pathway.suse.cz>
References: <20261014115029.203908-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014115029.203908-1-pmladek@suse.com>

On Wed 2026-10-14 13:50:29, Petr Mladek wrote:
> John is author of the huge rework of the printk subsystem. He has a deep
> understanding of the code and great awareness of the various user
> expectations. He is willing to step into the maintainer role which
> will be a great help.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.4.

Best Regards,
Petr
