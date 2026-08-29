Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89B2DF156
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981457; cv=pass; b=CkFMiSM3yILrbbwQHwUXKT6JyHdpd88iQ9CKI3iBZWh+JBQR5YiazzM7CgsK7bAe2d45Xr17ot3BcciQGhnZS+Ue8tp0LycoCfTg+E0E7x+5hi6T6cmw3mXxJGKyXYOWycrDgApT3rLxfcWgWqzz/sroG3DIKO6jAxA36lGpeak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981457; c=relaxed/simple;
	bh=Fmzzq7VxlDcP/qSuMj2DsvFNsgHYoE0juz3zrY1yd1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdzZ52tuNlWtojZF2PZAp6o9q1txaA1WLl6InhZ5afcfdB2vmQhrMKy4PL4npqtJ+awJ94toX6gZ3ydjXnoSkg2zeRKFTUyDY5Zxg+tsHwilt8LK1gIjZk0TsojSjMDO7QkebdmDvWb2gzGtZ5k+tbxmv1JvloLE7pjRs3QDyrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=dM2EeSse; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="dM2EeSse"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71ae3455aso25383185ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787981454; cv=none;
        d=google.com; s=arc-20260327;
        b=TpOmfFGHxUtJTvSwup72qwnmtqeSBujDHuPKmCmVAKrOhp9CAq8KDHhUI7P/RtM68H
         QiCoQWmJnLp9AvEXF/eBsAVD9lcYXwoVyfX9RFo+53IMYZNb4KIvURpEj9U+sj8g7Hhi
         p2BiBKynbzLqovgDao2kIYI6l1hVyE7+XAHyROy7OtU9fMxoGf6DU8IzxNcN8jhyQDby
         zI0xlhRdc0PPDPN7Xfqj3agaLUfGPTo9v3jSQefZs8g9tkhSdKxN0IqjmXieWvIRtjpV
         r2MK6u2B2PCVz37gKBQLBgmiyXHQeorV60K22heTLmL39Y8gWGYKuqhuz941+JJ3/KcS
         3+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=msGGMsAOPCBtRMN69Xb7hRwfBrAw4wH3kcCi/IqwT/4=;
        fh=LSVbvrLfQsLy0cqG94D0tXRDm03bElcEX3OZIbEVXys=;
        b=muPY+rosdDul6i3seEAH55Fe15WTy++LRdoROX0fLGn6aQ45qQrdFUPwJK6W4sTXHH
         UlzYVbs6IS/y9Xvz8j7i1r5+8YIMapcu4OpEDv9cvCX59HVzZD6pGS1k6/nGsQoIbqnd
         QjRqy0nOTgUIiwF3YZPPPRIYZZoa8g6cmu6ohkynuqv7T1cc/vweLXvBKbD1HHpQ8tOq
         Cf1jZPv9EoUI5bYLE9Wnfxkh5WO1ClXhepnFQ9v77yp4oR62T2MfajylJBxFbuNokumg
         E/F67WkzQczI1YPpVj8kwTmtrrCDVZKEb947iXLmwyb3j/m0BB8Co5qqUgPZ0egs22Ia
         M6TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787981454; x=1788586254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msGGMsAOPCBtRMN69Xb7hRwfBrAw4wH3kcCi/IqwT/4=;
        b=dM2EeSseVvuVYajKKX6h76RE5qwujDGGcnNHweQ2736O/+8dJwbGy75bnrHoNEHEfL
         qNQUqJwuyO+9R4Ywz+FfpkJ1980qwr3dgKEyX/vSl9YXni4/wDZij24dH9jbjKMFoHr2
         0BAOPA55/TZCneHKhqlAFpmXqJgQTPmzJwGSl4lB3Ahus7nLIIw+gpczGTzK4CpPxJho
         4xDjilm+nUuP4vuc0wVofw7e4dycy4pjBbb8KGmZxvK/gAQegzqeRqiQicvAwwzKtMWQ
         MwIu8F+F33xACb8D59Ml7udPSsuu9eAL22w+dBqWKEjDg2kSR4nHuROI39KSAkRJMhUv
         DTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981454; x=1788586254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msGGMsAOPCBtRMN69Xb7hRwfBrAw4wH3kcCi/IqwT/4=;
        b=WEO4l29b5lPXmNNX5S+oAQD9ksaxPwI9j4qXdpYqHQCh7fxEAl8gZp34Y4t6/6ndLT
         +U86wfxLz+DugE7CM4rKPV5zASCLqXtpec/6H0vRSF6ynq2flKGFPwYnRoU/4bSOahE2
         NjvVUUrd9DAt/0e47Pc0GELNmTSfJmCtL6dRNAxl+ci0ERdPKOURCtCpLTWzsTsA07yV
         sU79hHg5H8/dze62OgnfQsHHGl/moRZkm6NBYKiEQPre3F+HDiZS+gdd1IGHlAuxPI0x
         vJj2EN1t7XuHY/zop4fABodwdboyWq0NhXs/piOFeX7uSk+r+eLlXgciHBdKT7z4q2bm
         rgug==
