Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652104;
	b=Pv2BaOACDbFQanULMhRAQl4nuijqAXK1JlOLzVV/Z/QmqtSEIuarTN//zTAUQ7qChAkJ
	 DFXmChsE1pJiQ6CY0Bkpr+sH3k6LIaPFkowmnre/4P+0VqvwAY4OaopmgN9mRfdr++762
	 SvH07g4Cdw1PLw2v+i2UUBrEEvM4SVjJKWM2CmuGItE/y1M/lpqa1+UALDItEMNV1ymQr
	 Lx68+92MXB10JTLr3a+g/3Ro8Bx9mcxAmWETij1vmosyu014kLuY/NdReq6fq5pYmUu0H
	 xPD6GfiWQsEmEEn40BJYkpySoUamQl4qbDaqvLOV8vt4RbwXhywNk2xXUjJxA9IJN9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652104;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=pPfuhXuKj4uxJtVgdwO0y4Sg1BoFJPH2OXHo0IrP7P0=;
	b=masw9PHltHFYb7dZ6EDas2ReXqu8R5yjCBLCtZl/bNbLoN3sU+ajM2xzSUjKejQySBWC
	 JHVxrntw+70Chd99F2UTNesaXiy37uVdaHASDZlZvVcxSn4UJgZVkDr7Be0/Tzkd1jrCW
	 vKNtydTTwFUOlgypmcwbJpgjRPIbbbswTvpJjKEnYqSQ1mKcv4kZDBVBxaoE0j8dTOmZt
	 mADk6qz4nLYO72A4+t0+NU323K6JCdjfZ+G8E2y8/QiukgKD1XuWoLPfV5vd+oK/x8V1r
	 Rhb9NwZueNSOfJ2u7NLNHbudlRGV/2tF6TeA37LXKiQY/cLYGaD5KBCZ8Ck4LpmtJnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U8O7AQDL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I0QEdoie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91A606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD91A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U8O7AQDL;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I0QEdoie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPfuhXuKj4uxJtVgdwO0y4Sg1BoFJPH2OXHo0IrP7P0=;
	b=U8O7AQDLY1PpUkWVWskOBsLg2fzmrCtvfpJb3eR8vu7Wc2nQJAvFdN3u4wJH7zLTaqvBcK
	w5fssyXVrFLH4tzRUfQhMrJqjrjuri/3eOtGKQlV/f5eBPNnMjbIYnNe+8+emYdolRlbKB
	1x/fuwwfoEmzGcaqky3q7T74/z+YdQo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-ccsii2DnPAmewtE_Nyr6xA-1; Mon, 02 Nov 2026 15:41:41 -0500
