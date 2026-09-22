Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998845326AE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072302; cv=pass; b=sxHBN+5A+iVnlRwnH//oUiElP3Y+JamxBl4dTztKNtIxgO2SMCi40UmjGraRX1dHRL78HLZ5g3ksOKZyMuRZRb49fdc1eyDdrNQ/1fmhnTovuZgs+cBaZ073rR9JOMSrcd9Fvh0XgWh5T1tPABLsJDbpzIbKDDkXCu5woi2j02E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072302; c=relaxed/simple;
	bh=7msoXiz8ZhQY0jm8uy/r22rhQVLWIg6ZBrWtGTnCYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyjEY2j3H+dIGhttL47Q0DEBHPlyQSBgK8l4aWKncWKUF4ZTkt0+HXxbp9yF/ueCtx/cB1o8C/Of3xaMf8qC4Yx4JTsJtTC95E8inEdYGvFC045REUz9YTYTCWDxdxiosRB0Y6QeRy8UI13C6UKtKhaVWxWDqezadeXNWa1OJKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJtTJCHi; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJtTJCHi"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so616516366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072299; cv=none;
        d=google.com; s=arc-20260327;
        b=U+uMzSmXU+8MyrE33XMwOF40xN56waNJMVLQwQ0fqPqCUtsHfdgPuIY3JpKZgr/GZw
         VqhSKvVd1MbbqeLwvyb5plqU8Ys26iu08URiFIpxcRKN7Uo0hrira4ihU5aSmdbXJ4gK
         tVT+wII4tl7Y7c9AWf11zRskGKBeLin+bbNXox9Ozu97pDtZ2RutSCeLCZFgOGDXK0Wc
         mpeZkaQCH4Ss/AGoubiOGiXuY0B+/BuS4WwdGulk88wBlSSeJi+efXDUDlm6TLIbRqYk
         X0rGd60dH35++WjmfwJZIj/LEbjM+T2BICa1mbmF6FQaejY2LMcMMcntekM/Uj9bgbCq
         tA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        fh=3QFI5vtkmnUqfvWkGUIJQNHyrnneyIcbn4yl9xSgexU=;
        b=B+bR4jp/vLeZwaCVI9tyPhpsN/2j/CIlukgdhRWPuPO7hSgplgXxxyVwAdT6mHTr/W
         sZvwPUo31XOuVVIyL46fqTmfYKi8FOWz7zYZH1F5xWnJCERKPqtIia7WD/beHs9c9S4l
         u0e+jy9/GisCa6WwrKtNStCRDw5SdALr2OnlbcHmVUEdBrodiRliH+S/0HpaU6XhoLuP
         1EJZlvXtrz5JW+E8knYQcvm1DGpZAfqPaKx3I6+BSKOp/qrx3RaP3M30ZXdON1cs3FSb
         3MHJAEH8HL/9SRN7sUCGsAaYHcSoZAxU1sWOmFX/3reNdobI0v+70qdRbZI0yFWEdzj3
         dHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072299; x=1790677099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        b=qJtTJCHi0n3CABWwVvkR5DxsiQ5eboPpLWh4j2/p8u43FK4V0EWXwKGGnLBTo99OHZ
         vSv0kpfj0oocy4OQHgtDncEezFK8suTHiODwbeadgxS5XWQUAjjLnW0i+zIN/H2bSyI8
         oiM56QMolhasWF5c0wAJv3aB7YOBQMZagcza+pwFbSmt7nJpSD+0Zx9l8x4T2V/OE95v
         JtqwzA++Ya/vQRvWXIDY/0whJBUFuVtAnCcH7sd+9+YRp6Da+8ib96VM5tsKTIyckNLU
         mH2MijYxH0rUOqniJ6yU1DAQP0YkDvc+FtDgO2Nlx0sdjQlPyOmUEURMxDZTYcsde6Rx
         9kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072299; x=1790677099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        b=YHu7ImvGlNmLEfickkmKFtjwGmz6o/0YSFdyH9N4QgrnfMRfXtONmRgoJM8/xqqVOH
         Rrd7hjP/VTWXvj47LP81WCw9GJGtMCM4wDq4G0j22P9kZa2CKiKsccwCxbhKLm+KuZfD
         c1EmVp3R4dB3+9n0Gf8zFyp6KKwbm23m6zyJdtiejgiS5IUvGMr1+Uhd2dn30yaOp5jy
         j278mflktq8cmQbAdbF3Eg81Q9SzAGpG13vwXGhqXEO8FnRkIWp/4A6pOkBoSV04jvpO
         V7ks7WCY6rKhy1PBVbdjDtlxHDNpvMwLVpmZN8rI8O5+7ybBOoHnzF1dGX8DtbihGobx
         W7Kg==
