Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBFE2EC56E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626542; cv=none; b=Us9JpNxgltVH5B5bEVG+n0Kpk6tpDAtpHsq28JEBegSrjQsbR0CpqKkrVxw+pmgPCWo1pfYFJiWJ+KUuf+7xJzYw2uDn7kQSLbIRjtBc/w1ht5vvMd4clpAg+fBDORNqMKfImw5fQ4VHLJGfHgOt1gPOB3P+d7LyeUY1MvJbRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626542; c=relaxed/simple;
	bh=j8dShMQR8r+IY/PCkmrM4piAZ0AnVGy+pTSFaWHKVs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7O8ePN2pWjqk1dGYinVFVkIwhfYZRouPea+xY7jD6t/Yge+N40nhhe9xka4lebWLiqQk4PE/RFC+AdKSZkHLsgLGD6dnaZzwzj0X3mzjJVsT7Jnt4mv8f6/My9H8UL577dlIBGMFVpZgflzWGaxaPJ0pkUwmyjX3A7Yw1VjWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=OTq313dt; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="OTq313dt"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-86d43cdee51so26174207b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788626539; x=1789231339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=OTq313dtaSBSCLVxjkYe7vBHuDpKZKweGbg/eLusfpGhoKGSyrJA8YBu3wAuqAjdZw
         rzbmwoQDfnvwHecwowPPnibhrTJ3fhq2odPJEPsK9ykg8Lag6b15qIB5HXb0a6WPQgZc
         BdOHJ4ySqT0PQ5372ATeh/e0RB57lQjp+u6nwny5OwPDqjMGKCl4KCnjKIbnFA5JaAPA
         joqigTrnjAHH1cBVkw52Q6Z/CfTSru5/dBm7AlDuL0R0f1+OVi/Fm6DaAx2lQPkrX0cS
         zrlrnZwpvgxaaxnSCWlf/3fy7BMQXHdI3Iht1KvRNGyeMP8ZNh6ByemfGR6k+7oFKLqD
         JVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626539; x=1789231339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=dsbHtoxtGGcRdRME6gW4yANDgrTCieJ2yJDSEtHhStb8bmLZOuZYlbhvNIGwyItyR9
         w6l6Il9TmvbNqLUU31kbtMK0OGM9ecVunYS8K9SaBTngQ1FBAnSvWNIyKkojNMTOUsGa
         vhaO4NHQBgTpn0d4XBuEOpay7PUj3umNiWSn0nLjV1Dlh3f5/EN/exbfA6eZfo4H5dJE
         CpDcfQiyAjPBsEAnP/UyBZrB+3wuy+KzbdEtuZobgXS9RNl9s5URpJwfFLHkgW+V/Dyj
         BLvAATPA7YfbxECAYApxKObJZrzIuLc7XOyRzqkfOFnNrwCqs3IPL1MX74ZGoZhcGFGS
         wRWg==
X-Forwarded-Encrypted: i=1; AKwUvBw9Si3dcBjwtWJ2+vOVwo31UgIGdHnkksHPCQZIMcvtdi1WUTViZx1lA1o6jkMnt7aaOItPS/jz0YPoFi0=@vger.kernel.org
X-Gm-Message-State: AFuF++mthCZyCtDkdtA0MIW3utpGTZZC3owx7Hv6TpFjmfP3MDwGxU5j
	5cAbX5H2xXBbcLo62JZdiD4R257DYRnhhql/mGOvX8ZSb383YTqp228ngnm9W8Jvxlw=
