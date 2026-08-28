Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CD360EED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931656; cv=none; b=K0EYR+oVUMAXMauzuw6KvqYyEBSp0avAmn1JOKs2la/Fr/tV/l+o2ouhQhtG4pLlyG94exm7F77M44+IO81uB1/3fm0I/6b4DTt3OUpeQ/hMnyTYucOUDgt4VtZ9zhZBUgN6WsDQY4x6Gen0Z1OdjDlVUM+pQyC5grIX/ZYpssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931656; c=relaxed/simple;
	bh=3HjPR/NAweusIT/iyDUl7mmqaY74VFpMV2oma3CqhE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ8IvAWaquqFWCUZ+fbIkr9KrqoQbaKAfLebEg1vfDMREj3K5qfUUR8CsDoH81V9lor+XiXqiqKarDrZ1IYsq15epm6mYFcvNsMuTo9MWk0BnyftxAkyAnQsynkN6FKTShNOdhVBbhtrJYXd9FijaayQ6AAs2LAtQIRTRE778Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcIBLnJs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcIBLnJs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so10939515e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931653; x=1788536453; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=or9it1bSqSerwJlL8gapxH1sr/v4GRq+wa+KaIeYZsI=;
        b=fcIBLnJso427HAahcQQgY2LNtmygrdSuYnJDLxSErF/EAIKpGQvl0A2GRrkKH5YwZj
         kI+k3ThEx3p1PWc9PC3N0RFz2WutJUr6A+QFil4LplnV6b/Sxu2iJI6hbqrMBmW2kLc5
         RFq2SZGncHYM+eQNzlq2iGtQMxaqtBpJRvDAf/BaiTea+4uCgRHiEUC8zeG3Ti4OPM8J
         Uvdvkhlu9ytJsS1qEVr4meOi/2nq6SGWxvJ66pjrpuf/++hTCiAk34fOcTL4PRo3/nHe
         brFljgOredUDXGY/V5EQ4a0hQPQ9GjlzSSu80iFYvDPGY8HJykjFyN+CJsv4RpRkMTDY
         JOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931653; x=1788536453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=or9it1bSqSerwJlL8gapxH1sr/v4GRq+wa+KaIeYZsI=;
        b=FOJwFppIMxoqyykVGFeWrqBkrLFQDHO+4oe/njYAM82faRV6POkPDJDV28o1u47vzl
         3w3P7x7dtBwg0d6+dMYoEblx35lSA53z0vs0M/v8Y+yNH4S4wAy4EQOVWqjDAXyxhQyC
         cstl17LuOKQcIjyX3CV1U5G/VR89A2Zs/IftaE9ex8apOdUAfS0ycTBa/jGdOtLMl9Xu
         yIUlkgZaz2ILAzn4G56n+qrouuSYhdfkM9Zl7Gkzqe3xJqK1P9P3KhbPLoq+Ez4/s3gj
         EDIg5NQ3fSeC3kK58WdkV+01NM9dWxbHhtbNTsmEBEKI4lC2+5my7/lxU3VuGJw8FGz1
         EP3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0F1JUjsjlYS0zcgwjzAj4NeqzvLJYZQgYmYQJ10Fi9evclCM0AvTpQKTPHRm+p16oDV/bDUwb+vop4tU=@vger.kernel.org
X-Gm-Message-State: AFuF++lS3MyIQwiYj16lYn3K11hQWMDqBhRs3DbG8/s/029V5cbcSnmq
	iQchU++kT+30L4QplUcAiygRxJI7hUjRkHs8nrw+mzdjB66ysQ7+2DRI
X-Gm-Gg: AR+sD104qRKM0w5L5CAqTq0a9OM0pfKWRKdcZghYGebNtqMs5agKlZalydXmOhm5PgD
	yy0bXku3gbF2mIDXyr+b9j3m9FNyQck1Sri8Qaw7S0Wv74VEqDJSwycZkgbQbsR16ivzkt9vtv6
	03ees8jBEFP5H7KxnC2oR7w3n0H8YO1dXXOFhSDyIhqDgrGJhdg02mgSobG73jqEVS0wlfQw0WH
	bnkg+pF60ct8kJ5H9Ptif6uQpwAGrER62g0giabXGLQyat8Bp/cSLE70vZFzTh7u3n3XNNYp9UR
	3JUVr6OO7qwGSb5nkby+KpJrazN7/52Bi24D/yj0pQwZN4qZ9m6YvJ+nChroE6WuOspX5ReutQH
	E8Fef9+wI6GkHwCtcpfAy9Saq2PPQmQKhqi9/yDUe/fQ/XYbfUdcCmy5qQzRfyjhZgwUpfFnBlD
	MOky5M/3t0OXUC6WNaxHUcMFUunEVf76JYQ+MBsw6wNO1hCnGcWBkAXR+PCQOLgg4e585YX9P5D
	Dl5+2L3lAiCvWZZ2b/VtFbI
X-Received: by 2002:a05:600c:524e:b0:49b:9438:7785 with SMTP id 5b1f17b1804b1-49b94387aaemr77157775e9.4.1787931652997;
        Fri, 28 Aug 2026 08:40:52 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm178561375e9.11.2026.08.28.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:40:52 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:40:51 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: mic@digikod.net, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4 4/5] landlock: Document
 LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
Message-ID: <20260828.b569cf9602bc@gnoack.org>
References: <20260809154544.1253100-1-utilityemal77@gmail.com>
 <20260809154544.1253100-5-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809154544.1253100-5-utilityemal77@gmail.com>

Hello Justin!

On Sun, Aug 09, 2026 at 11:45:22AM -0400, Justin Suess wrote:
> Document setting no_new_privs with ruleset enforcement, following the
> same compatibility section style as previous ABI additions.
> 
> Include a section explaining the tradeoffs of setting no_new_privs
> through any means for privileged users of Landlock.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
> 
> Notes:
>     v3->v4:
>         - Reword the tutorial paragraph on CAP_SYS_ADMIN and no_new_privs to
>           remove the ambiguous "it"s, per Mickaël's feedback.
>         - Use the suggested "call (or ``CAP_SYS_ADMIN`` use)" wording in the
>           compatibility section.
> 
>  Documentation/userspace-api/landlock.rst | 47 +++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 6 deletions(-)

Friendly reminder -- could you please also transcribe the newly added
documentation into the Landlock man pages?  I added a tracking issue
at https://github.com/landlock-lsm/linux/issues/66 where I outlined
the rough process, which is mostly mechanical.  I am happy to do a
review.

I think in this case, it probably only needs an entry in the VERSIONS
table in landlock(7) and an update to landlock_create_ruleset(2) to
document what the flag does.

Thanks,
Günther
