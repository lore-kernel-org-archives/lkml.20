Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220910;
	b=DDX63tbqicZ4KKK/PK8FmLdg/VlKgFSFyAtXCZWYGAfWTSaHth1pzT45goPffG0kx5IM
	 pRmCxPN9Xx1MEky4P4kROEK6NPx/5EcZ9G3FyUYdYDet09l3NU9OuTyDqsgZGNb5ZnDTi
	 K3h3ufYEkhIVT54zYaMce/XkjolccNvl7uRT5UT8ZqrWJ0V729czpR550NPuYDpynLhft
	 GCLAnePeF173jHcP3mr8H9ZspeGhHpgz2YGJwu/Jsf8RFgR4+kwZ9V0iPfyftwRufhdUD
	 qwJsooq0s1TTkUufQt41VIATRuzkG0Xw2+Mk7pyHG93xCQAcEb4l38eA3nR+erdo9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
	b=Q25SRN/dLa5V7cyCfr8/Mw1x7nynuYT15Ze8h6II6ua7elCjG2dkUX+tvaiLH8/DsPuC
	 uIVu0TUS6TyC1yhI+tjr6ysaO8PKo+4Y+RYh7BA0mhDcZFFyUC6ipJg/TBGXy1txMyNiU
	 tspL0r2wenGcluaXsS5+RdL29eqYoHIwC/sa19I8Qh3lSdcv3O2q0TsDXsHNoWj8TT4rF
	 Fa3RSsdnFkKCQKvf+wD37Frv0smDe9uGJjQcuUBoOEKnAT9weOjyxPR907CLprPpJPqQ2
	 RRhn6AZ9qfueMkNeZmioWEW7p5qOasvVtHhu9ZtcbuVEEwc7mhPnfUlyrcTh5TmtjLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt4JdHdW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt4JdHdW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so90876eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793220909; x=1793825709; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
        b=Dt4JdHdWU6gJbTpnpO/z6abmOYp4Bg5hSvmUPGjVCAbj+rCI1NQKHvl6RMNd4Guey9
         xX1Cl64RgX1fMYxYmVTOAYX6rhE5bKk+EJsIRDXNPA9UILM5YFLdfeM8sIowiBEXc6iX
         n6vBhYfApF3Mt6YgYlTacEV8q6m2/tJHUazKq+lDFPnC+B4UY+mvI9hgMWdTKiKWRdeC
         nad0HbumcRdveM3AuI3eqA+XzxqS6kyMDX35pe7rxzN25pLSS2FJjlfBovFuumV6EzUh
         piB9Yi0hxgX8rz24OQp326Jn0hsv9FASyFY7o0ulaIQsjvQPAdOtwrm06JEe/N8Q1x/F
         KmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220909; x=1793825709;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJGCZGrXuYKSbtbthGQ4UJ9HIhPS+IvzoBo7ywSwUhA=;
        b=oo5dclP4wnxOj0I/uNpmhVUN1VrXsAKMcUNMlLjkAm7Ecnq7NJQdQNKChI9YhWDfrz
         7Jp0tNXCzYQ797bLeYaMYOywnWf8z54Oe49a/emMHrjvjRBkJchf0ZEj6K3kk5LuKWHS
         FYwPb742ZGjWIULy5VNmcmipGq0ZGiVX7HW/u3HMd72bTphMiKKbBUUGROGDBtst5svq
         Icj8UwnEuSAs2QREuKDkxo/28M1A71F91rY1l48sJYeroE5D6kC+zKW2HkQDnLste+hq
         Ta0E5zZ0X+ip9tgTHBVv9ZrXwDGquB9ziQJ1MelNmziKjjS4lpFAYfUkEXTWX70z/irw
         lT7g==
X-Forwarded-Encrypted: i=1; AKwUvByJJRUe1vdWofI5r1qiVMUKniNsUh3S1UjcpZ1UkeHiThlOCzsZ2eQqt3H4xQ2/Qh0TfEY/AycR7h6KNQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgxqqkGhSpHOTST5ALfhFVt4GkDBgLXBu+c0YdsIQIHgnPEwr5
	jnT9yAPWc5UY/39aQWXx1ecRDnMWQU/gDa1KXMZbrNx6xMr1Gm93M9xP
