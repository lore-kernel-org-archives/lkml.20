Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793467127;
	b=EF/T57zQQwybMIjHleE4ivmhIdi9UW3tbyxpcmEE1nyTgcKqKumJ2fRrsMgDJIQTp6iW
	 EvqelTysMl0Kvw+uhIM1lSy/BXDfjVO99+pMNp2DoTX+4YZey3hKTcz8iiU5933x+26nI
	 CM1UYzmqbn1ewRgcY0YEXj9I1epfLHS8K8lPRBK/ilMw9JfsTKz4DVhrJc4DoVgBhJtYP
	 LH0OQv7HnhrGO79JNz2kxgwtwZrp18u1B2gM67YwCRbGIqO941hVWOR6YI4BppNjMhFdP
	 jidTgjyS+g9uKcrKWpX4GL07SEQtdP4flRfbgH2GudXu/MaodWruhSeyfD5xnEPOpSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V2piie36V2DMo2XoNrsEG9/VSdOmBi+2h4XzPx+NDiw=;
	b=vqKTSYbSqZlM90dFiBhF0T0N9o+WO3/0HCGjU0SqIm0KACMtA10TrcoMI+Hbw6ym1J+Q
	 J3zu4Z2n+zDeLYx6OvmqrXH5roSZY9ua2RfWMFEQHHbSTNQ5RM4ELHg7sqyH6Rhz9qkjq
	 EZx8YNG/tPReR5I9QUBcms+ysOVET2K0ZYFiZ5j1Gwe8QUvBqypWWIkP6g0kZo+KqWFPq
	 /e/OPuF9ZilCOO57b+eiA+miXyc5u5quJwWx/9y1ZsEN/LJ2MNatZAT2iA8y4rRH7lVOs
	 uEQrVe9FKx/g/jMfqmcT7VqYUn39R8ONJp+qUea8onbJt9bVB2EMVHZ5niwtMa1Wz1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WEM/00ce";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D3606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEM/00ce
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-483c607ccb4so1052173fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793467126; cv=none;
        d=google.com; s=arc-20260327;
        b=sLKGrov4fBfq0OgtpE6x8MvgC/1vcPunh46xMGrZW60L4XG5MedFfA1Y9v2kr1EO5u
         vEKNj42iInPZOCXWLel7X8k3ypeQdwkUt//AzwSnLMGv4+K9Eww9VmHswK9KeaXSOEsx
         nHb02k1p3z0UPlynifTK5yyB85ECC2ddt2/ZFh50VIigHN6jHCeZDqfcnGdevqVhEWp7
         M+CfMIplmswnj79Zsw5Se/Q8Lwg5UjLH4rBKfa7x+wZyizrbfzzfLNIIDZ+YmuEppYGc
         0BdRZNlzmJdKi6lw/oBScrzRRE1B6CQ7ySPr2fDEcJSX/hBohh/BSoIbaSurYgY9nIeK
         1+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V2piie36V2DMo2XoNrsEG9/VSdOmBi+2h4XzPx+NDiw=;
        fh=3I8XUtcidGahkr3nw5tXsIIO+Lrr5Crf7SK3klEhPls=;
        b=a/5WQa8iiag9IqQbG+NM5FmFP6zpqiNAHPEfd/kmK57nb4jpqlFF1bUlEOf/fQ7BEU
         Qvpu3BKf1y+xcUcuBqbnkZ9NV0yS6HeeNPAy0roOnj5GbQocWWaoKBYBDoPK+bXFOaBZ
         2we3Kzs9CxQpYl5bkOtsJbXIg1gAbwoDDDjivLUUWPBHlmJuhqWU9JN4fmaVHdtuR/pr
         wHygkySvCVmHINGuwjOOoP0pmIzpXtmk5S5ByB5sEyjomdujwUq4yJvcJ5bxk8jMY7ak
         2Juz7b1LqqYh0OtgdCavG1EMZlRRaNpeueEESJWbcAkcx5ODPNhNCgzVtXQzZe20g4R+
         sf6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793467126; x=1794071926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2piie36V2DMo2XoNrsEG9/VSdOmBi+2h4XzPx+NDiw=;
        b=WEM/00cenIgxMYlUq6BxDQ5kLNUmKT98i9hwk33Snqw8H93oRySaMzGjt7jeAwujfy
         8EL19gme2yHaw/XuetF9xVqVVJXc+EjLMytTfOcFXFoCKpnT8HS0aDQVXXtU/QY8YxkY
         KDsnemsHUYDnuNnRkZofC6tUlqKWdICQB4tde8gM7HYGGGi9Gc6/WzkWzhRLMQYlY1//
         OGZjd1H6l0AXeRiX7S4d9DJAIUE3/USy12y8+ymfvPiLFEtN27UgOyqmnoQhemx03DQy
         CsrNIHzk/th30zkW376OMF0rK+KKUjfv3IviVEGu3rE20fS8UPh9yk0LYKOFvV3r45tc
         xMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793467126; x=1794071926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V2piie36V2DMo2XoNrsEG9/VSdOmBi+2h4XzPx+NDiw=;
        b=xmPcT43YU/tN7dBK7qFcBJkSGIH572VG1jQa2ZbeqmMI+SMVsEGDl5oZ3iTvdoA3dD
         lVXEUgpgdA1xv2SJElM7CLZ1oGIHUJv8roaqo/XIeHtHq8S5X1WAawwAst001ZEecSGJ
         +fQSlhpCspdlP4FitefhWVft06206UNhmR5jaDB/lREqHQie8vq9SaP5iFQub7ilhzth
         rwcMaq52iogQY16sG13LaLbt8dDEAhPOAiJ75tA0jEwbdKDHUZkMJXmJ2Sd9WlCJaSQQ
         mutyLca4dzTKWzA0rKQE4IYET66L6+DE70+KTn+Z5LBYtf9Y8IzH3G9dIUHGM4CpFegJ
         9b1w==
