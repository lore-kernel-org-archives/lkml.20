Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138051C065
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069860; cv=none; b=Rw3hj3/QCMK1OYhkLf9eDxD9HDC/mEMdyjFMRdUGdLcgJB6KKmFA9H2CgFF8kV3jZe3OgZJBa9BcJhqR/4Y3F65Z1LwTiLiRDsNr8ayBCxFBfSJzWtF6rkNYgSxyWRVcqEThuql3kc29mgrrA1gE/CzRB8SlwZRw0ooPV/UlLEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069860; c=relaxed/simple;
	bh=vMOw2LnSptLx2inZHDauA7QAHN1ePZ6m86XtVnrNXWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQAiSlX0Vg3KpeERrUyqEJ0GXnhD7KSb+1hoSYW5K9l58XZa3dGzAflRYq5+zSSltyjt7DTsJsmaWBhdou4TCH4OJ4ghYGORVnecqWT/Dys7yPR7kGMTs65c8J9pyDAJ78wCZBuMWxc/pEFasIlgM8XdEKBvnEz1b/jC/kVYAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUWgwLAG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUWgwLAG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so19101795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792069857; x=1792674657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1H+C/SntNFC1iY1JZXwhhR2BGSETQJL2ytojY5GJ3U=;
        b=EUWgwLAGFmMJsZkYtydLu/CHXyvnmoKfUkRIEU5V1Udz45MVgy4jqXeixgbKcoWEjr
         jRnQuhYBi0OcFCauVI5CdndT26uTqZtuJs/dvWTFa9c2GULJX4JE0wNH3LCI1MwJjG3Z
         GT2QtGd+lTA2AYKQJ4JZLf3IisUvPgXEqr2vqIzNqcU4e1MEFwFtvm9l0a2sS9vr1lD/
         pbGsbs9ImfeUqCCdtQ5m2mTf0p0bMXRgAAo2ocL39fs9ev23HZSFRWbLSqM35SmXsa2Q
         spDiL9CcJTH8Xhs5r7qAgqSMraH1OQrVfeN1DDIW6NdublJS/hHLtxdsszqSAVKgFsgW
         bdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069857; x=1792674657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1H+C/SntNFC1iY1JZXwhhR2BGSETQJL2ytojY5GJ3U=;
        b=r7/VQe/dgVyJVbhRVDOCCCPAQ+MqXnJ3xcZ9Ik0osjy0ReAL3gLLOsuX7x1enw6Ioa
         fbgqsMgne0fU19ON7IT1q3n8Ux0eTMrs+o2wyaG/FyyZ4PuUWxqXdgFRk8H+EW8xCXCb
         jhM9ekPEhy+d96IhxdBU0wS183NXcouAGnmkSXZ7t7NSb6dYw/phzRusOO16Ejzsv/dJ
         b+LYLi6wLIf702Dh5wchKqxgDG54wUFVapeQDba/wlFiGF+kFPAqZ8hpo6m354DKCu7p
         zluB4KnjynOTEMnaX++mgOSgCaaqwToZHX71OhQ3fmo0U06B0IRZiXB/XZIIzF8lrwrt
         U+4A==
X-Forwarded-Encrypted: i=1; AKwUvBwVGB8Z181dfyxXJ+7Sw0aEApgIkMnYcQFvshmY92V5Vt75W7JDQF9EkABqqT7S/b8Yev/bYVuiKfLxKJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpebc8yY8oy+fTsPfz1RDiZuGn8d8m2MBCN2f8X/HJo/n1wN8P
	8BiQ0SLRqNNHXqUl8tjLr/xLDqXomTexUIoA8WErgXQgLhr+OZf4Rbh5iTHacNpNo98=
X-Gm-Gg: AYBFou1mFNJExN1OcYAk07tOf2ZePbUBZmjA+E+/0x/RSLL19MFsqF5qV3au1j5Axvi
	L0jlRhXCzX9EjR7EzXa2JxXwFh+f9QzKraWacfKYXXXmQwbrFOZmZvNapbzpDPQcsQ1ayYOlfpW
	ufnerTkt9Im/uT2OCotafMMbr1ZXe6MneBtnANlgOH1i+yElEdqm3IppEFt1i5R2zUp/2C980+k
	lbX5b0JSbx/zhGJhqKeGTF6GzjuC4w7+fhQ0Cg6pZXU08/n4cfHy9ZO4UvfJOppWvR2SH6UYJzt
	SKCC7+FUM3XYoXT9xlHw2TQF+6dBDLKH9tqU4mc64xqrV4slxautddHYa6YF/LZ2hphxdMexIST
	A40nmRdrorX2Zz9SYltFXmbjstS+6GRSTkIGmnNya0IdVp5MABIQZuQDYU7EmO1u448DoNoP2Yn
	oH+7/KJSiWDmlu54Fxw6DRwc6gVatp/T8/K9ajYiH6lz8RvvP88c8fp/Q6+6tfbeMZrlp1svATt
	VhRCRgy7Sgegt7mRzmQUc/NuO/rbeFCcMflwUuCkC0=
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr384803075e9.6.1792069857275;
        Thu, 15 Oct 2026 06:10:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:130c:b201:1a24:6e5c:9182:4c01? ([2001:a61:130c:b201:1a24:6e5c:9182:4c01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6834dasm65234445e9.4.2026.10.15.06.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:10:56 -0700 (PDT)
Message-ID: <aed1c8c9-1603-4d35-9b2d-e164d559f497@suse.com>
Date: Thu, 15 Oct 2026 15:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: bound timeout=0 URB waits to 30s
To: Hongyu Xie <xiehongyu1@kylinos.cn>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.10.26 11:38, Hongyu Xie wrote:

> A blanket bound for this helper was suggested before [1] but dropped over
> concern that legitimate SCSI commands (format, tape rewind) can exceed
> 60 seconds.  Those commands are issued to tape LUs whose SCSI timeouts
> are much longer than 30s; usb-storage-attached tapes holding back a CSW
> for more than 30 seconds remain the residual false-positive window of
> this change (modern tape bridges use UAS, which is unaffected).

And these concerns are entirely justified.
I am sorry, but there is no uniform timeout suitable for SCSI commands.
If anything hangs based on wrong timeouts, that is the bug to fix.

	Regards
		Oliver

