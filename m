Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794879042;
	b=RRQdAjqjtJM/8G3sxj4HguX9bHWVnD8UR7EFvt7KlCKf/0w2rnJBxMJTKB5FfYrpzm+2
	 nILQKTF1rs8MQzIRZ6zyJaMdNReprQWHivPY9GP9ZaygTTQMZEU5LqH8E2VM9N+22Z5WE
	 kaSuZ567oFR0ieoI/kLftr8ZjRSeYOAsS2OH/ptVvWqstn8D/eReziyl8d+dBfxD6OvvO
	 vyrYzYThqkseZc4R969R3zIYcX5RnYzK0d8VlKCGanvHuGyyqjRLTrQH7XppnaB7IMQ3C
	 ALBGPoTol9wCtKR95orYawRQeTy3eP+eOV3BnX4PomrwjW0aM88gvIgU1vfQZeQ99Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
	b=hAGdFM32YvE/X/uov1l0xBL0cmv8XjpMwzs4ZELPLbu9WA5Ck56KaKG50/cxUNcVVe9e
	 vGNzmPxPlUQVgQTwUdiHCEqvOQ/k3UespO+bMaJG8UNBz5oaw9vaiorTpKEd1LmTfzg9/
	 YKlDBZX4wkLOdx/6CYQaZ7MqbdY4gBgDxOeDxJOlW/ORMWA00j/PkBMS7Hd9Dko4haePb
	 sLVgjNSA2oj2FgOyCDKoOytjHSbwakoXzUc2uyOJPwffKsrTTm4UpLPk4PMcYU4XwnM4Q
	 XjgL9nktj452hP/ZR9dRFrjeDsQV78pxu1y8IZQIRw8itp2lIpqzq6Uaspp7B+85Piw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym;
	arc=fail smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8281E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ee2ad94713so3593405e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794879041; cv=none;
        d=google.com; s=arc-20260327;
        b=UsSVs/pMhvouEIFLC+ZL9JUc93QqLhMEAX77iT075fXjJzTGc7+j0A2tyQJg1KP2k3
         JB9vNlCMAa/ITXw1P0ajF9FfSDeSIzwCyHoKZS+PQPOpZoCt67nRrSWThD5XnSJfwi1q
         3JzwS3UUtMU5rLBdPiLbFz47RCVFu7T2etnBhFRC2GAkd1CnMULY2iQPDsPS2DvvZ7/u
         9lEDMjypdOq53pOkSuA5u69A/OFeUqLDTIyJ/NpaLOk/ByzhyDYvo+/eWNIyCy3dO3sQ
         4KozdFYfNgollb2Nte4RjEFl93eygi5IZ4uonjAawxZp5V1GgcnUS+XuZB/r63ivDXf9
         SGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        fh=E7zssqsw1ETPdDWyyhGxbDDNBaFyztE4Z2qzV/tFFGo=;
        b=sO9ESY2+Z9SC5LyvaTfHCTOKy3X5f2ZzAdNeyeMvFcDXiy54w7+TRVPxDWRgsDIK8m
         ILdSO7OR9Qaq2nW+WgJjGuYEPVVHMmWC4Bm2KVyPy+qeThFK8qlfT4f1tROpJiKcaPhb
         0rCFBr4cnSqdNC62+qj6iUmhK64CTuPWC+RIf8jeADRu+rHq/jq1IAROC1peQcW+2LxW
         Mv+vcwkoBNrC6j8SZV8LXYVVwJ6YPH0gSRyBL3dOy2L/TF7OfC4HL0kirVmMLYhODcgc
         83Es2s5OfzWpRquSw14rc6bzsUpFlJVOpIeaaLEEUXtck9dOxcXK6bKqGk/zh9oplsHV
         kLNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794879041; x=1795483841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=G4sYMCymILpacviV7mjCOULNLDF3rKitytNMchDzU/yEFfaNdgaoTdJvm9yPP2LP0S
         Xh4bw+3IZR6wZDfD8uagDzYrh2q3JsGJw4ULl1l7gYqQblNn+2A2hQhLxT/TnWnvWFF+
         8lWCNnxcNTcCFWSTVsWEe7MohD2/jrgTeNizfAZyJwWNYfR1cEOYcr7zTcZaNbK3t32p
         YA5tdoLasMWMi5DMuHyy0tTcS+i+F7zvxLjbiCRyEFeKfMHb4luMG0cunaEbKKX7h5Vc
         k+sSZr56on6kqxWzPzvxazbeHu1jrsL6giLqWzinjnJ7F+68d4CIHK42jG19QVxAasX+
         whFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794879041; x=1795483841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=bFYV1K33CiGbGM1Ys9OVN05zAl36lH+gZW/xDw8BJKyGCmVavMhJ8oqMekr7dSwGXY
         B9/TKEuwNrGinnCsBCL4HWbPbgHnIqJPlcQGZpzaLT5MqfmQbOXpuFdaO+IBUbMQfmq6
         NcNprLK7DI3AuedeiYWAe65AOJT7yiIu2deszSfj9j/8UWumR0nO8UDECK3fmUt3FTBP
         zVzJrARDk8eXAPxzTLLhXEXRYVUnTDdASjlbI+GoSapJJFGk7maHXzMn+Z2PR5sq18p/
         7odqjv/7LK2saRTcPJLeaO7ShlMIBx/aM9hViAlBG9eNgUVeReajy1WvTGcla2g+3NDJ
         Gx1Q==
