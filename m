Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD038838F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752970; cv=none; b=CosHKiCGxNDc5AAk5odjjZnQQT7YXYrFayey4IhLc3rTBfbwAdN40fXA2PrAmjdEekhWgvinFb21G/eBT/l3FVStmym7tltI9/IU8kMw9LSM14ku/srDTT1nmqASFk4VaLitp2++R5uUvzNyEtCILz/xdaEkJGlbrTcZHtsduTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752970; c=relaxed/simple;
	bh=ddj3yVRPREzjd1EsKGwCdJqmx5OZh38AdrNsfP+JhFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTIbmn3GVou0Ti6p/c748pWDiECBkz3r8HUT9OupCW8SW8GpuqrJlGrBGzFm1xtjFlgI7wxLSgtU0CF/Osr4qpsoGze1/Hgl2g6Gus70dkuH/YS/hsyPI0Br74VXQjbhh1z2QnrzZ9SkWp9b4b81zU2ZRG0MCucYw1HESWwogiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAC6cglR; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAC6cglR"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so1285897a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752969; x=1791357769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sbEPlrgGV7a5zh9vVk+EqHaoIjuLa7ql4HGFcC3qkM=;
        b=YAC6cglR9yRbSZ/Q3pO23PLAojJTbuKF3w0nrDTsLNTnb8xwbrcHgey72ZAwy2rEwq
         v00qaeDa/YMtg4vF9I+McMTqceVntuczsKf5pLnR0zUDbxOkdOnrBlKRuq9RlaP7ltd+
         xF7diJEoiv1yZ8Ly+3Ogj2jqg8JnjF2+502u8RB9OKbERc1EDmmqCL+EjdW14W7U7m7e
         hH3X3FlFAwZiidoTBoQRGqoxpKYSCrsBxgqsUMMru87dQ3j0ZUHI69rxKekhKKnGc1ut
         U7caP/H/oZD2xQ0P8oqofGHt5quP14DnLioxIIyJOljQQYx7+EAE747YcXYCs1JkV/0t
         F3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752969; x=1791357769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sbEPlrgGV7a5zh9vVk+EqHaoIjuLa7ql4HGFcC3qkM=;
        b=GfRXK4GjI+X8ciq+LNJwSMaRX21liKnFDEXILYIAMyhkSSlM5eVj29aUfAUNknv1xA
         ivY1fTanfn6++8EpL4hM4rjdYtBoBn0lCWML4bTyVyCuL/KRZNa2pd72RZdJIaPf+LxI
         vsE13HkdVBfKP+zwv78ALEqn40RjdKh63mEai8CPokG6Apjn0r6XdUC9cnp99pX5z6Qe
         XbsvXOiZPMjI4yqBp/EtRx4CXkTV+VTm8xr9Wy8nZK074CCfCYFd2NvPMBcLQyDwv4QJ
         a3VdOlwcIevB/f6NkepluIiW/7lMnTfjCfHWpFQYpRL62SWZAT86ozW/PeaKT1+Js6am
         b+zA==
X-Forwarded-Encrypted: i=1; AKwUvBz9LwuknwvMC3D696clwkKniSZvDZJNj0ZdI1oeD0k1VlJsCrbo2+k1QacPNv0Wt6U0TCp07ocMmu0gF3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIQaY6A/wtbJTBasljjDQH58jfvWGIlRMtUDdb0T9rEvYwx0RW
	kaBNgpWnD26E2sx2+TpSzSMrhQuCMyOOlreFa2p7ddGTG/Ysn4iUm5JH
