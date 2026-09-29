Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5F5293EA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688384; cv=none; b=gjxncWBvXFkKD/cbiP+AMZ+/JIFlMBf+lKTi8/qyvcHHMC9Oq7XUBRiU45WfvzqR4oP6WvmezrCxuCvZ9u2VlFlgklV3U/hW/lA9SPxrpOZFgFDKzwYKVheqsKqh3ZITXdZwyG51Q5G+BWq0qKy/NmLmIEnbtxYV2vVefiCD99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688384; c=relaxed/simple;
	bh=XYJ121tcwt8Pk1Ea6bO06cIMEmOF6Tdyk1jKVmV1gKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkSfiHHOOjj9GL7I6SXPk5ArO8hyDIt6vFRBe0lrUiGLILUUn+zkC/f0iZ6QAyxBkDIEHPh1DP89PG8CB2Vrkl9IK51Gw9LjKjc/NNmcelN1Q08LtlP6ZvDDBWt2H450GliwI/2ZBamd64tYb90CinCBK4aWICHHkM68hIg1nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJx2ml2M; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJx2ml2M"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1438190eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688382; x=1791293182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=VJx2ml2M5MLLT03X6MeyYhi7+NcPtYO2AA9TCsrl9gQg2d9AUfUwb3LnN+OJLCzp8Q
         zojc80/3Dkw0EWr4Z/nWVPU6uZAZ/O8UGOzIKD/yXPd6CQ5r6yPAUGWh7I9p6XZbdf8T
         WsKdAkffyp9Ca1uaA0iTLcxXnqxmo4Y+c5M+rDhL0sg1FlAn3ei15KnrJJdTrx9F0xSO
         G69hr8ScGM9sKe4/c7PSR6FqSeiZ18ns92tl6io4f1NNNVbKbLcsY5IZKIRaR8/veg3T
         X6rDlGVSGLfn5iE1L3HX/lVRKyAP5sPBW1VPyfo88a+T+8SruUAeByyijhVct+kfyrB/
         XpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688382; x=1791293182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=N+2NWghheOudUwJFNJyurCaaAUA4e8dlly/o0q9ZPLW/q4ro91YyjgDWxdMMRf7Z9Q
         jS6iHQEKLio+MFLoQ/Jqp1tJeM2U58lFsdQWPVoFXTuAlKBGqjTKUIair320rIO9r8wA
         yRHu1Q7XR3RLJb8t9+XOYc1NGV/k8pym9SAYbCcNM68wnsPh4MLoi1M41/m+Zm+lmV2c
         tjl5mBZEjUWQrHOnv/b4Wf3mmgYwRWk8CKI72qDGadEQ9aklrGEG38jbpLlg1tRPv8oA
         /u1rkY5BQrVL4FejaCF1sABdJ/x4wgrHrY2CIWUPcWMmuXLit3K9dkEtjzNH0sI8Mzab
         kuIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxItM7JGJrxCsiHAYKJPgfcCspjw+hIvM/p88hHmIGiKX+afU2xGtuK97JwSOuHwN8fpYsqpKB+5ZXB/Vw=@vger.kernel.org
X-Gm-Message-State: AFuF++nO/BTKCqIxze0QeqQltHtTPG7bRfd7f6EaWx/a5uxP9E6yP2vj
	e7tA8adNB00s8FzP9LDHtYmRwgnKI6RzARyTPNktkT+SQxRtH5t3eZLG
X-Gm-Gg: AYBFou3f63AEhcc32BANEDD6Iq5TEGo+Txy7O/PF51c6bXjPw5DqoPT8Omxt68MasXK
	3mqyT1gtVC+4JKmXxfwyNoFaUzEKDvtXrAHAKa6E++dUMEaVo6Wgsc34jSzmjPL054X4GuLA+lp
	o+3idNUuph23ye5qkOXEjDSrwovrBC9fD1ahJki/wi5Hq99jVeMt9NwnBA9hxgb9a/En7eP79Xt
	ChqbsR5QAZ1gEjQPxGaOzdNJlR3+w/4vp/IA4iNV2nYy9LrENn264BlZJW0AkSpNDMIGIdc6Zio
	D/w5bDVAtXk81/f48nPu0Flr+5vX1TC8l2FfHQO5PEVbu6SfRSX5xdskfb9UJWT0iiE00Goxu6J
	YqQI+VUKb7hmHgfnudiraTqwIDJPsDsl8DL2V/RY2I/o+gvAISDXjQ33nN5wxVh9YL3BWIIbosK
	IYEIaCJjLsNNC323/MJTLw3mU58oLnfBjc1nfAKzxO9es81BYNKwxBi0BQoJP1rzi1Jk0imI0v4
	rvzYjby
X-Received: by 2002:a05:7301:4d0f:b0:34b:8832:8706 with SMTP id 5a478bee46e88-34b883287ebmr1521357eec.35.1790688366426;
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm36468431eec.19.2026.09.29.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:25:39 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <aru5-aq_sPUDy8dq@ThinkPad>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
 <20260929092238.1765758-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092238.1765758-1-koreev.r@gmail.com>

Hi Ruslan,

On Tue, Sep 29, 2026 at 12:22:38PM +0300, Ruslan Koreev wrote:

> I wasn't aware the ipu6 driver had grown IPU7 support, my base was
> 7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
> 1-3, the vd55g1 one reworked as you suggested: the sensor probes,
> ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
> from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
> is not needed there; I'll drop it in v2.
> 
> Ruslan

I tested patches 1-3 from v1 on another ThinkPad X1 Carbon Gen 14
(21V8A028CD, Panther Lake, IPU7 PCI 8086:b05d) using the ipu6 driver on
next-20260928. I did not apply patch 4.

Patches 1-3 applied cleanly without local changes. The VD55G1
probes successfully, TBE20A1 is discovered by ipu-bridge, and the
media topology is established as:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

The sensor reports Y10_1X10/804x704, and /dev/video16 enumerates
GREY, Y10 and Y10P. Setting Y10 at 804x704 succeeds with:

  Bytes per Line : 1664
  Size Image     : 1173120

However, VIDIOC_STREAMON returns EPIPE for Y10, Y10P and GREY,
and no frames are captured.

Since you reported successful plain-V4L2 Y10/Y10P streaming on
next-20260924, could you share the exact media-ctl/v4l2-ctl commands
and any setup performed before STREAMON? I'd like to reproduce the
same sequence before looking for differences between the two
linux-next snapshots.

My test base before applying the series was:

  6375e61c01e93e35ee7acd336a689ac1fae4b509 (next-20260928)

Hardware: ThinkPad X1 Carbon Gen 14, 21V8A028CD
Kernel: 7.3.0-rc5-next-20260928-x1c14ir

Thanks,
Qiling Zhu
