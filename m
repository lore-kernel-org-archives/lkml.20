Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C342048D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379534; cv=none; b=EmBHMVubMAFGOTKrw19539+Ugz4ywNOp7YkRWTvlVUHP4UDkMaLqumdrty86La/kx4DqKAe5sQbGTuQVRC1AknJJD1qwCPa/zMIW+XGA03sR2E3mQOleCWXe8ONMWtDUe8/neXNCXvPKWYIMzajGp21yy8j746WTrnH5ZK5/158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379534; c=relaxed/simple;
	bh=NwHFKXeGfWvXfFDB8Dx4MlVGi15SX/g36tkiFox1vmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENHxrKS5nE+RuvfpC/NRYmMuKf8QHWoZER/wy/J9+XRkswBPp6Z3jiW6szik8ELEcKdG/FcwO3z27qZVdXbwMbPQzejcICEbx4qPWrjQKAWlvqdE0WyJeRSPqPpIYjcT40ftrS4GRqdWdFVzI0C05TDuyuYHiwPi1IBWs0tVYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3MNSyKB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3MNSyKB"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso2352225ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379532; x=1789984332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CugJTnFpNDzD6RvkvwHqkwu4HooaScng7d0KUVoknX0=;
        b=R3MNSyKBLpH0R4jKdW57KBEweLMlACLe75vanhA0QnCXBaJJhRgieYJLBX3yi41elH
         W/Uq2IA2jl5YHFCTJBmW+No2f8nQ/yOw3svMQU4ljo6g444drtK4fG2mN+ZgK0Juhzmh
         eKZHwX3jTzN5N4V57K9CrYs9FnLtUo7W5wyjMXSIoaZmQHccWc5qmmo1q2SziEORRNxk
         SBA3IrjQyyl4P7tduirAWY+X63fE37wM6NW7qfBlYOyd/JWDjFyEc3dZ/O8l1un+K1TT
         qiVpVBa+QeTzXc9Av7z24OnwgrojZT+CjjrCwR7+KPEub60MElecKPabhuZGGVs5MEoS
         EZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379532; x=1789984332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CugJTnFpNDzD6RvkvwHqkwu4HooaScng7d0KUVoknX0=;
        b=acE4x7sASF9on3mjVCHguiGkPS7OPCBPQjnHn+WnW7/MU2HCb37hoIUcrLY2xrH4Ye
         qpQdsHwRKUz2M0xdairkyso3xzWq/oSPILbJsxuJhB/FjqoIKsEwk20L900C3NYBlK+Z
         oD3QCUOnnu/ZI2t3T0ZTst2o8492D4xbuDbM9fwvw3z632FFGncCwmvmS/aYu7JXRc+i
         xYjPptXyi2r8kDXcS1l0vBpt4oWv44e+tvk9SnygXGk4hBwzE1RQMVIYs3+rsARKioj3
         F7l1prlC2vxa8VGQ3iVUQAbTkvqjbjxTSKpTASa/JMVafvulwoC8vQhSjlPX8qwierim
         L2cw==
X-Forwarded-Encrypted: i=1; AKwUvBw2aIIqSJZE868VQLZyrdiR7rQ3PaHMiE8cyTMvX/Scqmgq5T0SH63EzmfCM1DlRLLEr2rkoTZjyDjqpyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mYblID1XZVRwnf4ci3RE3dWYga1aJ5pwauxYnzR1OiJvrU4J3S
	z9oITvYYxLmYstiAZNaS5WOV02mqW7uNkGJ6q00IZQORMz9n8fHLBmnj
