Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078904;
	b=rGimTr39IDWX2ujcrSFsKW4iuhAi9qr4Eu7zlN6nmTp2o/ub3LCw2cdNngveXJNgauKM
	 XruJAeQqv9HUqU4t5+WGkMnwMfcXLXsYLEdnwbPBnvDJK9yCONmu0ZGKfj2Gm8e1JcV/9
	 zk9PtjZqvsT+gIMIKReapEYmPsRZSMcgtg8bBsOSA/7UhCTgLGKuNETJW/4RVPn98QYuH
	 pXRi0op82qfSVd2wllZ8zghPoQv2sJ91oT8MhReQJ0gXI40wTBaxVa1jzZmWojS0VBS6R
	 wfSKdesinxVsAES4WGxA19G/Lh8miSa4Sk3fRQZF5Gxmaf+hTN8xFQ1ofaya3aIMgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078904;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=i0Omha6OI9MUeQUJmEdArgRodEoTi21Ihq4kzkDpg+k=;
	b=2768JpsUWG8fQ2KrweCPRDBgCVDmCQx4c3OIaOgYA8TSioFfKJPsgB7qcc68VT7+hvBj
	 8CUMj+seT5r1IsAsLeZapnjZmiTX5FBNhpzKlTbOj2j+0bGmqKvBkkzenvbhGhQ45XyYh
	 UjbCEyguMBUVUsdfOeOFR7NB8C36Rivtxe8dy5hdRvXe7D9VwK1vTAxkvpRT6TFmV40Ci
	 M1KN/YLxbhwttqnICbupDLxSvPNF0uBYrg+KiF6XdG1EOqkWwPQpeYpqEf8du+ZS6E4GQ
	 9Ot89RzYDOjk++PAsCOl4vE1B6ys8+U1kKQmjx3sniDpOjHqw0ZivlUHOyI2Ry5Q+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hv5ts+VE;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hv5ts+VE
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so1181764137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078902; x=1793683702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i0Omha6OI9MUeQUJmEdArgRodEoTi21Ihq4kzkDpg+k=;
        b=d7hl+LU3amxztBanhB4zR6GJKxBqUvs5jmuNm7PPIAfR95VmGbqI9E1qeWqjUqhSmI
         zAad1ZbecULCheLsbu2n1V5+Rm6g6tRaOPqGOwoQGwEPf3jIMGzL8XLRW4df8C8DZYDm
         oRvV1hP+ytCa9xeiL0ZckTXYTpB1XwSSbFgMiWqIVR7hBM1XTudi4KFadFUX8yx6BffD
         IIAqF+EQxtwDJyBnbTpsoe8pNaaJFI0GqRI8I8/ksSQXtaPwP4vqZ44aXARM9p1C4geo
         1W6dV4KjnPqNEYBqEUbRgFO9lYZ3tTQuWdLzVsxLTMebdAz5NSyqBzJAecjZY9+peOXr
         aTGQ==
X-Forwarded-Encrypted: i=1; AKwUvByQmY+ZhvJ/k1WkZ//qMBxqFHb9dr/7nODx8qsoR0CsVLPf/l7k4cnSfrhbeY1CeC9HMH9pyW/29Niy2yI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQW9Kq9zOzfa2PokhnWvNYsagTNeLOh6idPYJGFdT2fn2CXnHV
	8XadXPdXKZ6z7eLH46Hoh8lwZw/Qy7f5+vzERdEH4FzgZAn2rsD30TL5J6Gkqt/2YDEqYEi1QaT
	r5qJbjQMq7MEQl2CqOm5XJYs4PWRH65nJq4bG6Uinnk9Z4A/2r3x+yVV4LyY60BHpucDnYYfNic
	qsFost4IX8qIaqlHW3L8pPbCqXaqoVBPCrgPrrYRE40THR5vB3Siprq7a1jNSVyA0sg4OCj4L2J
	F0jfGCkpyLToBt+jQ==
X-Gm-Gg: AYBFou1clGrpjkD/Cx0F1cmdWf0lza4s67YwXbjHoHstdOR/W5y5wVqJY627qUisocD
	lV5Ib+kXZRTPDhe837gkbjehAi9o/DIyVEKOZ0nvr0DhxZIZWCcu6uXuN2bpaxzzk9PPAhvz+lI
	bLXFCi3DOjQSPAdJvA/UucCoVwohviR6tJaEL19gutdXvyGxL0VZGt2i1fCIsz+IT4op8v1uPCY
	PmN6kKzUI0sej20ZqZDtb7t4qtGwvd4pISKm/wyhd5IHSkz76ETtQSMSQ/flcu0c4NfsY3VrrKN
	YSWfyfZsXIlQCLkVaDwfnR8spzFdX6vFY8m1Cfp0l98V1ieZnFYFw5Vg1MX0/JxOoCfkKZBbBJ3
	lMFBNDOeyPaJXBzX5YemtGbM56AOWL6p0qGiv6mcW3N1rd1pP67gLetc3wrxx1WQNfiqIkSBZlY
	3V/AIze5+4jnzawqxynum8exa+N/HKG1EuVdTZ
X-Received: by 2002:a05:6102:38ce:b0:7cc:9d47:9c9 with SMTP id ada2fe7eead31-7ce5ce42288mr2663050137.35.1793078902292;
        Mon, 26 Oct 2026 22:28:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7cea3d9f646sm13024137.29.2026.10.26.22.28.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:28:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso1020085e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793078902; x=1793683702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0Omha6OI9MUeQUJmEdArgRodEoTi21Ihq4kzkDpg+k=;
        b=Hv5ts+VEac2dOY47cVEwh8LEduIMGy0w2R+fpKFa3THYi3LPzXdm+LxiFX+LLcCM2K
         eeEjdhrkx21NWicVviE2eOLtjBg4ATMksb2vUzWhubzHbcHGBJT9Lj4kQbgwDCSqzzEK
         YmiDYRvSBDW6DJdn60XcSRgqkTVgg/YsBc7FI=
X-Forwarded-Encrypted: i=1; AKwUvBzxcVF12KyXhV3YGKiWk2gdkOe+M17HPj4JwhjXE/tz8ahtE4F+gd/FdYQe3n+Gbvvwlyer9IEQxFBdBn0=@vger.kernel.org
X-Received: by 2002:a05:6102:334b:b0:7cc:1d0b:6d33 with SMTP id ada2fe7eead31-7ce5cda3f5bmr2464705137.26.1793078901757;
        Mon, 26 Oct 2026 22:28:21 -0700 (PDT)
X-Received: by 2002:a05:6102:334b:b0:7cc:1d0b:6d33 with SMTP id
 ada2fe7eead31-7ce5cda3f5bmr2464700137.26.1793078901403; Mon, 26 Oct 2026
 22:28:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026092757.9168-1-vikas.gupta@broadcom.com> <179300703050.3327.1854487549237861268@kernel.org>
In-Reply-To: <179300703050.3327.1854487549237861268@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Tue, 27 Oct 2026 10:58:08 +0530
X-Gm-Features: AclHuK-e-IEGXyZmkxyrolV4vzi29eNKxFEsXYfr1j1mgNehM7DbZTSy-5Bbvrc
Message-ID: <CAHLZf_t1t41ftc4o8i6cS_VVT1RgyLW-o9KeZst_VPPmD9x2oQ@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] bnge fixes
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,
  We found these issues during the Sashiko code review.
  The fixes were tested on the Thor Ultra platform.

Thanks,
Vikas

On Mon, Oct 26, 2026 at 3:00=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
