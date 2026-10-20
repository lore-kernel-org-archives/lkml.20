Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501150;
	b=l7zf3S7k3Ra3/2gPZ/i5IhJ9+3mLxWHenHbTr+iS63VbpyXreASE146HCXb5BmcGQFlY
	 XpnooTQhMbvz0zzCl/k3gsnJIJeTRurhYXRt8jkLBl2HiIWtuOjsM7KqgaiYW3G4APmxr
	 +C/jMJD9cmUDeMg7ywkqvZXeSnZev04KJOnxBCHgDO8y1gPNIihXI47+YqvCASfJddRcd
	 5uHfxMlMVx7iIXJLGpJqsQHbWDSaYRedoeyvZ/i/2zVwGFkCkFlDz1ePSf/kyYICF5QOJ
	 YzLEY9GirPuNVoYkrGMUztgzWVhRmREWwXAmghrxW1ljneqb8RYzUCyFcD7idQOmUJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501150;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=QBTl51IQ0+KqmhJ8w/9trrjX95XCh5VfRZJIdL2Ip8Y=;
	b=kf6JSGBblgPRGhICc2qDB24T6H+pNpEhsaVzPEXXbsDxB3KT7raL02j9od8t1nBmCIS5
	 JFujHsOyUQ4Mw8N7gywlrBAjSACzt/1gT1apXsJXWAyN5jp7IEv6BqFlvuu2o+WZ4sgZn
	 2SfLEqlQBLrWtW0RG3Wrc1oVPfqF+8+bR+NG/3otNq63LffmE+Pbbpq1Fcnn11pRTOYJi
	 IKda+AJkF7wP+WY6I8G1UGBPpeUf9EbiE6EA6gY9JyQNqShbyaejtfownmpyjEYGyYJXp
	 9CB8Xob92EN1YkJcN2vOQEsrICoWWGhtzk9NA0aflZZ6MNoEOA1+TOWSPqqRW2OyBXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7TJzdm3;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086E606A319;
	Tue, 20 Oct 2026 12:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9086E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7TJzdm3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792501150; x=1824037150;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VDNcUbXU8RUEH9Qokqkf99rjq4gmV1R15TSwexL/qXk=;
  b=m7TJzdm3xxi1NItC2jbcOcNjhGXjGBDtu3/QSdEDcuCK6TFmZxbtai4Z
   XeLWWNBnlYwHZFmQBp+gbCHSzCWDsBHvwVC2C6Md7BpT6eT+X2KhxaXgx
   Z0/fPEQSsZ9jXb3T9gcobsXOnuzb+Ga5W9OqvLAj8NT9TQ3bCk95X33AM
   fpUrVcJeQ5hOlU+hQ5jGydcTejOL6gpb1byJWCCNdlPx1WHoyzstjwZfs
   8zxt3bAvMlQG+I7H5X8PGMR+KyVbSmsntmm0O5tZN4VIRpzUCO3D58EZY
   MVUKwOp/LnPPFxAy12ZHamEVX4yEthV7lU06mGFQHZAsyB0xUdKAhIFds
   w==;
X-CSE-ConnectionGUID: QZ7YAR7TQQq+BctC7Bf+5Q==
X-CSE-MsgGUID: GhjRWerNQzyKKbxlIsvscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1213225"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1213225"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 05:59:09 -0700
X-CSE-ConnectionGUID: ukHoPQtUQuW/i2mvroSZdw==
X-CSE-MsgGUID: nIK0HpwzTm6SfczlFZxSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3148807"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 05:59:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 15:59:01 +0300 (EEST)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
In-Reply-To: <atdZzEMsMWhzO2gO@sirena.co.uk>
Message-ID: <cfa6481e-46cd-9ed1-4a12-fea734ba505e@linux.intel.com>
References: <arUBQuAfW4HJQHik@sirena.org.uk> <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk> <asOdosd0zROmuzu1@sirena.co.uk> <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk> <atZqoXnT_27rGAn9@sirena.co.uk> <e1119f07-83cc-8178-3c6a-e87778d3cb16@linux.intel.com>
 <atdZzEMsMWhzO2gO@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1224813704-1792501141=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1224813704-1792501141=:1177
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Oct 2026, Mark Brown wrote:

> On Tue, Oct 20, 2026 at 02:07:02PM +0300, Ilpo J=E4rvinen wrote:
>=20
> > Something odd is likely going on here. Neither of those commits above a=
re=20
> > in my tree anymore.
>=20
> > Your latest merge:
>=20
> > commit 233956951080612ff68d0c54f620606c53a1c91c
> > Merge: 67f116b3a9f8 98f039265e58
>=20
> > I don't know how you got that 98f039265e58 but that hasn't been in pdx8=
6=20
> > tree for multiple days by now:
>=20
> > https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.g=
it/commit/?id=3D1bd7f5b78426fd94a4a3f75c79835a4416809e87
>=20
> That's what I fetched yesterday, I don't know if there was some infra
> issue which caused the fetch to fail.  What I'm seeing for today is
> commit 893018d51f27ec0449155b0afe371aaf65380630, hopefully that's what
> you expected.

893018d51f27ec0449155b0afe371aaf65380630 should no longer have the issue=20
and is the current for-next head.

Have a nice day. :-)

--=20
 i.

--8323328-1224813704-1792501141=:1177--
