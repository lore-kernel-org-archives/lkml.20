Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFAD3C0A19
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519720; cv=pass; b=r5JFbqIHVAT8tbj35GsafCwEqiNZ2ANoHSJX/jr0clMdQcTvRWK7A3/FS0UTI63ThV5rn5IC5nsK91GWq7o6fYdQAvVLoOOSK8DbKQX/flRexYp4p7/dgFEg5UStTotIMuBUyXPUDB85JQyyFqo52otVqVwmOs1JMk20nuoumtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519720; c=relaxed/simple;
	bh=KksOwD7HwKS3/NAYqVR6zgpCVnpxMzxNcyIW2nmFQfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwT+rdZ68QBgF3SVy4nGzjZNZjtHfbGIBm+l8Sdpvu+8Id9rqh0xKOO7LfhuN9cAMlSZiLTpkCc1LwYkOJ3fWGlpetrisV+4xWH9ix/1Zy/XwAaApk5gCXx19VnGZAWeSkZBI2kXw99hOVmL6aCytf9K4rBU6bnRGwXfna8hDd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGRIKQdM; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGRIKQdM"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bf06de21so5772162d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791519713; cv=none;
        d=google.com; s=arc-20260327;
        b=ph0ZMrp4xIuA/+tx+Rk12bMhvcy3UyiI8B5mELjJzILUa6DnfJm+PfUiwaA2cDwToE
         Ab+Sso1Z0iXW0p772GJzqE6/V3oPxnvaOPNYWVcIgEeETBlMu+zKNGUAlnYQ54fBd4ej
         OsY92Wt9QUVFUp1IGQ0kXipUTk6C5DQKiB14hIcz3KY/BTRLCiK9Mqt5HF60+p/+7+sl
         DayFPN3fpKEz8+SgwPI94mIA1LWvF7hqmGe9Oqd2NDa+FrsuT+Yzvqi4XrqSQZFhGmMK
         UuFL9aPtPtid7RrHqBFYMjyc3NRrM/Sh54WxeQvFetAkQa1fjTeFabzHOvn0E1cib2eg
         Tauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BywDXOPv2ssWSV12Fq4ovlFzbKenjlyEsA0nv8jqMGk=;
        fh=dMyTC5VDqwrBu0yLRSjuncH43hoqUXf/oTzRzh+GoV0=;
        b=pKkMqtMf9ljc7fcrWnrl95y2cP1nnHgTQga3AkqAypFagVVwx8RPnWF5cP5nn0XSpa
         Q4JAZFu1Un4Gc5Kx8NX5plnraq8FrLbrimOGqS8wDnLnJ8+HDFO7IdwALhddEzS0SX7c
         8144BLq/tQAHY9184+zCyrFbh6ZIZxvHvxku/f4b30KS4hFNdCG71Pb1iUGbHNYljK0+
         +9/X5jH6u1CWbwVDjJr3TWVcI1eMb+IwI9zLc7JgR/q0RkSgc95YjFCfrE8NKxW1picM
         cWzjsUbVKUiDRpzZOUhKV+/EgpK6feREPQo2+g1cSJwgiNRSKCYgkhGYkhMq4w6aeTGn
         qphQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791519713; x=1792124513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BywDXOPv2ssWSV12Fq4ovlFzbKenjlyEsA0nv8jqMGk=;
        b=LGRIKQdMOyRfP5MI2k1Pl9R7jtSKZQpTPwF2BfbL6r2nPFOYmMEiweUV6u26XCg6Zn
         zOTSy5fmnSztFl3U4nhuOK8HnatFHxhp9Qpexm+qUpX3nz4WHmBhE+UEpbCqtQ9i6YRk
         8tnXvVbR5XJHnpkYvavyZoepA5VwsCv1EQf+E1wuOWiU8fCyQ8Xv0x8Ls4DShehj2XJT
         HQ17S1IWtTnjgbYvF7DQasqz64Ro24F6UQbiQM+YxS5czAHgTZ2GrUA7k9ZS5r+BFIjx
         wIch4cTPt/Gqi1zyHhx1bH6QVdBQuV1aGd/AXMSpHwdPf1jI4edhs2sQWxy1QzgGyUHu
         gnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519713; x=1792124513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BywDXOPv2ssWSV12Fq4ovlFzbKenjlyEsA0nv8jqMGk=;
        b=13Jm6GovDWtDIr+ocHe3w6yCikiQNGxeXIj2tN5SJGAu1Xim3XVDzrkW82Qg6pmtXi
         XIzezNtsObl50WcVI+drIgyGoOMmykiil3LoMdBZ1R61Tg3LmZ2IpoO0bW0Tafn6BsJD
         x3b79MbMx4HKOM3nZeBiDKdhvGCxqct8JWcLlESE9ebwFtnk+RSklOfzyCCOM9MimFqi
         kSHWoRbzWt+ZtfQDkLu0QGV8BrxT7zWIhi6ktHDJtUPnR1g2tKtme2EQHrAq2iVLG2lG
         tEnbC7ZHrn7MS5JQwZ1icWyKAlfFobOcqL8nJOC9hGYman4O7AxVxZgjeU8YCDFkOJbZ
         L/yA==
