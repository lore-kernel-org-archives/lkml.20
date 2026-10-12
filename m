Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE364C650F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830188; cv=none; b=kD1qTZE+HQbqet0io2rNg7WRvJsf5+4Bk1HTVHrAThcSbK2qLzMvmq736kht9VmmLwIayM3PorfvXOoreqHNFpsmfCNUTM4JPTv+ZOM82mK4J0yoV7vFIkaq79CuTSsUX9RCl+jVoYFUAEz/u3HoZHavY4PdRBEKpS+wx2dagcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830188; c=relaxed/simple;
	bh=HRAEX0icmzNcSwNMcvS3r/mqfS55EjfSaWC9s89g4Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0kncv+OocWeXv5e7MZkeiBKjIv/YXqIREDTPgyCJBPaLFWwqyBHSodnn6AsHSVI7qPFfi0RS9uxudp4rS5Q9khbsxMNgD/AoxsTjvlRAaXD7272gykcNupCaWGe2oswCHUvXa1mU8Mt7hbKtxN5Ds5a1LrxBVxtxPM6KhpkbjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=nlKv/x+C; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="nlKv/x+C"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1696778a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791830186; x=1792434986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNkP45hU717bcOi5CRDm9mafe1wW6i7kblo6Qb0SPug=;
        b=nlKv/x+Cu5V+AuJ4npJrdNsyvCq7ENXW2keINz3KB8i6y7m0iGAgOKXEqQ8wPe6aFI
         NsL2GtYsQvxyaXBbRxSiGmfgH/IPhWRLZestFZuFhKF1JXEmhy0A6Az+48tbb+OaoRRS
         EB1KDVBYh1qLzyh9I1qHCOD+NmrsZCAF5BMak05z31GJFYXeDd07QP/UysYjvOK0dMMX
         qcWdqJ+cQE1Br/KISdZ0dBwqVdG3nhUKh878RF7F2RA6t0KAUlaTiqQPU380KLyexYPP
         8wxThHewelPeopQJmlqgEP80nykQcGDsAJLmu13WkCrYs7ZcHKQieIPYWbqiApLNIJGt
         u/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830186; x=1792434986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNkP45hU717bcOi5CRDm9mafe1wW6i7kblo6Qb0SPug=;
        b=FwynBocy2elmOtz7BfeeRITJCfi/dTCq3REY4N36PhFsAGbLoJlWoOQdRMiKjZbQTT
         gdeEskPqChKqeWB99deItelR2D6zbdtpWnhsj1TM06J6lk3n10iNNSQaYgljGfTcYvfp
         RqG9dzwm6lO0Z/lBgKMuRHfLV0oq1jcGH2fOqSnjOLBNV8jhpAc4ajptZumqWvcBgqdO
         MJZWr+SxdgYMzGGtQoGUFpLkyNkhJ6HKOAe8gYRKKwMqlvXxY3fjp/zFDglGjqiEyUaL
         eV9etOkYXV1txafpv7OGLTZ7cXrkN4xjc+yyxVWNwN4Y6zv5sMnG1InCKGCNZVv/oc2y
         cEMA==
X-Forwarded-Encrypted: i=1; AKwUvBwQMQ3YGdYJfwBayDNzLYXpX3g1Oq/vn6pdz+zeEM6WfTxJCOxfjUwpu7pXybIJd2HklMCrhW518r9fzhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKShmxPyXCGd4QTvCTkbkBOIbqD1T/bds5nJqJ7oIRHm4bhzsgG
	dAo+fUStMFfY6+VmsiqzNXa3X1w48Ogm57z0gkpiMujCm5o6Hww6pi1EQCXmh1lNVwE=
X-Gm-Gg: AYBFou3/C4qJWnawD3CPmSMfnX4+xdm+YBDPzfUthvwh61Fo8r/r1jErUiIyg7hNhKw
	QDixKnFfbO87QP+8ddsvEpxF7Ybteup5PeHifZoo2lsT5ywaAitHx1kih+LmihBaUP4mISr5jAc
	2XjjS0/XrOGEcsMYmPAI8NtAXHntbFmDp5MsQFA2Fw+z9IQery5GAynXjqyQFsBzptgHtoLltih
	lz0GvrQl7Mb5JJbkd87LI194I7+d6mwCLU9QFi/PAyZiY1+skuGuys50TuKZ5DoYsGp/ObpDUP2
	2m9zpRsobGWRvdX9SgixykNO7Jv1H++zV8C+8QZ3dscDr5Hbn6p89ezQT4ryDWEf72zAAQC50y6
	x7xkOMpvEUUPqx+7EblyBZDsIAdapCof/Gk0O7fkVJilU100bHKwVfFq62azkrM8H2mrkKm/vvQ
	cODiSC6pVYp4SK9AvlT3LjCpNStR4tOZfy70++i75a+SDLgjJFg3fplkFPZCMf/ZiQVID1JXYr4
	JvR2siXM31S
X-Received: by 2002:a17:90b:4b92:b0:3ab:36c4:b506 with SMTP id 98e67ed59e1d1-3ab3a3a1b41mr9754602a91.1.1791830186199;
        Mon, 12 Oct 2026 11:36:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm10547325a91.3.2026.10.12.11.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:36:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 11:36:24 -0700
From: Joe Damato <joe@dama.to>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net] devlink: Fix accidental merge error in nested
 devlink docs
Message-ID: <as0oqO44KD97Sa/I@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>
References: <20261011090739.746757-1-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011090739.746757-1-tariqt@nvidia.com>

On Sun, Oct 11, 2026 at 12:07:39PM +0300, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
> 
> The referenced "Fixes" commit accidentally reverted a correction
> introduced in commit [1].
> Revert that mistake.
> 
> [1] commit e504cf18ef47 ("docs: net: fix minor issues with devlink
> docs")
> Fixes: 3bf4c5970ca8 ("devlink: Update nested instance locking comment")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  Documentation/networking/devlink/index.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
