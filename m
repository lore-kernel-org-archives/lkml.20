Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AE44F7965
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414132; cv=none; b=LE7Pnf9B3nCaly8msAC00Qc4O0tDYMgCYa/FQnjAmxAJBotpW2a0m09aM1IjgPlw10o6GTRorrHWK7gdPxRUQ2AzH+P7O++eRyDpWWSWhqcx3MjAPMA3MReysv9wUvR9uxcDoUwclSBo2y5hQyDA2TxiUir8M0pwFVLLrEeP5c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414132; c=relaxed/simple;
	bh=82tscvJQeALvTjkOiogQrI9DMuVsqZ8C8KWnmNFXNYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efclnMf/NgXVyrAK6FbVTtEXHUPVtgGDPL+5xfd6FHoqHIQCq6iJYktZ+Q4oMXEozqfBrRxWRTWLvzTNvV1ip/gykYH0J+tTppecM8JIrDAE7tSlCaxt2E54p/lq7XkDBv9hO2fmdIt6SEBSuD4yV9mf3A8uwH/QZPfADcXq2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAL0Wg6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAL0Wg6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33601F000C4;
	Mon, 19 Oct 2026 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792414130;
	bh=82tscvJQeALvTjkOiogQrI9DMuVsqZ8C8KWnmNFXNYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DAL0Wg6/9CAY7gjHSBkAIkZf4BBRLeX/6ZZt7JE3LLky3y4IS8d7a58QHpZBfaSB7
	 TslxDHWWf1ZqKCJcZ0ipcVYij3tquqIkl/+kqoSrTXhVpDBydYN6+ToqvvP4Uwfh0R
	 zsIMQckdj6m0knPgc1UlxUtutdlGQmKFGDDfjheKS1zqzsdSnaeaMnEdP91F4/fil7
	 4EV7aJHIfg8CKSeWLa+90Kfm+Y84ZWDJEjnC9X7K+J0mNTKqc4nrNvRLIMBX/M0Ye/
	 EADLl6zZnPR+onOPKGcSylhtfcavSqIIZte65E+s6gIomP32z5xiSZ0fcZX8E+BrEK
	 +DE9/BZfZBehA==
Date: Mon, 19 Oct 2026 13:48:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: read vm_map_ram block regions from the
 requested offset
Message-ID: <atYRUyFHca-giQcw@gremlin>
References: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
 <20261017231325.796986-1-nickolai@csail.mit.edu>
 <atSM69faDNgmLNVJ@milan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atSM69faDNgmLNVJ@milan>

-cc slopper.

Keep in mind that this individual is flooding the kernel with slop.

We should be wary about encouraging this kind of behaviour. I suggest taking
over patches, 'discussion' will likely result in having to deal with a meat
proxy.

--
Cheers, Lorenzo
