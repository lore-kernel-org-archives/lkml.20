Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511A27A907
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916551; cv=pass; b=Un4yre3VJVug9x5GhVwLWoEEchR007rZiT4i8plLQYcDdtCwf0bUDnJR6wxcvN+ocNr8w+mX2oyJYlvdoxeTUels5digU4LQWrJYc3uZmKrBBO+DJLRWn6RM9rTNwd3d0RYRxpXoMmnPf8FyvwwAD39QwWreGVCdnXwpEapS0QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916551; c=relaxed/simple;
	bh=MQSwhbdiJCeNBOXOMm+u2E1bHED2yNrmentBhrbYLAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzAw1Vb3XfuJDLqK9OY7lmnJdWaTchJNxcbYXwvZJ5TR7IRjI9DKAvt984TbnDm1zOHXnt1LSatzwbClZIp2cIcOhMSUd88CJ32TkKn6YSvLo3r9c3LO9kvVWcXLX79KpmNbQSElmZAnzjv2Pei8e1CAUtmVo2DvF7pIBPw/CTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgRfgUkj; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgRfgUkj"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a305310ddaso49142081fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788916547; cv=none;
        d=google.com; s=arc-20260327;
        b=rHzJmdwJK04xhsD8oRTWgiqLbrZXc7tOHfT+WK7vECH3BJbsFuhoM+QrsGkgAyooxz
         b3tboAvlHQpy/yW8zScwtPPRz04v6tPMNlmJb3AsGwG+P48iYlfXZF6qxyblzeMKyRAQ
         zuAsW78ewe4h/9+Yl5uO+i5BAf/wRyyV+cFXgixkmdoatqCYsjl156/zQyvxrb3bd4S6
         u9VTecxtAHL3lKSfJx9MYAlXpnyLV2BEuJLJu2VlU+mHGOzve9/AKXs3uKp1BqGcQf0V
         CJYuyfNmeF+a/IdwfAubg7UiFlMHQw1CYaKpYPIVmHBvNxaLbFNyjbqfnj8+nsX5ZLY5
         oolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        fh=NHwkunEKEkarRsGXzFK24lRLz3PoZ8PWb2VJWSuMJ4o=;
        b=PLB6nftTUqUHnnyvqJkK3JzQZRt93nQYFQkz/hRFQjOwTrhEfhH/Ehq55OisyUzOmV
         vRodDAbvH29BsCNZGeZg6n/nPr2FljXS55yK5TidE7MTMEqfn6wUiKNemfIQjHHskusn
         tr4g+yIPF6gklWG2BZFh480dhEs6UiLusM9F7ojfuARBMZ/nRiL/GT2ADHeyv0vmYwWH
         /l+GC5GCWtxJ+j1zQ/35sq4zX/F8kYUrOZmxshtingOzWsGInmYYUtmO9XTIFtap9SDu
         13m/Jekr2JFXvDyn7Mehp0T/TsFWf95reOSg5YhlptvjkdK9/cr/TS8t+l4tzMIlryJ+
         v1Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916547; x=1789521347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        b=XgRfgUkjK6mNHRl7hxl+8eb8pymDKZQJ9YyHy+h/PGbdlwy0AuD5A0cXWgrHr5/ukK
         oOppDsIAZziIHEnfOpLUdDKA2iObLQuBaiCXvoXZz2Py+C004F3O+MECyqYYkbW5lE6z
         NQIvpbeTRn/ZySrrDtqP2LPCnqXOfUKfn4KmsS8GM/JDzMjo+9FtbngC8kCf3robtOLf
         PR5g6WghGCLtW7T3RdHc/aoggsu2UpXXhKrv98Y2b28UujQYwId7MkzpFZb71BnjXsfV
         wKgbuEO0KXkZLaIsBn1uEz5FdxFOjlliHSZnMvsZmkEdp8aQI6n4DzjNIcKlDQxYB0/B
         7KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916547; x=1789521347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TTx+LiFvOB0q6Xwa3UfI6WzvnZa/o+6Kwi8basQ/fc=;
        b=SbGOXI17qffwhcY38L8XzpJpzNJb2COtVwRwSgSL0KdzSlk5t6wA4yqlO6ZQf53kFv
         oripxfeDlz7UlVoSQ+0G9lCUavR7+yjh5NreZwV3O32jbTiWB0DzgrKNVA2bLcmB3q2t
         7z2Fd3SQ6LcBKL805WusCKnigP7/bnKyg+4Dfw7haFVNMiX3+844eWgAKuEnz4l4jgGz
         cHA+DXwwwqEkIUxh69WjUPtEB+PiOGRqKDlkvWtQrpBRyVhG6xxEGKzpLnhft/TXbiGk
         XcQW7U6dBrzph4d5dKSgw7rZmTSh0fshFgjyMFa/maCSD9Ua2wVkudpUUHR3OK39rPDB
         qItA==
