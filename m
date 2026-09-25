Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6753A1A3F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338576; cv=none; b=eE28d3Ny+nGA0BwKJN1Ni3MTbLSvZ+U1qb3Vo+ZoW8GDJf90NM4/nVjnaIZSfNP2VSWTrvMZMa491f47jfxYOQfaxq7Myf4i0WoVunwODb1E/t1haghp9zTx6nlZpcRTcFV1BwHL6bTYd0v3qgNFnzhzIxXFWS9hnokYKB8UYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338576; c=relaxed/simple;
	bh=IAgU3+uP+IyLBcR0IDiReqha2FakkJkuk947qP0RSVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv/f4k1Na1FrVw+Ph/TuENOKFHCylxBxnjbfnovotIzj+CswcWpNmTiIQfhBrCOKPwQkwl5fgN22ZVxyajVm11RGJR7Gm1i05peiHFkLlb2J1A8r2PKkRTIMTUrS7YoJfOSvfn4uVRAsvsYBB4xBF0WfVJ0Uy6thQkoCB5Hk6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uoO3HbDT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vrZrJRN2; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uoO3HbDT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vrZrJRN2"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 29B4613802E1;
	Fri, 25 Sep 2026 08:16:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 25 Sep 2026 08:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790338567; x=
	1790345767; bh=cE3icSsbiy3N2VWp/dD2+RAYCNaC0ptEBgoeCj63aE4=; b=u
	oO3HbDTMvzSjBTfu0vSMSG20/4+P5SSljPih4fqAZsAljFGM34GuB4SBbFFwihyG
	Kz6JcG4gscMpEH7HR01MlL/o39RIh0+YNKLEsryrnD0OUj1gDO+Vvnfw0th1xxyN
	yfSPryyTgGbgcNwGCSKbez23H2yTdrktqW+J0RMFeRp/8WqTm30VID7ig6fDBs54
	rjIcZz++OBOjMFrXM0H7UDmbb+l3i4o4O2DaC7wTSPznoYQhcWFQoEcTBAa7ucWQ
	6rpqSk7liI9idy1tdm5mrqyqoyW2/wDTGHLaW0S/Q9jshIWkJl2TnE4Qv/1Hkcz1
	0EaVMJpp9V+iI2SqfhotA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790338567; x=1790345767; bh=cE3icSsbiy3N2VWp/dD2+RAYCNaC0ptEBgo
	eCj63aE4=; b=vrZrJRN2Wza37yNqIZh/jrsa4Xss0/PtVSDbeUeb2+AHBtss59r
	EFdojLk4LX2pR5K5N++3nOgNqAtaam/MGzcV7AdLfeX99K85wHV9sJZUt0ieE3mD
	TIgsrFKCuFVUJdwhMRTUiBOvpHP2fZzEgK2bbBZk0Pm2IwblJrreyVQ1e9bxNnw8
	MCPYgJzf1u3jcRQgkR4eLBz3XmlwnBFAQxTa8YZ7b1U7Pcz8a3M5QhujOs/i1bnN
	Z2pSmtdE6sUE4OKJVsH02GHl+YQvxkrwi07jmq1JF8oZ2Kd9dkuyKG05QgkdB0IE
	fRkjefglPMJ6AlnQESc+hWRaBuwkgmq9u7Q==
X-ME-Sender: <xms:BWa2ah04dkfznp_Mq7xCQA3hPM0LBQkYHxSTc9dT-dUoIpbadIV8_g>
    <xme:BWa2akSeIGdRD3rsw-_7pH_JrJjdK7bmrGrSr3_HJ-kiEFwjMe9yRBjq4AQIryXD_
    J5S1IY-HR84nADiAL3Hfiq0vp3RVYrzPCfJUfq0vFQRlq2jKaTf4Sug>
X-ME-Received: <xmr:BWa2apDhlBpKd5zcw69FC3R7kCBeTMNfEYQdolcsOxR70kpSlsRobbSPmbQ>
X-ME-Proxy-Cause: dmFkZTGENxxHCReKKchFBlCElugDexOT2SgXO51eQoL8Y4w9wHokf88d5qHkoAqwAEu+Ot
    t8ZzOTusjDUfiQ+XBNOchMvs3uGoOJYgRjlqgKUgpZBHiH3/syYTBdlQ8hzyctN3cnU2UJ
    5ELqyyD9Bazuu+xouYVyTy1fQiQFz/TweN1yP1Um3LGC0ua+lgwj4Dm7eVdwK2Jkl8O7rG
    NeE5btIvzL8JvnSwUyIc7tfjEH4UrGOfmpKy6zXPskbKb8y3K5C3j/SmNetnp7hgfs1e8t
    PdMmja7l+vMQkOJTrG9t9chjSIpU8Fatiwnz3w4q9A6CwO6gV8heZoIPD89w5iVzmpDUOY
    U2PbF4jmsPgDkH9GuMhn2Ce4EX1sxAIA4Wr3JeNrHo/qeozOIxtJAddczxrNqAzZNfkspv
    DMECJC0UmMXECKTgkbjgv6OFrWcblgsY8GZPuQ/KrtedDHxS8Q+jcPS492Rq3jLxf00DEx
    E5tkqKl5Zo1JMjd2ubVYn02xSd9tJ4zWkWhbpsKelBY+mf9I8rpg79ImCwsmZHgS481t8V
    cZ/vaIwHPFeJWAf0ErmdbzA5oqMVAbpAAQK8jZIAx0T+tMb7iElss5Wgql+CKTNLocbssV
    UBni1q1v3Cyf5a5Bl6uNxJpPlhZt2OYxbdu2mB9dHD//Fd0d5L86rrN85Pbw
X-ME-Proxy: <xmx:BWa2aqbMVtNdazsZVAdc7l9AF9JU13nCkocZYo3cy-7iGpMsZVMAGA>
    <xmx:BWa2albmTXZci_o5UCBPCzfeQbMVzo-kHEvnwfE7tOsxINkF3hytbg>
    <xmx:BWa2alksIXkc_S7oJ8igte7bYRfEV8OZ8bcnOiJLk9Nh9YXGj0Q3EA>
    <xmx:BWa2asMK8Q0ZFBb_3D9Jex7VKsytddm2qL4pfpZSpAThKrr7JgWJtw>
    <xmx:B2a2avM2mJ1hTwMIjaHr-UUE6gbLHPEEUj_T5resSS19Y-QT0BSLzkhb>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 08:16:04 -0400 (EDT)
Date: Fri, 25 Sep 2026 13:16:03 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, axelrasmussen@google.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	david@kernel.org, kasong@tencent.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, 
	qi.zheng@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, surenb@google.com, 
	vbabka@kernel.org, weixugc@google.com, yuanchu@google.com, hannes@cmpxchg.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] mm: remove the unused zone->unaccepted_cleanup
Message-ID: <arZlCx9oAWXr71Y3@thinkstation>
References: <20260924191103.3475117-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924191103.3475117-1-usama.arif@linux.dev>

On Thu, Sep 24, 2026 at 12:11:03PM -0700, Usama Arif wrote:
> Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
> memory handling") removed the zones_with_unaccepted_pages static key and
> the work that decremented it, but left the work_struct behind in struct
> zone. Nothing uses it anymore, so let's remove it.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

You missed me on the CC list :(

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
