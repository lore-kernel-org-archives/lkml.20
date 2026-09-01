Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C7379998
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246136; cv=none; b=pdB5nKmy/sPxk2tLsyDVwSiKmT8hdf6HA2RKtoQ4Pw643PYe12lUYd2ZD1z6HfcWui/oKQFUKfGiXXMCAMX8gQBHKUOpv3oqTfjIpLpfen129Yai+02BTWREoLvcnRBd6KqBvKd2xFomT43vwwQGREHU3Qoxg7UM+C74NzD8L9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246136; c=relaxed/simple;
	bh=1tVJVFq3W2CWu2gl2ygoskorZBUU7AtPQpGG1dkvqYw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LUO11BX/a3YVNj8jL3RQV8icnM65SuEtz9O9Njk0x1EvFyZCbIqfxJng+ALEudrvu39fMUjxjqb9I4vqHTBZgAQhQDcKaat3NNhXqPh4FDhP1MjKCkstVr0IV4f+dLstQaeC+iFH3Vq+DJzLXiAJ9OuorHwvAjuGT62bRbtppCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=cjWTns7I; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="cjWTns7I"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so7211577a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788246132; x=1788850932; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2M/jGXwNV+sYka8BTRloCdb7CFduDV3zUnRzw5nv/RE=;
        b=cjWTns7Is7OoWOfZobI9gJHCsQB2R/7G9zt17FxcuV+O+QtMbDOqwclaU293zTtllt
         qMl5wi8YDpWOWV27nlRvYB9H/YvyXihcdT3ngyaUUwuC9XjAbj4JWN7IqxrFawstxtYR
         2E+0oFjqI0LeOVB+iz+akxY2dbyy+q8XvRoXdD4viuuGBc14JYUtHOENjO5dCoBb4YH2
         h6uV2oz5JHflypOOHs9kbKgpiEwLUK9rn/xdeDxsm6nXvRThLBCpsbXmwjndAi6Qe1Yq
         s6ignN9uWJK5jXI7HUCnWnSLnGVgGg3AVb8Ci6xifplYxjjeq8Q+/K0SRq17/hofh3H3
         +cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246132; x=1788850932;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2M/jGXwNV+sYka8BTRloCdb7CFduDV3zUnRzw5nv/RE=;
        b=Eb4390sgR6q/nVk/GlJtPqYMdC+4t3FUislokjEVbC5MEj2aTBC+/aal4OwL1TO6zE
         pAMLrRtecUkiMKl2gBU4DaiYCDyGgKiVFBGBSBcNaqC7iIGi9MZedE9X7vIT0wupbBIq
         rXT2j4E9oOE1muzFWeBwQnNhcldFRaivEuvQRWCqj/x50TVd7LfaBN4mNVJMjMpy3VwG
         /Zs3gSraez/+pGT89URRkronHzvjlAfMRQNcxH+A0ler7DgnvHB4adeVdy2ATA+x+r0q
         f3M94ecKYKdq+MqQNBz53TnuNi+1ByfIN7CSeXrvV0T3Vc9qTyKGHHC+PLjzdxLcxknT
         Fhcg==
X-Forwarded-Encrypted: i=1; AKwUvByVu6o9i+Xa1hTYFGf/BipJJAmlbQyX/Fzc8LeGFVrjFPBzAK6Sx5XAZKNEqfLNm5DFt3UZZxqsV21sjnE=@vger.kernel.org
X-Gm-Message-State: AFuF++lZbXQ5fLo7X+1nmZqU+vfzGpiTHePjxTTQeyQEwb4qN5KNQ55S
	k2iCeKibmZAdCpmhNB3r1zxQy7PcrepzR2RjulSRUkKKcM0KZP1N31I05xG/RzYf0EM=
X-Gm-Gg: AYBFou3t0znIyQ1S8MQpwmnInae1GYGgj3sHZwbsEOSVSIWZaeolzBCAEU+cK0J8KWL
	zYwAdesZJPEO72qkb9f7dzSC7SYXLqFLx5bWEvNN+nLA7gix3O7c+OGc0wB2xYhSOQMgdH6DvJ5
	wgiY7DdoDzpbqDiGV90yvIR0pR/tDKmFgXwnaiIB1gYasMNwN5SlhEJQCPOXUpt7/pLmpkQhjOd
	tOs5DVDtDKZTockZ645MHlc7Yuul2LIIw+YJGMKJHFM5rJ+NM04Z9PhiFLqtcgKPv4m6FHMWe/3
	Cpr7akEw9X/qoAqx9b9vCwmCKWXmNndDRjfIBpaFOABrMHOvV3kk0IgzaPWd02cJBNPU+ELMXxw
	gXlw2dgmTFzfqNAUvveQrDK+8u0KmcM5Nd2AGx10+S4JiJH8Lwshpw8M1DHS5nbhlUVoMCM8viw
	Q6/YosKoOhHCdWSqOD5+NCFUCVGMGzIk4Ji0xD8uEHpblStPI1wpC82U3kUSBjAQ9b8JroLxZFL
	i6eF/2fP3NUln3++Q5YxeJreJKPtpPA85DUY3GXPWtvpc7aREiX
X-Received: by 2002:a05:6402:2383:b0:6a6:6389:37d5 with SMTP id 4fb4d7f45d1cf-6a6638949bfmr4028036a12.8.1788246127439;
        Tue, 01 Sep 2026 00:02:07 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccb753bsm364169a12.4.2026.09.01.00.02.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:02:06 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH net] can: isotp: take rtnl_lock() before leaving the
 notifier list
