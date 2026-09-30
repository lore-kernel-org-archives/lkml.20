Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D04F473B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775824; cv=pass; b=WRsv1NHZulJgTZOHHS7CNPrFY5kSLyTvlXM2t/BtoDebGUSO54rAaJ4/yVf1k0YEogX9WR8Yur2t3HuH8MRb+b0mMJsDKZe3hdnX/X3KCDFgyid7BE6qmc8S4353W9YRTmYtGkgUOP8EWkmOqHaEPEc3k28E14VjA743HFa/L/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775824; c=relaxed/simple;
	bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xbagyv1Tz+Lx6Lki67Aliy2v3COQzfHwh0AWbBS3mNYrf4picEXkHcrFSV6oxOlWSEEoBlTtloqQz8vRBUWQmF9yF4/KeBYyTJ2DbV/XkMo+GsAnRmTAAnN0ibSYnHBKFaXj1WBxKpTacxaBFDNgpBfHM444TUIw7VMclxbUpks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abwb83fs; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abwb83fs"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so530578e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775811; cv=none;
        d=google.com; s=arc-20260327;
        b=GmPSZ/AlC0wk9zOIrZv1Zphx5HgHZB+puxDvyYeeDOGClduB74otTZKh89NGJM9M/f
         UAf4Q07HvNuQHMBOaRqGWGfpmVli9PZdgFXy/iJL2iEDRTROX0VOTn32jvwq7vEzL7uH
         dKM37kTLWObGuOw3+heLzDLLCijthJcef4A0lSJynj00zRrPizIa1x4UI6d+sOI4+Dmt
         4QDE8MFPMxzTNcCXrYebyuMhYsi8vMXRuWyTivB63rxrtcmEC/NbIKbog2haSmCTHSOh
         kA4Dzp9I6I7kHFGKcj7wj9toBBW8If3tbbTMRcoC3et8NK5gygrdNdVkwhNvBaxpTDpe
         aMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        fh=RWBpeg6CguMsFz7M0T5TbkBhhZBunLkFxMHcRnFaY60=;
        b=morV+OVaghZOMdZwnyzQKyIyMH5mzyXON/UhrgjTVwh12Esx/QKpEv7MOWQvHf4oJe
         qQqn/MFq8UFg/2GVBCJCT4lowVJIuiYe5DXqNpm3n2QtaF3z8rWW1N8LnB7juT3MmBq+
         /Pz4p3kYJ3Ftcc/AucYTJwuLKnI+2AidQYfcShE+gT9pEUamC7WBRB4rJelwJlatgEKj
         9pWWBl5XvS+mR5Imzu3gnnnhQka7IR0R9ftcyq9YGMWr3dkdDBFvKnCmpHZOOXYQWDRj
         vZdIu/vnFa4XQet7ffRIo3Qe6a2KOZ5+TtC6ZvbPz+u2Cjazrvl6rjlu2naq1AfimOTp
         uq3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775811; x=1791380611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        b=Abwb83fsHbVpFom07AyBbpD8lFlxcGjmykARrOKp1fEkZ5oFgOMcOil6oA+XBjIA4u
         VpHxhpr99eY0XrjQ0fH6vQj2WGP4SaUUkQbPZkV6eL0+Eh2K7xGmReydj100JWDeaA2m
         Ejoy0YYjPwnLLA8Qva95dPsyhbZy/LE7x2OPGuRAf8bSsFJfjKIMEzixk/DfeL/Fv3RF
         4QI1Yh3RBlRp2YPpWQI0aph0AsUN5ZcrBCMzRRZkvqgau45sRl92pAOYYeW6f+yjnCHQ
         sWuLaMYhVV1MBs8lB3BGRT3u97pMMllnj4pmMtDtq19bRWSxI1U8dgz459H0yoRTlXuq
         Tpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775811; x=1791380611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        b=WGA7/R26Hq+kfTJ93MUesZHUNQq/KjA+xPV5R22GxhmqGgs2h/mrrjurd7a8kGi/SH
         juUWs54cBiIi5fNehiRKP8ZoesHLDR9awb80Mw0Gdy1Dzqj/4WaKBVJM8fAxG2a9ylJq
         zlaUW/hxIs/BOyEvDj39ZlGtXSFSoY+LznFHTLKePe2iHFW1nAmtYHH7IgPreTzt8Rw8
         52KBXgI7z4oD+sdlZNn3+eAHE7FEJ8tnxtaamv7JN0v1Sm4TP6pUWCV9QzWe1gBY6Mx+
         fEAMrLWxMX9Cmb9in/U3nE/MvE2H2kpFH8VFgCAVX+FDBLZO3W32sbwUfeK/Npxy/bQ7
         ckiQ==
