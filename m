Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D691331EA5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380773; cv=pass; b=gkykr6hXSbQQTLjMhnokBx1AZVfYezheihyXF36q8YBsC/xuHhSibdzJkVrZW4rvAzTFfUVo9t54wg9+vYyYU7QSCjNn7Zc1iv3ohnlLx9sYbp7xAYqA3A6AipH7XOi5uYlUHy1iDtj7Lx1VxJpUZdi2MbN+mqi9tEZhF/zndZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380773; c=relaxed/simple;
	bh=P5cQgQjLUi9zeGMQAcMuNJVoKIIM8/3TV4okKHa7wh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grcb1lctnP1mh5ESNu+2mHkUTmYCGZpfp5EvO/L29GG9bO31Rgm2cAghvAE6AeWoF6/GAho+rygoVHQPQsCV79V13wh9KD1W1Xra+pTSzH91QRusQyZ41u8VTyd/VyPWeLQngq6JcUlAbQdhFsk1xFPKtfznuSPsU2cBqWaxbUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZB0Y1mU; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZB0Y1mU"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-8659af7454eso14138077b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380770; cv=none;
        d=google.com; s=arc-20260327;
        b=j644NHVayjQnq9G4WqxH+tjAoIVeA060aDgyOb5RyKQvlh1XAt6EZcAsRIID8Z1bSm
         6V8+a2PxzvIG0lUbNC40h8g8AEA5RAgpdVCBMf/ym7KtwyoEL80dXSD4NBxSxiUsMrOs
         PnAV41tT2NGAZQebN1NZT3BVb6mY8UbjAeEzQMUP4+CprIai8zxGkKPs3ZM9cbjW+x47
         VX5NZ2eb/h7ftrg5QLkF7Xva1HAxIy/4Rf1ihAshU/hgYUEjXEKLpI7dKk84IwXSoenc
         tNvwIqnPM5RN/wtzEfQdfDr/8sCfbzp+dsg9l+Zqp6TFoq3Uiv4QL1yZcjqgRuZsEpHZ
         PRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P5cQgQjLUi9zeGMQAcMuNJVoKIIM8/3TV4okKHa7wh4=;
        fh=SSC0fpNQC1v2bZ1J9EGqt7UCCjvoHYB+wmu+rFh2zqs=;
        b=nrCvSELupExz1g4GG9mfKjfk17ntBiUbEHEz2g7Uh4/uKPAYhRj6V7P5DdY/vmnsPe
         aARzd3fYaQsu6Hj6AMX8urpZin+ZMP0mizUH2sFcbuZbB9DuMSePWFFxYZRqPyPnyxu0
         /x8Hy/Yp4G/OC9XMozzZIzPFkWD/H/k/lT2BYilxBOMCwheHQaGXVK4Z0hCz10shaUQU
         KwCSr9ZLH4IHVA9/H5fMb5rgDcOuY2r9GIQVPFgVl5yFPCr5AHG52I9vigCwvhyznVhO
         01ck9xFIkhfC0vjuWsPlDDTuN3C5UlWde0fgANkhj45HOCICZYt34lthprGD3WirnB4X
         /H8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789380770; x=1789985570; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5cQgQjLUi9zeGMQAcMuNJVoKIIM8/3TV4okKHa7wh4=;
        b=mZB0Y1mUGEogTDvZ8KNfSPkXgGYpTh3lmQJSjeWXk1z3RQyW/JCW8auRUtyKreATzc
         KWMluNZM9PHJO+4jTehcrdJSMRlNgawnExC85fhwFPNUucwo5ntHwg6EO87lZeh2dSer
         pDXvbMh7yrjMMk4fzhlkYM7Adm6Z2UzdVrkPXk9Hvoi238QZId/t5shGaqh1U66futWX
         DbfmW41v0oYnVk/KrqiGCJyfdetTyh/yio/5SDlOySg0bVNCMciFBP2Me73xsDNLS85d
         ogze/AUpEwz8Ua1THQRoxn+wfJvdN3AD6j5bRwbYvHSpaZ+NAb/0AFYqG4uOVJMX+LUc
         yphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380770; x=1789985570;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5cQgQjLUi9zeGMQAcMuNJVoKIIM8/3TV4okKHa7wh4=;
        b=ZiAZ696C7g2/PWfK6AlWCvfHopOVD+BBpC5YXz5XsKwHdTBkyhyDsNz252zIGhGElu
         2FRtx7ithTYUJosqKrdM7tMh+KMDdzWLV81trjJZ7WRU2qUAMRCi1IkW5cxsOCrelVtm
         3ju05Roikj2BpPyDuXo2wTUoTCtPPWvmQcNsDj6RsvNvb7w97kxh9xUCDIyGxFpnEklB
         o+e3AYUz6DItz1VCkOt97H+Vf4z9o5OTlBXnrDzsN2j/BLzqMgcFxBBqzK/cc+bvl03G
         2iw8BdSXBouu6a7MAWOiSyiQYTWGae2zXG/shJu6SRoVzfKQ2PWb6qns/1yVIBogBAWQ
         5vWw==
