Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A44E433C;
	Tue, 13 Oct 2026 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889551; cv=none; b=UbP07Rt5P+6ojFJzlpxcXhBQHvJ9yF1c+T1cDtDeszXEaO/PbrER5ttF8oQ4h/Tk1OW+nSmXwymC3/LZCQKLwaW44UVxcrnbQlCkwPUOa3jebrVywqoguy99BKHkP43sYa2GnHkLSUa4FA0rLPXUOBXdPc++h1a1qj4T9iocAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889551; c=relaxed/simple;
	bh=kv1VPHKfU3feesVipQUwBeQXGbmTdkxAJIVeLOO2f0c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IlzaT4KFmLXJxTHC9wiFyAHO1mggJU9Y45i+n57OhsbCU74391kdEFeRy3C87yGrJHEjVCctalcyOOb4oiLspSqoAM7ffPeN9/lUoLOt6MZ+mdbhRb4ZIIKZ450VXEwnf5DCUFD56aYkFFWKArLOXVI1TPX2RRVMRB3v9Vb7Ois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nca7MBic; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nca7MBic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791889549; x=1823425549;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=kv1VPHKfU3feesVipQUwBeQXGbmTdkxAJIVeLOO2f0c=;
  b=Nca7MBicOaKThBndTx9G+jCGFhnwdFv0wgGnr2gcpBDjbttPSBnlTfvz
   tLb60nMGa4mthjgLWMxtKH8Mg0PxrptAB2OJ2+CxBRYsVD4xqNDAakx40
   AQoBDHwH0q9a1ZKun8jIvHGxBElJbsPOw5X/roFGDIvaYHB0Ud7rQWQcM
   1PnjDpgBHwwb5mGVQOF67P1ldWQaLAl5dAtSJqBc03QXuJIb3/R0kNSVP
   yi+/MKmGLtABU8vGt4b1YPLO/x3kSRfxRDp0Zv5rnyRw/wcr9oaSQ7lkM
   6u7UBOKdKW7fctzwVgCMuoCURhU93tqhPlvXUwNy3mNXyU0Uw+vv5XpzO
   g==;
X-CSE-ConnectionGUID: mbp1J4hFS/+49PPcBPBeCw==
X-CSE-MsgGUID: CwRV/821T/G4t/TKN9bkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="641608"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="641608"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:05:49 -0700
X-CSE-ConnectionGUID: 6btVv9+TQgiyckqRCyWprQ==
X-CSE-MsgGUID: NUr2j7bLQjuksck8DZmscA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2901498"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:05:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 14:05:41 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Mark Brown <broonie@kernel.org>, Mark Gross <markgross@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
In-Reply-To: <44fe29ee-9692-49f4-aaa7-7201c9cdcaba@kernel.org>
Message-ID: <d1fa9d26-ba44-5cd5-76cc-1fc91ba9a6d8@linux.intel.com>
References: <arUBQuAfW4HJQHik@sirena.org.uk> <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk> <asOdosd0zROmuzu1@sirena.co.uk> <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk> <8f4e200a-c2fd-29c6-ee4d-a91137b90c12@linux.intel.com>
 <44fe29ee-9692-49f4-aaa7-7201c9cdcaba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1481859028-1791883712=:1237"
Content-ID: <cf3b452c-3b18-8fae-8e0b-9ca5c36c921b@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1481859028-1791883712=:1237
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a9842d6c-c6e6-401b-569f-2a856ebe393d@linux.intel.com>

On Tue, 13 Oct 2026, Hans de Goede wrote:
> On 13-Oct-26 10:34, Ilpo J=E4rvinen wrote:
> > On Mon, 12 Oct 2026, Mark Brown wrote:
> >=20
> >> On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
> >>> On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> >>>> On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> >>>>> Commits
> >>>>>
> >>>>>   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 =
support")
> >>>>>   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning =
in fan_curve_get_factory_default()")
> >>>>>
> >>>>> are missing a Signed-off-by from their authors
> >>>>
> >>>> This issue is still present today.
> >>>
> >>> And today.
> >>
> >> And today - should Ilpo be added to the list of contacts for this tree=
?
> >=20
> > Yeah, I'm in practice the person who is handling pdx86 patches these da=
ys=20
> > so it would be good.
> >=20
> > ...Goes to do some massive history rewriting...
>=20
> My bad, I missed you (Ilpo) were not getting these emails, sorry.

I finally went and improved my patch getting script to block any=20
submissions for which git interpret-trailers shows no Sign-off-by lines.
That'll make it in practice impossible for me to apply such submissions=20
anymore.

It's not entirely foolproof though as the Signed-off-by could still be=20
invalid one e.g. by being different from From and I don't know easy way to=
=20
extract From from a patch file (consider encodings and multiple From=20
lines properly).

--=20
 i.
--8323328-1481859028-1791883712=:1237--