X-Forwarded-Encrypted: i=1; AKwUvBykWRRtFRfGo8o7nuT4ReeobO7bPebIxfoQonC/q7JIFfI6s0dMaOoXEDnEfZn2pjoV+5UCrroh/iqZcfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjS+WOdcadDf0omNwXH6mK7o5RZk1vPZBVxLzqkasa5pKPz446
	5XQgUou8qnD6Ddb51otxwt+tw6/sBTRMdmRk3JHjdv8U2+HQuoeMhNRAqZrNXsy3J68kboRA1Em
	JESp+bq78BiucBd3tyfs9AvFeQuvVFIE=
X-Gm-Gg: AYBFou0YW5sS0mbH6DH6+sTTXcChiWpAjZGVpahj7+bu2Ik7RZubHkM2CxpOdh+nbhe
	UpR/5xwzqhAjnh2ixNOgAwYA5ciitJLjP7ZuBM63HLNoYknEepSBa/+qlbJlmWQO78wMZOzH1Od
	Q6kvbfhzvQtLPrXS3MKTLgm4eVGm512X7H9jiS3KCv79ZoFrtnRjDLpzab7zf8jm5mdRi2OqwgG
	9M9eRwv6G6uNV8dGxWWn1kJzKAW7kM6G54ajClw+yl87bUl9Jb1HT+7TITm39hkvBjNVbeUwgtU
	ymVsBaekT5CpB9J7MU5Rne7TdU34N00MIDw8Bw4AuK5hoTr2onmhRo7p5HgrQj/DPXUZswhP6+n
	JWZeusSaE17CfmVYh3bjfONJu4T4dg1C9jtEjpmK2fwt9
X-Received: by 2002:a05:6512:3ca2:b0:5b8:f83b:30bf with SMTP id
 2adb3069b0e04-5ba405f9b82mr609416e87.65.1790775810584; Wed, 30 Sep 2026
 06:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com> <235a33c2-7138-4815-820d-793568757d95@6wind.com>
In-Reply-To: <235a33c2-7138-4815-820d-793568757d95@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 30 Sep 2026 22:43:26 +0900
X-Gm-Features: AclHuK-5JDzwUkEH5VWEa1bCvpw7pms_UcYcspNYWPTwaPuJPPDlw6Pn3dQKWJk
Message-ID: <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: nicolas.dichtel@6wind.com
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you respin a version, you can use netdev_hw_addr_list_count() in
> __hw_addr_list_snapshot() also.

Thanks, will do if there is a v10.

On Wed, Sep 30, 2026 at 10:03=E2=80=AFPM Nicolas Dichtel
<nicolas.dichtel@6wind.com> wrote:
>
> Le 30/09/2026 =C3=A0 13:28, Yuyang Huang a =C3=A9crit :
> > The count of a netdev_hw_addr_list is changed in several places of
> > dev_addr_lists.c and a few drivers read it directly. The next patch
> > needs to account every change of the count of dev->mc.
> >
> > Add __hw_addr_count_add(), __hw_addr_count_inc(), __hw_addr_count_dec()
> > and __hw_addr_count_reset(), use them for every change of the count
> > and rename the field to _count so that a direct write stands out.
> > Readers keep using netdev_hw_addr_list_count() and the netdev_uc_count(=
)
> > and netdev_mc_count() helpers, the few that read the field directly
> > are converted. No functional change.
> >
> > Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>
> If you respin a version, you can use netdev_hw_addr_list_count() in
> __hw_addr_list_snapshot() also.
>
> Thanks,
> Nicolas
