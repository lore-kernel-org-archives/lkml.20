Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182E361977
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013139; cv=pass; b=cFzWLz2U07pL7B1PTTEEbftr6kgEFllOL30ijcAQnUnnrmEYGB9E9k3K06b4ZgmguqIYW2Up6YdUrPGRuxq7soYnrsALeBhxIVvxV2qNgejR4e4Xj33lg2GTayF3ZfBsBBniOFroyBKLxDbo3aF0CQqcKIpGnyIrGOpJgVSyOak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013139; c=relaxed/simple;
	bh=cIB6oLLxIpfMMXfc6SPhaw9BgxUvuAuXYXicau/x3EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MM1zfS5jtpyNtpkY1GEEOEHlzezCzaXb9fQNk1suVDpRMktJVngjLkRFCO96JhbcgW/PADLEwJiE7DXM1a3yWEEZlYe5Q1eLlKCfjyzoxCMgT7rCyatrCbLA7+LcW23Si+1dltSGgBmvX9fd937P7+qgwHqbBWhaivAT+Yclqgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSIvP0YF; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSIvP0YF"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a58f2ce443so8348141fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789013136; cv=none;
        d=google.com; s=arc-20260327;
        b=Wj7fk9HQOw2ODUJUOqU9hZvp3s5ooYYxBLdpBuygJpndwrXQD/EO9hxdR7u6S209Ly
         0N3VQVfgZTokD67UyfGrBeX5+Z91kSFhPcj+9CwlR+EbHSX64qqxn+ceJPWR9DiESHC1
         wsckx786K67qkfXq6/v3w1sx1LbjmKdSbqMfvWBONzPUsi37KAEn2GC1nMkPYyJnHcpZ
         MdjUv6P6pvnnjeb068lEgcWSpoUJbBEzoafQ1mTi82lXNPkNJ8+F4l6NXBCLaQeh2t4o
         r2LmSHK3tcY+DTQBWDLp6v1Rr6QDP+370VAbpKTTjqUF5Irv4skeK8OWjKbJskCUHsbL
         LNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        fh=WTxd7AbsXE0VqsU+thwipcQoDayA5EA8wUoGLifD/hs=;
        b=faXp8lophBaPqkmoC5ZZ0ZfWsoVXETdi7H+TyyHNi4Wm2MdecJvR9E/BBbDp7RNIHu
         3SYoL0hcUjDw1RBSf8Nnqefg8SGmbmY18QUZnTTpacR1WBIptCIWDxRKLgYEDyJscLY5
         4wYHZpujC6z9l2CgKB7NvDgwSVb2vxD8vlvw/+S3SYktK3xAUz2NwMRmZAUufpNo/xjw
         wDjaDkzG0g6fXdCN9eesewbsxqJYeY4l70YxRr6vKOv1tDdTZx0E+GdSApzFv1qIMxPz
         gIV0RvTz/syyOUNTMTsOR7IQ+kDb4XF3zzjnlts8IXAVkS+h3JU+alMhDZ9f9Mlnm1HF
         9gFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013136; x=1789617936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        b=XSIvP0YFENBnGXk/ya+4tmRlWSVGZd5JzXbwsFu2XXK8pvRxrrBYjlzKgsYF1Qr+2Q
         sla61vAw6ugcyj7iNPJ+g0rzbTeQX8KoqeFeyWXuC5KSxhuqX2XZOBOeyOmUGfPOuP6l
         HYiV2dq+UZZ8mKc8x2jVD0fkwW/ZtjiO2tZqZfMzGrdsdqJpSsMmaFlfhsqcEN5FWqMB
         mGF8FIvxGCzRhFtZh83gitciEnGm7mjOtz05kies4KsTAIKoR+9cN1UGPxx7f41Pt/r/
         EVKmd0Y3zlLahR0Eo7CKyAsdFeOCvgPEPVkN4qL09Q9BgDUbRj3kYLFOaTvCaYS+BtDb
         yfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013136; x=1789617936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        b=CTSgXeKkyH4LxwFPW09JMKpxhtI6OMlXGmw4ckWPmH4YfOYr6aaZ5eIQ9qP0hNX7/M
         bGSN8AnSHdXRM16APKlxPkCk6Xa6xxkj0Go6Qxfqh8E1GvewEHiM0LfY6CIsVCnjsgg1
         8EtqOd9usvB70WvSWy3JRq/ialkhahfWnleL1gGSygh3XWttKSXFKhepSo8wwTytNwkY
         51qM6PBQX6s+jD6F92T67V8ezquLZUk9RhlxZd1TKO2o++y2Up6UlQAnbU+g9SaVxFx3
         ydIlkKk4B1YTdX7obbugTkhHPxddtbfVHO3ayTNVjKoAkUSWW/2vbxmmxoLw6zPtkYx1
         c02Q==
X-Forwarded-Encrypted: i=1; AKwUvByy0CbBR6vwho70YpiqOxrijI7hQcIK2Cgd8+vUAKypY6j/OLAKFukjT6ZTfBOdROwK4WSQMEusM0wufLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kWRfqCw0X9MXdryAiqlNyprVlCqhoMVEbZse8qg0yyABmIwFY/
	LsDT6c5xepkSunmXsDL9A1uVrQKCweZRnD7YlsApsVF4Rlj1y44MgAYAHZKpWQYnuOJwpxs4fwz
	VeLR1ens1hD4hfxFVB0qWDMGaLKXoE2E=
X-Gm-Gg: AYBFou354gqU2sc8bRfKFBGrDGEVgZvlIoqIzUHIDrGaRM9AMhFOOXjRJ78FW/+e7Fc
	pAaV37vLUzZ8wLV9vV3TpicA3WnnrQtZD4SQNBCYpKyxvQTkJT7Z111VPUbB34UcTo6VFcq/Pvk
	J3QT6J8pMM3Bh+v2TeIwz5PXvRULT0toLLzbv0bo3mIcdkfu1rYDJn/QBtAZnvucZb/PME/OBT5
	Ay6xKwvVKZZSJwKdAlftCUoTZCN0G5+SZN5PUXrVoh49ilTZVWjvgRxEWG/IITmIJ8kr6MCpiKK
	zzonmkTR+B5k/UycM7PcI6FwErAXjxTUk+uqYp8Mh1RIZzt9t3TPqk1X2C/mtEm2o+RecUkfiA5
	PFcOWE8BkhATW3pRiUvoYK8fHqV6bIq6xOsAQLCY7cw==
X-Received: by 2002:a05:651c:2213:b0:3a3:749e:319e with SMTP id
 38308e7fff4ca-3a3749e3381mr39434621fa.18.1789013135821; Wed, 09 Sep 2026
 21:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-4-sigefriedhyy@gmail.com> <178901169484.219967.3624591832079760064@kernel.org>
In-Reply-To: <178901169484.219967.3624591832079760064@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 13:05:24 +0900
X-Gm-Features: AcwNN1Wyvr5GEUMi694_30SRPcVjVb5vZp8y74DSCcC_5qtyY0PjOtWZgmHeQ78
Message-ID: <CA+7S2v+7tGH2vRnN5g_oWLwGs=0JfFCX558+CgGOGAhWM6VxwQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, 
	horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>- [Low] dump_mcaddr_l2_check() in
>  tools/testing/selftests/net/rtnetlink.py dereferences dictionary keys=E2=
=80=A6

Same issue reported in v3 thread, already answered there.
