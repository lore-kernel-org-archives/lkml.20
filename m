Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240459;
	b=Rx5hMQN1QZ0h8VaYNWtP911nt0j+Qdxn5oS63ooycSovPT9Ton9Qk7H1Xb/HbKctwxe8
	 aa2/Ax8da2IrP2pWbSNrj3K8A5C6j0MhGYIUc9d0H037AW2iEeLUchcwjrEr5ZQs/34G5
	 DHEKMfDvw97utyPqDernooxx+DkQr/0Zgv6LlbjJ1ayUQ+twqbUR3Jy5hRSunwYnW9hcy
	 6QGQPrBjKs59i/2uKJBHyF0zEoWRtAK3hsC8xfE3FCDgspGI2VwZ8+jPid6e22JrjX1kU
	 WDXTk4KGlCnXVY7E2klsq8jomK25lXI0rdwzUJs8c3JdGlieYTh4YOKF7t0MpeIPbfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240459;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=FnIGs5zvaQiHI5YN+vMMC8koXoNVqfs7gn9S8TpFSeE=;
	b=WJyeehQmswEls5vquKeT/+kpzojqCsgA+XvAyQPN0DAYnTq/NnsVccb8rRc9UVV6ZlEN
	 qGWhEJBPrGIcV/4ZmsbfNGbchc97Sp1AlafMm4xVeL1TQuN+xVlv9Kki89Yn8Na6nYPQg
	 AnCZIkPQ+4EHhbQKhxj1eqYBwooI2H1+B2ycH6YNytK7woZSGrVRzcbD0TK3WgJxXi7vm
	 bEMbLuIaUpnKbRol8eSfWl8dlVR0DeRKniNmyiCO8e3Rksd17AmXTSxbuDfpqN5cuAcaN
	 ydnXnB0h0YsIc/rysifhawh/TJtgH6kEENFp8dM2Xqon8asdCqlu9fwm9To5dZqP+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=temperror header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b=AURki8qk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LK8b4wi1;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9519E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b=AURki8qk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LK8b4wi1
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 10C9B7A00D3
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:20:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 28 Oct 2026 22:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793240451; x=
	1793326851; bh=FnIGs5zvaQiHI5YN+vMMC8koXoNVqfs7gn9S8TpFSeE=; b=A
	URki8qkzoudFlSLYtbCO9UOaTIYGezTCZGijKXCxIa3MlfLnCO56ytOTLlhpR0W2
	LWpO3EeEvyQER8BZwr4lhGIfvm3cX0+DLDKs4jxoVwrK8TccUcTMziKfxoBx+bZu
	XX++higaIeJmB3Mp6R5LsvgeGdHseNSUQARwi856uaw1oNehksJX83JvzlTKKBf2
	Dn4yKBL01oG4eZ1n/AHOiBq9pUJndkHaOkrDgwO5SMAJ0kvTnZSPux25oaaF4UiH
	6mgOL96SB6BrU/lUVTz76q/cotcE9MWSEAk+v6D8zgUY79DB/5tspqsf8ZgkEqVS
	QcaHCfJsPIima2fldK1yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793240451; x=1793326851; bh=F
	nIGs5zvaQiHI5YN+vMMC8koXoNVqfs7gn9S8TpFSeE=; b=LK8b4wi1ny3vi0lY5
	y2TKl5FfO+XQR5vuxRihE9tPDwBEw/1dWDiG78fSs1Qt2qcDn6N5GqalEoO4O9OS
	v+55PKZWK1UopWnafU4osAgpExlODoHt1d91wXNLf3zoS+4C7QCuEDO4OGo0P/Fu
	NTzeN/JrQ3W5qUOIXHCpAke2XdvySpnDN7/vkx8nh8MQYjnrxsYiwSdazxrC2jr8
	5rtV6yAPViUDItiyqTWXot/We18bq+yu9dzpP7meCDDJvogLkn2NrUm6LQOKBaBn
	g9xjPuOGXs+euITj1dOQjlUiJhd/Ha+PfKcgvMhXrWUg7t4NwkH6617vJTaS4tDl
	yM0+Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793240451; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:QiUH35OySSjr31HELxLTS9oXMUvJZvjBZfkL80oiJWgseg4
	1922pzm9mQ4VwdzX4h+EZhEPmAyHoR5RKR4cGAfFJrt1X7XD3XVI9U2FhOm3SNfT
	WXMTOC80SSOgyeTkPV5NbqQ/wB7C25RssgE4Ak3hs40lY3Ud81QQWx0uCd0/o88r
	+kGqNZCUWzEZK6qiZw6Hx/tBMDqIrkM/UYmB3PHTuOW05rEIeVw5bdYFeIcAxKen
	wbxdZRJnQq/q4zZQAZJHmTuzM9CyXDgdBDHOQKqhozfF35lFRVaDj0DK+nXImhxj
	kqeWOjUwcP7VK1O719IKUMyU30qcvk5t90xxFBQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q0lkkojjonjCFUJ49fzPyp7gZq7ZCT4Y5HU9yQ24TLs=:qwontJLdIzb9RU8GMD6zbDjrG76zYDVJKcnHR2FgzMo=;
X-ME-Sender: <xms:g63iavGPUTX-r2pbvDLAAOAjAWus7yYPeU4tYd5bbsYC8wGKYLi0EQ>
    <xme:g63iasyF2rzV7C25dk5z4r8vGcdIxe6goo6He_c70TgGbKRbDs4_dt4hV_nkoekwL
    EWXnoq7xc8osCG7GE7cqVohC19U6ujCzZK7tCQf4VVFhYgrRFHJ4qYMXg>
