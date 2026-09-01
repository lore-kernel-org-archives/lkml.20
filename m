Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FD47CA8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282395; cv=pass; b=psz6iB6RftqeA1sLmaCYzqX17TwqFZs7xvzPnYR6K/5Autz2GNUuhQmopjaDorhVberFCAmBbT/aM3ZMd3pqE7Pt9Wfx4Iv0RpNrBtt3LaS5joq7VrZqN6qMaVj9bfkl3eL3brW4y4Hdndj4RyjpfNpJAKPLhfvnFhIM/Hiamj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282395; c=relaxed/simple;
	bh=ycdTyrPhQXUQ/I2b8OalvQWSSmxwee6XBnK8rkMIcmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1YlzEdNysyg85uUFrs4EsfGCHDsuLt9shdQA6iks/B6cNSU8Tu3F6OlxLmm/K2FQVQuBD/wg4EU6fPPIulzv/LKWo2SymPbaqY4X1ck99rdUv+y+NQ3AijLHD4RRsxwW/GAfkeNAlG1qMDZKOELaDZbvpW4iaET4Mm1ALNJV98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/AxyBc8; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/AxyBc8"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a309f92daaso498481fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788282392; cv=none;
        d=google.com; s=arc-20260327;
        b=jSRqBhNWrkxiS/NIYd/OktwPxN87l4Js3Sjyn3rzT8PcD+JpX+iTBp4dSL7773kZDf
         nXwrDAKNfg1T+cCzrMu1vhSnpSVfWRKVZajwDyIJwTvycVQYf16ZRiZoT3Zrtok5zjGG
         Gf8ZDxzzuYv7l5ebU4+msgIYIE3mDFCQIcEdcxmwsZwP9GnAYjYqHwmWDGdWcu/EyfYa
         ZOiHl3SOTDo2jIl7T8OR9BS2S06e4t+wg9bSaSTMM2Puc+MvFcRA1Xe0P53OfE/U5/vR
         6s3SWliS50Oyibwl+9D1nnLbW+2vHn4Qx/zKID2WIMXKsJ3jpYXoaeN5hDUj0ofvt2GT
         d3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f9MytIosFGt48eG5TjVcHQFGCzHmoJqgK7bwlJqaSz4=;
        fh=h3CIaLX5MiqLEkAbfD1DyDRJ77N8WHLOHcs+78+knRc=;
        b=mgoQV89J/X362qQOgOMptf8iRmZJx+rxEbkkj8Ltqdn+gZX0uy2oQTera8QrB9B8mw
         ZGGHbBkuN9sHIxJnsuNm0OGOEDfdXsVm+lcpyX+i1jVXXnSkSYv599ERCkY/w3XSUsTi
         qf0+8Vjq32yVr4lKLyutV1zbtU3fSu3bqWjyfr9apfCPHHFFG2Ck39SqZTrFP9b1CAyf
         c8mF45B8c4PEherjTg4ULiTbDaJ0RwQqTaYen2mcr7zsVDl7mmBvD5Ka3/SRMPA8qaxN
         qQpJ1exVBJiapBwUlNDVRCUNDJ0FDWFc7wixWKLMUjKvZLEKRgiHuX/bKxMhAPNdDvuV
         XgGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282392; x=1788887192; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9MytIosFGt48eG5TjVcHQFGCzHmoJqgK7bwlJqaSz4=;
        b=Z/AxyBc8jeGqIb2sH/Dt36aKBFXTBEKvcweBrysqomwkOaAT4GgaSxcYyf7BjSKuSO
         q4H0LtRk04GMzF4qDlacp65IVjQTjZ/jdsKmBHJCEjS56Na9+cUtBH29U3mtwBI5xJfl
         dP7z/+tGs3Ztz53notsTGeaHwXEIhxz683TmggCeejU50+61DIlKAYQeBvqKuUCiCVRz
         ONnEYZNudyx16ekHJ1D5dCSJ0lpG31czO0eXlCIjgC3lrUhlHPXsg9utwc0MT2USKdt0
         0Njb0pA/Ha6Lx+HlrhypFrUGIcV8xw4NM/3qMa2ogUCQTe0x778c/yL/qd3WTYG550hb
         DeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282392; x=1788887192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f9MytIosFGt48eG5TjVcHQFGCzHmoJqgK7bwlJqaSz4=;
        b=VnTkAWxbnX7BfPQc6+WPNgoAX+1WBzWOTEvGA1OmKsY96pXZ3ip/GZAobmLwMoB426
         fMfHfAsN/aPPKJd7gZROpiGLP0nvGE8xJTWixIqooFcPKz2DkJekdenQlzOjE8+GkPHS
         Us7QZTp/9Uo0mMkmD7grge2+G8yPytnycEI6IDqa1WKZpaIl01sB4kaVuGpEF2acSfO1
         cfDhQZwXm1bGkayvkf0pwtazKXG6Lnw4WE+Zdw9Xsys46YQEBEUVkwZDmxxpBQIu5Zz6
         4xN87om0uHlCwg1jAyO1i9IndrbHkx61fyAXdYsr6AECamDmPwC3BXUXll/MPaomQiOL
         vu2Q==
