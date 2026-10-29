Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300115;
	b=LCcOHLYXgIY+3LaCZFUYL+a3mrXaI23JWYy7qQNvNj+sf5oCF9iY4A4SA+xV2KIt456s
	 xgpU8gUlX1BlXgiDhZjQaLnUhIoVY5R+oOHKiKvBjdGWZBTDbZOFoBnQCr5G66zvwQ3PH
	 IdePtd+oheXwzL2Bz+9P+qhzYiWFRVeILjH4ALfHFBjVvTrdhibqlW1ba2husGRFnGnd4
	 UFP9l+diEpvUmgAI1HXntMP/fu8hniJ6l8S6CzKC7KlonpAmX2cWk4lWDkBg40RwigYzh
	 Jv8bp/1p5ZCc0HXzBEb816dox7X7FcCKfrpthNicoTgmaK+ujczmtKvTidZAO3F9y5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gUvl5WqmD9NdeP4SAbNgXpqCBWFdA8ZWyAHGPR7kM9A=;
	b=pWk8fOaBqvI6JOFcC35PCaN+j2IN3YbFH2vGuaZsKoqICD7ESz1XMyJ3DP+1PadSE/ZS
	 WYpyfc//+/0PEU2wlP2Xg0PSe33hxtObGno8NM2Z4+ODFxxSrgjmZBmhZJprNWtKwFL66
	 chslRYRtElI/oB8sWtRdOq3mTzN0hB2XXaiftvtEmvMB1kxZ9YIRUXZb77x6rtmV3UJE2
	 Tf55BIUBTDy4ZFjLupTbpBXuoDFEBTmT4QZBl16MvzHbG9i7aHjfsUVmfbbX1xm/XcXHv
	 G1kDyts7Hest0aCAWiwXPTznSKqkpTtfBTDzQEHASfkY7MhRlxpPgkL4BCT69piwUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=YZEeVVQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C0606A332
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=YZEeVVQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79A71F031E0;
	Thu, 29 Oct 2026 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793300115;
	bh=gUvl5WqmD9NdeP4SAbNgXpqCBWFdA8ZWyAHGPR7kM9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YZEeVVQ0HWyMbtYXSm1tuNEnWeuWZktaclmkU4T/7bh2nDKy9xSEXJyryWZqMZmmg
	 rMErXHY7t7NJaPtR6Zj+AlNYghoDkEKSi3vIiz5kyJ+47pJNNGLXD82oVewVMkjTcw
	 ed3ThzKKJZ4mt9iFTsvsKTJ0Yih5hJdnDeXiFi7g=
Date: Thu, 29 Oct 2026 11:55:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Shubhang Kaushik (Ampere)"
 <sh@gentwo.org>, Davidlohr Bueso <dave@stgolabs.net>, Manfred Spraul
 <manfred@colorfullife.com>
Subject: Re: [PATCH] ipc/msg: align compat version-0 msqid_ds with native
 IPC_OLD
Message-Id: <20261029115514.fd04df0fb01f070f0e960eb1@linux-foundation.org>
In-Reply-To: <179328314077.648427.7284615104475689945@gmail.com>
References: <179328314077.648427.7284615104475689945@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 07:12:20 -0700 Cheng Yongkang <teel4res@gmail.com> wrote:

> The compat version-0 IPC_STAT path copies the 64-bit counters into the
> 16-bit msg_cbytes/msg_qnum/msg_qbytes fields without clamping, and leaves
> msg_lcbytes/msg_lqbytes zero.  A queue with 65536 bytes, 8 messages and
> q_qbytes=200000 is reported as cbytes=0, qnum=8, qbytes=3392,
> lcbytes=lqbytes=0, while the native IPC_OLD path reports the clamped
> counters and the full values in the l fields.
> 
> The compat version-0 IPC_SET path reads only the 16-bit msg_qbytes and
> ignores msg_lqbytes.  A caller following the old ABI with msg_qbytes=0
> and msg_lqbytes=131072 gets q_qbytes=0 and the queue stops accepting
> messages, while the native IPC_OLD path falls back to msg_lqbytes.
> 
> Mirror the native IPC_OLD handling in both compat version-0 branches:
> clamp the counters to USHRT_MAX and fill the l fields on stat, and fall
> back to msg_lqbytes when the 16-bit qbytes is zero on set.  The compat
> IPC_64 branches and the native paths are unchanged.
> 

