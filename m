Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283700;
	b=TYqWSs84No9kP1eka9+0uRv1borKT4IEqTVAdotkpvP6XVjUOnEw35nqMbHLcv1i4xbJ
	 DekO/hOhClslGsN5rYWsrl00V3COSk3r9Y6jEI5kwVhHjkoobdMmaU3CPPpXq54DwQqrh
	 gOBXnMIg+F9WuJ7WjVsHJj2og4Ct8B2x1Q92dMP0auQ0I7muEV/jPxw6eLYEqeqEl1UAt
	 nbVhrNGlW+FhLXwf/kNeKvVhmUSe6MpUEsEGSQxrZlzqJpvj0m7z2MFCfIpRR5H2mGDFM
	 8ZIl8iarP2pQyXU5++NWWHEhRP3lEH2+KjYyHSAOAJdlKll8vtvcOjwtKQj+/KgRuxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
	b=tNOZf1UDbBteQhb3cMIh+DHwp2aABkK+T/F/z+qeHUFdZI8MQV6zxPvM8pkJB8avgXIX
	 6mvCxI/5MwR/E7qbFqnGWrWhTWZjB+4+3xSEx2weF0j6DApZv1EkgStsZw6ahjYCGbanC
	 wwxJmvbUzJJqW8wBxYYYHF1mLsbjCnZr4lPMkwt3f0VclOc+w2X7R3Oaa2Ma6bjBO7an2
	 kQVDJ02kKEuyXBqAZ0VzMsbNfEA/mJjtsQ2PtLEIMyLezBSLflztadbSejOpDz6gSNnqj
	 ms5UDpeVCkn/NNHETM5xHcUD4h3pWhWa8AgxFbhQtK0lGzkvFfX2EICwv3leQC6dJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F394606B6E3
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F394606B6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535179e995bso21097931cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793283694; x=1793888494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
        b=GNvHvBm4mMgh7rz8MsEf+usoEGfQS12MNY4qTikdK3l8nMefZobclBwbgYCNCHbMRQ
         18r86okFfxWendn/mBrUkDkjHO37BOSuwRAsYQaRtd+NFSifDxKXg2ZcgS7OBd+Diuu7
         qNpKS5+EyEvAq9qp9ijq+AOZLvmqvNN4WerwMjlTU/UTZkLC7iEryT7UqHm7xc1W7XEi
         zgUA+k6GBxsSqpo34PK8gzcqe2jesByU2cRcDnWENUt+95+Za2l1q1WjAFCugdv1YZOO
         9hzvf/Aykg3ibJOysRmQUBq/mk/TrzepBrYgWV/dhJguVvXjm9/Pyj04sln/C0sy8x6U
         xTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283694; x=1793888494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
        b=o/LH80yhQTk87bl6bOK9BUg5U69/rbyAkfsdILTArJHmJCINdJQ1bjg8JUM9bnKwBD
         JILNN2ObivIR9TwDfBoKEXDkDpI9ntgSSWn/h5hMsKu6JyCrBIH0Mhek3xODB2bxPnA3
         HiVWd8gdRhd4oLm6WO/Nk4WuNbKBgSf1sUtI2YeKorCs0n5ROyex4ZmvGAvRgNCEzn8g
         L3gilWrP+J5Ys5rLTSXHmcZL/cZl2Ca5GyJt5T2ibCnSM9ZG4zruSq0NEAsD4hwr5eSd
         Oup/RhDzNQR5641PHJgTRmkeoxjhzizesrOT7iwBuNeYr6gCYbQsOpuuRIgncluG5YN/
         sE7w==
X-Forwarded-Encrypted: i=1; AKwUvBxW8HfKf37I4feiSUgTivGstL3fa+iWeSXOswmKlyuH+qY5eh/Qn9RVY7qoCWFLu2ma4lf4mkkOhfWrByg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8VWZyFUkTDHHjEQv4C0crpnnpczShpJnVdwvqhMIwyXMpFmFC
	gthHMyQS2s+brAU7eZbmFn/uBG3u2fRiAYdR+Lp8XDLIk4HrVajclVkXsozJxAR2XA==