X-Forwarded-Encrypted: i=1; AKwUvByTfIBdy3/WzJ8e7fBMk7YByasHcAdzrs2yG+Cl0dKoOIqliQnoBh3cJVUnLDWX63heO588gL7TpXFCu6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lhAs3ulyOOUc9yzaEZSn9ZuSxMpsMPN/5BbGly9GaEpYVtnKR3
	wh13t02bO/Eo9LXZqRrTAVVQSsfdM10UHGRilRBBBSq1wcuply4xzsTdavnQ3mVSjqPfyFzmKLk
	NqA8sQXUk5afCIQuVEXcdYR1CipemlRTqul2Aer8=
X-Gm-Gg: AYBFou0JSuZ3fFNfkQawuY3NaAi21i7IWsrKnJ9hWepyhTa5GHMkv3VVDxM6C49rFCw
	Hdk0Y7dwglOCb+CXyMBTQCQ6rVxmewO3iqRhyMNzSBLyaZ74TJ/xL1d0yXO+HDoY0j6jewTzsey
	heWWu1B1crfwHYRrK7RkNgnOSY5V5KyZay2cjkqgtUggLkxeexy2WQCACJjClg42mPRg5EnUO3+
	fwNi+a9TTID4uZ8hG74i8hi0zr8VVNESqwpaQzga3N3Dx5Wx9XQzjJPr4BnQICtrxjXqqJYh7GK
	cL+IB+5+ko8O1TWzK3I6J/oDRa9KvW4+WfgVt4PDgZeqmN6UNBL7cRp66QCNg+zG+YxBDcC0wib
	p
X-Received: by 2002:a2e:be11:0:b0:3a1:9562:732 with SMTP id
 38308e7fff4ca-3a30187d050mr71354831fa.1.1788282390447; Tue, 01 Sep 2026
 10:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788222001.git.mradityadash@gmail.com> <49b6e07395d2fe555e844758bd8ccf34ac0cbf0c.1788222001.git.mradityadash@gmail.com>
 <CAFqHKT=7xMJAvTt3__6CtBiS2duGu6eoHq4FWiGONMvjFE2CtA@mail.gmail.com>
In-Reply-To: <CAFqHKT=7xMJAvTt3__6CtBiS2duGu6eoHq4FWiGONMvjFE2CtA@mail.gmail.com>
From: Aditya <mradityadash@gmail.com>
Date: Tue, 1 Sep 2026 22:36:18 +0530
X-Gm-Features: AcwNN1VAAVCVwHi7cXEvli_7Pxy4HhQ7XleJWQRFpTT4Vki9EhB5WF0xAtt5n-w
Message-ID: <CAH7J6R-Vh7uEtG=+Shj0CVgxm1RNpuxjuEmNfLJevhTmCz_3Cg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] HID: hid-lenovo-go: normalize calibration failure status
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Derek,

Just to clarify, this behaviour was seen when sending a left
calibration joystick stop command when no calibration was
being performed.

Sending a respective start command returns after 10 seconds
with the error codes you have provided.

Here are the exact requests and responses. Consider ellipsis
to mean that the rest of it is zeros:

Left joystick calibration start:
Request:
    05 00 0c 04 03 01 ...
Response (after 10s, no movement):
    04 00 a0 02 03 02 02 07 ...

Left joystick calibration stop (when no calibration is running):
Request:
    05 00 0c 04 03 02 ...
Response (this is near immediate):
    04 00 a0 02 03 02 08 00 ...

Thanks,
Aditya
