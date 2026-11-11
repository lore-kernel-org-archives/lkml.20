Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362419;
	b=h72WHz5FAQPOvMwFX4LGGCDS5GWlzIBgVVl5PGTQk33ebF9STdiFigt1/fQifz9SJWDZ
	 rZbrXLnkyAhzcR/UEyD8X5qkSW5aVm6Z8383IiE/nYeldM1tIhD+KDmu3aOemWbl6T+FE
	 Njf8K16bUG6NMW/1Ul1T2be92fvIU6twcalFCMJCmCf09E0CMiUbmXqhBB4OeXsCgDsDN
	 YTGL8f4QZaX+TiY9rP4Um0e5BsmyFUNteCZTnMATAy4aFV3hzPEE4MjB5TxPlqUgtvhoh
	 dPgK/+eBAy+V5MBsPmV66ySbovefNp9sK+bmVPSmjHWybTz17jlUFTg1rAjtBZ/2UXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
	b=yEqcj+nYy6XC1gY+2HGFnPLAddpco6eU7EDEmz03LnzAtbGYewKHPhEVZhA4mJIMK5OQ
	 JDwd2P8LQwzepDH+QzXTVyXbZy8Daio4NnHG6C11gJRekJCHD9Mtw/gl/apn/tXykiH1P
	 e0KUTGZGu/UcrUfjHjvGqPwNqzDAoIQ9fIe0CLMAyTCnAMYEVgeakKIKTIFr6K+jL1k72
	 30vM70eRbbLq5av7eJSecsUc/tItV56G/jGikm86RkwhO+eb/1ThOvrEJW56I4VgHKf3y
	 n4hhAXRnRqWSM3/vm0y+df5rIbjH87HOmlFroqcXofHgGCJlF4Ms7csycgUDZh4i3jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvRxWyFG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E7A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvRxWyFG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5474209eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362418; cv=none;
        d=google.com; s=arc-20260327;
        b=CqcFjI+DpDbRtBRIfLT+UpGzXjD+/CYQtPUMLSR4Cx0CtoHUeo3i5KrHYzuHBRT9WU
         qLFAQhGohoYZGYgd35jV7OD83jYZT1rUxnUKrW4/s0boJ0cProbm6qNrBXIFxdjSNQUP
         zkhXHldL8F9Gt7kQAYZ9RUKQE/9ailooqxkmzlU8pwrDwC32nPyuetRRRtSre8mnKTAG
         9dCppFmM88XcpxJ+iFCiueiNnIuHy0b43GFToemaOFvFnKJMQYDoSIdBHmkyYYy5lE5r
         dlHnTX/GW1nG8p4uhTtZ9Bpc/0CPrc0QqLRQp1WXY3VB4COq1KZcx3sHt6czuPY1SuhF
         j9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        fh=ceraF32uN6Mdpv1eV8RyCOy34pLgqLDDOl0VjXBfmCM=;
        b=TBpKFQbzG2qdnCWIQR+t1+f/XPrbpM6AxZ4D6NnkoVBVCpN6Ly8FFsot5Xs8RFxEaF
         S1CPKQG9aKZlr0DF5z5DsTpwivhAktNEUDGtmgCrnrwjCs6Ti340yhjfBc/3ohbNJWaT
         y4zlwOH2qLX4eVnVBCXN6pM00OxSe1+0a/I8etZuKB29co262k8kUPy1HIyo0mN56L3w
         wAqHTcxtgcRhqUeqy3a4PmV83KyfrUpDW7Djjxz0StLTRfoE2IYHCOnDrqjm/KtCdu+n
         shBGQY1PVYBOMi0vR4wLEDoDurN0CabzDkRBZ8/5RaH0fK17ECfLUp2CxAoTtEeZK8US
         6aDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362418; x=1794967218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        b=bvRxWyFGwXzDLRtpU1+Z9VJNOOTsNT0608bHW+RTaiPzND6oFBDN/qWqzndR17T2BR
         KCn2IxPjarwRv9oaQoFUKWSwijRbWm+Ow/iXOOOwmli3lH/82MX/KzxoaWKZZ6i+8sH6
         VSE+pL9SIqnv3FAUOwjgnW8gmHuWeCZrlEpJ23fPmxEg5iNQEDg/aT7fk9g6AJbLLIlE
         d8n7kLo5VHvrtvzQZMdpAS/M2Ts4CtOTuV1imvMhxXAj3CB9Nh6Qjliw7Vqa7KGEQJBn
         tkNmJAwzRm2nQGjbRs6YP91uy4RcGAA+nuSwDAU97BQeflbNLcuTmOVJjt3Wizl3IkyC
         3W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362418; x=1794967218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtC/s3IFvRHvWLM5ctW+2r/vaRjYMyyM7FY+73RqcL0=;
        b=M+cFt/SM8vNwmX0gGCzl9dW55pa4nQdEVaSfwxUjMxugTKiumY9n8rEw/ttE+B5zjB
         GLB72oSsI2QWWyA4Yi5iyXveZCQxuTP/lfXuNNqPyvx/qsh27UMbbtOmx+NkUMRsiSyP
         g7Pu6XZRVhI1Fcd/g1lUzZ8endneUsBevUp5QOnQedWgWq0B75xzDqZKqt+lx5wt549g
         twyMDnJvDeJryitgl+uKhrF/3AZF4HGduX6FoGO6EJF8XZlQQQG4pP4ZxrxK0SzCflT4
         k3y7LEY8K3zLMPJs4H+rMQ1hg066050/RL1kyInpqCBqe6oJJRs/fLhvnrdxuOA0kQCX
         rDvg==
