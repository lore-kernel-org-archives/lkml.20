Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EA335081
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002699; cv=pass; b=Dz4743C1b9JTkBZJLpUjo72FivKj2bjY5lEr1YnT/EyvQBKrDgepEqO9aA0s9judW1Gyqv986OVIVCDcZ0VF5s7yffHUrl8kIO0olndJ6aQZHsCsjP3KbDiggSiX59TR0h+SrcJCBdkOgc63tx6RZ+UBph4GfO9/w4iTbGOyBaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002699; c=relaxed/simple;
	bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwLHWLAc4t6KQdGEvCnkckBpxPIEfU/aRX3LWAimrFqJwG6PD5BrtB897CcwqECVAvMgzjFLbPz9qna8kQYMoQKBRjPePviS/xppD0y+rF2nYwwnmm89f5wOtnna0CuapEcKHvgjEGz7chl031Q7RGFjwPnGS1wXEVO9p1tMfvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STo9fbMu; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STo9fbMu"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a5938ab935so2390871fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789002692; cv=none;
        d=google.com; s=arc-20260327;
        b=iuJCQx1XPnKutKYsrCaHVUhcKQxuNG8GKgBDLlbjr4ZZKMOLOr/Ib/CmDuNPnjJ6aQ
         mq4VbotrILFtHzoPdl69EcndSH1ZSQ4q89piRF/bcEuFiaIDwBjR8/9yZ6SdHovDPE6o
         Nhge8IHw9bcRqcCFHQEG83H6haA8y6EDATJXU+ziPDLJRiozzQnu+JMJfEOUCFV7OTOj
         1IMOuoIXgMGGm5VbjcxspmtwxQBnbBop0eY/ARIskP7XfoF33s9XXBJblfjY33/EeZ4J
         Dc9RZNvF7v0DzqXRkVDQYMrNQRM43tPN+VFMpEwfKc0p3zNx4fURusfFgkyjdRMqV9uZ
         xZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        fh=GsQRldSUQrUKMIA9G5x4jmmPnJfsthY3os2ZUC4E11g=;
        b=DlE/lVuUhpIFLCSWNZsytf9TUgoxQYwT1ZcWQtOy5mSd16QMxW/WtgXPIPLj7Ooksh
         +EnqaAtTDvaet0ITNSWp1ejDk+9CylnbmjyUW9z86jDOUn5CRDt3ponB0WCZ6sY4HXHH
         F45TMJBhqljxIWs4UeyODxF/PFoQniIgAVOiNgEmN9xsvh+JibuGCuEkiev5OLM39o2H
         UDKWY63JvjbthMMHlCU2htupDuLEVpbcufFk2u8ZFY7jC/4RNHbgmWvT9c320W6h2D8V
         606XFGDnNuuDQTITO96kIBs5+x6uFC2bGsYubzQ00nhDPcxXOIyHHRaT5CN7vUE0/vlW
         E4xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002692; x=1789607492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        b=STo9fbMuqQfrxCCADuP2rbP1sidSRyFmhGVkdu7ZbX9isK2AfVz5ahEXjjVvz43fCo
         KtENrfgLXcYtROgblNwKoaUZ0lfOXs5GdeliXIqvKXvQio/PPf6q6vNA8LXzzy18lfEv
         aV6HjMh5br12fPLfDDJCEumOtXIlSARvwO2R6sjc3/rz4asjMH8RlMFVenQWdT0fL54a
         GzQXJKI2gCrknivDOd7dPW8y7ZVCkJohjRhsqIcP5zNXbgw/a3iVh3YqMyRXQX1Yhk5e
         Isfuk0Acv/8imKGWsAQchkin2GzF63cJxyGN5C4FUXPN92q5kg4PswSobpnk3XiGm5u8
         9uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002692; x=1789607492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        b=EEa0Rh/mi8QvHfKoexFvT+p9lPs3KKII6bAUT+eC2Yv5O2VFmRSPfwZT9Q587VZeZp
         Txph0wtIVHbHgK+OnQfQC1P3nPPcnr4TDSInuhRkJ11IYEVS8593sGbdSYMtYPNHopN+
         OwWDkmkcgjXlVOZHezy46MvcDafCnlMxANtXXg/wDyJefB/WYv6R5e6dGbj9YaOEembu
         yPT1WkJW7RKb1iV1BiL+5wdM2E0S7tCkySLzJHB+A0vEW/3GZQcYX2O9/r6X22IFRW+E
         a3UlozAs1LzGfPTObMXHSHDCni88Q58QRTb38w1WjN9nw17U5FQBxtav8n7BqlnJ+EM0
         m3jg==
X-Forwarded-Encrypted: i=1; AKwUvBw6Dgp8UG5sfEJB/OPCTGEl7HYm0VYCzfx7tLh487VhZCu7UINLf4rkAleeT/HzJmlfkYoKIuR57ernYfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kI2Xg/kk1QFHb3WVyme9L/MB4+HOKbeG9WzW8fIDaXrZOtl+Om
	8Ciu33wY5mfc33oyAH3/hgfDs3CsqAnDerAk87L2vPqpnRvfnZeX5+iGE7y+UE8jyQ4K8z5/8mf
	dWtcqiFNwa/tcz4qhBG6tjpjhEsBB3RM=
X-Gm-Gg: AYBFou2Pjiu2C4z7/bykpx3zGmgormxe2rzqSy71N/sJNu5PrYh1CFgQ/Q/KIc/L+AL
	QpUvqB1j1fjmVnnHDyTWTGQp1wU91AeGZJLobVJQo/8Z0mjfe8vvDVzrITkIFecdQpmlK1WgUhP
	oI+wp/6mY/nMgq/hhsG/kmGSf4D1C/Yh+LXOdm0rMAAU+uWWYCNH+SY1m7DBdaLRMi4xdJ5miuK
	w32JvkB5mMXhZ6t7PZszh4gbEhwhdfhxkyHS/Fj5678Ra3QjMz6wr/meVt1Kz4D5+SyK3lXzz4S
	semcZ0gHAc6z6TiGYiQrcyFpPsL/GJoLOqkhCPBG1gviOPClqiLS+TQzPHcGTNenL32H5RQOH0O
	3aJwLhE+U4oj29XwzyhnMErzY+oozN+ovED51m1U0Cg==
X-Received: by 2002:a2e:bc02:0:b0:3a3:7741:b446 with SMTP id
 38308e7fff4ca-3a37741c060mr43937781fa.22.1789002692206; Wed, 09 Sep 2026
 18:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
 <20260909133247.113923-2-sigefriedhyy@gmail.com> <a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
 <20260909113259.3d061483@kernel.org>
In-Reply-To: <20260909113259.3d061483@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 10:11:20 +0900
X-Gm-Features: AcwNN1V3nPrWO9zKa7tKGgL71iRod9c1a385A8lYHx_2U83y6B4hET2sWFNcdm4
Message-ID: <CA+7S2vLwLDd6y-u_8=SvQXXd4yjuFB5rqvJjUqYPTf7vQdAOsw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>This is a fix, so the target is net.
>Could you submit it separately?

>We should just drop the Fixes tag instead
>It never worked, and if someone cares they can use the latest YAML file
>AI makes people slap Fixes tags on everything these days :/

Thanks for the advice, I will drop the Fixes tag in the next revision.
Though I think it will make sashiko unhappy....