From: Norbert Szetei <norbert@doyensec.com>
In-Reply-To: <2c5851d3-cd83-4a16-91ed-b7323cabe7c0@hartkopp.net>
Date: Tue, 1 Sep 2026 09:01:54 +0200
Cc: linux-can@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1633997-A167-405C-9B1D-4FFED8E4A595@doyensec.com>
References: <CEA6A38A-2646-4ADA-95B4-CBAE2F301A8E@doyensec.com>
 <2c5851d3-cd83-4a16-91ed-b7323cabe7c0@hartkopp.net>
To: Oliver Hartkopp <socketcan@hartkopp.net>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

Hey Oliver,

> On Aug 31, 2026, at 15:08, Oliver Hartkopp <socketcan@hartkopp.net> =
wrote:
>=20
> Hello Norbert,
>=20
> many thanks for your patch and the analysis of the unremoved filter =
lists in the case of moving a CAN device to another namespace.
>=20
> But I don't think that moving rtnl_lock() up so that it covers a busy =
loop including a schedule_timeout_uninterruptible(1) wait is not a nice =
move for other rtnl_lock() users.
>=20
> Focussing on the removal of the correct filter lists when the =
namespace is changed away from the socket's namespace I would propose =
this small change:
>=20
> diff --git a/net/can/isotp.c b/net/can/isotp.c
> index 155530aedce2..0835a4758a72 100644
> --- a/net/can/isotp.c
> +++ b/net/can/isotp.c
> @@ -1490,15 +1490,15 @@ static int isotp_release(struct socket *sock)
>        /* remove current filters & unregister
>         * tracked reference so->dev is taken at bind() time with =
rtnl_lock
>         */
>        if (so->bound && so->dev) {
>                if (isotp_register_rxid(so))
> -                       can_rx_unregister(net, so->dev, so->rxid,
> +                       can_rx_unregister(dev_net(so->dev), so->dev, =
so->rxid,
>                                          SINGLE_MASK(so->rxid),
>                                          isotp_rcv, sk);
>=20
> -               can_rx_unregister(net, so->dev, so->txid,
> +               can_rx_unregister(dev_net(so->dev), so->dev, so->txid,
>                                  SINGLE_MASK(so->txid),
>                                  isotp_rcv_echo, sk);
>                netdev_put(so->dev, &so->dev_tracker);
>        }
>=20
> @@ -1846,13 +1846,10 @@ static int isotp_getsockopt(struct socket =
*sock, int level, int optname,
> static void isotp_notify(struct isotp_sock *so, unsigned long msg,
>                         struct net_device *dev)
> {
>        struct sock *sk =3D &so->sk;
>=20
> -       if (!net_eq(dev_net(dev), sock_net(sk)))
> -               return;
> -
>        if (so->dev !=3D dev)
>                return;
>=20
>        switch (msg) {
>        case NETDEV_UNREGISTER:
>=20
>=20
> Can you give it a try with your KASAN setup and maybe also ask opus =
about my idea?

I just tested your version and I was no longer able to reproduce=20
the bug. Initially, I considered it too, but moving rtnl_lock()=20
sounded simpler and I had not thought about the busy-wait sitting=20
there. Thanks for pointing this out and submitting the patch.

Regards,
Norbert

> Many thanks,
> Oliver
>=20
> On 31.08.26 10:30, Norbert Szetei wrote:
>> isotp_release() removes the socket from isotp_notifier_list before it
>> takes rtnl_lock(). The netdev notifier chain runs under RTNL, so a
>> socket that leaves the list in that window is skipped by =
isotp_notify()
>> and has to unregister its own CAN filters.
>> It cannot always do that. isotp_release() passes sock_net(sk) to
>> can_rx_unregister(), which returns early when that netns no longer
>> matches dev_net(dev), before the receiver list is searched and before
>> the "receive list entry not found" warning. Once the bound device has
>> been moved to another netns the filters are removed zero times, and
>> can_rx_register() stores rcv->sk without taking a reference, so the
>> receivers left in the device's dev_rcv_lists point at the freed =
socket
>> and travel with the device into the new netns.
>>   BUG: KASAN: use-after-free in isotp_rcv+0x1570/0x24d0
>>   Read of size 1 at addr ffff888118130552 by task isotp_ns_uaf/578
>>    can_rcv_filter+0x4af/0x8c0
>>    can_receive+0x28d/0x3c0
>>    can_rcv+0x2a9/0x310
>>    __netif_receive_skb_one_core+0x21a/0x260
>>    process_backlog+0x210/0x760
>> Take rtnl_lock() before removing the socket from the notifier list, =
so
>> that isotp_release() and isotp_notify() cannot both skip the removal.
>> Fixes: 20bab8b88baa ("can: isotp: fix use-after-free race with =
concurrent NETDEV_UNREGISTER")
>> Cc: stable@vger.kernel.org
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
>> ---
>> Reproducer available on request.
>>  net/can/isotp.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> diff --git a/net/can/isotp.c b/net/can/isotp.c
>> index 155530aedce2..8ca75d30360c 100644
>> --- a/net/can/isotp.c
>> +++ b/net/can/isotp.c
>> @@ -1475,6 +1475,8 @@ static int isotp_release(struct socket *sock)
>>   /* forced SHUTDOWN may have skipped IDLE (gave up on a signal) */
>>   wake_up_interruptible(&so->wait);
>>  + rtnl_lock();
>> +
>>   spin_lock(&isotp_notifier_lock);
>>   while (isotp_busy_notifier =3D=3D so) {
>>   spin_unlock(&isotp_notifier_lock);
>> @@ -1484,7 +1486,6 @@ static int isotp_release(struct socket *sock)
>>   list_del(&so->notifier);
>>   spin_unlock(&isotp_notifier_lock);
>>  - rtnl_lock();
>>   lock_sock(sk);
>>     /* remove current filters & unregister
>=20

