Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893A5111AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862907; cv=none; b=C/AqQZ+ONCcP69RiTEm4CPtt+NmZXtAu3AuqL3GjMZ+xG2EqrUmQxxYaAFLykyDopd4PjJg8LIeFeSWy/eE5qBFJsnhJstUKgJlYMpSqI4AaHaGuBax+2sa420pyjPDfwatRghSm6z4rWRWC5gDFhCa941slcciVxWtslmab48I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862907; c=relaxed/simple;
	bh=2g3OVqHY7LPB5Tu9aJ/as+ex+qcAnM31F0nhSqOscTA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njhzJ7PvPBPmnhlnEbxRL2eaZJjnOodf2E49KnwirLREfJVv+LSlWCHS6ay5fSEMoanERfH7UUlOgLgSkxP4CD4TwhtA8WxsimglrVsQaMCwYf3sWMkC9T53eNDS8Xzbw3BOFNebKe9MkPk1K1MyvtEee0+NrM8/WFRxrJ8cQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA8DlYA4; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA8DlYA4"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2409367a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788862906; x=1789467706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhccQlmcLThBoQ55+SHM+25Vzt4uZpvbPRRHG0NdRkk=;
        b=KA8DlYA4/esNHDNGf1FiJy8RJGcRY4cog3Lk/+5S9vwm6D0R+xASbyNb8rvWVvF15w
         n4Bt7bCjrfSIGO+fNr7BqClfOlg6iWLUWppcsBTgZxO8UAcyQZpPEnORKoc0pb9dD7bm
         gYC3LDDG2Z0SzmkKtJfwH2Ri6QFPQoGAvGorJNzdS9132ry2uyB6QkruKHkmiysTK/dy
         i/AkgNqXfrOXoN1hwBTmsCYajRx4KrrbpuzzzO/GRt9r3HWviyJrmz2hjrXuUJTEQ9cT
         tQznO+pMc5GX84EvX60S0JTQhRfOqzNKZIccrTXH3Jy8ii4lR73HP+If884d7Bt/XAkD
         E7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862906; x=1789467706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhccQlmcLThBoQ55+SHM+25Vzt4uZpvbPRRHG0NdRkk=;
        b=M+f58JKxgorTSzOoK9/Z9HDu4XP6PJkaNmT8YrafqTChDa5BRtxTyxBuibvmpTolxI
         rq5fLUAP0nmQQlCnvVaXldQYj6ypvXmFJd6MewfjmwxbS3SObKB2bWvz+/k1I9REHXll
         87ZaZu6JVa7ePHd5DAycnKPgZ6nLcHHtSxf8W0j2yBe7rrfXNBF3MhBu7WTgXIIBAvya
         rGYXcXaKUS89x//DS+N7Jc1J18+u6ln/AcCjEEcd0n6Mj2pbPgosrQVP3oW44vyNkxPS
         DJIMi43j5Ok+Vmvt+0U93VBEuYeGChqltXskHXS5wnJCHV2Iv6KpPfrM2hEhwrAImrYL
         JAPw==
X-Forwarded-Encrypted: i=1; AKwUvBxEktWFLZGWOBif0OJgIFeSGz5LfMV/8NBbqWGDI3RihTrgMcDI4h3ZSyVPvDtNGs30QTN9lFIXdq8d0+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++krEbUEmTweR89LN2qVYaA6UlyweZroAJCl+nZ0QEEqt3SI0h32
	QvMkz6hDJ1zbCVyCSprn0h/xc2AKyZbcigd3kcNPXhHBFUmfs9G55p8h
X-Gm-Gg: AYBFou3UvY6JNi1KX6BTC2vKbarUTJJI/PwcwFPjIhDYD5BFTotD7KFb906qw+Wj2Gb
	xlhlw0yj/QT6s98vRpJoOYi/QLs4K37O81JATOjBSwdCnzfR7OgTjFOkNjDlKqOCxduIEquKTfv
	dZuX6hrYvBkBT+N3pfLqePVzGF4pELZ+fSSvu5RjIYQFZqqWK4jOC+6dI8f3M/aAxqomRBl94ab
	SgUUrFbNYH5KYWWnV0k2dyLIDdLDn14klYY89J9SAobWCIugCcicOAUXhMQCCswwkmQj0dSKKd+
	DzLcAzVxfST2oYQPv5A/PuQ+9Zl8WvoFfQrNYkQnqtVRjKTeBYsFKnYhCWP2gqIii5WdinDYHgQ
	E48uz2dw2sHEoq7eXMqql2YJ2HgjSWx5xsyxhoq2nPztyXTckB+m9qeJtEEBSNGATsmgqMWGQPj
	O5AFRlrZ5qytpMfghXfk1cOx+n88Km0dr7K9vTYRUMCVj5I2vV17p+mkbGmCQ4q/b9EpWaGJbkU
	KvSTB4vbYSF1M8qWPy1IRkf2pXg/LsQoLcsWOvh4L4ZWZCU0K0=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr42956469a91.16.1788862905641;
        Tue, 08 Sep 2026 03:21:45 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (114-25-99-144.dynamic-ip.hinet.net. [114.25.99.144])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm25594085a91.10.2026.09.08.03.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:21:45 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Tue, 8 Sep 2026 18:21:39 +0800
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 2/3] wifi: nxpwifi: free the aggregation
 buffer when the RA list disappears
Message-ID: <ap/hsyBMiYeZqk/C@nxpwireless-Inspiron-14-Plus-7440>
References: <20260813082315.1390321-1-lilinmao@kylinos.cn>
 <20260813082315.1390321-3-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813082315.1390321-3-lilinmao@kylinos.cn>

On Thu, Aug 13, 2026 at 04:23:14 PM +0800, Linmao Li wrote:
> nxpwifi_11n_aggregate_pkt() drops ra_list_spinlock while it copies each
> subframe, so it rechecks the RA list after taking the lock again.  The
> check inside the aggregation loop returns without releasing the
> skb_aggr it has been filling, leaking one tx_buf_size buffer along with
> the subframes already aggregated into it.
> 

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
