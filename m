Received: from mail-yx2-f21.google.com (mail-yx2-f21.google.com [74.125.224.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7145D1B1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.149
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582703; cv=pass; b=iRgIPADnFEiXHDzpnNRp7mr7EbbejrCKx8Etyr8Wh1HYZynSC95q0NKqrvgVAChXMoa6du8JPS33zZv43EPRg7pQoWpTdmV3MhudXd80XnQyIttc7Z/79bK+Om2S2iOawIYLyVa5Ujd+PP/Jm8anlaTcFxWSh9Or0I8y8CB3RZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582703; c=relaxed/simple;
	bh=rYGzTv4II1xcif7R0OCDIGqLZTgPuzaXkmrhhhmD0oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THjGNj5p7Ndb73h8PbODwAXC1XCP0/v/NZMTkBh+niO8EIMGsoZj4BejBbg9xnhzMLP+dJq1ai3wME++Kf0AkEOa/G6XoLCh7geJ4S952nh98VcgUUEQ9VAgolebiDCFia53nUq3ExvUYA7oUDPPa5v/5RnGxZ1sIkx8nDk1Y4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qguuBaEN; arc=pass smtp.client-ip=74.125.224.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qguuBaEN"
Received: by mail-yx2-f21.google.com with SMTP id 956f58d0204a3-6730c3bdb35so1643483d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582701; cv=none;
        d=google.com; s=arc-20260327;
        b=rN2yP2BNG1kHTEsJMivhAF/C2OEtObjzW3bPaz17eMsuj16nR9bmw1xryP9CBfPsx1
         wKaxupGOreQLr4ncZrVec8Z9SeTb0a28J2fghDaraTcuwghmm+sQ/Sgzp15caxMiTwae
         Yx59DiocWbAqTRQDa2vtHpqtI0LB33HvB1mvRo12mkmlv2LBZwoQ9tC0udH05Z89fxti
         4XQ1lkrX54yafwM8rNJevjF7m7T3uZ5BRn88xpxRWvLQ/XUbLU9b8Phi1CoV/tMFyHS3
         AAsuThVPBFpsFiRmvu/O9ugDw/bmYiKfMqnBwqfWGXcNWaSvkCsDofk0n84XpNugN/n5
         i5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weemlP5ww78KHBN9CNOBBf9t9fcK7VK8fKkN44aV56o=;
        fh=x3T+fRKHRIffb4Kfa7me6tzgj3vp6E4W7i80TpYLFFU=;
        b=U+zeD6ZTd2fI55Dp0dr40FQX4nf3kmrHhk1UIEaO2wZ7yBUQw4tgIW718EWRpFfZ/L
         z3Jfkkd1tXrvOy6EbonFmAfNG33HE9sG3LkP+kvTptqxuDxgBguaSkS3zLyn9tCQaH0I
         G+LRBu6Nyrx7q5Q7GA62As1ZfW2fqxpMVA2yRNkOwjRzVRAZpp7WPNWlWB3+RyzKbOfU
         SS9hxTMJmbbNAKUghq6sXuifg0dH5/pAv0FqLBn1ng4+WxydVPedFCgTTFuDnOwLcpB/
         ZafIIE9OCP6g1Fro3zHIKyPfKf/NXNR2YkytQxRMsBS00nB/sQOtFK+QU+7sWHAMyDul
         cH3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582701; x=1791187501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weemlP5ww78KHBN9CNOBBf9t9fcK7VK8fKkN44aV56o=;
        b=qguuBaEN3aaduO610ckaOBsjmhIgP0Cntaa6x+5d9EUjpvSa8TDR85Yh91lKVMjkxJ
         snAnIc42q7I6C8ZMVMmZchYHIMJ/ENnKsT+71BTIhWh7NfNYLC93U6LtqqUzz35LBvZX
         wI9xNCA8e8PSQZJxzGFpJmz9cIHRCcsDar+HcD/3s/qvPaKA999RiT88/e9kiGK6S6Ly
         tei2sdT0QeUJgDzSZuv/+HhMlw9QALY0dSktJ4t0IN4qeGXix8hfxARav5wrBL5TItPd
         oPic6si8wGkNqWAvRW3ub1f1mE9OGpdtrQUUJ3aKwzPPZHNy/K4gY9FPdrvMnS+I4tOb
         17GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582701; x=1791187501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weemlP5ww78KHBN9CNOBBf9t9fcK7VK8fKkN44aV56o=;
        b=Q3T2VGUTg+QWiZ8v3mF5NO2qcaSxMPSN6ForCy4ELw4sj9ilht3HtPW9kp4TPaVEFn
         1AZn0zWz016V4/pvIXif9Jzm/XTf4kpzSkgWshS6eKQ3Q5RoPBproe9weSoq4DK3I+9j
         yt+jicOgW2CxROcbvYYsbsfzzM1OsUsxXez565Jwcon1PKu//XrsW/xYsQjcfsAl4rCI
         E8rBXj88FEXNfGZCsoIxde7kLRDLWclmBImYMqvdcFzMyJOJRqDqmaQR5WIn5zVkChjo
         ZjfBoq5t/frvTfuy7tdFqBm+ZNSAx0T47leIWy8XlTqO/1EvmOyvVuWRhEBMoE9fPPBg
         l1HA==
X-Forwarded-Encrypted: i=1; AKwUvBy2t5woBdBPp46R9cybBZ4JxZAEBJiWCqj9uPvc944Y3u6WCHONOJzl84HvepWKtOZ76D/iEfX/vFCIEl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZZrg7lrjwUi6vx3LPC5FuZF3ox/Rt4xVfz7a02JY6YZ4a+8ig
	2oZl7++wZ251GcjPeFai2i6aoOn2XELu4JjNNdyuZp05XTylfOUujiomkiQLTbClOAbJSV5CBKw
	mui4oTBBZQmQlPYyLHzyugp7kD2trIi/Z/u0I
X-Gm-Gg: AYBFou1C8UtJYa87tJBaDIHMzsJIzcBGYa5Kzf5JpAorOGZFELDiXT8px/NAcoE57oB
	LsQQ2L+eIzfoRRA3dejN+il555+dsV3EWGH9/EQbYHQKI0WcukBeWZ6dpLsBobhQJhxWwa/OzYp
	6uxQnk5EkhFjC3SUj16hvc6hDNClfx25+Uoj76Hsj9rYjdVtm1csackVtNG+QpqR0Nt4r9H8gng
	W50ErO41c9yv3kcV2+4CZqkX8Vt00O8gDjb4Tm0DDRBLJzp89u1iVV4ywtdLNJJHB6uWUEmfNRn
	8iHq0sZXdCLDOs/2LjjIerytEhP2NGR547f0dGtGviC8nWWnCczFNVI=
X-Received: by 2002:a53:d4cc:0:b0:672:ae78:caf1 with SMTP id
 956f58d0204a3-672ed553f55mr3376425d50.50.1790582700894; Mon, 28 Sep 2026
 01:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922060048.13158-1-ginger.jzllee@gmail.com> <97f59588-8236-4566-bd8c-7be1a735cc1e@web.de>
In-Reply-To: <97f59588-8236-4566-bd8c-7be1a735cc1e@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 28 Sep 2026 10:04:49 +0200
X-Gm-Features: AclHuK86-mxPjYzK6T9aKDFOww6nLLaEc7jcFJWsZ-8gLplzX4I03ZZcu834sZE
Message-ID: <CAGp+u1ZcA5vNhZ_Vx2HscEP2x3uXc_CrLQ0f7FNTa3UKFYyVTA@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: Protect local_alloc_state updates in load/shutdown
To: Markus Elfring <Markus.Elfring@web.de>
Cc: ocfs2-devel@lists.linux.dev, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thanks for checking. Do the following changes match your expectation? Thank=
s.

Sincerely,
Ginger
---
 fs/ocfs2/localalloc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -342,8 +342,10 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
  goto bail;
  }

- osb->local_alloc_bh =3D alloc_bh;
- osb->local_alloc_state =3D OCFS2_LA_ENABLED;
+ scoped_guard(spinlock, &osb->osb_lock) {
+ osb->local_alloc_bh =3D alloc_bh;
+ osb->local_alloc_state =3D OCFS2_LA_ENABLED;
+ }

 bail:
  if (status < 0)
@@ -392,7 +394,9 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *os
  goto out;
  }

- osb->local_alloc_state =3D OCFS2_LA_DISABLED;
+ scoped_guard(spinlock, &osb->osb_lock) {
+ osb->local_alloc_state =3D OCFS2_LA_DISABLED;
+ }

  ocfs2_resmap_uninit(&osb->osb_la_resmap);

@@ -441,8 +445,10 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *os
  ocfs2_journal_dirty(handle, bh);

  brelse(bh);
- osb->local_alloc_bh =3D NULL;
- osb->local_alloc_state =3D OCFS2_LA_UNUSED;
+ scoped_guard(spinlock, &osb->osb_lock) {
+ osb->local_alloc_bh =3D NULL;
+ osb->local_alloc_state =3D OCFS2_LA_UNUSED;
+ }

  status =3D ocfs2_sync_local_to_main(osb, handle, alloc_copy,
   main_bm_inode, main_bm_bh);
--=20
2.43.0

On Thu, Sep 24, 2026 at 6:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Take osb->osb_lock when updating both fields.
>
> May lock guards be applied in affected function implementations?
>
> Regards,
> Markus