X-Gm-Gg: AYBFou1LKUrytY3nSjiJTAiPk6Wh5RLIi3R9IbV0b7nHqWet6qrUKXdROd7EPHBcrvZ
	cORAs/bZemVa9lCAUdyFH6h5lTgrQzhpOznT0VfbfSCJyxnLYzKOtI1B0ke/x0Sip8nFoABh1o8
	o7dnNyjShJldfmM59rG398eDtouSmogJOC7jJcH8w2Bwh/b0n2vlDZNvkIS8DH5pow+XHCEb1b3
	rXR1W/IhkEbkyL5G82ChpaJhKggWydaeChFYy479RmxEK10mDetfnbfksTZqcT54TYZ6ao4/0eT
	rxMyUEyU5bAynDc5bA+UnZ1PVOhvbNIx9j8ucmM8CK0//XtnO10zHpCXBD7KqLgisru2aZugyZz
	/kaaB1+5Tzz/3jLK9DMzRjjP2HafRNGuGwGlwyMVai/5ps4oHSY+bzz2xSCoGvFkxeZxo3Qmq6W
	L0LEfEB7uDOXO/74dl786XiDn/fAxq9xinlUEv79O0QzbsmrBq+wgMiTHamBkQSgNMLZnD7y+NL
	i3yr1xTbvO3/j//9mWvI8W3vHCA47O+de/hi9YpnKnlDpC3w+/6z9o5qsRiqc//+mhZqx9pDI8H
	CkSQtv7r1ExfE21NY0wO54ykIjBXCSuCYN2+B/j35zkFdMmPGOeNA7B5jkE=
X-Received: by 2002:a17:90b:1d43:b0:3a0:bda2:d54b with SMTP id 98e67ed59e1d1-3a4d1534cadmr291708a91.19.1790752968674;
        Wed, 30 Sep 2026 00:22:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae71827sm2122585a91.14.2026.09.30.00.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:22:48 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/6] fs/qnx6: fix buffer head leaks, double free, and inode validation
Date: Wed, 30 Sep 2026 15:22:45 +0800
Message-ID: <20260930072245.1167477-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930031604.70544-1-benquike@gmail.com>
References: <20260930031604.70544-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

I re-ran my v2 tests on v4, applied to mainline 551c722f4080 (fs/qnx6 is
unchanged since 62f4c998b297): a userspace ASan/UBSan build of fs/qnx6
over my test images, and a KASAN/UBSAN kernel under qemu.  Apart from
the 3/6 problem below, every image gives the same result as on v2.  I've
replied with Tested-by for 1/6, 2/6, 5/6 and 6/6.  2/6 and 5/6 are
unchanged since v2, so they keep my Reviewed-by.  6/6 is a different fix
from v2 and 1/6 has the wording problem below, so I've left Reviewed-by
off both for now; 3/6 and 4/6 get no tags yet.  My two follow-ups [1]
and my levelptr fix [2] apply on top of v4 as they are and still pass
their tests.

1/6: the description now says that a large di_filelevels makes
qnx6_block_map() read past di_block_ptr.  On the unfixed kernel,
di_filelevels 6 and 255 give UBSAN shift-out-of-bounds reports at both
shifts in qnx6_block_map() and no out-of-bounds report for di_block_ptr,
which is what the v2 description said.  Could you go back to that
wording?

3/6: the new release at out: reads sbi, but with mmi_fs the levels
checks right after mmi_success jump to out before sbi is assigned.  That
is why v2 4/6 used qs there.  gcc reports it with -Wmaybe-uninitialized.
On a crafted mmi_fs image whose Longfile.levels is 6, a kernel built
with CONFIG_INIT_STACK_ALL_PATTERN hits a general protection fault in
qnx6_fill_super(), and the userspace build with zero-initialised locals
still leaks sb_buf on that path.  Using qs instead passes all my tests:

	if (qs->sb_buf && !bh1 && !bh2) {
		brelse(qs->sb_buf);
		qs->sb_buf = NULL;
	}

4/6: nothing in qnx6_mmi_fill_super() jumps to out after the active
superblock is chosen, since the qsb allocation and both checksum checks
come before it.  So the double brelse() in the commit message cannot
happen, and the patch only clears two pointers that are not used again.
Could the message say so, or would you rather drop the patch?

Thanks,
Matthias

[1] https://lore.kernel.org/all/20260925151449.1517608-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260927225002.509062-1-matthias.goergens@gmail.com/
