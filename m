Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F83227EA4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996134; cv=pass; b=XLZiLQ8MCG2RUlVqkjSY1rmJBFImJLX2UvZMSb85WSGHDzcakWCxlH2TMFqPyL7B8IzRztemBK0R+ybTtCeYcg52gxSrgBIwyhnki5hOzxyaa1hNufg7178K4VUbqQ8q9Sw8B8yNd72h4tOoAz6SZOGfwV0JF7Ux21XwUD591Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996134; c=relaxed/simple;
	bh=+hw0ixHejMxgxIBfXicypL5GmAH4YPvK3kWjtYiI4pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U13Dz4zVd2q/lWMfF8fHBFMxydSws+mPaOhn3hK5AxdPF4Ipt+WZYd4ILGFM+oT5XVmB+TndSSmjdxnlyU2pnq8FL0+of+A2q4daM3qfTm6JCcKMetXN4q2oXJ0PXVNCdfSDKArvu8jPsQpPywjf7wwTvjGeTW+LMIZZDHP+udk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dmm5isWz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNZblGnJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dmm5isWz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNZblGnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789996132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hw0ixHejMxgxIBfXicypL5GmAH4YPvK3kWjtYiI4pM=;
	b=dmm5isWzj5bcIc2JUh71jeBGf3N6hBodlAt9LnTVPdR5UsoYw2A1XLVcgYCbo7Oy009xyW
	4O+73/XqW5/JLRPKJQZbwYnMEmVRybL139ejUBdKpSDf1Lylo9qGVlJFlK/KFcu3jbs07H
	s0zib9tP9CSgraM+trcEMIypPx8Yctg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-2LWTqjAWOhiNgnl_BbwyaA-1; Mon, 21 Sep 2026 09:08:50 -0400
X-MC-Unique: 2LWTqjAWOhiNgnl_BbwyaA-1
X-Mimecast-MFC-AGG-ID: 2LWTqjAWOhiNgnl_BbwyaA_1789996129
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a5d09935b0so15552221fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789996129; cv=none;
        d=google.com; s=arc-20260327;
        b=alxiRYZi8LY3jHpnwyGTtS/bZkNyYx/oQQuDbFukKcJMabcOwBuanD1en5RWRcge8n
         y9JZ2S6+WCEQQ+3iUMZPNmpRoQdjC2wvhM8ZZmu6ZLJB/dsxVLI0UZUeC3+WthjUkQ/4
         dpvHADa08nV8o0400ltIAFEeGazxSUB+GNADQ23Q5CmicDKKi6ryrGTyuNN5qOBri2nn
         1TsTtPaiegvUelwod/mM/8Wa7txDyVcakXu+UfrmT1Md3jjosAt+0LKrqMa8iAqF072a
         gs6tuEQabJV3oTQ7sD8taHrvl/i1GRs8MUyZMp/IZ3TXyp/FSoUTcK+w6O9azuD7SceA
         85cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hw0ixHejMxgxIBfXicypL5GmAH4YPvK3kWjtYiI4pM=;
        fh=CRyToFDQYpKcIfDpQz71IZoSkZhN7b63ePBJKag1O3Q=;
        b=Y9zpKUvUcgKIfu9den9XE6/BTVF/M938T/fvblWXwaYobPKVUnVvYq2+mdKVwS34RB
         MTwRgcTznaK/NowF2J73SUdotvnra3ztY89dLYh+Vjfpy9139pz0FaDEVOmq0h8AeiYu
         qL9YcjUsfXpZ9ULcQ+GktWaiQh3r+50ePLmbuDOv9MKWbTSe+TCxhmlI4GRSBN0Hafjj
         S51bVow88Fh7z+eG+8h7LbcLUIUe9fKLKeSr/GzrfxSAs7nfA/CAE/ct0AjB8wteCYGu
         jiz61A1FDjbJo3VSvQ7pC0JvZ24ebg5zWyWE1qwGj7mppxp93vl0sB/d8+zDwWrxc8g5
         A/ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789996129; x=1790600929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hw0ixHejMxgxIBfXicypL5GmAH4YPvK3kWjtYiI4pM=;
        b=aNZblGnJvUVLe5azh7ue5oEYNMpvB9zP9Jg8jo24pdfWvvE+7HzpwwLUc6iaytHHb1
         WBNR+L5nqoSRDIylugMO1Btg4TLZhrJHK1akFb9+n/zNdmsHhui3T0pelQBnln5FXRH1
         ddGRmrSmb7X6fDqJRZxblvb7sIcAvtGbnAQQebU92w2SgP/Z/C8ET/geLvFsv/F3DTC1
         E3AAcUi/nowcqdpT4WAAdGAZnJohtesdETXsu8kYWuIUcQX5i+Q1Ym0slzQdCZcDQZe2
         JeEJmooEk/GoMO4WEAG5jAuaU0vKcEEmnx/8200XHmeHDqp27+Hjr56Cx7Arsevt2R4H
         I32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996129; x=1790600929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hw0ixHejMxgxIBfXicypL5GmAH4YPvK3kWjtYiI4pM=;
        b=ba/aKsOv/Jzh0XaJjOOaD2hGcrr9taJXifG+qB2OXGSRmwLywk/q50x/NZG0kAPuaw
         cqeE3ogeXIaUx8hc5KHaaspVpU/wYLEbtJtNG/vagasID7LyGBjVlIqYtwOE5Tz4kPl6
         t0ZJZFCBz5aiHmfLWiU9ykSUWUYl1pv44vpiE1XUVYS3j6ya+bcY1qwfi8S/7Jm7QJ5D
         I8BKgJKzaesl/gZ90dH2vDQh8/2V/MrvhPJWDYZYUumumpf7Gbj3gvqN7M3UkHvXR4Zf
         zbJtBykZmrpwIv6PDzmBrXNj2t9Q3m+BgYjHAzCC9Vdf83450Y9dEJ4l4KDNm+5xz47g
         X/3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzPebvBSjXuE7EAYmVDw3NCAB8wXX6DLh7wTFcg0tF/XfBGWq6oRz8wuZpl7PTEu/v9GIvtGmOlKlYU/E=@vger.kernel.org
