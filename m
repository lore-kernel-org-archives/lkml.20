Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360063;
	b=dycZYamnhKnPJ/qIzgqnQbFGbzF1wAmUAH7xtRu4SjmLTszKEWvOh9JsFvB9T3v7wbRv
	 n052Y0x9Vp8/O1oFRIAT6zbI91r5Ro5ry/WhovswKLzDC18xMGFTwZW+LLBrkXY+zqoO+
	 kBzONrmsqWmX0Z3wG0fT9ghBVgqe1m8wQhfsWu5PwjEMYBfHEhe/CxddrilxCUWBFIkWs
	 cjhI9SLwyPFXMyaeri3midDn7Dph6KCRXWo8F5V5T9L87tbniv+rtZ6s9x3XzOzDm/MQu
	 xzArvmHZRzYfSyI7OrOyQa4qpXtIrQP9VRQPTaHXv4rs3AYCDWk+cBmwVN2BY5Ul7Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CJXv3k/n7KXs20ZCrHngIKsI9Ju9rPGpQzEVjeHfCaE=;
	b=WUgh7J19dD6DAbOUKXYL63bfjTKTvKg0TYKA+YK3mCvSyY3eqDS/BShRhJVOtgDTjw4F
	 GPh0xQH4BTWtcMJjWdlor9Laj8qt/Jxa2vp1SVMmxcJ1TJ/8pwl18AU8oqPaJT0p03D7F
	 eqi2ksHBHUUg2ghMgIQkOKHX8pjPWpOngk1a/tnTgIAykjLwYVlxtcCKsXErD8svjM2+j
	 +7fwv0YeRpPm8cVUkkybkH0xANT9HcpFXmuxEVsfeFc71yJlhY3n4Pme/NbVSefhOKQ6y
	 LFdZrQ76cBoO1hOLsg57Hk3XaoxZy7RM6fA9gxUio2aY59pq0etJJ5K+p9g/mvdCujg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FE2zVtbx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FE2zVtbx
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70bf1671c21so382063eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360061; cv=none;
        d=google.com; s=arc-20260327;
        b=hSKjpFVqx1Kxn7zQVoPDNHAn//os7DXx+mD8B09Z4Kk0bx0IeltEHu8jjAJQY8iWzS
         ZNcnU/pMCDsTpMg4Rx0ZRhK1hgRK1O0gR+Ar0IUUDNZrZEMyImfmk6bKh2qoDoQlqEyE
         6ZsoepZhrgHforrBm2E6YLwfZUQGMF5fyNps9Hxgl7f1Clh3nSddcIHRQ4RS33x914Ox
         4eaihv0UMYpPVb8NTkUh7wAOrOkMd0a3SFWDouj1u87kUoKomHYMkLxsai73U/lW1do8
         cD/DFN1qSnmLg0JfIsn6JXHPi/55ciOmerYMwy1FoyiYCO1nIpjcSfoEoTmnWgkMgt0J
         0Plg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CJXv3k/n7KXs20ZCrHngIKsI9Ju9rPGpQzEVjeHfCaE=;
        fh=ZSipN/LvE1oal4BON7pQAwHVAucOyZuh/GK8OAvLJ0c=;
        b=J52jA4+clg+p4Oz1WdVT6nw80SSGt/T0/qvi/4iNkvGe852gO47y3+atH5MofZgx0B
         6m8I/In98SaZruSlNg+Z75lyio7RT3joCn7n0wNm5YPZCjlbC0x1ROQD2+1KFqOW5FV8
         yoDe2Sbujxo/qvPgrEwL6RYX93TwjAdEMBmP6tUakjcH5NLqWlRidH0alm4sDInIgCYn
         0utTixkjEEah/7UncTDsnGHcrw0eFS2O4dRa8iC5YX0C29ZnlPnO6R6Z9hnIdOMeS6md
         n9evijow5WeJowkehz9YVOgun2+RETkvEImPWjduwbMr1ENlFQm6r48jVG+8qD/84MDx
         De0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360061; x=1793964861; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJXv3k/n7KXs20ZCrHngIKsI9Ju9rPGpQzEVjeHfCaE=;
        b=FE2zVtbxSuofRjs86yss68iCq8FcHOY4DtzD1sxfY12zyLwIXgYrc46UI5m0U89T12
         xj40d78w2zSXYg88OCXk8N/frh1g1kIYDjEPX0uxjwRuF4w54pxEbg81qS3QJOL/a/VK
         dp4dJ/u+rDZijJZLv2Bb+A+Gy+zrqGpFvgQiMZyzf9ALO72FJvGBHPAbRNUiYR9DMUJG
         hhmGZ9UH7aCWQvVhj17+LUYIYRiqVcU2iqHDjFrdLoldnG/yPKMWBh5ZTpTeKiKQi3RG
         VTyIWNmC7830QD3L6wGB5aGt1imejnwze+mTL/gHDKF79zwnSxSTXS4pZTDEkYpyRsYI
         nL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360061; x=1793964861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJXv3k/n7KXs20ZCrHngIKsI9Ju9rPGpQzEVjeHfCaE=;
        b=KrbJGVHzuTw/G+nOWCoPDnzdH0EhSSpLvBZm4eAX+xJxha2vCPpy7NqvOTMVIYa7G8
         htHie4H4oTJTyMMZWZKHfh4+/TwQ5Jt4jQW0YQ3e60nVNrXqbVNeNg3pxuOmeflHQXET
         lVhQTb2559Y9byo9bmktaDD2y1rgXK3rCw3h/FP5h1SPenrtZ1SJj7T9/RfDzuaK2RTo
         uXlRKh/QQtVAUZPZzWpbqxeDiUs60WNtmiAwOaKqCKTaZO7mzbj7f3FJ6utZaP7J/wqB
         wKA1k9xFJgEIp3lZkFu65zHHAEgielKXXRnfvMzQwgw70wsGNwZvFv9wr32vl+y8d5OX
         g4YA==
