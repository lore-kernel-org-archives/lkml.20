Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70114279F9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682729; cv=pass; b=Y5kxXPpqE6uXzy2gdTBhiocL6ZDnsdyUhpY6ni1h3OM8CbEWbP9T8KgQliRdHNOppBVsrYs5MRM/1EEGH4yBkdXZZDF+m5ikTmrCn7/EspmD+Fxi/IZl1YfjxYgcrwAVOkU5GtSISKx3a5cW+dB5G6QiKOyR4HLnWzZFgycbK9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682729; c=relaxed/simple;
	bh=M/G3T9rnVSPx6HC6z/zLA2iuwCt7IDG5Tz2AaPMOYdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cua4USOzLqMEXdH7wqhUOpOYzWXZkAO/FImhQEhtqZNPqx+7TxBaH7x9F4q7nLQOSOI8Xi+NOh73nKjaUHYHtEfCyOauf7Rr/x2wbgyoRzoveteUC6XWilVOCvRrGMBcU2z/4XOlCHn3hiSy8N4jfB/DL8Xr+ISWMk/l9egN+7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9lem2jR; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9lem2jR"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910c9ff1fso12142085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789682727; cv=none;
        d=google.com; s=arc-20260327;
        b=mCtXSX2D1/nLD3GSdqi7XKCzHjrtisGI4RcXQUgogl9KJsdznzY25kFYF96Nn6MdU7
         cIIPzkBcNV9msIp3kXmVAkUumv0YeH/D/sMGDAdzrc9wOF7hCTb89dtj89Z54HUzLUm8
         VvSX9ArwBkL2Id7CH/ImQimto1MlK7bLhtgLl9/bh4+PU+MpYzsYR+LaFGTOO9sV8o/l
         nF/l9j4TjxwVa9G9rsjL/Xe/BLl/nnFXYcdi5OCkvetCDaX9989gcwCwoivqaHdV7Oeg
         jOx2P+3RQVhzU6MP2UJggpwvBpV82sNoBofAkfQDEhWlyTEVoGYZNKUT0HSLL3LxKOty
         XDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L1caQE/GddzF2POA3lrIPiiJqtABGBhiQ4joZPVEJNQ=;
        fh=ET+FnIN/cH2CXAxQ7GRWJiBPcLvNWbP/aDiOHl4RPK0=;
        b=PYtxGqeUPFPA95G2LZK4uRLIhyflSs3x/dWcAtICxzgqVb+fXiiAAoDLL6QZjvUAMB
         a0tTuwNTcZtJF5sw2gkf6vjnk7oH5QvGOyR3sr9VJMyOiWxC+6463e2s6TyqpclpuuhZ
         1ISxTOQM/2l3lPiBi9Ta+3hG8GlFq/eG4Dsud+Y5VrvDMRJ0A2szQt8/35dOiZNZ2uzr
         Q/fo2XBJlF+psnmEapzuGuZ1a8AD78/1FaR2B9U99dD2GAmgecIviWHk17dZnbck2S/S
         2r6Gwr4wtNHCURB0BPPeIrz9GjclNet4eZ+X6v9zJVETnJlHQN8I86dXbhX3E0ewYcsE
         NJ1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789682727; x=1790287527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1caQE/GddzF2POA3lrIPiiJqtABGBhiQ4joZPVEJNQ=;
        b=b9lem2jRBN4Tl59NqLjmFeqGQjdFcSzfQT0Q8pJLGSeQCHkRUpgQnbbxcBJSYfqQOX
         cA7DcfIeQgPDn9h7Tg8N9SNygCESvEYudPAneU1AlZ/mEgWnWCthSPnu6TpNvP8kOFhn
         lbPSHDJ7b9S+dzzaFTAKrGroKc9nX7+EjtwxPQ/SikVu5BRl8NzYnexT7lv3Y4+JX4oX
         RQf3wRQU01CY5iezwrSS/pgRDOLWncWkv8kiceTf/iZRUDW+GMXE7PAWe+qhNGA7o3V9
         WrwF4WM+OXPsDWmoQhjweTCUZqc/ykeTrSjdo4MES0SMvU0KpjF4IuwlCnNWlMVVh5aF
         k90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682727; x=1790287527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L1caQE/GddzF2POA3lrIPiiJqtABGBhiQ4joZPVEJNQ=;
        b=WCwLjMO5qVF14IbTPsQtF7AxdR8UAt3hi3S/Xwq37xhXjC06s6JqRysV6AIfbt5RBx
         QaCLfwTkkBvEeAa9+E4cle+yyJAww5UJKUPq4PzDHgMdRABDMoU5YwOMP1s+w4aG5sMK
         HwJYkHRgKQkxySMw/7Vl3AEuJr48CIv/VRTgqtePIp+mFY9KLBd0S9CR5eSJHEM+/ghi
         o4M7zuGOOkGCU0iLgsUSkqQ6ZZRQgdEFOtenY5xoMflJklzyFwJQ6BoofBWxD45zXKE2
         YqCNGFjQ84+LoWmvEViAFkFFfqlGGBDgG1m1LpRu/L4M+fe+Hjle5Gcfl+2/Q/iXOOs6
         lLjw==