X-Forwarded-Encrypted: i=1; AKwUvBz0WFFQJPVhymx6FU882f43OzmMzFjWWaWr8F4AjnNZyBu6p4R2QUPw9fNX5E32DBsxb6n5GErokTpHDcA=@vger.kernel.org
X-Gm-Message-State: AFuF++kfGBFjKNzGsKQVxqMD8RWJZ0IHuhzwFGJbzPYMiwvJ1iHVl5NN
	cbyx8IT/umITCEfc0snb6xIAdkwW7ggy8vVkuhet8UOsUIua37X1VmV0e14ZZtCbvAoNJIGZ7c1
	KxmpLAAQjny6Ba4NIf+MAOoFGHUBjPDQ=
X-Gm-Gg: AYBFou11NvDWfKFts2rl8kmR8tpbpUP+tkf6X2ABAzBJkNVPt4i23gpOZHH/dc5qACY
	GuQOpVD3TLtqWDV+F0CqEwTH7uov2I8AfGbXVQlcnZz+BEqyfpGhpWzVsp9C9ZZpQDxEQanKgUU
	RqCvvanxEn1VFn9rGnD21X08XQTTnMmdWEbIZH05q4EAmNfka7wupbee6CGR8JYi/l5etHeELOk
	c6r8QUpt3KUHKb0kqZeisB8ETqN+UM8BYsPRA0gFykYUamCTJabzkkqZzIZATL2m1yCk0/KWMn4
	AMON3HmhnvFNLmU28UI0Rp73Gs+LQvpen64UVSdBjs41dR77jYDetCB+wg1bKKWQoVCDVXXA0xq
	HRVOl516v69Y=
X-Received: by 2002:a2e:a98c:0:b0:3a1:eb3d:d30 with SMTP id
 38308e7fff4ca-3a371ba9be1mr37005571fa.10.1788916547185; Tue, 08 Sep 2026
 18:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
 <20260905093932.43726-2-sigefriedhyy@gmail.com> <1673485d-5529-415b-b1b6-60e27291e3bf@kernel.org>
In-Reply-To: <1673485d-5529-415b-b1b6-60e27291e3bf@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 10:15:35 +0900
X-Gm-Features: AcwNN1VKTW3usIKu3ouYSVflf7oviyQs0HuBjHgGBr26olQ879IgU8NHIR61XhA
Message-ID: <CA+7S2v+vdR-=XJYNrmY5djFPW+4uLtHJYaV3iDsmuCEQcB9FMQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
To: David Ahern <dsahern@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:56=E2=80=AFAM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 9/5/26 4:39 AM, Yuyang Huang wrote:
> > +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callba=
ck *cb)
> > +{
> > +     struct net *net =3D sock_net(skb->sk);
> > +     unsigned int flags =3D NLM_F_MULTI;
> > +     struct {
> > +             unsigned long ifindex;
> > +             int addr_idx;
> > +     } *ctx =3D (void *)cb->ctx;
> > +     struct net_device *dev;
> > +     int ifindex =3D 0;
> > +     int err =3D 0;
> > +
> > +     if (cb->strict_check) {
>
> this is new code. It should only work with strict checking.

Thanks for the advice, I will fix it in patchset v2.

Thanks,

Yuyang
