Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223794CCDC6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209082; cv=none; b=gHiL4NVM+WQeuG6Wb1YmTuJNjn2HUoFYD7lAqZXBZ8311OTdmLPi6DzyYwJdZ3Kmx79eBeWP8GZy3MGsZ3GnSRgNgnWOz37SX0T5+WxG1LVgnJ/KA8mklOP23DLV+hCus+NpdSSs+caw2c01Tj+YBkbWU1htdVNw1Eiy5nFocSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209082; c=relaxed/simple;
	bh=HUaAxOrRM36xOJXQ0pjE4DlL/cXkdSjez4MpfIKzqWg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRZ8AB+Khypl4/r/rLSM2aWRsaU7vCyYbW05jJfDeFPS5+SUJY8fE7imViyHfAwpfuhGFDQqfcHZGqNblWrM5gGgm6WD4VGA9fuqvI+qFeNMzp3YcoJSgFUmEIoAOryKsmi5LSPbIgTd8fF7Mwt/xLpn9bEfc0d75uoXoroP6rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puX440u7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puX440u7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so1411015e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788209079; x=1788813879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUxi1v32v9LlScqRA85gEEV4L+BJJN3/977k5kMPNeM=;
        b=puX440u7DBWy06jw/MtcOAjq3Dgwtm5QcS8Gv9rbKN7R5JjZi4OWDGVxjIBRqK6yyS
         pWGOH1dDtauvbtBI4ZJ7QeqQZikcTxHMONuof76r3EtZhd1E7UIX4YQ3WqAp/zwd3xQs
         D2K0r3cDv8BE/5qZaPVfyKNSPjuEZwHbgY96RVbD2qlprG5gVCAB3gtCqmhTZ5I6w/C+
         rzjttGolpZ0eZxQTcFETVa3Ykg7Bta2s2KhdemyAcZTtY5foPxOMAfnL5fKpFJvdn/IJ
         vtBfrf7UtU3zsU5ggP1vxiFEp+OvWqSQbqmX2Gnge6cXBYSq3XP+cPFq/Si/RuRVEp8i
         dWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788209079; x=1788813879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUxi1v32v9LlScqRA85gEEV4L+BJJN3/977k5kMPNeM=;
        b=EH79Uq/h4PLYg788NyTzd0m0nG4YgfTIz6ihR8GY2OUM5c/FJ4Q/xKILvTK8tcpnZY
         ucToVBPzxfJYbZSpLsdufkjyfKwqrLtbL0M1c5FChQKfkzYKlRR6EELbxeeXd/NzgJ0Z
         jWtJGHmFb4VsJUMZbhluPiImLU7YFGbKuOWrPh4c07VGDOZ5HpSWknkVPmAW2qWyB/Oq
         Uwp05a3Ixdnze/oDHB+u0HWHkSTprdoDqAPHKlAzytIbxAZj6g5FKbXjuGcIQ+HRbbbv
         x9XWi3CmWhjfhGKuLGUsYEJwBXmZ2GHb2ZdgkaAkzorD5Ec7G0oOS61RJuJmEgZfVfJR
         xp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrixJytES9LtWqv9vlcxBYTXaeRGfGr7mBa6Q9TB76gEWXnF9v4cYfuNUpN7eahohxIWdWkuD2GzazDtMk=@vger.kernel.org
X-Gm-Message-State: AFuF++mhADer7WjD/pVzkAZeiiglHQ7tseTBxmm7dyVKERp9vl0OrmVD
	sr+lVYSdBzYgXI9Kmn/J0L6825dHXTwoC3Ypdncdd/Qx05YUKWPBKoCu
X-Gm-Gg: AR+sD10Ogpq0upjwqo3ZgCvYXSWUijG7mXR6P1SlwcHyaN1iR0gcLyr6npOSrn25qbN
	Sp8xYuNfGcw15g+RNJ/YURSTKmQ3SUfAOIki5wjaXY+jyvOb+v/e6J6sXy2cUmbnwcN+O8B4TN0
	4TSeeBpa1ImCNi0tnXKiwCJXZBZOWclUXqD/7FBHwTcnjiTyxto74d369/4sviTBEMsmhzpg5Vd
	2hIVlTn6Q38h+QlQu3hMmFkUmGsH9PZmp0lQH7y915ojigYgcZJ8wC/GPDKXW/ueRro4ieFlhK0
	qy8HEVc6+qF1ehQBC5MmJ72t24nrmkPVtNZOwxaoyllkHiswwaZhuHUzVqsxnVzp0pPH5IYtDRy
	+mtqdmTVMmFJAVWMeX1q+Ibw/vh3iW7u6JIfF1Mbe2NofnzQ3wkPnYYWfPSChTXvYdVJAISMQBM
	DSuORjizXqn5JieoE/e9b7Up6O0xgO8k1pByGi885x2CSZ6GbzZlSARNr/B9mriLeMJ1rVH5An7
	ShQVGFBdh2UfNKmg2Mq1uWaOQ==
X-Received: by 2002:a05:600c:37c9:b0:49c:cedd:65b9 with SMTP id 5b1f17b1804b1-49ccedd661cmr293387515e9.16.1788209078960;
        Mon, 31 Aug 2026 13:44:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52fdbsm234570435e9.0.2026.08.31.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:44:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 21:44:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260831214437.15d6ad34@pumpkin>
In-Reply-To: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Aug 2026 10:00:56 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> Using a __bitwise type in a tracing __field() definition triggers four
> sparse warnings in stage 4 of expanding the TRACE_EVENT() macro. These
> warnings are triggered by the is_signed_type() macro implementation.
> Fix this by using _Generic() in the is_signed_type() implementation
> instead of an integer comparison.

Does adding __force to the LH cast remove the warning?
Is so that would be a much better fix.

David

> 
> An earlier attempt to fix this issue is available here:
> https://lore.kernel.org/all/20220717151047.19220-1-bvanassche@acm.org/
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
> 
> Changes compared to v1: removed #ifdef __CHECKER__.
> 
>  include/linux/compiler.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index cb2f6050bdf7..ba9c7e16802d 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -326,7 +326,14 @@ static inline void *offset_to_ptr(const int *off)
>   * Whether 'type' is a signed type or an unsigned type. Supports scalar types,
>   * bool and also pointer types.
>   */
> -#define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_signed_type(type) _Generic((type)0,	\
> +	signed char: true,			\
> +	signed short: true,			\
> +	signed int: true,			\
> +	signed long: true,			\
> +	signed long long: true,			\
> +	char: ((char)-1 < (char)1),		\
> +	default: false)
>  #define is_unsigned_type(type) (!is_signed_type(type))
>  
>  /*
> 