X-Forwarded-Encrypted: i=1; AKwUvBwByUQQ4ieizjxUEdjFDgNGl1kz+fqXmkSLeSIWkEjKFyPjVZuLD02QEDFWgfOoBMdZ6DTuupMOCPcMPKA=@vger.kernel.org
X-Gm-Message-State: AFuF++mDI22KqfcZsNNyi7xcLX1r1tZwfSAaSfb5yJKVs41lk+xuwxDI
	0wgxXCmjIW9IzJL8t9YFy94nDX7LAu+E2cgoKV5yV7+rdVmn3SpLp3aDb2N5b8lTWdEMBnvlVXw
	vpiphTzdSloYswSpv5PZgn83d3b1enXI=
X-Gm-Gg: AYBFou2/ObEYzXeAB4+7BLgxYRSBmqBBea9H3o/PS0kQCs+bQxcFUSuWs3MF/zZ93Am
	HKedOwTOcLPblA8hFwT1C4ePGhcR8hu8FbvxnvpDdbbLD2MXF+M2eBWIo0PyPSXXbrV73cnqkL6
	cPMxyEHyjS7wNKDPRHl4DFRe712Nqc83YCerf+7ITZRfDy7lFQHCKIRwgSjJPF3nPRy34LTSXlM
	BeUrO/OsM4mckStxMhYOGxXgoABW/Fboi5XFcKs0A5Vmw6ejVP2m+Z1ukEzeCxcreyZaICgy1Ln
	P7ZVabih2cp5db2dyVFQwjxfWOclo5Qf4EEkc6fMenmUVH9Fimhw99SALO8YZN8NHN4jey5bc9o
	HdFalGdFtmQ==
X-Received: by 2002:a05:690c:4f01:b0:873:5c0f:27c with SMTP id
 00721157ae682-88d22cda17emr3100987b3.38.1789380765589; Mon, 14 Sep 2026
 03:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
 <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
 <2a15ec49-7b83-4881-a9ec-a1193602eb4f@intel.com> <CAHk-=wj3H5DdeRqnWWz7PwH1Qzb1PgQWf9S0Ce3BjZ+68LjXuQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj3H5DdeRqnWWz7PwH1Qzb1PgQWf9S0Ce3BjZ+68LjXuQ@mail.gmail.com>
From: Orson Peters <orsonpeters@gmail.com>
Date: Mon, 14 Sep 2026 12:12:33 +0200
X-Gm-Features: AcwNN1UsNDHcIToLJucCRn1H2DQfs4y-Oc2sikD2kftwG27iMdi-Y6iupPP6G_0
Message-ID: <CAJxLxMXGE64kSaTRZq-HkVTzM8eKwJRDhGNM_-sy2n03hj_Wfw@mail.gmail.com>
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"

> Yeah, so it looks to me like the *fix* is correct, and it's just that
> blaming MADV_FREE is the wrong thing.

One thing I'd like to point out is that from userspace THP + MADV_FREE
is all you need to hit the bug, if you are on a multi-NUMA-node
machine.

My minimal reproducer did explicitly call mprotect() to make the
reproduction deterministic. But on a multi-NUMA-node machine
pmd_modify can get called entirely transparently in the background
with memory pressure.

So from the perspective of the user it really is just MADV_FREE
misbehaving (write-after-free getting lost) when THP is being used.
I'm not sure if that should actually be reflected in the commit
message, but wanted to point it out anyway.