X-Forwarded-Encrypted: i=1; AL+hErEehOJPfYqC9n3mL09/rR/FUnKvijAjVIgRYCF4LF3YPMqE3kVoJro/+1LWi3uhpm1ceyseBJhY/z5QHJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+COMAFtbbj6Uq+RjqxmLvV1BI8bPl3NUbggGTh2hd81CUwp04M
	Ywow9lrxwJDZes7s2+DwR61fMjjtPZd8doLrxvYFWSr/aG2YzK/zvmslMD1A1wtljvOoOo/P27k
	wHoyUVOvu5emURaw4IUApHaEAaQY+rzY=
X-Gm-Gg: AYBFou2sPiF18waSL5+9XNZ76+6yKF0jCsI6HZ0HD0f2LbG3O3IK6+RjzpiHJfiGJVu
	3xS6AFFhlicEQ8BVXzMuFv4rDTkgAvj5t2uw7mnLo6TbG9RDm31ZBmKJCTpCnl2yT3uC5W5RmYm
	4M3SRg712spRKuCYy482D637wlxsf9wYotI5tgVRwX+jabshbZykocSwylHfa5NGNGl1SIo28df
	5SN2DRZSQwB41GiyCL9GA869xS+A59tgp7mR/tXMh4PYhKvAByd4zCBOoXsCGjIqKnU01XSSuZn
	bvmkG79KRAt5VZwHfEBwbOEmn9Qral2OfScEuEyrXrgtWuzVt61/tY7BZrA+RKEI2Z03YriiLj6
	5m/vl2MB1/qDAzfk3gM7hZ38vrguonHmcxtOr338WxHVtCa0uU7H0ZADE4liVahIm1aBuTbP8gm
	cl1D1b/6xlE6rwBrHhCvH5OXfKAoM=
X-Received: by 2002:a05:7301:795:b0:36e:e349:f2cb with SMTP id
 5a478bee46e88-3768579dfa3mr1470248eec.19.1794362417519; Tue, 10 Nov 2026
 18:00:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-smsc75xx-rx-fcs-v1-1-4e048bfc28f3@gmail.com> <137b3cc5-7077-45d9-8ba3-ea4c584f1992@lunn.ch>
In-Reply-To: <137b3cc5-7077-45d9-8ba3-ea4c584f1992@lunn.ch>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Tue, 10 Nov 2026 23:00:05 -0300
X-Gm-Features: AclHuK8ROedb8-shxTvKJCqZsFUqIT-32EYB708a8vtoB04n-gGoY_3AV2iFUVI
Message-ID: <CAOCBhwFSS_weykmFvmHQJ0VuMxW-dxHytBn81rn47wfWwnsV9Q@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: smsc75xx: reject frames shorter than the FCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: steve.glendinning@shawell.net, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I assume there is soon going to be another check to ensure the frame
> is big enough to have an ethernet header? Can these checks be
> combined?

Yes, that makes sense, thanks.

Looking at it again, short frames are only half covered today.  For
the last frame in the URB usbnet drops anything shorter than ETH_HLEN
after rx_fixup() returns.  The other frames are copied and passed
directly to usbnet_skb_return(), so a frame of 4..17 bytes (0..13
after the FCS is stripped) reaches eth_type_trans() without a complete
Ethernet header.

I will send a v2 that tests for size < ETH_HLEN + ETH_FCS_LEN in the
one place, which covers both the underflow and the missing header.

Regards,
Joas

Em ter., 10 de nov. de 2026 =C3=A0s 19:41, Andrew Lunn <andrew@lunn.ch> esc=
reveu:
>
> On Tue, Nov 10, 2026 at 09:03:21AM +0000, Joas Antonio dos Santos via B4 =
Relay wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > smsc75xx_rx_fixup() takes the frame length from the RX command word
> > supplied by the device and strips the FCS by using "size - 4" for the
> > allocation, skb_put() and memcpy() of each frame that is not the last
> > one in the URB.  The length is only checked against an upper bound and
> > against skb->len, so a device can report a length field of 2..5, which
> > gives a size of 0..3 after RXW_PADDING is subtracted.
> >
> > size is a u32, so "size - 4" then wraps to 0xfffffffc..0xffffffff.
> > __netdev_alloc_skb() adds NET_SKB_PAD to the unsigned length, which
> > wraps back to a small value and the allocation succeeds.  skb_put()
> > adds the length to the 32-bit skb->tail and skb->len, which also wrap,
> > so the skb_over_panic() check does not fire.  The following memcpy()
> > then tries to copy almost 4 GiB from the URB buffer into that small
> > allocation and writes far beyond it.
> >
> > A malicious or malfunctioning USB device can use this to corrupt
> > kernel memory or crash the machine.
> >
> > Reject frames that are too short to hold an FCS, as lan78xx_rx() does.
>
> I assume there is soon going to be another check to ensure the frame
> is big enough to have an ethernet header? Can these checks be
> combined?
>
>         Andrew



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
