Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF50538D98
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155198; cv=pass; b=neXpTiRJ5NEfK9dumfRFYhHsboDPgb8rPO/CtDJhBeVxgeauzu6vAtocv5nz9dYUD7p+IrYftyFDHocnwYvLHGPAgX6M/Sjn1Yl4UUpcZGId+kUKSOTAvxt/mZhGDm0AN4ws4e4bw28IRuyAfQlSeNt/ze+Pud/hIR3Ybhu7CC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155198; c=relaxed/simple;
	bh=CGyOJflPw9TgiV+rqedwCHC27ERtreB0Gsv6VIvPr90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7ZrGw7iSNa1MnmyopJy5kYBzZkuB8E+Mwv+v95z5VbinQkKxPYyb/gl6Ex+usQlh9MBs25ttLtm8kPHx1CKDPZBb1z7HqzTGrApTbZaiHO969sTnQ07ppt2JZPOjxLLeSdtEXh7ZLm9l2WmMCEhqa3f8lu+1wG4JnJzpoyz8UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm/oUhEH; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm/oUhEH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-87005a0e052so16413617b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789155173; cv=none;
        d=google.com; s=arc-20260327;
        b=jlu6b/FUM3S7zT37b/gfvM7ruYV4j6zZ9XowzBimGMPOjIhVEeJ9O5znwcsM/0mk1d
         uqtW0y+6+2MGZ9UUtcTbK763X+iLfaixzHtd0Yf+ZknTPVWKVudHi0kYj9MIubYO0YdZ
         s7QD59J5gfqErDj3TySO5sCzlRyW8sqEmSscSbnk7wBV77Uy349fa9+l2PNm6FKrebKQ
         fFEQmmkMjZgp1fcrhk/cQkQ0webxPUvSRXQ4rI4M0yfVklP/zvDeh7Jl4dOoknJPkm4K
         WSGUK1RYkHxbR5mROk4I+9KiKyUUwY3TgDJuCwMvep1K3UznQMKe6p9O1wCqcxfsxICh
         EWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/rJ/7COLhmxpolU24jgY2LdSFwnw3Shgdsy8Wx+a790=;
        fh=SOHrOijkKIz6C0ITMijyv3UU4/PmZMM0GVkCvGSnGEg=;
        b=dKgD492mQMHhXJqFWuhu3GXLROF4XgOqPlj1dzs05grNptf48CQ0LKPEL/vKx9/inm
         DYKEXjBuRWopASTWjcnNo61ZrMH9rc3nBSm2fHdYXnDq2p6Ok+LVk3ALcyPhtxlJ3qND
         /tgPKvo9LC+hYpaMcfbouoFmDsoBzNGv+yFI6RrLCsBe98FEN1/AIJ5VHQlJEbU5MQOT
         3R43wyladb8o8DksUmJNu4B0hz6MQuQS0orUVkC52B8iAUIgzUhfd1hEbDukSMCK4Dzk
         l5FySSXbUy60/mshtw1DOuDYFyUzJ+4FQd43SZOPuDltM7Qipw47js1lM1q+3AJ9HNPF
         sU3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155173; x=1789759973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/rJ/7COLhmxpolU24jgY2LdSFwnw3Shgdsy8Wx+a790=;
        b=Pm/oUhEHcqPF43r2HvKgd0CydFNW8cBsXI6K59+mMSlso0bKPZ6hXu96UZBd1MRqAk
         4+3131sVWFYveKQigE6rBRsXxF7pp0XR+4lYbkTFOn+VK4Geu0tMLnr3OGYjlsrfMhok
         AE6a+7xdtyOiaPql/tXmhfMcymORcfLuY2VQFQWv3BjERrBN1Tat00rtMiPHTYOaX9Ms
         rC0C+ZaiUO4bKHGgXozk04YiQwkGOMS4B44FA+gGOtZG5zHRBdEjU3rlpKIfX+XNolz6
         UYF2OWuxPX5h3Uf28jMXl8pf7ibY2IONKkTXAzfERpNKUnl52+GsSeBVmdUfv/EwhClj
         ktIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155173; x=1789759973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rJ/7COLhmxpolU24jgY2LdSFwnw3Shgdsy8Wx+a790=;
        b=TIg1O+9/7t8ILXgWtH7dJKJuXyfWZML1tKFnCv5I23/gAwwhZ22mXPdN8Qkj6ISOP7
         6wBulZ8acuVx3bkRvG46ePIXtzl2D6FeTAyM6I1azCfuu/G7rf+ksdb7oeTxoqqR++rn
         /HYJBL91HIFVITrcL/ZvmfJdgd14wIpwbUaG+wS+10ZFlcc+yjXAobdz2gkTnxN86EKH
         ekH1vmE2PetU89QxQ/XzsRL9Ocidv+t/wQ/xvkDIosilgOdXSB9Efk4hDqkJ8rzWnmoz
         GfEWPqoOAwQrWeeAJNMNm4rweD7KDOs/iphK3V2JJxRYEICCq3LBl0t7GQcLNMZwXZ6t
         h4GA==
