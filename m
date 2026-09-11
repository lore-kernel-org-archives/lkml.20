Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636847728F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132908; cv=pass; b=QxqFo0e5gLMhm1b2WvemNvT2NxTs5ubJ/kM3yV9AAXMZqjigZh7EabHkCEZ33xvngnCqcEP8+bq5ZBBFOLNI9QK32DGp1FApHiKXX7I1wX238H5C1DGpzB/EFpEptZBOdP725LAbDG6dGCJM9+VDWsGb5qIq3PJb9vlELTun5sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132908; c=relaxed/simple;
	bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQUneO0ax1qArREUbFOhhYB1MqMF/hZANTBponGNGR0OFwoO7oe/LO2Q3uFaugg0E0gSMFQDMydBGEs3PjUxGwm4MfCjQJUvpgjvZ0tWmmo2Ly6O6eEaamH9LwnF2JNbzUb+DyuBLQoYbr3QHaC2JjdPR5GQhpCrShpHFKBrhr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP8T2clZ; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP8T2clZ"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-478622cd851so386854fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789132905; cv=none;
        d=google.com; s=arc-20260327;
        b=Ki/e3/riAr+iQxJhv7VoUFH0JzoFCILFM/E26O/sxeNvJnFcDDSaQUJqxHl4hF0DIb
         /PPuxQGpz+1UvFD2ECOf/snGpF7sBkfCHziJdT0vmuVaDz8hRZFIFLn38PNctTiRrH1X
         BYVpdI1Z+bfrgRyYz2Upl/KC0KZzmJ6TLQF8SL3uADF5bOPpybwAUay4FENXx607GBJg
         0PJ0N315bDta31S391ey5sYlhiqfts+7QAMhn02CJBjPlZBFEhlvLWrXGcPj/xyERVTm
         7YsLPLMJD5tD0SZ1QumIssXzXat6Nfv/YjpbEg9dWzLd7IEOdiwR4fXG5W7nZpY91eAi
         bg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        fh=u+4rbO31r/RRJp+rMCTe33IhdNzWcpxAo4+T/rUCHnc=;
        b=fx06NZZmSKEImE8d3EVY2GbYz3bHLRydV4h+ca0wNRpaaF7Fh+aFTeb+ODh21PJ0lC
         wRBA4BknrjXA3hJUR4b5wji05Ih0xEC/dm8nSyzHpdHhx5lcMuuenmSqezkdniQ8gBNz
         Ofq6P1f0fWtB6uqo5nnhFjwHPhHEBUT/9XwZoKr2hgBnLazuDhiub309AYZFfEZEGTW8
         j5IUT7t6+g2hpoNzuDAiDvEkkj1BI6/0iRkJR+Yc4uCS8/XYiphsvC/eUJSdsOiUjlBt
         FWbbDHMYaoSaswmfICWPyl/zgJg5hN7/r8lh4QObfjaQUKz+Cd/11KZb1fFqkkgLLzMg
         0ZuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789132905; x=1789737705; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        b=DP8T2clZDChX8ueDK9UJNf50GY+zepjIWDaySeeaSPEqSM9rCOIaOvPrdl8Hu9nGDN
         CD4M83bIRrmxEhZSLMcAJXHuxO8P3TxRmdCGreE//i2HN3QebyILDZYFH/4zIps/OOfP
         GnZnslNjZz3+7olfFCslrvWH6vtGBlm9evBdCZrKNtGKESsK2Lwgt2MemiwbFEfUv5ib
         9j0Sv7THzNS+MUSBZ3bBrAslGUVE1oaYRiPf44iFyGgG0fBGaRzrAsyLnJMCE8dfae20
         Ch4usIpe3SKuzKE7WSyIxqz3ukcb2mVww3c4BPdkZ5n5BiRjgMO8RbQKa0tPeLa1mRIM
         LsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132905; x=1789737705;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        b=NTYuihXQ2Sopvyl++gEfSYc+8MyX6lnwnIuxAvs9EkDXEB4g5daOw+jL3zfdryPnE5
         BDK0AjVu3VVcg7VcGWnP5DlY7BDX0hFXRj5LfS0SVCeswUf1Yuk6whC2lR6rJLV8UkQO
         95FJ2UZsMOK4JpNKNdI7BKYfwZ0vGkIRYNNMkwuQwRVW/Hya4nEkGwqMmqUwn6r0MstU
         o55Ds4fgflpeegqkEJ0wU+e52Alqzw+uDucg7TPpmZE16rjzXMn315FuPCJjVetg5Amr
         5u1Tck2xr4ai+kTSn9/r/Sm7qciglMu+w97arwQhflCnGg5OIBZa9bkz1/Ok0v0gHuMO
         YSOw==
X-Forwarded-Encrypted: i=1; AKwUvBw8A/w1LRm3xJwM3BUb7I/Iq6ci7pr/+mkIePhcja0NQsKHswXTyc7O5RBcuL/NQ79fPkpbQuoutJ7Y87o=@vger.kernel.org
X-Gm-Message-State: AFuF++miU1TtZRWaZRxd2ya/saZdQB2GnX3yzFF7HjWglI6ZvO17I/IV
	U7TcldzanCsl6A3Dk9tgLKDw4E+eJVktbqmjaYHNBeilGQm6Rq150eJT6AdcoeHweLsdX805uYO
	XPlFQDnvDXMLSrN2mKkDHCzu/SVfPZdM=
X-Gm-Gg: AYBFou3S1gyzbaX1fme3bDIYW6eHmpIsBSuoKt74lFHH9uUyBbKbukWNVvb3u7YQEgO
	2+bNlQZElbxWqufzArzZjqzh4XHCHZ73VBTlMxmmc+pUGi8To+0Uep1cPczg9pGjb2FEz8Lk0Gu
	xORezH5LdW2PUslDl/pS6FmFRAO1BtIkMf8zCumSDg+WuqAdq0d/GrjtXGLx0FRLmpFcK41T/Hr
	owsLDrpeNFoWBEhW6JYusbcGnznd/WTRJnBdqpU658e1gFpZxO1T67vYNXdnvX+cf/OTLjdrrrI
	gZVCjEWLmAOcltmcywhz4eWXub/+P4h5lhDMOQuNTIkcbFcdfEmu8v56iOUCWkiACxY=
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id
 586e51a60fabf-47deb6b21a2mr3169202fac.37.1789132905351; Fri, 11 Sep 2026
 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
 <20260911110456.24873-2-abdelnasserhussein11@gmail.com> <20260911131834.0000514b@gmail.com>
In-Reply-To: <20260911131834.0000514b@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Fri, 11 Sep 2026 16:21:33 +0300
X-Gm-Features: AcwNN1V6XBqz-WHyitn1RiLjHTKAlPQpxveccB8dqCvxZHDUYuXYYdrHvshVrYM
Message-ID: <CANpqX3YjCJCmvp98iymexGLvL0zLXvM_M1F1YypbMCUQA0BM-g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

Thank you very much for your continuous guidance and patience with my
patches. I truly appreciate your feedback.

You are completely right. I mistakenly thought I could clean up and
sort the headers alongside the mutex addition without needing to
isolate it in a separate patch. I also apologize for letting the
`sizeof(buf)` change slip into the mutex patch.

I will prepare a v6 series shortly where I will:
1. Add a separate precursor patch solely for sorting and cleaning up
the headers.
2. Keep the mutex patch strictly focused on serializing the read
operations (adding only <linux/mutex.h> and <linux/cleanup.h>).
3. Move the `sizeof()` argument change to the DMA buffer patch where
it logically belongs.

Thanks again for pointing these out.

Best regards,
Abdelnasser
