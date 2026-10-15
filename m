Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F135C698
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036325; cv=none; b=rRxUcNotCl2qbwz2vDpNe+cdfLrzFedfnPOIzxrwydiiNZ4cSZGE6OaBPvGqNJVX0jv6bwtl8VFl9rHjeVu2U32Q05VvPqD/e44zWPP0O+Bxu8v9t/WTjAUZe8PGCVoMDs1bsfoXph7e+O9ptJLCAXkl1lQFv1v87pEFeRemZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036325; c=relaxed/simple;
	bh=KbLt+kLro+r+LHPPY2Z4WPsH6UF6/fv6m9Uz6Wr/sCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtTLUKaQ+MYpMUH7ezFelYXEbnm62Eqp2OM3z6TMeMidbOTmH4Sx+vpuY5YNy+KKzXvMwC6XXcA/XeT9Rx7fsjZwlZB2vDqAiIjEdEJf/0fTH+hCvyFdpHP0WQd69xTDl+1kp9An62u0C7smz2b+6qkvWFFJfl0F1DfAg9t0t2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QTlq1+xa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QTlq1+xa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso782918a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792036323; x=1792641123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JGoxqxF7lbndLfSh7cgTXDRf25bzJNWdyPxdomKs5Q=;
        b=QTlq1+xaTdPRiwxjfGAPPEdApqsn6T7Et+VkOYQc1Ph170setsUeAzEXe1bBTPEEuw
         Kfn/Wt0lShF8K8k71k2Pj1TMEBhFQ2pj1eRYmtB23N0Y+x6CoO+Vg1DwLwdYu7PR5dT7
         8A8sk7nft7JUYOF4NXubLx4RW4gaCmngKDrKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036323; x=1792641123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JGoxqxF7lbndLfSh7cgTXDRf25bzJNWdyPxdomKs5Q=;
        b=u0a7eU5Wwkb+EIUIE0Lvm6YMymIkZA8dwy3KA9feDLRWbzAvdrYApNIbPbjMXbS9Jq
         Xt0o3T8HXmjD+/NXA5eIi1IiGQ8E33Es83FbM8fmNtStZF0C1+5LUdTP8mP360HKZWyD
         qGi4lxzAhNWMCkbE2QaEM+o0CtXHWX7q7HUZ8KoghmZUp7eSexMSltohX8NQbjCtRDRE
         Cx4B2S5AE5N/TyumybgU85pabQCM27vy4+IuZSbxo3A9seVq93vOEjwuYekwhPZhbKG2
         X+ugiGrstnLz8+gSoR2RKDeN8o70vn9BM4rojSxTBQqsjDlN7800hA+lw2pN8VNWQAlX
         KWtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFkNhhD1Av6r20UxFOysQ12v1LwgxvAbcmL4gXbqFi2QU4gRU+ZIRbo/OatyYMXYEFTOh9BeLJx+XDPSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/oEf1FJJbq64znGwFscoMmS45/RhRCEzxj/wtnwkfSHdgMQ3P
	HvoLRFY4LOxndcAyd9IbXtAntqNDQqXKmVUWh83cBkN/IqAPQeHvA4U/XzxzvMgDqOma9BBYOmv
	b4wI=
X-Gm-Gg: AYBFou3RoAe8bGNjGdVYS4H8EjA4nCwgGX6oaHL0E56FUhXYQzgDA+psKrhM8PKPMlN
	a0Y2Ul8HHSmyle51jWaM1VLQIr007aR9gyV1uW/dgjJtryMBg/5la5UiO5nJRbATse/VOyURtlp
	813Zk25sZu4WmTPOA/bHz6Q76r33px69gWv73iRd2RLQsFCMRiKjUtff08+YSrDWDVpjXu0OAiS
	U4pZuF5CHA04IUYfWNYILiiQVBX9DrygTIujoYP8nEudsYpsivrmCU3Xix/FjLDWP4RH//tQcE0
	qemII1ooalHQwxju4mv7BIxhJIf7E64ck5LJ+tPETin9eBpYUvKEGk0I9uzYVhu0fGY0k9Dlc4i
	TwslnxTfX4LJQqk7pmnJvbo5pZd/JclPCGoOpwucOrMHBUqadOgNGdD8tQbKxWjczEtoZnCnNBi
	V22ouK63EuqpH6Qoqf5Xa368QX6yZO4wDo0QoX3462kD+UBXN+VcnHOSVDo97T4SKIRutzRvGBe
	BnYikervxzj48l9mBrQeW2mL8pPIxzoJVRDdog=
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr14890823a91.2.1792036323004;
        Wed, 14 Oct 2026 20:52:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8455:7899:5a2e:26f8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9373f5c4sm1368946a91.3.2026.10.14.20.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:52:02 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:51:58 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Chris Down <chris@chrisdown.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Make John PRINTK co-maintainer
Message-ID: <atBNvLhvJWpoDpt4@google.com>
References: <20261014115029.203908-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014115029.203908-1-pmladek@suse.com>

On (26/10/14 13:50), Petr Mladek wrote:
> John is author of the huge rework of the printk subsystem. He has a deep
> understanding of the code and great awareness of the various user
> expectations. He is willing to step into the maintainer role which
> will be a great help.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

That's a great idea!

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
