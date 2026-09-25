Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E0328243
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310399; cv=none; b=YsB4gpib+sSKQ6zKS4caCrSa9iO+XdAWF4LtVNy9J8wjLZd7f31J1bu/Cn2P5bMXsfK/I9M/FqPxtbFBNsj9XLDndNXli3hbdu00FuWyviVBnBnFNB8Mxz7DP7StU6ozfGa+IYos3zwFYlKdt9wEVS0HRKhgzpl0cbe5AeTpIeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310399; c=relaxed/simple;
	bh=vTVnsFHi33mKzHxrGwVxs+FLhFe/ItxIns9KWPIkoaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMFOramQYY3AUFMWNAQ0vGjRpB36/7ScR+r21I1Ut+RQLFDPnKANMDeMVI9sEIhL7T5NlKlMMWVULTB5mx56B8Elfl9FYGzc52B0nydTj1a/QqEWSoRuvYgf+bVRLbj7xG5IH0sw1/wHPWkR6l8+BCazWD7B6nMlSWLxdRAch1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ggj2MpzZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ggj2MpzZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA49340E021A;
	Fri, 25 Sep 2026 04:26:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LUCJMrBFnGow; Fri, 25 Sep 2026 04:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790310386; bh=Er77sK8JNES8ATomcjAqegFp4wapOXQn1wFhZr1PS/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggj2MpzZLhKYK7dOsM0wOoMiKXnr6clEK7bfMY8HRVpMqL9ZYpTFKPJeUSizaeDEl
	 gFfIWK2JvhwFaReI1Wx4Xq9EL9B5IBdNo73VKVK0J5dRaNxN/sMYESji/9WIMaGLFH
	 sAdwVNE5/PRC2MtdBkUjNhBQALAg/Ns82Cvx6pmtvOh17O6WneF9kVK/C62wBc1I07
	 6fbSBdU/8BUBPNIdaNqZYbmcvUZ9cRTitGzcXqxHVuenPslsbws0Ezu3FrReJxpbCQ
	 iNTcxos/5wxoybVejUBz8DxUzjeCWaH/gvxedxv7kQk3nXQ39KvZzoelC8Ated8tOL
	 SYJT9bc3bWz96HN+QWAP1Qw9BC0oZ0OENm9nGnyovFFKQ5tLJRfzpwtJVfircR9W6C
	 TKDn6M0d2MEfaYk2wh5hpp2+zKaP2cMECmOel2DMCAQcFV3lzOd/yfYfR9ZhZKgtM8
	 2+hhPJ4spg5bYSxyCa+o3g9Kop4Pn6YOqzoaLmFvx95/NBuemRVJfg4Rhqd3rdMa+V
	 rlOLvDfia6ho9xAtMA3zhtKL1iV0ocSQkS8MyYMvKcS6Nz+oHkEqdfTYm156pxRnVm
	 tFhTyS43P9Mg94/9P5CCpHshrCQbZEa7tLC4PSJ8cclyZAtTmVJXIPeE+zW34Deov8
	 H/P5fcNruEJj54cuyeGsvoWI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5CBBA40E00B9;
	Fri, 25 Sep 2026 04:26:15 +0000 (UTC)
Date: Thu, 24 Sep 2026 21:26:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Naveen N Rao <naveen@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 2/3] x86/apic: Introduce a variable to track
 the number of EILVT registers
Message-ID: <20260925042612.GCarX35LHhl65JavXf@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
 <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>
 <20260922053610.GBarITypxf7zPAB83g@fat_crate.local>
 <arUKzQZx77r49plq@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arUKzQZx77r49plq@blrnaveerao1>

On Thu, Sep 24, 2026 at 05:28:48PM +0530, Naveen N Rao wrote:
> Cause I didn't want to risk changing the current default EILVT register 
> count for some ~2 decade old processor that may be advertising 
> X86_FEATURE_EXTAPIC but encoding a count of zero in APIC_EFEAT.

Do you know of such a processor?

Because Christian gave you all regs count from K8 onwards and that's what we
support anyway. I don't care about K7 rust and older.

> Right, the split reflects how I viewed the changes, and to hopefully 
> simplify the review. Looks like I got the split wrong as it looks to 
> have been counter-productive here.

Right, just keep it simple and do a single patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