X-Forwarded-Encrypted: i=1; AL+hErG4Ks7/MtNSXT7DNeIdkiYVhRzqhYh+e8FXjOhbQpSL1j5fnBODKVbh/LX/IFIlAkObIr11Q4IWiXznkBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q/iDyoYUq94rQ5lp1G6t7phB3S/4QTOmem7dIsEzVh7oHJslA
	DbFqMhLAkypOrQt4Ky7dfoLQJiQJ55TtFh+un5I0QUcM2AuR2iQtuhc5Rxo7J+O8tqKDkGE4C0x
	T3ctNvXPiYRCRr/SGc4Win5NIelAptVL1NpbhMbhJ
X-Gm-Gg: AYBFou1rY5+XC48dl45QhW8+mrC1Z64/0xl7oOgQlqi2tF642xBIYzR2iIbVxc6A1Le
	oUBuN3B/cJTKfT0/pn3aPfrJmbUZvt66JHZrlrLgQpCVmkQydbUDvtWOPdOxtuw9P/DeSxeEU7X
	vVyuIJ0U+nSuePf6VnBlmkVNBvwVYQ/g2TE6i8MS6xQJqxrkX69CRdyG034ZQbTU4cBwp/sfIaT
	v1E0TAFAlmK23D7R0ZpqQOZzUqwOC50J99lCb+1TN7sQrhvPHcKtU+qSOrqZ2oN/2CGpkaazaSp
	Dq/eK+DoopWPxUMgr9saqXEz63FWI7UmCUoSF+rMJ95/EjjdbMnhiKBqQeWfifPep6rQbRAvieP
	Pdv1Z4CFBa79l29QgZAGJEGhLF8Iw6fsTKFhZqkSg7k/lYT9l7egKR5qqunNAqeSFMgSqBT4=
X-Received: by 2002:a05:6122:29c5:b0:5ea:cd69:7cda with SMTP id
 71dfb90a1353d-5ee34a4a22fmr4937364e0c.7.1794879040840; Mon, 16 Nov 2026
 17:30:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora>
In-Reply-To: <avanVkILHDYdpond@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Mon, 16 Nov 2026 17:30:28 -0800
X-Gm-Features: AclHuK-byOO9ApLlxanSDYI9Lfieig8sHZUQyc_p9n6pRaoz5hWdciXbyY9EdzA
Message-ID: <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > Hi Pin-yen,
> > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > The prio test intermittently fails in the arp_ip_target and
> > > ns_ip6_target variants:
> > >
> > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL=
]
> > >     Current active slave is eth0 but not eth2
> > >
> > > The ARP/NS monitor marks a slave down when it has received nothing fo=
r
> > > too long. With arp_interval 100 and the default arp_missed_max, that =
is
> > > about 250ms for the active slave (eth1) and 350ms for a backup slave
> > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the repl=
y,
> > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Once et=
h1
> > > is down, its probes reach no one and no slave receives anything, so
> > > eth1 normally times out first and the new active slave is picked by
> > > prio:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D10   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 300ms -> down
> > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > >
> > > But the test takes eth1 down right after bond_check_connection(), who=
se
> > > ping replies only arrive on eth1:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D70   ping reply on eth1 only
> > >   t=3D85   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > >   t=3D400  monitor: eth1 idle 330ms -> down
> > >                   eth2 idle 400ms -> down too
> > >
> > > eth2 can then no longer be picked. eth0 becomes the active slave if i=
t
> > > happened to receive some other packet (e.g. an MLD report), otherwise
> > > whichever slave comes back first does. With primary_reselect 1 or 2,
> > > the bond keeps eth0 even after eth2 comes back.
> > >
> > > Before taking the active slave down, wait two monitor intervals
> > > (200ms), so that at least one more probe is sent after the last ping
> > > reply and all slaves last received that probe. The miimon variants do
> > > not need the wait, but the extra delay is negligible.
> >
> > I'm afraid the waiting time is too strict, especially with a debug kern=
el
> > since delays can happen.
> >
> > Bjoern is also fixing[1] this issue by pinging a non-existent neighbor =
to
> > keep traffic flowing. Would you like to test whether that works for you=
?
> >
> > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazo=
n.de/
>
> BTW, using ping may not able to triger the arp request in time. You can t=
ry
> arping instead.

Thanks for the pointer, but I believe Bjoern's patch addresses a
different problem.

Bjoern's patch keeps the traffic flowing so that idle slaves are kept
alive between the test steps. This patch fixes the case where the ping
replies from bond_check_connection() only arrive on the active slave
right before it is set down. The active slave's failure is then
detected one monitor interval late, when the backups have also timed
out.

The ARP requests triggered by Bjoern's ping are sent only about once
per second, which isn't frequent enough for this failure. I tested
Bjoern's patch and confirmed that it didn't fix the issue in our
testing environment. We also can't simply use arping instead because
iputils arping doesn't support sub-second intervals.

If you're worried that the 200ms sleep is too short, would increasing
it to 0.5s or 1s work for you?
>
>
> Thanks
> Hangbin

Regards,
Pin-yen
