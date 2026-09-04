Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E535C1B1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527634; cv=none; b=j/5N7ebsLyZNeNqwXwDLoP0NTM1KYQwO+9nrC4EuC1iK5p2xbGamTq8ZGD9WlGFaHweC3HJ6+i5OptnrX034gDwC8Z8SKLFfRXTY7+5G85/DvZcl+z9oQ6Nb7b+4fopk/UnzeafkjqOvvf8/gwyZ5F+zSypOEQbPYWVbTy6NVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527634; c=relaxed/simple;
	bh=qeW9HjB/GlkaIQLm8ZbJVD+c0HOdwkjWG+Sfd7Hjcqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+KGaAt58Ek3WVsbgDfwDaxoDVdO/YriqtkIrQO0sZbyvN6BnXJdBDVUdPVas3ZIcDJrBoVpFuxlw1WZnKjJfNbDPiIs2F7jdxoMPAintVjo+5phKkWQywJNsWHiKIX2TBVdN5vdrPbIbqegQo2L34/7BMI6qycAOMZVutC14sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roep+fbF; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roep+fbF"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so862386eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527630; x=1789132430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=roep+fbFqxg5iARC6e0T7klxq8PXaQgwZI06wgAhPNg53hsBhlxDq/LZoAaouTYjDd
         1sFmkD/Zbpsx82iPLR2Jac9l2YLmsbnPctkS/PSHzLU37WGek5qqeyJ8fZm+nwnDx6Yz
         Sg4NRJFAm8JyIYVI7Wl7Dr0eYRcBEuyfbkHvomWMwx4U+ZXTlFLESp71wEc8N+6eR8ef
         vzX9WktyJendVdsoNHMSvkfUOjzdZbo91N7cZkOZMvgw4pJtugTolcQxLl8pfNsnjIjn
         2OzIKZny+vvmI/NaN+kBVN61O06MCipInM9ApD2sHQBjrxm7gwL21myVjFwQFdHALgJG
         5hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527630; x=1789132430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=qhgtgIWkPgLnJmF1xOwoqAUPcTdxzS6zVm9+dCliaJPX6G8rweLXD/mIu0hO8eK6Zl
         miuiiLZqxpAw3Hppw8mkBbTQE7yQVGX7X1nNRrGODtFOK/U07RSAHg2E0nI9BnyPL+Pe
         RPBc8VQygsaHftTQa0WrKhJvOK1yTWYhGGyTWswBc7mi1ppjbDr58BL9yqdEY72fCr1e
         4L2u/5l0QsCCdwN9KWpUmCq9KLI8VfFJiKCObunQZanwgTtL64oYGtJP/NZgSw6SfQjZ
         pNEuh4neNrZxcUioQaf5OkUQSPgLwaVIJI3rBWK1z65dWZR1BD8H33mAcq07TYNVTHN1
         6frA==
X-Forwarded-Encrypted: i=1; AKwUvBxn4WzvffjuPKnsySkKnTPvfbOnkW6wKwktSXUoB2t81UR6n3zA34IhHlTIWWC6Lm0UjteEq3PeMEzmyb8=@vger.kernel.org
X-Gm-Message-State: AFuF++nXVHeR1TWaKD5A6HP3WntmtljOZpgAFIMKbyHGTBMxt4p5PCXH
	QSNOyKpMyOVgpdqtMfrFbS3LDyrvmwAu5op7I+yVHo2Sn/gYxSAq7Mi1kAN3ww==
X-Gm-Gg: AYBFou19Wxmt+BVWOasLT8v14uIFARezTMV7Y/0NDSENQiSpHJ91dAUPKh36QUMz7ab
	oWSNu4YyItFYXvAZ28W+z+NMtPWW0iMyqnv0tyZLZxuC5N4GQGvXZyu2HMS/gl1LL/KcsyYVa8A
	jrHoJzWBgxu/090il4FGuMH7rJPhsC5E4YZyT/48lCHm9IzQZHTwCXJlu4AWT3V2cQzvmLmeuCW
	W5MsdSSfqG+ExKwFWORhxSH0V/hsH64gm1vA2POCLeZgKBMqM77oX3FlFvBaeuNh1WUNptmzNg/
	Lvq97WO7NomQwgASDguceGIZe/Qo0E8E1+Ek26BkM1HdmqvMVi5Xg6sDfZqKHfELWRSvZjnqN58
	RUWyMCMv/rx3t0/4ZWhrRtAgYClPWaNxvDDEB1ZaVLUa45YJT1Qv7sZKdd4HZe8Qz7tb2dgy/ye
	RDRU7iTJSePoeTWADxWgkzRJUN2YLWOne6YqXLnYyg3+z/quwPPUTCve/Anl9HS0dEvqJAfj26c
	ruU4+0lhjJ1s+UN4gPvmqtY3KphHg==
X-Received: by 2002:a05:6820:162b:b0:6b7:46fc:1cf with SMTP id 006d021491bc7-6b746fc2ed1mr2604016eaf.46.1788527629952;
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Received: from localhost ([2409:40c4:180:9098:c5e4:83d7:dd06:4e15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm10301543eec.15.2026.09.04.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 18:43:43 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apq4FFSD2QKG-jUu@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>

On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> On 9/2/26 21:21, Lovekesh Solanki wrote:
> > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > This specific issue is currently not on my todo list, yet.
> > Alright, would you like to me to work on this? I could look into
> > that side and possibly come up with an approach.
> 
> Yes, please, that would be great.
I took a look at the PCI / PM side, and it seems to me there isn't any
reliable approach for xhci driver to use right now.

The pci_check_pme_status() both checks and clears the pme status bit 
and the pci core devours it inside pci_pme_wakeup(), and 
pm_request_resume is async so xhci's runtime_resume may run much later
after the bit is already gone. We can't simply export pci_check_pme_status()
that wouldn't give any useful info.

One solution I can think of would be adding a pme_wake_detected bitfield
on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
and we clear it in pci_pm_runtime_resume() after the driver has
returned.
Then, we could directly read via pdev->pme_wake_detected in its own
resume.

What are your thoughts on this?

Regards,
Lovekesh
