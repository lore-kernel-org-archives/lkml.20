Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67B42467C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636157; cv=none; b=N3WmxIT23PWIyBFtS0mlUNdHbUY/LIVDMDUyTGM3GsiXSq6NuBXeI/l05VDpXavZrXBEkwL/qJgheg0haKfs2O0wDH0HBqy3GeG2K2yK0JWxDVEURJadvSvWszF5UR3xEcTYn/OMolmPAZh19jw8ZmQPwLQbEb6ER8CBiuTO7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636157; c=relaxed/simple;
	bh=PQDt1XaKTC1h9sbD77fplyrZ/Oe6k/+/kSAL32fFrTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoZDVIk0k84iJIxK2tab8Dih89icJQXGGvw7YfZkVDdhRSu3BfO6omdPbHZOBjjcXbDOTzKpLcScG6APl86i7xCzpFcSwKGcQU1wxokMrsYwD0Q+idFa6QtWSKarTtarIKXBgTBBV/X67tXS58k7RPR4rePnEW2DBCPadC0xXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJbp786W; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJbp786W"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so73315ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789636155; x=1790240955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bl4na25ImFlgUs3EGPMSbVVxr6MK/JC4biDbFTTDRp0=;
        b=PJbp786WoQwDJ/4SAKDvjO4dHZM5a51+jku1m3tCYgEJUj1/K+SpnEIfmb5ueH0DlV
         5chWqy77ehLCPKGzM8dYAZ6guwpWz3m5PzBY7cShj0GSVNqtzOODOE4NuYCuf60z0eE9
         bATsDGASmdd7T2pU7KBl6EsPWS9lyjJ7nDhDMHm8qKq5VMWWLuncJMm92wkcDQUgCPhS
         XqJoYMK2QlRiLcwZ1aieOtdD4vOg6iZlR172IjFWawr8ZunyTIC3SZECmlSJ/s3n5z0H
         kvDpVFr9MgCzUFga8rOj46k/jTZuM+z+ALv/oth1G0SyZ9Uw6ktv5eHCnmUKyE782Wua
         g2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636155; x=1790240955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl4na25ImFlgUs3EGPMSbVVxr6MK/JC4biDbFTTDRp0=;
        b=Ixb7ypzqb00L6TLBlkCVLF6hpb3UCiPac0XkNFMBl1RdXOfTPEz3KIUp8pd/XlXSJQ
         6SMnT0oEV5FvfasayB2Lqyx4H7drmaxzzYcTw12e2+lGA0E2qrnGW5TpcHOy7/DM1Dui
         s9IkIejRc6R+HG/1UQEndGhNlXz+lDaGO66OVo5QYtJYgvsaM8icSD4MCdHcphH+uamQ
         l7b0w3p9V3j9BKBRf443QTT0y6zq5NvWcT2WnNcieSADvvs16zodFnF4hCo2tbd/E6wZ
         wSqu4KY8iFPZQutVlTowYg7DU2MzjfS5O6g/31wjBwLVBvVZJ313OZuBUR263BxY9t7G
         AHNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAjKnPylcoknWNjX5bin2Xh/sc8+4kcQbv4OgzMqMb60OkmKCQhculCIK4JmwxDi6CyG5iCFSGZml0OY8=@vger.kernel.org
X-Gm-Message-State: AFuF++m84daynNlJyP0X5k+pilwn0pC2xrlMi2xEF2Be6b2psdfjkAWI
	oZ7K42E1pJIOSRnhLram7zYo7Ok02Vp91WhNFzyjdHYuDaV60o79wcBVwzn7HbG/dQ==
X-Gm-Gg: AYBFou07As+zpWVBbp/gBB99YGbhMmHuIuxJEKWL7YiWMjoyCk/ytytD9FFC0leGrCY
	NEnNV83qL0KPQo5wxIq0DvpOyU+dAutQdP8Jg1lFewuwk1w1pBy71TxT0CRJer/5ZKFblnxMH2h
	qXEFC8AIS6eRXEFSQ7FIipdQfGO1teAyTlow8KzeiBnw4PtVMBjpLUbSWGWtkJItrxTfVzkoeLH
	zzOIagFakb6WHQPovS/cPsmNFgJJXmqLQFOFYe+m+69SkhFrC38Z0MSpri/Tk632/bF7ScLSUg0
	ryXhXSazXCnSXSSDvYsmRvKnPFjcObXpUHhMO/x/6+CUD0v/fCoPFcw3qPdrRyH0NlMMqaGZmT/
	5cbNHDPBxNnsNTKYExYdH0ehvRE+KBV/E8dbEM7Ea+p2gW8yrJOLUDPqGzmao9adqROJ/d0CsdZ
	FZTqWhqNeNVW51aU729rukiN8Yr7YLCZCMVQwP3Hpgkkp42NpnXFBELOlw3nj+02co+nwgu1Ou4
	zxQJaRZB81R2Zr8xyhzjyjCStO10YcTOxVA/z7uKVU4QcejoL+OLaGDyQeZmdQ0s7Ij+cWl1pdQ
	2NEu768vU/LMG8M=
X-Received: by 2002:a17:903:2a86:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2dd9d3f894fmr5650455ad.8.1789636154526;
        Thu, 17 Sep 2026 02:09:14 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edf8e3sm23423915ad.45.2026.09.17.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:09:13 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:09:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tkjos@android.com, aliceryhl@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] binder: Fix up Kconfig dependancy due to removal of
 .c code
Message-ID: <aquuL7LgSwc4ySbG@google.com>
References: <2026091743-pony-prewar-735b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091743-pony-prewar-735b@gregkh>

On Thu, Sep 17, 2026 at 09:46:44AM +0100, Greg Kroah-Hartman wrote:
> When the .c binder code was removed, building the kernel if the rust
> binder code was enabled, will cause the binder to not be built at all as
> the option changed from .c to .rs which is probably not what the
> original build wanted.

The idea was to avoid silently dropping CONFIG_ANDROID_BINDER_IPC, but I
hadn't thought about this use case you mention. I agree it's better to
keep things explicit as _RUST.

> 
> Fix this up by renaming the option back to the _RUST version.  If in the
> future, that suffix wants to be dropped, we can do so and then it will
> be prompted for a choice again, but for this release cycle, it should
> stay as-is.
> 
> Fixes: binder: rm -f binder.c
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Worked for me, I found no regressions. Thanks!

Tested-by: Carlos Llamas <cmllamas@google.com>
