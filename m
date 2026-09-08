Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CFD313546
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831605; cv=pass; b=fURXl8xN2huXEqwmaFCmEFYZaW0x2Hfyg22rSB6M9CtkZiIZXI3P1O8bSMNfKMULlSil3cihZUYLiMjd24du1QNGFkYQKgrWd4/jtKLwWRqzv2A/jAuLaKLxUSfii2WtBNCYt+N8eIwVGiPgbPTOU1TM5/+amNl3Kxr1YmKm7Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831605; c=relaxed/simple;
	bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpy+mcy1VT4vSxsgBUj5QD1RXeElMlPUpBjBX+EfJVtcDrTK+WJIJTjYjkNji9mxCYcuXYSSTf4gLyzGhyj1vNpS93CK9jr79ZEucagx/0nHSQI4W1bIq2f1R+FC4XzMVgNfDCanvGIMGsFYGfdg1UR8A91h9vENWG6AocsZFOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RANM6gVK; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RANM6gVK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso4899437a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788831603; cv=none;
        d=google.com; s=arc-20260327;
        b=STox8RJ5SQn0GMBIixQZx2ErMDmaLWi7XABeJSnTiyxHL/vGBqdzWjmQlpjewh0naI
         NxDJbZ0PCDFvmoWJhqzFJcRcdjuX/T9/9kILpDuOsurMbJ0swvUIF1vBbza5ZFYJTSPv
         XY2CcBEuXEtfR4tVlAcEaCnCCKyqsqlyfQqVCQ2EW+yZC1R9Uuab2KFzTZpTjZyC9eXq
         UpD/zQVpaXm2Ga27dJUpfs6wG1jmuZCBx8Y1lFuFeZ/YvQsV5tcHZ07BJGT1rCJCUyyf
         YsiOoJqPvALEDrTAbHXzHvMc4hkmNXggWrY1a8sdVZX59fE5I/MU1TLhLvRXcQu0kQP2
         zogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        fh=kkBvTs7JkT5KTBamwFWEn0cXibeRRgLX7/lTbRhacik=;
        b=VEE5GmTvFavfz7OQy1aF4lHYgDSORVSJlDsntIVwOddHcylc/zhQj8DeHX+9l+lqc+
         wjA/2sFJTKu5LEDrhgxrnUHfW1CLBiSc/AlwYQGVHZXgE6+rx9tQg6K/QlNr8vbe33ce
         /6ySQwGZmRIM3Mnx1vsWgSA1qyy7/ReSFCKDmgRJC6izZSm9eMLPHGeWj9U3xUqiHR4l
         VkUS4oJn/TrY7iGS3CUOhvWNuTuTsrhlz3Bf3sP7MjFRA7Oob2xn7gcirFw77P7eay3N
         frZf7vRtb1TV3OknQDFYaX7dxbTCL6AbKz99Q3HRcNLxj4ma8Ev4CFU0ol1nIBTRTfLY
         EChQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788831603; x=1789436403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        b=RANM6gVK6rKzl9eqrRVB6EpiSgZikxgUqpMd6BLtBZHq8akOzlT8RuLDQjD4GWvMGU
         JmoKesLK/JkcYRTNGVGfv3VhkqRSBTDlIig55Z/K5x9+7cDuYQAusUcL+SeUyB4P3btN
         8CBYdbyRd7fMXHc6Qt1e/J/UIzqa+sTko0zQIog8GejcpN2t+G6UtEpjMAaT4I4jK2MC
         F1sEybunZyl4w388n71gEBkkwrp7dn15I6MDPpz0gUCsJPdG8H8h/lXws+t4X9+xYyIL
         FoLJsUT8z+l0ULc4zPlpFqhQPRvah4AOyXB/eSG94xQ63VLmOm6k/zW1CuBRaBVz/23y
         TYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831603; x=1789436403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        b=Wmzbqmnrldd7KYSNI00lWnpzN7/vC66mZN5Ef3iCI52s9vpdSB81dhniOYLemr+Nn3
         Pw/lArDo9usrvuClodJVaTzgLcY1ZagA/cU93gbtIpANLAGcwVyN7MyZsH81OIuoUSrA
         s5HI10AYDNngkCrsU8YppJvpoDkeqRvVEiN1ex+2zEtS5c7IJtHzKc2A2DzZv6KcU4Gq
         9LRtZxGHlVCt3eOLVSRV1IUFN2Z6fb4llG16ZKdZfw1FhfJY+qiXawfH/X2bT5xqHCFZ
         qjP9hC6JgX4RcrtB1qlnFfXBV9yfWvJpwoJBvc3FcVNmVv2LvQigIj8yDE3hMuQPBAbJ
         DuVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyfgzZgMr9uQy1t7GmQJHJYj2UhoyR1J6hHyJrolU3YKF57JlHm+seJ5Z3ueDG7/sOA4AgQv18IRozLvg=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ZFudIgSZ9b+mpbJ9QBvbMeg9654qBiZ0cmWni9g7a5YaCFp0
	XUps6L8EsL56K4337+TAkABE4r2M6d6FGvnfMrPqLJwVAsC4z9olpyNGywIy6U6XKxEDK/m695z
	Qjynl7kSE2KsixrS6asFMHmx0E3Gmres=
X-Gm-Gg: AYBFou0yD3w0KAZJdPVmuxxbCcB4F4n6t1VuKiwtGp35e+h1SDX+OqD+f8ER2jDbq3e
	xXqGmCJcT39Kn1kUjJ7i72lwJK63UygIr5xLKua0RnqzsXaQS6rF7sd20IKliYmFNpPTvrVK271
	rEdGQk9OH6xfMRdm9I3voNu4oXsLIo8ps9Kf3vGOvLfBrGu9RYtu1Y8snf8JUHhJLY4h7UygP3s
	nC0i7pyE58ht6UNglAldFPzDlhIJkadhCUjCCRWyjd2KGtcT/wtNkcVWlyqkpbTt44gczpdQqox
	iThTgkbZg1cwXXjIhHBC8sVBqvwmMoLzR4eTjU2V8gpGAoka09r1mYDoXLZA/t7oNU3zsAKckyo
	laM3hyKv8Mei6aPxC4vSubgFWaP+0X4RsY59dI3Isz5yFh53qm+9zahzQ
X-Received: by 2002:a17:90b:2d46:b0:38f:57f0:1f5d with SMTP id
 98e67ed59e1d1-39b2620a25emr36859083a91.15.1788831603448; Mon, 07 Sep 2026
 18:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
 <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com>
 <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nHUXPL8dV8iqJ-x4OWRLw-qRm8MTq_QDTEJ94WhLWRiqg@mail.gmail.com> <ap7fP5Lz04kySgn9@pve>
In-Reply-To: <ap7fP5Lz04kySgn9@pve>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 08:39:52 +0700
X-Gm-Features: AcwNN1WskE-ZrizZC_ni21bq3lop72zxd2TyEp9MyLsJLSJ8j4zlvcW0r8mEdEY
Message-ID: <CAABR9nHLcR103aADF1WMSEkw-_BjWB9vyWXENJCYfjX5Wz1nkw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Simon Horman <horms@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "swboyd@chromium.org" <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Shengzhuo Wei,

Thanks for reaching out.

>
> Are you planning a separate patch for the IRQ lifetime issue? I'd
> like to coordinate so that we cover these paths without duplicating
> the work.
>

I'm not working on a separate patch for this,
so please feel free to handle all of it in your v2.
Thanks for taking care of it.

Best regards,
Phuc
