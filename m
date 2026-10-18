Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543A3DCDB0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365569; cv=none; b=RDvzNGnYneBzvqsLSex8wpjUpQyBmy1t3NJgZaxeUm+c6UmXtzZg1GkvNZicSInWlkmf8poEcOL3SPMfbwMGoLrQ4Xq3dIkHiB1oybal+dIpv5mkXm+5oi5NjoITjckKW+Nr4eswo52OMBxEsQjaxeEoGF+EtZnQCijrcyHD6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365569; c=relaxed/simple;
	bh=gdz37LkTHwvbfI9D9K7It0lfMaiEj5WSEbCh952KDbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivTtrdiZBVVv9+rV3iTqmyv6CnKBvUqoGINmUiayiesQkV7QiLLfAYHWUMxFJvnrUznUABQsOT9ioCC0Z6Bm4fs5FYdxidGiFI/Uq2BYzwTKnV1X7SLL79FlI2B+tmNgF2GWasTbYEwuA/yedB/KSarTIoufUVxMMd1Mn36xSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMWYdnQx; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMWYdnQx"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so2094640eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365567; x=1792970367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWqYlByYg+LLSmUqyC52+4NrO2sQWAJKmNCEfDxhRSw=;
        b=EMWYdnQxZey3mb+xgwl+gVL2mOgi54HWG8Gq31xYJGS+4047/1hHURZg9n9n0o0K3n
         ktUOftWo+AfEI2DHotksbuPLQX+bG9MrpKVkpIDlRVu7xPKlEfjYBDcuxi0FJBZyMGEe
         XdfWH0qKFQ262svOlLv9dRF44SNRe1WxXoWKS1Uzw3qPVdUfrcxbnPlS/fz1zC/5VyuO
         Ds1BAvZq+oEs6zagXIkq5ooDAHvPEXGz9pNNf5tpa16JKR/CPNw3VrX2BNPfbLu7QkNC
         XBwUqXiy/P8TBSXbw0WlmqXqLZE2PC0UjAAhn0uqsNeBD7v2fo9VlxOzSGYc8Qtlqqgt
         EQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365567; x=1792970367;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWqYlByYg+LLSmUqyC52+4NrO2sQWAJKmNCEfDxhRSw=;
        b=MTevVFeWrRdNMWcgOF7lnlnf+oEokCL66321nkrJdv1OPlu7M9DPeAttjSwZ3Xkrb/
         89DybF/82PRjwf141JoW3NpY0fkiONfd2aO3GdXYlf2ronl8jnI6irLty+ctY9A0mycu
         E/p4VZ+hmtY7hBQt87jBJPnCbFW9QxJ2OtAVzemOEFmtldkKJLv8TLYsu7gVUHIJfAMj
         gLBOZroop+ZtL0Xfr+gAGDHBhjjOpKZR3/9w/X7kiUq688SV+LyP6Eo5dBJz07TRjrX/
         Eg/AlfKYY82CRX2V/mKh1iIh26KnIubVxD2pKRxtwqsiXdVhMY5EsxngYM9+P7UNvAVH
         K4ew==
X-Gm-Message-State: AFq9FYJ3ati2ctCB48CdE1XiGt5snC5uHlNOxW5EzLgmk1iMzXpwbAjf
	rwNPNx/XJ/gaK0ynXW+eMBgwPEWivllXRR8i/pFgrJrWnN7AKp/f3Q7NrbTEiLQN
X-Gm-Gg: AYBFou3+VvzDH+MZgVKuLzigkZeB19kPRNzoMFeZVh1jcBkYdaQiiCb9NBfPYFMPl6i
	mf8UssYGOgs1XDO7KxN6UmbdBqf+BXSFG5TUBVxdQ7JaFXrZKVAee+vW+4j89oi/FN6X9AZw/Ez
	9AU7MQcNs/ITSlqH1TM47euj6mxsZY+XVpgcd4jjfSzXv1lodTC00Y6dVuM19uGA5uE3hxGZ7G3
	6Hs95wzF+ixpZlStY74AKV4mSyZUjDlJERxmly37RMnPaYOvBjarM5T2eZvfJ0f9a7ESSA6HsvT
	+VcEDQJewxWJb4Sxr1m8WmxSACu9cl3H3fq4/ZHcGVwBZMmnqU3CDaEjq6KHwHTxQgrIFDSC8tR
	w7pnRhUXrjVGP8JGepswqOSde1iZjcn31jorYAgO9fn3FqUwWlddMHV9pIMOgegRo6y+MyiOVq2
	5F5037w7FDOlUKBsPQgonaINjdregXOSWSRNCKEN2XaSaxDJLlNKZLCDzQJBeYIH1yKXyVeehRn
	pW2Ek0Mk/dsp/tLhKC/rQ2YjhywygQG15vZyniwYQ==
X-Received: by 2002:a05:7022:170d:b0:145:4ef:e8de with SMTP id a92af1059eb24-1850c9cf21fmr8532556c88.6.1792365566923;
        Sun, 18 Oct 2026 16:19:26 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm25115638c88.1.2026.10.18.16.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:19:25 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert seven more Perl utilities to Python
Date: Sun, 18 Oct 2026 20:19:16 -0300
Message-ID: <20261018231917.74657-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87fqy2afnk.fsf@trenco.lwn.net>
References: <87fqy2afnk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> So an important part of describing any change is *why* you are doing it.
> Why are you doing all of these conversions?  Some of these scripts have
> not seen changes in decades and are likely unused; why do we want to
> mess with them now?

You're right, and thanks for pushing on this — I should have framed
the *why* in the cover letter.

I ran a quick analysis of each script to separate what's actually
used from what's likely dead code. Three groups:

1. Actively used by developers or build:
   - get_maintainer.pl: 28 references in Documentation/ alone.
   - recordmcount.pl: called from scripts/Makefile.build when
     CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT is enabled.
   - generate_initcall_order.pl: called from scripts/Makefile.build
     when initcall tracing is enabled.

2. Used by developers, not integrated into the build:
   - leaking_addresses.pl: security-research tool run manually.

3. Likely obsolete:
   - checkdeclares.pl: no build, doc, or in-tree references.
     (Last-modified not verified locally — shallow clone — but no
     reference is the stronger signal.)
   - checkversion.pl: one reference in scripts/Makefile.build, but
     the check itself is narrow.
   - extract_xc3028.pl: no references; extracts firmware for DVB
     hardware unmaintained for over a decade.

The honest conclusion is that group 3 is a removal candidate, not
a conversion target. I did not do this analysis before v1 and I
should have.

Plan for v2:
  - Keep get_maintainer, recordmcount, generate_initcall_order,
    leaking_addresses.
  - Drop checkdeclares and extract_xc3028 from the series.
  - Decide checkversion separately (keep, or propose for removal
    after a public call for users).
  - Rewrite the cover letter to state the motivation explicitly.

Broader motivation for the kept four: kernel CI and tooling
already assume Python for kernel-doc, spdxcheck, bpf_doc.
Keeping Perl alive solely for a handful of scripts forces two
runtimes for the same class of tools. Converting the active ones
closes that gap; converting dead ones does not.

Breno
