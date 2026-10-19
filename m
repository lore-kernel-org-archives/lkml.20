Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AD4DEC3E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416903; cv=none; b=CazpcTWkegw8QfDaB/kxbXEHQz5rZjSSrebuab8KsckxWpM9MyMXnx2GpwlXNKCxeou6jbUafbu3iYhtKOvIyaF44Ut8zSIk9vVTcWWO1Ub6PNBkbvMqXzgD2pIjY4pC6qps9DyEGF9SYz7oosZHcd1Hhj6SeL1farJE4okdRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416903; c=relaxed/simple;
	bh=YY1pq20GeCfSfEZmfVj5BZPs80Yw4oU/LMLFGETnSmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qELTOGvf2zf1I5YZaP8H5UrPHhBuSSazNCVmV/idSbLyLSWHM99vn73sG9R9u0RhpE0+9GP7GCTmqCuqQrU82s2IOn3otS3B5SIRIIDejEuz2uh5GgRZB5gT/9RjY9RLtrjwQH77vuTnTql6+irDuEv2ygw27YvZzjAd07kEvbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeoAm/OI; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeoAm/OI"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6de1fd5f572so810168eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416901; x=1793021701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YY1pq20GeCfSfEZmfVj5BZPs80Yw4oU/LMLFGETnSmw=;
        b=NeoAm/OIaZ5tQaq4FAUpg5vcDN4/byIV8YD0Vc2oqM7Kw2ezHS5Lt4gtC2mLmB4Pn9
         Bdo5sHRRgyGm/m5uxVgOtNtzBXFrchSvicXfzP7rHvFU3sD2Z8JvznRoLDsptZGu1sSP
         ltW2yH/4dn9tlQ0W9AGVqIJmidjPR9nb4Af8BBii1Q1FiuqbF/q+8DGjNAmMlGM0/KiY
         bEGPeFinpdVNWFkpFspXs8SbjXRtm+UxhnWic22DUfR/EjhyPayI76AhuIj3m5M9Gg9Y
         Kyal1PhhlflD6whilztt1eUFktdIAQL8mnESPZpgBSDD+XO1yI/BgqiMNvNVoXogens3
         6eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416901; x=1793021701;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY1pq20GeCfSfEZmfVj5BZPs80Yw4oU/LMLFGETnSmw=;
        b=CWONBblFHpU9BXOBnIKXNKV6ro7+lE1ll9MHGTzx270e3AnSge1s/wEzScN18gKj8d
         4xsbjyI8jQJD20tQCpkV8K7e/eXTDQrnL7UrTiwz1Tg1TY3EtijeQOqrKrruoksReP1z
         yGoCchBzFHWAhPZ1jC8FcYqc80rl3Oe3ecD/UaeSSfkoQfBLx+5rauglX9eyi0iTVxR9
         dl05jds1W9+RFNVpFoD3O5IwJnV/yaj4m88NvgqjJEWCAknPtnvuZDrNSDZMqusqcGk0
         eV+pnm3Oe8pHf1rYmpL0qiSuopsqdfjU1rdp/VNUAEPsw4YMmP0I4CCGuUt2nSZN8q7s
         ONtw==
X-Gm-Message-State: AFq9FYJnYwWFUmGGwmYDjLXlEcXiaHdzpLHHjLgtzKytRxTUjYMMYGCi
	83sNKclsFvobWORAq3RDhGHZ1UWBUHhbGMIAU3GBRaTUmxVKMxVpL3VR
X-Gm-Gg: AYBFou1eOkmIQ7QnCu3rGdbEQYnnrl0xkgi332qIGkIwuCvc5NeeUkqaNBmXOGcku4y
	4CGn5CwLmks6cnSjmdNd0eABL9sRKyuq7GQcC3WkGxbebOEqktB7qDkZQenuGvrgs+AhLq6gwpA
	AZc5jWND/TmiOOGe/T0s88BY56vzP1cs10LRxDhJAJXRtUMhNRUNawNiwrLJBAH1LpcPTIW6SHB
	y786xPwdLkBTRZo2oQlWngRv3NvMnFzCsgYYuP6HQh4RdFtYijubx08XhZesrnAU48iwt2EuJda
	KJ0foroChUvWcEdXF1APad7in+vSI4esnHhLpNWnSN/rxPUwHAHuUvzKmtIukjckrvuuHIlzQ5o
	IkFCxyPRI+231Gw8lCB3G9p24dzkF0CzwVR/LdDtkQnLAzeFOjRR+ybws79Fyys515Z/z/cPJOG
	OOHd8ERsFaIytZMmVsCJ0DRoYqWUgS0BHBdBbng683s5X5LNrM9XIqs/M//XEuFlo9yZ2hdjSZk
	eAV2kPA5oYtmr35a2ZNtJWMznZ9sR5eX2aw17dhHw==
X-Received: by 2002:a05:6820:221c:b0:6ff:fcf5:40ed with SMTP id 006d021491bc7-70357b9b8fbmr4025328eaf.90.1792416900583;
        Mon, 19 Oct 2026 06:35:00 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-701900722d9sm7025347eaf.10.2026.10.19.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:34:59 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert remaining Perl utilities in scripts/
Date: Mon, 19 Oct 2026 10:34:52 -0300
Message-ID: <20261019133452.4826-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019100505.3199861A74+hca@linux.ibm.com>
References: <20261019100505.3199861A74+hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

> That is an odd reason - if I'm not wrong then you have zero upstream
> commits, and now are proposing fundamental changes to tools maintained
> and used by others? I guess this is 100% LLM work(?).

You are right to suspect that I used an LLM as an aid for this series.
As required by the kernel policy, I will include an Assisted-by: tag in
every commit to make this fully transparent.

Regarding my lack of upstream history: that is true, I am a new
contributor. However, I fully understand the code I am submitting. The
LLM was used to speed up the mechanical translation, but I reviewed every
line, checked the logic, and tested the scripts' behavior to ensure 1:1
parity. I am aware that final responsibility for the code is mine.

> So an important part of describing any change is *why* you are doing it.
> Why are you doing all of these conversions? Some of these scripts have
> not seen changes in decades and are likely unused; why do we want to
> mess with them now?

I would like to clarify the motivation behind the conversion, because I
do not think I presented it convincingly in the cover letter. The goal
is not simply to "remove Perl", but to reduce the long-term maintenance
burden.

The kernel already has a clear track record of migrating critical
tooling to Python (e.g. get_maintainer and checkpatch). Keeping a
residual set of Perl scripts forces maintainers and contributors to deal
with two environments and two sets of idioms for the same class of
tasks. Unifying that code base in Python simplifies review, testing, and
future contributions. Even scripts that have not changed in decades are
still part of the tooling ecosystem and may be used by developers;
removing them from the Perl equation is a consistency gain.

To reduce the risk and demonstrate my commitment, I would like to
propose a different path: can we start with a single script? I could
prepare a patch focused only on checkstack.pl (or another script you
consider a priority), with a detailed justification and a test plan, so
you can evaluate the process and quality before we consider the rest of
the series.

I am happy to adjust the approach in whatever way is most productive for
you and the community.

Best regards,
Breno