X-Gm-Gg: AYBFou2wVe0HESJwbpR1qJcTbYC9hbud38AEeQNqwjRJ4RJTYqFfoTY3OgABVJPTCZH
	QBIiqwf5LkpPymT6pMThPYydBVnUtXrqTlmXx/LFyqgr4El+DXWCfd9R04yAv76muWtsY4nKP6h
	m4fcxoc+ShyQSZMgxwNWiHLKg0z1sbc5pQvZJIfcnFEJf0XRhoI3ZYgV/MBXfaZgSqf82B95EUM
	2k+fifq2fPPJ1BsVr2fIVa6BqBIUJ4CZ1eMIJHm4sZ8VOoVtJ9mx0PC+WJI9zv01r7jVZoZMVRA
	GlFdhUGHCyjrQSzJvzzYTCZz7/3L4RevJNgUi/dnrnSwLXcNIi5e/iwI0CTbVGsCbPci6xP2YD5
	xZQ8HIS5iwWer6Qz7FSsfvRMBCjdesUGVP24y8+ZvB78kyFG7EuxVUvSR6/4NgQobCMj7Tp01bG
	hMBqU/v5h6pTJvvv9P2lsjSvmFk8w1rabsxTDduhldb0o0XK4FcFwCsxvSw6QcelNOew4geujoa
	ju/4UQI9aMvzhMQ1t1blGWg/gD6sAIvUuG4FVvAcRsDm6NDeGkM5HyMOMRBmkxMEm+xXpskwkZM
	IL5oaH92N1F8J7oEOJxYASMKRs8GOjoDItP72hV9YKOdL9A=
X-Received: by 2002:a05:622a:58a:b0:536:76ae:94b1 with SMTP id d75a77b69052e-53fcc9beae1mr90780141cf.55.1793283693937;
        Thu, 29 Oct 2026 07:21:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm131305831cf.13.2026.10.29.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:21:33 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:21:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	IgorpetinDev <igorpetindev@gmail.com>, Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <f4c1664b-1c89-49c3-a5cf-7c496e63ed3a@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
 <2026102924-flashily-myspace-60a8@gregkh>
 <20261029114422.2ba64d53.michal.pecio@gmail.com>
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
In-Reply-To: <20261029114422.2ba64d53.michal.pecio@gmail.com>

On Thu, Oct 29, 2026 at 11:44:22AM +0100, Michal Pecio wrote:
> On Thu, 29 Oct 2026 10:42:35 +0100, Greg Kroah-Hartman wrote:
> > On Sun, Oct 25, 2026 at 10:54:57AM +0300, IgorpetinDev wrote:
> > > Hi Michal,
> > >   
> > > > No such domain?
> > > > Looks like you trusted an LLM ;)  
> > > 
> > > good catch, that was just a clumsy typo on my part: I accidentally typed
> > > appspotmail.com instead of appspot.com in the closes tag, anyway - the syzbot ID
> > > itself is valid. If Greg or Alan prefer a v4 to fix the URL typo, I'll
> > > gladly resend it, or it can be fixed up when applying.  
> > 
> > Please fix up and send a new version.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> This race had been reported by syzbot previously and a patch
> has been hanging on linux-usb since August.
> 
> https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/
> 
> There is only a bit of controversy over flushing vs cancelling the
> work. I think that cancelling (and leaking stray completions as opposed
> to letting them run, likely UAF things and maybe corrupt memory) is the
> right choice, as a courtesy to anyone who might create such bugs and
> need to deal with them.

I have to agree that Michal's patch is more elegant than Igor's.

(Although, as a small nit, I would change the last line of the new 
comment from:

	 * However, we still must kill these works so they don't UAF the HCD.

to something more precise, like this:

	 * However, we still must wait for the BH work items to finish
	 * because they access the hcd structure, which is about to be
	 * deallocated.  Any URBs not yet handled will just have to leak.

It's a minor thing.)

Alan Stern
