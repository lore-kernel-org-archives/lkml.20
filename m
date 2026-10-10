Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E42D238F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596773; cv=pass; b=VWX/JNojfgS/e70uZQnZovx0tk5iFFiP3uhG3hKXIt1KRZkpfptC6EeP71AbzeaKIaM6ibEKB8F9wjz0mWIaIx/2M2LKiWaxsHtJA4ANTwB8iCAzOgAK3iOOZ5gr3BlNagSq9HAnpdEmCwXPSNio37ckQz0X/LaoD46jOEYLxw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596773; c=relaxed/simple;
	bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAMOu6+D1g5mAsKKY4hTcrXXAv22Zq4OdoyeO4ng9Zuj/w0cNJp3xHWS6qvw5eB1SKLYUKrFiJ6RvPQzKQpEWRXrIxH1Nuuv1wTOJT3W+h7iHX+2u7dlVqolbLbLZ8BkYSffCvfE/HWEScHDdWEnu+akycG9GqFCNvWQNt4RLdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVdCo4u8; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVdCo4u8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso159943e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596770; cv=none;
        d=google.com; s=arc-20260327;
        b=j6xHw4qNRb0k+5wXz4/2LT8Vv+cZr9K82S0irTDYk/Cqd00+NqNoPFsCJwLal5lMnS
         W3QsIdsqXs7zBjk80huKqDd6GRhFIT7te2KFcWs0PDMH2991xwN7wHEF3f3R7wMiQmiK
         S3JG5mR6RaD0mF39ZzYoHczuXWNtmiJXsUXbwTP/dM5qtHy8b1zlOm2+T15mfKWheZkC
         wUbUbLwQ+S5PNtjlkwrJZxXNXTH27AZXbRHUFwk8nXD+CMefkkBHoOVBZ3otADApxAD9
         tbDfH6jbBMBDIT1ZLRb6UpAGMDO/BzzrgMywQdtvZYKHq+m/pqXCHyQLO7rAtCgB7aVW
         ExRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        fh=lG1BrU4fw7fs9I7a7LwpwuZceFEQ98oMd1o9/VSRkFg=;
        b=SxwT/GB+sGiMffGw5OOb3w6SHiCStCy30Ujncci+v29ZZQAt+swnRGfhVJdlxglt3L
         CA89bEacEHCELQl2fhBdvdPg970c1z+Kwfzzce+uN6p/8ApBTcv0MxZd6yNU7j/WXKET
         1aNYAjsToMmeayZ6PRSloFtUyswpt9qKqbCDzDv78ohroLYoNMZ1c316XXlTcC83L/Kx
         uv2gEyVJl5BQ/H6SZsMFKD+uZM/nEZ88c4ILENOFb4+4/L5vMQkUDs+l2scVx994L3ne
         LTB/cOYH2lB1yeQEyvvagIWR/CBy0mi5uM3QkSxwC1+2eraLjqMV9CfNzD6LsCNTIhIs
         by8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596770; x=1792201570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        b=VVdCo4u8lNMoN5y5hi2wgx9fzHWOiUIuM3F8czMvMT/9qzRd9p7+Vb8pXbum7o74oL
         ULo0B42crYhsCh+wK7DJRr2VnspYKCBVUBxZYdjcnpj56iZaxNezJCuw/LNw1TtOHs9W
         U8yf8/kq6/nEClkcUPva2iU2Ib0Ljgb7PUXB86856W0g39rGee3diwywCVOJk4yu4IX/
         4XkKRDWJIERvxXQhZQ2duicNl63Ukdqh1gIwIUKehjsiID7FjCc4gamRSalgX3cJWi9T
         IVGJVEhXFBIbREq7NF4bGZNpBEsUBrMyLD2/yMEFVMTR3IJC09xsnsQ+1A9FVgXylFAl
         3E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596770; x=1792201570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUBGV7gQYrT1z4A/44wQ0mosAmY32DJ6LbBMbzHaRsE=;
        b=Q8a3uXUwlCoKA3GfSTGzywXxyAP+e7ijyTAj8mvyFmzCTvovuqFdt16KxkpWqGPKd3
         0K8gcvrYkaPhUvSI3DvxV+lF3dls+ef2sAUOyXdJFYxyYgb3kMiMmHtZyjxoeqV3ILdD
         oYjNH4glIPsQVRjAdH9HJMWGn+pw+uZDgwBwpsHC28S68yaH2GsS0q2+nWVjHLAN/8IL
         0cDfIIK70d7oVE/gZA5znb8qUFY+7OIdcZ+cJcQ7ygrJ+j4EopuXmHOibwsARCtd8HKN
         UNc/8plB91nQMFMUJ5ntuTeIyN+HkJI073N4RdSBFZS88e79QF2/Ud1vtT/4G4BIyetm
         ohIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHGRo8rxtw7+V+TETf2bXTbbqqGvlSAELvdvUzuZyBwwS1CjRBbHPhRi32kFOIyjjpjmWbvKptFh8/lOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDQ2YUd9ICnVLIc3MrqVeMMuFSdlWs+6IbJ2SdLwY4/xjyeFc
	uYT+K2/huVVeobbd92djXItUVZGoIuy+4TO7fzK+OL5zq0QFWV3MKHrhI19OsHE1KlTfdS8Ro9T
	ayIgT8RPzudV58//ytdg3MaCh+p4t6qJsKQ==
