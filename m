Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779132;
	b=o38PfHm0yltzqag7toFlcu25+xs9MZORs/DyvJjSAbLAzS6If0HI2+KZYALg3AetpH46
	 Ud+XSmA4EVtQde1+hS5eECeUMHmAYePhQOSU+0ju7ILtDpmRBdPWFOAafRnIqomDA4Fxo
	 hj/VZWXqEXD698pNL5mcTuNX7GorHzPTemO/kbWdyY5TKOJiFjp53e+tqs67qnznSbGUs
	 lmXUiMRY4m+L96oj7U1ce5Z7LBqTcAs/ph9E8eGUClypidY3ZJdbziGAfNzzgmgSQLLyy
	 TfaaDrFoT8P4vksFAmI7vWWSzihoHfi+Uz53ANaNkJRIXhTPbr045KaHVtj7bguysAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779132;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2Rg/pVO6rdHzpspUK/8nXdYsvHeWHqEdBoNmkqwWFVM=;
	b=3I6V8yDBcDIPRB9f/36rlXmpq6MJkadjFAIllMNUEpOq2UpffLmGU+JI3xl6dJ6oEDXB
	 gGSASBpH+rOvxeN2j18Un0kWvo5k3xKOkTuCAshA+NZCwVP7/eyiwOWvdbS9gtpHtUV7u
	 57aJcayx+/FYZUp00Y9yVjkCisM3IkgEIqRtCIBLjmFjsqzUnwv0ctBa8UUQojSuFQsrF
	 rKwzm4g3BoFMQ5fqMsDvgnQ1UiDECYaC0Dd2kEecjnrY71K2sq/krek6wd+tzG+uqbMwp
	 7xjCbtNRMBedzu44Qux5LwDD/gB9HKI3NbEoIqlAUEnq7/jmWg52fspSFo6usWD3nnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fh5+UQtD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fh5+UQtD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E461F00919;
	Wed,  4 Nov 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793779131;
	bh=2Rg/pVO6rdHzpspUK/8nXdYsvHeWHqEdBoNmkqwWFVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fh5+UQtDB3snpTjjzDBImW6GKSJzupMMWSk6yvhRmGfZaH1rk/YwMuO8vbuS/VJ1C
	 XE2ikC7IPFyQRAR6+MsAbcQh4kZWZrVxalyMZWn8HQkFqQ1DPLeHJQHKjqm6aMrCos
	 dGCEiVtVfMmEn9BfGT0sfP1XzwZlOIakWv9ZbgJM=
Date: Tue, 3 Nov 2026 23:58:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yongxin Yang <yangyongxin@kylinos.cn>
Cc: Bradley Morgan <include@grrlz.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf/profile: Remove unused local variable err
Message-Id: <20261103235851.b6f437ab7e0a82530555ef32@linux-foundation.org>
In-Reply-To: <20261104071402.1543517-1-yangyongxin@kylinos.cn>
References: <20260824024251.279751-1-yang_yongxin123@163.com>
	<20261104071402.1543517-1-yangyongxin@kylinos.cn>
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

On Wed,  4 Nov 2026 15:14:02 +0800 Yongxin Yang <yangyongxin@kylinos.cn> wrote:

> In create_proc_profile() the local variable err is only ever assigned 0 and
> then returned, so it can never hold anything but 0.  Drop it and return 0
> directly.
> 
> No functional change.
> 
> ...
>
> --- a/kernel/profile.c
> +++ b/kernel/profile.c
> @@ -240,7 +240,6 @@ static const struct proc_ops profile_proc_ops = {
>  int __ref create_proc_profile(void)
>  {
>  	struct proc_dir_entry *entry;
> -	int err = 0;
>  
>  	if (!prof_on)
>  		return 0;
> @@ -248,7 +247,7 @@ int __ref create_proc_profile(void)
>  			    NULL, &profile_proc_ops);
>  	if (entry)
>  		proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
> -	return err;
> +	return 0;
>  }

Well.  If proc_create() returned error (entry==NULL) then should
create_proc_profile() just drop that information on the floor and
pretend that everything worked?

Would it be better to return an error from create_proc_profile() in
this situation?  Doing that that would require auditing the caller's
handling of this and hoping that the caller reports the failure in an
appropriate fashion.  If not then reporting the error from within
create_proc_profile() would be better than simple silence.

