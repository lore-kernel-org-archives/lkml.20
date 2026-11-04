Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819022;
	b=1SdE/i0oh6a/g9xQW3AKJc8+L47eKbfrTqOsuATiCgji/VDqm2exgrPv15Mxln8OqxeM
	 2pGmd3OAUongyPi7/SWSSVkctVOh8lceKHkUGeTqdQJqs2xxeiL0r5xEsBAxwmQuaaGNR
	 fosGigMY20o/Q9W/Pthr2eVlxVHQiKgMJNuxNEieEpb++q++5ve98Nd6qMDoxDsLUUaDD
	 Y4LwmQd4agb0qd7NptinzDgUHl3yMXvY9Z69cK1+kaACURSLF6cvun0MNGvSI8/+s85ox
	 9Mv3VSg3nIFIjLPnv6WSS2YS1UIpfXNcD8lCHEPkW2zJyF9KW0b19w3oy48gMcqG2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=6PvaX4UG4tQqa6Gj0rxkiTMc3qE2squ/dgttboztFLY=;
	b=xAtjXNKl+sPrydwvNphP7z4AZzDbi11H/gCiNHMMkWvedW0YLhtuBFGqRB8kROFYKGuI
	 PCMhM4nDuLfwaIVlN74x/Qzizg8Fa3UGP55Iy7e4pLBHcm5hDlgW5Qyfb4vdKnZmgOL3A
	 kxsjl97x6uItwy31fp0YUAHitfCI+787uSLQQzw1cuOe5GvWwtraLW438hMpP7GP/BJrx
	 XquwWmhPpq8YSOf8YdDCXjfa2tkkGEPdPZ7V1VwG7q29ywMt8r4UPr25vsBuAkQ++OfFP
	 AHpueNqYvNj2YjnYLgyrt5Q7cTNI8OVvyrvZ1wCxXomSz3/amzFgvx0Vo2rBYexXNNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPHBhcRs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D49606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D49606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPHBhcRs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so8589185e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819020; x=1794423820; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PvaX4UG4tQqa6Gj0rxkiTMc3qE2squ/dgttboztFLY=;
        b=WPHBhcRsbgJGVIUfO8Xvum1V+GAjb9zX5X5LYaCjDh0XqHEApJkx2QuBtJoyMvEee7
         2UiUUp2mEFuiTq+8WKKoh5N2vyzXSJndbwhkAJZg9n5u6ZgaRGOOr83BF1sL+jcD2aPz
         v5VqbmSCe00U2+A6v6xb7+38/W6J0XlpglrXullKgy1FTPCsN5zhO5uFPiNixISD1lTo
         MEJlupYjL6fWH8Po7Eyzvvg1Ekv4YOuGxZhcbIaMXRQ5Om/24DX7cOOR72MWhhUcmOB8
         /bVDXv63Mw1XwCohFSaHtqqzqcV7eDqTPEsLP+LECQ8IV3AbYkULKxjyN+JH/zehVjGG
         mJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819020; x=1794423820;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PvaX4UG4tQqa6Gj0rxkiTMc3qE2squ/dgttboztFLY=;
        b=U6KSNt6uLtL6Bq6JzxAZoPhnwNK5SK6HOBiSMaPWcmkrrSTqGozS0+yOObTSw3+V5o
         6kxt+q1tk3ib4cPI5/4VNwbLzeid+Is3faaQ4CzaVRbg4Q+b12DDkbLGNY/aN9fueC6t
         u93gyNi1niSrseVFvqSSAw7O+C7dnoh9YsLnyrzhUV4nEdVkTMbXyAZKGMZqt+VpDYeg
         gzkicKdx2W58MqPXQu+FlVN2XMyM8AtKr7M9as67v+sCTgqLViXGka/8Ktb/4fnIIfSH
         DhRqyChLUbE7PogBP9CdnenxDSMMq016oK8yoKpcymc6ttL6GetA8FrHi6vjHQn4rRH+
         mpUw==
X-Forwarded-Encrypted: i=1; AKwUvBy79Pl5e0rEctErdttgnf6aNXnAdE8lrMRiCb+TaMo4DPiNESEDR94mUCdYY7BDsOXeQPYPPfbQUh3/DFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TGRrR4s+o+j4TZpMamxhRvhqz3wIsH6+JmTz88fliSM4JP1Eh
	MgcUAwRoN9wkUmRlfYsNUb9OwKBydk6VfAtHNk7cPmaS/Ig11jvYGJWgYztG
X-Gm-Gg: AYBFou0InFdonwFigfgehf7P3p7H8/iNhXSRbur5PSByLpR7WVW+wZ/HgseDIz23vv6
	0uLcClrJYqEAKumgEpzL1szWXzaMypVC8/VyM2ZDJHuHUa680aiJb6md1zFfkICFbmrCggdRfLw
	uI2JhK+ZJ3i3vwyjcHTeOScjJxfOoQEHxIozny/+gB8dHLLMf/eSdJdDfxGMZwOt7ORJGv6fo49
	B5FI8NWCWNT+ETWDwQ3t2bwql4i/t8U4bDrxAfkgE2+iZUPmsC2YhRHkrgrOn1FHy/VFeWaOr22
	aTFnrZwqIVjmnoKvDnm6XaQb+7dFqW4nvNfzTU7rcHOxNpMAKKKO0pHPhCsGw3mNFGwT8bnxhhp
	1FzcoK7TXeYSfnfSZOJzpKL+Q41+VB3iH7cCRj8Xl/gWQtSHi1aejDUh1CdXaMF0vz28XOdS1Fr
	DFm3eswPMUXk5GXydbUVUTSPg3Mpx6Bi4Tag/lbPI5ZhE4PEcjiIVD2z4Dl/O8qQOUgTkqJlB/A
	DvVvIfWjc7A4R02qfy6K1SImyL8w1ZHIcIq88cfdHT1BSmO4sut1OQ12jbGpBUjDTH8J7f1Q3Sk
	MLx4f6gbatyT5BE=
X-Received: by 2002:a05:600c:3510:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4ac1765d674mr386989725e9.22.1793819020385;
        Wed, 04 Nov 2026 11:03:40 -0800 (PST)
Received: from p183 ([178.172.146.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm4336205e9.13.2026.11.04.11.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:03:39 -0800 (PST)
Date: Wed, 4 Nov 2026 22:03:38 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH RFC 02/16] proc: add pde_pin() and pde_unpin()
Message-ID: <f3511970-2224-4b53-9ae7-478320b1c8ef@p183>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

> +/* Pin an entry that can go away around a call into it, see use_pde(). */
> +static bool pde_pin(struct proc_dir_entry *pde)
> +{
> +	return pde_is_permanent(pde) || use_pde(pde);
> +}
> +
> +static void pde_unpin(struct proc_dir_entry *pde)
> +{
> +	if (!pde_is_permanent(pde))
> +		unuse_pde(pde);
> +}

Oh, I didn't sent this before because of theoretical bug.

If someone uses permanent bug by mistake or because of misguided
perfomance optimization...

Permanent flags is set after publishing PDE to the world,
so there is a window where +1 is done but -1 is not done.

And then 2147483647 security researchers arrive and overflow it.

There is no detection of buggy usage: proc_make_permanent on dynamic
PDEs from buggy modules. It's easy to grep but I'm not signing up for
that.

	/proc/alexey
