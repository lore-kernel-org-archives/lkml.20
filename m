Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383547;
	b=JfPT8ZHuOcgLfrKadL6YHXVYnY54DpCDNxrei07ZCT7Lkbvu+yoQqNmRDwZ6pRfTVwBa
	 wfT5F3iKkqB862gkrhyYXsImoGOlgMC7P+xQ30yMTmNglF2vCuhrcMPnaj2yYaKN7ySAD
	 OgVcnBVsVKxVP8dGuYCsP7b6IURoMQmxIMgj+e/URj5mTCumlavczmBe/jTxpuR8iwXyo
	 djyQk76K8RaNToUjAUNWRLely5xXEeVvhsrzRSkIututrUUdfQ6kQ7OckqKOmCD1I3kS1
	 GoI73fMlodTC9H3cLLEuKeABFMPz8yl9HiDhFz24o3zcUgP8zePvN7j9uCJglrfG45g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6nFFsAgTb2JrA6ZMIp0GSgZNxXMgbryc9P3LqO1yWB8=;
	b=q4k+xtC6/62Ial2GL51YN5CTzUR8EyhF42CvBaZScGPuDGGh4KgxbwDjp/nmhPJ+Yjmx
	 B5VEOIZVtsEkIX7eAZQhTZRl/FxHvm179+MbuvYnXCWJLbGkvAOH3vu6Q8KRNQGtd1Uy0
	 ILxF7RNd1Wc5Grtmxe4Kb1JjuFwGtFYmwi/AIQeFCY2AJKYABYHCZA5iDj3R7u1SRfF1e
	 yus5/oRkFqRcMp8uwDPKGixmiSU6TGYkwUQchTA+cWlTXLcnA4VFZd0kt6Q0QfvG71MvR
	 5Wm7YJ/MNF8T1jDxlkuMIG3T+t6kCJ15dD4Gxj5SwHXyqE8YZwIHqECGiXR7naySwrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdkWd5e2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdkWd5e2
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5949c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383546; cv=none;
        d=google.com; s=arc-20260327;
        b=Ibu6hlBcAt5BCU12ZYSqzPCVI/CEpfC1zgS3pY6k/GbJW+E3NuU8G5cmhpvsHnr+Jo
         AaBj6jPHU7h2TAic9CiEowtyy283IbiMMAKnT97gXRznvOqnPq/arO9Z5jTQ7SIg+EYD
         9vKgyhocLjOiGuCMjZmYMpuMxWYnStnm6p0DYJrDoL62iKQbPn1hr8twQO7090+y2FJr
         +1rFuPPQSO5H+1mNC7RQnBoUMiKWVvEUIuGUZ9JlkEZvDAtfqVpEnDTGnPoIun7xwMGk
         EWnL+XqV+okpM7S1fDj7xEHk+UWA4fXxBp3oHlah6qweOZqeDyxRdCwF95Ilzu1jHz9a
         Q/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6nFFsAgTb2JrA6ZMIp0GSgZNxXMgbryc9P3LqO1yWB8=;
        fh=pKHBSWHqO1hWt2h+wOFCF39VOZarSnuZow3fOx/pglo=;
        b=oSiqLkYDXFmC9R7GDSPQEgBxnK8+sOcsHPK8P35iaWR1HgCx3Zs88GTD09D3EFbcxo
         U6hIXD7uC9AggGh2fmXYmGSDJkauiGHsAyFkIGaxdNAPV5r24jYmjmYiHDsmTOeDixCz
         2FYqdp/RgR4J24HhyDF/LV3dR0YrS8RqAXbt0v9E7C5fqPa3Wu/8yz2BPtew+SRX/Qca
         DVNH4U3mtf/IXR8hC6psOalzfXTvpKhg3r8ThsVnJNryHBR/k838Absx0oLS7vG7uAH4
         ztSRqSoxIkwqjTfExyz9YivBHjB6rwlvqoNH9iUqGRkwHp84el1TmGt1JQ5UB+i2nYJF
         XIkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383546; x=1793988346; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nFFsAgTb2JrA6ZMIp0GSgZNxXMgbryc9P3LqO1yWB8=;
        b=WdkWd5e21k4WbvCxibQM8BdPrKKyHBCPM7scAPNXDbOUjzUDC4N7icSNDiB60gZlYj
         nO4n4UTUZOsxm8/PmbZvcvpU2iI7GnBP87xkBeyB7yW9UdDbHnAvaJWtONWDP/Bo5y1H
         y8Nc4QvmkLENOvyJ2uRlfm5vybB22Mw1eoSx2GhPAU1ShUFFD1ENMfjaoPk0IzlpT1Gk
         BsI5P2c9SeYcpFd2cdI2AkJA6dQRGcMKRjjA95h7Dk2/VRs02NwzNfxNi3Yrya++OQ3U
         UY3txWeCam2WGmCPBUpElJRyLCMQnEI86kpTg2v3q03cMYnsoOob/4CJvlaCr8LFw7PK
         xWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383546; x=1793988346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6nFFsAgTb2JrA6ZMIp0GSgZNxXMgbryc9P3LqO1yWB8=;
        b=RC7JCCw3MFRgUa+j3XtLOcpREuU17GlXnHQp6I7HABzFpdVnZlbJb7+z5QAV1SbO7O
         /OBDSgVnPDEa/tPHPKTww9R/louPOb7JNyWAG/aXOy/kFhov8SA80TX5+D1sqst11I+6
         mlon4qAYDJnnQeueOu7S2ZmBdYMS68cSuSd7At/ng+dQFtZj8WoOWcuQMULKuBhkVQ3o
         juboAh/bIGRXXeTdWRwzZMzEAaA7mU9D6W63129nY/2M4C+bKHs3RPezCcF5DPSfxCb1
         WOS6FnHgvgy4qfZ4VOQHPUZeRtF0NIsgX4KISCtn3emTOuXumY+1/qeKEwfVixkcrDq3
         7iyw==
