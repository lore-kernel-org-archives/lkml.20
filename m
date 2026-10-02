Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17543437456
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926236; cv=none; b=MGommD3IzdOsaupgC/DkY/9kFbxwI7mB6jTdTmInO1vhN1TXzWRD3s3ZIPFoc4/fepH+3HuovXXyMyViL02bogBNFuDWwxlr4bAOFHDJ2sAF7+O7Cr0fy8oM/XXbWbkKRfEXgTQQcsurXDcjkpbX9cJUdX+/VpjBSLo5S+V398g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926236; c=relaxed/simple;
	bh=5GAmtYJRjyXO7QNDSg0XRLjnCIHj2W2dwtcdfFCVFRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiwqwUg1fXIlLPky/z/vMFUWZDbijlyh/+UiYNZeM3oaDqBslVhgIGkri/stlGcec94d5+P1mmPLrgb94aPqKUjs/QWMJbi+lbphPG7T7JQF+9/e3giwRxHNy69peUwnBOqojJX7DMQtXIVphNBAClPytrSO1eLSBr0Qvods5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn4QPVrO; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn4QPVrO"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso6332172e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790926234; x=1791531034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3DhBRZUBEMxswOFupavtILwkZxnofD7tHbJ4YNRXjDY=;
        b=Jn4QPVrOK+PsMbxuo/cVMeVKdthQhN79Zmk4rQsfo08dK8iLvNbXZ1NhITX7m+Bptx
         udzBJ+HcXGy0x/8zNSGBIKqulCfKgjuRloWRrbsI9eoJm3yHZ4G0rMnlR0fGPJ+YTCne
         MGYiwej0nny6UxZzBu8J8qzPk11S+Gy7Q6bsrxpxWFePnlSjl/pHBUHfquknxUWuz/+0
         7n0Lhrj/VKSwzNN4+wjdq903KMhv6HUDIzeOj+STHpCf9a/skjIvHBUrkH9BvCAnmDrX
         lKtBJM5DvKx5rfToFzKDb7MdZ564yJDRzGxjl4achbYBXm01vnDsT/vN0MosxRWbNnVI
         lvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926234; x=1791531034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DhBRZUBEMxswOFupavtILwkZxnofD7tHbJ4YNRXjDY=;
        b=l5S3ArXW8QGw6eVNoVgWtRPxAx/mw78JgaiqKImY3nqXVvo1G7MOTW9R0w1XNVNI8x
         QwhvvZzLw7mYRGj5vcci2fqkB3x+GPwKClnCTOV9uXwr4JvW+3PMIjeMGx9spF79kURo
         5l9i9hEFrZtmiPao8AoLMoxxX8QmbD+DBDqVIfHjJVA80TUulr6F8Rtf/ATJL+HvRwMi
         S1PRLTiGcYcUrVjmZr2e/1NlJoPQ38nCkvkuPocErBIqCgeKid065OKKFFDKiZLlsWHt
         YCiCC/jdXFIwVrj+524mFPhLkj/okkZXjmjaHQdCLlgEE6GvkC+YjtsBwQbZx8vpjOK4
         uzKA==
X-Forwarded-Encrypted: i=1; AKwUvBwgksZcBqFPHMquMnGBs/nypIkn3m1g1nxuoCC7mKjagbm0srh3Wj7SANBzqPZGuIngYjlZNioQEZn2/Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA2ILIkYR8IARpiRxq/ws/FORhmdxr+8WpJfT6suAuSEDAquAr
	atKW7JfGIn8iEF+nK0H2e6ZJfeZXrl9W1m8LL/ZyW2rQFOzRaubVtEnjtd2CwA==
X-Gm-Gg: AYBFou0lqmPblnLTzPDeBPkAOd2lg/bnuGKqAEOk58MNGKZ+QlugZLDn0He82muduF0
	ZyOPoy0kAl1UKovM3KhRyet8eDiaUHF8caYEo1kt202LbSFsAWkSpdMHCG9vpUwZG8AZMAYgCH+
	PQUJ86Xxm6utqVHVU8cOsQqEJRK5f2VENCTNLM+M4/DrTufPBIZ1dE5wllyLFgVvH64ZAMR0LGE
	a04ba8qVGUgI9ms/bG+3Dn2d74kw+xrOYFjpipzeOblY9Mx+9Qj5ro6PXfn13iZfn4Tqfq4LY23
	A2BmOorC38xIgz3B1xEagLCAPEdmix4Uw/v+p3TczA6YFDsQrm1OS+RrX6DVNvmht1T/Ew5QtOf
	djADkTwFLNIXhmYdsbf7X30Wbx7kbhzjpmgbi7Sz4WSLbavIqyl2xNUb6k8FbgTLbgfWM88tB5P
	uDOna+v9KKlDYwCsNvRozXILRzVreSVO1jcRunUseCLY8y6MFH0B1Q5toG663Fu74=
X-Received: by 2002:a05:6122:6b93:20b0:5c9:a60b:e5a3 with SMTP id 71dfb90a1353d-5dab1a52819mr421807e0c.14.1790926233732;
        Fri, 02 Oct 2026 00:30:33 -0700 (PDT)
Received: from debian ([2804:14d:9ea1:8718:c77c:8:a40d:84f2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da62d10534sm2647081e0c.13.2026.10.02.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:30:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 04:30:27 -0300
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Message-ID: <ar9dk-Ja8tqS7ufC@debian>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>
 <2026100258-probing-reactive-1191@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100258-probing-reactive-1191@gregkh>

On Fri, Oct 02, 2026 at 08:09:28AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 02, 2026 at 01:07:35AM -0300, Leonardo Martins Martins wrote:
> > In phy_tx_power_limit_to_index(), there are many mixed-case local
> > variables, rename them to adhere to the linux kernel coding style.
> > 
> > Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
> > ---
> > Renamed Variables:
> > 	pHalData -> hal_data
> > 	Adapter -> adapter
> > 	BW40PwrBasedBm2_4G -> pwr_base
> 
> "power_base"?

Yeah power_base does seem better.

> 
> > 	rateSection -> rs
> 
> What's wrong with "rate_selection"?  We have lots of characters you can
> use :)

Here I used rs instead of rate_section because I saw it being used
like that in rtw88, and I also saw the "Naming" section of
Documentation/process/coding-style.rst where it says local variable
names should be short and to the point.

Regardless, I don't have any strong opinions on these variable names,
rate_section is also fine, so I'll just use that in v3.

> 
> > 	tempValue -> tmp
> > 	tempPwrLmt -> tmp_pwr_lmt
> > 	rfPath -> path
> 
> Why isn't this in the changelog text?

Oh it really should be, my bad.

Best Regards,
Leonardo Martins
