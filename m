Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B64D37AD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340637; cv=pass; b=VD3jLMO5TbFgyxzYuXYChpQHeOmjm76vOQllr0cW7n4SGBYiRyqT/AJYovOkKEg1J8aj9L7nvW18UNmyeO6c2fsF3QblfO8Ihk9BFYYG7sC2mTZd7kLhk9IS9q/DrLhCihnQZCf0fufi9ibGFKM0m9/2g8UM5jTwQ0+cg2mLH2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340637; c=relaxed/simple;
	bh=eXFnMrvjWhAjkzGsPW2qsKgsH1CfzHALxNzDTq3muFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs2HoioOjEnejTXwLm9yKr8qlz6tmUQxYF08g+ZLnynVA/2NMEJefoNBoCgFGmK4hEB6lm+/vPx4E+iTC2inv006uuDK0giZ+8jvSFl5W7hF08XP0WqexKu2JnTS60fKGftp6IC4ubboWNgfvtmnWChcQ8h4AHVVVnHx7KkC7og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=47RJPdEs; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="47RJPdEs"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67583c777abso1646572d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792340635; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+Sua+SRZ4wWGFBiloAGTK3apvt7oW7f+f98TrKs3UYYntlfhAne1wOOMD2vvkeG3C
         YlvBIq1fCJ3RsVOm61tYY2Zh1U6MzcoNjlRaQyuC3YMgkdgyj172QOAaIDkNduF+djDa
         uI8PSXYfFSW57fEpoe6dIkPoczDEW0ZoHH58kFsdmqliHB2iOcFbW6at9Z1fRmK4kveT
         PxJRYRjxOTPrKginOcL4lRwGBwqva0oTgX5xafbj0o1BL5dbIr7F7Cmx7oDaft6gnarD
         r0Oh0pVSmDpgi0uNvAKlRpEW2gyhaPH8JSvCgPUKEGDaX7bVTchEBJhCQJoRA0BNng17
         T4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+xrX/lMN1wewX+Usmtm5W37p8mKfEaBQAA+QF9DbflM=;
        fh=rjaPanJH5jTBkULabe97yXNrDXflXwHCPhS+yCEM0J4=;
        b=SfRgNkb0gCzgmqKpR2xFQjGrpp2D+tZGFejWLwX021Icxww2tLAC81ZAW31rjWfHpI
         GSzpFAsiIOwjYj6e7lFW0NpUVgHryifuwduln2dGcoWxW0OQVEB10E1sqeY4ZROO0XyB
         Q/4lkahVQAuG1Amo0HNcP+wpmD+fJ/8aE7nlgD51BC8OAwamXY55IHASfzEbbbRdmNbj
         JDDSjUxsZc8D5YAISRzVDUSoLGP+I8SpBwtWsTUQu4qGA1e1WbeL522YD80AoA1mOGP0
         rZFvRJT/7WWLEHW6/aQuYsApk/TK4aNrTEpxgHzI7w3zRaPjeyDtrsJODc748l/bwqa0
         cwQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1792340635; x=1792945435; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xrX/lMN1wewX+Usmtm5W37p8mKfEaBQAA+QF9DbflM=;
        b=47RJPdEs8FI1V+UPrcJ93Z3HXwlkX2IVUsKKVOKXAPmfgv3PZ2VkH2v45Xeylybw1N
         FjzUPkRsJTmY4GISW619L+q0dxEUxOpfAJ1+UcXacHpTUx/oq+LgyZTmWSm2PGvypmxL
         5801Po1GVgVDmC3KwrP6NU5bIql8J3SgR1Iv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340635; x=1792945435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xrX/lMN1wewX+Usmtm5W37p8mKfEaBQAA+QF9DbflM=;
        b=CaEcrEW/jEpxhpu8jLPilhC41a1Pc2cgYNr+tXDvHs57jRTxwsG1/wR/B1F9I89+FJ
         M8dJvtVxlLVEze8F6xI79t6fTBqLE3Pudncb1vBg3Z1IkoCs/aEI4emzSMBBwD6feEPW
         /NwG9DecbEL6gbbxCBl4YyuTWVpgCEZREwqPcmi6+SKII26GYXPMq2oD1WFgvfLT1OsG
         1VPma+mXD6MIPhz/R9/C2KykGGEDJwGLR/WlsYcWCWQKkMVeyDzB97m2B208BO82tZYA
         R2ohou+wwc9C0aHusqS0yDDTsJ/oOaZnNPkBk02NynHBSlKuS3ZeozRO24BGPJvqcHLR
         +1vw==
