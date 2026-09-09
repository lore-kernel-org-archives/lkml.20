Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348D341650
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982445; cv=pass; b=hz0R+NU2TYLgTMEpQkWP3HvpKtv9cYycdH3sGQpppHueYp+EyKdy9pu5KMg3LRRQHmBYcQ+YPHoyx2zLhc9+QApo3L5NTDmH2XmASXFZUOxvLV5irmZed6RAEg2/kUoJjNOgj3KuK5gjKLpr++46C8YoSBYoqphe7WMGLqE7Tfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982445; c=relaxed/simple;
	bh=BVdtMSWxf7icB7wBjmlVHIP4GsX+nPXsq5J6fcR2a6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWzpiEmEQYjFGLAr2G9pyYJaSPXmWT4p8ewEMiKmZXhD+YthmBX2jN41onSdPiQr+KT0FTlVsAg7BExMkyKZlVROwvV6y+tc9clPajoz19PPzqgzqdk8JjiZ2GqDkGNCdCE9/ML0uqt/3IA3/oO03AYuz4Xz3N+8actJUzIyVS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEbhBIti; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEbhBIti"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso6921155e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982441; cv=none;
        d=google.com; s=arc-20260327;
        b=Z60/5vyyOn8SE2KhNQfki/EmObXLD2487vb26uHrYe4Lzb3cihX6SaniCSbIgqzzW6
         pisWbbhWW1Nk9K9QSU7Ss63fy5bOys0sknacZcEiaoJwvGIHqFu3sqgZTIfWhrQee8Eb
         TBHPmvklWdMxOIlyuGOp9nGz2p+FCP6SwF+Pj9Yt6GTRu90JNqAFP7vdnVa0YdO3Gqoq
         8ZNp931D1W9kf1JKTPbtZvVW287Dc64wZn+BtchdR5DNFvf0nHAN1NQoXUIvzNiqWy80
         I2+CIahqYNJpD5pHQTRs6qsIRkSPys6q1Beim0INJEOdOn44FhlCibkJaDC/PAK4g+b8
         sS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVdtMSWxf7icB7wBjmlVHIP4GsX+nPXsq5J6fcR2a6o=;
        fh=bqC5t4X5MNxNIQ+k/c8GsnTd18HqHdThsGuO5ncgUaQ=;
        b=rW5ymGbt2GGlofqtEahBUv97tdGAezwNKcOZcJyBkbuJXP8dn/TlmeUP+tDWxDYh2/
         lK1tOyszIDwTv3UV6i5tAsa7dd+pyjNhD3wVbQsg8UaFzIJfTKqi2lI5On1PqgNb2z+1
         v8sXu0Zc9XBO7uTXSYBcgZyJD4lZj0hpFseUDgd0RcRxzFe7Y9Br8a70cXyQ/rbBSE2G
         Q6DjEzeAft7Hop4jNG4vu1tj4GkI5jds7LhYNjdTtS6UPbkazUpyTQaGRugjHIJvu2DG
         qYV2/x6vWcGco5jWE138kD7bciWMSeHjXIeiMcscVGkP9/AtYLCPa+GGNRyLAmPzRrTR
         Ny5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982441; x=1789587241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVdtMSWxf7icB7wBjmlVHIP4GsX+nPXsq5J6fcR2a6o=;
        b=pEbhBItiM/zUP9Tama2bCZVKMAuhvkClXl8CdUEC7ZAVeANAoVApLiIwGW8BJVzfnM
         sMXbBOqe6VG3pCzXwEeRCuBsfB4GbdLv4OhfiSqFMFz5TsGaVTcaO4EV2Yzrp0kIJ07o
         1p0yPNWDtcwLmnc2Fzj6Z39fuxaQNEC6kef0rAne/vm3e6b24RPCkAYT9hM8snGYBDYw
         9Yr/Jj3KpSrc/UxV9r4dEyErmXxl5xXxOvTjXpFHwUyY+35fRSaSo0evzdLsDkA9olSl
         w3ea+nOLmplGIRXC7p+97HnxhrmGU2Kno5CulLCG8LHOOAQKqvYWlG1f94Mb25D7G5gk
         EESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982441; x=1789587241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVdtMSWxf7icB7wBjmlVHIP4GsX+nPXsq5J6fcR2a6o=;
        b=W3UP75AvdUMW010S5Fzge95Pj0XMDQFO1/i1ITIv5rlAyn/FaB5XjMPGddlrw2+Ft5
         ++5WpX07LxmChpVmFwwzFx44cgvK4rwTawq5LZ3b36SlDQAQg1q9UlAbI1R5HpmdVKSh
         ILoTssgUkCuH8nuwXo/wuAs40H9cJdLpybFoTvCAQmY1MJ0MxtBqPaNr0EkVOlwF8T2/
         14yf9EuWEp1zBbxyrue5/uhn02C6MU9yjx7pFzw1LSDB++Nz+dGm8h0BPWdbie0vRNtR
         uDD1tGOWanQfye0iyoGC1WrDxTzB08xvTb1hRblZIK8caqKpmXz01u41jeVRLW9886nU
         NLDg==
