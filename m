Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EDC224B13
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134204; cv=pass; b=rPZxMWpQPbx//5+BxBnHKVbyr45iSPHvGrssH0yBqVQzsekaGRxaMr9VG8XCLo1t6XrWDFKW6tbMpmHBaRC775JhCvH4AS6VrSZh75Ywv7fNPUNE9VrOY0lDLTrd6chirYjfehfZ84I29j7MHCois1pCS+VaHXW1o8To+C1eWAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134204; c=relaxed/simple;
	bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCdPxATon/w5KEjCyQBhN9Ip38IvyUyVneN6r3tLvigEH0/jPkFspPLX1YlWLBCmHTj1tvgevqsgOBUtdvI29WNfHOOvxqUhHII3YCQP51ZViEXLs6/W8xDPePIS4kzrUlY4v8mJ4tB5KHr/mN1D/ksr6zRxzHqzKfyTOJW/nAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHPRuPdO; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHPRuPdO"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso451447d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134202; cv=none;
        d=google.com; s=arc-20260327;
        b=Tmkf1Zf3aqw39DKdVxZWyrhbZgqUC61zpLlQSRNGOXSf1Zr5KLMd47jMw3moVkNQ0/
         x0AclgK2SO+r+h7uLO8O8ZnK4bY0ecNh9H9d3MrI7YXakD+jZQ4st5rOh96J1qRjZ5S5
         HqlfyvyYQZfw6FRyrKttxMOhaA4bZBEvtRiICD4c0ibposYbYOCyWolXx5Zqo44mrfHn
         1kWmEGqet3y7+/J1tiFHbZ47p+rf5BGnONDrPVeJ44TjvnL/HPRmPzct7x2GPBYNMtWc
         yW4IifYU9lFK1JvppNKZPltv9PWyoeoX2nfOhFfkuv0jLWFT56r/sMPWVn6FEyyvMuzQ
         HjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        fh=tLhim2YUESOAEJZrIajMk6GxnTmS1JiAHWv12e78b7k=;
        b=UG/F1q6apFdnq5pOCpie0BejSGjnN1czTXGkHeVBhKq5c0gDYvvINn2aAFarNRuxre
         kmn58pcqvASnEU9SBwpBwmuHa6CIKmwsiyHmjY5bQoI+ogSbqUiCMubdn5hqAiVX9MiS
         Qy0Zb6OUD2G2chkvfEV8vvGpBHvPagp2RJygJKskK4Af5tUcGR8s6ZT8lywoxHqUsu6H
         TcXW/t6VCIrQIgbdM8M9ApUHyKlO/HggMLEN0wMBYJql41duT2mo62sMontmItCgkf5Q
         4yybHahhSCqnEtNaARjqubjDn2Xxme2KBPLQjEHR9Mt22PHAxUNZ6uEizGZ9pkqQFu03
         xB6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134202; x=1790739002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        b=aHPRuPdOwMlVMyWSRW6Ac8WzzoqhJWfyQ49gRwtLJpwP4JUEN14wLIGglEKYgwCw+a
         Wc/keDuwB9XWkU+hF8bYURpmonnByurq+wen73J8QXjI6X/EHIvIBs2Dyotur/+rc1Wq
         TKGdOspLu0wT3ldfOITyUjfMaCUOGDHesvsSV6E0FoEPObxyydThcVTlM9r65eY0ahUz
         d1lwr3vkz4Kl4DpdJegfmT1LcHBtE4Z5UNi2mB+khLx/bLOX9pVcjEcanHY7vYrnTifK
         G37Uzt/rzLRMFmkm04nRf4WfE5raaZHA0cTDOWG/LvbbsvfDdWbIbWNcQo9MyK54kMBI
         3Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134202; x=1790739002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        b=mZRvM/W72rNrdr5Z/e+vcU8+aNrgCEQoR1+fpm1ChfoCHYlIQCLJTm+S4g5HA4UE+K
         pM6TjVHHjNFuX7JG+DO19frXxwSHGCoXKksdij+8k7wTgrTLZoFFseRrJogegPiiKUWp
         2KHG2ewUtmi9PJFGWZyYaxMV7HYoxdRersdIypK/sZo+41OOd9pYBLyioh9WeGKy+3GM
         iUf4VRnWa6cFBrrn8Lj0vf1mDJWrGinFqtDcd03goh3epBH2PPm1bVmYjOv9RdI6fWsy
         yeKhfbYDJObhj4zXj2sGwKTJjU9NlBXWi5KUGUrbDZ7yhYYlCsYdSK/7Rti3uGgflm9U
         J2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGRPhCK5idMUnFRIRurNLAT+JN5o4yEytPtHYsNrmbCWYLPxEWHMSqMjMaJkyMQJ9dk7Zlu7KLgXCQ+vw=@vger.kernel.org