X-ME-Received: <xmr:g63iah08V8bKqw1o_ck819wO7P7v3DUfzuxmaDrLtvjbbapXpYKgwrUGkZBhCxbM>
X-ME-Proxy-Cause: dmFkZTGu4XUOfgn0HvschUvTnaxsX40JE9DQrlLX5hT+rO1r01JY+LQaODlY8LQFwFHJOv
    MRpEM2dunQiqxFV+DatHcDRdj+GTmQ1BILO5RUj2tkXHLGwBScPqhfK4f4Mm8HdsZe6DzL
    eAwHA5G60fkIoc1gE178ENPYyw6IQrCpmSyoxBnKe/AfsLqtO8EFmkCa8j7ZNfZ4M+bQ+8
    KRZXD4ccItruJuHCocv5936os/di7ZxBt8Z0ttA3FKbTXsy9NrFhYbnVSZ9Ail4l6D/RAp
    IEFiPJStakyul8MemCs+lDY325re1nK/s/zCAA2+YbhT643GSelo4fvBmAXJ/Je0r2CBs5
    otOU5ZkjtqZ/Yu8Ip4qEDtkKBjoYxGJ1yLDX8YeBkYUOZUY55TgMIdnq4IrmoVYDLkA6TU
    JRqLmsyGqtjD+XF/AAHqb3WhwugCwpOCOPiPachYyqK4aSRyvZhKzzsr6RiqjNOuuJkJTM
    TANkkXdj1/zCdPSPEqz2enoJYaR9kPO8Lzt7E2Bvd2PUmEEfePJ2mbwlUeu7LpCHOjhbTL
    TXBFPLq21OkF9XC7fTfamO/UxvRmQt3Y7v2h1i4sIc75wXb0NRA8tWf+5oXOJ6NZcB8U/C
    qV/6zYRWRubqi+Ko+n1XvcAhAIFUigzlN0CuWNWqFZbjR4zNrptfD5/YP5Wg
X-ME-Proxy: <xmx:g63iakqNrtvEuvUKxh0lo_jjEOOefJgqpojuzAKNtiCACBE0dQ-xeg>
    <xmx:g63iamXdIDwrieMm3qGvl8sr2EpsSUTa99RtJRRNwnqEa_4uyOpLiQ>
    <xmx:g63ialoDeAA2LfUcHApkNFgnhd2VRMs0n5wJ30nxvuTYCoQJitc2-g>
    <xmx:g63ialAhMoXp5Fqgzu282NN1Jnw-xu90nnRnTRi3cw-n2Q-trVXfkA>
    <xmx:g63iauiGVV1ixC1PWnlNsi0rATMpk4hV9CLOlZNBPJxnqQhtwiWF-W2Q>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 22:20:50 -0400 (EDT)
From: Ian Bridges <icb@fastmail.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH] ksmbd: enforce the DACL permission check on delete-on-close opens
Date: Wed, 28 Oct 2026 21:20:39 -0500
Message-ID: <20261029022039.224864-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAKYAXd8PwT4aaFgUg82NYZUB=pFNasL2QN7TGGpJVaZjFXCuSg@mail.gmail.com>
References: <20261028153441.184701-1-icb@fastmail.org> <CAKYAXd8PwT4aaFgUg82NYZUB=pFNasL2QN7TGGpJVaZjFXCuSg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 29, 2026 at 10:38 AM Namjae Jeon <linkinjeon@kernel.org> wrote:
> This patch causes smb2.acls.INHERITANCE failure in smbtorture test.
> Can you check it ?
>
> failure: INHERITANCE [
> (../../source4/torture/smb2/acls.c:1054) Incorrect status
> NT_STATUS_OBJECT_NAME_COLLISION - should be NT_STATUS_OK
> ]

Thanks for running this. I can reproduce it with smbtorture 4.22, and it
passes without this patch.

The inheritance checks themselves aren't what fails. It's the rmdir at
the end of the i == 1 iteration, which the test doesn't check, so it
shows up as a collision when the next iteration creates the same
directory.

In that iteration the parent directory's DACL is

  ALLOW CREATOR OWNER  WRITE_DATA   (object inherit)
  ALLOW Everyone       full access  (no inheritance)

so the new subdirectory ends up with no ACE that grants DELETE. Windows
and Samba still let you delete it, because the parent grants
FILE_DELETE_CHILD. ksmbd doesn't have that rule, so even a plain DELETE
open of that subdirectory fails today. Before this patch, the
delete-on-close open that smb2_util_rmdir() uses skipped the DACL check
and got through anyway. This patch sends that open through the DACL
check, and the check denies it.

So the test is right. What's missing is the FILE_DELETE_CHILD rule.
Reverting this patch would just hide that again, and reopen the
delete-on-close bypass.

I have a fix that treats FILE_DELETE_CHILD on the parent as a second way
to get DELETE, like Samba's parent_override_delete(). It only uses a
parent's stored DACL, and never looks above the share root. With it,
INHERITANCE passes, the rest of smb2.acls and smb2.delete-on-close-perms
are unchanged, and the cases this patch blocks stay blocked.

Would you like the fix as a separate patch on top of this one? Or, if
you'd rather not keep this one in ksmbd-for-next for now, I can resend
both as a two-patch series, fix first, so they reach stable together.

Thanks,
Ian
