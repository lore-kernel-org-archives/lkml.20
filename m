Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB23D4127
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164990; cv=none; b=iR/GxMCQcEA52zbIvxY6DrdK6BCNNu+dh5vadUd3H0VX8K7QR5E+AQsDTfvGvu/LkflqLj8OBZYuClstaSO5w+p0FcgaxmhVArelVz8HP1PkUFBjVSYJ9IjaC7gVcQV7nVms+vjDIMrKsahzs52q5EvRI1Bu7T3mYC1AOp3TIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164990; c=relaxed/simple;
	bh=P6kflogqR/Lw+vACG9WWFAnuSD6hzohPq+CajCm2gAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtbXdbjiiwLyyaPuKXc0w0Xo1VGesLnDz1jmIBkMumXHbF9h/OsyBDGOsxRw94VBU5R5u9BhGJEPdCFf1FayoEKhJ7sUHx4ii5PTXEJmxGuWcDcI5e5eLuIuzAyHADqiU7bJxQsxpuRhuRmGUGhu767QQm/hgfNxF2QqD/3f/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VU0vYCt6; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VU0vYCt6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P6kflogqR/Lw+vACG9WWFAnuSD6hzohPq+CajCm2gAQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788164985; v=1; x=1788769785;
 b=VU0vYCt65fLTu1+BuPPx3Oxz8eGjEeYsSq0CXsBrqJbsYWBYkQTpAQbSTBp9lSXlUaXi6JMF
 IakCPwPIyRrLP/G0XkWTMN8wtIwIaQjoa2IWT4c8x6YzeHAeQSMoa9bHaVjonAy5Tg4xSSAbR+A
 l42457dVdeqLDWUfylyDNmSk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7a3ba20dbad0d488;
	Mon, 31 Aug 2026 08:29:35 +0000
X-Mizu-Trace-ID: 7a3ba20dbad0d488
X-Migadu-Flow: FLOW_OUT
Date: Mon, 31 Aug 2026 10:29:33 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] parport: Replace kmalloc() + strcpy() with
 kstrdup() in parse_data()
Message-ID: <apU7bUb2T1NqAdy2@linux.dev>
References: <20260727102422.412065-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727102422.412065-2-thorsten.blum@linux.dev>

On Mon, Jul 27, 2026 at 12:24:23PM +0200, Thorsten Blum wrote:
> Replace kmalloc() followed by strcpy() with a single call to kstrdup()
> to simplify parse_data().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/parport/probe.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/parport/probe.c b/drivers/parport/probe.c
> index 5d1b9aacb130..bf9d81c0abaf 100644
> --- a/drivers/parport/probe.c
> +++ b/drivers/parport/probe.c
> @@ -52,7 +52,7 @@ static void pretty_print(struct parport *port, int device)
>  
>  static void parse_data(struct parport *port, int device, char *str)
>  {
> -	char *txt = kmalloc(strlen(str)+1, GFP_KERNEL);
> +	char *txt = kstrdup(str, GFP_KERNEL);
>  	char *p = txt, *q;
>  	int guessed_class = PARPORT_CLASS_UNSPEC;
>  	struct parport_device_info *info = &port->probe_info[device + 1];
> @@ -61,7 +61,6 @@ static void parse_data(struct parport *port, int device, char *str)
>  		pr_warn("%s probe: memory squeeze\n", port->name);
>  		return;
>  	}
> -	strcpy(txt, str);
>  	while (p) {
>  		char *sep;
>  		q = strchr(p, ';');

I've resent this cleanup a few times since April and haven't received
any feedback. It's intended to be a mechanical cleanup with no
functional changes.

Adding Andrew to Cc.

Thanks,
Thorsten