X-Forwarded-Encrypted: i=1; AKwUvBw6mEDUyRx+iqyLJYakiTm9PuuhzQkJfUBoV/Vf8fuDCitsSa6SRSovenshcGDCHgP3tNz63KRN2n6cOP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYKjcJ1EIuv8ZKG59JhkFn91xowmS/MUxcn9/sueYuIVSm2ae4
	1EKUYxh/X/i/snDDnOOqrAulTerwHFK2Ns6uusKrHl4BadHd+llAAvbpsmMHNwddd59m2rBh7x+
	qYtS9X8I3jOyHcEYcEu2ZeT3pLAqL6Rk=
X-Gm-Gg: AYBFou2wHRZeT54se+vFzyRzjkIafh7mkyVEXnRCHxoZayzc4wnmJf+WwDxyw+lMAPQ
	k2FdqFFQY79X0iOm4D1MvNYkvTbOv2pUFdLImVc0ubELeggK5fS6P/bED6mNEAhlER7EY/HR1lu
	hhjzHgPWSBDFB4oJdngHruoYWZnopDQNIsakaxx8YEkTlap08mXhPJ2TzKE3Cp7RCJsGSql/B+X
	leFq625K27UdtytAeQXv1OXmiEHd37XUYAVbey6XNBY9Gq+iljM5BEKsRFDHYE77WMA60gSMZjm
	GsdF0Sn8ECAYY/xrKM8HNRwWJyIc4T3OkP0dQZm/tcBC6e26/DLCdC/Fi2tHG65sSv0SK0FawSX
	p7GNWYy9dl8hIvDeX9W+9j70pNAo8J8HmJ1ej9Wkogkt8OmGPHbypI6iOJw==
X-Received: by 2002:a05:7022:3c04:b0:1a9:c52f:655c with SMTP id
 a92af1059eb24-1ac5c555f7cmr3718375c88.36.1793383546411; Fri, 30 Oct 2026
 11:05:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028104758.299129-1-timur.stukan.linux@gmail.com> <179335745203.3134.6448413016247418659@kernel.org>
In-Reply-To: <179335745203.3134.6448413016247418659@kernel.org>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Fri, 30 Oct 2026 20:05:35 +0200
X-Gm-Features: AclHuK_oPUhcpJrKbW1D8_iO1QvO2I3T2TBooqrdX-PjaBCacASo09NEvMHhvII
Message-ID: <CAF+_u5Cyzga3ic76Eiyb9eFZDyjdJGix9GQjwr9jYRJ6W+fiZw@mail.gmail.com>
Subject: Re: [PATCH net v2] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, hangbin.liu@linux.dev, razor@blackwall.org, 
	fmancera@suse.de, jv@jvosburgh.net, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 12:50, <netdev-bot+sashiko@kernel.org> wrote:

> Does slave->link == BOND_LINK_FAIL always mean the slave is still in use?

No, but both routes described here start with the 802.3ad notifier
setting FAIL on a slave that is DOWN or BACK, because it checks
last_link_up rather than the current link state. I'll change the
notifier to set FAIL only for a slave that is currently UP, so FAIL
again means the slave was in use, and send it as patch 1 of v3.

> Can an in-use slave reach this fallback with slave->link == BOND_LINK_UP?

Yes, this is also pre-existing, but it is the same problem this patch
is fixing: a slave that may be in use being set to DOWN silently. I
will add that to v3 also, and in v3 the full down path will be taken
for a slave that is FAIL or UP if speed/duplex check fails, and only
DOWN/BACK will be reverted silently. Checking curr_active_slave alone
would miss non-active slaves in alb mode. In a normal miimon flow UP
is never proposed for a slave that is already UP, so this only affects
the racy cases.

pw-bot: cr
