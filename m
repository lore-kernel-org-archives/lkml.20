Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427924;
	b=g6+2s72/LffrKi0zrngBWO1VGqRKW9y1tkymjyTVI+1XCl8KB29LEyy09+aOxgNCon7W
	 vW7u9s2tj8ZcgHzr1gqtDxKT/8IzdmkcmoH9RJ4aAmRH0v14DN027ya9fjIEDujSBlC7v
	 EA5SEPXgEgHWNLi86gOP5abIC7vCA17J/4FTvinOGmROW65YGF64yv3XgmrOxSP/ffG0/
	 cCU4NzDZEFBP2SrIM6vJdxuZ0pru9IjPpua7hfE7EaWwRDursGnrh1/7MMKApAZEyvlEN
	 HiIhcyCsSeJn5TnX6+Fi+AO6+Y9hL7B8zNfoBTXrInzTNydfPoHzCemM+br+ZHPOJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427924;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=782DsQAc3PyqP86rwUshH6wFfstxk+d0IqNd3tGjmLM=;
	b=FLimXclqiMmoeC78AWwVlItNriy0dSG2dM2ZgrbL76rrVpGPk4xf95aeTCQ58tzbrnr3
	 nLqXIsMSbi2Bgjja8tn9giWF6xm5OxJT4ZvsgR4yMyWCgcoMQAIp+b1SeI3Qa/CO/D248
	 VFhs2p/vRAyPThLzqR1Sw2B3NSQeInUtf4dS8AwuyIjmsiSRE+A8Tf91B7Gcj9MiCODiT
	 LBmPPZz8wMilTECOgZUj8KVIFPkxWuu13k60sAmT705GDMPqnHVxP1PtWkfSy2NRrcmNi
	 upaTdMj/OCYWQrujoCP2lV+WqA1Z7ZlsCHAmfgucae+R0ghpbsTtZ+ask8YGh4n3MXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBRYFQz5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE32606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBRYFQz5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1041F000C4;
	Mon, 19 Oct 2026 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792427923;
	bh=782DsQAc3PyqP86rwUshH6wFfstxk+d0IqNd3tGjmLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QBRYFQz5RTCmVbvuVbgrR2TdBhZPz21zHiCpfBbQ/2P+18ztTuSIwWEN7fYxYK7Go
	 2r0/1F5w1jdvDFBaJfn2Idama23UR+CceHtAKtV4lhy2qc6XE6yaDx4s223npvokb3
	 ceYc6aYzP8nV1pVgNqT+RCPhpX9Z3jYTUOj/S9ee2rlIBT1MlWAQH2D0RQhTNzhU5L
	 nE+30paIAZr30qyAzEFaiIIsVNhvuC/GjPL9diq/bHKKumMlblrLS2+yfe8ve6qbl1
	 jTbHjnWViWqsQJGDf1hyuA99Ky2aDigW+SDvSSihAfC849JCTGlMaRhiyT7rgSuObU
	 q+vmqhOBgSofA==
Date: Mon, 19 Oct 2026 17:38:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, 
	Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, 
	David Laight <david.laight.linux@gmail.com>, Rik van Riel <riel@surriel.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, 
	Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, pbonzini@redhat.com, 
	Tal Zussman <tz2294@columbia.edu>, Matt Fleming <matt@readmodwrite.com>, 
	Yosry Ahmed <yosry@kernel.org>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <atZHdYrihStO5iFc@gremlin>
References: <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
 <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
 <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
 <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>

On Mon, Oct 19, 2026 at 08:35:29AM -0700, Andrew Morton wrote:
> On Mon, 19 Oct 2026 17:22:37 +0200 Nikola Ciprich <nikola.ciprich@linuxbox.cz> wrote:
>
> > >
> > > Sure! And I have more good news: after applying 55780d8a1dcc
> > > to 6.18.56, I was able to perform more than 30 migrations without
> > > a glitch. After booting back into 6.18.56 without it, both VMs
> > > crashed within 2-3 migrations. Furthermore, some memory apparently
> > > got corrupted on one of the hosts, since various commands started
> > > crashing too:
> > >
> > > [  303.466091] traps: systemd-logind[3085] trap invalid opcode ip:7f7b5667e616 sp:7ffe1afdec38 error:0 in libsystemd-shared-252.so[7e616,7f7b5666d000+22e000]
> > > [  303.493810] traps: systemd-coredum[11269] trap invalid opcode ip:7fc6bf67f614 sp:7ffc075da958 error:0 in libsystemd-shared-252.so[7f614,7fc6bf66d000+22e000]
> > > [  377.528955] traps: systemd[5607] trap invalid opcode ip:7f791447e616 sp:7ffe83e61cf8 error:0 in libsystemd-shared-252.so[7e616,7f791446d000+22e000]
> > > [  377.556993] traps: systemd-coredum[12080] trap invalid opcode ip:7f97ce07f614 sp:7ffe28b56a88 error:0 in libsystemd-shared-252.so[7f614,7f97ce06d000+22e000]
> > > [ 3746.173043] traps: hostnamectl[45846] trap invalid opcode ip:7fe00cc7f614 sp:7fff89916e48 error:0 in libsystemd-shared-252.so[7f614,7fe00cc6d000+22e000]
> > > [ 3746.202305] traps: systemd-coredum[45847] trap invalid opcode ip:7f7fe9e7f614 sp:7ffea227cfa8 error:0 in libsystemd-shared-252.so[7f614,7f7fe9e6d000+22e000]
> > > [ 3750.581940] traps: systemctl[45903] trap invalid opcode ip:7fbb8967f614 sp:7fff733e5748 error:0 in libsystemd-shared-252.so[7f614,7fbb8966d000+22e000]
> > > [ 3750.612651] traps: systemd-coredum[45904] trap invalid opcode ip:7f90d347f614 sp:7ffdc7f55148 error:0 in libsystemd-shared-252.so[7f614,7f90d346d000+22e000]
> > >
> > > I'm not sure if this is of any use, but I collected a vmcore of
> > > this state by intentionally crashing the host via /proc/sysrq-trigger.
> > >
> > > Anyway, I'll give 55780d8a1dcc some more migration rounds, but it looks
> > > promising.
> >
> > 500+ migrations back and forth, no issues. I consider this solved and am rolling
> > out the patched kernel; I’ll report if anything new turns up.
>
> Great, thanks.
>
> oops, we haven't been cc'ing Yosry.
>
> > Definitely a -stable candidate. Andrew, will you send it to Greg, or shall I?
>
> I volunteer Yosry or Sean ;)
>
> I think 55780d8a1dcc should be repackaged before sending over to the
> -stable people.  Its changelog is very wrong: "The bug is benign
> though".  Update the changelog to explain that the bug is in fact evil.
> Otherwise -stable and further downstream won't understand why we sent
> it to them and won't understand the impact.
>
> And that repackaging would be an opportunity to add
> Reported-by:/Closes:/Tested-by: you, which is the least we can do to
> thank you for all this diligent work!
>

Very happy to see this tracked down :) thanks to everybody else who got stuck in
after me!

--
Cheers, Lorenzo