X-Forwarded-Encrypted: i=1; AKwUvBxkupvgRdm4kx5s1XJD34A8oEOkZz+1l/voBgeBtCDdrHX5c+EXe5du9qx2ZppyR4EP4bQdFwsCGuHLzDw=@vger.kernel.org
X-Gm-Message-State: AFuF++khAG0BSM/Y78YdgHsMApU+rcYbgCh82olv3ZQ3RZb+I46DU6iT
	aS+7pMVvYLuPZ/fJqhL15X+IcbPFB0zex0mkizdLoSHoRYSmJ5xGCwYF8cpncXBHj3f4zBF+6Dc
	3Wc2ImKItuTBU4KsXLK/oNpuHH2LU6/U=
X-Gm-Gg: AYBFou0iQuPHPwV5tH00Bir0brs7Y/zsq+6ef+U2Jy9rfrJuAtPnRnPl/S+9mtAfKYH
	El70S5Nmza6B0ure2byT8MfwjK48bvxvP7F8yfSYZ+JFZLkoKp8bUoQ/a5/DWgnFy2Ezdaa1BKG
	zJphy2vzT/dFheW/eeJ4PlJ1Rnn8qAVVJWHKEwtSCUiAsIb8IM5tcMFlI/bhtLtl/Kf23YhU9Qt
	X+RIqaTWufp1mNWjacW2Vqnh/HSXRbTvfwatnk/R4umepbssNdbNFMNXLxP5/pYQ7NyQ5P3KS1A
	VAnpgfKMrXN2EwBj2764MER3v2VxPxX7X8HztIsaiiPZ7+V4zQ6z8ijd2XDdC7dwPBotomRhFFc
	mZHNl5AE5fylmjbfed/wrVBL8wh26Qv9oebrGk5A=
X-Received: by 2002:a05:690c:c50f:b0:865:c62b:6075 with SMTP id
 00721157ae682-884adfe8f7fmr22555577b3.2.1789155172327; Fri, 11 Sep 2026
 12:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902235132.453044-1-mikhail.v.gavrilov@gmail.com>
 <20260904012028.77590-1-mikhail.v.gavrilov@gmail.com> <e316af2c02709047ae4982a72d92bebc7feb81e3.camel@iki.fi>
 <1ce72e4f26b5c35940a160d121cb479203e5d565.camel@gmail.com>
In-Reply-To: <1ce72e4f26b5c35940a160d121cb479203e5d565.camel@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Sep 2026 15:32:39 -0400
X-Gm-Features: AcwNN1W9JIb3p4fVmP5IRreVpehwt6CRRZxNeTdV1ae3_S4uHbdAWA_8dkBZJFE
Message-ID: <CABBYNZK6kzJ0z1Mi5s4Ju6wyd-G0TGidQBJsrnPWhFbDA0abqw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: RFCOMM: defer security confirmation to krfcommd
To: "mikhail.v.gavrilov@gmail.com" <mikhail.v.gavrilov@gmail.com>
Cc: Pauli Virtanen <pav@iki.fi>, marcel@holtmann.org, nicoyip.dev@gmail.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikhail,

