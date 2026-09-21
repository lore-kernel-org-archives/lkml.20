Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA32D3A75
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958329; cv=none; b=st87FAdHEm0TXwHDL+miMl7EqGHDuSilfKefsk84YY5UeICYjYDjILF29I5V4SP0jiHN1JP492Cz1QCwJII01e9McVLIZLy2EOu88Cc0s3nApXCJjTnT10+bTt9HejOUm8RlVRrtN9Q4OrPdIovHRhtCXoX8UkmGDth3G7dGDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958329; c=relaxed/simple;
	bh=roqCL/hZ7Ph4PBse9KxMlNOZ2C57CeVfUJf+MSM/X5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEHJMj+8YkYdsDwoKoKUF3g8TW9aJLfCAXIwQkOJ4CNlFyl7TbS6QnTVVdX8q9elfF9AoISa/3/blabziD0FrLcEjpWGZvYSFA5KNMub3fMpQMAPVpifecgQcmVNduYXgmBR7i4yRHXemxF+GyZUJm2Qo4R1QiQCkNWKhImaprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM8VYNeu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM8VYNeu"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so1503150a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958328; x=1790563128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ORBs3m+ws4OHfu45BhvkuHCmS+gMggmNeMZoCuvyzTw=;
        b=CM8VYNeuW0VOL6B8yt/DRO+ysw3pyTQ3yl/tUnQvN+Im8R7kSAuDn43fTL6sDUqlKY
         rhdEDGSKL2FiGxZCwLRP8R0DBGaPVVll43KpNDgruBNu+2RtBEhq5oLXDHIY53ZdxppW
         PnEKkW2uh6WeyifZWbD1OAqUAVGxShKGrORQQmt9GkKUnK7x2PbluE4w9BDk+Cr3JfGE
         NApn0WCFGXTzgeE5Rl5r1tPUjgiNcgbl0ztnZWIxhvKzdprZr+Xhj9W+kaWZx/uKxziD
         9W117Ij7n7vOqgpHQ4fa+9SSLwdXdKwULSuGqh9DXYlCtwa7ZplLTF2a2Zvx2Pig4UQ0
         S/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958328; x=1790563128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORBs3m+ws4OHfu45BhvkuHCmS+gMggmNeMZoCuvyzTw=;
        b=fewh7LLUyNUwikagYYvh9mV/r7ghpgbg871aj2K2A9LRSewHDDnPNwy1A4kKdF/SO0
         tLtXEl4AtL8gIyK4ozLKCbYD7VkpMml3cN3qwCNmDy+YOGVZI7trX59Uc0VVdilXEW0O
         3wmGmQXgdLCi3Tym7WeVYqF+kXo1YgkapGxoOkMYi8YzO/3MknRiCrYOTuiNaUGAeNZ/
         /uxAidxye3j2kSudhNhlx7ipalgPtq5suAISH6ZRnv/Zti6N/762PMUOZz35xYMQluyE
         bfmNBDMHpU6gaLBJOSn8eon+LBVwZm9ZC/L79ySdKCJtwzTy3oR13uQBuUyH5LvXasII
         bitQ==
X-Gm-Message-State: AFuF++nqVNQU3uZt5l8doypJIDydXgOd7uXKyPSvmdFAsRi542UlV6q5
	ZYtg6eq0kg80Kx2gtKcIPlrKK7u1T2Xa3R4n9vUyhip1VUwqvtinTkvC
X-Gm-Gg: AYBFou0BQpANdieBUEVFS8C1+tKPMdzp22RFAsyfiKqa53knHJH70fh9RHVQG2hp16a
	NPoY5opOotWfaD5uKgbIw/L3ruWM+wzskE5dwSbHaPKxCxmr8XXB9MNJdIa3TCGN69PK8jx+gp8
	xdMCxreBCSRWov8LFuTGE5mZUamE9tKkQNgR2XD1WzQAZQNZtMaADoKpyT/g9XN2PxFRTwbRUDh
	MmTnmX4elG43GpDSdbKdyDSoDlC+VZ64YcYK+ruwubxYyXSbuMRTeKENFcu/iZ16JxmBAWJ9hEj
	aqSzMbEoKhM2inA3GXTwx7s+s2CtRLKwy9Rb7wODJPSqhgy7gUIQ4BkaYyF1SBATmONkctJ2MgI
	bZ78S0r/ydUIk8jAfN+axIeubs/iP1T0G4KFauYDv0P16X/lnKVJVi4TGWA1pxrK2fZhF+YNrRk
	CAzkzHn747jyN8TGYHixKkzSG8u3fwqW2tZkuLo2p6goH+eKy+KTH+5JADgkbnEO/T1C0T3heLn
	SydiE2HevhVviPV2c/VjEAn5uaBlxQLtAqBL0KN
X-Received: by 2002:a17:90b:5281:b0:3a0:3673:dbbf with SMTP id 98e67ed59e1d1-3a03673dd7bmr3956785a91.59.1789958327913;
        Sun, 20 Sep 2026 19:38:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318744dsm14208387eec.20.2026.09.20.19.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:38:47 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:38:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: gscps2 - clean up driver code style and
 structure
Message-ID: <arCYnPusyDZxrdCp@google.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
 <20260830-gscps2-v1-1-c733d4cae7f9@gmail.com>
 <4cc9fe4b-c3c3-46ff-a32f-d2a86c0ce077@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc9fe4b-c3c3-46ff-a32f-d2a86c0ce077@gmx.de>

On Tue, Sep 15, 2026 at 11:51:28AM +0200, Helge Deller wrote:
> Hi Dmitry,
> 
> On 8/30/26 22:52, Dmitry Torokhov wrote:
> > Clean up code style issues and function ordering in the gscps2 driver:
> > - Reorder functions to place gscps2_interrupt() before its callers,
> >    allowing removal of its forward declaration.
> > - Change gscps2_enable() to accept a boolean parameter and remove the
> >    ENABLE and DISABLE macro definitions.
> > - Convert printk() calls to dev_dbg() and dev_warn().
> > - Fix operator spacing and multi-variable assignment.
> > - Add spinlock comment and use cpu_relax() in spin-wait loop.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >   drivers/input/serio/gscps2.c | 208 +++++++++++++++++++------------------------
> >   1 file changed, 91 insertions(+), 117 deletions(-)
> you may add for the whole series:
> 
> Acked-by: Helge Deller <deller@gmx.de>
> Tested-by: Helge Deller <deller@gmx.de>

Thank you Helge!

-- 
Dmitry