X-Gm-Gg: AYBFou36YVO3c3Vu6Fna/TTkSQuzKdAmLL+xAf91CogHgTTx7m63RLZwIikYxD6mdGz
	B2EKaPtN1h5b5WSz/tr+zI4Wr79vzZnMUiMqonMOeoHdmyHtatRwUSR2DaZGTcsBSeL2Jj0MLme
	NfEAl13ukX9pFTmJGgfzdWprTIPKDtiVLvCSvvdligalJ29w11qBaZUlQnOQjxpMK7HeHwNfDfa
	7WrNKB0vp/gB+oc2R36Qih4RUV9jjrfhgqWd3jWYvszG2h9PPiodAW0LsLMT0KqgeREXJ6nNogG
	Uk+rgCNbsT4/DEyUISkKu1gWNnKFRitYp3qqCmG6tzGPMI3k9Q/AF14YpLGU+zNfiC60pYURp2P
	sfuzFh8UG8DVcUPN1Nb9BfhZiS7meecVHDIk/ydXGM9NPvU9RGHdJJaBqsaOExj43FFIjiwiOVn
	JVPjnNbvs=
X-Received: by 2002:a05:6512:3b1e:b0:5b8:bc5e:b581 with SMTP id
 2adb3069b0e04-5bcde8dbe97mr1235113e87.57.1791596770245; Fri, 09 Oct 2026
 18:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
In-Reply-To: <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:45:56 -0400
X-Gm-Features: AclHuK8_CHtU2t0FMjZSmjF1qQc6K5v8rQxL-MEck0HVwNu1xAD776pN5tU19So
Message-ID: <CAEdQ38FwB0Q-4RTJr6tK2c4H1Bdgeeb-qJ7k9EOA9Z6ViUBFkA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:42=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> On Fri, Oct 09, 2026 at 11:03:45PM +0200, Magnus Lindholm wrote:
> > Changes since v3:
>
> All three things I asked for in v3 are here. Compile-tested SMP and UP
> at each commit, nothing run on hardware yet.
>
> Patches 1 and 3-8 have a Message-ID: trailer pointing at the previous
> posting, I assume from git am -m. Please drop those when you apply.
>
> Two changelog leftovers, neither worth a v5:
>
> 3/8 still says "the prerequisite direct-switch fix". That is patch 1
> of this series now.
>
> 4/8 has a short line in the first paragraph ("This CPU may still").

I should add, the whole series is

Reviewed-by: Matt Turner <mattst88@gmail.com>
