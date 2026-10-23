Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792716914;
	b=1TomJKQTLQvrw5r63wi0Pgo/M6sWiK1GMkW0i0bX+ayEe0+Y9wjefOv4ewjtFS8rHurc
	 KGu9hPI2hI9Sr/DDUQ4Qu0ATcMeRe7IztRhWFAl1dxnEV9SV0FaGzvX2hl7X2OSBqCcXD
	 DM6yFjwKVFCwAtGyLpcED3C0R/4dlTjssfoubwfNX+M7k76Ye3HgblGhuaIYTNQzRl6eQ
	 E+hSQPQN1Qov7dd+FGfSA5QYYnz7npch/CKsl2oqZUGRBDuiChFe1Qmufx0iMMr+tet9b
	 1gUDY4pHB8PsZH/bxrOM5eGFJR9c2Fxsu2CU9MChxSg8OYllNYa0Yzjhmk3sOWrlf8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0FMPduqJ0vMq61jwHyW/GEzTaVV+6BnR55xnPNeJP4=;
	b=SPxKliO0TmAuPFSKtj8Rbc510ETxnILvbKLbOhqxovUWbmPM+FY7u6k72cXjBq94IivH
	 bc9c629NQmSFKZvEL/uIa5DSftmicOouYPdqNNeBlun7GT1SpQHI0WgCPzSrA2hj+e5ko
	 OBBpZpdK4E90PV4+hVIxfZnmItDXYsAYT0kUCtMnalzMoNgkRBxSnPnkw2usi/87+YRwo
	 yHWgQ16igFg4uGAN/5MJ2M2KMrxTlbFHpS4lfFKsXhzWtmiFY/zRj1yGzSug28+Du5Iz1
	 n7qeacJz01QlVIUYZB9mifPHnwCyaqgRlVKN6HVbQzqrYljaGHTRF9/NNv8uJuthD0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jGlZ3zwo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22444606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22444606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jGlZ3zwo
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso341460a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792716912; cv=none;
        d=google.com; s=arc-20260327;
        b=oPGZWhTnL2ynp6vMaHnVmNqzl+S1TGDRlfDM2i9wMWZAzov/SUR2iF20ateFYBqdpd
         yQczz9q3sDQ2S+YEG8WVoA4ypOqTTqgJgSFpXqPhtIlULdB6PwFSCvipZsqejeEpM9Jd
         bBpzCPihDWSNZJ+mk1mq/MkhT9ani6fC6/sAf5v10uAfGcw2FQ8j5gh4zdsY3Gk6Ds28
         4JDqMglDscUdfMoYNusq9OLa+djFmEXCj2k+PK0/3sZJ0qa7ojpHGSgtBAB29FstUU94
         BJRjJ5bq6t+jGZ1LQBmr+Bb3mwxUv5DAtYtgE3hJhsaPNi8gq1Ahl714RimB66g3AFJm
         ZRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0FMPduqJ0vMq61jwHyW/GEzTaVV+6BnR55xnPNeJP4=;
        fh=zsdWQ4pJJVHYqbku9MNJ4wz+aXWeiTwiGxJQj4WZ56A=;
        b=G4BSvE+67SUnAc1H2alJQ1mjql6vhbUBpy0QVdigEFE6xEhFvbVWLOUrYQnlAESnlK
         4ycg9A4jswT8aQ/yDtsLd3L0pnDZO8RPjDzQ++caYS5rmFzoAx5k+k0PISku3b38g8N0
         2/HFjFDmMrA/ofdyJiixHmsZEZVT9m9AdaEOWmOd6/Ks01j0JW8GYhJgG552xJVNwzu3
         Mu2p+NrTpBe5cz8Rgjz1UVVcnzy3xG6WoLX8CKGyAaDWAi6pVMPu6UH0N6i7TZVAdi57
         zPVp1wrO8A3wPNkfWbHPIbctAYm21p6et4eDIUU2su+bjvL8EbIYfguXi+pDd77dfDOB
         mmng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716912; x=1793321712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0FMPduqJ0vMq61jwHyW/GEzTaVV+6BnR55xnPNeJP4=;
        b=jGlZ3zwoXzBUq07fcxzcXJvLGgVwYyqDidjGc2iDLleaPDD35UqIbed/CrFJDKNBX4
         1YUYE1LiwpyqIwZ979/clSVNKnbMrckzC47rNxHicsqkrFd5Pr4lccMq0QDFaq76zx8s
         cbDdYXpP5n0+cFcBQtDg1r1qn+FGsU/ZiQPYhRODeg9hjKnNwA4Nf9AioQ1b774Cd1r7
         UyPSG8YgbbSss9YmgJS/hOGsyoC8Sr2zaZRwleAxkBM9z1kvW84TTu5pjnu8iWG7Sjzb
         mTwbGjSL2GRPnK1DC0U1LMaiyJ0XvPlw1UVAH/gn1QCCvvgV+XwGrnAE7/Es5tojUHqQ
         qN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716912; x=1793321712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0FMPduqJ0vMq61jwHyW/GEzTaVV+6BnR55xnPNeJP4=;
        b=TjHm5L8s4R1+teYxHehF2f0afLxeB1M5T9wvGUwv5oyZ9wF30hrS9r+wQ+EeLZKqIQ
         LET2B/YbFdspRXQnpOrxdCc/qkzMCFYTtvW3Q19YyscLaKvxHLraalkQBgka4Ld28igd
         vMloPyuJH9w6gaXqlN9yqBXlqUfSDWRMfwtLtCN9GhvJES9ltZR0DbL12gWlWTogQzMY
         KIyotr827Qgor/HxFj5Bh/ovlswNnVm96+X7Xl/XPATL9k1SjoB6FeaY75PA8w1DA7DX
         bKlGoAxZN2Hfr58p+rt/5cQ6nWg1l91gHFF5Cyiomy4x8vJ9jE3eNxDrZ2Xd/B1psIsQ
         n1pA==
