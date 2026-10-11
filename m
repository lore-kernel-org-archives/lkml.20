Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1FE3BBFBF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710601; cv=pass; b=A7B4HMNWnVEJJed4DkrJaQKax8frZIim4q6cB0/0PO+pi9Vi01kDTwr3r6RWRt4KhQ2jVD5QOhkyaqqBpqa2Zc+zxUe5z05nCdrBIr11E8Ndaj9zpQ/P/+ZDLhdEP4aaP0JP+DviplcWJeegRPQSBA8BkRUbcW2akWLgCqO7RKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710601; c=relaxed/simple;
	bh=cYQ50HopHsteNMAqeFteBt+xPXAUZSKtz95dPIh3ijs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpZW/TjObygAUWp8Lzj1q4mt3QzI8AabMH3CaoVI5Lhld46Mu1FM4ZTQPhkN/fqZQx7fdi2/A8WyzM/VQ2C1WjFTy8u6yMlLelDMVIQRGHQ2I2PkAoe+0mHH2Pi3E+mKezjKkFr+rTv3DtchM+wT8zSLEpdq10CEUW+sIlVk/jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltV//FNV; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltV//FNV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1012770a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791710598; cv=none;
        d=google.com; s=arc-20260327;
        b=hHHnLAhXx3ltEGKTZw2poqDuJZ3irdkfc6XQjAd53haexEpyN7eWP2Xwqm1ZjmTZy6
         KNKTOa4nEfaR2P6USLUG0TXL+ujXMTSaDDhhb9eU64aOD57Or5PiQ3QmvQTNb7Sv4wHy
         dxReU/5jH7uqnO0EPOTHy+6NDuCIUMYnI6bYkP532Tcw1Roq0ti2Q1v2PTsBKNTQL7qm
         DLTxpsHeqU+xus5vOgpaEQFmPbevqIkUHh1lgVj3YfWzvnyotjTb/Kb7e/SawtGs5di7
         uujquCXA1gi8KeQxIkiDb6nR1tWJkn7MK8BzQTk3e5Tlw+WFn7VSeqnkZDG4xKDhYuUW
         ZbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cYQ50HopHsteNMAqeFteBt+xPXAUZSKtz95dPIh3ijs=;
        fh=RQoktwKbWDGtPIfmoFzD3h6cCRYngLRfi5T2toaH9tE=;
        b=k1T+Om/CXMYKOpTw+PKvx5meymiBcjeojSNwGlRgmjR8PI+O+UbCk8ow/5tBy9W9CX
         sOsAycpy70TeerUBQ4hipfU41ya4Pxr7ht6L7t8Wdh4U2eoWDRX6+7YtOLSpaC1uf0E1
         P/vxzxppg6HWQQUGfbINgUtj5jQ6crxeSRbrVLHt3C2hXDPMsSJRKDCa59H4N/ml6GMl
         GzX5cPgsChtIcMsUD/Knjc1TlAvmr7nUtRIG52esqT1v7IIeeid3R43Fae9a1m3gHjpD
         QQcv5mK0UT9Gkb75hOWOS0fmwkMjLm0u53rWjrBLr3rIGBrU5JNXokiHSSHhIqphHZp/
         h5wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710598; x=1792315398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cYQ50HopHsteNMAqeFteBt+xPXAUZSKtz95dPIh3ijs=;
        b=ltV//FNVQyU1cNv6MqdqMeMJ9+iHF2ot/EgetJ1PhYvP3botgAca8w8AQGSvvuGom7
         +Etq2j8IjAziLTNmgif8Kf2rckT3ISb3NmyyvyAMVmPydwPkZTc0WgzDWaBpnUI/OTW5
         7X/g1ES9YyXdCJxTJWw7sCFlmAHc88nE6txkyOqRzgM1E27N+PUpzjkt21jE/5vwBP/l
         TeFrGLICWnghHvwxUc8CJyONXMpSz4OQ2szrXBucOQKi9IvTjqek0g5OVIOyTuhuHMGJ
         Cd7CfWCd/W00crPJMXCyROzKsm5n2WjAPbRXeh1jHiEvSzD4RodxK3Sf5Ff5Z7Rn14GD
         0M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710598; x=1792315398;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cYQ50HopHsteNMAqeFteBt+xPXAUZSKtz95dPIh3ijs=;
        b=sl0V9rxQGTGTojgjF3ZPHVanhnlhSMc3b99Oc6T435fSWnSsWt4oGRvzTPrp0nx2+l
         bF/tHfUTyaercD2hfVXKeUjNFIVnj9HjhZT8rpNPDHa/SP5hCVfsFezIq5QfWlzE93fS
         SbvgLBk6DFQ+6NhwOcUk+13ZOVjxBcVp1eBCIYsohA2XvrZHzlgy0nrE4XacFznwcy5P
         K/103QNiG744xCjG/QpWi4VcCQtBOJeLj8w+kIAo9x0MXVfNk/GOCV7eVdSsuCUB0Ac9
         futvpqe2EKNUQh6RIxKFuzmZ3GyJGqaU9NqMf15xNFxYEbUXrge02dCJ10vY6Yls81Gh
         7vsA==