Thanks.  I had LLM poke at this and it had things to say:

: The conversion changes look right, but the Fixes tag needs correcting.
: 4693916846269d only moved the compat code. Both omissions are already
: present in 1da177e4c3f4 ("Linux-2.6.12-rc2"), the initial Git import.
: Please drop the incorrect attribution; the actual introduction predates
: that history. Keep the stable CC.
: 
: Please also coordinate this with the unsigned-long msgctl_down() fix
: from Shubhang Kaushik's "[PATCH v2] ipc/msg: prevent msg_qbytes limit
: bypass in IPC_SET".
: (https://lore.kernel.org/20261027-ipc-msg-qbytes-v2-1-48d8f72f1359@gentwo.org)
: On the current base, your new fallback lets a
: privileged old-ABI caller supply msg_lqbytes=UINT_MAX, but msgctl_down()
: still narrows that to int and installs ULONG_MAX on a 64-bit kernel.
: That downstream bug already affects other interfaces; this patch makes
: it reachable through the repaired fallback too.
: 
: The original bugs give legacy 32-bit programs wrapped queue statistics
: or unexpectedly set the queue capacity to zero. Subsequent sends then
: block or return EAGAIN with IPC_NOWAIT, even for zero-length messages.
: The ordinary capacity permission checks still apply to the long value.


> --- a/ipc/msg.c
> +++ b/ipc/msg.c
> @@ -686,10 +686,17 @@ static int copy_compat_msqid_from_user(struct msqid64_ds *out, void __user *buf,
>  			return -EFAULT;
>  	} else {
>  		struct compat_msqid_ds __user *p = buf;
> +		compat_ulong_t qbytes;
> +
>  		if (get_compat_ipc_perm(&out->msg_perm, &p->msg_perm))
>  			return -EFAULT;
> -		if (get_user(out->msg_qbytes, &p->msg_qbytes))
> +		if (get_user(qbytes, &p->msg_qbytes))
>  			return -EFAULT;
> +		if (qbytes == 0) {
> +			if (get_user(qbytes, &p->msg_lqbytes))
> +				return -EFAULT;
> +		}
> +		out->msg_qbytes = qbytes;
>  	}
>  	return 0;
>  }
> @@ -720,9 +727,23 @@ static int copy_compat_msqid_to_user(void __user *buf, struct msqid64_ds *in,
>  		v.msg_stime = in->msg_stime;
>  		v.msg_rtime = in->msg_rtime;
>  		v.msg_ctime = in->msg_ctime;
> -		v.msg_cbytes = in->msg_cbytes;
> -		v.msg_qnum = in->msg_qnum;
> -		v.msg_qbytes = in->msg_qbytes;
> +		if (in->msg_cbytes > USHRT_MAX)
> +			v.msg_cbytes = USHRT_MAX;
> +		else
> +			v.msg_cbytes = in->msg_cbytes;
> +		v.msg_lcbytes = in->msg_cbytes;
> +
> +		if (in->msg_qnum > USHRT_MAX)
> +			v.msg_qnum = USHRT_MAX;
> +		else
> +			v.msg_qnum = in->msg_qnum;
> +
> +		if (in->msg_qbytes > USHRT_MAX)
> +			v.msg_qbytes = USHRT_MAX;
> +		else
> +			v.msg_qbytes = in->msg_qbytes;
> +		v.msg_lqbytes = in->msg_qbytes;
> +
>  		v.msg_lspid = in->msg_lspid;
>  		v.msg_lrpid = in->msg_lrpid;
>  		return copy_to_user(buf, &v, sizeof(v));
> -- 
> 2.34.1
