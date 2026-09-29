Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9C3603EE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722786; cv=none; b=GWVQQCT3lVi3NYl6lPc4epwD7334GSGndVyVkvWzLmAwSgmKssSA8UaF4r7aLElYbdXiMUKtRquULrf4/GCmZ184wn/y5X8OmZ+Hsjg+WRDRKIWKjVVSs4VhxfkUEexipMwf1aCnQg0yBtZCqD9DFNKmdg395wIjxFDsOpcY5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722786; c=relaxed/simple;
	bh=yciXXgFMGDVOMZPQ+5IrugMojC+KS2xZdRYXVl6T17Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkX1LhhnHstYO2ybhja92y7Z1vWVsi2QJNAZ39jMV2ZIEv6hGc01G9pBIWR62gnnpxxao83+x+/Wj4oH6rsjRfJsNk0JJUKIhad+QS/V9/BCMn46FlNQEswLEgsrZAlb2pSz+ETOYaSf20tPG/E4Zo9bgPTWFRULk+1eNbELWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcTI2Fci; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcTI2Fci"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so35625195e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722782; x=1791327582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Gv+PysJI6ddPMh+/2D1kK5GEPdkeF2uLZFjE2FJN3E=;
        b=EcTI2FcitOqfphbCCL7eny8bTwBNKzWtYEszT0bkwhgIHJ1SzSNyf2t8xOg/lp8A3+
         +w5Y640OqMdr3dy1rmVWHd9a/0P9d96H7aln+BuA++Ntuj3yF/8hJQUpdIGZFJB+VWdF
         BR5D+sboZ2cQIK6GLFQRP4dHmE1CLdnqAA3MRxkmMCGWHaempFsFKYTc4VwzyXwbwaQ8
         nVXBahy3dXLG/7G/+Dbw50YwhCoTImDlv/sBu1xpVlQRPGSuuHCd+jPf8W3mJ5yhXsKu
         xxH1W6SFPgq1b+VHd34+EZkZzlWhMX5Nn8fXvXEqLDcUWojQD3BkGZTdb5IAf/x2DZHV
         hVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722782; x=1791327582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Gv+PysJI6ddPMh+/2D1kK5GEPdkeF2uLZFjE2FJN3E=;
        b=PDY6OS/JBuqbI9VhLxwOyqArBB8DBgy939WfPFOk1hVj3OulEfhtVXcHVbO8qFmn+G
         vX6MNRfdiG7PrpAMqXQ/dvvNb6UoltvLzmlXAKtaf4F99r6vRKB5T60B0OFR02zO1P8T
         TSLuqCcOkZvls1ZN4v0epzrk+InYxjW9mEtHapBrDhImMrNJtaN99dv15dNfMrv7kP8T
         MDYruk2vXABzTN8dcfy50oEVa6gOSH0tZ//fjmWAHiGHH9NwxpLDRJt9mCBZMk+9Ibqt
         8MgSgYPQ4H0Fkbv9ds5sZ20yxmznv6+jb5iflxfiR3Mya5UWX7H4Ia+9CyeJn82vPfam
         5mtg==
X-Forwarded-Encrypted: i=1; AKwUvByUsCeAHOhok+uA2+DdnON5ViSoGFFFvBBdX47/w0V2lAgcJ/EzGX5MAp/MwKSH5hsvBOCvrgcdjnAmqc4=@vger.kernel.org
X-Gm-Message-State: AFuF++lreI8x5QIFNv9PtYgLIdWt9Mxlno+2NVP+YeYpYEpHJU5pbyoT
	RvFIpMgsZgZsroCvaVz1W0pWx5hvfWCfSF0Dcldj9ZlsbBHW4GlgoAf5cryT0A==
X-Gm-Gg: AYBFou3MKPCfYb/G78X1PJ6jKnAr3P6uoSGZ7krfI/582hd7asfmnQI34ANyDUmCVZW
	GmP/QJHrLaw23jKS7UzKLRMr3kAD4qUjpgy6wjez7WCcIqPoMd7kFi7HXm9zM5mJis2+iKDKY+a
	WELh7tsOVH206mDU0GLrLTvZaZUWZwReDetU/+kHdo9To43RjWxj3/s6K/23ANcUiNr6cAuJTHg
	s/ENH/Tx9xaElvZPknkJFOA3SyDn/5Kq4r9ooeE2ldhfmGqHK4axnRe95mL/P23U3FCpDXnblZ4
	+j6HjWyNCgI2VaH3pchL9JWYyc8vDMO3ZvTaaKtKrtCRLB7PTGutNhUoyVO8smRwyWq9U7YzYZc
	BsgYPpFAmaw7xgsnWJf/OUtdzaMJ0rGuj16CWG9mmobEJGKEsPycZCc0E1NspO/5/SfaO4Z6xjC
	PujpMbkJViZDIv8GvrQqLCCofzLf0A0cFSB3C4XQeKmE8GzWUco3tvpHa5uOOJZorED4ds7ggdl
	7D3A5/Jlpg1ZG9T21fF2RjKNq30Tg29Kl9wOrZOZ34+
X-Received: by 2002:a05:600c:8b38:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-4a015146b71mr8103765e9.28.1790722782234;
        Tue, 29 Sep 2026 15:59:42 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174e161bsm2551225e9.5.2026.09.29.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:59:41 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] rtnetlink: wait for RCU readers in rtnl_link_unregister()
Date: Wed, 30 Sep 2026 00:59:30 +0200
Message-ID: <20260929225932.349581-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAL4WiioFMQN4troVjQjCmE6Z9kwwb95SnoEupjD=PPSK6Q5f6w@mail.gmail.com>
References: <20260929170444.218093-1-parri.andrea@gmail.com> <CAL4WiioFMQN4troVjQjCmE6Z9kwwb95SnoEupjD=PPSK6Q5f6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 08:01:39PM +0200, Eric Dumazet wrote:
> Patch looks good, but I would probably add a comment here, because all
> these barriers without comments
> are a pain.
>
> /* Wait for rtnl_link_ops_get() readers that found ops but have not
> yet taken ops->srcu. */
> > +       synchronize_rcu();

Will do in v2, thanks.


> Adding comments for the other barriers in a future followup would be awesome.

Sure.  I have a net-next patch ready which comments the remaining waits
in net/core/rtnetlink.c: synchronize_rcu() in rtnl_af_unregister(), the
synchronize_srcu() calls in rtnl_link_unregister() and
rtnl_af_unregister(), and synchronize_net() in rtnl_unregister_all().
I'll send it once this fix reaches net-next, unless you meant a wider
scope than this file.


> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks for the review,
  Andrea
