Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C341737C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203677; cv=none; b=pzQ99yZAy7wBO35bSA3ee7tKOa1zFUc0cNsg9wxkEM1Y72HvQgDlHf3ZgZQ7nJ/dmQwGVSBXZW+x/qpe856AUfwwzxxpwrTTlCOcxf7yuN6fRLJCjxDZX7x7d3oIIALATjSw86ru2dIqzXIiEgFbye217o6x/CrLr+mJYPAIE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203677; c=relaxed/simple;
	bh=cdbmdild9NvrkIM87viAxmTpP86J1k3s1hG3a6zISao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5FUw8U5EM2ftXTOQFPeM+Yx2su3HF8yWodJ9VdoGjjDSlS+kGR8OlExqWci+zZJkpeTTfpO9WRP33au+2MfQre1RiXtCw2M3mpF1dZqzVzv8ikSx0J/T1oCuEwmiwtEvCjobbhx6YRmvDETEoJAxlGt5GAzrU8T5u2Zkl+xVTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE8yTZdM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE8yTZdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790203675; x=1821739675;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cdbmdild9NvrkIM87viAxmTpP86J1k3s1hG3a6zISao=;
  b=QE8yTZdMEefijrHvfR9ckSbW5r+iCqIEa9afibuBGX9af2/pCl+Tljfk
   aTKUKv3ygnfE/Gu2KfN/VYKELpEbSRceKiP5HK2A3ghLclZ2wokeNT82j
   ywxJ9J198LhCJLRJghPhwYCJL3QjefhNqJqJw0679OKsePeGGLpHzqbQf
   OboDMqI1YOC21U5hI2o4EkqEnTYn78SHNp8efdo81krzZapYpGMhlRqj9
   yOlK5aZECOr6kCSX1yGac1m9UmC4mVum3+BpeqHzraxxJB5xO8pUMIi+L
   0MUmghIWvxI7sQZQxf9Tilnja/4Z/wRI89iDsoqf7t1nyr5bC6sdJfF3f
   Q==;
X-CSE-ConnectionGUID: rU3yX1BPTMeYwhUcrPJi8g==
X-CSE-MsgGUID: BLU7kk8NSLG6wMKFTVEW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108446487"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="108446487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 15:47:54 -0700
X-CSE-ConnectionGUID: Vpun4D+FTvGx0FEUlXe6UQ==
X-CSE-MsgGUID: Uwf14mzdSSSi/uHuNQxNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273993184"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 15:47:54 -0700
Message-ID: <cb40f86f84618ccd893d4b20fe6f4b33db0a983d.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Clean up more build
 artifacts in 'clean' target
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>, zhangjiao2
	 <zhangjiao2@cmss.chinamobile.com>
Cc: raj.khem@gmail.com, linux-kernel@vger.kernel.org, trivial@kernel.org
Date: Wed, 23 Sep 2026 15:47:53 -0700
In-Reply-To: <bbbf056a-a86e-4ad4-97a4-4a32a36eafa2@kernel.org>
References: <20260901093657.1884-1-zhangjiao2@cmss.chinamobile.com>
	 <bbbf056a-a86e-4ad4-97a4-4a32a36eafa2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jiao,

Friendly ping, I have to send pull request on Monday.

Thanks,
Srinivas

On Tue, 2026-09-08 at 09:39 +0200, Jiri Slaby wrote:
> On 01. 09. 26, 11:36, zhangjiao2 wrote:
> > From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> >=20
> > The 'clean' target currently leaves behind .* .o.cmd and .* .o.d
> > files,
> > as well as the generated 'include' directory. Extend the target to
> > remove these so 'make clean' fully resets the build tree.
> >=20
> > Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> > ---
> > =C2=A0 tools/power/x86/intel-speed-select/Makefile | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/tools/power/x86/intel-speed-select/Makefile
> > b/tools/power/x86/intel-speed-select/Makefile
> > index 6b299aae2ded..46874e4cee51 100644
> > --- a/tools/power/x86/intel-speed-select/Makefile
> > +++ b/tools/power/x86/intel-speed-select/Makefile
> > @@ -54,6 +54,8 @@ clean:
> > =C2=A0=C2=A0	rm -f $(ALL_PROGRAMS)
> > =C2=A0=C2=A0	rm -rf $(OUTPUT)include/linux/isst_if.h
> > =C2=A0=C2=A0	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name
> > '\.*.d' -delete
> > +	find $(or $(OUTPUT),.) -name '.*.o.cmd' -delete -o -name
> > '.*.o.d' -delete
>=20
> There are no *.d at this point (removed by the previous find). You
> can=20
> do it on one line (as many of the other tools/):
> find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '.*.o.d' -delete
> -o=20
> -name '.*.o.cmd' -delete
>=20
> > +	find $(or $(OUTPUT),.) -type d -name 'include' -exec rm -
> > rf {} +
>=20
> So you can remove "rm -rf $(OUTPUT)include/linux/isst_if.h" above,
> right?
>=20
> thanks,