X-Forwarded-Encrypted: i=1; AKwUvBxNn7xN+3XQ7dLV3Qoyj9MIVNeMt8ZVN95rp7CgcbNmh+kE7ZA5h0hPMbSOugYTN09mHOsM3Cy/aaABKFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrihT/TRRFhE760ou2ECgz2sFJEkxoTQsWKl9WBh3J35zNtp/e
	aWG7BG0z1AczOIUe5sxqcUILIEnWw4Ts6bikduQi/cAtGJlSrllej/s3rgjTy7T+OXfXqfsxkJO
	BxQvvIqVBoiit/vWiH2VUSouCZH13I6g=
X-Gm-Gg: AYBFou0I4pYKDrF9yGZ5MV/P2V10lImJDnlNPmenzGnl/10azLXRfrZxSd1KWBRh4V9
	xsSCn6CY7JNaYIiCqj/Io4cCulbVaGnKVSQ/mx4b6tYrp2yZpdAkrCOCs+0PFBLr9cw+8OptN3R
	K7jneQAiuxjZvixNV0hJkwxwRdUrONDVWxnVIiFII9rEuAr4Vdlotq4NVbaKT5m9+ueU4WIxO0O
	EWQiyrInQqT1eZoQSW5N4qcrMEWTb/Hv7xXxzIU1N81WBI3bup2BBosoxg8XaB8UE0+e1/kCuhi
	NIOOxz7Fw/I0FwSIb9xoErJdm1+XbAxpNRW9/5TLd3Eh1YhCb/Enz2u1ePQJl644WUaGDbZeuo2
	4gv54f6rcBPDZUEJhZlM+TyGeTU2wVnvWbxWz1hu+I50oHUGs+sbwY1sbn0MO+7/aczNNapUj6o
	rbmJEJMyGxNI+gmk8gDcfsLUuid9Z9hTn9ncYf9go/jnsXbYmZjWnGaKXqtRlcLhlM85g6LKA7Z
	LekYB7v1+L6fVUMcJ8xOIdiR30Kcsp+k2aSQpY1Y4v1XDLFA48=
X-Received: by 2002:a05:6402:205b:b0:6b3:e89b:126a with SMTP id
 4fb4d7f45d1cf-6b432bd8989mr1000942a12.12.1792716912331; Thu, 22 Oct 2026
 17:55:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021001744.2042320-1-rosenp@gmail.com> <179254219525.3290.1761340258214254709@kernel.org>
 <20261020181423.68783c1b@kernel.org>
In-Reply-To: <20261020181423.68783c1b@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 22 Oct 2026 17:55:01 -0700
X-Gm-Features: AclHuK9ICwt_OB5Rj30ELqyDL-gDO0EkUcuhCZlIOFTTDWA3-lrmMCR6ms3mofc
Message-ID: <CAKxU2N8ys_QztyhKLSp-PQ=BD20rvNSSRE16eXbd1KiV6wdCXw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: bgmac: fix TX DMA unmapping and slot cleanup
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:14=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Oct 2026 00:23:15 +0000 netdev-bot+sinfo@kernel.org wrote:
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by code inspection). If it was triggered please include
> >    the symptoms, like the stack trace or error messages.
> >
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>
> This is getting tedious, the bot has emailed you 10 times asking for
> this info. One more fix without this info and you're getting a ban.
Noted.
