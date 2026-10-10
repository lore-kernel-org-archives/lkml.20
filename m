Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4EE3C108B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602795; cv=pass; b=kd59Q60aAEHtnxh2za9wIHr42wKR9EDIMZT+vjBYWk/2AYHGDUF51BL7pMQ5VyjJAKY+cIonoqRb3PlhBg0CsWLCRBmOtfmavUBuRW48MGhBLJqCfIGYaoinNL2+KEaA5L1so6R0s77ecw4/2Ejy66FHbkB8MZ3WjiMgtC81X0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602795; c=relaxed/simple;
	bh=gzk/Vqa98lLR1g14dUkoIDBfibZcPrZRHRXSu0c7M0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N61rFLFACwIhcyaMNQ/KuCjiN9xGOtAwDjwmjKA68hub9VpmdQ0x9qrrCYC3NesorCGoXKWBpyBhg3t3QB+RmJ8MRv9FVqqAnTmCcz24v7L1JTw691PFVuZ+nJTtEHWhWydM7hhWyJSv0SABiEFmsKRQejvp36pIxc/6/y1ItB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+xoK7Qm; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+xoK7Qm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso1669275ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602794; cv=none;
        d=google.com; s=arc-20260327;
        b=G8z/Gvvde+XUeymtdbzBe15sz1ZsSxCpGQ4V5q0m3QizTi/9uvG5JUObbDQ2ls5xCO
         X6uFsn25Qh1K6w3ybYymZy+r7PwY3MWzW4Rk1afgE5+DJG18wGqwDGgU5SjIx605+5WZ
         EY4f7Er3qEMGVm82zvUNFewzZNZ1EmNEEtAJ/kUGZWRZaWxXih2ovEqPkFWznxN/X1Oq
         KaFbqwMEBcalypkYIKjPwHnXbL5gei5vy/GcHO5DksaJxDcubxRx8bA9Eh2FgWmLodbz
         8iHNdy79r4Ie13dh7pII9lctCqo8Z2ywVN9HAWe5/KK+FnG/aQQvMXpYmhjX4nW3stu6
         pmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        fh=fhDn4LBIcQf9cwKZkEMy/s44QD8jBybLUSFr3HCxOeY=;
        b=iIPLDQvNzDHNdDRt3iqraTCZQ2WhGS/4xoIGsR7KphNxj2pecrkShPnzNXG01wBfDb
         5jMz1nGJjgBLnAuTV/f+zbnlrMabPrBvjAOdOAFijPz8uweYy/uKHm9juRdOTN3FrsBz
         0LuPBRRmSLOuaA6IVlh6+aoFDtkjHSJco9+CeT19D420qIwyMBxRgz1KbgSY21J6x1uW
         ieyyAjlmD9S94e2ISslIXmEaP4sGojusZYYo8TjiBWZYwkafYQXyE2+kh591hOQ1CL5z
         GkF8OgHgL/2TO1QEyVNMPTCBprPM10NQwLD/8biDjDy78iiUtsgZbyG1RAO+yc1M2rgX
         RoMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602794; x=1792207594; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=o+xoK7QmG4krG07EQs+M0HCVRFqFRW7EZb2N64bgOJpRzaW9FQGCfw43lySUj/pGKG
         cxcXGiadMIXGN0LadcRDY2oGWFRsi8FHdNn1s47WIUYyKqZFfXPaA+VIg5B96ksVYADT
         T1Y7jR3VsJriHQfuk0htMsH9BrvflcUKLT1K5OKNX2KXOesnMxNMSHPHM6zvsBFMZFYR
         HT1QMH3pH1BO+Q2yW4E+a0tlXuipNGfPLq9tgPLynMmK6M8SqC0+YFCJZ91ToO5S/unE
         0Z2IhDTxC21WQdtmX5eg2fAYnOQPlBhcMYfpgIx4OuiIArIY3W8k+nNU0Jivq1ajFSgD
         grjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602794; x=1792207594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=Hqj5aN3XI9yCRtP9VsHmXumjyfSLjggDtdSs6JXpyIcdksAhobZV1FWUfLxwnmmjTx
         YUozv5m3b4v0FalDcckjOyoodLJ0DwOctHUGfGQ2ZPOT7XZPfUUUemLik6JAk6F+m+d3
         t6kfHBhhmzPN25z0JHGpxfG6U82WK21xmXFR8zd2dax2kdSu/aO+0NirCOESJgO64m/f
         xolYM3Atbut2TGOK7CMwdfL+YzmKMvH32Lkklf2kZ2nB9rVni9VMzoHpDv6q7bcBy8Oh
         AuL5x29u5H6Yzw0JZDvRW5Xs5YSHoceN3cpV/Wxxlbdhytj9q/HXmJ9I7G85itP96Dk0
         UzVA==
