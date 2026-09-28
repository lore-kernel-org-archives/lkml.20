Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3934E36F1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612959; cv=pass; b=rWH07OXvssluZ5Px7BBLi3Eg/Nq/cA+yUbNZRwkBuXAz8yFze1fxyIVQpg1aUogSRBUGlvuq+wf8y9YfonrzBNmEVY81F9bYpjstZEZneG+gC4bCy7LCt34J3mJZ9sFyc/iD8IzCTrakw+ESaj70XOEssvGdVbK3F70iO57CjnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612959; c=relaxed/simple;
	bh=5ZpDSiHzrTaSbkIF2sxZryRiGeETjGD1f2Aqdfapuh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TP98BjCRiRSNxgu5obVZ+J6CCnrD3HeN781ZSK1l+unS8c7iwubSqdMoZivq/LGJAy1Nd+9UIv0UBlzgKolCy5UQ1AKBRFMYrvO2vIXbpLamwi/umVX4GeKlog+K5Kqubo+oas3U4qZnTmJgzjAxjmdiYjV2gqhU7FbvNEYPEOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXXRejpe; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXXRejpe"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac8774c8b4so192665a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612956; cv=none;
        d=google.com; s=arc-20260327;
        b=dKVUdEfzghGfw8jRCNnfAIMNESTbZWiC8Iqzlyr9SSnE8Of31aBHcW50sJHHa7z4th
         6/nILermCyBpqet5F6/Gns/NCaH4H5DIhOn9pa5Z3Kc1sKRc5WNRoud9asYw0Tqa3B1S
         FzyQkSPOTWxRkuTuCPBLnbvOeV376z0gszDn9om3JtomRN95aSW3J/QfflX57WAF12fa
         HZ86C18gWBcDMsV2M5kpIWgxE3HKChJr8fMVCXvZMo7Deai8rlw7ZWsgx4wkEdQWArHA
         A7904apGVz3mYNY0elxv1KrltTaycMyR0tq/sa6ongiI9kAHvYz0ltrAA/6myrh3PMGh
         lMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7u/ahGnkjID4qDxOKcLNpzkE3Z5UyJkWp4xOghr9HIQ=;
        fh=4c2hOWAMc3EHAiCvqvrb5JV+Dcj0wbfY+Y9uY/05Glw=;
        b=AEMulBZvmN7HWVBgnA3WrlA/NBLIIx67vf1Cw4jCe4gBcEH5VBGDSDDsuGCR+/OgY6
         HpVIW5oqakKdCc0084nB5BI9z15npRAw4pmBJ2aH4QtDGboUYvUhZ+E0eosVDeQTX1Vt
         r+d0BThqr6K33LjEe58tUhbujQcNOoWc+1KD3BJgYFr6q9objXxGTkxgiYfu4edUocL8
         wryyXDWDscnao4J0bBXX8DpmPH5YDViWXfsFDlmQvEJckpE4GX9R6ob+++sHGD4jXt+r
         VuuFTVY+OAhP3a+V/ZzcsDdU8/xWytby4rpf+YkYaewvJQrTdpnShZ9sk9HMWg5hPeY8
         ZipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612956; x=1791217756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7u/ahGnkjID4qDxOKcLNpzkE3Z5UyJkWp4xOghr9HIQ=;
        b=fXXRejpeGUC+lY85LXuepgy4Kaz4eLdKAPBbj7y99OsDAho9h+j2hFkf82620ml7Xq
         JmqAbYlqJA2aDtwLeI9Ed5O8KwKS3piBsRH5qJhcGS61RYJnskfUUjzyBYi9QMbHOP+P
         j/OvSCd4Y+/RMx9sywI44JfdFh5zM/SYepG+88+IB14PUt9dT/3N5qkCCWX4d9tIEtW4
         79h4ACH33bPfuG0A7/IRsn8Je0v5wjsEh0m5lk7WJYipnEFXPEpdH1Ii3t7nERVuSfHE
         8pAA4YITA5cV9QVNCkaau4WWwg6ysDPW1QglxWvscMEWck/kDEJfrCV402q5CiBcSnhc
         pjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612956; x=1791217756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7u/ahGnkjID4qDxOKcLNpzkE3Z5UyJkWp4xOghr9HIQ=;
        b=oSonxDoC91B745AjzX+KpPcgHbIkuhUhsz/lE43UEFbYsLMNUBsJ6T0wgJRNqGwJ8K
         igLDR7OOuFwp7wIB4yuAWVfd5zEBG0f19j2B2eZ4PnIQG98kbwGuulTjLJueVheDFl0M
         sKvr7g79nI9QSqzx75UtEBZAxJ68NiD3XXPZ09dIj846AFhTw65R3y1bF0CfUIV+2rXy
         GkNnV7/pLzmy+u7/hhFRAGC4VNK/jbcGrhZF8aj0YFcm60Qtd2pGjPKgyyI6hWRq9O0s
         VhuSmw6BiETAg25k9GWbKnVV9RoiMsR1dsipikIoLhqfJhr0CZ6B7qw96kLiEkkdRvR+
         b+dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIq8jQCb+WecFS2QJP5hw1rof/muiE3XS4Ip2JEoOhps0BHjCBhQZ9ETlkmvDAIs4BQYSuE+69m/Ncjbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+KT+4mf/JNO0KHjnizr+0P4sSsX868rQ+OtpzKTqo3GCXJObn
	EyY2RjaSukwp96yXdcH2XzZ1oCKCPZIRa3OvLVHxMzMPP7qH50X7mXRu+o3bxJ0G7hFWW4XmzEi
	8w/9rfs00C88OHTU4qyAiLYB3i0KtLvc=