X-Forwarded-Encrypted: i=1; AKwUvBx1J5RX0r7Xo9tOoQL1usX9CzaDiQkNJuyxXLe8Gl7Xl+2FGwRXu2PGBepQBtIu4/rjIzrrZVn8MPOHPu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIRYuwAQaopWQIeNDSfch08YitB0O03PNpymmnpFEfrdcPiIgz
	l1yuu6Mchym7yd+JwwOhgIz+lfAwZ0gP/H4Vij7zC3DyxVSYWFl30fi0o3/5bY6DBZhT9gIKZme
	PNr/7Sy83AUm7Q99a76CN1u4rbnqNlkc=
X-Gm-Gg: AYBFou0o4jHiR3ComE6BTwUTQzeT4KHH5F6k/BZrfDudkikcpIddmLh9fni6mSYeAYJ
	qRp4A8ICGMr0FjT9hHpKJdHaojjnO7C+z7Z9EJ2TTZmN/VKISoFp5nhn/my2mGGIHFsQDW/F1in
	AtWGjiGrBsGUIMg4yDm1Bvd9Yg35zsGRYGtCyh5NsMulezOZoRgWG4e3ugKu4bxfK7s0kP2Ujdc
	HHH83JGs1z7TZC0UNcffyN1tHK20Yx6c3iLj0qECvbXDwroTR0vfaaJNAzA4C5LFKuEWfLzitk/
	bk4kf9tQd2ROziir7KoPpMGk0ZJDc39yf5eHrN1T+yR3XGNC3HgQEyu7xHy42hVMtU8hJKN+7K9
	ZCkrNuFHbNChamGytP1zc5gPKXBO7GfOELgQOxjSYpS5K/GINQG57wEL2st+CxLQAA9wHBUVx+Z
	Fib4htMajRagVeA2XJ