X-Forwarded-Encrypted: i=1; AHgh+Rr0M4fWO7HjYgEZj/fDXtfOUCKDCvLw2I6JA6hxB5wjeIco4ABT66FKH6hCmV+KFpPZsv3f8Z+yPLMn7cA=@vger.kernel.org
X-Gm-Message-State: AFuF++l4MYgXD9HsupsPv4FfFD/rzDpxk0/qYw35dFKE0PHd82SWOXDw
	+GyOL26Ftdq4HMyL6K/inRodjKjtTK/oJTObzm3Ytg7sH6scWnig/e4a0rINuMqjiJk8RXj8wMr
	EZZjki1Xrwn+n2YKx8QMbIVdCZdytZ3yD1m/KQeSoda0CKTkwNDYYNSYWyIrMXf+C
X-Gm-Gg: AYBFou2dDcdAaXIRz4PQcAJk0MlRM8FWD/p/V24G4ogmUS4BnnyzbXOuqSxV8UD1Ux2
	NMQzvvyZY4WL1raFGU00SNejIhWnzgEUTxUfAd0A1xWrf2ZH0B2XOK0ZCLDW+C6okyOKAdvL0j8
	5616czn2HkHA/dVJ+uf4AVBgCVlMkbqggVOV9P3304aj2kw3B6+r69wRIYc748tTPC95ZkittOh
	DwXf8Do0/nnbqlfrrF0KOJ4sEoHea/60yl0/dcseNyUrbDujhUfCuAbAtx7t5w5LM23h8FlP+Qi
	6zXTamb8BgwlNAqGcgS8mB00BVgd2pclqdbuRCHsN+3kzmfwZYeBOWsXChMd9TsCy6Yu5mEghjF
	N6NQO1R0R0XGxgVSd/fNHLl6Hhj9QktICSq1uiEiDbA==
X-Received: by 2002:a17:903:1b44:b0:2d8:d4cc:5bb1 with SMTP id
 d9443c01a7336-2d8d4cc5db8mr71701325ad.17.1787981452763; Fri, 28 Aug 2026
 22:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCiMX1XFqCf0z=tPOb2nnQaqsxG=FEf2X6CshAQ86gAYMg@mail.gmail.com>
 <CAKYAXd-Z_H2O3W=_KrUifR44yisJJhR=-bQQp1mML7vHgfcdDw@mail.gmail.com>
In-Reply-To: <CAKYAXd-Z_H2O3W=_KrUifR44yisJJhR=-bQQp1mML7vHgfcdDw@mail.gmail.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 28 Aug 2026 22:30:40 -0700
X-Gm-Features: AcwNN1VJW_q2u0ZDerXqM431NG-qt1B-dx1vNq7txCD_Tj2ViejSZJUPduG3978
Message-ID: <CA+0ovCiDdpM2foeKtEBnoPRQ0AEYE-pJbEtLqiPY5wO_gSvdVA@mail.gmail.com>
Subject: Re: [BUG] ksmbd: OOB read in share_config_request() when payload_sz
 == 0
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:36=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Fri, Aug 28, 2026 at 7:38=E2=80=AFAM Farhad Alemi <farhad.alemi@berkel=
ey.edu> wrote:
> >
> > Hello Namjae and Steve,
> >
> > While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU'=
s
> > SEFCOM lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/106-ksmb=
d-oob-read-share_config_request/
> >
> >   BUG: KASAN: slab-out-of-bounds in strnlen+0x66/0x90 lib/string.c:432
> >   kstrndup+0x2d/0x160 mm/util.c:120
> >   share_config_request fs/smb/server/mgmt/share_config.c:168 [inline]
> >   ksmbd_share_config_get+0x5e0/0x1190
> >        fs/smb/server/mgmt/share_config.c:243
> >   smb2_tree_connect+0x2f4/0x1320 fs/smb/server/smb2pdu.c:2015
> >
> > Our reproducer.c is available upon request.
> >
> > Happy to test a patch if that would help.
> Can you test if the attached patch fixes this issue?
>
> Thanks.

Tested on 388b607d107c07aaade04c7f22f344cab6bdccd3 built w
UpstreamAppArmorKASAN.config; patched version no longer panics.
Thanks!