X-Forwarded-Encrypted: i=1; AKwUvBxGomDilHChLAqZGo7bba4/oTa6kM3DeXPiC/ozsFNRkjydv3Pfxy9WZRNKq7x9MfUrHi7NfE2jpbmSFwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYCdHyYcZppxqfs7aYnUObEyBC/4bbR1A0oMX5WMMkdIUsnuXS
	8UgxI08OWwoagBUfkEZ8Dmgg1ouPTkrzIq0dM2G78+N4zXJ5Nkg0OvYUV4G35MBX4lIiAaRN/Ru
	VPGmK6B11iAogsl+pHgoH9E9EDLI1JwM=
X-Gm-Gg: AYBFou0Y1NSKCcBhjs3DGhDjNQ5bagdkxHISCUgoL5MFEFk47WFGSLF1LB3PeQ29dxL
	KifFefc5Dv+v6YaWc6qa1BVtWpENp/8vG9YOpckFALt49Ea9mU6yZmuhh24NNZQsgdmzTCo8BAr
	3WEzgLAZ6XaMgRMJB99Ur5OVIIXINPF51NDwh0iS70CgSd06vSlmpcBqWm6wKz/akD/v7U5g6kQ
	HS8X/Jje8lX3mWOvd54N5qsKeE3oI6UNHF1YvqvhRt7srXRY9ebik6xMA+XrYTmEyHIKUeNWnJU
	LZN//HU5RwBDa9cetclz8HmVB3LNa1OwQ0XsUzefSg02Qr3rWjU1eZd7QA==
X-Received: by 2002:a05:690e:4509:20b0:675:3142:bfb9 with SMTP id
 956f58d0204a3-679362a00abmr161562d50.109.1791519713466; Thu, 08 Oct 2026
 21:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
 <20261001-pvr-fixes-a-v2-2-f58254e5dfb8@gmail.com> <64b915fe3c794567a04c955fa89184204e3b9552.camel@imgtec.com>
 <CAKbEznvDanJtt8yEL2UmTeLpA1SZOT693E6AD1Xau+mU4Mztuw@mail.gmail.com> <67ab8185350907d6fc6ff15ffcef4012902e0d96.camel@imgtec.com>
In-Reply-To: <67ab8185350907d6fc6ff15ffcef4012902e0d96.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Fri, 9 Oct 2026 13:21:42 +0900
X-Gm-Features: AclHuK8MEV-5zdcFNHIWE-2Un_-sTcc-b7az1tB-8pxj_ak2vbxL8zBUg9oyHpk
Message-ID: <CAKbEznusAuyr5wGKDw8f7rm_CtKJN_19fLK9LHNRVUvSbzjvTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/imagination: Size page table preallocation by
 device address
To: Alessio Belle <Alessio.Belle@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"mripard@kernel.org" <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alessio,

> > I'll address the rest in v3 as well.
>
> Sorry for not waiting your v3, I wanted to be certain of having these bugs (OOM
> panic in particular) fixed in the next release candidate or release, so I went
> ahead and applied these patches to drm-misc-fixes. I've only updated the commit
> message for this one and left the comment update for another time. Many thanks
> for your patches.
>

Okay, thanks for applying them!

-- 
Thanks,
Gyeyoung
