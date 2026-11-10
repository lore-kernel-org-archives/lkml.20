Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794322304;
	b=Xl2YPH+8e1qRdi94HGmY7acVuVspevTkAuZj3hXY0slRdbKu5tNuW0cJLXfRZHGSEJ70
	 0APDKsrq6qcAp6hpF4fCwTrwrx67ZncmiLqgPp3kpBGe5sPXjdgOCDAbtBPeAOv3eHG4w
	 FCdBQGU9NabtOxq4ljgSvD/SYXMpRQKU4MztQKneGXfGZs9BBHcjG3ieaBCMEHR0ZaM4c
	 08C2JzwJg9hSDdBcoivqW8BWxoVe6Xom5hhCOFiHYG/8izrVmuLQ9kjpYCJatMUazsiyN
	 P69lsSbuDrDnzQOS0I6q8fyF1s/aSFGtLt9dRfqKFquByPFUhHp7v8dWE3ZJxo1eebg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PXqi9+oAKFvDZXDHBvU0pPg5upNM7EyCnjhoXmEOydk=;
	b=VeBpnyVbAZ8v8VYh5Pw9XzB3gZo7PYmxdA7nZrmMZBPOf57vstTxn1fOUxsIggPA4SjE
	 El6bynCxRXNvZ7K70IeRUt2c8iddv4Il2pyKQxPiXOBSfQRjTGwCGhrwdGFiYc54KVmEF
	 8BXfWS/r6Dv54WsdUJrYXQwA5DflHHjYd67+SFUH9wKgbYnZAB8/jjJ1lU2Jka5NrGo3g
	 bE3zdAs2HQg5E2/GKqIUUsIarb9N7qSPGVYvC9egphnrAquDvUdtkf+abZpj8Rw28ILoc
	 yMMTd5ZU0BkHUfrhb21NN3AxDSSIWhpS8ywCL0ngXdRSQXP2rIXmoCh+/MROQAp03eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IL+8xDhW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91898606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91898606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IL+8xDhW
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1197696a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794322303; cv=none;
        d=google.com; s=arc-20260327;
        b=l3q2dS3bvyDFHIDet4ogsZbeSuVyLItbO1c2DsyV7k35j147DqykIQCUZwaB6Ige3N
         ex5rrBnu88tiQcl/jAC57Fx+uUWeEJjGVn+hHe/cpHA+nDX5KyxXleq0A8RzZKH9J6RL
         /AeNOG42SqaSBZDYioAZaLtTxVw6LcQEtRaSmokLI2D4kWoJQjmITyNN/csC4htPBnXu
         i+TNCZEX/wHsW0KJtuCzq9g/VIt37CZxkUaHEh8GAnlsr4ioMQ5Xf9en0waEvl+vEizy
         +YBCIfc14yvEw5sVlvqdGhTzX6cuHIoa7KjGhRYS6+m5aZId3FSCZWpbeZLt6GzGTtaF
         /l7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PXqi9+oAKFvDZXDHBvU0pPg5upNM7EyCnjhoXmEOydk=;
        fh=AaeL31yMiJa8qMVWEoRcFsn8wj6Umjmkntzc08wPChw=;
        b=Zlhfjr/yDh+7NY1vlwUFmroTyB29fVnpeDEZ9vHleDlDbRSzn5VDeHa6/sXEeNrr1w
         pqcyD9QKF1YQsA7QqNKURj4eSdvP1/VAV6EiWXRfStK9CElE4s633XzoN0qA9TZxJoru
         4/tXoTveZNZck3LCPoO3v7Plgmh+atwoICLvX/itM7cNtUbsI+tOy1T83Q6U2HOMXOAj
         QjiQxv3wQeLWCCIzwKhuxlQXKBRa6vDNPY82eyqVsxnCkVDdw74uiz34BCAeq0bN8tH7
         u+Dox+eJbDLb5mlf+T3SjCCrrOkmiezSUEKtoYWJcQgNAXz3GYVuffOG73JbL2hElC/p
         SIbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794322303; x=1794927103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXqi9+oAKFvDZXDHBvU0pPg5upNM7EyCnjhoXmEOydk=;
        b=IL+8xDhWvbsY97lbmrxhet0Jxm/GEejFE1wA+kHdDdoy3r2HY0qfy9+Zo5tDyA1HCU
         92dTAWSC18xJKt+nqY3o9ZEOwugPfnvfyKVxgXTJccL+yGQZq3uA5w6FcKOdBgNjQCVS
         07UkwU1Ush9oWU9aQSyczjXfKDIKK13bz1vvPKKKZnAAbDJNUxO90oBj9mzTVwalm6uJ
         MzZxNoOFc+uElONJCp/htKG7NEjYziL9FbA761f4NJZqOMyMijk6azV7Si9VVAUAXV+J
         Tep1WbavDGNkRYBusn+me12VrKAKvlJoaba+qozCGl1bDCWa2Ghni1rfY8UzwuCjm2U4
         /4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322303; x=1794927103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXqi9+oAKFvDZXDHBvU0pPg5upNM7EyCnjhoXmEOydk=;
        b=guWlk8J9KWZ677rU9HSohCsa2As6GiYxSeHzbiZRi2buF5kijEi93Ya/i3RjvpMeGA
         mmzdf8XR1frf/+D/w1O5LpCB8JvJnnqz2D3CypJ3gKlYIH6F4DRLTHaZ7Eyz7UJj/UFT
         4A1/7Mo70D3ccM+BUGNTAGnACtPwhDnV1n418dNyxKwXQrb/fIsGqn8CcHEA2cYj0DRa
         piTpgFzFCF4GFkncqQ10hxsSEmI6FBKoD12SIOntArnKc0IFuV27bPksXkffMrqh/Nlf
         Mm7thbmAC3hKWV0LAKQ+rRQzkXSJRFU2Cwkx1+iI7/C65+5tk94wen8gEqOQV9iOJNSj
         s5WA==
