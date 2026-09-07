Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE4403E9D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765102; cv=pass; b=DNbL6L17KS9q9wTkswm1QP4DiAwo3e+UfHUjny80+G1rI0IjtdFpL2lHf4aWGnBXexWqrRzpkczh30VQd6FsXdbobibvFWFx8e0ddGLi9NkMx3LL8w9e4KcWHsCnt4Iwi2sY4ugSGdbp3++NL4Upa0F42AbOfbJVuvkrI1krL+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765102; c=relaxed/simple;
	bh=xpfhj9CqQGw1djvMgAWRKBm9LL12W7qpx9muQpgeWuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyB3wMLqdmdfoqOOsth/qK1sKRRroikppmHr12GcoINvJz9rr9UKOncKSp0EiOlvDgRH7uggVqLsgOCFJGGmhIS81ed0t+UFXPWBtPt5dByMpEG+MOsZW6DvQdukuT1FEE1b9/CrF1Y8CKPaHiuaPxmDs/kbVVWP+Wo36OqQ4cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfdDe1HZ; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfdDe1HZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a82c103580so53116a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788765098; cv=none;
        d=google.com; s=arc-20260327;
        b=l96iZU8VxQy/ubmjY4QTAvoG0JCELAUi3KVnWt83lammX2ZjGd2LyHGG1fxg9Qyq9J
         vi+TNL15yzb4r8RZsXFhtcwJWGOHQn8eBWRpllO758kNWoVZXIqEXyZorH44/lHbn1fL
         +Lkl/i7U7v7KjPGlmGUV2ZqGHYYk6lLFN9krO43TNP78nHQ0GrhTVBRiWnc20VHvGX+w
         WfkwI3nWtOqocA2eqPUJ4gXMPyUmTJwf2VzAQrgAgNb4j5QCqIjdrAvgBBHBU/z42yKs
         lnxTz8VSzDZvsyJ43xu2uXTbNrOL6OVv/yo/QQ3H1z+3YJk+DPF6KWF26iFwOgzwH/Fx
         8+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GfJX1pNhwe4TJ2PBeXgP41xA4dsYWvA53kiqlN6MDI=;
        fh=dYN3HkqFX238zUOvmkcV4hllypOayz53jjmn26EAEvc=;
        b=C5YS6WCC3/wDSKmkaHEfDEK5g83bjZ7NXcegJKz+4hXzYvgtjiDjF003Onp5+ZK9c8
         JVoo6QhW7l70tosGpbgItQ/l/1oiFeM0tj1I6SukEhb2OJIzoDnqMsh0d/5wV54CGa4v
         1NPhOZ6lsicNUjh4BPUdAITm6ebJEbkxp3qwicrRyimfKxR1G4CouxJUvz+xtDQ2phXL
         jqqVxLfJFkew9CGbomEj3Vd0ZMBYd78LLi3nrPHMRqnpMU7B05YoKk/XdynkT38ec+ba
         F8Bwavusaf41DnDHyfxfWZa46ZNrSmIE+oS+Omwak3vNKESDYjUQzcsxllZvS9IuNzwn
         IR2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788765098; x=1789369898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GfJX1pNhwe4TJ2PBeXgP41xA4dsYWvA53kiqlN6MDI=;
        b=PfdDe1HZv27a+vrllpcHa4gBqsqRieGp3DliYTXonzHWPCXZklHHfOAfyvcJ1ESAJ/
         WnoDS9PD0OHqSkg/jc4vIc2zWlii09e4np5KCQKg+krlMQQ66XSrMGEtOYj1u0L+z1D9
         Fhtd3eaArDdPldnVbCbeDFQA6CeuJAyXR3tTthuH4Pqsf1Rz6XgKMM6MruEurFIizxNP
         IAHUYpn58KmXgkfkj0/TdAbSNyk3D1fOKSOdkqnpeltgpMkRr9g3VRpGXAky/BSlTI3G
         1WFAJBSLgc7JhBZERq/rHzX1CqPQNxJ6cIUnUv0L0F1gykd6D4/jdBmqOo+AAWIRL4XZ
         2hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765098; x=1789369898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GfJX1pNhwe4TJ2PBeXgP41xA4dsYWvA53kiqlN6MDI=;
        b=aNn6KXZTiqLmxxdo9YJA5IBYS+16TCoTWVC/u4URjfAm3EbLORC746TorM0s4r/lNZ
         jTiW9WDcH84+7wuOpwffQKYTOGmk6+TH7NIStDs2JZbIjDgk62l3H+NtwWTKefTEr/km
         GU33i6Q+FpZ+PAiujZ6w7wbWyTLT8asC16Z2jb/mmMvWJ72FUTmtedTkWbqN66g3iqWU
         l8NlIgbx4KEkGItVjqllwS74OuQpj0uEUXyQ9PJXZFcgSHNh0JJcG2ZRnuwMOXoBuN/2
         j5iNqaD7LWMEPFpG8E4sV3lQQVJSKKiz24H7P0F+kBdq1ynV5XY+wg0y4m0mfAIU7q8b
         DasA==