X-Forwarded-Encrypted: i=1; AKwUvBxPj7G7vajPabtJuuWLOGlE0aNAPVwUaxMo1pQLElHP9qH7JQIFwAevfnTDANQ28W6wR4E5y2wMYx9LTQM=@vger.kernel.org
X-Gm-Message-State: AFuF++n2botTaW0sAE8L6+XuGcWpE94WXNycPyTzaRJYANhVRnJVPWwe
	Rb+uWxBXwf+m/g2GO5sGrXU84IYCjvuICf8Rag8W2Mbqyi4cKbp6qISWKW4H4wmKwfn69/WmtAL
	zOzFH9+tFszevVezyC/Uqvft9Mmi/J/Y=
X-Gm-Gg: AYBFou3OFUM6rtXchUIvm6C9jx5+xcnUEPw6Dl186aRjCfXjCPnxyWELTJENLXcUthy
	rdbVV3u33Fd3GQtLxKQ7wB9TTP3kJpIHIzJicZnW++5AQLRjcRvz4xk/upPFZIyhSBgDpF5kUma
	dxlN339UusOu6lhe59UQt9Kxbh6H/xlAzNL+8p29JmJj9CSx/wLm3kesN3e1sgZJD3vR4M8dvCj
	WJP1BjwHoKunPDNYTBbuNCxt/piniSOdD6aiqk6dMDv/Lr+DIAIoK0kvArAWrjcMMOuyOKzz/T4
	P6/bVrmKZk7Niyd7aEOyA9x63BuwOmYPdL3VeAbZsVFPkM5qAaum7FcnNhBoNdM8RGSwO1s65Dn
	0cZDC6A7w3JHvoW1ESR1BVMY2w3Rg1vGDhe0HWlkf32Mgzbn1OV3k5Ok=
X-Received: by 2002:a05:6512:1093:b0:5b6:183c:5c91 with SMTP id
 2adb3069b0e04-5b6183c5e10mr6124641e87.47.1788982440939; Wed, 09 Sep 2026
 12:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_yO+CyS=xBDA1iRTfjZtm_40wLGwD6TZQLRN2nFmuw7xQ@mail.gmail.com>
 <20260907114553.2551964-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260907114553.2551964-1-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 12:33:48 -0700
X-Gm-Features: AcwNN1WUDSWydzjn3Er-hR5IhocfCQTX_w3kug0YfdBpl4DCR5cKCHHj57XQObQ
Message-ID: <CACOAw_wBMigWOu1cyZgsqd2EVH_mO_HN+y=g3ryBdMSFtX6cig@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 07/14] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:46=E2=80=AFAM Nanzhe Zhao <nzzhao.sigma@gmail.com>=
 wrote:
>
> On Fri, 28 Aug 2026 10:20:40 -0700, Daeho Jeong wrote:
> > Under Patch 08, a cleanly read large folio may NOT have
> > f2fs_folio_state allocated
> > (folio->private =3D=3D NULL), right?
> >
> > When foreground/background GC tries to migrate a 4KB block in such a fo=
lio,
> > `ffs` is NULL, and `atomic_inc(&ffs->write_pages_pending)` will instant=
ly crash
> > with a NULL pointer dereference!
> >
> > Fix: Call `ffs =3D f2fs_ffs_find_or_alloc(folio);` before accessing `ff=
s`.
>
> In move_data_page(), the folio is obtained via
> f2fs_get_read_data_folio() / f2fs_get_lock_data_folio(), where
> f2fs_folio_state is allocated unconditionally for large folios. So
> there shouldn't be a NULL pointer dereference here, right?
>
> Thanks,
> Nanzhe

Ah, I was confused. You're right.

Thanks for checking!
Daeho