X-Forwarded-Encrypted: i=1; AKwUvBwIj+yyPNWua93xnnWaYQ9sJFlGerS8J3G9eZf7sa7tBRhI4+OYAwPLhdOVhOv6C/V1wKGJjJS8drwkl9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhr0l+lHCrPMnnERPq3TZ7xQFqzPa2Z251EGh1k8S0/5igduFl
	p/8Hkudc0lGPTipTgelxhr6O6BSNrwiskhgVywA/0YSGtkoJA2XhXf9Yeplg01bsKyk7mwWuy9X
	e/hI90KzKAMY+udNUdkHGjqS2Hg1rZew=
X-Gm-Gg: AYBFou1c8A6tbJFWW0Ntgt+77fY3JJAfJH3ItQDGF9PNB4MW5yFAnVLgvPGe2UHP5ka
	oMwquyU2cjijnYrdcEUrVza8BDc1xZ8Vmps4HeqPyRF4DP+SX/RL7ttDrgwNHD8urs7GgEn/D7m
	G+xfZNfCPpS+tF/d0vhkfx4NPT+t+jTAshHqWPhKWMTF821iEiCwc9W2p4EuQyfQ4wBtHdNJRlu
	aRRqqy60C1xcLXgWAtgs+tnuhXazQqnnz0Xe2Cn4zrQia4sX++JMuvJXESRm21zdSqAsWobL4m8
	LFjo2c9YM7jDhs2INNGvehBjGckscAK623lvKCipN+TzBup6Ac5ZuIvWSrEFqwN/W/AQc1jEbf2
	XQHPKwn3Rrm8Mr4x26QfhwlmDuQ3cjmjwlyCMwqMc9Ga1bcxYbfgMf86ohCI9Ce3eh6ZlVD94ny
	63a8xfXkShXu5Y//VTB6WMFEAIYw==
X-Received: by 2002:a17:902:e74f:b0:2e5:78b1:33fc with SMTP id
 d9443c01a7336-2e842e061e4mr35918455ad.53.1791602794135; Fri, 09 Oct 2026
 20:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <202610100943.RQhhOoh8-lkp@intel.com>
In-Reply-To: <202610100943.RQhhOoh8-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:26:23 +0700
X-Gm-Features: AclHuK-rwA97Wy1N3y57S1OeNaWlVpoAN-_YWwiNqheegjzdeSENPlryISm6gn0
Message-ID: <CAABR9nEkjf8_dar1q4tYMgBTa0p7WzR9Qx1N4Nr_ECuNZ=hxEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Darian Biastoch <d.biastoch@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610100943.RQhhOoh8-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/pinctrl-mcp23s08.c:617:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>      617 |                 return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
>          |                                           ^~~
>    drivers/pinctrl/pinctrl-mcp23s08.c:592:17: note: initialize the variable 'ret' to silence this warning
>      592 |         int status, ret;
>          |                        ^
>          |                         = 0
>    1 warning generated.
>

Thanks for the report.

I also received a similar warning from the sashiko-reviews earlier.
I'll return PTR_ERR(mcp->reset_gpio) in v2.
