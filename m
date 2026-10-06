Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303D2BCF46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291359; cv=none; b=dbuKrDMVBkUR8faQG81EmcjV2RgJRFu15LT/ATmCGrx6aBKT6KD4pWruBjzA/MhB6SfyEtPs10DzKNsNjswPI9xYKFkHRZnnP8d6t5MOYZPfScsIsjCsPBeST2QpghVqb0wOirKTukWdoKDHWf7SJttFoLfWSWQevpub1g4B3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291359; c=relaxed/simple;
	bh=7M3N5zc6rouo/kMPltraL1q8cdAqQbFSDbKggtIuJG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SheDY4a8f0sJzK6HXqWq2dGpl5sAvLueh+gRQjT0CUOmRQickQurqaxuefqQ6ANnBpOBwt78QvBjK6a8ff6k1MGxeoA/2bepi7tUEwHVrWycxC3Q7UBlniGl5cwYV8saZM9DJO3vfv40s+LFelYvZ8zDUJG0kTFBY5+JCAIu5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPsqiguG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPsqiguG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso67988766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791291356; x=1791896156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TwTX2vFVLwqe414XJoJKYPBRR3bUAEgGjQ357/htVY8=;
        b=HPsqiguGltOqVl2Yuxek2y/GcSHRwT5V8J5log+kYAGnMzvj8dj9S/mn6Uk7DkxxDq
         2sidZC8tjj5SZT8O+4C1d2XKri0+j5jjLtk6x7d3hIDJX0D+eTDbsy90djbzhBeUU6dq
         Z/6zpxHjkwCF3/SvCocs851u+glgB2kxRhh3d4TwUmgPt5Uq9r7eXWtiUis1Mw3siRj+
         mSmCe/Aln/hGJz9rgqkskfy/sxdbxF0H+hJlhYHJlnv+bhb3UChMPzHbVvA/6qk39PV8
         GuGdzUDzdCni8f2+ByJxxwfgvx/EzLqiVGfp0GTVJsBnEhhyN21QsWZlF0/l0rNVA9EV
         coPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291356; x=1791896156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwTX2vFVLwqe414XJoJKYPBRR3bUAEgGjQ357/htVY8=;
        b=jlEG7FXdN2KkBXMOseUdzpglZVF1T5iPSeFvCa5NVIk8wvYVpr1H9VqDkk0fq9smsn
         5G5Spgz5pOxTgUhzK9MyV4YzE51Utd2N/iq2fx0gAe2Ew0F+r2D/gnYWdYyb013to2pX
         AL+ivZNUl/PnjwgWnpZzkvSyuV1Ho0DyjqGDy5c2vfqbPheObbRI0Xi0IhH1hpuGo2aN
         iPqs1ah/P8VcxJsMHctFE4HztRagNzyaTs1fUK6kuwFReVmnlyB5JshDpDq7fm83tDad
         Ii7VUnRyBdOXldn5la4e++YHDwhyKs0+eT1s487UkchMlXY7xdhVZTCFvqLw7+1nZmyf
         r1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxKO3zo7MTeM0jt3nUXcCpcRJKLmoPIfQF/OoYLYusSGS4ptWd+ImWJWgfl4Q9DzpAZNG/MBOJ/OYirw4w=@vger.kernel.org
X-Gm-Message-State: AFuF++m7723YgezrUVlimSKIjAl+UYMro3pGFM1bBvd6RybG3CfI9cVC
	hSYXjbbN3149aCdIepKrbKf07fv8lAoFTMTncl31sNnjGaSKbhqA2N+I
X-Gm-Gg: AYBFou2oxLffmDNT7jqm1ctARnO4uy0dInGsApr8YdW231BPgAczi5urCzte7yTF2rh
	pKXOqsBwPJs2Nwb4C9lXgWnJrxTsyM/tTzYTcXem/Vmi93YNOaf9mOAbjtWxCszZBJ4MZQ1G0vy
	jMia3dJ95MDPNZdtl+Ox2jJqR9888vFtQelDYvrNesSaFdBKFJZIh2AEckKeWReDgVahWmZ0Wgi
	bKcVj5KKTCyMVEXG+4+zoSEECFbgu0SO0EjOrXPW623ogApTKDUGFTUaYWOXFumzRgz91Ek7JTA
	mDqkESpT5lXYIKf7O8lHLffQ21MvpmXsYCIhAwW/fjGdgjm5EV69kCd9+Sj0JBVVEzj7WIo1gw5
	WEb+kDxI/DmfPKEG+3nriUdmKkJowUK03ye4hjFPWHGFWyIS6gBmTaORfTd54xgVocCPOb/aGzH
	gahPfUlUKbcX+upzntbYIbNY0yu1r+rwI8PhBAK9BmsfqYl/MzV0EmUZHbcf/NMX7l8OVjRyOhK
	Nvif2rqrK2EkNl4z+Fz8DdRUeJiyBDwKTP3Vjvr0PBcE6tB2rwd3iBiMa2ujGfWcZWpPRStFrSq
	IYaQ8Bn2tcjJyKaS91QSZUBvSqibLonjmozjyHRAZsyTIY8HCmp74nA=
