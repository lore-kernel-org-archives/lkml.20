Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BDC368D66
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453304; cv=pass; b=DZoUJrMeV9xY28ZFlGMXTMC41z8nz4UzltgyL4kNsbuqb2xR/uZdOqKwa5YtbvtoIC1TR5oPKv3zP/6RbUD+9vFWyEgboP5ZybAvgIqVWlso1pL/MpOYWMTnNSMn85nGlMypb4BulP/LFM5ryUNabGWyWSoCyU2xinGFRwQU9Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453304; c=relaxed/simple;
	bh=j5cJn449Zupx/yrvwZ/FfZPDNPlE7FEdRQOOPFzGeco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucHAaNOVQCxyhqhoWKybB6Nrtp+E0wkTnIjlIpPDmik3gunecT7w5mM7sm8naYhs8ZKQATBegQ4HR9YQ28XjaojiuNYDXT0dmIOWrdr+H2VPIKj0v2AkFH/l6MsoSN0P/h/gm2K3RYYR/oDzcwelmRPDqF92ni+OpUtIWa9X08s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZml13t8; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZml13t8"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8a8f3f7ff7cso6630307b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790453302; cv=none;
        d=google.com; s=arc-20260327;
        b=LGFnY+zKpnQFTkWsn3twtbvE0mnW4+S2/FNjVQ0GY9SSlwqHwjRJ6F2ceIFmxrSsb8
         +6bLO0U9+dLLXBljE8bW+o1YqRvXgRk1ZZbtiyE53T1pxZwMd/lFnDEksyNXmHEbRRYq
         6S9XPh9vF1RmcFBzNZc65Rxp/2jUtMcHsU54a4lfv6uQHrr2+hjU/DWb81WB6f/YCU6q
         kCDUsEyvgIZmdiZNGrpK9712ZPnUyfwfP2+Sf/cXUJTwKOgQRd2rNBcpGrHMfiABk8gH
         ZEy2wLjukwuHgwTlVg02oAde8XQYq64Qrb52NT1kRweAebToESLLrsDe6YIoykYHmlr8
         jSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        fh=8Tc5pE7vRfP8lNVchu8U2DK51OoHFdBBjXy4jyqC8GM=;
        b=m1pq79yMHIepleQCUilGgHP0xuW1U82tHnXMi7F6PkmYftX9SIsyF8WMDvqGFUNqxf
         w4koE7Nl6qLBmVYQYhMmOKEMUshBOI/6e2eA+7TdiZWOMTYO/2MkgFIbg+n/+wJy0xRA
         8KF2axPjPALjYhkl9Ig7Z2Itc3YFHAhtg7wPdJglPcAkHVAYPZ/KLnGNK2LVWPY8xZln
         u05M4lo0m1XM9Nba7xD+icUU++fSJIAk0LzCElPhOAcxO7fbtR5TQ8k86Up9KtKRYNUd
         QJ+87EirIo6CiVvyTepFvWWB+THVdOuWsyko71GBogZDRQr5SVHddaS67o2umeaX8KnS
         bfyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790453302; x=1791058102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        b=rZml13t8IhfyCFiCb/mZdRbaebj/qub41KHRniJ1c26UmGtw+j9jwG2zhU1xy5qOXi
         swYzc6doKL3t9ckq53t+RPMlHXZ9EitNyeOcOb/p5hGhPN8setFhCDBhkYSRfyb1UmQ3
         Fe1wKWGo2yX/dXw8tFJJG4+/0u5vRJsksWjqgmC/Q/rKSQ8O6F0/BvcxhefP1vOxSibi
         ewXB7eZhSpbxfJEC+6GU4iIJO75vwujCZY7tuVo6hezz7EJMk7SPGH0oTWfinJK62rGN
         bw8pTTwUUIm+tLc0M6JWpEPrOCAbtOK1pDD0H9Uqe2OzP1qb6sNNhkXQ7aKRp2PJHkcH
         wBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790453302; x=1791058102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        b=Z38gGlssHCuveh5BxjcyjMwKXQEceZG45qzovhUC6rSk54Bc6I+toLeILOXnzKzX2g
         hQozyatAgLZ2aoJ/aBAGlld0+BIqhzxNRr4/b2CV9vTAl7TZtgCBc+FgGj8Hyog9I1p+
         Vn5KpQUXDD/dCQGqshvO0tLxDjCpS9Fj5shSXVaEDfsKmBWeMJ5FW8YEE9qNpUGe7bdp
         E5I2HjWj13tyIRn1y+jAgxiSXyAj/ny+TWaE6tEh26U16AlPBe5MoUHuiTFwPfkEefCY
         W0owfprFC/UWOZFcGly37V1MQwoCunG3STttlrvi94SX+FGuqkXo3bRFRN5hqZ1BTn5S
         1hfA==
