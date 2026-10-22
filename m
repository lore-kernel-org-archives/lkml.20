Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685680;
	b=RHle8D4oXC6xRTaL1w9EpGYEwLOrgAPjv9kLY3fm6TnjuWPnjD6GwRAGpB8hO6RMFkAZ
	 0gE6KTbrWQdgAQgRAch7EgIlSiVzpv43P75qchhtk0olIJ6YDv+rHTbE+1nLIZcxhyR47
	 lAT8FwliO1hhF3eT1kgy6bv60m63TwXp1jhLowVKs6If6yexVVBsFV1sRV8oPVEpAkeHh
	 JSiWA9z/amNBJIxa9JoodusJ8OkjtJMXIvP+RdHEyC6uNdgCzID4jrhPT+xwvQxtwXXHO
	 HgIzwoIufLR0bZdhzCLk/lujw16QQb3QJcR4tyi0F2EMVbIIgn9EXW03pMSrbU1euEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bNMW3PNHa9CwraPOyiE/RuoP1DKfaXX3qWqLQcS3sgI=;
	b=GdA85ee42qW8NqJgGRdcrcO+9NZUC6m/6CokE2l+7ElA4g9zmmIRPdgNfK2XcCToVyeh
	 6ThUVSlbhvhSQ3mYmlLnhqbJZmGBwCxIgKSVacWPbnOxXh+ZSsBZVMy41DY64TFLSaW+f
	 pAywhpZ8P4iDmjFjk1ANHqbVfjFNk9VmgKLdZxSKAAqFtDCapKtUItJPIK9qZM95DkfsE
	 c1WUnM/A1drmOxjFTL5k/Oy67CcgEdjbaV0tiY0tBNUglnxChXbdGKH7LG27aYjzqH+ow
	 hbX39BYIQXD4cX9qMx5FNo5XX6ms9V5yBcnKYZr/xyBR4jnIkOLLFTSwRLE/xobiYMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dMJWgAox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dMJWgAox
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9178aabd30dso409216d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685679; cv=none;
        d=google.com; s=arc-20260327;
        b=EX198DtuJyTmQCTMNZGeuKYJxDmjNmVT9WepnTpAry2P3GfzPxM/4443rhYijPuJBK
         07X/KDLEpUjQVOm229NAKX+Wp6NHOSbsF3Q2HbXKOAHlnLeZJtJGOXoBx9lVv84QgqNs
         Kb7ztq52YK8CrWyYkbrxypoMMgArV4roKnhbF9dmGVWKv9IEaN34YlRl6DWsVhMHmBZW
         ifCBzHAlkcwvN3GOvvb6Uer8d0S7GX0vbm+oMzG9sqCdOxWBjjdC7Ey3rSSkk+Ab8nNm
         M2JC2aOV+KHCCbIJqvAxeCEa8qdFmJVpIKkSjkPuSb0N5Q3+DOn4B5QYd1ZcNOJu14A4
         bJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNMW3PNHa9CwraPOyiE/RuoP1DKfaXX3qWqLQcS3sgI=;
        fh=WCGuWVGBhDVL4MXqx4dx8gwASWWeVYa52V2H86pNbKo=;
        b=Se4h9KIcnRUW106JQ4MSmKP2JMYEJUJQcfMMY1DMvp91Ax6NhISIw34Ob4Q12QtrhO
         KCa2GzbTkVbglE/gitvhU5oeABBcjOlk7ccuKV4zrtoGytZp9trW1VIFu9+6iGB38u6A
         fdXL1FMFJrEarU0pRA4g7arKVH8XU3ZwAp1yrL+ui6+xa3o1rSsAlGFLYwwEyOStleEp
         Vk693ntCoooCqePe4DW6qMNV6/YdIgsGXj19Vi5Bb6R3U10cObEkf2PhlZoSq5vxf/Gr
         KfMgsFyA42nOEFExXX3FA8O0OxPg5jvvUgZTsbFnryk22UVPJyImXn1P54HJkOIdubXD
         jYgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685679; x=1793290479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNMW3PNHa9CwraPOyiE/RuoP1DKfaXX3qWqLQcS3sgI=;
        b=dMJWgAoxu0rDNa/c1QvDOh4AGNc9FFzDfH5qP3VMBsCuzWJmGhclaPg/jSq3ejePlt
         Q6FEsLtbFLlQGdVsWrSQHVcafw1I57mJZ+lhRJaM1x/mFPpL+4bnY3iah4b/LTWy76VB
         Mv6Ogh3C7w9cBoHqAg9ex2oaxtZnfBqV51vqp2Wg8TxFzZNE70Xo66rjB/CLiigWDMUy
         YBv7KjirVC13CWp88B31D6Ap+iXSWvcMWWP6yi6noFDtRHzfD3sp142rDAPnT8V8W//K
         PWRkUux1A4CKUYJqrjuVfO+ierHwW4/119qQraRcXVRg519rUjkmP0q6EgAYYSOHlF3A
         9VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685679; x=1793290479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNMW3PNHa9CwraPOyiE/RuoP1DKfaXX3qWqLQcS3sgI=;
        b=EZAb0Zoh4TGZcx72HA7kwIC6qc9MoAqSYoL52GLG67CbVLfn8Ux8Yt76hRG3cMgeh9
         9ZvGm+KvXzvtTvQRPTHdAgvwxMSNI5X36uXjzyIZDkHJp61ioccbNvF0N5uNDUsFfr1J
         oF+qHw5aisg000CJXjeYvKXnTSM5ZAhlOhn+gmgQPT6LiIvBaFv31kZltJHULWcu6bS5
         MS0t9i5JcqOfDRF3hZsxHPhOcrswQsgUvmyC9bkKrb5DfBRLXodF89giP1mtnCrCWj/Q
         ZrT85++h0gLxJw3oFRoftYG+uh29g2xVjQJofd9lNHDGSOHcmO6ZNl76tykqUCcvt7Wf
         JIGg==
