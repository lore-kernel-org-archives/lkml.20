Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90965599A28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161130; cv=pass; b=sN+61Ktn9S6lHDtN4x9XX9SXqpkYQYTDI1wUuJEaj0KyKn3K/VLkGE2afxfaEBv0NGQICbEPR1CbX0RA9Y+YuySm7aQfaXyIDmIYJ+Pz/Y69WOzJtDcn/560rXD3UAuEQWwIxZu65vYCKNIkgpL/C32DFmUaNHhLyrViy25YWQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161130; c=relaxed/simple;
	bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQZk/OAtfz3ALspfSS9+xmuPLbf5CO7gvo9JnU8qgzu7s8jIh8ci29iqisvpUC7polHZdChJqi6h63a810b0e7IzY3XA9iAkFU9Ta0/i5E6yCv/3uOMVk+pok1j9hD6/uoGEZa6f2ynA3yL1erlgwQ8oiZLen5qv1DJrD3gyHG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tab4gvan; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tab4gvan"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso64522766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789161127; cv=none;
        d=google.com; s=arc-20260327;
        b=ouCX/lzkoTy8yN7vTBHscpshcYt9xvLKFp/kNLxINXJ93xGy1wjiAHnKbfNvAdNvMu
         1pp8D019jOZ/0VDjKEa5AQyxHPcEYGXUlk0Oh+qWRviP0hFkQKw4Lx4PEOuyJLE7xIcT
         mcQfsigabe5j9h/66zdAt5Dvcf1erQhMULlachJOS6KQZPFlaH0AiyGxG1W3VEc1WsLj
         KLFCxo3BwvGgxuwPGsWO+8j1V5IS712El3huZamw82MDa5JPuWwKhkP/k24w7xwU0fWQ
         OiUxYbrpG+YcAsgsPS2ldN36g3qpzwPP6On0aeh3zdo+0xZIzwNQUQluvUrM/zMxAioD
         3hVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        fh=yrgWzU/BPT7aNM+1JkmGQxREa9Hn0OuSEyyZBwiowWE=;
        b=IDOoR5xFHggA9LhMlap65E95yn3TPIUu3zax7DyP6yokCPjIheyFSHRvTS2nmR9rBR
         4hHkg8VZZGbZGJkKoTdPI7eT+ercfyQK7luxxAKCQndHoBMmX35PiF3cNtREmkgmuzKU
         +tqQkHHqQhkPjHlLvW9/ORbh1EfdZkuo6hhtHoc3U9XrNRyMhsyXWOXwl7h0IdlLfBeZ
         3fEh2u4kTzoOV9Nc+YoGOBqkCzWOymT1EuFzuyY5lwLZSfaQ9sMry0+MLFK5PHCVhnom
         DOTpkA01JW8fM6T2QQ3iszqg84mPJrKWKxul43D8KQd0LGcMsvvh1tzlkOIghnaySZCn
         UIbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789161127; x=1789765927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        b=tab4gvan26Lk8iSkXFMZKYdWvxPwyLkHVcOPb864H7VAY3JJKwGbGxUhXS5wgYjgdn
         Se+CBLEXQ3R7ILWbGpuYvaca4inykx6aU+PE2U72zGgpF0ruFmNy90/0Sof7SiF3Y4E2
         oZP6bp1cwU0uwdiPMZHZZ+9XTyRKeSWZF9VptYUT0GLSzxPn3P28H2q5sjoHoOHSNlXa
         eAFfMe6zs7z5kynF1KQ4iDf6YzrJn36+W+8QdlaXmYu2bd6iEnSq26pL0wLOHR+xU/AQ
         YMgt5pHZ5odDyjhHBjKvrLQJPPIeLLumFl5XXeXziiu2lfRE5llT7VzGwhb5DCBIL3OY
         Z44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161127; x=1789765927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        b=jcQhyLeWxLbT8BF8/JDzmtc4Nxoo5VoIMolSUD5qmypiCIAbGncTXAr+ieq5d2SyvV
         J/P1b9TSq3uIBTej3l8QNWi0nmTe073lRzun0V3bciVft3WOOnYNSDTI89sims70GKw8
         0GsIXiNi4t7zfDSN3WEN4iXczHPOfRizY284nXYGdFPmmHG1Sy66RpoLeXahuz1b/G8t
         IB/Jo00gpQop0ekXy2Tk4PLs3IKzl9F8CPetawDrdyHb19C559z/VwUvtVMhGpaUAI/C
         HrVj6bMes3iIh0UOtvvycz1AyFtqGkB65pYO6AH+9NNRLO1oANishsi9D4OTNTeAZ72v
         zmGA==
