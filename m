Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65583D6493
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870376; cv=pass; b=sSXwHas/Sf4+rhewdZEkSmx2bZs1xc5C5WwPTzWqD4mKeqAe9DzOu0dcVTBJ2tDF13/7gC9/t2fJkKTz/+toMtfnLE+7+3tixOtjxt8gC/rGptIunc+OzAXZQKiH3eOSR6mxvfkxhsEshfIiC7lEuOetNwMq5IxATGjNLgpy8Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870376; c=relaxed/simple;
	bh=f3WK1sLR86o61DIAy56snUiA6RhSELzDEenaTgBQ5UU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Xo2fIUlGbVPdL//SOaCc9w+36gZiB2v8+TpnIAGeJ24z0qQHmFSKVfxqTt3enfzCa4Mm8L9hFhX1ZSfFza4iOigTiGLTeNm+YojTP65VXnSwXuWGagGzAl5FIxGnwBW4MRAVtXUIzuK/QBQ4S0oVEG4DY8p7eLV26PZpcv0Tr/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=teAVrN/G; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="teAVrN/G"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca80d708489so234129a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870371; cv=none;
        d=google.com; s=arc-20260327;
        b=c/cx3hJEyn6AHNB6BgicPZScdHrCE8+m/GEfCiJShQAWNaIrudQrkZRa7itYsykIfm
         1tH7X3wDMVE9Vj0rDRnAP2PzAf/Zd61pubPgVZwiBLgtva/7p7p0AOtkODMNYpTXLZFW
         76D1i7QOu0mOj8WqAepibokMYKSnTEg1WhQaR4Q+uLo0SLJbCNGoPRMFyrfLNXffqZg7
         CxEu9lBqzMHA4UYPfaRFUihgvZDSIaDl/Gu/7B1j0H/9t52vTQhVVg+GVz/Va6LPXEnh
         /ZW0N051vNizXKjAOQDHid21W7VA04vMtu1eQkJw+OMEWo+Be9Y+75FzjEoSNJw44q6q
         rD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        fh=RQ6p7PViDcPqgVvB6HmvVqRqORu4FB0zZZyvxG0epXA=;
        b=PHInrnTFj72qGFbVm47ZPaZaQiFa6e7upMTJTYTbf6JDNQz2oH2Dv5gK+sXtaqvylC
         DcAErC+HgtEMaUqziceD/h5lmtCPqGp5mnQ8Lx9AX5QiA0j/6qGDfyTZ3Wcvvlm3CopM
         gw0WsK+dLdbjZm++ZpDsjX8WQeouGL+Gy2n5oE0yhi4DJRTLAqVAdhlfXmSIaXiaUa1v
         TReLH/VGQoDAGE+eRT2yagmFnAMCS5UhzJR2T/75BMTYeQoo24V7lhlLUVP3PHDcy6x7
         nBGiXPmock2KcTTq91vNaAfEaRnc01A+4jT0TFXFTsdxN+4ONTmZE1ny3n76nX8/xhem
         K/yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870371; x=1788475171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        b=teAVrN/GX9q8UkraHwaRS89Qmos+LF4L+bmiYChswagKfJAyKQ/VcuiGzEtiYIOYVw
         s5+QAkWfpRBXi3PBQDC5whW0d0/+Uv2W4cf81paMttfhKNFjK/bVuLmu4FnUsWw1XSBM
         1/XtkhgDJFYoKaG9UT809T/zpumbAnVUuPcA5HtM/bKrzqz0ZizOHXoSPhoEBm10EUcq
         8TiCMyIPpZl8U4/8EYTX72nzzm3JHaThUtVMiSHrl3LOny035XprsvLOmgKgFDQP//WB
         ZO/BNF9pX/BKfzh/WxeiyNGjcz4i440xiG8EQsyPE18pGtBCeFSGKnlCCrSpqYD/jrjx
         LXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870371; x=1788475171;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUgC6U0Ri042MH9ckfeZORUhqjWsZjHuRBdl9sus2/8=;
        b=BYgNGhAMxN6wJVr530BivwbuesoxdqsNuiCYLhCM2ScQ4BpH4CHiN9MvmrfVJWkXGY
         o/4mKNsxncT8nt2Vl/ESRAp8EN09Fifm8busWE9mMShHEORBGUS/ElFva3GG3W/gvkgk
         8QwI9WHgxX7toJgNvrZ7kZjam/qbAUzof/DeGEZUY5589j13GpSfd8rZE0tWFguSJ6Ea
         5O9oy190lxqFneoKIwoLI+wfyb6/Z0K4sE7YUNRWTkHjaUdgQamhFlLKhOC9QztRZyl6
         BrXw39T+MDbK+t3Th/kQxQczl+6FR/yRBKGrk5obnlVpEBFrgBELxLAgKEwO/BDy7rsi
         fd0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrcjFSqbvXi9+I/KiM+c0auEagCIOjm6dLGLnOEYKXg0TX/+lJfuu75vrOiKUShqq4F7VitAS8ooTOIgYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nA4k8ppV9jdRQMheJkiLjFnnsA5yxn4iKdqQVpaDJ6w/sh4DPu
	xNJXRPVhlAZdhitlRdXAbuUT5svvbQymrCF4cOJgB5nawRJzv/7o4jhHfTlI43XqI6X89KS2Rx6
	7moB/eT9qUCqBbWQGtbZrizDuhSnTuuiHYJoLAzXd
