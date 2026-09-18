Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABF3264C1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729966; cv=none; b=E+JPa7KyMFZKHFBfPHMvo4jh1W9dzs8/F9eFKJE1+IYH1wyLKHMR/oFmCLM42RFPwJVywQELW0rkqD5Pdw1djaUAJRanJ11ukPBfSMHM6L+HGIikdCLUSI/0DZsUPTYs+55SP/KPz3a/7zDlYVM28aZuLwYmHpUb1Szv7KE3Jxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729966; c=relaxed/simple;
	bh=owAlDYLOsRejsTpKXRCN5yOQWIt9XLS98KmSzWAwWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InqnVqIwCCiM4kRS/6vha+6Rfbn+THGPdlLHXQb5n3zVXQt+BGYWo5hVdBqf8IpJib/kagw2MEPDMW/vPUKl5UoVSnKefR0UilV5ZUVGwjOPkWJNr/c45tGVfy86vOoG4YHX/nb4FkGFM0pbkYJ9DSJVUWJkn/mmUp0zzeXv7nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nGNCK7Kw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mnWbZSWq; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nGNCK7Kw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mnWbZSWq"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C03E7EC019B;
	Fri, 18 Sep 2026 07:12:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 18 Sep 2026 07:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1789729963;
	 x=1789816363; bh=aOjkYwSASVXKiD+zeLsIdS86wYdYvUbbG91J6ziU5dk=; b=
	nGNCK7KwLGaq7jyR8+OHKmfurVmfyvGAIP4zgIxVD2cK+qGUJEnvUovZsyOsKFEm
	2epgT+wlnrf/TdK/qmgGCyYqsnaBdU2d+ICY7lOp88CYihVWze4V/pVJpHUHpLEw
	/XYoifuKLVvx0eNU1dB/IGgCPa7NOE/9UNIzP+yP5khrUNf5QHfj1ZeITogvIeM8
	G4WGBC4QvcJwsOiG2wRKQEfIyv8AM8t4sgEGZ6rydFdE81PtTYTRr0Xg0+Uh4FsH
	bT/Powto7jSEtUvHdjWS7Ia5k7pUc0CgjgFWNCxj3CDhX2vnceQOOBS9gZKVfe37
	2tksnJkLqHkYwgOchcId6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789729963; x=
	1789816363; bh=aOjkYwSASVXKiD+zeLsIdS86wYdYvUbbG91J6ziU5dk=; b=m
	nWbZSWqx169rLgxf80nQ9AMsySh4D65dv71nTHXfzkzv3XN138xKmOUIC7POsckg
	ysS8/P09MiGCwx/fV2TY702kd1Jj0BwPV0zi/D6qmkOOSNX5IfjedGracjQTeGjh
	kwiQnUiWs/XzTkVvJqLQv0Zg9YjFJeK2N+PVPTykuvz+fEd01u6fI1/QegWTtP7X
	c93cM0ZvVnDkTurgyO3sP3eWkbTSpjg2QJhJOBaib1PsmhUI8uSKQVYQ7PUHtOZW
	7L+nBXK8P89DEud5bw+sZ1bsZ6ZkeM4ZfZg3vzx4p/9am6CcyANm4oJ4BQp008xI
	zoe6iZE6APFevbxKHuMAA==
X-ME-Sender: <xms:qxytatjFocd19M0FsY85vof61oDDEDxmR-VEb3YIL3qRb2uYvcpbcQ>
    <xme:qxytarW8ru5zA3rco6tV52uXIkTvNEQetonuSTfTZCdlNc5zjOxDhTL-IIvlY5juJ
    NDBzTTJY9gFWADsQCj7pHeMj_3gApo7K-x2GXYDH0JllJKtnU0>
