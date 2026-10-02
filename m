Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DD2EEE75
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903744; cv=none; b=uvoPsasWmB7cJ9woJ25kvvB7ExPf/d6jAxkN66QLZg+HABlvhOPcl0fKn1NE2Qpxxm0aoKtK3VB+3F/X6Zyqj7t89Bnxw6nKOiZ761yxywDq/mTKPf3nds2/ibdhfVN2QNKN/nlmYO482eVxpg/qEI10/eAxmfViyBg0nZM+aT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903744; c=relaxed/simple;
	bh=aunFeame4wKVmGvgJHnu/qouCptqjCmPxKAfP9jLT+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yuh4TCdyI3rS00vcBpTJUDyzfs6+t7tJSmVKSZJmjUdoYZhvuYqCXxw3mwcl9fDmzviJyKnj+y++e7eVGJrTTSJsxDkIi0YNGUe9UfZL4Rezy+xbUqfPRtnDGAFUDaSqZJnTotzQYS7C8Z4FGSoIPvZ+RKvKHsrJudWfhXedNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqS+VnZ/; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqS+VnZ/"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so2588977a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903742; x=1791508542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMFl2aGGE1aANzs8ZGBHMFNFJgtTXbv0xuIXVOrR51Q=;
        b=lqS+VnZ//RHMj9K/cPuZDOQAW6iJm/1VGtgr17ixmD64BIutCBP10q2yMuJChqvt00
         o/4nLucsRucUJJ2yy0bbtZ9JL0gjgC2juzAnwAtj9m8Eg8GYTp71bsGSEIb4RRETnNeh
         a8zMPuk/stS9htcir5aSYp3MnvgUfvlVcNKUAZ9WflwYc4jMpkj7bty5V7+Ggm4f0P0C
         xKyl9tBGR0e2DRCnupaTov919lgFwb82HBWNHP600w4JcrAkhrhZUnJRKVcqzMrz/NcO
         WnxlANW+c7tCvLkyGZGFZWcejT0Md3itDJtJb3ue+d2wFzaTsyd6HCFKVnR8CxyHbv8Z
         94MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903742; x=1791508542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMFl2aGGE1aANzs8ZGBHMFNFJgtTXbv0xuIXVOrR51Q=;
        b=1YZwnjVHsWLE0Zfmkgx4uoIXwzSGq4hMFu2f6B8d+r9DsbYdILdjoXO4l9crzDBwis
         uOMJnG0w3I5b5yHII+hYqvIMADqwZr6VxWB4YM3e5UIdmFt+enlSP5EWs7TCNJCSm5Ix
         vBiP7AupA8dc6VMiHW1lQaAQ/dcKZMaV9qIhvIna1Gxt6fQ/J35qbvBhkfefMHqKLL2F
         gleiy0jKIxmk8KenzjGE/N6MOWCF69z2gzdwIebGqcbVXOSH3/l8mjN/+yS6v59WppX9
         jZ9ioA+H0fqDJSLfzS5gPPySaobMmYqQcUGo5zv43I8ZI9corBdHUhjeNWGkOpp7ViDg
         QCRA==
X-Forwarded-Encrypted: i=1; AKwUvBxo2s7wpXBnIZUCzBAxyeaJcgH77TISZOc35LQ2vD4xj0PkMZ1p1NKoqHB4Jy1DjYOSA/bM4v8fdK3O+4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdZP/PgXbNJkyI/tn+L+I7PYIEAzDCypPUizHzvPFpTmm7s0Lm
	Csb8+v4Hxnk4Gw4VyrUJbtN1VYuyJkukOkYkytSjPdcNV/6kXlbX+IOY
X-Gm-Gg: AYBFou2NhUQlsZig7UHCvBENlXRChOq7qVA1X5SGPpRh+0qDN/OMeKG/XWUJhiOClJ+
	hYdxg1ZBojQo4HIeJ4HcM3qSJKFwuFiR3r6n1P0tg4pbC8dEqQ8L4Aiw9yRlOVM18il1Ia/vOlY
	LiLcECDRj3lnHizT3k2exT08YkiklNPr0WMtZHci5xJnOmIpLBVlA8ve6PHzb2EdJcYCYvW0KTe
	x7CxlkOTEVrMxuP4OUSX9RmLMuE6vKY9kb7AYF7aISAg2DbhNsX0nmrbIWn0IUm6JUFoNM7VmFm
	+OClkkjyIYCz3D0Mgz1bVKDt4t2ku+W9YL4Rr08gg+97+bQM8T9zlEdFxPcvoUvz3zeJxCv8i4v
	ouKfKI4Ab0Rp4S+x+IhcBIFzv639QpjxU1ese04KBzirF0fkHeNUmtCZn1QJxwsvCoScESmXA8R
	LjapAFnP3c+z90f1/PBlA0RGl1s8i1owBJQYTtcBpNW1+fyAVskH0beWuDquWpMFVMeZeZwN7dv
	H8=
X-Received: by 2002:a17:90b:570e:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3a6ce34d7d2mr1167955a91.1.1790903742526;
        Thu, 01 Oct 2026 18:15:42 -0700 (PDT)
Received: from [28.0.0.1] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd2fc1f6sm432027a91.4.2026.10.01.18.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:15:41 -0700 (PDT)
Message-ID: <91392a33-7450-49a2-acf9-0756dd9b7aeb@gmail.com>
Date: Fri, 2 Oct 2026 09:15:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru,
 ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com,
 btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com,
 i@rsplwe.com, bozhenpeng93@gmail.com, martiya.ar@gmail.com,
 aleksejirlik@gmail.com
References: <20260929134503.17249-1-qby140326@gmail.com>
 <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com>
 <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/26 08:51, Miloš Vlku wrote:
> Follow-up to my own mail: I have now run those values rather than only
> reading them out of the tables.
>
> Built current pdx86 for-next with Chris's GET-only function-id change
> and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
> profiles apply and read back correctly, checked against the EC register
> each time:
>
>    low-power            -> QFAN 2
>    balanced             -> QFAN 1
>    balanced-performance -> QFAN 3
>    performance          -> QFAN 4
>
> All three power-profiles-daemon profiles work as well, so the desktop
> slider works end to end on TM2307.
>
> Two things fell out of that:
>
> - Without Chris's change every one of those writes fails with -ENOMSG
>    here, exactly as you described, and with it all of them succeed. So
>    that is a Tested-by from a second board if it is useful.
>
> - No machine-specific capability check is needed on this one.
>    WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
>    -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
>    "skip the check". The stock one is fine as-is.
>
> So the TM2307 entry comes out as just a mode map plus a DMI match.
> Attached, against the v9 ops table and checkpatch-clean, in case it is
> useful to have in hand while you write the TM2309 one. I will resend it
> properly once that series settles -- posting it now mainly so the values
> sit somewhere concrete, and Mingyou can fold it straight into v10 if
> that is easier than carrying a separate patch.
>
> Thanks,
> Milos

Hi Miloš,


Just a minor note: you replied to the older v6 thread instead of 
v9, though I see you noted the dependency on v9 correctly.


The patch looks good to me.

I will include this in my patch series if v10 is necessary.


Reviewed-by: Mingyou Chen <qby140326@gmail.com>

