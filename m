Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792637632;
	b=oJepUkBeAIlbyXmgFDLpSky9VqVLsI+awx/E/scrX4IJjGS6bO/AcKym27EbIKkZLSPQ
	 dmTNQl1FgNi2ZizHDAxcchcinRfZr+Ku5d0OklF+enSUskue34++RwJg0Bi0AuXLFzWSM
	 RTIGh/9aK4rdfjWkbpA1CZIBUtYZJfmQ5egZq5cX4uukNyEBi1erlfyB/WYLrq3fKKXTB
	 oCyXJtYKck7rreg5onD5pdLRsH7gpruRTv6xvcjCMBZRnVLOcP7TpNdCSzgzLn334Vbub
	 jhyIOuwDiLvqcrSrz7FOvf5UAvDboeV7RriKsOOSOoZ9PkgrRYfX1PHW5w6uyKOgatg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NnU6rs3hrQM9btLPDOKgfodkMRYa3+dqaWM6BzIydXs=;
	b=iZmqDozM7JhFCfYGLx3ZV7XG1R69YTdCHvqyMjjerQ1ndtqv8SF1TpbJWzGKsLs/wyr2
	 qdJpG2ztPCpz+d4lTDsngrDAEmpEhqC7NVLcf4h7gTuxmmZimODh1Uo+IyfCyqMGII9Ek
	 FwOqPuBrw4PDZNPcmtgAVvSpLmUA15HU6lklBdMeYCtJKklTcWwl8DqytGGPw68RTEPDB
	 t0k7xNaVoCkVkp44nalrZl6lvVOl8/ge/N+3mXAZ9q/XyKtXxy08MuRDgfF/nJFh8Bb1i
	 iZ8vfWDJwN9OGyEDqKXxd2Ek0AKIaD5zsA1PCGtXfKR5pJcL24h4P/BIc5g89fpgy8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DTOI/Pek";
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799FC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTOI/Pek
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so195494266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792637631; cv=none;
        d=google.com; s=arc-20260327;
        b=P+dRc660A5ayo3TTjPKE5TAOw2HdBbTEOOq78eUWTbZ95J8qHoCl39BhvA/Ql3l/7i
         smETuZRZ+ap7YZ36PW/5fbVhJaP/oghFbHgwN8NV3A/zdvB8pbDQIZkFNbESiYwnkTLp
         l0LPyCn1hiKouzOZIxFnIu1FsxFd6A784l1/rnMhe3IeHkz7eUQC/wxT1EGQFaNSv9CF
         DqLQ58FlOmGF5W7k3mGeor2JndndIvtpgwmJfCrn1xGBfSdkc/E18MPcX3WcD2eG3AyV
         Hr1zGUpmiauYYC4S8K3M8ae1pD4FFuTTXUGwwh26nbZTQLNmSVVgX9WFsypaGK6auLcR
         waMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NnU6rs3hrQM9btLPDOKgfodkMRYa3+dqaWM6BzIydXs=;
        fh=XiYrHc1WnELn7LJC2TY0Q2X3WW7QdBUMJCqDHcfas+s=;
        b=RWx3HL2DzA3Ld4b+lCnl/Mc6nVwHIERUTMbSIpcLf7aX0EBhyBT+oslmQ77YChr6cQ
         8pMz0pcUT4TbU730rbUNWATesxixhw7tjcUwWAdOWqmi2EV5pzO0OUT2EKXgnkaymeQK
         ShgxU/6mhijFHko2wyM4WvJ4rq26ZyNO6IhQUd9pzPkipFDbGJogyuRjDWkI8eKeqn33
         LRKx9bMBjHTrgA4HZB6V5tWLOG6VpbVF0dNLYOrUrApGer5piO95vLvu+oo+btdH2qyu
         230lXQFGsn4FjZ4zdOVTuFHpV2pH/vI2MuB3JDWS3hNa0txvnZS/MbvV8Yj3LLSd64Wk
         N8wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637631; x=1793242431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnU6rs3hrQM9btLPDOKgfodkMRYa3+dqaWM6BzIydXs=;
        b=DTOI/PekpHCFwbCxS6btLnjWQNCiYVc9jJXCEYwAmPekEK8t/PxBNEKZNgCm5yMo5O
         ZHRqWqq6Sa4prnp5961iu97eKvO2fCe1P/oDhQUuXQyhe3en4gFePLH+ndAycKrOkdLY
         ZBtVPzCtW837QZIUsvIlXqXaajHAOKuqlnaym36x90uyaZGBsQGk0lDoH47TKDdTDSv/
         +bNghojo2jLNQuKI4CGPrg7pLnnWdQfj43K8C91aQyr5qb1zEo8L/J/KSRypGRSRs42E
         gu3hUif099K3NIyvd05k0+GuTWcbFOAPWaSRNh9N1gfC8G9MuampVJBqQHApn7d+PZp0
         CiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637631; x=1793242431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnU6rs3hrQM9btLPDOKgfodkMRYa3+dqaWM6BzIydXs=;
        b=R57yWqEhv+thLjeCEdZpj9KnoO1pNOR44xcMosdDD34Hnagox/XJ5sxsFq1418C2Ek
         GOIvLG5tqDhrylohxMlmeYnZXk1C9+gECqHmIXzIyuvTTY3E4BsKEsSCFsMVQOJE0Qut
         xxDXtXLUZaYA/ICXY3oyendAIZbmKa3nAsxY+ytN5m0ZpcS+F2PrTeYmyU9X2Wzli8DX
         ziCX8rAkXdNK56ZTcSIVtdgdggQbDMry3XCVv9ANEGVszxhfFgvZw3Y9Xl4hxb6XbW3O
         v+Om4eFlhm1jDBSQyv5vwQaMffA7KnEnV+99OYRrAmycPMMzreHPt+sX7lFLZw4PBEgL
         yVEw==