X-Forwarded-Encrypted: i=1; AKwUvBynZkReXRxvSNq8wmsJuBEeM01qZfVocNuL2GyuTeLy0o9m/bMIwgjN/daI1iVSkHHcxVNtRF0c8QTUEqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5241UHlJWLnSfWb07TxdYAUNWJ7bXPPkZvSUtxdZIkNsQS1M5
	eB8LsAxjLaK6FPBl3UvlfJiA1g9r+QOEKrk448KLAuaJuNcpFtWviQz6wWhCULUpX9sQRtxPxNA
	gNK5Yu21S3dufAll2bx8XGMYT4CqjBN4=
X-Gm-Gg: AYBFou2Mz7sEt6+JjLYuVGXm6XH46b+X7moEVuBm5FYFmiVBCwb8iXdK/m9PFqoZ7au
	BxdspAaSVTfFz3TKOrQ2mjD31e0w6hCvJKbEtetd9bL5Xwwk99FtyRPjmsQHSFJB4sXVLmdgj35
	Z9p8cPe1kDEJOhs+ua8kPrWHpq7vveeg2S9J1kV1U0fR+8MgqPpt0l23bgEecLXMZtVPzI4BiUP
	TNt8+n3hlEKDYPaBVHi0gLFF3af1dKKNetOp8lOZkvOAkkpqwIBhPfAwiTTfEAQBDaWPbI99kk/
	tw+xp8GI1Q47G2H3QPIEbWKUCHMmHcQKLeDBxtLdnQOW5/S75pVUPGZGrBMT8wLcWqDEVz1cvxP
	gIVOa0N+cJ5K8gI5QZx0S8a6BStzdJDxyBYML
X-Received: by 2002:ad4:5de5:0:b0:91b:de10:e9bf with SMTP id
 6a1803df08f44-91c12f5e5a9mr96702306d6.50.1792685678470; Thu, 22 Oct 2026
 09:14:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017061920.3781644-1-yaojiale02@163.com> <400db63d.18c9.1a148cc2351.Coremail.19888972804@163.com>
In-Reply-To: <400db63d.18c9.1a148cc2351.Coremail.19888972804@163.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Thu, 22 Oct 2026 09:14:27 -0700
X-Gm-Features: AclHuK9yTpMipV2tQIARoLqeOFyl50wW-stz4jFoKTdjbJHatzhq9G183CNvSsQ
Message-ID: <CANRwn3SZqjHd9ezRw1_=DwLNdEdg5ysRHXPWHvLRzTUCBq7XtQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: reject short input reports
To: jiale yao <19888972804@163.com>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 12:38=E2=80=AFAM jiale yao <19888972804@163.com> wr=
ote:
>
> At 2026-10-17 14:19:19, "Jiale Yao" <yaojiale02@163.com> wrote:
> >wacom_raw_event() passes incoming reports to the pen serial extractor an=
d
> >the device-specific IRQ parsers before the HID core validates the declar=
ed
> >report length. A short report can therefore make either consumer read pa=
st
> >the valid input data.
> >
> >Require the complete report described by the HID report descriptor befor=
e
> >invoking either parser.
> >
>
> Fixes: 29b4739134c7 ("Input: wacom - switch from an USB driver to a HID d=
river")
> Fixes: 83417206427b ("HID: wacom: Queue events with missing type/serial d=
ata for later processing")
>
> >Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >---
> > drivers/hid/wacom_sys.c | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> >diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> >index 40770affdbde..85e966e80012 100644
> >--- a/drivers/hid/wacom_sys.c
> >+++ b/drivers/hid/wacom_sys.c
> >@@ -175,6 +175,9 @@ static int wacom_raw_event(struct hid_device *hdev, =
struct hid_report *report,
> >       if (wacom->wacom_wac.features.type =3D=3D BOOTLOADER)
> >               return 0;
> >
> >+      if (size < hid_report_len(report))
> >+              return 0;
> >+

This seems reasonable enough. The hid-core.c:hid_report_raw_event
extends the short reports with zeroes and then processes the result,
but that's not safe to do here without making our own copy of raw_data
(because we don't know how large the underlying buffer actually is).
But copying seems like overkill since I doubt that our hardware
produces such short events (based on the lack of reported irq function
misbehaviors). Returning early seems like a perfectly reasonable
reaction if this ever occurs (e.g. by mocked-up uhid devices or usb
gadgets).

I'm slightly hesitant to give a full reviewed-by given that this is
just an assumption (and one that we can't reasonably test given how
many different kinds of devices might be impacted), but I'm happy to
ack the patch.

Acked-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> >       if (wacom_wac_pen_serial_enforce(hdev, report, raw_data, size))
> >               return -1;
> >
> >--
> >2.34.1
