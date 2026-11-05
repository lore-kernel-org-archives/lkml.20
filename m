Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876789;
	b=uRKbuOeGh4B8DUod+zYRbKda00H4hl1TeMe2eaURRUJvOYqZU81Ei0V+quH5UNgH4K3Q
	 jvM6jCyVYFp5lQSY4QDPc8M6iL8bNjihAfxHMN7mttp1fMg03EEeZ2M4v07+3oxjyDAyD
	 nPNVjWBYQTvwpbkNNdB2LGe9ScCJs1Gsj2E5mr0lDvZChHIaYabJJGb8Td4O5E6p55blU
	 Jn+sup0apOTCXFEWFgXJgUNm//nv+Ife/UvjjMWrHqQwB0YijVKtj3R7IhdrfYFiGHBuh
	 YPoIAkO2/fvtXXMPMUmplWn/5JCWj4WXIeBn+Yaa6HoMNNe5LGZ1SLA5BoJfyEWQsrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876789;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=ziJRj33vU7WXnyNSIAdnzeWv7eXo+HiEe2IW8KhzrDU=;
	b=hkTdN641fqNmTvrvzwDAvuIzs1wZA0PRGGLVioXIXwf9k6AU3dUAGQqOe0Y9YI5lrbYg
	 +mWEgRhFSwnFA+uurbGTaeMe4htGffauC8eqoAQsY1Q5IApnGmiNz2tP9iIrorlJJMJ7z
	 WVCDHH250/pViAZW7QMxymLL/Ay0LuwhxoGC196ddzK7j/UxOgcWri76P9jZjW/H2WFR0
	 dC7+IYJgRmgx2iDg00RfE7qCdxCxvnmC/YUsCRdyzWci7+QSYJtpg4Kn/wah06FaEU5Lw
	 iJLSOLK5sGMPTOK6JpSrX2kocn6o+DmFxkWxBp9qu0BILTq9brHmdOflvAYSnO2pcgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=w6PzV7ZM;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pmh8nqCa;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=TO1jJ5pL;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PI5fwWF4;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF9606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FF9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=w6PzV7ZM;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pmh8nqCa;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=TO1jJ5pL;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PI5fwWF4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E89521F828;
	Thu,  5 Nov 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793876780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziJRj33vU7WXnyNSIAdnzeWv7eXo+HiEe2IW8KhzrDU=;
	b=w6PzV7ZMNafvDF20FMAba5WD3pTBpW8RL3KhFx4LQ3qIhtHUskTomH/4chBdEWyByAXwIj
	E9IRAoyipKeSOVod/yti4NuHc4RA2bWRRxMlQunl0cE42mlGi0l8BIr+PJHGu1o0Cflg99
	9zA8vCy7MalbrRVmeQPA6fYtqIHE12g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793876780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziJRj33vU7WXnyNSIAdnzeWv7eXo+HiEe2IW8KhzrDU=;
	b=Pmh8nqCa0jjDslGStb2zqytogfoHA2qxjXbbl63xnpAUNwDBQfSoxEfhVZ/gjG6nYlF6fL
	RxrfdOw9hnlRMWCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793876779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziJRj33vU7WXnyNSIAdnzeWv7eXo+HiEe2IW8KhzrDU=;
	b=TO1jJ5pLN//NMzk2npOM0FlI6biQLCBOUG5CDxKT/mz+568bjLLeUbAUVN43GvrSt8nPCG
	KE1RwrdDAzAaXlpGMtgW0b028b7V6G7oyAP7lPEAw0xBxRv1seOWSGHr0aoTJ8AACIuYpx
	qYFLkDlf2EY4lCbuB4omBqApSEUorjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793876779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziJRj33vU7WXnyNSIAdnzeWv7eXo+HiEe2IW8KhzrDU=;
	b=PI5fwWF4iue5TxrwboyGV8lrpvc3e+TW3PiEYnrBYluHgHAcMSEo3D3SR8vetZNcuowpXI
	NvyHtLZSeJ8KNmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD82D133F6;
	Thu,  5 Nov 2026 11:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0D/6Jytj7GpbUAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 05 Nov 2026 11:06:19 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 6DE14B69F; Thu, 05 Nov 2026 12:06:04 +0100 (CET)
Date: Thu, 5 Nov 2026 12:06:04 +0100
From: Jan Kara <jack@suse.cz>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: clamp FIONREAD result to int range
Message-ID: <qdc5maoopscwyoov6wirkreedtex6e2mvr7s7oay5bpdeitp62@wk6incofaoca>
References: <20261031072208.3096100-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261031072208.3096100-2-thnkslprpt@gmail.com>
X-Spamd-Result: default: False [-12.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.com:email]
X-Spam-Score: -12.80
X-Spam-Level: 
X-Spam-Flag: NO

On Sat 31-10-26 09:22:09, Avi Weiss wrote:
> FIONREAD returns the difference between the file size and the current
> position in an int. When the difference is outside the int range, the
> result wraps, so a file with 4 GiB remaining can be reported as empty.
> 
> Clamp the result to the signed int range before returning it to userspace.
> Preserve negative counts for file positions past EOF.
> 
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Fair enough. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ioctl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1c152c2b1b67d..ecc2a4cfe6100 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/syscalls.h>
>  #include <linux/mm.h>
> +#include <linux/minmax.h>
>  #include <linux/capability.h>
>  #include <linux/compat.h>
>  #include <linux/file.h>
> @@ -550,8 +551,8 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
>  		if (!S_ISREG(inode->i_mode) || IS_ANON_FILE(inode))
>  			return vfs_ioctl(filp, cmd, arg);
>  
> -		return put_user(i_size_read(inode) - filp->f_pos,
> -				(int __user *)argp);
> +		return put_user(clamp_t(loff_t, i_size_read(inode) - filp->f_pos,
> +					INT_MIN, INT_MAX), (int __user *)argp);
>  
>  	case FS_IOC_GETFLAGS:
>  		return ioctl_getflags(filp, argp);
> 
> base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
> -- 
> 2.43.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