X-Forwarded-Encrypted: i=1; AKwUvByjnMfrPK9mqj4pxutY52GVuO0pk9FbiHk131VLXK3RHMEEqr4BRLCW+Om8igqnMtulger0ZyBQtYEvYq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdxt2dUK1YF3VqqCHAYsCkSI/CsMaKZKsgXz7k7Jc3VTwurls4
	YyoJp/K3bBfWBgiFe2lGescTsfGcQcCoF4U3V5qw6RgVFKmcDz1nb5WEGnPDi017VgT3XPt+vTh
	NQlaNWMzzGT7wK4gtC/keTw343FDQU1c=
X-Gm-Gg: AYBFou39tkLMo21jRXNO8p51eIWINtHROXBGgtqpjCZmCIeB8txVoJN3r9+e7wK8h9c
	h1ByUaD90ve7+29WanoxrtAgLjyoLQwf6FIZMy/ZdwWVue+AKzF9B+N3EV29Wn/KBtXXk6Rvhb6
	LoGYcwB6z0klzpERUegX0XIIW5Z6LqV8R88rLxRYxT93LGt6R6B240VrJjHolTH/TAUTzZ5ohPo
	0I69j7GgKK7BVeJtmlLKOiRYQzuAiELm5q9BLwV9G5FkDWm/vKDYdXreQaJ3aReOz/rbXdOMch3
	7twNjoP9VwlZh1sdGkonVxKELMAA3VIWqkNqNAvRiwNiYbGwjLSsMYoGkhmmk9GV2zv71mEDOPw
	15+DY6ik+Xi5u8agTAK3ebp8aaVGmNZqvBQwGBjszeq4nqOv0dU/HcP7vSA==
X-Received: by 2002:a17:906:ba84:b0:c41:8e21:4d60 with SMTP id
 a640c23a62f3a-c46791326c1mr341731966b.1.1792637630664; Wed, 21 Oct 2026
 19:53:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792552161.git.jan.koester@tuxist.de> <f444dffc8e6bf98bf44c02456adc2de40e4ecd95.1792552161.git.jan.koester@tuxist.de>
 <fd20b840-350e-469c-9fd2-008fa0ded62a@slotpi15m67>
In-Reply-To: <fd20b840-350e-469c-9fd2-008fa0ded62a@slotpi15m67>
From: Takeshi Nishimura <takeshi.nishimura.linux@gmail.com>
Date: Thu, 22 Oct 2026 04:52:00 +0200
X-Gm-Features: AclHuK8zMCY_XzKvgZWVeEW29rK2WIKSmZA1a7YbTdfyZ3EtSnPZJ1CNUxd7pQ8
Message-ID: <CALWcw=FYKcDNXeArpsabHiQOAL+cWkF=L3stL6MB0OvVaHei1g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 40/41] nfsd, nfs: carry UUID and GUID owners as
 their text form
To: Chuck Lever <cel@kernel.org>
Cc: Jan Koester <jan.koester@tuxist.de>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Serge E. Hallyn" <serge@hallyn.com>, Jan Kara <jack@suse.cz>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, netdev@vger.kernel.org, audit@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:44=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
> On 10/20/26 11:16 PM, Jan Koester wrote:
> > Encode such an id as its text form -- "xxxxxxxx-xxxx-xxxx-xxxx-
> > xxxxxxxxxxxx" for a UUID, the same in braces for a GUID -- in both
> > directions on the server and the client, and take such a string (it
> > has no '@', so it can't be a user@domain name) as that id again.
>
> A bare UUID in an owner, owner_group, or ACE 'who' string is a new
> owner-string syntax for NFSv4, one that only Linux would recognize.
> Thus it isn't interoperable with other NFSv4 stacks as proposed
> here.
>
> RFC 8881 Section 5.9 says a string without an '@' that is not a
> decimal number means no translation was available and the receiver
> "should not use that string as a basis for translation into its
> own internal format." RFC 8000 Section 6.1 forbids bare numeric
> ids in multi-domain deployments because they collide; the same
> applies to bare UUIDs, and more so to GUIDs.
>
> If you are serious about pursuing this, you'll have to start by
> raising the proposed wire format on nfsv4@ietf.org before the
> Linux kernel's NFS stack commits to it.

I recall rumors of MS wanting to stick Windows SID in text form into
the NFSv4 protocol.

THIS proposal is even worse, in every imaginable way:
Stuff an unreadable 128bit blob everywhere. I am sure people having to
debug that in the kernel will LOVE the idea (compare blob a with blob
b as human,YAY!), and admins facing the 128bit hexdump will send
marriage proposals to the author, for making their lives even more
heartless and miserable.

NAK, -1, for the whole patch series.
--=20
Internationalization&localization dev / =E5=A4=A7=E9=98=AA=E5=A4=A7=E5=AD=
=A6
Takeshi Nishimura <takeshi.nishimura.linux@gmail.com>