X-MC-Unique: ccsii2DnPAmewtE_Nyr6xA-1
X-Mimecast-MFC-AGG-ID: ccsii2DnPAmewtE_Nyr6xA_1793652100
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ab382d911fso15809091fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652100; cv=none;
        d=google.com; s=arc-20260327;
        b=EEO2KLaR+P8LhjTxyW35N3sLt5m+oyMD7WX2UZLVGob58uFWY2gvDiwlU5vJWeYV0N
         w8KMKbwTgV7avYTisIcO2DcRco2L9g0NodHSgiHftm9esR+cr8A5JY/uuv+kimm0eYNg
         YdWD929+anRwYJKNvNjwhnUqEsIXtl2AVLevyDhZ4UJOI1L0j01F5UUiGspKDi5PgYxL
         DeTDqbdV46hFckA5ScKVvQg+okHzHfDPwFv4S8CkoyUCjejHtlqFUqK1BpEE+DIbWbqb
         4hDyVnO8LRwNEjyNQjr8b1wrrRIISajQVydlFPcKrhDkqOwTvLk3xOZvLA4Le3OJ496d
         WpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPfuhXuKj4uxJtVgdwO0y4Sg1BoFJPH2OXHo0IrP7P0=;
        fh=ToIHo66zZl3nFNQt1dKCx9TIh3RDgx+KIVGBALC3Zts=;
        b=LjjJ185IbKYIoDMedFV/D9jvPAFvMoJ/6ZtDc7GQlQDrT/hFV4rRU6wGzQb+1Hbbsu
         OVRnMqCOaGfe68DmStJ+u3ZGigQH0b+qqPwHcfPCQGSjGpLkVZgpLBvReUaEfyII8Ab2
         z/oIzs2+959dRt14R9XqC7LdyXdb+pipAwwNQn9fOVFXP4Z61Yj4P8vKVh5/5zMA7VOT
         xYjFe+Lb/MDIp5tG1KFHQ8s6ixRfQoAz5AdYyim2jYAr4oMsIcJnagg6lF0EUAZ5EWa2
         i4s1ZgCW+Vsrl7Br/xD9QiDcr5cgxAgvuCY7dirS67MHjlWDaXO4EuZDzSOqeoVOFA6L
         NRoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793652100; x=1794256900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPfuhXuKj4uxJtVgdwO0y4Sg1BoFJPH2OXHo0IrP7P0=;
        b=I0QEdoieReXcyzBFfRr31Q22SKhdziBS0h3aw+J9hX7hC2wQIuXQoAASYo6Pn/h9xL
         JrvtgpGbE/QDxfhgFBt8LjfmjP9b74uzjvY0tVDuRH7y0Jh66tGcDn6GmJLrUxsJMEcq
         jeWl1ecAjlUzfD0K23v23uQSPLCWPz9OGLCI9W1Hanqc2jaeMl8nX0NHnkZiVgsH7yYM
         po5XTTJtQfw4Zlxc79dZEnR483/5pS9QLqAlAoV2U293OnVf0K2l+7OCiqXJKgwLpzy2
         gb1LQ3q9AfGoymnN6ps5gAZgeu3BVD0zCB2Jiiy5BmAbFSk86kfqEFQyNx9rweXbmlfd
         1HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652100; x=1794256900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPfuhXuKj4uxJtVgdwO0y4Sg1BoFJPH2OXHo0IrP7P0=;
        b=tXSRFNCz+XdCFTdsCfY+MOLPJ2ZozJ8gNRMqwt4XkuazpeVzjCdTbhPgAG8qWLNubf
         VhiVJ1Od7ghLwBylXWCZrxgORNpaaNnGFFoIFmfcPCcucIbWz/V3cQd88qoSIdt+DNde
         eHLlFOU/rVUzzLWBJDgJjp9no8XzzWhZ8Y631CVbjPo3T7gR6ZlSksTaWFYN4OnZjrl1
         UcddvZ+ATtdaGTcFFRDqTkyIlRgm6oIEfIw4GXiGwEVqixD1gcszPv3ASrIhjgQ6cMkZ
         nFBFAYfK5PatQ0HRsPKnHdGVV/92h2duTukSQQUCK2UPbW+28+7GyZopC3nEyI4rxEBG
         pRBA==
X-Forwarded-Encrypted: i=1; AKwUvByYnTXWDlwi1EJWmXs5P2y9jveUsn/8enB+kziME1+9lhHFzTikB2dwhb/hpfibDJxa27GPK7Z3SM/PeAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JSVbhaUBavUMjREyuAU79K/CpsYDB3Enehr7zAxjuNgEY2aBZ
	Nh+9tOBsgj1azz5b7CVNfisACQ+h13V0DADNh6LbTfVxmeb+/MK3cRY5I/ZhNTR7pxVFH7WttmT
	mNIY+XL4SOtltV3ot8zhA0PYWerVJ2QLgvOpL1TXXlDjM8ITFER5sTLRBSj1Cn4T069sNZn42hU
	KvrS/TT0Va9K05y0ezbFrvDJWEIIq+7BhpMvmxHlkL