X-Forwarded-Encrypted: i=1; AKwUvBwyAePKN42JiqymNi4zbB4jLghDqEi4vLBkNnI/DrEoJZ9fNWgElImIx2MAjDRIM7g8de+4MPgpM7yU7QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK12ElnmzcqsRyv+tXwnArb4YkoRHYmCPD3Ib3EQoCUUAc+7HRt
	nULLlXc0JAEAuQrcnjYyVuXA0KlTjMVbAmXitOk0eMYrPSBKvxB8M21MGcZ4BaDCqrkzdDSydMg
	n2xG2WxRPBg9lHLg2iZhhISiIgE2pDFvJVFJhzbn5Kw==
X-Gm-Gg: AYBFou1LDmt1nkMcN4kvJfk3GHsLJuHGJR6CXIltmnZvRs1ca4loO49BXq4sFYM7m34
	bks/Oi6rhbMU9CTEkFbULTGPu/retZgnRtoQz0v0FqzRfNlYlOGT8EFx39lt0zy2zQLGQRMpCbh
	ZC/1npZQSOuY9D72UxFU9bk+ZBGdJNI2VHBVA2uhSfPz2twYTKFH7s6a0BmjVDe07a3QfwxhYoW
	buuSnX1xcpi21VBbSh+dwJApXL1ZBJNjTiKD0ZDuJjBipaungb4/tagHQVQ4WaLjyb3zZZZLOZo
	0hTGx6mxp5SmQQfVfXIxXp6O0s45ggJzhHg5XmlIzN/xSMpN86MoxgwQ0nGD791YbdwV+mL1Ms9
	G+0TBmNs0MHQ4UmzFytlgWzpN+SO8MoTzcCY63qESyS/J6dOxK5wdUd1MztGHYYj9YpYgLos=
X-Received: by 2002:a05:6820:221a:b0:700:5222:ca29 with SMTP id
 006d021491bc7-714f2a1abd4mr1049728eaf.70.1793360061203; Fri, 30 Oct 2026
 04:34:21 -0700 (PDT)
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
 <20261030091743.GB27096@wp.pl>
In-Reply-To: <20261030091743.GB27096@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 30 Oct 2026 19:33:44 +0800
X-Gm-Features: AclHuK-N6QpbeSEmhZfwg765GOgC1QPRQIYNjXEw7z2xfYb6Cqp8FGOOTtNKHCY
Message-ID: <CABOQOSX6mBCtTTg9eJX665t7tj65jo=9hVTgr7pmFRB6csG2Yg@mail.gmail.com>
Subject: Re: [PATCH wireless-next 6/8] wifi: rt2800: set the mac80211
 fast-xmit and aggregation flags
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 17:17, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
>
> On Thu, Oct 29, 2026 at 09:47:47PM +0800, Ho Jie Feng wrote:
> > Enable AMSDU TX/RX support for this driver, which can increase
> > throughput.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > index 032cd6ac345f0..8b4458a74d33d 100644
> > --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > @@ -11861,6 +11861,9 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
> >       ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
> >       ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
> >       ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
> > +     ieee80211_hw_set(rt2x00dev->hw, SUPPORT_FAST_XMIT);
>
> IFICT this flag will not take the effect since we have SUPPORTS_PS.
> Also for WAP3 (802.11w) we fallback to software encryption -
> that will prevent fast xmit as well. To truly enable
Yeah, that is true. I also have a patch that enables hwcrypto in that case.
> fast xmit, I think we would need add hardware encryption support for
> WPA3 and also compromise by remove Power Save support (which is disabled by
> default, so that's possibly fine).
I think maybe a more general patch to mac80211 to enable fast-xmit when PS
is disabled and not only checking the feature flag will be better?

> Regards
> Stanislaw
>
> > +     ieee80211_hw_set(rt2x00dev->hw, TX_AMSDU);
> > +     ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
Although I think this flag will still be useful for this patch.
> >
> >       /*
> >        * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
> > --
> > 2.53.0
> >
