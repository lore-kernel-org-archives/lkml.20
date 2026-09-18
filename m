Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712B2367D3;
	Fri, 18 Sep 2026 05:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789708347; cv=none; b=BYmPQxGSS2NpaObzsNFoBtcYP36oOpAucrE/dYn6jJA9b5BieX8xMGL3XVsfMS/mIZMW3gPEHdirLfjuM+40ue2r0CYS+ms+h8EuiUJQk4ioC9pIkP2d+R9YJMaVtPof33tDFA8C8zRKOuv1wQ9qbmOjYui6/HR4veCS2CVzXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789708347; c=relaxed/simple;
	bh=+9stds6fi3YUAZd8KraxcQo6KIbfCTF1SXxrekKTIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX2l/VpHG4y+wZijvdgXn9VIDzWtNlSAJBWG6nIAw83GQn3Mot6WQZ4aMkBu83FQUFmDSzjw0ia/aoyzMhPbA7nCRzVxH6k55g8OS3JUi/d3oYKRMBvKYLIpX0J95GeIOTZBknFDdi0CE9MOA6t21OrgKe10LhAHZrG3ucc6aEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKDOJa7c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKDOJa7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6571F000FF;
	Fri, 18 Sep 2026 05:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789708345;
	bh=MbnFx+C0ph+QSMBF6ejV32BsCA0zv/d9bamVCmaVGfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AKDOJa7c4OGc/gq+8MNF6UdM1Fpzq8IFSng7NBI+nJaMbux+61RiqFCXt+JCooU43
	 7doNhmPbbJcnkpHQCq6hkAORs5OKx9/JO8DQ32ebZFmiv5jtsrUCidtZ+V0Ym2ENvF
	 PdsgCWkf+fIkc2t1Sl7SD5Dytez2QXx5itHspdEP/bQxqQ0hFqwHwNHur6R6rsv4qR
	 B2v6mzLRSgqBur6H8rpFA9NtGrNWGLNGLkUEnBGRpSxdaBrYS5abzr6ZAHBvTLr2ld
	 +sn0DiEx6RJe3stfKEhww7z/31jq1dlNrsU6P9PB1GhmE6ULkFlRAri4F8+GOHofSb
	 uLIzecZdrcLUw==
Date: Fri, 18 Sep 2026 07:12:21 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin
 tree
Message-ID: <aqzINeKnw7kCQzxw@ryzen>
References: <aqxB2gIACLhW5I0-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqxB2gIACLhW5I0-@sirena.org.uk>

On Thu, Sep 17, 2026 at 08:39:06PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>   drivers/ata/libata-scsi.c
> 
> between commit:
> 
>   6d81700ad7c48 ("ata: libata-scsi: do not raise UA for storage element depopulation and restoration")
> 
> from the origin tree and commit:
> 
>   c44f095a9d176 ("scsi: ata: libata: Use combined sense codes")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Mark, thank you for the notice.

Martin, as Damien mentioned in the cover letter:
https://lore.kernel.org/linux-scsi/20260908090308.1085097-1-dlemoal@kernel.org/T/#mcf890a9a7d47f717b6362a76c8fb8760a58d7761

Perhaps you could either:
-Rebase scsi-staging on top of -rc2
or
-Merge in -rc2 to scsi-staging


Kind regards,
Niklas