X-Forwarded-Encrypted: i=1; AKwUvBz4qVNDHQDXkXXSfuN6JU6rd1pEG+avG8kg3Xcwuol07ZqWgYutbt2RzZ9R+vLEIvbDW1/vPmCRB7xIIBo=@vger.kernel.org
X-Gm-Message-State: AFuF++nSpCruHiGlpT+KU7VJkQZ+Sx+/K48eXkhypqJWHLau95oSBDyP
	A6lnSBRmBH91tKFxgH4AtmuJYTNOGYxVpvObDVRpP883aUzN/relsVaxzOaSlSFVqnyxQbQU+ZR
	RFUDMamF2xun2yOjrXiI2WKOySRnuEWM=
X-Gm-Gg: AYBFou1ap86pb8k+8tKb40xlFGkfiFlFD9RQvwnZwVn6H2+vdY6XmOsd6ntqcNXy0Rt
	x4C/1IkeB/CtWTOTgrwOgC9U/cmug8M409en3aTGLbKGxyMXT0bAlqGQ4bgS8Ov9tzQi9tvHTAH
	LwwX3/LjdgXBEGDXjFfHV0DnP4P5YGZ7dOIhVOqGEbPdn3BMFci6Owhe7au1koNuWGXFmdH0qzf
	OlAcCPlp1BN2RIkN2ZMK5L2Rd1Ut+QKtvYgEcxI8Y+xN7+7piir58pKqkWT2fXXz4UicBAvg8Yq
	58UrNjPl1GakNKgt/2di+gGdmr7z5Ayj6tZEsTRr2VzEJEpaHDIFwDd714bwaGD6k2DDCIKcXg8
	qBP3fC9wpZZa5lg==
X-Received: by 2002:a05:620a:1a03:b0:93b:d7ed:ff66 with SMTP id
 af79cd13be357-93bdc8b4b75mr58597785a.58.1789682726891; Thu, 17 Sep 2026
 15:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com> <m2ecesp96s.fsf@gmail.com>
In-Reply-To: <m2ecesp96s.fsf@gmail.com>
From: tmbates12 <tmbates12@gmail.com>
Date: Thu, 17 Sep 2026 18:05:14 -0400
X-Gm-Features: AcwNN1UTcZtpgBWu-l9JcuTibvJTD2u0xKrtDq6SchAt3r9hDKLxzygEQyk7zds
Message-ID: <CAC4WM+xhyTLcRMvrW-=Zmu0+=5dFpoZn7-oye7qcVPuk_2GvaQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] netlink: specs: fix duplicate if/then keys in
 netlink-raw schema
To: Donald Hunter <donald.hunter@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sep 2026 09:35:07 +0100, Donald Hunter wrote:
> Good catch. We have a lint check on the specs but not the schemas. Maybe
> need to add that.

Agreed, there definitely is a gap there, as tools/net/ynl/Makefile is
only pulling in yaml from the specs dir:

  SPECDIR=../../../Documentation/netlink/specs
  lint:
      yamllint $(SPECDIR)

The default profile is rather noisy on the schemas, with both errors
and warnings, mostly brackets, line-length and truthy. With this patch
applied:

  $ yamllint -f parsable Documentation/netlink/*.yaml | wc -l
  460
  $ yamllint -f parsable Documentation/netlink/*.yaml | grep -c '\[error\]'
  386

So it'd be worth having a .yamllint config scoped just for the schemas
so we're not chasing a bunch of smaller things, while still checking
for any structure breaking ones (such as the one addressed in this
patch). I'd be happy to put this together as a follow-up if that
sounds useful.
