Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3823DDB1F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171468; cv=pass; b=h3GhKjlH05VBAEW1AhC3534ThtLZKov7D2PWZ3TyLmekCLweIMb1mpSjZvqaxFEh4HACs19KGPdX2Uic01N6EHdW0xuaPepTtB7xuEhoHDo+m2i76iA3/kUCmqWzhdU6uc6Tcl+b5rULyVk46oxHCqObZdxSAxkeSjzU2DZyBFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171468; c=relaxed/simple;
	bh=VQTKDVvDsPr390eFVd0RHXRO8Y8hCAK6QWLmr2wqQ7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoV3EKV7rCVvdmxFi/WC0IRTeWbpz+PfWIDWZFiXYNreYpECBpMBw6MUvYAvVIVUrhs1tpWQjjYuOn2p+icGFd2cNr3urkO/A5SrW45+H4gsl6nCG+e3+rnpY2UoD59eNsxreYQ5Hs2xNxeLbKU8XEOCdz8P+Ru151L/kocSu+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6uVSgGH; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6uVSgGH"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2885585a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788171466; cv=none;
        d=google.com; s=arc-20260327;
        b=MnVOT+MUF9+BaA01cSMD3m4M59xbJ0g3TkItJScDZVqRg1WbMPS4EUCT+WYzXoeQIe
         r7n5nfJe8PKYusq1J8TBcfBxUC7FRzfBs335fenH95/LpmcE3STUzH44xk0jnC7k7Uqk
         WQodoMLHgRFxy++JmCSEo/NvL0wc88VvJ6E1zfdjv+/8GckrErneXS5GYd7C4+t83aTO
         OPuHQOwpWnYke5yyLzMWwLVMyq0vGSGhJj2wgrTrHW1LUfsIDvAbrJSNenhCw+xknnAw
         HIKRfxk9zV2vtFYozAIH9MkpoxIjxw1WKMZyzmHnhHgfdULBlrDp7Q9jIebh3OAVbFdA
         w7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VQTKDVvDsPr390eFVd0RHXRO8Y8hCAK6QWLmr2wqQ7Y=;
        fh=ZlUVx4ZatLdhmrrz0A1ugOMRuZPxGDn7xAgR6YoOlwU=;
        b=Qa1mOFQfVM6f0lclNF36b+Et/n8P97Re3Bwjj67SdkQ9eoo3NV7h7b7bgR4iCUwl0N
         vp28K/RJNbgLqchi7ORPANnbKJ6W9k1CP48oAQFaQ746IP3WKOV1tqmE+Jq7pusZOWji
         +WIas97OrV+jjNM8mFo9qK4ltTop0G35qN8lwroXUfrl35lFlIFQ8Xn5sL3yI6VrAbMZ
         m2QN+THDxo0MkMoZpMNM6PLEKmVV30s34AVnGohEGNtA8exgXa0hInRFaLVBP0rxtWgc
         hK1DPhAwtjXyEaVu3z5rwanqn5zDGyTTvUm78hb3Zhx5GNfOF28ey5EkQxAy5eiTSdJA
         WhRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171466; x=1788776266; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQTKDVvDsPr390eFVd0RHXRO8Y8hCAK6QWLmr2wqQ7Y=;
        b=l6uVSgGHY9iXDSF8e0gSr5kBC/MoxoQLUSG2E+KoV52eFLiYZLlktd8flapMN3/VUv
         deG+OLycvtSjQmiOwZSL6CEqIOUfuolO7EeRx0wZYhbH0rnQfDtQIsKuwL7LgAWdi5o+
         p4m4FDvXkWB6yFBqbr4+dBauRAear47wT2pnPQkX5ZHokk9dPUaIvQiN4OA/6C0S2n7f
         l+dg+X67PD9DN+g+N/UDW9YE5aAaAu2yKBNPLA/rNXSXSMHM0yyzn6Y+ylwnXqCCOl4L
         bJqdq0lxyqeKYTcKZoTycDu0OaraEYgpgY6PobIGpunABv55dmFp4OWchtX0Al1Yvs7N
         df7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171466; x=1788776266;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQTKDVvDsPr390eFVd0RHXRO8Y8hCAK6QWLmr2wqQ7Y=;
        b=qXK15Up29ztPhLfuuLnhzRzG/RbrixZUxIDW6dDtc21M2yaxY85CZ1BVISIICBpIIf
         MUoKAstbVy5wYXi2iiYQaYjckw1vJnFZdkUlghtK84fTf6SmEgnd8Fh7jOPQfNADkT/B
         A+LlDhmPvSklWnsazZo7AK8iaICqRVbqHBybD98jvx/SodmR1Qk07mYl71HzkHggalHU
         H30Isb1h9JRQUcmME6GA1kv456+XGSHOITQAE1xrMc4pttFfFFDn/i4MAZV2kpn3NWe9
         /ZobiaDBKMtKXaG2TG5Tm2SXP65hra1Q0Cm1v2VXjhSdXKObiLUmU7Nv6IbrxTnIB0Fk
         Qacg==
