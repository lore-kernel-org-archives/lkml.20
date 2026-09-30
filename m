Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867B2F7EE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759272; cv=none; b=MaGPmbiiCuLj1AsP7xAInUMsWHXhkdHrllAZKQqkRQdjifdAa00oQQvOCRrrFFUXyeP5+PSIE/J9aHnnhzjAjoJyetLKk4BBrK4ExMbQy8mjg7THYp39GU6Yr5l8m3qFhBYZCC0javMoPhISimOUvuBREitS3M/zy/SbZ0cTWOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759272; c=relaxed/simple;
	bh=rsvz41YEH/JaemNzi2jV2AGQCeCOduA17FkfpU1Sxy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4dg6eoabJ2aN9zn8UPzH1uMQl+gLikJWyIGLMkX3eyIheModZ9Pe2fGrTZOu+K/TQaXUayT42EuPpDL6/JPxzUG0rMwogZoJlQsRYWn4deGirihJNIsPkf+BadZW8NDQ25BjL1D21caqfO5G3LiHnMat/FlCsHxacsCU9Srpeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8fv3xtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8fv3xtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD7E1F000FF;
	Wed, 30 Sep 2026 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790759271;
	bh=rsvz41YEH/JaemNzi2jV2AGQCeCOduA17FkfpU1Sxy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H8fv3xtDT7tjw5iv3k/GNuPafrfnFiiOAqetDtbjGxVhpFHySLhIR8+Bf1Xpo3KFX
	 22Usof6ZP7wLrZx+h4OcXK4sWw93jX+EixGG9zzXiUmmBJ/HwjYgefshaG38HcFgjm
	 RfsUaD8sC5Jch6+TKj84bojgo2iOA7C8RPDvEdnY2BjZvs1w0wZt6l3Uw5YFpVEccP
	 JZwhV8ym1Kuscx2J+5NaTxd/xf5/mGKbtzOsvx02hMmoVht148UtFeuc3pt5wj3ubF
	 oT/LC49IKNvKTfdmCRDVqmdVLefzHW8g80ktCT38wjGT3FHPkLQhQoHf+RaNSUdvXD
	 D6A+dETil113Q==
Date: Wed, 30 Sep 2026 10:07:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, 
	Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <arzRBv9ceJsxJppI@gremlin>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
 <arZHp8hjYFXE8Rkt@gremlin>
 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arwNebjYXyGqrp32@pcnci.linuxbox.cz>

On Tue, Sep 29, 2026 at 09:11:53PM +0200, Nikola Ciprich wrote:

> so he reverted back to 6.18.15
>
> then he got crash of another node (to which he was migrating VMs from the first updated node), that one
> was still running 6.18.15
>
> pretty unfortunate planned work outcome :-/
>
> but it confirms that both 6.18.15 and unfortunately also 6.18.54 are affected

Yeah 6.18.15 is expected, I'd not say reverting is really worthwhile honestly,
given what you've observed previously.

Maybe worth checking if commit 26505e1b5b54 ("KVM: SVM: make svm_flush_tlb_gva
do a full asid flush if NPT enabled") helps in that case?

--
Cheers, Lorenzo