X-Forwarded-Encrypted: i=1; AKwUvBy5W6cCroh0RmMgr/lw9WKkYoG6VZNGwgBx3L1VnzNxtd07xxuuZIVqorfVlrWqm4A5B15wCLXBNa02pgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/oeQRcZ2+WwaAVIVbljvTDQklB9CLi5AJQCEMSdMDlKNr+GS/
	zyX+qpekp/UQQF/SrmtcLk+9AIgLVURHZD2j20+4xqtnr1pUVyGG13i9UHEHTMNaaSCYpZiR1oU
	V5o+yHHE4XDsdTTcxQVJIP4LulvPdIC0=
X-Gm-Gg: AYBFou0OfRnqlcI2ClriA3JgtGmWRarW9SNAxke8e3kUvfK/IuC5uU3luV8nUS7o25m
	iZzgIcHHka+kKKIat6MJC+PFweyYMQonWI2FcnZv9oh3nxuwTtX2DCra8blrUOu7CvEIVus4y3w
	vwxABFq0rfPwcxShScM2YJGpBGBBHhiNemkrxjkWcFV0nuBZ8QOCG6G6WooPph4zoFFKrPikGjs
	MXTFhgP28cHHvALuyBGAKlmFSWRQVco11vQ952SwtT5vCdVGTJQ2HnJXXaU7QqbssZEepTJH+7m
	YRvnk4QV1+E+WM7b9mBiTdxOc68K7KqleCKbkvGngGRXEL6vqgG2604qzQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:21cc:b0:6aa:e589:87d7 with SMTP id
 4fb4d7f45d1cf-6b17c1decf7mr5274283a12.6.1791710597818; Sun, 11 Oct 2026
 02:23:17 -0700 (PDT)
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Oct 2026 09:23:17 +0000
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Oct 2026 09:23:17 +0000
In-Reply-To: <CAFLp9PGgfLJtqeSaTqrG0jcFAu4stP0og4Txy=ewCw0ZxFdCMQ@mail.gmail.com>
References: <20260725182628.221603-1-nsd.project.dev@gmail.com>
 <CAFLp9PEQQVuDpJPwrNvLN1-u3w3TMwZPUUrf0+rOBrvDjBBf1A@mail.gmail.com>
 <anlByPDZmvEhWeXI@casper.infradead.org> <ffcij36vnozf3rginqd2opd2dwqyki7xhtdo4veuty734hhgba@utjav2k263o6>
 <nsd.1787001235.35928@mail.gmail.com> <w7vte4itudtkw2yf4vbmuofiumfffmp2y52dpu2bqvqtdgjvpd@5femyiozss3e>
 <CAFLp9PGkVYZcQT5qAx-RKFOF-urZ92m417zpAeF7ZQempbS1HQ@mail.gmail.com>
 <arEkgM15qewERAOJ@pedro-suse.tail5790ac.ts.net> <CAFLp9PGgfLJtqeSaTqrG0jcFAu4stP0og4Txy=ewCw0ZxFdCMQ@mail.gmail.com>
From: =?UTF-8?B?YXloYW4gYXlkxLFu?= <nsd.project.dev@gmail.com>
Date: Sun, 11 Oct 2026 09:23:17 +0000
X-Gm-Features: AclHuK-By11gbr9MaNoXIL2Mt8RpYeOZM3ccWee1GrqxzZ8ofTrOrPUSY7ZUhu8
Message-ID: <CAFLp9PE8hUCa7ia0tuewytGUacGL5azUeUSSf69a0PwhbmOW+g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Neural Storage Driver - learning page cache prefetcher
To: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Honza, Willy,

Just checking if the Sep 20 note got buried. No new numbers
from my side, same tree.

The two things I am unsure about:

1. Is the capped shape OK - ra_pages bounded, overhangs
trimmed/dropped and counted, only measured willneed up to
io_pages and that off by default (Mod A strict)?

2. Do you want the small ra_state bit (2 slots + stride,
read path only, all windows bounded) posted separately
for direction before I test it further?

Thanks,
Ayhan
Assisted-by: LLM (English draft help)
