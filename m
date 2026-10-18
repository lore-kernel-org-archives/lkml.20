Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3303DA5C1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367621; cv=pass; b=DC78vGvjHvNwC1hcCrBWR9unpFxsfial0YvYBvNz11FN1qqeMpg/ZDSktmIYrNW+v03724mPe9RgnHJeT2thPNlac+Zg5MpRmXTRup/burq/dHvF/r4h0+v1tUj1aYJJh9t8CsVcfxSkcNl0rij4AxofNcQ14/iCAZjyOL5fAf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367621; c=relaxed/simple;
	bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pful3PwyDJZ67DSsFUNXjDR3auRM52vkqHc58eQe3UdypUYksg3c7Z2t+kbUWj/ZZ23A709GvMYkbNDzz2Dd3EDTOVCxG80pRIyQ11sreuoF2fkUvugl3wm4IqVQ3fd8BQezLMdsnmXKtSXkqTbthU2NSNokSAe7eShQmhNsl/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZDgA8XP; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZDgA8XP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so297114b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792367620; cv=none;
        d=google.com; s=arc-20260327;
        b=BMiePge1shXYU5sU2jbvUSFRs3MedhfZ8fX1XnEN80zm0r3mGUQYqK5sjItQUDubF7
         cUUr+k69YqDWdyZXAgfiCdjUwQYjdvh8/EdtSEzMq03sHkbmAXWqkBD5EyYcyZTRtRpl
         vrlIqsAuzp/eHk++C9ejJoOlHpRfe80YgnQ6+53/M2Gg4tgBXMGdC+NBBAyPAAPfNMYf
         SCfK0xWL9JMSHEJ/00rRAuoHRJA97TQ04qY3tg4F4cjOwHbL+ku9aXhEmlGncbQw5m9b
         eO7LXaLsrpKdNzqADIOlI5WX9kouU/FlRzxMkDyk2Fz06G8OA1Zy6z1Z6hON5T1tigWE
         QB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        fh=Y2g83QE2ldSy4BT8W1VOQSLvb7nAFXGfRywMpivOh5E=;
        b=kRQOLmK7L2ZdqH8hXoqitFGxqDhA4W8SBw3Tt/bpqJY6Oq6ZXUJdSSC/YLSaCKigyZ
         MhByEjzgHKQhK/N+Txwm4snorPl83Tfw5zcyw0RlKMIiKPqmPeTw5gaNn4RURsvl8L1u
         qRzKFHiR5Sg5phdKXNsPMk+8Le5sXTvUBgz3k9I010vQ/we+uiFQrk+kflZZWHF14Pnv
         xbq8MKoqaLk4F/1hA37GUxytB4OWmqaS2NXgLCg0bDMv8nuZ84g6r6/dRbIk++cJBzgB
         764qkRMLy1TBNfHt7wM+T9rFhWreP7cE/Ybd9kX5A8FSPekez0jjbGuzsNxQO8Emtt1S
         aDLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792367620; x=1792972420; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=IZDgA8XPxtSh5SmNztAw9myhG61BrYOUczUp3QyZ3U4M+b/31OnoF0hdpSfL5a9W5k
         SpPaQA4NCvjY+GWzDVkjQV69DzntUDS4Ha/r+7fZn86vIwu+VmFE45/Ck7dzcO+W0JVn
         x/My9Pz7dv+WqOzz/StA6xrhvATJoLdO01IcgioEpSnVnJWn8Ogdya6qJUpGNhte2N+Q
         GBJYQQYzLlELK87jq34hmdd7p69WK4c2g3UfEFkmE/G5EmOvx3d/9U2LaVcqjo1YUb9j
         XX4j1xByvqrIP//XQuoJ6Uby3mYfgTjlMF2qCNt9T/2+eRhh6IqYmuOcrMis2cTt/Bhr
         8w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367620; x=1792972420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=eLPXVb+4fAriecDYkgT1UVqtH3Kk25J7nDWmDyETlWH/LGAZSLzbREeRE6BB7k7uRo
         khM6DY0DNW78SL3PMFGm4QJY2nohbqa7tChmzvTL8TO29BBvu7DRSOC1LOpiKWjHJLPh
         gz0bO/yVFFcCuD4FU/Qu/8lJgdQnJMvscDCMRkUgwOwRyfcAIu3swSQr6bEIrVFVm7Eu
         hzLetdUi75lzTkiT5NeZ4R3p0ehZSd0S+MMYkQvSMyUr1OqzqJeWy3RE/H2L/YFjgfCt
         lobxT6o1tFeTgfkkNv8s7Ya6roQvFWREjBwrJu+FiORMu2tr3M/jAOkIrwpxTBfoHZcE
         yA4w==
