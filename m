Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257799;
	b=iizp92n8HrnSv18dqrFCpF9TSzns3bEMsdlpmMpxJ8Him126vyx/RcQorLemWe9vD/sD
	 r/fBIqAibl8EVS4RGKKoJsRyzkgD4rk7EqTZPC0Y8XWe3fv3lIo7drxKKSDXCYhs3onY0
	 iCGfK6If74cJe4CkTKZueUM5lHHJHxRUa/3jN9IkrwOucuTFTWkDeD6YFvfgTbZoFLSA1
	 5Zfbz99qaIZ1+npUKsoLcv0GHq4DzWRcbKqA6c05MdlzBMu0yN7kkkA2S4fS8KhR0t9JG
	 OFj/TWm3RC2zYKlWLr4cedPIH1u/MLBA/1637BM5qMYCXdpqAvvbDn/4KlAalqjc0BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+24fO7y2fmJZ1tgq8PrdFMTXk1Nzs276jIWQJSZEfxA=;
	b=2FaAQVGdw60Uf6qfD6IyvV8DwQiezJV+rNaH8L2mfJPnX9Rju1r5bNzSaHhvoGBV5IUM
	 k4AEbxzwF+P3FOMPSvcTvwIME5NdTMRBml1ky9F7nMNeW+AEb2WmTambVQwZKfnsD0go1
	 gMDSZUIGE7fjmwcpS6kOmcR8HyAjZ/5VqvKX0Nq1eWA+jxrrhOUZ4S2lxTTFQszSKQ32F
	 XVc0Ubq8rJtJjIP6tZ6fjraoMXEoqy4H8PZ3TSZUW7ja4xu1I4g9Fl1rp5iokthpFG3b2
	 Cz9mXZGUkrou2JN6O9q5StaPU4L4BbzWWAkfKIXHALypdAAXz8EmFuzdza2g1J/GlfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=onLPMh3R;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EAC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=onLPMh3R
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so948558a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257798; x=1793862598; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+24fO7y2fmJZ1tgq8PrdFMTXk1Nzs276jIWQJSZEfxA=;
        b=onLPMh3Rbl+yb3d6aHPwdYuE9uLI9UANLswhqwwNTXsclarmg2T3rxBT5x9xyX18Lr
         TYENKicSDzGYduafvrVXSBrOAeRQBu7ufr81NW3sgUMARAXY2h8ZbAwmnbpT2VYdTOIW
         fxF18R2Xa5uCPxm0z7F+rDHi3Na9mBrhDOjrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257798; x=1793862598;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+24fO7y2fmJZ1tgq8PrdFMTXk1Nzs276jIWQJSZEfxA=;
        b=qnJTYBQ/NbWQkf9g6YcqyUJsxv0uX8luODtdqTu646aJpQZ2QfADMazobFyZhAR/Ia
         HqMJWmiCF2bB6SsBxX9NRNzBCagUt8ClgaBms2lwy2NLCVZRDW68lZwE59Yn2GMWM/1S
         m66EEKjgz+G3t4PDO4TKjyfYJGnjdgNBpDOnZPs4ee58RBfDG9x1Xu+htFXisZoibFap
         pEG/O5Dq0zyr6oPdi3q12BslTBNNbdBPrBb2yNw5VBzjDzDnXac+mKxQgM2yCT44dGRz
         1RJFDVoksKbeRY3yZFt3RF+9H+70YLddQk/yIKTpZDvv0moLPJJUaPO124EjiXcsbZq0
         Kcvw==
X-Forwarded-Encrypted: i=1; AKwUvBzdSadWhWTVh1PdHt+YzACMLG8jngN0hyqkZs97PInQbLOzxJ7l6ayvvvHUUF5MV3Y9XIgkr8pKugjRfhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZIdkM3znJoPVqC5GUPoiMtgjEKj26aniuEtb4/8zcHK2ln3J6
	/G307nUBHuQQperLreuuxF2xu9oZMSix686QF21Escr2GhVCgD7nvX+J1tYXutJa10I=
X-Gm-Gg: AYBFou2cwIlan6Ei4YUHB0CBFWKdVlCY6jp7OylWgwm47s7y3UAFQZSVvZWWlKugbCm
	P9YX0EG5zUz2Rb0jNoW0RyOvvT33zev7E33WkkdSTR78IAzgBqw6qX3N8dsr3i48TRvfcVQJE+B
	E86EHXdwxl+hpqQgdSAQMBh0zHJmvcoe7ncT7uRAJDZXcYJQYanxBDRECpOrp6GRkV+e2Rw79Wi
	sxrbiJ/VI1rCy0EG1/30VORQRzPz3H7rei3J6E7gr1SrXJUOScb88gln6DmF4sKHGQgv1LHvLCq
	gUh8ZHeCuZShdgCbLe9lc+VYyq91EzDFaY/VXgkQJQsZQ6SKrs1DBftRTQe0MDqmdXkAK4wCUZB
	pPLqsm+S/5bnRXtX9bTy8WD6ij6r4a7k0SRc8CrEq6R3kFKdOUaTpByZNhll3/nr1Vh3k5S0FrQ
	xihsktD9r1BKu5O/VP8kqLJoyx2SfZ3jzPm+Xz86UnH2eAhFKf+MTrzy1cD4uSUEureHzz9YcN6
	7ZRXhXwKmvOryoe4yYAJD6+Y6GU2p/kUqH1gontr/55tlJCKnmaZl9ZLaSvkgLK9XWRl0ORYZjJ
	tOAx63t0l/8eFIPRZLR2pRDcaCOmuTFAj6Kq5qPyQHWd9pKSzYVTTkbNpuar87OzXb9Z1s3sHrd
	nxDYd8smj2Uhd7OuL04XoYALfmuA9zPYGPN0yGzIqAuyH+LKbpMnVeDP1iB8tFJlBweZmaulABb
	boI55sHsujXZCPGOb1Sg==
X-Received: by 2002:a17:90b:4987:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3ae580ac6c8mr3494385a91.10.1793257798415;
        Thu, 29 Oct 2026 00:09:58 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm2809981a91.9.2026.10.29.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:09:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:09:52 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/16] printk: Ensure consistent name and devname when
 updating preferred console
Message-ID: <auLxQDWkHLV01D1t@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-8-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-8-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>-		strscpy(pc->name, name);
>-		pc->index = idx;
>+		if (!pc->name[0]) {
>+			is_new_entry = true;
>+			strscpy(pc->name, name);
>+			pc->index = idx;

console_setup() can hand us an empty name or devname:

    console=,115200   -> name "", idx 0, options "115200"
    console=,foo:bar  -> devname "", idx -1, options "foo:bar"

For the devname case, __add_preferred_console() matches the first name-only 
entry (`strcmp(pc->devname, "") == 0`), e.g. the SPCR "pl011"/0 entry, and this 
hunk now treats it as new.

Then index becomes -1 and options become "foo:bar", so the SPCR console never 
matches again. Before the series that command line only moved 
preferred_console.

For the `!pc->name[0]` branch below the slot keeps looking unused, which turns 
into list corruption with 14/16 (I'll put some details over there instead of 
duplicating it here).

Rejecting empty strings up front, after the `WARN_ON(!name && !devname)`, fixes 
both:

    	if ((name && !name[0]) || (devname && !devname[0])) {
    		pr_err("Adding a preferred console with an empty name\n");
    		return -EINVAL;
    	}
