Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917E52E04A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689693; cv=none; b=cS7rYlJMxUyizfG5Pkw9f0KiV2jYQBMagcWzmjRgjJqF8FBEC2+RHtp0ec7gC6NkW26fZFBOJexTEOj9Pmek2Nb4fySx9RlKWWwgBuKHgMz69WEmyNaNWGoGidf5EzawvrLDeZvNT/UJTT6b4hy3x4R8ekJdBza28eKx6v18kt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689693; c=relaxed/simple;
	bh=jHfnAYYiLShsy5/SORbAtz3mpiL/Je9cVGSYIb/17+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjkW9jRPHoMKIUtScQKSTU0qAeTD7VZPOv5OeS9AfpBy5Zp29PE9HDs+S1eBVVCEGFmaZ5PoqZWneXe9Sv+YVo/y0gWtTuubYkJE65PGqyJX4NDPYTfPWx061wH24IkobWBTVEGPZnf7UGwrb6Ed9gLM9E7gHxiGJcoXNd5Q9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IJwezHvk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IJwezHvk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so23951875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790689688; x=1791294488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8AiWFI9TrHPOiSdMjHEV5lRMsseecDfW3O9pndH1Is=;
        b=IJwezHvkYWW0HSrhBglFVd06ONaAwhmWpiZA/YpOgq4ZfVVW5TRTnOSeTJZ4KXKxxL
         HXLcpaUy8SUYMq/ItHj+7DiOMG/QzhHsRRhdH1pnrfU5KmiHElz/o0R0gmZyWw9/yEo/
         ZiKQUVzaFqJCWw9VRsJq3mizLI85EYAA+FTeMDavGLVqAyZHR0nBN2J/vypjCJZOto7w
         bj59ZTai0PWUmVSFeti6TiEJI5oE5hX0v5tbsj6cC4K5DKULZEXP9AMEexydrN9xRp23
         SeJTzkfYvh1Zp073pVhb3i2o5DJy8MTho3jyUvqsJmY4IEzhyCRRJOUqBW1NxLCkbrOP
         MBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689688; x=1791294488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8AiWFI9TrHPOiSdMjHEV5lRMsseecDfW3O9pndH1Is=;
        b=2se6vFUPBXkIm5Nr9aYlySFYkfS/p6B2h3vHXGtKsu9EOxnBK9PgdB8JWn4YJGuyLa
         DIbVrke92aNi1biJol7ftpQVp7TDWWfIeuokAdMcDQE1BAimi3Nc6x2ihUwNZGQfcfLK
         3kIRJBO03wY7p4/sp3SXwydY3PY1khl+oLbE22hDYdYYnccuXtsm3tFKJk8ionwyVKwO
         Y0FLP4kJO/6llbpezGwjTRUC/JM9nHGC7ZmPYXlRHreN3WDsOQUW5I0USsqLoFYKkrmU
         DuEUv1WTsuY9WhthmO+sn4dOVVtfZY6+kPTYpR2GChGI8hcOVus0mnCYksnYDcZv6NJS
         4Pjw==
X-Forwarded-Encrypted: i=1; AKwUvBxCNp0CrgAsMq5zegwsOkd89/ta4adTw9y+1/D3Od0Nw+YI9Dx+EkslWEfnw5cc382R+7sWZibpOCUay+k=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wlJRrrKNVqowJo+f6mo7+vlXaAiVevpv/uU8Z0NlzT7chQNa
	nXwJ3eqfkrPgGMRTTUqBY0i+ZC7DNHuWHeYjz+bLcCsAOlh6fL8t0/JIPE1Ojp9Qy9g=
X-Gm-Gg: AYBFou0FsC/gG3OcRWTZXN6QeDi6LyQAFJqRMI3tm8fUAGZIC+FQozC5jTBCKZq9kDg
	7xCzd5vb+ZDkG/y3+wmrHABY5fqxGo1rWX4x82GdzKR22yD2eDXvFka1lNMq7PoNkWluIKBEh1j
	Z4htiMYVkGwCAq3YJbCj3gYcv8EGPFS4d5VarIhMtDMjW1Qg9jhTbsIH95JgM3Pa7fjK39wF4pd
	AfAoOilZcy68BpR8udx8QQKmIudW1kabOELSnRmiiKZiUNPmxmdEKhLupHkdnWyFpY3tX8BoF15
	m9YWAP3iqwWFJI7khvvNMOB8HOwBzWEgJb8lk23JylIL7Hvk2pzoIBMMTxa1GLxnShZbUU50aPN
	UJCAGLCiW8pa2+1j4mk/301qKbiLnjnJf7z5igNE9YLFkaPc4F3wCaGldo5Bk3t4crMRsXxi/XR
	UuK09p1TBjq/EvZ93tL9P5xo4mufW+OJvB7Gqbxz4ptM965gHC+WZUQsZqiJqE6nvb5xT1uBkJC
	OdanBszPqCQjRA=
X-Received: by 2002:a05:600c:4709:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-49ffbad2d61mr153154875e9.33.1790689687850;
        Tue, 29 Sep 2026 06:48:07 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00ebcd353sm97780315e9.3.2026.09.29.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:48:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 15:48:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: tony.lindgren@linux.intel.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove console options before decoding the
 name
Message-ID: <arvBlQog3bBULfQV@pathway.suse.cz>
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
 <20260924070153.250783-2-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924070153.250783-2-david.engraf@sysgo.com>

On Thu 2026-09-24 10:00:57, David Engraf wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.
> 
> Fix by handling the options first which will add a NULL terminator to the
> string and refactor idx handling to clean up the code (thanks to Petr
> Mladek).
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

There is no need to send v4 just to update the commit message. I could
do so when committing the change.

I am going to wait one or two more days for more potential feedback.
Then I'll push it with the updated commit message unless anyone
complains in the meantime.

Best Regards,
Petr
