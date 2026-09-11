Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BE4756B6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133245; cv=none; b=EglNum1jAz9zcf+zWSd7Iffk3PEvXy5CQFFaGvD9uP82ZCgbSqcPUN8esJb+ofAaGYNOknD9Xd/iGnRGurmRijmDvg+xBe2SiAQ/vFUbwFhNcA854SCDO8iRHn/Gf2tb4yuzVRiC+bnECd8Wb2WLtJW5KIS+QaNtGbHStrv0e8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133245; c=relaxed/simple;
	bh=1dMv3o4AMyVgUnXJIiBPNWgyJzyY9UATRSYbTMr+Dl0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWK14AQWV8gi9zdgpMdc4eC1Guc+YPnc7co4s5esmtZCKzAH5Hvq/TuxUiuKKyME73ds9try3dcQuVKIaJApUK+RTivW5HTbiss+dmnmsLTfmkDzm/ZtnsUOzZsZYAP5kkxXr8dDye2GvslAxAlVKHhj+Ig9jZWHZfdoz/137yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=1WhvKxPe; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="1WhvKxPe"
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 510D51A0237;
	Fri, 11 Sep 2026 13:27:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 8B7AE32;
	Fri, 11 Sep 2026 13:27:20 +0000 (UTC)
Date: Fri, 11 Sep 2026 09:28:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
Subject: Re: kernel/trace/ftrace.c:6651:40: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <20260911092841.530e3fcf@gandalf.local.home>
In-Reply-To: <d876a8c2-3e4d-449a-9127-ec15b34c9e5d@linux.dev>
References: <202609110704.Q3M5vCDV-lkp@intel.com>
	<d876a8c2-3e4d-449a-9127-ec15b34c9e5d@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8B7AE32
X-Stat-Signature: 6cgibmftdyx6f1mij94bopka9dowwy5b
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/9m2nk4lGlq0jgEyuSJOlhG+7DACjM5eo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=dmofKfY0tCpnI/W4LfYsHSxHYT8A7oe+e6bTa24R55Y=; b=1WhvKxPedzt3gyRb5iQRhK4f0jjgceyVS8y7T0cOUDdt0urdKRqCSTKMgskLDLtjgDVn+Q50mR9gwPhK/cN3rPm/rQm+0uzdnfJRKT09xRPqRYzI3ycbjjwaqKy2RD7TWso/wYIfTokDSMpxmReNlG8gppss2Ggt4+lRs6B9/B8=
X-HE-Tag: 1789133240-448546
X-HE-Meta: U2FsdGVkX1+L5SnxCFmPVU13+Ujj1piIfQaPRNyTo1Q1cCE6cVpfnblqiWI73WzEajESwOfG6siAZ58v0bIJc0eqrfwg0oJpq4HQkSGC/Rk3QphcqPxOeewhbcfroV5Bd1IjdwUJO2xSsRsSuRn/TgJ+Bzs41sO6zXGsXUUPU8S4fzifPzpns6Pkhyu5UMDY30xzxEIC3SsWG6sIsjSGtN/U2UBntW58APJb/twG2KEef1WfT2rwqbdGygTwfx5h16GTWSI++tqZE5xUjfT5k/ccwEfUvp8OY9pxOcqruWhrPvrrQFD0Ub20hCkL54RGTP8fQZrB5GUZ5T81V9B05cFhc4itLgIRRts/OLHSKM1U/4yWeDarNg==


Can you send this as a proper patch to linux-trace-kernel@vger.kernel.org

Thanks,

-- Steve


On Fri, 11 Sep 2026 11:14:00 +0800
Leon Hwang <leon.hwang@linux.dev> wrote:

> >From 03079b720a8cba88b3da579acfbcf88d983a838d Mon Sep 17 00:00:00 2001  
> From: Leon Hwang <leon.hwang@linux.dev>
> Date: Fri, 11 Sep 2026 10:43:13 +0800
> Subject: [PATCH] ftrace: Use rcu_assign_pointer() for tmp_ops filter hash
> 
> tmp_ops.func_hash->filter_hash is annotated __rcu, but
> update_ftrace_direct_mod() assigns hash to it directly. Sparse reports an
> address-space mismatch.
> 
> Use rcu_assign_pointer() for the assignment.
> 
> Fixes: 50b35c9e50a8 ("ftrace: Use hash argument for tmp_ops in
> update_ftrace_direct_mod")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202609110704.Q3M5vCDV-lkp@intel.com/
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/trace/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 53d5db60bfa5..673a54fdf392 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6675,7 +6675,7 @@ int update_ftrace_direct_mod(struct ftrace_ops
> *ops, struct ftrace_hash *hash, b
> 
>         /* Enable the tmp_ops to have the same functions as the hash
> object. */
>         ftrace_ops_init(&tmp_ops);
> -       tmp_ops.func_hash->filter_hash = hash;
> +       rcu_assign_pointer(tmp_ops.func_hash->filter_hash, hash);
> 
>         err = register_ftrace_function_nolock(&tmp_ops);
>         if (err)
> --
> 2.55.0