X-Forwarded-Encrypted: i=1; AKwUvBx2YmLhHHLFBGsGjszxuNkXBVFnDndEcj+niRCQLMML1XIMfYqrMF847e+CqhJnviI8oIlm4XLw0pjvBBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lmyWi/AkyjYa0/o29icmzvmERhKRMBKh44cw81ZvuDZUlwIKTx
	KUViW1eq7E6cG1Ee6mERIbX7PWjQHzUsMf2v8quYgPS7NqqbD0cIr0B6dQ5cEeiDqCXD9+LoYxA
	POKHLa2iXRmt8E67q2Ppn3uVDSb9CbrM=
X-Gm-Gg: AYBFou2N4UKNzss43+SQiUJjP/2czohFZuN+XIHoHdjnpypgFOwwtRLd74QYUuiFfp8
	eJxU4rKH161GOBnLOiwWYU8gb4JS0oDldNPynirs4YptHjqi2tKSemcjSUuNFxYJUhAqoPSEQAI
	+9y0q4vZv4Y2OcRJHZlpZLujaDOdCV+BiWkGtsFMqiHcWgK9ZQUuxnnEa/4+I6Fh6ar+76fivYj
	kq3HGuhGIJmo5ZQ5O5T0MSnnuTon/Vd55rQ7Ljz22/sZF9iaE2VMoRvByX33Nz21bVsI18NVKTg
	EJg/+oJf/iF5vpIgt5qKL79MLtH/wBZYdhli8meikhjrc5wYtB1vpiVS
X-Received: by 2002:a17:907:7244:b0:c29:4490:50d6 with SMTP id
 a640c23a62f3a-c2a15cc7b3dmr1214184366b.47.1790072298525; Tue, 22 Sep 2026
 03:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921125805.224979-1-horms@kernel.org> <20260922080750.35929-1-ndaugoing@gmail.com>
 <049e03e2-3648-4a8a-8959-d88a56545f4d@ixit.cz>
In-Reply-To: <049e03e2-3648-4a8a-8959-d88a56545f4d@ixit.cz>
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Tue, 22 Sep 2026 18:18:06 +0800
X-Gm-Features: AcwNN1U4xZeDysD8F_-uIUOnyy4axDXfoxw1BjtNX_Q8SmqiH5PTE1y2i5vEhBo
Message-ID: <CAC2BP3+s=vGTxUrTALO3Fq+kUJODCpCdbujwkFK5txL9GFk2uw@mail.gmail.com>
Subject: Re: [PATCH v2] nfc: nci: ignore unexpected CORE_RESET_NTF and CORE_RESET_RSP
To: David Heidelberg <david@ixit.cz>
Cc: Simon Horman <horms@kernel.org>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, oe-linux-nfc@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks a lot for the pointer and explanation! I apologize for the
threading confusion =E2=80=94 I mistakenly chained the v2 patch under the
previous review message using --in-reply-to.

I'll re-send the v2 patch as a clean, standalone thread right away so
that patchwork can track it properly, and I'll definitely adopt b4 for
future submissions.

Thanks again for keeping me on the right track!

Best regards,
Yuchao

David Heidelberg <david@ixit.cz> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=
=A5=E5=91=A8=E4=BA=8C 18:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 22/09/2026 10:07, Yuchao Zhang wrote:
> > Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
> > added handling of CORE_RESET_NTF in nci_core_reset_ntf_packet(). When
> > received, it updates ndev->nci_ver, ndev->manufact_id, and
> > ndev->manufact_specific_info, and calls nci_req_complete(ndev,
> > NCI_STATUS_OK) to finish the pending reset request.
> >
> > However, unlike other notification handlers in ntf.c (which validate
> > ndev->state before completing requests), nci_core_reset_ntf_packet()
> > does not check whether a core reset request is actually pending.
> > If an unsolicited or delayed CORE_RESET_NTF arrives (e.g. after a reset
> > command times out or from a misbehaving NFCC), it unconditionally:
> > 1. Completes whatever request is currently in-flight (such as CORE_INIT=
,
> >     RF_DISCOVER, or CONN_CREATE) with NCI_STATUS_OK, leading to kernel
> >     state desynchronization.
> > 2. Overwrites ndev->nci_ver and manufacturer info. Because
> >     ndev->nci_ver is used as a selector for subsequent packet formats
> >     and parsers (e.g., in nci_open_device() and nci_core_init_rsp_packe=
t()),
> >     unexpectedly modifying it can cause protocol format confusion.
> >
> > A similar issue exists in nci_core_reset_rsp_packet(): an unexpected or
> > delayed response packet can prematurely complete an unrelated in-flight
> > request.
> >
> > Fix this by ensuring CORE_RESET_NTF and CORE_RESET_RSP are only process=
ed
> > by the core layer when a reset command is actively awaiting them:
> > - Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
> > - In nci_core_reset_rsp_packet(), ignore the response if NCI_RESET_PEND=
ING
> >    is not set. If set, clear the flag and complete the request on failu=
re
> >    or for NCI 1.x (checking skb->len >=3D sizeof(*rsp)).
> > - In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
> >    completion, cancellation, or timeout.
> > - In nci_core_reset_ntf_packet(), skip power-on notifications (trigger
> >    0x01, identical in NCI 1.0 and 2.0), then check and clear
> >    NCI_RESET_PENDING before updating device fields and completing the
> >    request. The CORE_RESET_CMD trigger value is revision-dependent
> >    (0x00 in NCI 1.0, 0x02 in NCI 2.0), so both are accepted and gated
> >    on NCI_RESET_PENDING alone. If unexpected, log a warning and return
> >    0 so driver-specific handlers (such as fdp firmware patch handling)
> >    still receive the notification.
> >
> > Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
> > ---
> > v2:
> >   - Do not abort the notification pipeline on unexpected CORE_RESET_NTF=
 (return 0
> >     instead of -EINVAL), preserving driver-level hooks (e.g. fdp firmwa=
re
> >     patching) per Simon Horman.
> >   - Skip power-on notifications (trigger 0x01, identical in NCI 1.0 and=
 2.0)
> >     while gating both NCI 1.0 (0x00) and NCI 2.0 (0x02) command-trigger=
ed resets
> >     on NCI_RESET_PENDING alone.
> >   - Check NCI_RESET_PENDING in nci_core_reset_rsp_packet() to avoid com=
pleting
> >     unrelated requests on unexpected responses.
> >   - Explicitly check skb->len >=3D sizeof(*rsp) in nci_core_reset_rsp_p=
acket()
> >     for NCI 1.x handling.
> Hello Yuchao,
>
> please never send follow-ups as part of the thread. Always send them as a
> separate message (otherwise they may get lost and we already have patchwo=
rk wich
> can track the submissions.
>
> Even better, try to use tools such as b4 to submit patches (easier for yo=
u, sent
> in expected format for us).
>
> Thanks
> David