X-Gm-Message-State: AFuF++lpiYdkvuUpyk7HUCh4iu9wRg95Q+Vh5IYFakZY26UjVtM6TISY
	LE+jCUgXqxbPsKqPA6GQZzkHbIZLYW9fx2mCmOUtvmN60sVh6ZH59BpJGuksw6JcRv8hAJuQpC3
	WqXKnEAwvgP5M3Q2fSzoxE2HL9bKrBjmRxJHvi2Wz+elGDKH1WVHxxU08m/lpwh/9BCong95Rjx
	30XbBPrviXcQ9MON3oCVgC7mmChC4nFRGTO6dPq3f4
X-Gm-Gg: AYBFou0RH/ETYbQp1ppJsIggSmdgSRppjIYrec3kIeDEhYhRE5AkSyidCTd2u9888x3
	6wDwJ49hEzFyvXy1bwZLIv5TLGK9GmDjmuJWgKcnXl7paiMPRqVldJWjo0y2q2aOVOA4FSJToOn
	7Q7KfyloIfrzasv2/A8kEORMSwbsI7xxnNXqKbRs54TGVf5kPuSdqvPMoe
X-Received: by 2002:a2e:bc12:0:b0:3a5:e541:4205 with SMTP id 38308e7fff4ca-3a5fbbc2f6bmr23494921fa.0.1789996128896;
        Mon, 21 Sep 2026 06:08:48 -0700 (PDT)
X-Received: by 2002:a2e:bc12:0:b0:3a5:e541:4205 with SMTP id
 38308e7fff4ca-3a5fbbc2f6bmr23494821fa.0.1789996128490; Mon, 21 Sep 2026
 06:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919173747.327963-1-ngocthang2710.1999@gmail.com>
In-Reply-To: <20260919173747.327963-1-ngocthang2710.1999@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 21 Sep 2026 09:08:37 -0400
X-Gm-Features: AcwNN1VvpfHNYEg31n2yNqww7xoCQjLLg-_zsMOr5l7COl7EOAERHrmvGU6Y8Y8
Message-ID: <CAK-6q+grbgqxyjX6-xpuXFTgNKShJmy=oF_-6qyYUZ88OvCiPw@mail.gmail.com>
Subject: Re: [PATCH] dlm: make lockspace join wait killable
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+b114bbe890d76037877c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 19, 2026 at 1:38=E2=80=AFPM Nguyen Ngoc Thang
<ngocthang2710.1999@gmail.com> wrote:
>
> do_uevent() sleeps uninterruptibly until dlm_controld answers the
> ONLINE uevent via sysfs. If the daemon is absent or stuck, a task
> creating a lockspace through /dev/dlm-control blocks forever in D
> state, cannot be killed and trips the hung task detector.
>
> Use wait_event_killable() for the join event and return the error to
> new_lockspace(), which already unwinds through out_recoverd. The
> leave path is left alone as it must not skip teardown.
>
> Reported-by: syzbot+b114bbe890d76037877c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db114bbe890d76037877c
> Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Problem: syzbot reports "INFO: task hung in do_uevent"
> (https://syzkaller.appspot.com/bug?extid=3Db114bbe890d76037877c).
>

I can see that syzkaller views this as a problem but syzkaller doesn't
understand how the cluster world works. If dlm_controld dies it is
game over for us, in this case the cluster manager should fence the
node.

- Alex

