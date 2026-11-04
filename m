Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810441;
	b=KR9+m0jAi7IOlW72yd9r/SxxEX5K/eNtB556PRdvJwEtdc8jdlce5fLVAZrS3yaA8c5O
	 JTiBrjAUEY4sNE2kiJV51vk8DSWKS98WoRkK4K00VsjcAUg6EJ4D1LoHclOMJVPhmj5Wl
	 rdfRSbQoGsM29VnOJZ+xObh6g46h5mI11Pn7jmc38dpqJK2ZTk/yHmc+RsW4YBFfmM5wZ
	 LCe9WneMO5eFnITnp5LCxppnEiwG1UK6DNHxyMMaohFkgOR0wzA4l7ngX/Mn7qsqHc6Bj
	 ta8d4xMKrUl2wANZNoAIOWSuAKW/ftnF5pA5lnICjNIfYTm3CqN9A4SEHCE/Xve+8xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GSbCnlnfPQbg6fvgnw5ikKngjsmXzoffUrEdFG3lAfU=;
	b=3Ao523rvXN7492cPRtRTAiiSKAnYyq84fnSXTw0qA63BNOvzzlaJGFJBnm0vmRzbbDCv
	 mYKiwfcbAg70g+eBlj/Yn6emGjfX0o2bCm/Hw4PoCslgtrlS1b38bzD2EXZ2o/CWfijWp
	 XBZUFY4jUiETWxH5F+OzQbA4qcfF72mmpibvpU/otTlm40Nn3IzC9CzL1T3sSMJi+0Gf3
	 YX0KAlEw9pHbV0ocXu5/sM9wGEnv6hBLlrXhB2iDcpSDsdnm5wafMShhw0c4qyTpMk7VO
	 zXOpMdxEdoENg9Q3n5SEwlfC6L9D0VVNMPtlkAlGOZDCq7QXP9SBBABbtpEWi3osghw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGpvmNpr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B04606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B04606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGpvmNpr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1217107f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810440; cv=none;
        d=google.com; s=arc-20260327;
        b=CeD9uIHIV6B0hfuM/PEX4UfY5fTe6OUXxCOuDkhGASDQorccbWeq9citwncFS/q81V
         tkIAVyRffePQnB48VQ14u0SU2of3ByK4ct+xPNFW0fuhS3t9ZK0PfSQ9MAfee+1JXDAE
         nlltAx09HUsLiZfYQANlB6asrIYwG1kZ3E12MX1KRW7rDM/yPcVBbw4ksUt+bbnujfmZ
         zKBwTUS+Hs2m7/WcRPgHweBvBaPUpJS8O1ptXfAoCzE1olln0MjQu9f6KPYBEVRUS9BG
         gW70Ae3WHMoP4Wa9NByiYx/34fg8ccAz9tgtYi2rj7n8rg8Usb6YJOcP7t1MGFKhkuG7
         cb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GSbCnlnfPQbg6fvgnw5ikKngjsmXzoffUrEdFG3lAfU=;
        fh=LWtgtQw8lUDQTkRGeHWF8CO5ZYpW+Pe5mg1X72jxKJI=;
        b=ZzXERfcdndydBVgWaZXprj6H+4qnhMIIf5cM0/vb/h4Ob6AiR7XZWivfNmkF7JjIVm
         6qc5jwhlE1IUHlLkfl4rucv7UJeEPMRqUOa/4LPJ6hiSzGtnUyy6vKJNVWgUa02opaAi
         IQu//11Xw9XGqPfU2A7NiK5piRzS/65cGIwSTI9taWK/SW51l1vsmr2V2jv/auQzqAeu
         kCiI+HF9DL9KzB3XGyJL0xbZVVJCexEnn0u51eQZrC9/fbGkMKI2WYTpcNxnfuMeABjP
         QR3Pz2wP56nPw6/wMIQ4pgSAX8Y77AhTVKownt7XONQRgWjDD4SbY1U3+DlGv4Ju3PRy
         hBnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810440; x=1794415240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSbCnlnfPQbg6fvgnw5ikKngjsmXzoffUrEdFG3lAfU=;
        b=xGpvmNprFX4lFUjvhFUKE2jk3fQY4X8FmpUBDtzN6TWnR6XSF8CFIXGpLyZda+FsHi
         R6Jbk/Ydj2V7/70CPLV5j5dTmFtHDPu3GnebxZDj4QmeWBvtQwM+aJKadX91LxmrAqia
         8f/Ha4CbC/HhglwddWwYTim4JQIZpYhdeBVXM/NaBSkRyfMuKkNptncXUDLLQjoQ4CBD
         p1i8I6CeCbRbNyp9exexZP1kU2yye16s+yw2Tyoi8gi9n0ai6LRnCAfvek8145Kjug8e
         Z353bbzTWSV/xIEdGOOvN5vGDj7RKm/99sN6fuRlTfk4vqpfgxijugV5PHgu6hijF3sY
         zoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810440; x=1794415240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSbCnlnfPQbg6fvgnw5ikKngjsmXzoffUrEdFG3lAfU=;
        b=TZlxiaH5hZt279sWgJsadI2duzhdROQGgDT3XbX9TSUmpMJBYBKtpPj14GUSlQvJjx
         XJLUQ2LpiLwuo295+bPblEixeqyO2Z3q8YItU3pwabL5ZDf8okfK7E8Gh+U4IH+7m6H4
         5IIMkhAx4Zkfkpvm8qUTKl5I3/7aP6RMY/lW1jQVEyN6yiEltovMyD2lREui0lEEiMfQ
         CaKu6rgK/PDNTCeU4QKiZchspGw90wfEHbn9fagjnLUF1qwb5YTEC2tkAna6sczI/cB8
         ePUXRDvvTa+ItURBDsBePR8r6jh2W9LdlK4XRU0kt+UNHm0/sLC/GiBlGyH4/fl+VJMo
         29Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxS/T29zncQl8tkcdQ813tHhkTxgyZA38tfag8wVJ/jf4XYJQuK4UCKSYpbafqAlwEpVvhCWSIc1NOkO4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JVOOYNdP18SCQYrw2/i0aJdgjhBiQTgqyIsvJTrG8d+sM0DmE
	xThX5I2NAqaJr8cKa7GY9jg2BmjFZEtZB68sRPeg6WYyLmwbzzFzyUzD1i3QNcfstaCQsJ0tupZ
	bnXQZZVNkGYqjhui2PlhMqcPBQ/xzRwI=