X-Forwarded-Encrypted: i=1; AL+hErHmiidulR+AL+kkAI8Nyccj6FM+MlNVn/JLWLeD90v3SQtB354xWx7M6p5DeLUAOj9qIg/+/i/WlOF/QF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nujCUibkExrS0mvAh8aviiLjS1r2ftwn6Bb8LJHYzB01E+Eb4
	DsuAQHA92q50+sIIZ+dVaj5PR8RFFzu2lKG6v6QgF24Rws0j9hxS6byenZzoN5R3J4W/0NatsaW
	jh/Me5lsSHmOHsCv+M8bt0QNWPPgIWWNMA3x2n+Gb
X-Gm-Gg: AYBFou2ziFfw2EaIYLUlKXHxkdyTIxOl10wL+IKlyYgloJzb79ODN6C27YYOGLQlw8J
	ABXyx3Hu3iO/WWglmMHeKgzDS1zSkLehjWbxDgHM8ToAdXIf0vT44sr529BgbKCS/SZDhOoYw/l
	AEBgDbZH8A75L4nhmO3n+5kEhe8u2ZPXPVUUh0H2Ym6+Fe25F4oLkHt3x4hB6uzQ7egRkdGJhfF
	YDvSyqerqTGLIUhYQXKNCU78PXfU+IanPCOVYkD2QjD+pZQm3avxcM2B54HFmshrfKh8eQQ32MK
	J1H+L1UleWMr/xYtRjrLUFXdKSBszF0X3/49ke7ySSnQqnBqwjWGWWaC91TutMJ/znFATG5nXyO
	uzpuR8TSH2NK/ThDJLWLYSvraLwGBaflHJROA4+2h4Q1Ou4fS9X5FUPTOtf+t1I6d/JRT
X-Received: by 2002:a17:90b:4a47:b0:3ac:17c:6e89 with SMTP id
 98e67ed59e1d1-3b166cd4924mr2650628a91.19.1794322302909; Tue, 10 Nov 2026
 06:51:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110144205.2404088-1-mic@digikod.net>
In-Reply-To: <20261110144205.2404088-1-mic@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Nov 2026 09:51:31 -0500
X-Gm-Features: AclHuK9azAwCWCYb7rf35P_Qkz1YTwRFSpYVlH2tFTGhGa4I1jRp_1554UKlQOk
Message-ID: <CAHC9VhQ7xMe8J+wRYK98Lw-Ff8dg=wJNEWgJp-MOqFixeZkiZQ@mail.gmail.com>
Subject: Re: [PATCH] userns: Let LSMs deny the CAP_SETFCAP snapshot for
 mapping uid 0
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Josef Bacik <josef@toxicpanda.com>, Serge Hallyn <serge@hallyn.com>, 
	Christian Brauner <brauner@kernel.org>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"Andrew G. Morgan" <morgan@kernel.org>, Serge Hallyn <sergeh@kernel.org>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Bradley Morgan <brads@mainlining.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:42=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
>
> Commit db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
> records in parent_could_setfcap whether the creator of a user namespace
> had CAP_SETFCAP, because a creator writing its own uid_map only has
> capabilities in the new namespace.  The snapshot uses cap_raised(), so a
> task whose LSM policy denies CAP_SETFCAP can still map uid 0 in a
> namespace it creates.
>
> Use security_capable() against the parent namespace instead: the
> creator's credentials still belong to it at this point, so commoncap
> returns the same result, and only LSM denials are added.
>
> Do not audit this check: creating a user namespace does not use
> CAP_SETFCAP, and most namespaces never map uid 0.  The uid_map write
> that later fails has no LSM audit record.
>
> Checking CAP_SETFCAP when the map is written would not work: the
> writer's credentials then belong to the new namespace, where commoncap
> grants the creator all capabilities.
>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Serge Hallyn <serge@hallyn.com>
> Cc: stable@vger.kernel.org
> Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> ---
>
> This is independent from Josef Bacik's series, which reworks this code
> to close other ways around the CAP_SETFCAP rule:
> https://patch.msgid.link/20261027-b4-setfcap-userns-v8-0-2674adc63f3c@tox=
icpanda.com
>
> That series still computes the creator's CAP_SETFCAP with cap_capable()
> and cap_raised() in cap_setfcap_level(), so it would need the same
> change.
> ---
>  include/linux/user_namespace.h | 5 +++--
>  kernel/user_namespace.c        | 8 +++++++-
>  2 files changed, 10 insertions(+), 3 deletions(-)

Looks reasonable to me.

Acked-by: Paul Moore <paul@paul-moore.com> (LSM)

--=20
paul-moore.com
