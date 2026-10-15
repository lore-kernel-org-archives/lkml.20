Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59314EBAE1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055707; cv=none; b=XRbjlETroo7mo9SbIJl4wQmeWeka2ZvwPdiCfgU0Ihvxc8/AIk80+BddhAAysU9C6PQJbXTPNx6XB5IN5h43vNeK9FqWGBPvx0/BkATCQ42QqhifVQRadAxLQ/o1nbuHOmE2jo7+GonRXCqPfvOaOzo5JhciXzBRFJ93eKlp18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055707; c=relaxed/simple;
	bh=eQpDRHFZ3AEK6TRcOhxVRys8ayMj+mkL4cDbVlYOAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ery6qxm22kSfMYX0dLHM5uJxMxVwM8HueC5GGBqvxFzVvt2MuSskLEp5i97MJ/VnsNHRIbnZCe/IustFQqlkEDY2i4Pvfhv1PtfTfdlZBKL7vnKsxeHKX7Ylb794s/LCsSy8cY3mckp+aKDzTpH2X88NFmDL8vQ87+ascyGjtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=SbjwgFlr; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="SbjwgFlr"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69F9ETpt679695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 Oct 2026 11:14:30 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69F9ETpt679695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1792055671;
	bh=McdUAvh5NY74wejVvsrsL2dv3zhZUPLBMc+Rqofd0fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbjwgFlrB/HFvPgvt1Z37zZvYBJutnz5+Cj3SJVpRUyznUx+JPtLoUA6cbc87dFJM
	 FRIl8p9AAB0st1WbEzg1xi6ENWl3FjaSnkGi1QPDIZKET+cyrrKkkS72KxZY4KHLPN
	 dKOVbcM7xvb2wuabcn7zWrys9/gyikLO23YXMvpA=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69F9ET7c003597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 Oct 2026 11:14:29 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69F9ERRU2934612
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 11:14:29 +0200
Date: Thu, 15 Oct 2026 11:14:27 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Borislav Petkov <bp@alien8.de>
Cc: David Laight <david.laight.linux@gmail.com>,
        Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        david@kernel.org, Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <atCZc+XB1eWWR02x@pcnci.linuxbox.cz>
References: <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

> Did it reproduce usually with this?
yes, we got most of the problems (crashes / corrupted libraries)
during / after VM migration, so it seems to be the best trigger
so far

> If not, keep hammering on it with the latest kernel. We might've fixed
> whatever that was, along the way. :-(
yup, it's still migrating, it's been another 3 days since upgrade to 7.3-rc7,
another 107 cycles (of ~160 VMs, some of them pretty large), still no problem.
it starts to look rock solid to me.

> 
> And if so, that would be a damn nasty bisection to figure out what fixed it...
> 
> So pls hammer on it as long as possible to see if it is really fixed or it is
> simply harder to repro.

it doesn't seem to affect users in any way, so I'll just keep it running
and report if I get some issue

BR

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
