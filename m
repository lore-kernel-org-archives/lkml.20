Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90383D2FE6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166249; cv=none; b=rNctpzxa5XGVvQszMlbFk3tYdpUeWRk8r5VjHAxXRhDjOP31xIhX5Tl4jJNv5yAn1MuatlqchEZKbzY3efxr+VSrwaoUsDvrGadHyztnsWTpb06g6q1JIlbpErDUIKB3JGCqQuHKC01cR4tRY8oN7fx6lFRjfxh15AAefqrf4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166249; c=relaxed/simple;
	bh=5UTMMcykg9OmB0p84JxHVopNVxW3ILV7lIXs63RpxU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjRsceUYeUUqxhpLSV9o/NFWMP+zg2yifPodzqG7ON4UQt3zhXVcjvxiXOhjRomqZEzh0B3HmYjhsrRhwNtEI47zdR6sFRY8yFeWNaBv98B6UKWt/+215EJpjUyaV9+IE6nTz5HfeBGWY/C12j3dZzWIbNFYzBeG2LBQYZCJyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OBk0eQBN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OBk0eQBN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482ea739de2so1905275f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788166244; x=1788771044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xZyaAg66k9TLx8NY7SMIXexMYIBf1wy6bXwBWHCg/w=;
        b=OBk0eQBNdoA+5NGStDkanogJba775VzQQs9y1CM/B+VhaMUAUW5u93hhgydgOhVr9t
         rHNpoBtPTwvB3QMkRcxL1qxVz3+OTDE8cODf0JN7t3dKHVw+lKyFpDeQBQ1GVIyGxcqb
         Z3KD6kBT3nYR+zlAp6QAJUxAW1ANLNZuZTJVjedbiWpUyxnDw/+9P/VzuV/UAul7hlJd
         frzA4Zc5W3n2Ps/uBjSYj/gWMZINHDPOTkgHYWEJYpcgIrzZO1FU+SGA6e1lw6E2QhN3
         2R5YNKJLzPImo+BiuWELO2KqbRDns6xmDp8UO+bdioeT1fJeH42NwQk/RIIHYARW+82r
         h/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166244; x=1788771044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xZyaAg66k9TLx8NY7SMIXexMYIBf1wy6bXwBWHCg/w=;
        b=kqzK+wbHOW3FbZ9LTqAuoIVBPltq1yEEcRqTN30D2vWfH3y+PQqwPH8csQN3qD4XNJ
         PlRCl/uClGgv61xtk1uTaFoGkY5Zenaj/syA1kZHORWphBkAwjwVHSdEp46r8QXRL21k
         1S2Mt8z7hzAPd1eQQZ5vKdPMDpqT58X/jzSQnFzCd9YaR/j87ysUXsVUTQbsjk9MltSu
         nooelANuUyrjNvKST3BFC20llwuzN0fnEZikC9YZVNeyPWhHictvh8lAbiFicvobTEqR
         qfLTuyGgQhyHJYsWeC4mxgroUHAJnoPF87oZvLkHeMjPEQe0+bG2yHwY6hGyhrTxjp5O
         7iNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl+lDQdYKzctn3kPK+FsSVGbRLnXHF/VRkziNFgIpn+oZfT0UVNH2LB6QV85edwtOuGKQIOaWib5sRiQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKRG3M0t/XTI4qd76KQw2lwEPQ+vMqlLyHhhn+nNItW8tbtkfA
	HoWBGxSy6TZ9s3HqnG6mPV13t9wgDtWtKJi1a3jk/I4hJ0nE+Ee5dLubRFiK+1vuk+8=
X-Gm-Gg: AYBFou2SO//C82LaeyHjJKawkAjUDzaCqvGQANBG6E6R+mWMnGrZApIGuQqmQ1YYnk1
	2cvTdjuMcXrLUweTAWcIhBAu/Zg/D9IPSQGhcxejqK356LFRO3tyTj+7Nk7JZj+uTVnpFl2Cpu/
	+oF26xtCEVBHuW2AoMiBLhlqJX3XX/EfTkBFsnhblZdSmH4gvFA1iN2mWnRq1OJrorrwQ0sRjJK
	kPLF3grbBlHC7dbDCHHl9SdrMpTyZUIh2TS2fwcA37RTADnyYE7uVJ1gyy8cyqSFFxnm2vlQ3PI
	l0brVcSdwgna8XQM3IxDv6ATwffVx+y9sZyRYZiRIDdhT1gdCjETO50ZfiaSq03PZ4+swcRHqA9
	cQlwM60UoVinEAWf1pjWxvDzB6TjnxoQocX8k+JzPA7VnM43LtMrGHMXvkcmaFlrkvt36vrTMll
	tgAlqTeYFaWjl2PY04tlFKmmlcok2Qzmx8UPLzhIPZyP7z9lIz9k+xGOBi2kE5tyY=
X-Received: by 2002:a05:6000:454a:b0:482:fb60:2f0 with SMTP id ffacd0b85a97d-482fb60045amr29493186f8f.8.1788166244167;
        Mon, 31 Aug 2026 01:50:44 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12480867f8f.9.2026.08.31.01.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:50:43 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:50:41 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Bradley Morgan <brads@mainlining.org>, john.ogness@linutronix.de,
	gregkh@linuxfoundation.org, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, tglx@kernel.org,
	thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
Message-ID: <apVAYTE1C52cQOOV@pathway.suse.cz>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org>
 <20260831063648.7j2bEr1S@linutronix.de>
 <E462DFFC-320A-48AA-90E3-B61B026BBC58@mainlining.org>
 <20260831082237.lo_33Mqq@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831082237.lo_33Mqq@linutronix.de>

On Mon 2026-08-31 10:22:37, Sebastian Andrzej Siewior wrote:
> On 2026-08-31 08:31:22 [+0100], Bradley Morgan wrote:
> > On 31 August 2026 07:36:48 BST, Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> > >On 2026-08-29 00:39:15 [+0100], Bradley Morgan wrote:
> > >> Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on Pixel
> > >7 (ARM64)
> > >
> > >Does this PKVM even use a nbcon and if so which one?
> > >
> > 
> > heh, not PKVM itself, I booted a kernel inside PKVM, which is the
> > hypervisor, the kernel has nbcon inside. My T-B is for the kernel 
> 
> That tested-by is futile if none of the suggested changes were actually
> tested.

Yeah, I am going to omit this tested-by tag if I remember to remove
it from the patch generated by b4.

Best Regards,
Petr

PS: Bradley, this is not a good way to become part of the kernel
    community. The tested-by flag would be valuable only when
    the modified code was used during the test.