X-Forwarded-Encrypted: i=1; AKwUvByiSWwj6GNTyGRBd60ACph+G+cDVuxglQVJL7VAm947AwaSUfGNeUVeIuBmLUmoUTyJcPpf2R+z/9hJkZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nfp9TQpFMofwIMcEUCPLR19cNP40DDl8UzWQ6URM1XVaJqLjLg
	TwB/bbxWd8qFkI/brHjZ0BALM4+iQ103rxYfTiXlx0QqwUTBb8oZ8k0NI+MI/GVReuU/SdCMFJM
	AVGHi2UPmFDrLe7UUjOttdFBPnYsHvr4=
X-Gm-Gg: AYBFou0fIgfHXZOvx7If3wS/Ul5iRQmk1nyRtw47fShzHNk29HRidyyZNdpdwcZjtM/
	KoT1mmbmwCnAKa+xT3x6ptIQlFAg8+F7cBnoDSKovl4RI2CMLixcnlRsabpQloWGsdcKnadM6oZ
	On8enRrxB6XpV0bx3SNesnK8GLZvbSOQteZ6n/Gh+XRr8vlFmO6miOy3J2LohcY6nvM3YtpX8NV
	FUOn98Fo4t7VZGrXpL/EewsPhyoDKnLRPCS6TOWj7yG0nVEGX/k540WU70WT4t02SRkt2+Jz7EJ
	yeEjhRFmRGKh+35simkeCBoeEHYE7hzbJFAdCLGbvMFHTQ==
X-Received: by 2002:a17:90a:e70c:b0:398:9be8:ea68 with SMTP id
 98e67ed59e1d1-398f86c8470mr3621002a91.21.1788171466470; Mon, 31 Aug 2026
 03:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831085217.391-1-strst.gs@gmail.com> <CAOiHx=md28_BmsDOsNDp0XbUpfih=P+-+aDYb6tiWPJTCu1drg@mail.gmail.com>
In-Reply-To: <CAOiHx=md28_BmsDOsNDp0XbUpfih=P+-+aDYb6tiWPJTCu1drg@mail.gmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Mon, 31 Aug 2026 13:17:35 +0300
X-Gm-Features: AcwNN1WvGkdBpsPub4-3MErmFB3mqxt43hKt4ol6YxN8L_iUqUyc5DLBohOg7uM
Message-ID: <CAAsRjRktqEx+-CLDO_q6rLUBe1dtRQPH1NkX4xy7ichx79yGPQ@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] net: dsa: b53: fix 8021q uppers on standalone ports
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	vladimir.oltean@nxp.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonas,

On Mon, Aug 31, 2026 at 12:34 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> I really think we should just fix up the in-tree device trees and then
> complain loudly about the broken configuration on probe in case there
> are out of tree device trees with the broken configuration.

I agree, fixing this up in the device tree is the more robust way.
In the meantime OpenWrt can carry these patches as a band aid for
the affected boards.

Best regards,
Semih
