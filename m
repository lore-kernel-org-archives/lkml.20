Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846536;
	b=vnRbMnTigVqEu1HI4buJGG+HpfeFo6jcrT/IibSbFn11pwxWIbX93EC4kqnFE4Yjkefa
	 WM/cR8+tiYhMURECiMr7WAQWbj6M8oRzbRbBSKPWQiz89TbK+wjT4/k4QCFjqewfhL0eq
	 FWeAhPha0le7E8TBWwK80ssmmcGF4umJA7lOuBPuoVCxfsbv0SUgLEQhxbwLvoAj5n/0b
	 8U9GWfuAeizaD2K7Da2eFda5VVEdefAfY9tdao4Yl/0naI0PHKDjLx32MZZzVclFf1wRj
	 Nf/XJyJjt3A6QLVNPMEqWcJbXHEkVuUEDr0o8pA5/HZcqPcfTaVNZ+2V2hgQsO/ywDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846536;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=s77Wh0jGQ82biYhvC+IxcW28aNcho8DkaL0D/lxzBTs=;
	b=XfEYxb3mqDpsWl5eijjjNlrkEp00ewIdi57Cti56tsWfJddNnlEC+kQE6lmvnYwBJuEX
	 OP+GJ+/+kOpSCq1JHOssSvPPsqzijjmGsGeqjDg9t6Ky/tdY+qYzTXJFFXDneXITr/e4I
	 LUis7x2E8f6jlTqvgNiV/besmbMcYQ0FuhzR0GToMQQ9WVo4pD8/M4UXYTFyvrWO7LecE
	 nmoMuVTaldkvoUuyItmj7cNTc9qnbIJ63pfq2DNDckcADv0g8YOTYXbHWYaP3J7vSEa/p
	 z8NXK2yCHJQUfCVdDKopCYW5b9SJfXjTCNp/C845CM+A3kEXBYNaQn/dM/SXsRmNfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxKlPkkV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF6606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxKlPkkV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6F51F000CB;
	Mon, 16 Nov 2026 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846536;
	bh=s77Wh0jGQ82biYhvC+IxcW28aNcho8DkaL0D/lxzBTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxKlPkkVR1FsjE3mEQJVUol+8UMOol2qBT7EUt/kL+t2ip/cnTVOkJH2xJus5gfSr
	 gzFXaUOblD82dGHJVBT6xvKQrGT2NuhEYmhp3IgeepmD7cDsJ/TXA3wy7e8sYoYOGn
	 xMQybATeb/yYkRK2+B2GpjA2dy5PAqfjowqXnhZPWFJYzcq84jz7P0YgSv7/9E+8kv
	 nL7i2rYP9yYdUp85N9TOuWyxamOeZCMWR/PUvJdHaQJMa4Vl5lVGG3QCXdbxb6HRiJ
	 qVpyBEYRnZnkeWrc0CzTvN/pg+rowgYJpGGwihM1QqvohAOxOjqWRHv7LeZV31Y74Y
	 MXyEuwpGreqzw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id A3AA4198003A;
	Mon, 16 Nov 2026 11:28:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 16 Nov 2026 11:28:54 -0500
X-ME-Sender: <xms:Qy_7arRLG_UdUq8qkXEY64ChlNdb-LHvpETpAU0Zyh3u2ujO9Z1OUg>
    <xme:Qy_7aqauMhLertWeNoutVTp3WOHQryiIEwrplJkYySJenfhzHpbO9rGldJn8Ggdb-
    QCEFyzJXf_5npbKbm1aLDBp4p_-91MF22M2HgFjqDgCCN-Sw-Ovm_s>
