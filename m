Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3A3EFFC5;
	Fri,  2 Oct 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922494; cv=none; b=aYb+ZEs0EoBf3e/KyT4Ie+nals/1sD2W2ChyLnNctmBoECZqzovpPIvfd/6qbCgGfWEg6juff6nlIlPuThxVOFb//c924y4dA2vAul4dx/C6+v87gPZW/wyp0IqILDU2xbb/Z0/lKFPfUUDfzjZtAaY1V/jHNiANOclNZIMTggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922494; c=relaxed/simple;
	bh=l7DdZcXo2XUDi89hOJZKJP6dbuZN9DT/SwqjspGHQ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXTXn7Xxf4E4jPlzrVCLlUWNiGxvzcFdtqFgSeGvNeXvOMHCpY4KFZqZ/BgVKo7riHGNSST77f7Obg2MKSwN2EYApbnWDLgt9IEtEc6W61KKMy9E85ewjTKKJEF/Vg4dDT1GnCO8AR8zZTuzgN+ObgI/6cODSHKqgNTbeekp/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alaQi1ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alaQi1ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205F11F000FF;
	Fri,  2 Oct 2026 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790922492;
	bh=TxG2icuKwMxsSbwMpgzXbk4BcAs2bbEkf8Pjd8/udvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=alaQi1olmM8ItEJqTPOJP4hVdlElklbwp0eH4r/SlgwrmTlHijVns9vo7lN43VDMe
	 98rBOc5THvlp+bS9pcW5O2gOqULmlUvGA/6ygPNfRrSQqYGbHQnmXNmP/Y5bb5vVnm
	 sTSqoC8RRiOU+X+YgElv4hvVBoK3EKnzjzmZZ80bZsyWrYH/bnJiPPapgF7LgKNA+x
	 FWXBMRe0vV+8B/Alcr3AqAawBszih0TiH+d0Zt5gBAZ8Jxlk0Nd1ExRck9IlPbbyaZ
	 BGgZNK1//bA8La3UMXTj9xmi7d+f3abq1IYg3wH1dGlOjxDoR3r03TXvbAxT2W3Ein
	 5uEr3lfZO63Dg==
Date: Fri, 2 Oct 2026 08:28:03 +0200
From: Greg Kroah-Hartman <gregkh@kernel.org>
To: Daniel Vacek <neelx@suse.com>
Cc: cve@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2026-97415: btrfs: tree-checker: validate names in ROOT_REF
 and ROOT_BACKREF
Message-ID: <2026100249-renewal-chewy-6d09@gregkh>
References: <CAPjX3FfJCH-JnjYTzSTB+6z3KfW77EExH+nXBT7F7ayZe+Odqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPjX3FfJCH-JnjYTzSTB+6z3KfW77EExH+nXBT7F7ayZe+Odqg@mail.gmail.com>

On Wed, Sep 30, 2026 at 09:32:00AM +0200, Daniel Vacek wrote:
> Hi Greg,
> 
> > Description
> > ===========
> >
> > In the Linux kernel, the following vulnerability has been resolved:
> >
> > btrfs: tree-checker: validate names in ROOT_REF and ROOT_BACKREF
> >
> > ROOT_REF and ROOT_BACKREF items contain a struct btrfs_root_ref followed
> > by the subvolume name. Several readers assume that this layout is already
> > valid and then use the on-disk name length directly. A corrupted item can
> > therefore make those readers address bytes outside the item, and
> > BTRFS_IOC_GET_SUBVOL_INFO can copy too many bytes into its fixed-size UAPI
> > name buffer.
> >
> > Validate ROOT_REF and ROOT_BACKREF items in tree-checker before any reader
> > uses them. Reject records that do not contain a non-empty name, whose
> > name_len does not exactly describe the remaining item payload, or whose
> > name exceeds BTRFS_NAME_LEN.
> >
> > For BTRFS_IOC_GET_SUBVOL_INFO, copy only the validated on-disk name_len
> > instead of deriving the copy length from the item size. The ioctl result is
> > zeroed when allocated. That leaves the existing trailing zero byte
> > untouched.
> >
> > The Linux kernel CVE team has assigned CVE-2026-97415 to this issue.
> >
> >
> > Severity
> > ========
> >
> >   CVSS v3.1: 7.8 HIGH
> >   Vector:    CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H
> >
> >
> > Affected and fixed versions
> > ===========================
> >
> >         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 6.12.111 with commit 9154542070ca7eadb3c764a882f39a127677854b
> >         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 6.18.53 with commit 74f577c722c99248d804eca18e7de7c5e47549d7
> >         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 7.2 with commit 0af37c217edf15fa21dac1c40822086df356c6bb
> 
> I believe this is inaccurate and the issue was in fact introduced in
> v4.18 with commit b64ec075bded2 ("btrfs: Add unprivileged ioctl which
> returns subvolume information")

Thanks for the review, I'll go fix up the record to reflect this.

greg k-h
