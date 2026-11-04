Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815063;
	b=NJITr/N+VuQBqxwbFX9Pnh9iFXhSwTAm5uU+TtwLtlGsmqGUTNtnt3hTxSfe1CbShEEL
	 9PR8Mglhf0jIpcIWFTbFZtuxzFokZ6I7aYvmNPDk3VgzKDIhqgSdoViTxWdFenjkZ2gGm
	 PFhvVt7fK4hhCaLOo2xgCXEeeVBfN+KtpwYpxxuA5R5qhySNXvSK6IbQSzBlNfoSzuYMg
	 Bl+f/2Fl4ySw0NN88Ks7hZaeU2ynYdu+fSgpjQpwOu0gzfGdE6CQeIMsda+TqAoPxE0A6
	 3IKnSrop7ccwbeZhtbEGnY2bKAkaqiJonwnOIIvsAMoPLtNsmLZKpzOOc45dYpGVsIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=otW91gbXc1YAQNlvjTbYBKLpt7tQ412lK+YFy/nR2CI=;
	b=K5yg/itQwqK6O2dkQDhiSzxHewfnH0XVnHY1zwGn0nbjZefdOlnFF3QKqa/T2Yfu/Ma0
	 MirsCtnnAQtLKj9L/YUsOQcqadmRWEyEpKWXtwCbz7xKZbmeyBH7uo6Rb523vh/sp6Rht
	 oT4UnzoTLcvjJKroPSmJbPrwoFZREwi5cGfws9GsGU+pl44+bFlVFrJ5Dgkt6cXoAetNb
	 DNgQF1ygU6gJZcfJamp1R7CboxVNdFk2owW52QP9IP9xObdNbNxzJvAZCBN6fWHgOkvQe
	 aOKYQfK98DoG7EYghayIWHVaAOUPyw55dmVeoYZDkK9xWdL80qMBr3rryQxO1HqHWSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nkPWhJQ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.6