X-Gm-Message-State: AFuF++lzb6VhueoCvNCrP1okP2YHAEvfpWTEryna7YQ3qQWUEix7LSRK
	zVJ1cOGKE57tFShFLFZV5/wmkcqYAhhYPjsOSHoiYFM5D+S1BN/77oAbqAb+uSd6jbK0qFJZG45
	tKfFGhYAsApy72mJj1G0RlZXEt6jJ4UoYA8tn
X-Gm-Gg: AYBFou1242ETBwqdsA+hFEmYASsRBGbif/RWY4ChsxiVyHCMs+gA6fi1ac1R1DqXVlP
	sesWLMW6ZU5KxcjFonTyz2RSp9BKshTraSYWeR6YQk4e1jkyuUDxpAKFGMJhVxaMcgCJ4b6N4wG
	s7eoAKhah0FHFCNZr4yIf1CG1RZMqZlifJujUxut7RIQsU6ilJs7KqbhlgRhe8eamlv5DHpl7BG
	zp1ha4qzVRYmnth4jtE1a+tB8nwP5fevvi3+qyX6EdbJn2LnxhWPPEVyBdyMGYaKxo1gR5Odk3t
	68ZjQuLMyz9mdqe9y5MTcSeC947vOvH4MjKXQxpR6mnVkx7EdHozBtOgl7lXfeq6Zvp4D02s5H/
	lHB1ls2VoPfcrimA8vxRq2uhjqkra6T3++8QJkujjAgY9ciJ6GCvM8w==
X-Received: by 2002:a05:690e:4088:b0:66f:c1bc:87e8 with SMTP id
 956f58d0204a3-672d57d716emr714278d50.65.1790134202308; Tue, 22 Sep 2026
 20:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at> <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
 <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at> <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
In-Reply-To: <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:59:50 +0530
X-Gm-Features: AcwNN1UJ-dFynLjOAyoQZkW5E38EP6eUiHJerbKwLx638FvdkYV2ms2o365n1bo
Message-ID: <CADhLXY7TaChqpBz4m1xLLCc6aGEE9x4kZ8XCvk0CXuFMXreSgw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 8:54=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> On Sat, Sep 12, 2026 at 10:27=E2=80=AFPM Richard Weinberger <richard@nod.=
at> wrote:
> >
> > Am Sat, Sep 12, 2026, 10:00 schrieb Deepanshu Kartikey <kartikey406@gma=
il.com>:
> > > On Sat, Sep 12, 2026 at 12:28=E2=80=AFPM Richard Weinberger <richard@=
nod.at> wrote:
> > > I feel the patch you are pointing at fixes a different kind of issue =
?
> >
> > Well, different symptoms of a common root cause.
> >
> > Thanks,
> > //richard
>
> Totally understood this. But it is good to have a defensive check so that
> there is no dangling pointer. It will prevent future [UAF, double free bu=
gs].
>
> Thanks
>
> Deepanshu

Let me know the status of this patch

Thanks

Deepanshu
