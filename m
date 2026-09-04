Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7F483BC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524470; cv=none; b=F0QmbTKj5NRBL0LfYA59V1OZlnP+OCrm0phYSl3DyEnzYZ3YF5E3l1ijQyp8aLmo4KAH7TIpfUgfnH9SRJ5cGL7VlSKJ12Vu0nUsQlXLRG3zkWtXgQhKnnft2L/Dvm7ub2k9xtWYtjyT9Dh9jJhDjkjTaSzG8GPor8DulVYnTUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524470; c=relaxed/simple;
	bh=lpkge4L78N1WSwNMWGQNqSrIb/12DZQYNSyP4jQOpeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgc5IFSGVqklPKGSzICCYp6Te7Ha7z6+/ZerNj72y26+YPfpmqHaEroZ5y38QXR1+vSuB95B6dFCL4xzbZep8NreBHzfr4lNnWGyn78yFxj/RQ2RlXQR1y/cqyV/JBj08TKGkIrU9+xMGFwMFQPAYqh/Z+8mJm+orXAj6xuHJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaCbRCs+; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaCbRCs+"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66825847b2cso1279593d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524468; x=1789129268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jY4vMQa0HE5PeeFsSdbZPWZR4XiOqxY9qhbCbQ0F2+c=;
        b=LaCbRCs+OX8kudZQBLfIu8P2rFnJPt17pZrL2AEEaL+wivURQkyb78N2j3MhxD/KH4
         DrV1IpvG74DH26xdFp1/4YwDdvS7+u6qPvEnp6TNw6BzAXsZN71nir5ys4CfGuj5PGss
         ujnmRvYVOdkxknJdu9m1Eb9TL/yTdeBBcrnwHD3pnK6QNdWjhXsR60KLs9XLfx6UyaJO
         7961uQr9IIxpJEeglk4VJaoon9ZYiSCu32d3+T8A9M0ZCA4GAWK84HPMAZq7dlF8YnEq
         vV3iiZlCSG+JG9mFKQWA6vfXj3Ibi1M91PJWt6MOafk+Tr8wkYTkrVLXVFzLAyJ+OF+2
         Cjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524468; x=1789129268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY4vMQa0HE5PeeFsSdbZPWZR4XiOqxY9qhbCbQ0F2+c=;
        b=C3gAgvAczNqEgYcl/cyQAujnvRHDChz1F1AgNXYueCTQ35ZGPoCGHLuqcBf3f0otTe
         WrLoBbzapiMJMv1y0frQQ3N9oYlKxZ5snY7olCY7OQ6ew1DHbslbysm51MLNH4jID1eW
         FtNaxxljV73ikZQyaMXuI1z/M4Pll1KaIva3+CUjpNSEbqreJmdIwdlCiFt4yKw1AC/B
         ApoOFB6AWn8lJV8d2EgqpxZjgEE1zVn/vuHzJC5dxO7JUMDlIG1M/EYydVDr3zXd7Gb4
         muFyNGvSuuiXIQeE/uskMpqyx4yotILhMaQhhJjxKz9y8VBmJC8nP+27WTh39YvP/9lw
         jwMg==
X-Forwarded-Encrypted: i=1; AKwUvByV+liwFtZZTq9BtdpVlVBstqzu9+WOqg84iqnvyVSWVnoCbab5KvX2zlGqOEM957WeYBEotKR18+4S/NY=@vger.kernel.org
X-Gm-Message-State: AFuF++mDxnoAuyhZ1HRF/zBTOn1DTAnMW6iNcWryv4le8V1flvllOFQy
	bEhUC4R6cEIUUcYntsoA7kDZBVHHitdBE6jtrXLfc8p3z7dA73EXZ/JE
X-Gm-Gg: AYBFou0wQwspZUxPHQ9Bo1V5KEu1Q+2gY+u7AXXqW0jWRGPsAIXjtAOhETtfRN63Bup
	3tNtAUZwJmxUtIf7NqQUGcQRFELm/VgAnvmyWxSvNqHbJDrXCBafuabnt2/XbzNRb094zCp3gYY
	fbDDU4+Fjw4YnC28CfE/1TlHUkY594+lZ0J62hVA3rWpm0lKhhVlDEUQyxUAYPujtaBRMK3Fi+/
	YZJkUIVa2/j5YrTQuwnwHFWUUXS35G52e/a4w/ECN4scoDbizPBHB1H9nVmH461CYsDrCk4c6pc
	rPuGiK0O5j8yFDjrYXvPqmbhDjfacqQEdjmj0t7qs7/mwuXjCxw91fI8gLjd2ikVuNLAR1+H5fx
	3xSApOKYAgDHtDJCEufJKAdOdnWLoGrS3YRDC/EMdLALEqCJsP/qcpdncHac6cv5jf4SZF4ttvB
	ZSCGbe9KL/iTiDbyK7PvS4WDtbXEHCKRLfOfjL7FZeJteZzXkiwycbJ2twtrpyISsXCNUoNm7oz
	vG95ZWn5ZRxPKTnT90pAj0rhQIZoJtFmA==
X-Received: by 2002:a05:690e:4419:b0:66f:c1be:84d5 with SMTP id 956f58d0204a3-66fc1bf50cfmr43984d50.67.1788524468156;
        Fri, 04 Sep 2026 05:21:08 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4695:e8de:7b45:bcfd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb494b79bsm2039103d50.16.2026.09.04.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:07 -0700 (PDT)
Date: Fri, 4 Sep 2026 08:21:02 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Ye Liu <liuye@kylinos.cn>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] security/landlock: convert thread iterator to
 for_each_thread_rcu
Message-ID: <apq3BabHp9Zvba-G@zenbox>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-9-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-9-ye.liu@linux.dev>

On Fri, Sep 04, 2026 at 04:30:00PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace guard(rcu)() + for_each_thread() with for_each_thread_rcu(),
> so that the RCU read-side critical section is scoped to the loop body.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  security/landlock/tsync.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/security/landlock/tsync.c b/security/landlock/tsync.c
> index 0b71e158c3f5..f1c08aae179b 100644
> --- a/security/landlock/tsync.c
> +++ b/security/landlock/tsync.c
> @@ -335,9 +335,7 @@ static size_t count_additional_threads(const struct tsync_works *works)
>  
>  	caller = current;
>  
> -	guard(rcu)();
> -
> -	for_each_thread(caller, thread) {
> +	for_each_thread_rcu(caller, thread) {
>  		/* Skip current, since it is initiating the sync. */
>  		if (thread == caller)
>  			continue;
> @@ -376,9 +374,7 @@ static bool schedule_task_work(struct tsync_works *works,
>  
>  	caller = current;
>  
> -	guard(rcu)();
> -
> -	for_each_thread(caller, thread) {
> +	for_each_thread_rcu(caller, thread) {
>  		/* Skip current, since it is initiating the sync. */
>  		if (thread == caller)
>  			continue;

Reviewed-by: Justin Suess <utilityemal77@gmail.com>
> -- 
> 2.25.1
> 
> 
