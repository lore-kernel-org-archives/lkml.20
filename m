Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8173F6C3D;
	Thu,  1 Oct 2026 05:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832228; cv=none; b=eE63/N4eII7id2wllhworaRRx3q/WvJVFOwbq3JLLIYmmJpl8Yd25otVRvJlfHzufsKLi2PeLtm7SrlwMjbnVRtSgRYWUnihun+T5kaMJc2Hw5eNTdtNM0pb6Z0GAG9hR6R6McPCTqinZNyOZMe/obH4r3qeaaGcA8Wb/vVBv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832228; c=relaxed/simple;
	bh=OhlK+W3gfWCedeTw78NR+QEQTfGehVSrWkvI6uZ1S18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/mBsy30hNQtQOwDVNSHrWFxwUfTnH6Qima8AJTwVE6wyaDhpc0aKJU8IedP/d5AIhXhh5EwK32wEH4h3IRNbGEGb/l69sTlpI+JVL7m7H7bb/DPMfMig7uHlwVV6ZS+P4oH1lySHgMTuMYGxLi/u/qXNU1Y4wofcf53fAaSEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZlDKGmyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZlDKGmyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386181F00898;
	Thu,  1 Oct 2026 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832225;
	bh=6dQzXOK+87apKjZP39NONHrOYxr0sGi+jaf1FrGj0u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZlDKGmyE+jKP3RIPAIQYsV56d5ZPSlQwh0VBmdjXHb+o9dFJkLz9XJitMaYcFJ9I1
	 I99UPyS1P6yDtcYjD95E+C9INpG0Grex66tQSlvQJcu8mDHLSRFwimLW5I1qc9rjlp
	 Gl9c2WwKEaGcLyfbZRnd/LgnZe7sKc3Oape78V6s=
Date: Thu, 1 Oct 2026 07:23:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: fix function declaration formatting
Message-ID: <2026100129-zookeeper-underdog-1080@gregkh>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
 <CPYP284MB0854550BAD16664CD1110456FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CPYP284MB0854550BAD16664CD1110456FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>

On Fri, Aug 21, 2026 at 11:04:09AM -0300, Tiago Panizio Gottardo wrote:
> Move the cvm_oct_of_get_child() return type to a separate line and keep
> the function name with its arguments.
> 
> No functional changes intended.
> 
> Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
> ---
> Changes in v2:
> - Split out one focused formatting cleanup.
> - Dropped RGMII formatting and parentheses changes.
> - Dropped unrelated alignment cleanups.
> 
>  drivers/staging/octeon/ethernet.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index 42ec4b8324a8..e668e3baaa31 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -621,8 +621,8 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
>  #endif
>  };
>  
> -static struct device_node *cvm_oct_of_get_child
> -				(const struct device_node *parent, int reg_val)
> +static struct device_node *
> +cvm_oct_of_get_child(const struct device_node *parent, int reg_val)
>  {
>  	struct device_node *node;
>  	const __be32 *addr;

No, the original should be just fine, thanks.

greg k-h
