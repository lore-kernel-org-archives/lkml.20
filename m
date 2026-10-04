Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8DD3E7145
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139608; cv=none; b=JHsFzTad8YIrN2mHo43VSv6/Ligh54XtGHjBSYDTR90qcDYap22X5rOgZUDWHVlnWai9kcnkKNFytG0zmnMMrJVXb29T+a/0A8XQvYEhyg9loQFibtDmywgyPRtwbnDjtLJYxAn7Zx2iXhQcG2NXx2FMe5EPaAlEPaQSwMO+K2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139608; c=relaxed/simple;
	bh=2napi+fOT3h7MJZDPgiIhPBe22fAMuaFdgmet2FOvoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtN78zIqJTHMZm6dAYMAMMc3xOVb3dnc8sHkF4BeC2IxED90YncAp9PCJfZsgS1n9YAWQPURc9RIWlEZYCOZY2QGg/apfYGbJzIx9VNoZQ5y9Dp/3wNPuMF0DW+mH/PXQYpkke2zI9m6RVL5w7CRE6iEdGUaRlqCvNeGlXnjlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=cPsT5ZcH; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="cPsT5ZcH"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 694IjpYK4062391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 4 Oct 2026 20:45:51 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 694IjpYK4062391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1791139553;
	bh=9HrLouAe+9dAbXUMKxgFdSHX5a0LnpsaBifZX7zcJOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPsT5ZcHW36/chAnpDmGiHAT7yG5g4jxV+GDs+8iYhqbX/hH1mXRwGzbJn2+EIHQ7
	 Fz2NyGs083JF/pboieVHuv1Pepeg2TbjhAJD/ine52TroiGHRt4Qy9ptLk25AyPUXl
	 HHjM/gi/1u0lkd4L6jrlbCLw8KAEpyjx9kk+JGlU=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 694Ijool022808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 4 Oct 2026 20:45:50 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 694IjmMx2331923
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 4 Oct 2026 20:45:50 +0200
Date: Sun, 4 Oct 2026 20:45:48 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Borislav Petkov <bp@alien8.de>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        david@kernel.org, Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>, Rik van Riel <riel@surriel.com>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <asKe3M5VRvMvdY7s@pcnci.linuxbox.cz>
References: <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
 <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <20261002220248.GJasAqCFwxOK4l2TbS@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002220248.GJasAqCFwxOK4l2TbS@fat_crate.local>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

On Fri, Oct 02, 2026 at 03:02:48PM -0700, Borislav Petkov wrote:
> On Fri, Oct 02, 2026 at 04:55:39PM +0200, Nikola Ciprich wrote:
> > I'll leave it running for few hours, and report back. If I'm able to reproduce,
> > I'll try recommended workarounds and report as well.
> 
> I'll venture a guess here and say that Matt's reproducer won't trigger on your
> machines.

and you're right :(

> 
> Just to rule out any other issues which got fixed in the meantime, can you try
> mainline Linux and see if you can reproduce your observation with it?
that'll be very complicated in production.. it'd help a lot if we could reproduce
it in lab again..

I guess we'll add more windows guests and more load in them and see if we can reproduce
it in lab..

> 
> If so, you could share your crash core along with debug kernels yadda yadda so
> that I can poke at it.
> 
> And before you do, make sure you have the latest BIOS and microcode installed on
> that machine.
> 
> Also, where can I find full dmesg and /proc/cpuinfo from those machines which
> trigger this?

I'll gather it all and put it on storage to download tomorrow.

cheers

nik


> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
