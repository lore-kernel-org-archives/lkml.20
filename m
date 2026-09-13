Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3644D384CF2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270368; cv=none; b=OEerz2E4qnzFmmNmfWhwN1M45QPK98fxI93A2fDJsxxvt6LPCJgn2kCzcMU5vCLcFMmL0Mr28S9aJpeKYZ9qO7c/CCyE6HG/udxdALSaNLqA+0sLLQrj1Z3wN2GVBd4v1/e+vXP4D06YwvvRwefDXd+XVj9yxcZP4Qm2AlHoOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270368; c=relaxed/simple;
	bh=BD9OGmpZ3+fJbRvqNTy8brT1EJQoXKQTGDFIJKhBtpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FET5hhvQi/E07/pvZTSQFXhC+aRspAIs4gMRcFspZcsuJx2dwxoc4HzoRTHePVYKeH/an9ujQq3HYWttkKGq/L062m0w/fFGGiXNiLq7bDm1NUDGdvP2baRiIhJ9vHEYFtpah7XZedYLQcy/YI/jhUVctgNen7Iai0VDtBrgL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie/eSgiE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie/eSgiE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so21163171fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270365; x=1789875165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUxnSrKVNmwG9e50AFcOowKn93UYykTt4+mQ+2qxLTU=;
        b=ie/eSgiE8BtGZ37xl0C3cQMpi3wy/3wgt3prtU3UU1CmBHfF9oiXmm91fLJWFuvC3A
         dA7rwZrineOI/k4sqPZfhgQkB7fGO1/FDCrdnPJPNzF+vIYDn9ApMCk8oN9qG9ap72cT
         Jk/44EBmE5S5IxtSgd8sJdTu9OiAqJ5hH3rFc43SrRzIhNCY2N3T7gE1WGlPaaDAZgbl
         jPJPIX+wUSBAvduaBekXn/GEE1QZnIJGY+o4H4L6YLbl05nQZspzfOSA9BMltgmN/3Gs
         7GDepsWxqVZIRjrezMdYgNPmjwUa1BOwoEnA19eL/EvSV88olRYaGWhkjoaMG9uZN1yO
         YwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270365; x=1789875165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUxnSrKVNmwG9e50AFcOowKn93UYykTt4+mQ+2qxLTU=;
        b=eB7zd+bYk9tWylVEakwo7IyUu0oHLyPFB+ODE9VWGOSC77S0sOKOQXCLc8cDrE0mBo
         /fGCWxm8EtEeZ2p9KjcX6AQjepSAz1SFjfSPXk4bvNpVRC/FkgVYKLNANXnQBLgC9Hhp
         PMUgOrvIciXOe/WN6p80+Q9yUJF2xwMDDXOc4bnjsiWRdav10PBIFx3WJRsSibg4jKSD
         GcnEuroTPnxbwglRVJPcnsZLOyU3Pu7d6yIhzanM9aIqvkTvyZ3ARt5B/N67Ty8FH/ft
         UiRSkWlULcyj4BDSgiVMWNum/8X0a9LCL5bw6KJVmhgHMXuC+QtVknBuHq1VBZNGOrgo
         TiZw==
X-Forwarded-Encrypted: i=1; AKwUvBwhhuh2QJR5c6TUsFoqp/nSn1G3bMC7Epmdt1+ABoQGmvgBCleXkScmzViQb7dYQXMiT/7bk3mEIk5GtT0=@vger.kernel.org
X-Gm-Message-State: AFuF++k+ndoYlFko8qgZ4E9CGSK7uMKMAqKz16Zj5VxXMEnr2MCWyXRJ
	vECoiXCpYdPvQfFbUh92ozfdqoIHNqGG197WNAg6qxOb9k1F1bWmOU0l
X-Gm-Gg: AYBFou0WRPqPrNr1OamFwvIUYsnCeiIUbSasUZNziWw1hwudwHYErRIfTYL6HRh0eu7
	HLYqIUYa7iKMHl8/oBCkt8c2hBhqmxyUnA6IS2u21La/JSUxjN3vgE4YgNgj9SXBFTvWB3WmTxZ
	6tSip7xUa6KY4XBBUodXt1kKogyb5g3rJNc6j62EZZc42Yu4LC0aqmUER1K3JpO/Ig/cWsco+C+
	Hm/ofnfUpcpWCpDkMvJCalLaRaoCt098LnwYOq2US08fOOtdE2rRLZgot7L4dXMa9ybqiMum+80
	Xc3+0D19T7QQb0bF7w2Al7Mt43DnQDmm2w8JReqHXiOBKjtvHcC8khKDeVv7M3518RljvCkIZMm
	W80AwvdCMS78J+7MHPXFK+HC3+CZ+W0qn6GRUj/sAcIcAB/O9ogP7JrmHrJz9FiSH1hQEZ0h2Lx
	fUbC/xs0xjzf3MAFoeOzczTGkciQmMZbdb5VgP3wx1+emhC5JrdU9gr5gd/BZTqgkl8VzZjOK0r
	+yqbu933AgA73JViygLCx1jAI699sRL3YzGb5IDZoZJ
X-Received: by 2002:a2e:be90:0:b0:3a3:7682:499e with SMTP id 38308e7fff4ca-3a5a525304bmr12047681fa.19.1789270364978;
        Sat, 12 Sep 2026 20:32:44 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:44 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the generic RX path
Date: Sun, 13 Sep 2026 06:31:53 +0300
Message-ID: <20260913033213.873609-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184730.304d2d34@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-2-littlesmilingcloud@gmail.com> <20260902184730.304d2d34@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:47:30 -0700 Jakub Kicinski wrote:
> >  	const struct iphdr *iph = ip_hdr(skb);
> > +	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
> >  	int nh, err;  
> 
> reverse xmas tree

Fixed in v2, and not only here: the same was wrong in every block where
the series adds the declaration.  They grew when I gave them an
initialiser and I never went back over the ordering.
