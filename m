Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DBB386C3E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330390; cv=none; b=K1hFKdTKVikFm6NgREDpTXvIGJkRQQ6hmzBWQb2cgKlaE6BGIMcAHorM6NjdXT1mUlxWCjeO01kb7gis7Sp7+cr1zu7YOKyhr9nqHqD5jmKN3D6sOCv1qonj8hwkBKbCNTBYlbiSrFM1JWzS/nlR2bgkFrpU6kf28BRsUchceYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330390; c=relaxed/simple;
	bh=aHBF4LPvg2Zd3w4oaY7s8UbFfrBRImr+0PKCbkJaXE4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgakw5dX6UMP9AeWdrFb114+Alv/9NBQEUEFCEOpa2dcFnWb2HHTuDWEu5CMAfWI6JEJ+hEOnNVgMiaC9U4Y4Hms296XIHY7xwtiyLp3NhrVjeHx79JbeyyuuIGoqAe1rgR20NHJDxEajAFCMsuePHLdospiOz7ieZqpOz28v8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV8K5Odd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV8K5Odd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so7516935e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330387; x=1789935187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S5P6uH54234ueGuk+BCRhOiLjgsTrePIHYW1areU63o=;
        b=mV8K5OddZLBzCJXQFLtdPDe2bjlVk8m0OcH3RDqSCG+PDqiTmyOfEy3VMdk2pzo121
         pkbLlRtp6RnfGkz+C+KlUjcDD1A6J/E5153b1zPfMTNK0qtNdOFgcNnUo7qMu5+TDuy1
         spgeKxvtQi4R3o0j0F4sp8dkeUyeTAvKWDiTJsN7RGx/YEP2wyWbRNOa1D5CNROfteMz
         LZkKGF3Vw+Vq/RXwejD+hPCyKRlIe3uvA7yWtwdVZEtq08q2dpY7++BtxcTnsw5W9c/f
         sOoY1yY3HYxtWkJquJ0qlna555xzyAjO/DZxM2Hufg1LsZ81s7OU7zFWqSe6mhrMM7RR
         9M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330387; x=1789935187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5P6uH54234ueGuk+BCRhOiLjgsTrePIHYW1areU63o=;
        b=Qwy+twhhLpKve7pjJtuRPG/iCYXw01pvvpiP+inzVkhcp2bC6OnCASmv9pskYSoAq0
         0RImqFkYff8w9s/El3pyBgR77Da9xBeg3j/pelPi3IPmUAoRavbppjjdAAgcSLit7C6/
         Vq5Qv35GEuqED2/RzsjzJ+/WFGbnRoSum1zi3dgT7Z2d1IXJE3C5DLA4KlBSgBkyfYyu
         fTGHP0qij06XgEmbvQNUd3mkpkOjUwsxMTZvr5NivG6ls6vquMpxBU8iE+KAtfrwUTFa
         WgA+/f+ozu2g7v8lvoP44IOwp2ABP/pnsmZxGC4XSIthoqtRqvbtY/sieJyRtZF/nCT0
         gssg==
X-Forwarded-Encrypted: i=1; AKwUvBwWGgk7VlPgQlpeh6i4voztqf0en7Gi73EO/7S0KDeC2yVlrP0rhnxHAajuJyM8FfVDCra1oapiIn8sFCc=@vger.kernel.org
X-Gm-Message-State: AFuF++kB1fwSM40BNqwylV1UyHMHHs67mXT4HFeLIROlaQQZP/K8fkeb
	4Gv/Z7eJDMgGJ6ehKZ7gZkqpUL0+JQMKTjGuyFvVA5dT2/52iy873/Qd
X-Gm-Gg: AYBFou3LSvJRjcNKowGabKrcYbtZQf312Kq5bQsFxp3rRYZfu8BZuKezABuj24W6llB
	BhEbWvgdkLuVwbcQjEHpsCxiFIHkzAfeMaS14iwOAk/ki4FvGhsOck1tstwExlVvqOncHfScwPN
	8Z3uGFQSMWGHf3fxN5MP7TgyXrmusqJz2LYIwZPQ+47yu0QUpIjLFZHC9UTCFG5QVSY8zYu87I+
	Z3rJluTGwrvdtIW5PC0I8bugpqnTraXqr2DOzsM7TtQ4/+lYC33t1pBxVj0VVFn0cjzm6cSFRru
	hof8fWedYxBftDpUBtACrZGWw5BB0Q2HJr+oJd2YwM55yMrdDFDREr8++ZJKX5hYhP29gXZVdjB
	9xsEYQh7rodRzm6qYvUI6W3DzlMrTQTnKpbrE8U2LZ42ZLGy+Cmb158AxGPJ0voajRNyM1whmpn
	rJOAgx4Es5wzZD1T8eDd6aHyZ9hyw3XEOZf9i0SD/tEZCdgAm7ZREeytaQSg==
X-Received: by 2002:a05:600c:4f84:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e760727e4mr37982455e9.13.1789330387007;
        Sun, 13 Sep 2026 13:13:07 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm277930945e9.10.2026.09.13.13.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:06 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 13 Sep 2026 22:13:04 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ftrace: Use rcu_assign_pointer() for tmp_ops filter hash
Message-ID: <aqcD0FsrqV7gkNCD@krava>
References: <20260911142512.19344-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142512.19344-1-leon.hwang@linux.dev>

On Fri, Sep 11, 2026 at 10:25:12PM +0800, Leon Hwang wrote:
> tmp_ops.func_hash->filter_hash is annotated __rcu, but
> update_ftrace_direct_mod() assigns hash to it directly. Sparse reports an
> address-space mismatch.
> 
> Use rcu_assign_pointer() for the assignment.
> 
> Fixes: 50b35c9e50a8 ("ftrace: Use hash argument for tmp_ops in update_ftrace_direct_mod")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609110704.Q3M5vCDV-lkp@intel.com/
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
>  kernel/trace/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 53d5db60bfa5..673a54fdf392 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6675,7 +6675,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
>  
>  	/* Enable the tmp_ops to have the same functions as the hash object. */
>  	ftrace_ops_init(&tmp_ops);
> -	tmp_ops.func_hash->filter_hash = hash;
> +	rcu_assign_pointer(tmp_ops.func_hash->filter_hash, hash);
>  
>  	err = register_ftrace_function_nolock(&tmp_ops);
>  	if (err)
> -- 
> 2.55.0
> 