X-Gm-Gg: AYBFou19CMPO37nmLCQu9/04NyUO7h26lLspDdfWr/3E0iIL5bn+Z5S9HEfjFEleyH4
	j14DHJnj81gwySzM4ZBxvWCXODtWSU/NEeDlZ/WBQvlVwW/W5g2HJ0tQZje3aMyk2/Ez+EknPr9
	O/itYc6HsEax9Xq3RMELxnG9x92oQhdhw3xzwh8UW7/lscjrBn3WYiEVNtGwhlpslrUN8Z95Rsu
	Ym72tfMZtZS+cUPXCcVAp0imZwz5Ch0pDwVIxgC3ejHv7loD6NYf0rfYypVDr5xtOk+u5rc3RLk
	cT0aGQr74v/dCKfKxOAkubL/vYuGVoEcoCYlYNmIWrukJhF01qXNON0BfH4AsYRLhHRlGJBvA1J
	ZnsY6mffpm0MZtHuKNWs1ir10ECa85p2y+jITi6T3WUCoDjY7We2MOjzi5LWB3Y8r5YApyNuj0z
	91BS2KmaQ62F9qaXgggJfNG2uADEMYdPQ5zLXbgIexMfhoiZJvXfQFUrkgIfwYSc3XY3wH4yNOK
	MdFAK72
X-Received: by 2002:a05:6a20:d80d:b0:3c3:94bb:ceb8 with SMTP id adf61e73a8af0-3db404fcb8bmr2241794637.1.1789379531607;
        Mon, 14 Sep 2026 02:52:11 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c2775sm4183562b3a.9.2026.09.14.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:52:10 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:52:06 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Chen Miao <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqfDff8BC8vJAOAg@elitemini>
References: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
 <20260914074206.05579309@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914074206.05579309@foz.lan>

Hi Mauro,

Thank you for looking at this.  Both directions you suggest are ones I went
down first; here is what I measured.

On Mon, 14 Sep 2026 07:42:06 +0200, Mauro Carvalho Chehab wrote:
> If so, maybe a more interesting patch would be to adjust pdf generaion
> to use a more reasonable memory limit, as 6GB sounds too little.

main_memory is counted in words rather than bytes, so that 6000000 is not 6
GB -- but raising it does not help either.  Fedora 44, the broken pairing
held fixed, varying only extra_mem_top/extra_mem_bot:

	             core-api             admin-guide
	----------------------------------------------------------------
	stock        FAILS 26x Dim 1194p  FAILS capacity 13p
	+60M words   FAILS 26x Dim 1194p  FAILS 40x Dim 2886p, no capacity

core-api does not move at all, and admin-guide, once TeX has all the memory
it asks for, fails on "Dimension too large" instead: the memory was masking
those boxes, not causing them.  Neither produces a PDF.

> This is also another parameter that may require adjustments.
> If I'm not mistaken, this is related to the maximum level depth
> on titles.

That one is maxlistdepth, which Documentation/conf.py already sets to 10.
\fb@put@frame is framed.sty's frame placement macro, and what it reports is
a box past TeX's maximum dimension, 16383.99998pt, which no setting raises.
Bisecting a single block under the kernel's LaTeX settings, 1450 lines
builds and 1500 does not, at stock memory and at ten times it;
memory-barriers.txt is 3016 lines.  I wrote an override for \fb@put@frame
too, and dropped it: the same content passes unframed under an older
Docutils.

> On both cases, I don't think you can blame docutils or sphinx
> version: those are distro-specific configuration parameters.

This is what I should have shown in v1.  Same container, same TeX Live, same
unmodified texmf.cnf, same tree; only the two Python packages differ:

	sphinx   docutils   core-api   admin-guide
	------------------------------------------
	8.2.3    0.21.2     ok         ok
	8.2.3    0.22.4     FAILS      FAILS
	9.0.4    0.22.4     FAILS      FAILS
	9.1.0    0.22.4     ok         ok

The 9.0.4 row is a plain "pip install sphinx==9.0.4": 9.0.x declares
"docutils>=0.20,<0.23" upstream, so pip resolves Docutils to 0.22.4 by
itself, with no distribution involved.

You are right that it takes a combination, and I will say that plainly
rather than pointing at one package.

> I don't mind having a warning

One thing needs fixing regardless: Akira pointed out that the fix for this,
sphinx-doc/sphinx#3099, landed in Sphinx 9.1.0 rather than 9.0.0, so v1's
constant skips the 9.0.4 row above.  I think that calls for a v2, with the
constant fixed and the commit message reworded as described.

Thanks,
Masaharu
