Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7914D2EC0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448798; cv=none; b=TyvC2cm8q3EPbJdV9wEG02iHWpFH9IQ84YFymXPnmKyZbdRC4uFQ+zXCKeD2a7Ep6+meLEYpQf83QKGImM810xPTDo9/DWjh0buQ9OoLOQuv47j3qmrFdezxl3EdmwQ51CGy1+A+0MNPCFu0EoBwg2OB42AuBBxgJ3+SvO1NGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448798; c=relaxed/simple;
	bh=2J4kYJhWzcn/tlR3JRnNUxnbyfb/k3jvDTo55cncdW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVHlxR0rxk22UhpO5MprCDHLQYGU6ElWLBKLqwKRZBGn2xG7+Yvbybsw3A7/rAeN3oRxRIkpdE288WqIkX+yg359Oj1NG1gSQn1N95SwmJ5FRMwHZc/JouMMEIid77hwZP2xqs9ZZRi4YUFR5CkPsXm3chkpkWGhj+GRf4/rsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=O9jxrwfa; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="O9jxrwfa"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2394533b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788448795; x=1789053595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4k71jgXR0pxejFwDgrDgrQ6R4Jk1k1enZ3AJ1qLF40=;
        b=O9jxrwfazSf6pIO7nr9/nF5Hx75D37G4jf3k1T6Cc6Gj1riRhaa5r4byMn1H14T3cU
         xA91cmQlZdG0JvONb9X617VCEamDDPQP7BKnLGiH1/dQu5zf/LhshCLxLRwd4RKla1u8
         +cJ9oxXKhjG4D8s1kuCe0Daef5xu0mIRRlzQgL3blBcEq+SN2YyGIf4Q1YeROVuJCSH5
         TB5bSoUirLe8jedvVH/3pCNYnehqZOE/IjvnnX4ZyQ3jUv1cGTkxPtSo1hSGqf1spAEJ
         tD5XN0F7Uxx7PMqEB1iyaLyMLXL2sdt1aiCvALdpzW3fV/n1mMIDF8mWtTP2yvrTCptF
         VH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448795; x=1789053595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t4k71jgXR0pxejFwDgrDgrQ6R4Jk1k1enZ3AJ1qLF40=;
        b=sDzJHNY7MkkULZJKLEE607j1IqeXz/babslwwaBCPkV+nYhUur+6mPy2m+7e15Lvhx
         haaaNwYxvhrGeQmq9CXo48EvEQlx+wTAAF1+xl2Rlsd/Z6J3MBW9BFeUhhm8a0fgLLHe
         8jWT0FRjLmoPQLXw61IVIACEvqzT+OlU/D05O3nIC+BExbVgyzJ5jy6awHwkV6fdvp+9
         vv97VyAfOcEbmiBmPxKIyKg2KSDQbjTV9pU+BfsgkD3IpZLIbdan/zquK2sujTtGPgRy
         M2UtjHBbM8yR3z7IfGKaPh7BIRKNyiH4U7ntJsQXWTJqHyWTEPBGFuBas5rakufWFx5M
         ooDw==
X-Forwarded-Encrypted: i=1; AKwUvBwg61Zt6dhsH6X41wimQMBtRDYEzDL9biTzO4Cc6J39Vnd9mJ4mqp/YMuJHhKf1jpxXIb0mfpzAb2gblIE=@vger.kernel.org
X-Gm-Message-State: AFuF++mpv5HDdg6V9exoqBbcX4kVaL89FpjrEOlMH2hEaqx5biRUYDOM
	L/vpG1Gq3itKhtkNp6/cAu3jhJ6IXYqHHSldoEp/TEi7/sOltG8p/iKQXGOwu9CAgho=
X-Gm-Gg: AYBFou0nn4zzI5hv2oPryaBSv45EhOkmf4IRFq2WqkFrFHXPCM2NZghhdPcGLnIvlrm
	C4/rw30wEOTfrYwpnq+X8COw95l9h8xYF0GBn4v1ezvdxy8KFSuEw+icNycsmVUwPW6sEcJZRBD
	zVLYo3JBn7lmXOeo79s7la7sZbnOUZJVFdSMKn8mAcMDT/RE3LzwH9HFuYmfZHk07upp+X38plJ
	eJhWVnhwG+uFI/S09p1Tm3Squo5ZlcmUGdACOjPPcZH6p0ZbHBlTKmb04znWlXtNM58pSxTaI3s
	mymsqfnG9NZJGQtvIqFZjDPFPrO+a8qqg2wtGBQTx5ofB0FRt1Xqr5uT2RrKH8ziRDJjfYD4LvC
	z6M02VQNMDyDSNieNVUILy9q2hJQvtd5DKo//gwyPLhcZCipCbLdzXS3b6gvmrB+M0uhtbLsvog
	lc+QeDMS+/d0n/gWVYd34S1EokJL7xKZnHVybFOczpYA==
X-Received: by 2002:a05:6a21:7a86:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3d9aeef1aa1mr20459239637.19.1788448795373;
        Thu, 03 Sep 2026 08:19:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d47d32fsm1093623a12.32.2026.09.03.08.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:19:54 -0700 (PDT)
Date: Thu, 3 Sep 2026 08:19:54 -0700
From: Joe Damato <joe@dama.to>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com
Subject: Re: [PATCH net v5 0/6] Fix a variety of TPA bugs
Message-ID: <apmQGp1mEhQ1EiEb@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com
References: <20260902015652.2421609-1-joe@dama.to>
 <bb4ae7c9-e705-4eff-9813-065ea4bd9514@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb4ae7c9-e705-4eff-9813-065ea4bd9514@redhat.com>

On Thu, Sep 03, 2026 at 11:37:34AM +0200, Paolo Abeni wrote:
> On 9/2/26 3:56 AM, Joe Damato wrote:

[...]

> > I boot tested this on a Thor1 and a Thor2 machine and there were no crashes at
> > boot.
> Waiting for Michael's ack here. Note that I think that the AI report on
> patch 5 is not a blocker.

Aright. If there's no reply within 24hr of posting do you want me to spin a v6
that:
  - fixes the commit message sashiko doesnt like for patch 4
  - fixes the resets stat it mentions in patch 4
  - add the return value check for bnxt_init_ring_grps in patch 5

or just leave the series as is ?