X-Gm-Gg: AYBFou3GTahcHgKauGRhm4nl5MDQSdcyug5vxxoN7uTEGOV/197XAlai60QUPACPhZA
	hjOmW4yWFsPNoDVFomkBrY+KUkm2KyM/jCFcVRavNkJsckDal3tSGMA6N6A5ELpOuONApoTkBwM
	Rn4NKUDv7DN2KLs11y4FHVPwYSLQakjkFwI0t9roY1Nc6QyoueHpfNngm1wwc9CNzD6C8Dyt1qZ
	WL2OXJxP1riL6ZfPW/CjiNlAl8Nugt1gbPtVY0hSCbfOr+NLXQdx4dz4UCjIk/49HSq1SUwY0X+
	92RPD43hbwWwHqChAv1mGPwgfVtIgX6izD8k/ElkF81/6upVVKoIdAea4ijVcQIv5dHrV6LXZzK
	5pMRP/dV9VGA=
X-Received: by 2002:a05:6402:84c:b0:6aa:a78a:6a05 with SMTP id
 4fb4d7f45d1cf-6aae1a75d8amr9224034a12.0.1790612955949; Mon, 28 Sep 2026
 09:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927071051.3693368-1-nicoyip.dev@gmail.com> <20260928123411.GA440063@shredder>
In-Reply-To: <20260928123411.GA440063@shredder>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 29 Sep 2026 00:29:04 +0800
X-Gm-Features: AclHuK9xxQE8kN3osXvIimBgpn5r9tT9LreAd5Hk603-O6WYi3sMJEJIxrsqcoo
Message-ID: <CAAo+4rU5h6Nr2Biq4WrpfCA4f_OfNabg-D=Pv3Rigu3amZdx3Q@mail.gmail.com>
Subject: Re: [PATCH net] ipv4: Fix device use-after-free in ip_skb_dst_mtu()
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Heffner <jheffner@psc.edu>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:34=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Sun, Sep 27, 2026 at 03:10:51PM +0800, Chengfeng Ye wrote:
> > When a socket ignores the path MTU, ip_skb_dst_mtu() reads the device
> > MTU without RCU protection. The multicast and broadcast output path
> > through ip_mc_output() can reach this helper without an RCU read lock.
> > Netfilter releases its internal read lock before calling
> > ip_finish_output().
> >
> > A sender can load dst->dev and then be preempted before reading dev->mt=
u.
> > Concurrent device unregistration replaces dst->dev with blackhole_netde=
v
> > and drops the old device reference. After the grace period and remainin=
g
> > references drain, the device can be freed before the sender resumes and
> > reads its MTU, causing a use-after-free.
> >
> > KASAN reported:
> >
> >   BUG: KASAN: slab-use-after-free in ip_skb_dst_mtu+0x634/0x740
> >   Read of size 4 at addr ffff88810921c038 by task poc/98
> >   Call Trace:
> >    ip_skb_dst_mtu+0x634/0x740
> >    __ip_finish_output.part.0+0x22/0x2c0
> >    ip_mc_output+0x287/0x930
> >    ip_send_skb+0x11d/0x150
> >    udp_send_skb+0x63e/0xdf0
> >    udp_sendmsg+0x1235/0x1da0
> >    __sys_sendto+0x32c/0x3a0
> >
> >   Allocated by task 97:
> >    __kvmalloc_node_noprof+0x1d4/0x620
> >    alloc_netdev_mqs+0x81/0x12c0
> >    rtnl_create_link+0xaa3/0xe30
> >    rtnl_newlink+0xabc/0x1f70
> >
> >   Freed by task 99:
> >    kfree+0x131/0x3c0
> >    device_release+0xc8/0x240
> >    kobject_put+0x14d/0x280
> >    netdev_run_todo+0x4cb/0xc70
> >    rtnl_dellink+0x362/0xa90
> >
> > Protect the device lookup and MTU read with RCU and use dst_dev_rcu() t=
o
> > access the device pointer. Keep the MTU limit and headroom calculation
> > unchanged.
>
> This still leaves other potential UAFs in the ip_mc_output() path.
> Better to fix it by adding an RCU read-side critical section in
> ip_mc_output() in a similar fashion to its unicast counterpart. See
> commit 1dbf1d590d10 ("net: Add locking to protect skb->dev access in
> ip_output"). You can blame 4a6ce2b6f2ec ("net: introduce a new function
> dst_dev_put()").

Thanks for the reviews. The v2 patch has just been sent by applying
the method of 1dbf1d590d10 to ip_mc_output().

Best regards,
Chengfeng