On Sat, Sep 5, 2026 at 10:49=E2=80=AFAM mikhail.v.gavrilov@gmail.com
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi Pauli,
>
> thanks for running the checker, and for looking at this again.
>
> > This v2 checks session hci_conn is the same as original, however it
> is
> > unclear if delayed processing of confirmation on the same hci_conn,
> can
> > result to wrong outcomes.
> >
> > What makes it not introduce new race conditions?
>
> Only two values cross the window: status and encrypt.  Everything else
> is read when the confirmation is applied - the session lookup, the DLC
> list, d->state, d->sec_level, and conn->sec_level in
> hci_conn_check_secure(), the last one under hdev->lock as before.
>
> Confirmations are queued and drained FIFO, and krfcommd drains the
> whole queue in one pass before rfcomm_process_sessions(), so none is
> dropped or reordered.  Two encryption changes in the same window are
> applied in the order they arrived, and the last one wins, same as
> without the queue.
>
> That leaves stale status/encrypt applied to a DLC list that may have
> changed meanwhile, and every path they feed fails closed:
>
>   - RFCOMM_SEC_PENDING with stale status or encrypt =3D=3D 0 sets
>     RFCOMM_ENC_DROP, which drops the DLC;
>   - a stale success does not clear anything the next confirmation would
>     have acted on: if encryption really went away, that event is queued
>     too and reaches step two, which re-arms SEC_PENDING for
>     BT_SECURITY_MEDIUM and sets ENC_DROP for HIGH/FIPS;
>   - RFCOMM_AUTH_PENDING is answered with
>     !status && hci_conn_check_secure(conn, d->sec_level), and that
>     function reads the live conn->sec_level.  A stale failure can only
>     reject.  An accept still requires the link to be secure enough at
>     the time the decision is made.
>
> So a stale confirmation can close a DLC that would have survived; it
> cannot accept one that the current state of the link does not justify.
> A confirmation that cannot be allocated has the same effect - the DLC
> closes on its auth timeout.
>
> > GPT-5.6 produced report of pre-existing race condition where
> > security_cfm() races with DLC open and results to intermittent wrong
> > security level, but I didn't verify this was not nonsense.
>
> There is such a window and it is older than this patch.
> __rfcomm_dlc_open() sets RFCOMM_AUTH_PENDING on a new DLC when
> rfcomm_check_security() finds the request still in flight, and the next
> confirmation for that link clears the bit and answers with the status
> of whatever event it came from, which is not necessarily the request
> that DLC is waiting for.  Before this patch the callback took
> rfcomm_mutex and hit exactly the same DLC as soon as the opener
> released it.  The queue makes the window longer, it does not add a case
> that was not reachable.  Untangling that needs per-request state on the
> DLC and looks like separate work to me.
>
> > I wonder if the kernel_connect() could be moved out from under
> > rfcomm_mutex, since the RFCOMM channels should already have to handle
> > transition to CONNECTED state and possible failures there, and the
> lock
> > cycle solved from the other side.
>
> I agree that is the better place to fix it - it removes the inversion
> for any future callback that needs rfcomm_mutex, and it leaves the
> security confirmation synchronous, so none of the above has to be
> reasoned about at all.  Luiz suggested the same direction on the
> original thread.
>
> It is a rework of the connect path rather than a regression fix,
> though: rfcomm_session_create() would have to build and connect the
> socket outside the lock, and __rfcomm_dlc_open() would have to look the
> session up again after re-acquiring rfcomm_mutex and drop the socket it
> just made if another thread won the race.
>
> Luiz, which one do you want?  759c185d0bbd is in v7.3-rc1 and marked
> for stable, so the inversion is in a released tree and heading for the
> stable trees.  If you would rather have the small fix now and the
> connect-side rework in -next, v2 is here; if you want the connect side
> instead, I will write it - I would just rather not write it twice.

This is not small fix though, so I rather have the kernel_connect
rework fix this for good than doing one on top of the other.

> --
> Thanks,
> Mikhail



--=20
Luiz Augusto von Dentz
