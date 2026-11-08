Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107974;
	b=wXgzJbrmmrJV5WPfnRCL1IjUkOkeaR6KO3yFavheUGP4sN9YIecx4pANlqkZcjba2g/S
	 ccwoviZVd4gP9mHiq1Zx+7mGD5z6pBR2gtXECzMI5yVUeJ3c05D+YLu0XPpeiH1WiYfmO
	 lcRDOwNwxMawtGsWnKdZICnfLrWAXEyt1fzHrJmc+mAKh8fUuXA/EZnt+D5lkuJXL55Vu
	 R599PjGTYSVih+gcIyllRywcIpUrZOZV4Y8V7PUA0EYnkSGFy6ecTuACa8N6/qMf4L2oW
	 Cod7asEWrA38LwDpQZdZEiOT7A5BxO1YoVoaZeQGr4+IFdNsBbEFXjv4hcg6mYAAw9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
	b=ojVO0n7n0wZH9MUc35AZhuAASEOrPhJDEarxT/CwciOsiQGWB7ih1DgggyHGBLFSN9Uq
	 kgrSXXKZyKa9xyyHpa2w/DHAy70ZGrXlSaK3FPqEP9SMDxC7zjmGlXgLJZxM25DKhOoVc
	 X4s0uzN/pvpKZIwj0QKTgc5KviLFHClNXaLY0PwvIHHzjdj1uQG/D3fLmFlEyiQeWRwgQ
	 6MBvZC+duqVUurbqI9SoB7CtmOzm9QH8gM88TqiyMJe05s1LzwSu7w4kJio45lEmJEcmL
	 4Mfii5fkaNgqI8WXD/WHMtVZYeP+M8kWSjPcpTe8324Hu1yM8+cjGORNW7vKqyWlwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=viP2cPCz;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F3606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=viP2cPCz
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso817755ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794107973; x=1794712773; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
        b=viP2cPCzbkUz+X3QzbH2tTJwhuY9cFphK1tDdoWqtLoRTY9RojjKMgu1VZbQHgIapA
         AuyynEdlpk7o+voMko2dFlGaLSlsnTIdpVgy5BrY0nSHCzk8b/5f2u+IQ7rFOVSQu2ZU
         SiKTcK5xSVvTL+xUPGa56wy2m4RtbGrVnCE50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107973; x=1794712773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
        b=1X887BHJNEthPnveJeLTOqL/omnDtaYhneDzhS3UKlqqdMX+k4RgzzEU0Y48CfLEuk
         WotG/TXmSCZLHGlFRjkRZq10BZccFJ7T7s2V9vIoBDT4YKm0ozu/SboHTYxNc+MZOtSj
         AZP9gSIn88CrLr4aVSwZTSBjVg12GgnHYBtbVE2QeKnqWMasv86mLrPTLfDyLWI3b8yJ
         kW1PCGaH3a2n7VrgKu7dHpHqvPBWKUL7fh8atgpgNYTMcIGMnOfkyd8jg/n6uRVKbZQ6
         FQJT8IXZlBNaUNyXAq8wND1FS7LafzEBZb+JIioJrwgEL0wjP4qlOMRXO7SnDjPoaLNN
         xiBw==
X-Forwarded-Encrypted: i=1; AL+hErEafWyIBop1imDjwOt3TWC86kRMuD8yVyZiK2ljNSZBZcXfJB2JaqwtBzn7PiPt7nr0XBJTHFxjT6JnnOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qjt0ZY/UXeykdwmfgikrG2eGNaTjfj0KaGAMATlCxvadyWnCP
	g092XQ8hfxz7RMoGrh24mVan5ILI43vSGfIs4bBKIlLOkU1tcr3O8tuAuYMJz8yg/1Y=
X-Gm-Gg: AYBFou0odWrK6q2ftknIFxKuqUlxGIhU6/A95MVI6m89/pOYu9espt0nzYukt+ViVhl
	PnsKtiaZ0diDKStUBaf2alnhEcw806El20v13HzlQu7Ly6HGqH02YF5dtxFimonP7bJv8Zqtee0
	BW5Mlocwt3wizcPX5i7PGQIoSH6ObOKOHKZwRXqQbGtIjOq1jiKcTaNkgc7MJpWDK4SO6FnNSdZ
	4mpw2OxZuA3PLhfl6yAf/hYkXhSvP84a/BcbAZOeADo1Ga3XDGS6GE6T4oR3Nmd00t6Iu7mPDW/
	RKlqZ2iUyRbyx6MMkjJcP8arKK0lheiHNrvErMUqMYl8aa/W6RJLBUkwep0CYtMuffS7bcjf2gW
	WihVnnpyG0LQcKznUO+MBl/WvSLFp6NNSE1KTf2vtytPTk8mgoHBb6h5P7iwSSrIfGVf1vQu6zw
	Cv3oB4To7XM93hbwHoIOo/A4lSJ4z5aN75ehu0aFTjk3+8/5rWL1+KcNbWi2t+pTF57OxYA+sOZ
	7+LD7zXHQIIZop7vgALB2BP5d4xGcn26tnRw4Y4Fc8yLI6B6S/arel2eYCj0S22bycsgvRWdQpr
	p1fzxH1ERkSkfFcm+Gm+19jFTnQ0q0N14BEkjv1OVCZcrdiPvsalGO1WCFp/uoCnYVsQyzh6cy4
	FG73O++fW6v8XdFNSI1+RsrPL336OQSLuY2R4aS2qFTf4lhOSGTjCDR/vXp7IdLgdT1rY/M9QTF
	uRraT17Ic0V6Eih+8qDbeoHpP+4w3wN0Mbhec7z5wH0mTtb+4nmoIr8A==
X-Received: by 2002:a17:903:3c50:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2ed8375ee02mr4790015ad.13.1794107973499;
        Sat, 07 Nov 2026 19:19:33 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm1411875ad.17.2026.11.07.19.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:19:32 -0800 (PST)
Date: Sat, 7 Nov 2026 19:19:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] kernfs: Build paths in linear time with respect to depth
Message-ID: <au_qQz3C1yNFRLOL@chrisdown.name>
References: <au_pnu4s141ylqHD@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <au_pnu4s141ylqHD@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Chris Down writes:
>Fixes: 3abb1d90f5d9 ("kernfs: make kernfs_path*() behave in the style of strlcpy()")
>Cc: <stable@vger.kernel.org>

Note, I am not sure whether this is worthy of stable. But I have noticed that 
in some cases this build time can be pretty substantial with these locks held. 
But on the other hand it has been like this for quite a while, so maybe it 
doesn't matter :-)