X-Gm-Gg: AR+sD10ec2X6tr6oqeOrdu3vJr5x5NOpcFY/s3rQnczyJR04o5Wp6Nw7GVnwJGbixs1
	Z23VKPI7Sl5YUuo6N9JRby1xrbJlRzwGWOOS610K4mDEE1HKrYN8J7r1aIc8CVjC43P82DEZo6H
	cL843W3BFLiVxJGXsAkiOdV6GAUyZy7ypLT2FsZ5ek3YeB/Fq3I/x1xiKOW86RHmaBbo4vryHLN
	eYQmY1G9PxP1hS8v7yJZOIeF7C2GAJ06MIe5Hv4ufXG7vlyJv6zdyo/QrTqpcVSMAaasChbwEA8
	qCJk2Z5p+nE/p1l5A3lrqQE3IZSJBfXIRj3r7PA7/DSe9Gdv3bvh/gha2pj3xvYtZPWPH9PzBco
	ErtZutlgoAcWZGRydcZlq7k2+F0edV6hjHA==
X-Received: by 2002:a17:90b:4d11:b0:38e:7297:a92e with SMTP id
 98e67ed59e1d1-396d0f6486amr2117646a91.9.1787870370120; Thu, 27 Aug 2026
 15:39:30 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:39:29 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:39:29 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:39:29 -0700
X-Gm-Features: AcwNN1WPmhEDwxbrpltfK-UsN5SmqLvSNmNta_ia13t7ApSIc0SOkNKwBfo9p1I
Message-ID: <CA+0ovCh-bPqXn8L5AY8=c4B2L0n3ixXKHFExwGtMOouBYGuXDQ@mail.gmail.com>
Subject: [BUG] jffs2: BUG_ON in jffs2_get_parent() on a crafted image
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-mtd@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello David Woodhouse, Richard Weinberger,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/110-jffs2-bug_on-jffs2_get_parent/

  jffs2: notice: (20910) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 2 of xdatum (0 unchecked, 2 orphan) and 2 of
xref (0 dead, 2 orphan) found.
  jffs2: notice: (20910) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 2 of xdatum (0 unchecked, 2 orphan) and 2 of
xref (0 dead, 2 orphan) found.
  ------------[ cut here ]------------
  kernel BUG at fs/jffs2/super.c:141!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 0 UID: 0 PID: 20910 Comm: syz.6.1218 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:jffs2_get_parent+0x1bd/0x1c0 fs/jffs2/super.c:141
  Code: ff ff 44 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c 46 ff ff ff 4c 89
ff 89 f5 e8 40 e7 01 ff 89 ee e9 35 ff ff ff e8 64 7d 9a fe 90 <0f> 0b
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
