Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161538;
	b=2DsXUOkGy+4nWZvp44tkGOxRJEXki8RmoK6Xzt5i+T2qpt47Uuyng8QFXFMiaG7eEjGy
	 GILIGozKlNmDiaUUR7l1wfwDjHnzgFuzcQU1OEFk81Ak7bdZoOhDeXtW014iwlp2vvon6
	 A63dSqFM4rHvsn0+knOmOwvkNfRA2sPVO4ylWPwnm9L0jQw8KFhcyiYn9P3Ur0BVscxGl
	 QJEX4gxq1Y+CtxCg2AMUrDmy+9KQpdcoO7XsZSsFnADktyjZWdA0SG2vX+rEVeFW/agYz
	 Jn/K9coZ8W632rXFLZDQ9P2OMTjXJ5U0ufNjirvcpbycHEd0dS1wH6pccWyUrXokNHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
	b=nCUHVe9UImdKTJEdo96TFJAWJMGwMSv9Tzhjtwg7lHC+yxdtgrf7/yav8xqCRthsrAIf
	 D1Jh+SdHgiiFPmuA513FKrfAsEEjjaYw+VBDpxZNz3q9DuUBm+wU2eF3WpgM4/UjnXlT6
	 D1Oqx1lNESNR3hjg9sVdakYyAoLRg5Ia0ez8INov7kmwlBksq1iXH6xJWC3z9b2Xse6KT
	 +EUPlI3WjxuPAikPIuOoYNXeF9TOaxlejxm7Z1+O17Qsrww9fZH/OuzhFM1SiKLoTNzkK
	 fpOQORR+esSwSykEn1CDcBr39/vzahfp/G3QBAlFomHQVJznyVC3Ieub0kL1ZOydTfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3KV6yZu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D13606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3KV6yZu
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ddef424972so158701eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161537; cv=none;
        d=google.com; s=arc-20260327;
        b=Sgw2etTBCPHW33rNNTUNMNqDdQfmWnjXDk1stUe6XfgDlshRH72d7rYpdt9ZgWADeL
         OHWECrgsoAsMxf4ljGrYffTvD1Ct+Tg3CU7T2dCWgvWbjEd5qE3vKe+6VgKsZgpluodM
         dQsaZJTr+YftE4ER31NjilKg3qhhWc5rVgWm8VY1G3s8tk5cBL9/24cfy4bhSCyWjezY
         u4Ipk9TEKgVbuCZUjgp4V7Lv8S0IzryhUXP2SEV5tyuSy8DmHarMqhslnITWdY996yD7
         HFjfb/XjWv3cNPsp8nDRHF75Awtwiw4Xag0LJe61VV20R3dgx9FMk9Bhi0yZsqcP/ZHt
         Zhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        fh=JIagDkYPmo3YjnXbhg8mav2/L5R59R5H10x8rPOvJfY=;
        b=XZsVj8EA5+QKoYg2ehg4L3WuNs6sORjCVeHGOJtswzFgoK2exqhmfus5nt+L9kYgaX
         UTfxcywsjGo8tMU1K9TND+ssHuY7w6MUjMOTCiDHqkJkwEI6P4/zY+7OCSkxcStHpCS8
         ENxiDCDFopyPWCZtLAuLUBRU6GsOJZzS4lCD2rsESi2+xUzwhSMR/7D5Ah7eAezaY5eE
         IoNDya5mg3VTGZwotKZ2RcAvI9t/Paaffmr7hf/zKxIxlIxlq5VVFvIWPbyTsV89LfOL
         Ea0Cy54LzqnvJOkczWwW1DF0H/cbqQkwdURrIYI1NQJ4zUyqnoafkvhXMJ3AjuCfC2WX
         RGEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161537; x=1794766337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        b=U3KV6yZuvrfhplGszqQWOjzBAQln51W1zwD09sz38Ti7j90ly73KGAy8soO0Ua1PvN
         ucL2DFySM+uyRnuxLsB2r0GzIum825XpUhfeOS/jSa0qvJJbc3CUmZGgkontj3IJhvA0
         HJC4NSAd5MyCvDIUOnfhygA9XyGLd+fd4GgylK9Vr0z6PUkJmI6+CjojJ3Iz8sWC25tY
         dkKFHMONmdAP39BmsOH5P4o7vvMDJCWPIL7k3EMOkJNvGdbBZbHc2eAt9nGc94DOv+7r
         iUuH8Uh/jFpIcY5PtdMS22krb+RfM0xLckEvdKjEwjQZKzhklyGxlPL6lqqdSCA6hck2
         VfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161537; x=1794766337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        b=IaXtr4VV3w8WfgrpT0vXLsEFh1lXb62X/78ms6+/16FV7M6swc/qJvRbr9U+1z8+uY
         kljnvzReeREbqIdmfXLZIq8iRYXosjnj3fIf7528ubnDIGecxczGsjKtnatkYv4ucOdr
         c1XGoKG/Yjzt+HpG41ELUUACEfgocRWS0j8LjBq2kaUwY7P8I6NxIxLF16q0C6dpZpIX
         phpGg7hg9/Obg6+1t5GqKLKopezao4bxWl+4e5Y7tQLZW6BVYyXZ1Yr+REMHFF1vy9WG
         /98O+f3mkBSVyz94g7J0ZsJe5bQ7WGX26UaUcQu44vtEfriySD69bRzDK5eurjpmMXn3
         NI5g==
