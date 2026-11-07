Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.160
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046276;
	b=UED9oiAj9gCErWI5pB28v/WnBZcLY5brCGRsM3ZLqCUVOb+5FqhMoyeSrRIC8eZ6z5YP
	 QtFAroi9Hr/3sr79P0Xe8uOeWaj6NOS3qKl8Cw+QIBUZdPyqGV2fnufod4jtplEvYVAUV
	 JkewGXGbQQeoqpUL22VCUUpjOBABqsZKeywL/sbC96kc4V8XH9cWh/rTqV4psQ37xLocP
	 y1RqKAEkRHiMHKORN59M+c69dcMRybhdekF2PBcNvtjQ0DQHhtA+qppYcOJlu/mbbCQsu
	 Tzk+rvlO3k8jztTpHMDLJnLLg/TJaDiU50MxnGZJOGbeJ3XMPFzFJ/ttyroGeYniCdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046276;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=D8qnkZYaP8QEiEnWStUV7Ol/+8QaugHXvxXWg6fF5ic=;
	b=X8DLQlj8b4Zcq9Il3KBk6T965Gp65nizHGfTOaXDisDolM8oOolZd0AIvOirIjq6dHpp
	 Pf57X/OFxKnfEp1p9diOhOWXGvrqaYWVTAmq3EMoqFuVsw6j74AocWUXph6yGGpOp2ceU
	 j1w9/+DWv24WwK/DJ9jG9SaXqFux4mEbrYo8HtzGfRM6cK6kmJ9n6wQo0ffSQLVaNCEYf
	 Frs88DLDDfIs+u7eGhnn8TodZUVv7l3b0Li2QhJ/+losN5+xg8kjG5MAuvxJFSVdeGoRm
	 8ltdy+pmcdbJNc/U89cA8MsldNCaGQttOwXxVT33/WTXRh2lrn8Tn4MJISGrIk7uSSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eldare.de;
	spf=pass smtp.mailfrom=eldare.de;
	dkim=pass header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=q1TwewhQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.160
Received: from mail-200160.simplelogin.co (mail-200160.simplelogin.co [176.119.200.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=eldare.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eldare.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=q1TwewhQ
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1794046268;
	cv=none; b=xS8aD2HGe4ybkhvAxcy23Uju9Ua5YEWpDolaFfugRJIyOELJSe5QQlSii0wucOr7B4RJJ/WNHx/NT6QALUCgiNWsMaPB27e/IieEs6KEWLgzwZWswCUunjujVx6JSeZiXOROGvGWGNueEYkOLp1WcnB2hIbKd+wFbnCLnoBkhxw28lUQWlUatsLMbyd2nXrNTNUfcZXHA7ynBYr457CMOdg0SEr0uiHaP3pjKlquz8mkiFkm9Bp7i9gQ87dnFYO6SKthrFzKWzhIrfIQJYdfYI5U0fiK+gvpmIV0PXW00cjOzhGxmHvqpg+f6v/oK7j/HKLIuS9V9Qcmgwvq9cocSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1794046268; c=relaxed/simple;
	bh=jVDqDvrRQsAZ22D6DF6i3XHA4gMN1HWL8uRQDdFvR2U=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=OX5iolHxHJ7GYPpDAjsIleRleMrzWGFDdhT2pZdOnXqsPrCgPcbX4KL4+n51w5mdN0MdGHvvhCE4SBwA1L5am8EbcQXX9AwUDmo/PK3k9XFI/XzZlOqRbUzDTcGzX5IWu4WbSHR272laR1p8yN/I/dXq/C88FaE7ayO2cInSUO7K9fqLKK60Wa6q6AunwfWBkI4LjcWkI605If4xgak1EHHMB6KgqxRtNIt34u2HS/aWrRVSQBpAKX4obHU5QwToPAYxlRrbt40J5Zv+pITZRoeLE84G3tDs5edZHtSnNCHEizFbVQQUZ3HcRrXA/+j8iKYKMyylaCw8+am5lLy4kw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldare.de; s=dkim;
	t=1794046268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8qnkZYaP8QEiEnWStUV7Ol/+8QaugHXvxXWg6fF5ic=;
	b=q1TwewhQ5ajU6fl/jS9kD6SZHUNm1uvJjg5h1dyrlxc5eqF6z6dCKtUiv2tJrKBMntPJpo
	H5HftQyv7G7nZU/TewxoX/Deayyh04N48Wx3Syis0La5ohbqg+kxKYB3nSuNV+Yv3FOLDx
	tyFt8DB4Y1i0OCssow0jX6SOn1A1+YY=
Date: Sat, 07 Nov 2026 10:11:02 +0000
Subject: Re: [PATCH net v4 1/2] vsock/bpf: release sock lock while waiting for
 data in recvmsg
In-Reply-To: <DMOM2SFCFHYK.3BT44IQ90X9UB@gmail.com>
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
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,Bobby Eshleman
 <bobbyeshleman@meta.com>,"David S. Miller" <davem@davemloft.net>,Eric Dumazet
 <edumazet@kernel.org>,Jakub  Kicinski <kuba@kernel.org>,Paolo Abeni
 <pabeni@redhat.com>,Simon  Horman <horms@kernel.org>,"Michael S. Tsirkin"
 <mst@redhat.com>,Michal Luczaj
 <mhal@rbox.co>,virtualization@lists.linux.dev,netdev@vger.kernel.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,stable@vger.kernel.org
Message-ID: <179404626756.7.5004773530941890450.1753698952@eldare.de>
References: <20261106-kbh3-1-022-fix-v2-v4-0-c7d36703814d@eldare.de>
 <20261106-kbh3-1-022-fix-v2-v4-1-c7d36703814d@eldare.de>
 <DMOM2SFCFHYK.3BT44IQ90X9UB@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1753698993
X-SimpleLogin-Want-Signing: yes

On Sat, 07 Nov 2026 02:09:17 +0000, Alexei Starovoitov wrote:
> No need for a 2nd copy of the return values.
[...]
>   recv()                          no sockmap    this series   the diff
>   ------------------------------  ------------  ------------  -----------
>   after a virtio reset            -ENOTCONN     -ECONNRESET   -ENOTCONN
>   after a reset, len =3D=3D 0         -ENOTCONN     0             -ENOTCO=
NN
>   after a reset, MSG_OOB          -ENOTCONN     -EOPNOTSUPP   -ENOTCONN
>   after peer shutdown, SO_INQ on  0 + SCM_INQ   0             0 + SCM_INQ
>   asleep when the reset comes     -ECONNRESET   -ECONNRESET   -ENOTCONN

Agreed. I ran your diff in a guest with the reproducers of this series:
the deadlock, the dataless wakeup, signal, timeout, peer shutdown,
MSG_ERRQUEUE and MSG_OOB cases behave as with v4, with no KASAN, lockdep
or hung task report. In the first four rows of your table the sockmap
socket now returns exactly what a native one returns.

The last row is confirmed as well. I'd accept that and say so in the
commit message, since it only changes which error a reader of an
already reset connection sees.

> None of these tests sleeps in vsock_msg_wait_data().
> The sockmap tests call select() before recv() or pass MSG_DONTWAIT.
> vmtest.sh doesn't use sockmap.

Right. v5 won't cite them as coverage of this change.

v5 will be a single patch based on your diff, with your Suggested-by.

Thanks,
Jerome