X-ME-Received: <xmr:qxytakXGQvGU9EtKck8G0cAY489eKyv6VScTC04B_Y_y3VurIY7blFQ9PcOx>
X-ME-Proxy-Cause: dmFkZTFLe1nUIBC/CcPn+MZNwMkumtukqHPOS/dvqKxrPe/8JXR9z4POENC4tsJ8v6rTuY
    WEwFtfjnZzpIPkqGq9GPn+Ru+2SzwVM7hj5/hYXY4I+Y6BQcUNpmfdRhP2/K5BUamjtTX4
    V7YuA30bOHJdnG9mNdriF5r3xrucCJdLOX2rg0JngUU+quugrt7JR0iMJ1IyU37SwEvcjR
    nWVs4Gi1VqNwtgADZ9IbGJuF1VryXgsPkmSSUrHQEpFg76HzCu1hjl7wpDdUBY+AT5VETn
    nxQJ9gOpV80oN7jvQlFCnYHLK57T9AyaHK7Z3H3lmQa3TNzA8uNabRelj9jtdatrh9F1MA
    Oq5s4yOb84MCnd4u+xJ29dCCVBy3GNLXKCtGpOY40O08+i6CvOxsHv0DAcHi358+tx9alS
    y5FbxMe+ikD7bwlCxUB2kx53Da1ROkua/iop4IIGu8JNGwr8TMHOUm1DV87xVoy673HQKb
    BwSzhTLNFtIICLwJHNV9xfqbM22u/Zpg9mnI+9LnWw4quv0ppYmy9uYF81fy2p8MWrHIQz
    nuKiLN2KbIOw7p5pfgcknG8kZECZFDTuCzfdmC0XwjizhDEtXjlnshr1oCP3zsKRKPGo00
    oOJZ6bZf0zgfSb2YC7nptVPKxDxJxIpF2/lH9D0PeCREUJiGqkEJmhtuvuxw
X-ME-Proxy: <xmx:qxytajiIXORu3J3kKSebKCTWtTkMC71dnHmZdEiG1AhxuFSMPowrtA>
    <xmx:qxytanbGcI-2PsnGylRNaQ7YgDkKZAuHpO-DiFaxMhrTNUryGRXp8g>
    <xmx:qxytaoqI6KxqmYPnBJkCEnRMzGTrI5TfQUr3-3zhT4Ld_HcIZHCy7A>
    <xmx:qxytasP6KQD_vw37u3aRGxXpWwjwP82tQHws1zWGxUp_4U5OYKo7qQ>
    <xmx:qxytakw9PBwYQq1HR0UEsEAQRNViBi0AByKg_NARCINp9RnnNfYkDWbu>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 07:12:42 -0400 (EDT)
Date: Fri, 18 Sep 2026 12:10:46 +0100
From: Greg KH <greg@kroah.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2026-90310: xen/xenbus: check otherend_id only after it has
 been initialized
Message-ID: <2026091837-reclining-tradition-71f1@gregkh>
References: <2026091756-CVE-2026-90310-3b21@gregkh>
 <ceac20d1-7222-403f-a9ea-1bc2194684c7@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceac20d1-7222-403f-a9ea-1bc2194684c7@suse.com>

On Thu, Sep 17, 2026 at 10:04:39PM +0200, Jürgen Groß wrote:
> On 17.09.26 18:12, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > xen/xenbus: check otherend_id only after it has been initialized
> > 
> > When device just got initialized (for example on module load), the
> > otherend_id field is initialized only after
> > xenbus_read_otherend_details() gets called. If xenstore watch triggers
> > xenbus_dev_changed() before that, it might consider still zeroed
> > otherend_id field (not matching actual xenstore content) as a sign of
> > device state reset. It can happen because xenstore watch are handled in
> > another thread (xenwatch), which can run in parallel to the initial
> > device probe running at module load. In that case, it would call
> > device_unregister(), which would deadlock against device probe from
> > module init.
> > 
> > Fix this by considering dev->otherend_id change only after dev->otherend
> > is set (which happen after otherend_id is initialized).
> > 
> > The Linux kernel CVE team has assigned CVE-2026-90310 to this issue.
> 
> I'd like to dispute this CVE.
> 
> This is nothing an unprivileged user has any influence on. The race can
> happen only in Xen guests after a new PV-device has been added to it by the
> host administrator.
> 
> This is just a regular bug with no security aspect, so please revoke this CVE.

Thanks for the review, now rejected!

greg k-h
