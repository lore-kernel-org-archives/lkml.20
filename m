Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACF29B8E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187713; cv=none; b=kM4vw3Ch6BKCnofLdX6K1ZetdvkuvumAaVePgbcLpyFSPhuqOWxdP1Iuc8Cx1k4S1JEs7zw37+fsGH4v0Vdox7yf4xrZtBiju+GkUPaTw+xyZHnprDgTzz02EIAkbWFV2V50UQ6c2JCs3NgvTMvZ0P4HMi4/tGAZYgEHs873F8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187713; c=relaxed/simple;
	bh=DbWYDczqzUeYS/iImepGHyLmo7iPgL1SfHmAnsTEBkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5nL4fBsXt7c/x1S04T6hAOkRkG/+mqnLEqYOC/LIdSFpZZpvW4b6AtblOTvXsPqKuioNbwRSetYN4Fp5b2wsaMp5pyV/ySv9jzZwrqHzcXs0U0CVeKOSVcFa0fzk5n7i/dIcC9MT7xfZAX5FQk8hGMHHcBdV7pfMMYUeYuLupI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SaVUMa4U; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SaVUMa4U"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67999045530so553229d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187711; x=1792792511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRdKsMnoUYDjl4OXqzoURv6V5579I0uPGZbnGd93awc=;
        b=SaVUMa4U/r5OsEXiL0s0qvrDdz5XF1mOhsmOK0lsQ0KAOfR8ioWi2rRKBRT+1BXOrE
         2/wugTzxFyHoGGvZMZ1YxIp8ERSi2eKCxf2cUV0KlFFvDcPBQ05onoHD9B0s8LWGnmNh
         FdKKO7/Cp12wCa8lVYwPuXiYxGVIBooRLFXnRvWoPkxpldhzLsyUZjHFXLblF6RjNyII
         58fNRdyMqERie0hxGmrz27S+KwKui+HN8om3oBoC0DU18OW0XAclnbkN7Pz9/5iJ9NBZ
         srLhyR6KqnzIQWueW2DipfY+sWAe8XxF1S2xRg+7yN3eCYI2pSofg0SUZvtFdeLK2kjw
         iBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187711; x=1792792511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRdKsMnoUYDjl4OXqzoURv6V5579I0uPGZbnGd93awc=;
        b=a1Fh1CkbU3woHW/AJuMNAQJTQ4YmxHlcygCbPb+JCliGryh0ixYzrWHyNmZw7+3I+Q
         hwl8BRVQJCFZNW5OHFAV00xB2sFeP2HZgYHV1hOBuzAobzpl25pxwK2MbPB30y8SemHp
         GaEnDhgQCDAsWk4dvJCcSaG7OU9D2SfZomae+bQGWVFO0IR8pnxRmGVxVsKiOakb58OV
         31oQDifetQJ2IJzrUYvgcos1XZNSNPaOZ5LRctxSWsr4H3DbqMa8I3Xp7cOn7lhlJZUv
         6cwMRUgTRmhh60gLFgzmiK5XT14WAM0UMZY//Jopp+PNlO5Fl6QNf2SogomxhdU2OgjT
         STgA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ71HcxbDvSH7Gm0E7gFlheMhwVDFDaflXez7u2i/PtN8KnNObPIaGAQB6JBd+UkH0PzrBB6Cgp4GnJRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMOESaDwA7lQvHWXJaiDQrY2LdRUXZ7eeoWnZyXFvyGUXObfmp
	R96vrulVxdRnNs09RmeFL0Kv5K/JTK5mqwJxAr241F4yf9Qjs3YOT0CCku5PUgh05ZY=
X-Gm-Gg: AYBFou1F7kANLQzFu6PijDe6Vur6M/bR66PU3xAO+tgZ/ZhlUW+FZRsf4xWPBbGcwl5
	y3IjJnQLPSWEkf9AOM8nLhvqOGXn7kPH3Tc1985Dzs1Z/fOz6rJyEeqnAUrLzwhlfUc/h32DoXE
	75tTOpvQytAHkijRSHY7CjyitgrBhmjsUqjZBzogJWp6BrOraFlFujqkv4+aeXvMNUd/9ld5dJ9
	j/rxGenT2h4ggQ3yHVnq8NlZbi/Kil4viI2fvNPqj8PudHiifgLb8126lWsq0LvlyGpmn9Ao0tL
	kOfEuFl6OsMruBrnsgVSKC7ZBrXYog41ly4XLlC0p2lIl1s8qQsusCkIMBAySBZEACPFRK1Zkbw
	hM3OxLB6WVx0Zn3Ov9ln3JQzUiqlroy5RGy9nfG8DQm7M7nzbQOOjnOgpU4mQ+Ux5zOkl4taamF
	LFfVgwuZhSaZ5xrCrDfU6cge8EveEBcIPpCB/ICGOHoVDm/sKDRuGjP8X16cRhi4DALtbUvNqLT
	MZV+f6e4QIIlxpvRcBB
X-Received: by 2002:a05:690e:bc6:b0:679:980d:9968 with SMTP id 956f58d0204a3-679ca7f7235mr217435d50.60.1792187711142;
        Fri, 16 Oct 2026 14:55:11 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1f29ddfsm1626136d50.23.2026.10.16.14.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:55:10 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:55:09 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 6/6] riscv: hwprobe: Report SiFive vector extensions only
 when available
Message-ID: <atKdPZFu0j86WtTS@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:53:03AM +0200, Radim Krcmár wrote:
> User-mode use of the SiFive vector extensions requires non-Off
> sstatus.VS, which we set only when has_vector() (CONFIG_RISCV_ISA_V and
> Zve32x on all harts).  Xsfvfnrclipxfqf and Xsfvfwmaccqqq also execute
> floating-point instructions, which additionally require non-Off
> sstatus.FS and hence has_fpu().  hwprobe reports the extensions from the
> per-hart vendor ISA bitmaps alone, so it can advertise extensions that
> are always disabled in user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: 1a6274f03534 ("riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq")
> Fixes: 1d91224394c9 ("riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension")
> Fixes: d9669e33c8fa ("riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