X-Forwarded-Encrypted: i=1; AKwUvBzotjvXgOZf6dApLwvLsDuYHxnUxT4XCe3KYu5K/sOU4gJbdW7emWcEmi8O62YlVdE8vsvLzi7Uifl8k9o=@vger.kernel.org
X-Gm-Message-State: AFuF++kLTyA3nUP8q43YjWV9alt/nB4VumPL8H49aJ6ZQSpywvqfU6Ci
	5ap3q8u5PciXq/qye2Fefz13mxA460QE2qNxtufFR1eSi6KliY72WvYOLzKxC8N4+00TciT4i0N
	vhdI4D2v1duz2vP1JjeDDxW1YSlrbVvS+NYyHxRjv
X-Gm-Gg: AYBFou108T5BKsStLUfgvKX60sWIAT+CClrCrnfsd/X92of0BciiURVNzx5sllt58p0
	UsZQo5a+YqRODFWN0rx+8wopgRVl0V9u8IdBTgthEmHZZG6+ruu432YdzAUsKLRbpbzEsE0UEBZ
	WVBAVOq7SxCtJML5fKTC3+a5ZK/hVfB+3lpOeZHMJTIt3uTvj2AkLKoYtg+SbBOQlHynw1wuHWk
	6Aq1uokD+XWX0WoqB+kFM1zPApOEE0jadhl1a82QDmMJzJvscfj/SjbG4A1ajhb2GNpqMZELkPI
	BYWOvesdCPShsFs3jab4gqGWdfzAIdN/r0Rd8VJB76/BlBwbVdF3eiRG+jTBOpkmd/zIJAThc3R
	sofFmzkSIoqLSw+9G4uoa
X-Received: by 2002:a17:907:9619:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c29667578e3mr499344966b.21.1789161126322; Fri, 11 Sep 2026
 14:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev>
 <20260821050507.2161607-5-shakeel.butt@linux.dev> <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
 <aqRWuffGKczUhegT@linux.dev>
In-Reply-To: <aqRWuffGKczUhegT@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 14:11:53 -0700
X-Gm-Features: AcwNN1Wh4xneWSvMXksn88XWYdkFKLDPGlOSXkSUkMRqjCCaU4JFTl4RQoJGSwA
Message-ID: <CAB=BE-SjW76gWr0kZcPnEjXOwt90vCV0TJeFuYEGV1Kt4Y1HWw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Hi Sandeep, thanks for the report. Do you have a reproducer? If yes, can you
> reproduce with this series?
>
Hi Shakeel,
No luck with the reproducer yet, and reports have been sporadic.

> I think first we need a real reproducer before considering anything. I would not
> add a check unless we have proof that it is really needed.

Ok, I understand. Do you have any opinion on the suspected call chain
which makes dentry->d_inode = NULL; ?
Partner report said it happens under memory pressure, and userspace
component was reading the CMA stats through
sysfs [1]. So I naturally looked at the shrinker and suspected that
call chain, which made sense for my 6.12 kernel call stack.

Thanks,
Sandeep.
[1] https://cs.android.com/android/platform/superproject/+/android-latest-release:system/memory/libmeminfo/sysmeminfo.cpp;l=545?q=sysme&ss=android%2Fplatform%2Fsuperproject