Received: from mail-vs2-f6.google.com (mail-vs2-f6.google.com [74.125.227.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02916070B17
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02916070B17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkPWhJQ/
Received: by mail-vs2-f6.google.com with SMTP id ada2fe7eead31-7c03d219375so1191722137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815062; cv=none;
        d=google.com; s=arc-20260327;
        b=L8YJXKdMvqqQiE1g2mAQWqfb/wRiIgL2MJNw7/J4MIa3OTdowPwzWYlBlbh78rYX65
         nOTJv1dFmXvT8xcQLtifp4FCweqINVgrsoDh2kNRNguGVCiiYKaz3fJED0B8cBPBUXUt
         Ia/J/RWtPsv7mjZs+5Gw0XO/wkgY83cBiiFdivHsdxxCLXKn2l+bneBunfHS5SVjCbDO
         E9Gu7IaMg88ph3yH37J3J9zdKM+DYs8H+nHsXG0lSca0pG5Cc3HeU5ZBfDPdk5gEcfXk
         QIFDz686B+2BlGlugInDpwYCeS4XiZFYc0/2Vyaoz4/gMeZF2UE0HH8RIV+DXHWW9Je/
         dppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otW91gbXc1YAQNlvjTbYBKLpt7tQ412lK+YFy/nR2CI=;
        fh=mZIBPkiIbe/wgCNPNlMOCImO9ZbZYBCyUYXG55x44G0=;
        b=XXL5lb99ZrrjqWExjNgNhsOuUcOJx2n6wTeQtbjD7YvYOzmKWybzzHlz5mYHJy69mx
         NKLseljKhAHWwzj6AQaGdzaOFtYVPB1t4HVD4joot2o8uMRPqYdMgI7IP/xYYBOWSwFi
         LX9wSg2eP866f+O5s/GuWL6ljT7kfDv+1+H7eRWdiKH0XQxKLMDTu+fE6ExbWL/8Vzko
         KSnvgBR219+dgx9PzHIgX/p5Ib+2bMhDFuZt+P8NhzJySUNaCKn++yvPHJ8kMcEntF5F
         NGPVEkae6Y120k9LfvjPjSqSSfEsoUHueRpkQcFD8Vu/dF3dzuVr++cp6ejcWOMvSE4G
         1d2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815062; x=1794419862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=otW91gbXc1YAQNlvjTbYBKLpt7tQ412lK+YFy/nR2CI=;
        b=nkPWhJQ/AGBEuuakGdWoGoZyAlXVuxtkNXetPBO+cXFXILs12Ly5SyTY2jj7XmhW0u
         gLJPBDBwEzmgFwVNR4/O/EGPH7isDPGAAmFdeeUMnN9GxQQfZzUtt/yXu6qsdCTTWM6K
         jRD+dm8r0m0iSbnFdQ9QhLNUjwRmFuSuvXzDr8jrokOoGYpPWUvyPAJNobCbvNBcTw1b
         cYeacLpxcEnjDlBDjyIzwh4fX8SZM2yPyGNM1vSKypCly/EA9keg9mjBNwFpQ7xmbm4w
         uGHriz+WT238DmLKcw4Wd51rUqfQEY6SM2iSMohbI3LTaQa9amZzNJc4/eyX5dHwCwN4
         z1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815062; x=1794419862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otW91gbXc1YAQNlvjTbYBKLpt7tQ412lK+YFy/nR2CI=;
        b=tULpIEoZoAO1ka1tBE/mC3Gbr4lzkvUXQH5/LtF0yVQe/fWggqpSwpb2TgyfV2z7RS
         51NeR+P+wdlu7ZCxXaVxGU+qtQWWxrCw98n3c3IZQyl/Le4bhZoFhuTukLrL+1Q1PCvd
         y4NdRo/Srmjml06tIuvsvZTzJJi2LHBdYwDGz9mJ64HPXGxzf7vumVmUVtpxFa1p80DW
         5LyJsAzmmhZ9OzTY1/Lk7Qwy7WsuzPOPbbGSIY6qNuY/4NV5bsRw0vh3PWoUbvVRtfF7
         Vw0D0PxVxDviUgpMa08O0QurXfZSq3rpgg+ZtaZ/fXziuZKpT3SuHVhqTvbX29Ef3ToR
         V/5g==
X-Forwarded-Encrypted: i=1; AKwUvBwmZ5JFNSkBXcGYZqQSvo3wDwR+/eCSoQZO2240uKwJ36cGrkYjc21JSquvf2l3hO5HEg6tkRI32taUv5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o0+a0oQ/KzXnDKsH/yYUhAG41+XIfXmknKvRGV8bqeIX3zNZd
	G9VKyE1JPHnXcukmQ7OhvksZBR/4C42h531skrKujJFgoASpOsySyR012aoX7+QyuQR2oCa3PfP
	l8GATWSd4LlczYxWKlyCPrYutETyNFzs=
X-Gm-Gg: AYBFou346njlTELMUMp/NjIxi+vqppoomL8u4O8d5LxzNooZielqwPoXdIh3XhT93pL
	03lNrhpdanr+YoKcOt4EyMCXa4veYsy4xiOheGOIyG5+264QEj9Ar9xtjVtszg+dMZq64reQgam
	DZOpggcxvfUYqXhS+Rpc9YnjDrwByxjkeX6un/UsVh7jS7rTeKrcB100amrw/4FVlsI4uKvquOc
	tnTrEJcJ8bGnoba7gj0uOL90665WF8zello5FZzZZxjToUt2E5XHG4Voe0T6ziuDHUGHIiq2JGI
	IuXbH+hkWgUenXwuOQiB7UG8xX2Bq03lycTAwofawwRSVP4TbKSkwZap9oJDqjvcHeWewaHY4ZL
	5a0ju1sIUpIvhO/KQ7mRwM6o99lmlIyLgZ039teg2zzWi9uoCb4QcoSIpGyNwxG6g2k9B7NvPi6
	WobEi7+WrCC4P1qTEST6fetB/CiRk=
X-Received: by 2002:a05:6102:374c:b0:7a6:85d6:84c3 with SMTP id
 ada2fe7eead31-7d072270e87mr7248597137.3.1793815061671; Wed, 04 Nov 2026
 09:57:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <WnzOhxjlW7w5jwpSIQmUzrvduOStpoX2h3FS@robsoncassiano.software>
 <20261103075845.GB3882@lst.de> <b0824cb9-e678-4bb3-934d-a1743b164ca8@roeck-us.net>
 <20261104090111.GA30750@lst.de> <3f48f63e-c25b-4361-9ac7-f25cb5082e2c@roeck-us.net>
In-Reply-To: <3f48f63e-c25b-4361-9ac7-f25cb5082e2c@roeck-us.net>
From: Robson Cassiano <robson.cassiano777@gmail.com>
Date: Wed, 4 Nov 2026 14:57:30 -0300
X-Gm-Features: AclHuK8D77soGc8eurdVd3k7xx9vsXPjC7p6i5jgDB3ZlIKHDyFw7fQ8cmt0yAc
Message-ID: <CACh1udi5h49ir-dDmPOP=usu4SJegsxa-Us6yV5BeVatj=gj+Q@mail.gmail.com>
Subject: Re: [PATCH] nvme-pci: add NVME_QUIRK_NO_SECONDARY_TEMP_THRESH for WD SN740
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Robson Cassiano <linux@robsoncassiano.software>, kbusch@kernel.org, 
	axboe@kernel.dk, sagi@grimberg.me, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexey.Bogoslavsky@sandisk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are completely correct. I have now tried setting up the temperature
limits manually on the WD SN740 drive, and the NVMe accepted them without
errors.

The quirk is indeed not needed, so please drop/retract this patch request.

Thanks,
Robson


On Wed, Nov 4, 2026 at 11:11=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/4/26 01:01, Christoph Hellwig wrote:
> > On Tue, Nov 03, 2026 at 05:31:29AM -0800, Guenter Roeck wrote:
> >>>> Mark the controller with NVME_QUIRK_NO_SECONDARY_TEMP_THRESH so only
> >>>> the sensor inputs are exposed.
> >>>
> >>> Given that this is an older device I suspect we're not going to
> >>> see firmware fixes for it.  But given that we had quite a few devices
> >>> with issues like this, I wonder why nvme-hwmon can't detect these
> >>> obviously fake values instead and we could drop the quirk?
> >>>
> >>
> >> Question is if the quirk is really needed. Personally I doubt it.
> >> Normally the thresholds are simply not set. I see that with the NVMEs
> >> on my system (Samsung SSD 990 PRO) as well. If I set min and max
> >> values, they are stored and subsequently displayed correctly.
> >> That means, no, the hwmon driver can _not_ detect if those values
> >> are fake because it can not distinguish "not set" from "not really
> >> supported".
> >>
> >> I have not seen the patch, but I strongly suspect that it fixes
> >> a non-issue, unless it can be shown that writing the values has no
> >> effect.
> >
> > So should we drop NVME_QUIRK_NO_SECONDARY_TEMP_THRESH entirely?
> >
>
> No. I checked the commit history. Commit bd375feeaf340 ("nvme-pci: add
> quirk for missing secondary temperature thresholds"), which added
> the quirk, stated that attempts to set the limits on Kingston NVMEs
> failed. That seems to be real.
>
> Commit 340f4fc5508c2 added the quirk for Wodposit WPBSNM8-256GTP.
> That also seems to be real since it reports an actual failure
> when trying to write the limit.
>
> This patch is different. It does not claim a failure when trying
> to write the limit, or adverse effects when doing it (which might
> be covered by NVME_QUIRK_NO_TEMP_THRESH_CHANGE). It just complains
> about unset limits. I do not know if the submitter actually tried
> to set the limits.
>
> Thanks,
> Guenter
>
>


--=20
Live long and prosper =F0=9F=96=96
Robson Cassiano
Senior Software Engineer, Simple Software
+55 19 9 8384 6616
global.robsoncassiano.software/
robson.cassiano@pm.me