X-Gm-Gg: AYBFou0I78YRTMahwjoQK6RxbPNGmaib7zj9DFqHtxigfrOCBIpDGla/x/Seo2RDT9m
	aFOr3CnG8dmw+4v1LXjxPzaL3f31wDzKbfpN1hUx5R/zDHqvIK2CDbDRCoupLGr+x0vNfT0oJnm
	Hvd+RJCTJOXV+X9/3hQyEdISuJ3Q7X7UpI45D2HF9GnQTTCtZPCoHB1HnHDmH72175H9FPabTPU
	qmamvni4lRczjTIgbFHEHZY2rbKTLxEh7tiVzkRuPLdypsL9MBBSPfASn5BQxUmP06eR2+kC0Or
	O00V4r0jK1ig9zkXIMnk3jd2d9xFNY15U0u6blMcGqcFwgsqC75/YTin0impqhrLHpuB+1GX7FU
	E1CM27XycbmfVQV80d1vuPJdB0PDBEKlB7Pj38JFwzZYqSw8ACCBDbIoR4IGINDpewWL8h48nkL
	xpOSWcAkJRyvJcEbOXWinv9gm4GuuWL1QIaQij8JsYY+q/raR6kwhZwgjXxTXKut1q4c0R20dBZ
	W99Pr3Xj+SkbtTfd2UNMbjcJk7Kv1rjabfaezTdx6nt
X-Received: by 2002:a05:690e:4504:10b0:66f:c1bc:c075 with SMTP id 956f58d0204a3-66fc1bcc7a6mr1655174d50.61.1788626538948;
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:9cba:538b:87b9:7f0f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm40923517b3.45.2026.09.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 11:41:59 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <uyl23bmb7dtvkneu7wbpmq24gkmrpmr5n5xkanjrnjf27xsp6g@gcjezv6xwolx>
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>

Hi Troy,

On Thu, Sep 03, 2026 at 11:06:24AM +0800, Troy Mitchell wrote:
> The K3 CPU PLL rate tables currently describe only one rate per PLL,
> although the hardware supports a wider range.
> 
> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
> support rates from 1.05 to 2 GHz. Populate the tables with every
> supported rate in 50 MHz steps.
> 
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> The corresponding U-Boot changes are available at:
> 
> - Add the CPU PLL rate tables:
>   https://github.com/spacemit-com/uboot-2022.10/commit/787b5cf44c8dbc99db886d5522c0c9cd5a96ffd6
> - Correct the 1.10 GHz and 2.15 GHz table entries:
>   https://github.com/spacemit-com/uboot-2022.10/commit/16a775c20e9efb54ca55352215e76eb3f12e6cf0
> ---
> Changes in v4:
> - Expand the update to every supported PLL3, PLL4, PLL5 and PLL8 rate.
> - Drop Aurelien Jarno's Reviewed-by and Tested-by trailers because the
>   patch scope has expanded.
> - Add U-Boot references for the complete tables and corrected entries.
> - Link to v3: https://patch.msgid.link/20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com
> 
> Changes in v3:
> - Mark the change for stable kernels starting with v7.0.
> - Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
> - Rebase onto v7.3-rc1.
> - Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com
> 
> Changes in v2:
> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>   will be handled in a separate series.
> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>   patch.
> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com
> 
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney+clk@redhat.com>
> To: Jerome Brunet <jbrunet+clk@baylibre.com>
> To: Yixun Lan <dlan@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>

On a recently new K3 board (shipped with OpenSBI/U-boot dated
end of July), I was seeing upstream kernel boot hang after IMSIC
initialization. Some logging indicated that it was hanging around the
clock controller initializations (k3_ccu_driver_init).

On a board running older U-boot/OpenSBI from May, I originally didn't
observe this hang, but doing multiple repeated boots showed a rare
instance of this hang happening. Some changes were added to OpenSBI in 
this period (end of June) that trap clock controller registers to M 
Mode and handle reads/writes there.

Yixun pointed me to this patch, and it seems to fix the boot hang on 
the board runner newer OpenSBI. I think this avoids some kind of a 
race condition with disabling/re-enabling a PLL that the clock driver
does. I'm finding it a bit hard to explain/understand what exactly it
the reason though.

Yixun, could this patch get added in soon?

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan
