Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792535284;
	b=TSiStAPlF4W15hGqJoSO6bcm8G3iHraR4HwVTiqDok2qEZ5Zpkdvk52n8onGw3AHYhl+
	 wpz6v2U86BytIBkd/ER72b9f4wzfGXIR6mM27eK9shPaHSar4+nGooF1MMmH8ymtA81ft
	 qE9f+7f2IPNocZ5xDotnakT3G0Euidstd9I1YHyB/MLQXF881gYX92OttBQ1aBeNau/TD
	 7Uh2430tCfwNLd/YKyCGP5JituJk9mRtbDxwO5Nk/HumajawZ64TUlHuvVE9F7VdOrXUF
	 C58oZ3hT5xvvZssbWHkGA3Kj60o0qlwjJTDWypOW5B4RzXYzCkqAs2/pWd4qj8l8aBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G4ZO9/xaGwtst57VlOOA8l2P8QCQh7t0mTcJLRZEW7s=;
	b=sD51lx7OE1JPegA0IFLzrtOPuRBPLNYjN0mwoR49J/SYS/7UNvbHeXEoafwmurGiIWjg
	 McIMr0u87b49rh1q9X/QRIANqae8XAlQ+q89qwssRk3l4cQEeHFi+rYZGpb2uSWlmMk9y
	 QsNog/ToggQzP5kBL38+6gfa3zcpQwuYSZWpHIsTPAUUQHBLDaEinOviSoHPXXdz/d4KJ
	 M/Hkft6zY3tsTxeEVwu9PjGN2oybMTpaqlwAMl6xIJaYkNcHPg0EKyo6LoR465bYzVi3v
	 sA2XWdDdyaDjppFowdfpQYxjulL1pIy5N0NSVXApBHVFSCCPOnKZNVwaY1cLffMee/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rmfEpk+f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F286606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F286606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rmfEpk+f
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4742a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792535283; cv=none;
        d=google.com; s=arc-20260327;
        b=QVlTHwSdZ9laA8Jevg7uY9VY3FatOD4HvsbRt7291uNk2vj19KfDNYmCm21Ggobnvn
         EvA7FrJh0xzJsAXA/YgDY/TVix7gmXHJyy4scpMf43XLQzyitM76mqXGoIp6fnqwHzJ+
         uoEr7YIMYzFUnLN1OtC1sGZ0en0D2gXDUgYezqwGMYFBRWopYGTExezvbLT9vAH71s4J
         ba4ZnoGqHLsn5X+iChA3auaXuEKP9fP1RQzgCih52pZTVz9NqQQP91WarZULamZLlixc
         DAFwSuXbL7hXXy56DZaKbKscp2fBCIlkLqpOHYLLopNcXl9ZRxMTjwYfpsvpqETJWwjs
         dlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G4ZO9/xaGwtst57VlOOA8l2P8QCQh7t0mTcJLRZEW7s=;
        fh=vhyBFiDRWvqw8OpSz1IFmR0Zsy0Hq0L0sWUQ6sQTNZk=;
        b=ARpPh3Fa+eoOlHjnNXnIKaKq2Mct2RnsaZBVDFK1J7u+hyCAyldt7M2uVNgcSHvMHi
         IbcEgE8JnusMqHPMBpmZJv1zc1hSLOIJ0DwlR+muR4eSBzObAhLGx2z0UAQOaZQ4D9vL
         IXtH23hBQ7R8JS45o+QjOduKe98/Ver9Gm8kTOamMG3DTg4GZN+IhecU3IyyBJtFw1YU
         lPFsqswbIqF47kiMahB/IgpFrCC4M2yJkaFB/DCweB+cODtaIbO+HSm4y1A4tOcEB6f8
         9T7WQbwfo7OVgjIGkNYTq5jl0tnH35U5PGMrzfMHRCwHzSSdnRvTwM3Ql/JmJExss1O7
         GS5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792535283; x=1793140083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4ZO9/xaGwtst57VlOOA8l2P8QCQh7t0mTcJLRZEW7s=;
        b=rmfEpk+fCkZv/kL89pFPui7fFmGk1n8reU/QsXYE74PD0EFucUW0hMf+IS4aStL0Q8
         nG8UsAS92tQv9D9ZQHsaoESspRJ/Zb/tLj8EXkHtFpS/b+Yv1XiiogGOoQF3SNlGVDbi
         VjAnWBFpIEg3G+6ql6HnSMNEeatAVsqUGblKkp4VLsG3Vl5mPo6Qjfzp7VqRcZCtcixG
         ZID0xGN14VQRGASeikykGdy6GBWJ9A0V6AFkxpNoT6/e09Wv+fXGPPohwmNppGmv7pGS
         v5JICbY+ElGsHORRCVuJuVcDfeCBoIeo53TU2c1aTQ4ePKBBopr0CzBIg003ZmACaLP1
         mCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535283; x=1793140083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4ZO9/xaGwtst57VlOOA8l2P8QCQh7t0mTcJLRZEW7s=;
        b=tmBgURKNz4oZQMhdVG4+bWyO0DT950zArOdpET0HsmeE24VhFHn1pCZUMDQwWPOuPP
         mpLIIhMedscmyYiCSgDCwMtyV0vX8DYpfklA3DN5EsAdFyoixKlvTBngytQYunoDSziq
         lRY3w1AXzksm/x0Qr7tA3KNYwMukezVQwFIoiPOBFfE2Ig1inDwH0bIzy+6w+OJfBmO7
         wW+EDbQ0T22EYTqnX5KYah6gZ4e2LzIIOsvbRNY3MfOQyT6eIOvEBN8Vo+OtL3DR6ZKM
         rn3U9Dc+U6+AVNX7zw8h9YzN5fDbNNqs6sJ+A9eWWRtDvDZpqUmnACNNbIiKW5w340TO
         hN3g==
X-Forwarded-Encrypted: i=1; AKwUvBzK1eh3SIHBz+BU9IM6+tY++s+47Es1lYe/ekebtMo1/FFDKDd9UUBsMKOsiUC/DjvRL/Qr7VzTQxcYIK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb7lK4TmwQOxUNmqW0DnwxXm58ErCuMps/naTrV4KOfMnUjcvs
	TDPur48gFLD4jKHuS68vMz9Qw6WJUQAxI9hNJMe59Ionkwj3AQX3bHHCupNspdcWghgbqlQvJEV
	wC75QHxvpY+MFymSHZhxTZWnZHBi7t1ZqrMeAaTdU
X-Gm-Gg: AYBFou0M2Wb9VKLM21XTfNlcR3uj7oBJqspGk3RtLPHGNB0wefIfBngRYN5JysVdy4J
	gflWtU7hVTE2umtaQokwLL0QT2FufVEWYQb1TMEH2CCvoZyYPDv+IEOegnaekfTVAbUvHZ298pE
	gsuVUe+hP3tmyKcq3O4teH3anKWwPQ9LoJxwyGPPj8xn8IkWCw1PDP8hqy6YfrjyY00HTMpSGGU
	orARt0iI6IwTKYeEbBChfe9YFpQUajYf9ceEAVa5sTBW8yEOQSbaOGXNwrIjc9vAyxNpthi9DtF
	wQPsmBK/aOnNJ34G8s+c3Z6jzJNG150fu0gXvY8/0b6i3rqYmr3HB/HfnPx2xlA=
X-Received: by 2002:a05:6402:a593:10b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b3e59e5999mr93600a12.4.1792535282334; Tue, 20 Oct 2026
 15:28:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014173945.373295-1-almasrymina@google.com>
 <179249101026.3632927.6502845375265155678.git-patchwork-notify@kernel.org>
 <CAHS8izMRSU3AyVf+sP5uXShiSKuLumZwT=fsgW+bhJz47UoPRQ@mail.gmail.com>
 <20261020150307.258b00e9@kernel.org> <CAHS8izPZ18v_1CnRkaAAA=d94wutJhoOZdOFO_1CEXSexd_=EQ@mail.gmail.com>
 <20261020151352.794bf03b@kernel.org>
In-Reply-To: <20261020151352.794bf03b@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 15:27:50 -0700
X-Gm-Features: AclHuK9dUEuy9FSTZ5UcXIu_nwM1X5COPAnL8H94zeKVggsnQ3YuXniy9SKSJgk
Message-ID: <CAHS8izPOqgG-LffZtN8rmuEt0dS1YZOmWALM9Le8F+rLbVA-sA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: unify symmetric netmem and page_pool refcounting
To: Jakub Kicinski <kuba@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	ayush.sawal@chelsio.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:13=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 15:10:03 -0700 Mina Almasry wrote:
> > > You should have followed more modern naming patterns tho
> > > get_netmem() is pretty bad IMO. PP naming is object_action()
> > > so netmem_ref() or netmem_inc_ref() would be better, no?
> >
> > Ah, I didn't know about the modern naming. I made get_netmem mirror
> > get_page. I now notice it's folio_get not get_folio. I can follow up
> > with a cleanup when net-next reopens. I assume that will not be a lot
> > of code churn. I was also going to try to look into deleting and
> > consolidating some of the now-redundant ref-ing functions anyway.
>
> If you do it soon I think we can try to squeeze it into this merge
> window to avoid unnecessary burden for backports.
>

Let me try to get it on net-next in the next hour or 2.

> > I can also make it one of the design pricnciple in the page_pool docs
> > so that the LLMs pick up good naming practices moving forward.
>
> I don't think it's needed. I mean, if at all we should perhaps
> think about naming guidelines for all of netdev, but no time for that
> right now..

Yep, honestly, maybe even just general guidelines in an even more
global place like linux/agents. One thing that has been working well
for me is coding rules or designs in Markdown; agents inevitably pick
them up and try to code in accordance with these rules. Just spit
balling ideas, nothing concrete right now.

--
Thanks,
Mina
