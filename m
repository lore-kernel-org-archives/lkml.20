Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034437DAD7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075454; cv=none; b=D5dZe48DxIrj4P/d3VMMhxQul+bSWZaVD5mCH+MLG8s87HmhlX5l/cMVYcDn8XPpPsj7b3YnfyxCi98DQKJEYIWprudeemt4SVOTRUgiBb0oI1lzPEyVOlORj/FDYO5meMOKO5bfPcf6pKtxi4QorTd5SMbD4DOOJxrX+ycGcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075454; c=relaxed/simple;
	bh=SxULDFHQExRoaZaA91Mvz7jczBC27pGAe4U8ZGv31i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2gku8GcQXwYHvVKXhu8Njuslnc8naWRJerRPJZz24Ro7Gx0nyUicvWhjNzLfHCor6cHepg2QM1oIuPQcv8YS0fwOKQJ8qWZSnh8eo0p1SDrAYi+je9hFxMEjtuxcSorrefykDbnT02fqAjsMHNH1kkh9pTKlqDzzwURWS7aLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=CaRBBYhi; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="CaRBBYhi"
Received: from macsyma.thunk.org (pool-173-48-111-204.bstnma.fios.verizon.net [173.48.111.204])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69FEhoZ5027680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 10:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792075434; bh=VTrpwagnDlVO1pJaN3WC0qRUhUxJdf/xBhEK8KAUPm8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=CaRBBYhix5ZI6Pqirm+LkW2jz418n8YfzEHkGp3t6jIM1cRRQ/cxIWNosYW9K+znA
	 SdJO5PHmQPpvu5yzgoOLwBGUcdbb7EvttKyknVaTBznroB7yhZkIVMp5u6HnMUtS/n
	 8Hoe+N56PnZ4EDrCs9/YnJS2/wd2IzxlWhTiyiFw+F0feN3TXzYCkS5CgbWjpTIdNM
	 QE38PUhFD+s75KeFD6zaVck7K3rWynSpYgWnM39Nt1+8qBDCMQ9sBFV2QA3CmzL9sF
	 htjWrx1McQOihI+jlNAo3GGKsNEOIgUlR+h1eBQr7+l8hOXe4iCrjyHZaLGJeY082S
	 EOJNx55zjwnlg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 23B5720F90B5; Thu, 15 Oct 2026 10:42:50 -0400 (EDT)
Date: Thu, 15 Oct 2026 10:42:50 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org,
        ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <atDlfUEr-d_sRP7c@mit.edu>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
 <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
 <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net>
 <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>

On Thu, Oct 15, 2026 at 04:05:56PM -0500, Miguel Ojeda wrote:
> 
> I think it would work fine in practice. But it means that we have to
> split every "skill" into two files (and reformat when we may want to
> move details from one to the other), unless I am missing something.
> 
> So if we keep the files rendered and so on (possibly in
> `Documentation/`), and make use of `.rst` features etc., then I think
> it is worth doing it. If not, i.e. if we just use it as a place to
> "dump text", then I think Markdown may be simpler.

I'm a bit confused why people are assuming that we would need to have
copies of the same or similar content in Documentation/ and agents/.
For agents are are *doing* somethiing --- for example, determining the
correct commit for a Fixes: tag is not something I'd think would be relevant for Documentations.

We dould just as easily say that there is a duplication between
src/linux/ext4/scripts/checkpatch.pl and
Documentation/process/submitting-patches.rst.  Which perhaps there is
some, but is it really that big of a deal?

	      	     	       	    - Ted
