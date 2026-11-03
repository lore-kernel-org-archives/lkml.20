Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704097;
	b=i7lCXsMTReUlLg862pE43d44Hxf9bYeWu8jz13ES69lMMqo5wGUnyb1mgDigtFrhUhtJ
	 /mjDg3zO6K4MKECZesJQBvm+sSXv8Xq2icTma+3Pg4hgvK0ZLHD0v4Xr+zjhDp9zRqTlA
	 vumOjSemv/9ktc8mh/yfrjFG1NfloqXeO5hIpe3OIMTns3+TbykVOeqj1jF+mcd6M8uYq
	 kQ6XDrbuBZP0iJU7J6LKTQ1M8D0vE3jYpWVZMMK7FPE7M/TEAlqyButVeVExFhYmiluKV
	 568YIphynPkkGFI1XlQYyERsJxHiPL7DlmrfUjiUXScA62KCzyCp7eo+mxx8Cz1+NdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
	b=FVEZ5hx/nQ5AP/EG44xnP2k0Up23doJlpfm1G4o+omlmz4b4ywcH1WoHTGasJt1h/BoR
	 ikpudk14DUmVdXUhKEorVTzuywenebZEUhh0QtTfTI39Q0zVbivyTGZ6lduKLLg9cMqWd
	 H7m6e6ikFMbGo/D005HWWcpzl4wcB/aTdQ7un4cR3Fj3pBYW5AmNdGNJ00c+fpVelz34B
	 wmgGvr9kkvnrX6NrILPGzUW6k+EahzQpk1reQ0X0VCFmljmrhKT+li7zE4cQz7AxdBeTK
	 QkrowttJxq0XzatvHZ0X+SC281sUYaa9E5WonOdFuHLhND66j8ANTwhW65DRnWTQ91w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nagashi.ma;
	spf=pass smtp.mailfrom=nagashi.ma;
	dkim=pass header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=I96VemwD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441C606A825
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8441C606A825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=I96VemwD
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso582846266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704095; cv=none;
        d=google.com; s=arc-20260327;
        b=chXJzK/hW1L3zt9dW8hbhKGtWs5sJBOP5+Jdh50KM+nrYOIMHUoKTXbyo7gNxYJvuI
         28ie5W1Wjk2ekhlFMTlliPIG4H9X2rMcZx5QAgIce+0tivoVlOlbt9uIInJSh5qstaL3
         bHeuT58jHEoz/27fTizJfNb/BF0ua/T48RhPcEQFuNr8IZOOE5DdnBMlbvQLD5qeZNpa
         H04Ec2NlB3RTuwBcZ7imrfottV7fBIiCY6s4OLcj6l8G52Ytn4SDpTdLe/rv8fuzuf17
         G7KsQ902r50d7YZ8eKafSkkf9vrtnPMfBU28wSvvZd9+SBuiMK9ITJEZ3QQpctfpjSML
         riHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        fh=NU/jyKsynx/ven7YQIyY4SWIU/2RmeThSj51yWlPCYI=;
        b=L+y4PbwaSyCbPh2J1ItZqlM6ztwcJZjtK9NWj175KFmZNEsn2tJs6Q1v1pDJAlllRf
         eUaZVOo5IfQOwBichOLN4JCAmCY1QfdG0ImYMX09A7JRjwwBId3x0l9tX+kJNSL1lV07
         9vD21QQc5yKtHctK4qMfZln9sX60MI+TzTCwX6JJRTKBDukUL6Rt90unFraqBQ02tW2C
         eILa6aAT0ukbi5RmpS7UcwI4SBaSmAHlz3y18t7tIELIZMQ6FjiXS7Ym6WsZwvCVGn1u
         n/e6yV7wS0Jf1T5Bu0H+aldwCHX2uKHKGo0dLT+kKVPhcOZhuho7OTrQ/ZLwONKNwnQ1
         ChWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793704095; x=1794308895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        b=I96VemwD8UABTkS0R80cL5UJ+UXdgwlGOs2uVLe+HOw51zymBi1kiFDDbjAflBNFri
         AMnj40ZNXvXs0vKhzB2htENOXORq1TvkDep3e0z8m2GywBWQNrzY1iqdda/ehL8Iotq9
         R9NImmkPoneUMLL1tElYwvwWQlrpziFmNd7akvYkenYgB3QHLt1NkFA+KwtCNrzw8a4V
         VKS60F4IEONZBhVLn6tQYMHvP0Eo85ZYlrQxDsr4XRu9r9pM6X7bmnld03n0Q7lZZYPg
         4U8xq7dHrMWlEl/wuXUqC1KYScVCTKkVahmISNx3j5a2y7O5ECcME0plf9xxsOYw7bhH
         2q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704095; x=1794308895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        b=xPR9EP/8qvtknKBddoxiM3qHDvopCpUDXmc+qqrmECFzot8mAGE78sSM+EkLtvy146
         9dI6x8+G5IcfVGV29MVts5h4BmaVAwOT6UCzUcsyz6KMPT7ebEB5b0MMlKZnBvuJPTtC
         775gQFyUDW9xY5gcDoQq3i2gA31u5cnRKZPd5wO9DN5UFvLCrg6UyjCv7USegcFn/e6C
         EYrJQQXdUUV1XzPw0558WAMCOOVYWjs8Df96HwjEi2KBTWx+UCjOUeSotdlUiJHtQ/DG
         t8w/mHMbhOt8hpJJnkPR/l6LDG3BvQ7DqMOvhvxd2JjgEU+wq2s1GZ34nvBIuxBwcD+0
         E3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxUwFJ2huBq+zIO6sVltY55JH7kCRdJ63yb5KGDvM2vVHqcDS8GEejO5NmqHzgZfUliBVpX9/fouIgVZX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpbUMmp400yADwXAqQR2aHlZpDv/4jKEtgfm0E8fmPbJmINwsh
	2iS+dtF2eQJCxBbmWXD2ev5dkKYe/Q5tMbAzU0V7yn02Gb/GBXxKXDoDAykP8u7GECDNsIuZnIm
	UC/EZL7NxbtGCK4HkZlLp9HZTbvq6YiANL7oBpIyb
