Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB9287247
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392028; cv=none; b=rSfPIN9w1ab3T17nTxjz2xHWgVCscnwa44T38qPZIoPPGEPxSlRihCtxWBlIietybrBUhBLQwT8xQ/VAh0CwKGd79cp5RwGZwiJrGSGgTX/Jh7FiY5gYyAk5JliTwyC0juLU8YnU/M11dsiv1Tts0uKz9VjgSyCKSkjflnYHdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392028; c=relaxed/simple;
	bh=5SeLgR1qWH5QZOp0mLLO558bwvyHTKQEEgQdi/wUyHw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPoJQWUFfgokgfCTZMitRwMuDAtWhDS/2oh/TzW9uz1pHPQraff5vfDodDu1bJaOz4qbbztaW4MSarKjd9kVAdyxH4XArIeddhpK22QCT8bFZi088n70vkVP2TXN+RWeYqxiUEZWwBxRGHBcdgWcMfgG+QlMuOsk1C4QeEbprwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=XJpHeCMh; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="XJpHeCMh"
Received: from bat.kanata.rendec.net (unknown [172.21.6.1])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 95F36D07D3;
	Wed,  7 Oct 2026 19:53:36 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 95F36D07D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791392018;
	bh=5SeLgR1qWH5QZOp0mLLO558bwvyHTKQEEgQdi/wUyHw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XJpHeCMhKQX/p4FlJOB9SNUVfNpFtgQhrg7CNWSwgHI5DnxYKg+wVgEaSkq4LV90W
	 O4ODASBsvsGQ5+M2+6JREDZb9gLEGZHCFAYpvPWxognkW+172NIxqU8ya6VtuPj4Lt
	 u01eyR5jSPFnv4i02z+C33m20cIIEObpt7LU8+PZTIgSvwWXMvRLFYE3cHPurReQGt
	 guGz0xOsKT3JcRI5aP4+suRf3JB/r251HbTEA2oNKt/lXSYVRP9GBQkcOfXQWnZFFo
	 gC8+kaPXPM0jt1kyB++uP+PfoAmfwadQC5Cto0yK0zvQpJTd+hZuK+WcttS3Nu7sPz
	 eoOH3hmqY38Jg==
Message-ID: <fb8ea4a9619c84268972fc1c2c4d44bc1756fb88.camel@rendec.net>
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
From: Radu Rendec <radu@rendec.net>
To: "Okanovic, Haris" <harisokn@amazon.com>, Thomas Gleixner
 <tglx@kernel.org>,  Dmitry Ilvokhin	 <d@ilvokhin.com>
Cc: Michael Kelley <mhklinux@outlook.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 07 Oct 2026 12:53:32 -0400
In-Reply-To: <MN7PR18MB6602311B7A89577CF63B562105A8962@MN7PR18MB660231.namprd18.prod.outlook.com>
References:
	 	<20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
		 <MN7PR18MB6602311B7A89577CF63B562105A8962@MN7PR18MB660231.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-05 at 20:46 +0000, Okanovic, Haris wrote:
> Second ping on this one. It's been reviewed by Radu and tested by
> Michael on an Azure VM. No outstanding feedback.

Hi Haris,

This will have to be merged by Thomas, and AFAIK he's out at Linux
Plumbers, so I expect there will be some delay. FWIW, there are other
IRQ related patches/series that have been piling up lately, so I'm
pretty sure he's busy :)

--=20
Best regards,
Radu