X-Gm-Gg: AYBFou3hiaDsglr6uwwDU4EJMvKWyfgqlUCoUgUD33W6Nh3kIx78L4pR7IyMTt7Pqxh
	mOf9It59zpmI1MTHUne94vGkZXopzl2s54CFmdJWYaTdProPrZKd2nwsZdrmjFSEzSb3PJdiyaf
	9XEDzmCqfvMLpuPNmUml3seLoSVCE0OGH0+In7X1pZrRRsAUKMQyf0/j12dbtVveagtycp8/G1w
	J9jnZEQxF/M9Yr9MICHdHJ4Z6HU3rPX+gLOyea7WUl4KRnTuowJT/+lYeCYBqrcZMu3HsZvGO9k
	LUBEup8q+R75vckwD9lMrXa9ZfxmX+XOn6IqOd0l/IKyCfxU44VUkWHQa8fvrEY2UmEM5m7uODW
	+w2jlo8z1pbD5QctV6f7JaxhehTrL/fm6dK10PDltdQR8g67sQZJUFk4/wm1XVm5CAlkN68wdXd
	9Xx/oG0sQXb7NmeRBdxTm4PAOMYgc1WrLrlqc/ODInhJVB4PcSPPek
X-Received: by 2002:a05:6000:1882:b0:490:5521:f24f with SMTP id
 ffacd0b85a97d-49115c97ab4mr52629f8f.3.1793810439792; Wed, 04 Nov 2026
 08:40:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com> <20261104-swap-hibernation-slots-v4-2-0ba9393609e1@tencent.com>
In-Reply-To: <20261104-swap-hibernation-slots-v4-2-0ba9393609e1@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 09:40:28 -0700
X-Gm-Features: AclHuK9j3pTBHBwintO8gANsTMYNMbLvY4P_0RrfW9iaGSWA-lhEMfxVl_a3gVs
Message-ID: <CAKEwX=OuBQg4QV34BTsgA7nhOjovHFzZPVf-o+oWzAaxQh8f-w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mm, swap: give hibernation swap slots their own
 swap table entry type
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Jianyue Wu <wujianyue000@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:25=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Youngjun Park <youngjun.park@lge.com>
>
> swap_alloc_hibernation_slot() stores a fake shadow in the slot it hands
> out.  An anon slot swapped out with no workingset shadow looks exactly th=
e
> same, so nothing in mm can tell the two apart.
>
> Give hibernation slots their own type.  Bit 4 and every bit above it are
> set, except the count field, which stays 0.  Bits 0 to 3 are taken by the
> shadow, PFN, pointer and bad marks, so bit 4 is the first free one.  The
> type holds no data, so the value alone says what it is.
>
> The entry has no swap count.  Hibernation only allocates and frees a slot=
,
> so a count would never change.  swap_free_hibernation_slot() frees the sl=
ot
> directly, there is no count to put first.
>
> The slot is no longer a shadow, so the previous patch keeps it out of the
> swap cache.  The count field stays 0 as well, so code that reads the coun=
t
> without checking the type sees an unused slot instead of one at
> SWP_TB_COUNT_MAX, and a wrong put is caught by the existing underflow
> check.
>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Link: https://lore.kernel.org/linux-mm/abp7aDgYLrxF3Me8@KASONG-MC4/
> Signed-off-by: Youngjun Park <youngjun.park@lge.com>
> Acked-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> [kasong@tencent.com: renamed the layout entry to HIB and reworded its doc=
]

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
