Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811189;
	b=TO5wagi12y5d2U2nS/NO7ggudGTzJvs6QTs7DGyB/BuQemGn58y354mN6H6ee93NtP0C
	 fxCPlyvnJh2+Jav9WcKGVDwgOTIePCRrHZmbIvnKIyYkh2X8PERNLWI3WamigJn/Vb3Mp
	 Nr4MEZNBRRJzTt4aR9ps6o+Z4KkX9rDE2IC02u2B+YdprF8Gvguqi1diNEHsKYdcxC3Od
	 k7P/9c4c81iEmoPu/ltvmtWvJYMxsoWWVZDTPa3KJkski7k+OmM9YEC5XeVTmuxILcAea
	 NeD2InUDd1L9d6/06i8t69RCHwZUiB0skvSfbmx3cTpMgVmLrAGeQSyKGf9nJcFsnAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811189;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=THYlU6dsxV8ed96P6OJPtEWq8tUs/nV5roX8ImFt+iY=;
	b=dV2DFtbny2zY5SOwfwVN5gIZ2/MhO2Fx+24osFPxKigW5vkKF/LrpR/F8k8ISwUMGvpS
	 19zi4kBmk297m+26SCXL/kLuudPYByE2LWzHdnZW3w3uAgXwIaPUfAf6CcL/3NB5PzL5L
	 fulTY2s603E7gQrNDYGimIXU8XhrG7I88HC5x5gU0ntkVuUBEmTFnv3P5zXNZ5Y4OBsGG
	 hkhNI6PLpphsIPsiPqgI9otTqckQK3vLlWhVl4aQbE8/LDnxJF5ITXqxMBVKqNbXrUZSC
	 NLGHa20g7k0oUIjbE3U1v4E2U29ZHam3Y74rce3Vog75wkt4KpmhVfdIqavv0Uc2yew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eldare.de;
	spf=pass smtp.mailfrom=eldare.de;
	dkim=pass header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=oZXJ+AUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.169
Received: from mail-107169.simplelogin.co (mail-107169.simplelogin.co [79.135.107.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908B606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6908B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=eldare.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eldare.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=oZXJ+AUw
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793811186;
	cv=none; b=SluXq3sRcXMlxa5jQlbbz/qnJSJjqMu/QGGItDUcF4QVaiiA5styoSb5RBSpEXEAcVjRoVxgqEMn9T8CixqP8scB501DmCMNlw4i/Ci+y+LjkBrNaoIx+UANvur9Y3P6aTPzfdu6jZIx7uri5ucGl+VEcHl56RlBviZ5j2uxvl3tnrZBm9pkv/yOLgPQN7PMxZRCnRrrG14k32rqAkstMeSo/P8/e9UFFW3AaHmAZnAztH7G8wyjiZjPk27h5UHTUgyzRsxsGVyQAe+t/0socTCMDjci1TI26hiLKmZ5IUe6zjGIADoB8ks6lCV20SLsx77NO1mEIfEmUISUVPg5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793811186; c=relaxed/simple;
	bh=b22BmvbWIYRK51tJiOsPu3kTH0mAG+T8cRcAHNYNM48=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=n/kmCJ/Jy2GPa6VpLdKKUre+8murVDHIhWMJCaX9K9fsOhIquEQMp9S0sP0r1XgK5CTc1Yjq/05LoKUaJhDaRlEnIY1X28yN2dwTSO7NwnY3V7x9yMU8n2RO4khIaNM7p7useA5ksskL0NBlcRD3Az++V3sDF1EkRs9miTGomI5o3cjBf5LyT3+bvVoYcXVRVbxqZQO7Oo0dx6XS5896UAnYwl5vpxd/dxTSrldKtl+SjJhAOdZ9r5FZJ0LSvM7d+pKjr+FmaC1DSxE4WOsRcCRk61l8UXlrsF53RIjhLdA8PY7GyKLE9sPf82E0QV9pJVSq8/GIOnY855/zlEgrlQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldare.de; s=dkim;
	t=1793811186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THYlU6dsxV8ed96P6OJPtEWq8tUs/nV5roX8ImFt+iY=;
	b=oZXJ+AUwxM6RM+1eKXzzcCleHcBT6kzHY5OKurxWzAx4DxNcPUBA7Uuek+APdpSwPz979P
	8QfmAEZjgsQomgPZ9tEeY7D/sQIZdDc3oaR0wEpMngHmwVOXcWnQrgoQj05vPyvk5pjDnT
	Dz0ZU9cNRJzp1m4FB3yVsoy7+cfiYaU=
Date: Wed, 04 Nov 2026 16:52:59 +0000
Subject: Re: [PATCH net v3 2/2] vsock/bpf: fix zero-length,
 MSG_OOB and MSG_ERRQUEUE reads in recvmsg
In-Reply-To: <auSngVsWiGI475J4@sgarzare-redhat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: jrmmhm.kernel@eldare.de
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>,"David S. Miller"
 <davem@davemloft.net>,Eric Dumazet <edumazet@kernel.org>,Jakub Kicinski
 <kuba@kernel.org>,Paolo Abeni <pabeni@redhat.com>,Simon Horman
 <horms@kernel.org>,"Michael S. Tsirkin" <mst@redhat.com>,Michal Luczaj
 <mhal@rbox.co>,virtualization@lists.linux.dev,netdev@vger.kernel.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,stable@vger.kernel.org
Message-ID: <179381118562.7.1635260105890086879.1746288140@eldare.de>
References: <20261028-kbh3-1-022-fix-v2-v3-0-bc0752b2d3db@eldare.de>
 <20261028-kbh3-1-022-fix-v2-v3-2-bc0752b2d3db@eldare.de>
 <auSngVsWiGI475J4@sgarzare-redhat>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1746288170
X-SimpleLogin-Want-Signing: yes

On Fri, Oct 30, 2026 at 03:25:26PM +0100, Stefano Garzarella wrote:
> Ditto.

Same as for 1/2, I'll rewrite it.

> >+    if (unlikely(flags & MSG_ERRQUEUE))
> >+            return __vsock_recvmsg(sk, msg, len, flags);
>
> If the psock ingress queue is not empty, wouldn't recvmsg(MSG_ERRQUEUE)
> (e.g. a MSG_ZEROCOPY user reading completions) also consume stream bytes
> through sk_msg_recvmsg(), since it only looks at MSG_PEEK? If so, maybe
> worth mentioning in the commit message.

Yes, when the read passes a buffer. I reproduced it: without this patch
a 1-byte MSG_ERRQUEUE read with stream data in the psock ingress queue
returns that byte. A zero-length read, as MSG_ZEROCOPY users do, takes
none, but never reaches the error queue either: it gets -EAGAIN instead
of the completion. Routing MSG_ERRQUEUE first fixes both; I'll mention
it in the message.

> >+    if (flags & MSG_OOB)
> >+            return -EOPNOTSUPP;
> >+
> >+    if (!len)
> >+            return 0;
>
> Is the order of the checks important? We should mention it in the commit
> description (if it's important or not and why).

Yes. MSG_ERRQUEUE must come first, or a zero-length error-queue read
returns 0. MSG_OOB goes before len =3D=3D 0 so that recv(fd, buf, 0, MSG_OO=
B)
returns -EOPNOTSUPP as in the native path on a connected socket. I'll say
so in the message.

Thanks,
Jerome