X-Received: by 2002:a17:907:97c5:b0:c2e:3e3f:e201 with SMTP id a640c23a62f3a-c3169f85d89mr129066966b.11.1791291355731;
        Tue, 06 Oct 2026 05:55:55 -0700 (PDT)
Received: from XPS-17-9720 (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156339a6dsm200709666b.67.2026.10.06.05.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:55:54 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:55:51 -0600
From: Jonathan Gopel <jgopel@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Do not RPM complete unrelated subtrees
 on unplug
Message-ID: <asTvmqoWBBCCA26h@XPS-17-9720>
References: <20261004120255.GI176164@black.igk.intel.com>
 <20261004171404.448474-1-jgopel@gmail.com>
 <20261005113822.GL176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005113822.GL176164@black.igk.intel.com>

On Mon, Oct 05, 2026 at 01:38:22PM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Sun, Oct 04, 2026 at 11:13:50AM -0600, Jonathan Gopel wrote:
> > When a Thunderbolt device is unplugged, that switch and every switch
> > subsequent to it on the bus device list is `complete()`d, not just its
> > child devices. In the case of multiple domains, it may cause, eg, an
> > attempt to `complete()` the uninitialized domain 1 root switch RPM
> > completion on unplug of a switch from domain 0 (though ordering is not
> > guaranteed numerically sorted).
> > 
> > I initially noticed this issue on a Dell XPS9720 when the system would
> > seem to sporadically not wake after unplugging a Thunderbolt dock. I
> > tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
> > that resolved the issue, but the issue persisted. Eventually I found
> > that I could consistently generate a kernel Oops reporting a page fault
> > at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
> > bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
> > ultimately ended up changing. To confirm this issue, I did an eBPF trace
> > of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
> > unplugging in a variety of situations and found that an unplug from
> > domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
> > completion is not initialized and thus is holding a null wait-list
> > pointer, triggering the page fault.
> > 
> > Here are the key sections of that eBPF trace. Note that HEAD denotes the
> > completion's own wait-list HEAD:
> > 
> > ```
> > RESCAN_ENTER domain=0
> > 
> > COMPLETE rescan_domain=0 target=0-1 target_domain=0
> >          route=0x1 parent=0-0 unplugged=1
> > COMPLETION done=0 head=HEAD next=HEAD prev=HEAD
> > 
> > BUS_WALK domain=0 start=0-1 callback=complete_rpm
> > CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1
> > 
> > COMPLETE rescan_domain=0 target=1-0 target_domain=1
> >          route=0x0 parent=domain1 unplugged=0
> > COMPLETION done=0 head=HEAD next=0 prev=0
> > 
> >         complete+5
> >         complete_rpm+43
> >         bus_for_each_dev+133
> >         icm_free_unplugged_children+250
> >         icm_rescan_work+42
> > ```
> > 
> > This patch gates the `complete()` on an additional condition - that the
> > Thunderbolt domain matches the domain of the device that was unplugged.
> > 
> > I only have a single system with multiple Thunderbolt domains - the Dell
> > XPS9720. I am consistently able to reproduce the Oops on that system.
> > Since running with this patch, I have not seen the Oops reoccur. I have
> > also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> > well with it, but it only has a single Thunderbolt domain, so it does
> > not exercise the multi-domain failure case.
> > 
> > Assisted by: LLM
> > Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
> 
> I dropped the Assisted-by per your previous email, did a couple of small
> cosmetic changes to the patch, added Fixes and stable tags and applied to
> thunderbolt.git/fixes, thanks!

Thank you so much for your help! It was very much appreciated!