X-Forwarded-Encrypted: i=1; AKwUvBxMeYGFSnluuAPmLJduP61ciwRIwO2dMa0sztyw9zXNRtA0zJiKCU3HhhJiEv7L+rm4C/DOfdEhTJqEWkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL/jR5rQab9MQ1/7NKvp/YUA6mTmT7V7khLS1zj+soqPeoPnuC
	WnskaozbqyjZvO0u1jwKBN5bbG8dt/xzQsGEWicfO6nwVNZKh3n54kMBY3QK/FywKTFVHJSnvJo
	Nwzdcsa9RBW9Qt5Vy2G0HcGLyJYnTLfo=
X-Gm-Gg: AYBFou0hE1wZ7wikOasMVCQaz3dwfXOHSIiJ40HWzKnrLDzK66DOO7dSqO7nKlWHERg
	cQ//2++TBhRDz4rFCNceAROF3tII072rQluMxQe3mG27DmR2ZRZXxbtYCDhJ8lESkuzNvQ2fgJL
	pOiQjNj5AsdtNAZ1bka4U7NG5zR8j1yR1SfEiXTn8SCgH3rN7EBL7bE4MEbj90d62GsNsfL1pue
	SAjrbagAivwJ1u8w//AF62SOuG5C5u6npwURR09s6N4GR7tgvAfGwvdallVrXOg0j/APWDlSP2e
	Psh62JplSNwW78EpUM5yMDPd+HdM9RgTUHrn6qOyVMZVwaKrEvzv8W8=
X-Received: by 2002:a05:690e:12cb:b0:674:6809:6f15 with SMTP id
 956f58d0204a3-6746809704amr1146281d50.0.1790453301090; Sat, 26 Sep 2026
 13:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923015631.44973-1-ginger.jzllee@gmail.com> <arZUjd5QIs85m_Wh@kekkonen.localdomain>
In-Reply-To: <arZUjd5QIs85m_Wh@kekkonen.localdomain>
From: Ginger <ginger.jzllee@gmail.com>
Date: Sat, 26 Sep 2026 22:08:09 +0200
X-Gm-Features: AclHuK-I0JLVJ75bEhvu7qJACiRAut3AQtqKovfR8PWHXrTZb0sdeNSDLJWlRrk
Message-ID: <CAGp+u1aVQpqkyxFv1p897FjQMm=007FKiNBVDtxzU9pp-oJkSw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thanks a lot. I will pay attention next time.

Best regards,
Ginger


On Fri, Sep 25, 2026 at 1:01=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ginger,
>
> On Wed, Sep 23, 2026 at 09:56:31AM +0800, Ginger Li wrote:
> > ov5648_s_stream() updates state->streaming after it has released
> > sensor->mutex, while ov5648_resume() reads that field with sensor->mute=
x
> > held.  A concurrent resume can therefore observe a stale streaming stat=
e and
> > leave the sensor in standby while the software believes that it is stre=
aming,
> > or the other way around.
>
> Please wrap at 75 characters next time, I've fixed it this time.
>
> --
> Sakari Ailus