X-Gm-Gg: AYBFou2nMN8zYk7S26Opi4DYN+aPlF/v8NxMosXJguVzzAW/Q15l+y14CIiFr9ZFpWD
	Nfck03LtkXBQl8lFY3RnWeqGwV6oGUmZFkxyWvrdEOxOZcOodH1VvPc58xUjSVT+njMPwPPlZgc
	sWJHLJ8d/ehXY2iTPn3/kKnVlCa1tACyCHVWDL5ek2bz1ac51pkRGXeyvL
X-Received: by 2002:a05:651c:150a:b0:3a9:8167:62a with SMTP id 38308e7fff4ca-3acb7b6498emr30604671fa.28.1793652099941;
        Mon, 02 Nov 2026 12:41:39 -0800 (PST)
X-Received: by 2002:a05:651c:150a:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3acb7b6498emr30604611fa.28.1793652099559; Mon, 02 Nov 2026
 12:41:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019184849.24422-1-sanan.hasanou@gmail.com>
In-Reply-To: <20261019184849.24422-1-sanan.hasanou@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:41:27 -0500
X-Gm-Features: AclHuK8WVNVvU2rcm4KZuGFkSSfZ2u0smM4kgrswPda8flMMQv9IN77de7FcSJo
Message-ID: <CAK-6q+gvq=y+P+wmUTGWJcNRLP1Hjw_W=i_rwuvVhpS0d+h6Og@mail.gmail.com>
Subject: Re: [PATCH] dlm: don't put an uninitialized lockspace kobject on error
To: Sanan Hasanov <sanan.hasanou@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com, 
	Sanan Hasanov <sanan.hasanov@ucf.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2026 at 2:49=E2=80=AFPM Sanan Hasanov <sanan.hasanou@gmail.=
com> wrote:
>
> From: Sanan Hasanov <sanan.hasanov@ucf.edu>
>
> Commit 8a4cf500f1dd ("dlm: drop kobject release callback handling")
> dropped the do_unreg flag from new_lockspace() and made the out_lsfree
> error label call kobject_put(&ls->ls_kobj) unconditionally. But ls_kobj
> is only initialized by kobject_init_and_add() after the callback
> workqueue and dlm_recoverd have been started, so every failure before
> that point puts a kobject that was never initialized:
>
>   dlm: ls_6035_1: can't start dlm_callback -12
>   kobject: '(null)' (ffff888027a28088): is not initialized, yet kobject_p=
ut() is being called.
>   WARNING: lib/kobject.c:736 at kobject_put+0x66/0x550 lib/kobject.c:734
>   Call Trace:
>    new_lockspace fs/dlm/lockspace.c:617 [inline]
>    __dlm_new_lockspace+0x1714/0x1cd0 fs/dlm/lockspace.c:638
>    device_create_lockspace+0xc7/0x350 fs/dlm/user.c:414
>    device_write+0x872/0xed0 fs/dlm/user.c:606
>    vfs_write+0x296/0xba0 fs/read_write.c:685
>
> syzbot hits this by sending SIGKILL to a task creating a lockspace
> through /dev/dlm-control, so that alloc_ordered_workqueue() in
> dlm_callback_start() fails to create its rescuer thread. The same
> happens if rhashtable_init(), the ls_recover_buf allocation or
> dlm_recoverd_start() fail.
>
> Bring the flag back so the kobject is only put once
> kobject_init_and_add() has been called. Since the kobject no longer
> frees the lockspace, kfree(ls) still runs on every error path.
>
> Fixes: 8a4cf500f1dd ("dlm: drop kobject release callback handling")
> Reported-by: syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db2b8d04ec4914f618d23
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

This patch conflicts with another patch that is probably not going
through the dlm tree. It will not fix this issue [0]

I think it's best to wait and queue your fix until it's through, and
then we can rebase your patch.

- Alex

[0] https://lore.kernel.org/gfs2/20261027223847.652884-6-irogers@google.com=
/

