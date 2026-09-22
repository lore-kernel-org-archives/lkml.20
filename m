Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75738BF72
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063303; cv=none; b=R5kY7GLD3xNsP0OjtewfcHwn1LMRJUaDHSgcX6HGBN5jksm2HqdYkXk5ee2oSXBSukRBYrXpfdYH21TmneXqt5olV/sfFQbgwmHa6C1/iL5OoKIDQDkia7RCMEf2Ubibqw+rCQmv9i9dW/7rpkjge649Yk9qwUltifPQq9L4PoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063303; c=relaxed/simple;
	bh=ZejWtrMd7d7zk/DfmXTbF2uTpVeSWdaH74FgmGezb/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve8bDKQwOZpF1wHInQVpCUc8N+nvnVijmKTTs/+6fSnzm+STq3rZKJkVWBmWA4B8o5dyfVaNfRVeC8TYFuEAlx+gSzVOTUWAPKVqjGRkRAAVeOaAzKZJfL4PjOhgfhl0JGySnNIqXGf5TYYIeinW8YsdX2ieV7rgO1nVsFrGnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4oZKiAg; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4oZKiAg"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so2918822f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063293; x=1790668093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mjk7K+afSw9HdUE3zJGs7MlLHjf2HtEjytCSGhTjHcs=;
        b=Z4oZKiAgMxhuWwsC2zdMq/rn+VMBE4lZe8WRgeb2lN3m/+3z6+mEODB+VjWMxeRrGR
         l1bBiAtI+my+vAzxNqDYEnO0ZBDHkGSqZAHTADmeJOaM1h2jXGnYvVeGIO6+d8idUdqI
         D1wl1fzxUdAnaXzzMgB+eDVS9ImZWwjHP2IIL98hsifxHeqkR2VH1KfA1cgnp1UQCagK
         Xs68a3315OGddYYo5Dpi9b1jKi3YDK9GU3a3LATBUvHD2cyV96Rk8fy1Hfm9+HbQ3cuD
         QTt8ortkO6ea9NnKX9E+vLAhXy9G3s2n2Q0VRM2K69fh1O/7wZdqezV1WQB2sKtE0Fqo
         jSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063293; x=1790668093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjk7K+afSw9HdUE3zJGs7MlLHjf2HtEjytCSGhTjHcs=;
        b=aWdOfqAOzgLOMS+EWrAItkkIfy8imnyCG5d1kmYwbWy7g33AeeUjq4+Ei0PKkBTe1x
         8zdbx7qpjBCaRicf1JvKWR1B8vHGtI1LEOvBBTzFmjKd41LsUIlj6Z+qZFLqBf0HuAfK
         T4R4dBeqo2oyHoECw7QB6k2qjV47ff08l1HaiHbbReU12PtsaE4p23pxmDNXU8/WBqCB
         AuciTLCdnurOm2T9mY9/yJZy3ZB03T+13ujeMh56hXSg1R1e8AOdX2G3X8cdIeKE+tKe
         +ODEfolNNxyZbgqIWyVyxIpBaejjYdNJKHSpj6qsSHHxeSexPne7ldW0lIL79JSzWPWK
         GcVA==
X-Forwarded-Encrypted: i=1; AKwUvBwfai6qhkQXIbA9a5L1+ZLdPr72Uu+W4XCf71n9S/gr0eBzK+4I69P0f+RT5sIvbwFEQrNkeyV0CvBqNiI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRXXUPfLWXnFjjLcO3+ypyOQYt30gniSTqPosJwJk7aSCp6WGF
	/ZRAlFfwKx6sc6iwHdTbutRbEt8C7oEWLYZUvAUNTNzphsHffJAscSCA
X-Gm-Gg: AYBFou1bE8136SIiv1GPtO3v5cBKlGIarEfNEGy+dAnKoZ25PkRNJ/z3vliKqKp/WhS
	fRBblLBZl+2euPBJ+dOyltFF3EE+ljPAuiaH3Xl3OS2Wg8Ta3dH5VsYaAfpkorwWZbE9LFvkdB9
	uVm1zpHhyFlJe3gf8MU+l/GF2MasQ1DnF7Sn4eB7nXvFXzPmoE3XT5NRHC1bBtpGt8kqRx33yMn
	XkyzUC37qYMJTqMWHfBSbQteWOG+D73GXXIUniWFnyRhjRNEjlY9Ffod8UyVuWNzZQ2blI/+1OC
	RdaoMhY7E4XbR8wdonphkgigffrRH43NfIYSEaxblo9FYV2orFRkKDU9JDlH/1F/MRixYCLGKJ1
	sbAkYbSpolAVQxh3W3lTNfw18gWcZcW4xsKVJ8SP2+fFjKw48Am3ClxY57mVbKiZcoqguHjZm5K
	CGXa8KzdRxaB6soik9leP4sbja3YkND0Rkc1/H7mdU7mm4K9Cj9N8I+wg8I95ZUlMfy8M=
X-Received: by 2002:a05:600c:a4c:b0:49f:d71f:9a39 with SMTP id 5b1f17b1804b1-49fd71f9a7bmr53039255e9.1.1790063293066;
        Tue, 22 Sep 2026 00:48:13 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fda8f04f7sm48750945e9.0.2026.09.22.00.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:48:12 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:48:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arIyuBbtRu2lwitr@stanley.mountain>
References: <arFL5SLHwLflaONc@stanley.mountain>
 <20260921170339.1406-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921170339.1406-1-itsadi2409@gmail.com>

On Mon, Sep 21, 2026 at 05:03:39PM +0000, Adi Prasan wrote:
> Hi Dan,
> 
> Went and checked for the things you suggested.
> 
> Fixes tag: git blame shows this check hasn't been touched since the
> original import, 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi
> driver"). Added that in v2.
> 
> On MAX_BSSINFO_LEN: I couldn't find any rationale for 1000 anywhere
> in the history - it's exactly as it was in the 2017 import, no
> comment, no commit explaining it. Header (24) + MAX_IE_SZ (768) =
> 792, so there's already ~200 bytes of slack in the allocation beyond
> what ies[] can actually hold. Looks like an arbitrary/conservative
> number carried over from wherever this was ported from, not derived
> from any struct size in this tree. My patch doesn't touch the
> allocation, just tightens the check to match what ies[] can hold.

Try to find a better limit.

> 
> On the timestamp write - I don't think it's corrupting IE data,

Sorry, never mind.  I was looking at the wrong struct...

regards,
dan carpenter