X-Forwarded-Encrypted: i=1; AKwUvBy3sp0z1saZUaVCQpa1eDSEmzjvpAXjUMQ7WHONkyvQhWo6cS2lloHmpaXU07eHGkt0/zMAws82nBgSZx0=@vger.kernel.org
X-Gm-Message-State: AFuF++k2r7aMfsr8l4QSVIoZ0N6VR4idAgRLM/xOB2gwq4trBRgPa0KI
	ow/tUwpszw8MZjoIjKeHfC/ljotQb+VpIJHYo5H7cW/jBOlrHyZ886s/7AEOW6oWlG/CNxHT7ti
	3u93sbJJAfz1xGSwzf2BgCCyDw71iU+o=
X-Gm-Gg: AYBFou0/FtZW0IQUAHd92DnffC9TE2FqILmQHCzmXS8y0RAiCui7fODbrW//MWOadfb
	1TNmskg4x7rJT7DKGZfDjzzZmDShBeRjIIGu115BJdUJpmzbImlULZWKKaaWmwHzo9DOLVDkD8t
	E/paNXv+GNPj/ukkiodL/X7vPQ+a5tishPAHS8/39Kf3+tv3UudXgFpx1aQMaMjzMBkMTz4zOvB
	js8DnWo3On7BPZarpiqmN4wLyZ8rbB8C2Ile1maWhz9x2x0yzp23/jNXQhDOR1f5n6WZ5aXmSii
	v2BrDx5C3sC96UYwKF4cn6Sbt4SXJx2xkuCJEyDUTcY=
X-Received: by 2002:a05:6402:c2d1:b0:6a7:ee54:f8a7 with SMTP id
 4fb4d7f45d1cf-6a7ee550028mr4476218a12.43.1788765097908; Mon, 07 Sep 2026
 00:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902182814.25700-1-kmehltretter@gmail.com> <9aa7600f65742727d7588941599394c3@manguebit.org>
In-Reply-To: <9aa7600f65742727d7588941599394c3@manguebit.org>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Mon, 7 Sep 2026 12:41:26 +0530
X-Gm-Features: AcwNN1UH2ngQE7-DydmyO5TJ_x5T5DxE21r6DRk7WzLm3yShVABj0CylMJygn7I
Message-ID: <CANT5p=qyU-cdf4RSX0Ab7B9ZcqzLd2BY5h-_X_kq35C_K3A69g@mail.gmail.com>
Subject: Re: [PATCH] smb: client: pin DFS superblock in iterator callback
To: Paulo Alcantara <pc@manguebit.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:27=E2=80=AFPM Paulo Alcantara <pc@manguebit.org> =
wrote:
>
> Karl Mehltretter <kmehltretter@gmail.com> writes:
>
> > tcon_super_cb() stores a raw superblock pointer, but __cifs_get_super()
> > takes its active reference only after iterate_supers_type() has dropped
> > s_umount and its passive reference. Concurrent DFS automount expiry can
> > therefore free the superblock before cifs_sb_active() uses it.
> >
> > A deterministic KASAN test reproduces the race as:
> >
> >   BUG: KASAN: slab-use-after-free in cifs_sb_active+0x77/0x80
> >
> > The same test passes with this change applied.
> >
> > Take the active reference in the callback while iterate_supers_type()
> > still holds s_umount shared. cifs_put_tcp_super() remains the matching
> > release.
> > ...
>
> Applied.
>

I'm not sure that taking a ref on the superblock is a good idea.
Can we find a way to do this in a synchronous way in cifs_sb_kill?

--=20
Regards,
Shyam