X-Forwarded-Encrypted: i=1; AKwUvBzWIIX1C8r/zfqmWRFXSe6YvtEYeIO/efrR/l++lCgpB5waqqFkN2ai/PC5ibah383ixaYQIsu33E7HD78=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6klh9Vo9Z5GaA/uGneAE6xQorxw++tQ4epriPvOaCKrwWZqRA
	RGpcyuxVTio8DNCV9ME/pX47U8ZpiDu8p9K3zMo8IVEIsse4sPylp5HXPCL3XgzYy3OGK6H7brl
	7Zyp8D0ba6C6eqmh2Oxun9/gsYYMsauk=
X-Gm-Gg: AYBFou3aSiJBqqzfjuQ6CkxNRgpsHpMKMLYHEldyy9qSh51WAM5A0/kBLWLMecJGOXq
	V5xkCs3rcf+BG/XTvNHBp3ZZCJnm+JaEHzFGnMn+6pfIikAzfsMrT59E0I3ktl/VwCyzkDrunOB
	tQmX+M6OsXcjhmw8ME2jHEkYAAszcPRhCF7mBg+C0zdbCP1c6jud2C6b+WT0tD/lcHNJR7Af8B1
	2Lt8DGhYd02+yqhaJYNiQ0E+azUvMB64X+k95gFC5UIKPFoi6139UGjhke0nhHtkdzG0bQ03CQ/
	dUY3Eg/JgOA5j7minGc2M71KR+1xKbEQ0+8p68dlkkeglJXDDWKYgrwvnIollCtJekeQ5hWWF25
	+TqECJyQJIjsA6azmGQ==
X-Received: by 2002:a05:6a00:1806:b0:892:597f:37d8 with SMTP id
 d2e1a72fcca58-8a04ba18454mr4779902b3a.15.1792367619719; Sun, 18 Oct 2026
 16:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org> <20261017231007.GP13920@nvidia.com>
In-Reply-To: <20261017231007.GP13920@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sun, 18 Oct 2026 16:53:28 -0700
X-Gm-Features: AclHuK9GuI1sFp98b1K0khmGUju9GL5ycOOU8Mt4euoyLz8UHj6wifrtGgAMHK0
Message-ID: <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Content-Type: text/plain; charset="UTF-8"

> On Sat, Oct 17, 2026 at 11:55:05PM +0300, Jarkko Sakkinen wrote:
> > I wish I had a better picture what is going on.

Me too. I've spent my Sunday with Claude trying to build some
understanding of all this stuff, and put together a static site about
this series.

https://deeglaze.github.io/scratch/ctlv-site/index.html

It includes a review that I've personally walked through to ensure it
wasn't off base, but of course we're all fallible here.
I haven't decided to email the review comments to the list yet because
it's pretty thorough for something posted here as an RFC.

I think something to be really careful about with this series is how
it's managing kernel memory.

* https://deeglaze.github.io/scratch/ctlv-site/review-02.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-04.html#reply-27
* https://deeglaze.github.io/scratch/ctlv-site/review-07.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-11.html#reply-8
* https://deeglaze.github.io/scratch/ctlv-site/review-16.html#reply-30
* https://deeglaze.github.io/scratch/ctlv-site/review-18.html#reply-19

Something I and some others dislike about IMA is the unbounded log. I
don't know how many stalled proposals there have been so far to permit
some model of "snapshot/endorse and truncate" to allow a remote
attestation verification service to store existing logs in object
storage, measure the reference and/or trusted signature that the log
was "good", and then drop everything in the log prior to the
pointer/endorsement event, but we have a chance to start with the
right model here. I liked Tushar's talk in 2024
https://www.youtube.com/watch?v=5cXDrIx8Qgo
IMA carries its log through kexec and this log doesn't, which is a
hazard to later attestations that don't have some other out of band
protocol to associate its boot instance with some off-box cache of the
rest of the log.

>
> Currently we don't have an intention to flow TPM command packets
> through this. Anything would be a high level operation like 'extend'
>

If you're not intercepting all extends through other interfaces to the
registers (e.g., /dev/tpmrm0), then it needs to be clearer in the
documentation that users not using the interface will break users of
the interface when they both target overlapping sets of registers.
