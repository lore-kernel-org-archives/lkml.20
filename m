Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F23E172D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420689; cv=none; b=tqPr5MUNdSM0PrA0xhs65vv6MKYVkfmAC+E/EiEREKKGWyWyA/X2IQwhfbwGB/93sxiljSwfImj/eOYU70pDcw3azngfsDXcGbFGT8lkq1gQl5J9Kn8wAp4dsJ5Uct9HIrQFOgVbnOwr9xWATyqOt4jK79lC6VCcdR9OwWZqjc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420689; c=relaxed/simple;
	bh=fzi92E9iSTmRienn4xGQS4GbEerM7Dagzr0A/BzaupE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecW8MBsX99xqVhwQ2yjlJUljRaamXprqoMGWFo4tjN+o9PQiKHizjgAGSePg6J8Rds8Ah4poySJTI8cWpFf3noKZUEX2soLBKGGRrQtKT+Mj4kggTepXo3DN9Edy8n7GGo4S9BO5tmqjOEnP6z3bJHZqdQk6eSgqt2r4HSys/EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=WSQxumCm; arc=none smtp.client-ip=95.215.58.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="WSQxumCm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fzi92E9iSTmRienn4xGQS4GbEerM7Dagzr0A/BzaupE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790420681; v=1; x=1791025481;
 b=WSQxumCmB/NWyiwvFKOgIG+7g0qdatp2weMR/3rQKVehtzxT3SLrxBqyZ3ClyRZP+4XvOjJ1
 nBiHpRaIAGvFjUK2ffDrFzzc9LH09hMW+X+z7nn9YEKaZK1l6bPPm+bLS6t2PDxrmtNIuyNmtQw
 nHtT9kL/8wJUMwzUK4y36hJFo9S5y/St2+LI+HGHo7jADeUUIHcvtJ2hNlVdVQDmfNbZOxCA7KY
 /qI4pe7nC/fFE4nhFJVsO6+IXzVqUcSWjSUC/YwdlnCW+IIyYEN6YjOJubCNUNIq2riXDFes+zp
 wmez9fmM9nP16Z49kqChRfQ4iyn4ChhsCs4bc0/ePg8Og==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ccaf0ba7a00ce50;
	Sat, 26 Sep 2026 11:04:40 +0000
X-Mizu-Trace-ID: 5ccaf0ba7a00ce50
X-Migadu-Flow: FLOW_OUT
Date: Sat, 26 Sep 2026 19:04:35 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, si.yanteng@linux.dev,
	rdunlap@infradead.org
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <aremw0r9vCfAvUgM@wyuan.org>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
 <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
 <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>

On 2026-09-26 12:10:16 +0200, Jiaming Ouyang <jiamingouyang13@gmail.com> wrote:

> docs/zh_CN: add Chinese translation for usb/ohci.rst

Besides the comments from Greg, I think the line above should better
belong to the Subject: line in the email headers. But there, it is a part
of email body now, i.e. the line started with 'docs/zh_CN' will appear
twice in the same commit.

Thanks.

> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> ---
> Changes in v2:
> - Correct the date
> - Correct the layout
> - Add specific details for it's contributors
> 
> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
