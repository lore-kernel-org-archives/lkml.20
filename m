Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878990;
	b=SHkDh9S5C7OwvjqQjZScqrGEl9XKB24goZm8KZ3o325pvKINFdRxV+msTPzeaUYlWi7W
	 8HgDvI3bEZAjjumkQM5vVzQLsY9MsmB1H3Df9P1+KqfyXmeuUm5tRD2OO65Rk5ZwaUv/W
	 mTzsKhywT+/xucfQHwC9rPf/oh8duqvQegtJioNfbIOfFo95BU3TQSYdO38vCUZrG3EQO
	 CN5y2dx/D0TSalkbYU+7OKGr6bVXlnEGBtDs63aEwDKEDh9fYgh9V7YK7cOdum9h6qm+I
	 LloONlXxDHJT+VsEG18xj+GB1Im4n/r4z+9WvkZNY34Xvwu8dpvQvarJ7/Dz2V7ke9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878990;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=CtFKvnlIX311Hhi2kDKuMQE1feBXlWoHiYWdjrnOIfI=;
	b=W4iOKmwLd/l9+QQqN/zJmLVZwUDcTSwgL4ty9cvFDZBt5nonGoxSBlPwuB55a3Brij2S
	 OFVQ34F1J5ke7Ab1uXNdIhhiX5R1p7qQPLBxGZC9dWVIYXjnBmhxKaax3PDuR94sN08QP
	 0iK6Ps+Ww1GDMrrtAGOnVuqV07DpfFtqS8eGRwPPKZuu9I4/hdMG4gVJpo4yloWg3FOPN
	 reud41mCnd8YBnEE+kfc1U0e9BSleuhBpZp5z9Dq8uRTtO9N6DQJD+AcF7lZaOjVcZ+Ii
	 6/J6mAABdGk8UAflJN4kgfxrQPfTSCLRU4eQwTVlYg9g1bc6rIhGRVZvcdNvVB06iWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=jZZxI+Gj;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE7606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EE7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=jZZxI+Gj
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jL0mh3yZLzMlJf;
	Thu, 05 Nov 2026 12:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793878980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtFKvnlIX311Hhi2kDKuMQE1feBXlWoHiYWdjrnOIfI=;
	b=jZZxI+Gj2Gu151/rDiqEmPY1yL9TBPTcY+eLlSlG/YeRz/4CI6FyTIpOWVX6nVZZmlY0sL
	uJupM3mgWNziE6J/lXvKQggitmf3a9rRJpARKL8BrzaxLF+JdPpj3+BMqnDYd8IK69v+ws
	Ud5/G2TMGwDLmxNcIPM4wQRAb2WCgtDF0sY9cjSCmIr2Cgo7txZajL5HQtUnWLSoCaWWse
	rZuQaCdiJePbPGA7ic4JO3iUVSnQvVZgsCL2UWjAuduGGxNDEjAPEuCo5x20fzHnY0TT1y
	qjVXYnVZaUzj0JuDdfpTjNkF/S/Ejs4FbygPHA8mdo313ALXfTSZ0JsF0VaV9w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Thu, 5 Nov 2026 11:42:59 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: Ray Wu <ray.wu@amd.com>, Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Chenyu Chen <chen-yu.chen@amd.com>, Alex Hung <alex.hung@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Message-ID: <334451133.560622.1793878979804@app.mailbox.org>
In-Reply-To: <930da65c-67de-4d05-9734-deb58d8981ff@amd.com>
References: <20261029171219.2842014-1-hugo@hsal.es>
 <3f79f22f-a8e9-4fd4-ab78-2403d38b1292@amd.com>
 <313360626.451345.1793787476448@app.mailbox.org>
 <930da65c-67de-4d05-9734-deb58d8981ff@amd.com>
Subject: Re: [PATCH] drm/amd/display: Don't require DMUB PSR caps before DCN
 3.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jL0mh3yZLzMlJf

On 11/05/2026 9:45 AM WET Ray Wu <ray.wu@amd.com> wrote:
> Please give it a try and let me know if it resolves the issue.
> If so, I'll add your Tested-by.

Hi Ray,

Your patch works on my ROG Flow X13 (Cezanne, DCN 2.1). I applied it
to 7.3 in place of mine and booted with amdgpu.dcfeaturemask=0xa.
debugfs shows PSR support on eDP-1 from both the sink and the driver,
and with the screen still, psr_state goes to 6 (PSR_STATE3) about a
second after the last update and stays there

Tested-by: Hugo Sales <hugo@hsal.es>

Thanks,
Hugo