X-Gm-Gg: AYBFou2JDfc/1DDnN43EMnckqiS5Kggwl5twWRKBpJG7O4n7iy+HwF0B7mXK16Lbc8m
	vTYzNsuHBwL/b/6QzinAzs3vujXey25iL/D1VNzPkdJz8Yvhn7kSzTn94F1dutO+1NnqTzn6VcZ
	pRrPUaMwv9DF6ei73EQF+DYJTY5w8lKmHEJslrWe33YSa4Gtiad30gvXZOTh1HdqJlRPCalabhL
	YL0S5CHSrp4Qgh6+C+uGTxHQQSiFYwhL5Q8um3lK+vHJ9u6XkbdSWSotHbD+yM2votWH7EkNryQ
	9dy/jbJbhGr1P7oWxJSXpGvhsQLAwB0AWfM3Nb5JvYb+/BUH7LG+YH7Qc5jA04LG/r6thuOkFPz
	qHbntehhvHwbOZO/iUKiKKA2R/wMdfD64zcwAuADk9lGF8Onr/nhoB9E85fonKWfNPOKGE/gI9z
	4kAeQBJ0KlyO4R1waDY3S8F4PgHteFO/jS9ZPDfCorOcZrHmcGb9v5GUDr9f3CLmdekdDvCu91v
	ZGkGJVjCJjceg94jdS+f9B7UsN0dPbRwxzIN4GnXZFNruKpn+Q7otFH8UrPvIgy9WNJgl/0VSGX
	zVP/jqob9mDaWd5zLoGk6hc2RsBVHvDc4yA=
X-Received: by 2002:a05:693c:820a:b0:361:8d0:6c7a with SMTP id 5a478bee46e88-36a300a4eabmr779804eec.26.1793220908456;
        Wed, 28 Oct 2026 13:55:08 -0700 (PDT)
Received: from localhost ([103.89.26.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm20679864eec.2.2026.10.28.13.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:55:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 02:55:03 +0600
Message-Id: <DMGRRA9L08L3.1IM2GZHXGLZQ1@gmail.com>
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, "Luka Gejak"
 <luka.gejak@linux.dev>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is
 full
From: "Imtiyaz Parvez" <reza1234khan1234@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, "Shagor Khan"
 <reza1234khan1234@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019165103.5990-1-dennylin0707@gmail.com>
 <9bde49a2e7794e4fb6bc3ae104eef87e@realtek.com>
 <334c6e785a5d242c6f168d57d042d63b777a242a@linux.dev>
 <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
 <CAGEkeHevidTtTNj-qfy6kE_O0wRvqT=F=sG+Hy83BOkRjCUqeA@mail.gmail.com>
 <CANQ=N_C3+gpQ3O=SXYpRCGTh_MC1y4TEfnxF90SWgUVF_wYPUA@mail.gmail.com>
 <CAGEkeHdT1-WwJnF1wTkrrRQRzrEYESOoDeAYE+fiV0gROG+6sw@mail.gmail.com>
 <CAGEkeHf0CLjxhGySt2axf8gXMrCcn=cEHbe1aXRW4FgcbxjyZQ@mail.gmail.com>
In-Reply-To: <CAGEkeHf0CLjxhGySt2axf8gXMrCcn=cEHbe1aXRW4FgcbxjyZQ@mail.gmail.com>

Hi Hungyu,

> Have you had a chance to test this patch?

Yes, sorry for the delay. I tested it on my laptop.

Hardware: RTL8822CE 802.11ac | kernel version: 7.2.11-arch1-1

I built only the rtw88 modules from the v7.2.11 source
tree with this patch applied, and loaded them.

I used it for around 2 hours with normal browsing, suspend/resume and
reconnecting. No new warnings or errors in dmesg.

Tested-by: Imtiyaz Parvez <reza1234khan1234@gmail.com>

Thanks,
Imtiyaz