X-Gm-Gg: AYBFou1/oIix1mQcsBvh30msGQzxqIz5zMzRqrYV6Ce+q4fXT4RsRLvqpRr0J7clE4V
	rfRAgEs3ouEx0bEKjDUnoye6CYqRRgtcRBgh9aEntMdQ9o8EqLJfw+7eVSiiP1/Um37/el6fzxN
	nBZOOeTpZeKA06c+liramvplzsgif0YUyp2sKWyEcI+0QkJTsZOGMxbY4/sALRF2sUkwLRAV5qE
	OkPgAMRMCS/a68u6jCcXW1DZttolBA1oXsPqHX/mqpwmtIRLs+GUqiO0Vl/Dr8/cbtEW6uAvurg
	TojqeakBjiK716yAU0DX4wak2Sl4itkpE1sTIsHHL994mQp74e6M/BjHIiOZLE5Z2vqS+GalyZO
	axkAAF/kuhk5JadjQYVgTh0XR2P2rLzrIEYbGzT7BIq8g/T5Rfx3pRWyho2LhODWx2IcPiIHjEg
	L9WuG8QZBBda+7x0tcB0r0aSdlE/IpHFHPlC4IT7i1XdZIdNq4RT+JCro=
X-Received: by 2002:a17:907:3f1d:b0:c49:9231:5518 with SMTP id
 a640c23a62f3a-c4ca7a40254mr1059160866b.21.1793704094661; Tue, 03 Nov 2026
 03:08:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
In-Reply-To: <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 3 Nov 2026 20:07:48 +0900
X-Gm-Features: AclHuK-tO3aJA8d_SmuLc3ZoFMk8WdJMtEnlyIJzjfGwrGOn0GHRV9smb-wnHEg
Message-ID: <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Fabricio Akio <fabricioakio@gmail.com>, Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"

Hi Loic,

On Tue, Nov 3, 2026 at 10:20 AM Loic Poulain wrote:
> For change request I think the best for this is probably to follow
> board like change:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
>
> Please, keep me in CC.

Thanks. I'll send it to the ath10k list in that format, with you in CC.

One question first, about which file to change. In linux-firmware, the
shared WCN3990/hw1.0/firmware-5.bin goes with wlanmdsp.mbn
WLAN.HL.2.0-01387 (sdm845 boards such as db845c and SHIFT axolotl).
qcm2290 and shikra have their own firmware-5.bin, picked through the
firmware-name DT property.

My comma four runs WLAN.HL.2.0.c10-00459, which comma ships itself. It
is not in linux-firmware, and the comma four device tree is not
upstream, so a per-board file would not help anyone else. But I have
only tested the bit with c10-00459, not with 01387, and I don't have a
db845c.

Is that enough to change the shared file, or should someone test 01387
first?

Also, the page says Kalle adds the files. Should I address the mail to
Jeff now?

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>