X-Forwarded-Encrypted: i=1; AL+hErEGxOfQvjPXhTjttcXfY0ttiipD+JcgIZvO5D+wJupCsAxOnr2CObb2ipRrG3t49+R7DRIM57rDMpJ4tnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KhYdOX+NBRLXeoJNFBvT7nzctX/o7e75b/uzrTkmo3rrkI4OC
	WtdNHAvlX1a1CkDOBFQFUldXRM4OELaZLCiQFtz3zZwx03qC3XvLr+/vNHz193eLFLBJ8UOQwuq
	GtG3KGuLr0vxUk3nQvm7LVvQAav4R2eE=
X-Gm-Gg: AYBFou1zmRrGcY6wJuNLeQwHAFMWYtYhyh3hwJza7HDloDwdYbsaCxdlRdXZQyPC8O6
	YmJ914NnMzR2+KIWvQj/+kQ2wRQsSpqtUtTgYZ5VdFQqRPTzgNZFGQqOmvSRi/BtxKyDGFBYSZA
	B76nWRkHet6S7l60QY22NejOE2LlCeAIRSLhilcVPXHJhpI+bEbX7tBoieZeT/ELP00UvLK4ca9
	/ppWWJfmdHAxFHXKaq72eCbbIdbU0t4wGKijs+M9C3fE5Lg1FwdqKRTL0d+gJ8Z338iGfrbGiYw
	vbZHpEiJEOfXG3/MBI8hyKdyipPgao2BnBbehQK4mzPSsawaoXb3PTAZYf4yx3OokaxpH2fZEL8
	mwf6aZdvyvVWLVUkgd4ZelHp6bTKEC6PknzUVYcZIDKVq3ilx/682IteEv9aZ3awAaHti
X-Received: by 2002:a05:6820:619:b0:717:866:abef with SMTP id
 006d021491bc7-7170f278d4bmr1136117eaf.34.1794161536841; Sun, 08 Nov 2026
 10:12:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-2-hjf3108@gmail.com>
 <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
In-Reply-To: <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:11:39 +0700
X-Gm-Features: AclHuK_9BKwFyW47YiDHeQyFozoiiX3cmNycuz7EuLCuXtAhC-TUMK7iBw7jXso
Message-ID: <CABOQOSWgd5hyvZj4tcSwYHD2_n3Su1hBGkBRo3AYvvRmPijeYw@mail.gmail.com>
Subject: Re: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 11:08, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Only start BA sessions for frames that carry data.
>
> I can't understand why building a BA session for null frames cause lower
> throughput? Please explain why.
I included the throughput numbers as a regression test, to show that it does not
cause any speed regressions. It should not affect throughput.

> >
> > Test results (2.4 GHz):
> >    before after
> > TX 7.0    6.1
> > RX 28.3   29.1
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>
>