X-ME-Received: <xmr:Qy_7aoMSvgxEWgNaEKzT4wwcmsyaFttmuUwSFhQWUMSTolZBlcGk3vU6Q0E>
X-ME-Proxy-Cause: dmFkZTEHeSQUqRY1YhiGAt9xbok3Cz6xVJ5Xo3cfdcttzCYoRzXc8WXErePFu68Wle087D
    hXsQKfmFrb/APDBx0g1pr2Aa+HutXDgbWTbRTP7Oo4JH2epfiwmDtil9XvIHCmQRToNqD0
    H37WvBxy3jdygoEsZvmgMNfREfThGuE+f1/fQTxm/5o0v3LXAV6tA0KFr/8qm28SqLjKBC
    JIvQB7db13NmMEUQ6uicY6Wj1U2YPutN0ED61sQdotiWYJBY0erPuQxPjQAoZZKOHKEm1P
    CcSCuYQ79IWhDlSdDxsyaZJRWpg89Aij3uhmqBQtQttevR3Vm1wzASR/0SeNIObM2C2xnc
    RDA/5KFfa/eqjJkob8y6n3L2MsOHrmPlrRpVfQC4I7oC2NWb+2vU7DYstulbXClianeZvN
    hz6SpjO39Ug9ZQ9ldDmdTx8WrmCVG8/XGh2O8iMUMjsenDS7ogCZBAcLKOfGb5lwwV4BOy
    xMJxsm6FAEssW8JYs7csY51OzSNtNcNJf32P8O8w4Z+WCEbU1IgN4oDHIoGGPUqMaHSrpt
    WLylfruposUCDi1TPyDRkd3nHjmwduhDPEk6w0SUmiEfAuaYkx/jakAsxrW6kCFoaSF4NB
    GAlj9jnGsaNPLN0GfrTeUoHX6ZQNuRsSpHF4/7fYdpsUtSsVlNp6gigN1Y9g
X-ME-Proxy: <xmx:Qy_7ajNge65h59gJ5PeEE4jYojBTyP81J2yA0FOeaNDJOF898dHpPQ>
    <xmx:Qy_7asN_4RXOPsYejL8M9bOECto9bUKVRQOfA7r4uOzVXy-zSAocxw>
    <xmx:Qy_7avYYIK8u7x9s4QIZQgEyAGr7Qyrd0MSDYwg9VZwPuipYISLVug>
    <xmx:Qy_7aqjvvcj8KRi33l3BF_wnKOr2tP_Du7Vi1mYrMA_i-fhiCOXmkQ>
    <xmx:Qy_7arMWZXpiHu1sTF9s648ng43bZU-wyYhpHTqjt7OGLV8d113gqrBZ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 11:28:50 -0500 (EST)
Date: Mon, 16 Nov 2026 16:28:49 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] Documentation/userfaultfd: document RWP behavior when
 the PTE is dropped
Message-ID: <avsu-yTSPKtZn_Ez@shutemov.name>
References: <20261116101004.15322-1-azpijr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116101004.15322-1-azpijr@gmail.com>

On Mon, Nov 16, 2026 at 11:09:56AM +0100, Jose A. Perez de Azpillaga wrote:
> +The registration is fixed, but the tracking mode is not: a context that
> +switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below does,
> +needs the sync registration. This has a cost in async mode, because minor
> +faults are always synchronous: an access that takes a minor fault blocks
> +until the handler resolves it, even while RWP faults are resolved by the
> +kernel.

Nitpick, and my fault: I said in v1 that the registration is fixed. It
is not. UFFDIO_REGISTER on an already registered range with the same
context can add or drop MISSING and MINOR; only dropping WP or RWP needs
an unregister first. So the cost in async mode is optional: the VMM can
add MINOR before it switches to sync and drop it after it switches back.

Maybe something like:

  The registration does not follow the tracking mode: a context that
  switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below
  does, needs ``UFFDIO_REGISTER_MODE_MINOR`` while it is in sync mode.
  Minor faults are always synchronous, so keeping it registered makes
  them block in async mode as well. Re-registering the range to add
  ``UFFDIO_REGISTER_MODE_MINOR`` before switching to sync, and to drop
  it after switching back, avoids that.

The example can stay as it is.

Otherwise:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
