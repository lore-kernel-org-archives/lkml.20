Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921884;
	b=XBZ/O7BA/VAy1VdzUT3m1c4UaP9F3Itr1VG1KnGa8RbnjhtKFwqePqxI91l9NYPU2Yx6
	 BiZNWlpkzf1fdYazzo8NFlg319XEA9l5H1Lsn75nzJE4ja3HBdVRxw+g5DqwBdA+cFUMQ
	 +vnRZC5YSBgg2/GHEfNKGz7zmPI7uC6DrE2e8oq+zON7WsZ6uD/LeEK7oB5v4UITvrs46
	 E7DOoMgJO6VJjU/W9dn9vG1uAt56UUhdIL5BnxOs6Agsr4iNnsEzrVcSFf1EIzqvKeXvi
	 HVX6paN2o2qzSxpwbIBRVAmTo1jCDRDg9TUpGmQxnHGOEcyzONnfns7geGMJE1T3C/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921884;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PuWu8Pm15IrXuWHHBFhE92oomo9FtSDSqEAOCB4fyN4=;
	b=yvgYbAftytxVlzeoF1RIhjaFuqXxLlZ7lTt/yFcOFsDZeh1/eI7sFZm/Fn4dAQ4I+KZB
	 GuUPeRVhkYz9jACo8ox6kEOp5OgyCOETj9VCj7rRE3QBtVaxHOhw0hLb5t60W5+O/TLvL
	 Cb+nlOBIS960UkC/lutStRRtA2FKFzxsJkK5nGMWFJA61+oNgPYx7h253xb+vzhvZB7W/
	 BLBnMTTyN8iWlx44PjQil9iHac3JF/eDz0yIvHuGYWXyHVBRGRHF6/Lo15q/NRNrqHlFl
	 /A0eFVMN0d2bCPNMV7KOSKfJhhZF1FTz6y8+IT7NHxFjruJtMDj7R2VzBAwkQrUHCjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZ0fKC2A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB2606A33D;
	Tue, 17 Nov 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZ0fKC2A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FE41F00925;
	Tue, 17 Nov 2026 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921883;
	bh=PuWu8Pm15IrXuWHHBFhE92oomo9FtSDSqEAOCB4fyN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZ0fKC2A7YO05zeb8z6e52nLDzVzza/JgCWsCH+VXWh1b4BI56qCrFJB0H1scJuzf
	 W4/Tphx4YHcJn/u+/K+YjEMxs00mQatSoSkOmKj9xtUjf4M75ogtvGEtnI+AUGq7TG
	 yV1kiA4rFUcvDumRKHB37/iDk7BKNlDtVjNGEOnPfXngOjd44SbowIEzsjXnN/07oH
	 GZSCLaH/YZOnQWuG+TEQWJdmdVEcxV9XZe1IJ9F2l7ZQQss3Im0c8YypeSE+Gw8ng+
	 D+W5VqaqKiUCe6ghWfz/Z+SHVxCroU3uKpxZ716YwgCa2RuOfLGTU5C4lZzxiN3NSH
	 iQow4Au1ybciw==
Date: Tue, 17 Nov 2026 15:24:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the kexec tree with the mm tree
Message-ID: <avxVlNG_ZYLetc98@kernel.org>
References: <avtYxJJhIzPVDYVv@sirena.org.uk>
 <20261116114201.71afd94ec31717433939e1fe@linux-foundation.org>
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
In-Reply-To: <20261116114201.71afd94ec31717433939e1fe@linux-foundation.org>

On Mon, Nov 16, 2026 at 11:42:01AM -0800, Andrew Morton wrote:
> On Mon, 16 Nov 2026 19:25:56 +0000 Mark Brown <broonie@kernel.org> wrote:
> 
> > Today's linux-next merge of the kexec tree got a conflict in:
> > 
> >   kernel/crash_reserve.c
> > 
> > between commit:
> > 
> >   ed27d3cb114dd ("mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory")
> > 
> > from the mm tree and commit:
> > 
> >   941aef93e9e1d ("kdump: Give crashkernel CMA areas unique names")
> > 
> > from the kexec tree.
> 
> OK, thanks.  I'll send Usama's "mm/hugetlb: allow crashkernel to reuse
> hugetlb CMA memory" to kexec people then I shall forget all about it ;)

Right, until the next conflict :)

-- 
Sincerely yours,
Mike.