X-Forwarded-Encrypted: i=1; AKwUvBwnHU0996EETXZwYY9c2QT5oyXCtd7kCLJ27UrWJdem6bwl791NUAJF5A3HSnNETZAP9Mogz3RtycpEHxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzaNA/7kdeV12tRl7tpeoahK0Cm/AhBK7/wrro55UEtjxN73lY
	UNkXCy1QdjMUhHgbqBO/FKTKw+IbtYGwOGcncf8ykSjP0KfXTz2pEt1ahGHaRU/ZE74zc2q+eis
	XXgjQnOtidnisLGGlduxjulhl+gvQdPgadGMr2f9fdA==
X-Gm-Gg: AYBFou2KfEjsNKuorXj+wp/kzA/23Nj73sIJnMWWFkZrV4gzjFdDOQrU0I4LYqqpco3
	CtEeD3RUSOvY5YGBRCvXEG1JAvFIlZl0s3gOuoqhGADGG+n9EWPzm0Gexcjr7Q/nqYxvOsH5s5r
	Npja3GQOG9BRBt1pCrCtnCIx74BU3zh25OqFTCPVSv5HGJXThxf0/mpMLTix0eXwPyyLGg4mNoE
	T/rfyR3WnVyfZhWp9dKwFT5PAdlU2ss5Uhy2atx8bkCeK/1muCvK1ho0C3PDPEmF8Xq4DS9lo9p
	hTz+elLYHR+7sR5pMXDlXuJIUxQydrUrTu/9b+9wLj6Qh0Ew+Wo4pBD0NDsaOiQs2gh1nImQ3ey
	0Ch8nDKb+ECw=
X-Received: by 2002:a53:bd09:0:b0:675:6330:caa3 with SMTP id
 956f58d0204a3-679ca92e155mr989546d50.42.1792340634592; Sun, 18 Oct 2026
 09:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-perf-symbol-memory-send-v5-0-165dceb2b049@uber.com>
 <20261005-perf-symbol-memory-send-v5-4-165dceb2b049@uber.com> <asbElicX1u_GZu_j@google.com>
In-Reply-To: <asbElicX1u_GZu_j@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sun, 18 Oct 2026 09:23:38 -0700
X-Gm-Features: AclHuK8ZMynVps2Y3SLchlBdfZ3aE85BRwQupiiWxXwuxhVbCtV7qofBZTTpNlw
Message-ID: <CA+w=M=SzevvR2XFU6O9bVv7wKoGXkNLaWSL4aOtHsvkkTDG+rA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] perf script: Add --lazy-load-symbols for lazy
 symbol loading
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

Sorry for the late reply.

On Wed, Oct 7, 2026 at 3:15 PM Namhyung Kim <namhyung@kernel.org> wrote:
> I thought we agreed to just use struct symbol and lazy-load the name
> only.  With Ian's patch to remove the 'priv' part of symbol and
> hopefully RB-tree node as well, the size of symbol would become
> manageable, I guess.

Ack, in the next revision (v6), I will use struct symbol and load only its
name lazily, as you suggested. I will replace the embedded name with a
union of a name pointer and a file offset. A flag will indicate which
union member is valid. An unresolved lazy symbol will store the file
offset. After perf reads and demangles the name, it will replace the
offset with the name pointer and clear the flag. This removes the
separate index and most of the parity code from v5.

I tested this design on a cgroup profile of a large C++ service. The
loader creates approximately one million symbols. The results are:

                                      time    max RSS
  perf-tools-next                     3.3 s   334 MiB
  v5 --lazy-load-symbols              1.4 s   136 MiB
  v6 --lazy-load-symbols              1.5 s   154 MiB

All three produce identical output.

The v6 design works with the current RB-tree and does not depend on
Ian's series. Most of the remaining memory difference from v5 comes
from the RB-tree node and one allocation for each symbol. Ian's array
storage can remove the RB-tree node later.

Thanks,
Alireza