X-Received: by 2002:a05:6870:b2ea:b0:494:abea:ad80 with SMTP id
 586e51a60fabf-4a9076e545emr3771958fac.28.1793467126055; Sat, 31 Oct 2026
 10:18:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029134752.1299130-1-hjf3108@gmail.com> <20261029134752.1299130-7-hjf3108@gmail.com>
 <20261030091743.GB27096@wp.pl> <CABOQOSX6mBCtTTg9eJX665t7tj65jo=9hVTgr7pmFRB6csG2Yg@mail.gmail.com>
 <20261031110608.GD31143@wp.pl>
In-Reply-To: <20261031110608.GD31143@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Sun, 1 Nov 2026 01:18:09 +0800
X-Gm-Features: AclHuK-HDTmWcV6TllrWHm2F-CgUI-guMI-8Lmp9oMlILn3GyDSBiaH_UIZRaCU
Message-ID: <CABOQOSW-4dqo-wfwHcbAK7ECvA+Gc+hKhZjBFckyBRoO0EoB8Q@mail.gmail.com>
Subject: Re: [PATCH wireless-next 6/8] wifi: rt2800: set the mac80211
 fast-xmit and aggregation flags
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 19:06, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
>
> On Fri, Oct 30, 2026 at 07:33:44PM +0800, Jie Feng wrote:
> > On Fri, 30 Oct 2026 at 17:17, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
> > >
> > > On Thu, Oct 29, 2026 at 09:47:47PM +0800, Ho Jie Feng wrote:
> > > > Enable AMSDU TX/RX support for this driver, which can increase
> > > > throughput.
> > > >
> > > > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > > > ---
> > > >  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > > > index 032cd6ac345f0..8b4458a74d33d 100644
> > > > --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > > > +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > > > @@ -11861,6 +11861,9 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
> > > >       ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
> > > >       ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
> > > >       ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
> > > > +     ieee80211_hw_set(rt2x00dev->hw, SUPPORT_FAST_XMIT);
> > >
> > > IFICT this flag will not take the effect since we have SUPPORTS_PS.
> > > Also for WAP3 (802.11w) we fallback to software encryption -
> > > that will prevent fast xmit as well. To truly enable
> > Yeah, that is true. I also have a patch that enables hwcrypto in that case.
>
> So let's wait until all needed parts will be in tree or posted in the
> same patchset before advertising the support.
>
> > > fast xmit, I think we would need add hardware encryption support for
> > > WPA3 and also compromise by remove Power Save support (which is disabled by
> > > default, so that's possibly fine).
> > I think maybe a more general patch to mac80211 to enable fast-xmit when PS
> > is disabled and not only checking the feature flag will be better?
>
> Sounds like good idea to me, but let check with Johannes (cc-ed).
The patch might go something like this:

Within net/mac80211/tx.c, ieee80211_check_fast_xmit:
        if (ieee80211_hw_check(&local->hw, SUPPORTS_PS) &&
            !ieee80211_hw_check(&local->hw, SUPPORTS_DYNAMIC_PS) &&
-           sdata->vif.type == NL80211_IFTYPE_STATION)
+           sdata->vif.type == NL80211_IFTYPE_STATION &&
Either:
+           sdata->u.mgd.powersave)
or this:
+           local->ps_sdata == sdata)
                goto out;



> > > > +     ieee80211_hw_set(rt2x00dev->hw, TX_AMSDU);
> > > > +     ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
> > Although I think this flag will still be useful for this patch.
>
> AFICT TX_AMSDU require FAST_XMIT. I think we could potentially enable
> RX SUPPORTS_AMSDU_IN_AMPDU as long all buffer sizes setup by the driver
> and configured in registers allow handling big enough frames. Though
> I don't know how much beneficial that would be since we most likely
> can not configure very large (A)MPDU buffers. Need to check.
>
> Regards
> Stanislaw
>
> > > >
> > > >       /*
> > > >        * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
> > > > --
> > > > 2.53.0
> > > >
