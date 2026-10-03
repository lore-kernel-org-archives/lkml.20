Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3F352020
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021251; cv=pass; b=n1LOvEDyAMmwxOdTF+5p7N06jAmM0xQNyrnf3h7KOGcAOLltVYB7QXAp18Sgq6Z+kFJDm8sKTdqrlugvqs2nQKFaReE4jLAhDyS3ZwxcHnjH376PYawqh7TIqg4AcVz3eheeBK2yYktJBzLPS7cX6AIkxwlfPVuChuBrxmzpaX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021251; c=relaxed/simple;
	bh=CnE0JZcmqvEBiAZ90fg4GY2g6dG+y5C9xZqui1pBuJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axvFJjuGvyAjJKJTujhKHXK20zLEzTy5g9xHUeIVWsc2y7z9vGnaf3eYp0WyKXE8hMov5GnwCOZSdMNfQvR73IrczIRgDdh3UKyzpAXoP+LxbwRDyzJtC7SueKAd2XnqKkB+opge9Y7kGLHAv/E/5uofIn9PBHzmZm+5o35tBGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9RiiPhk; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9RiiPhk"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a82b649db8so998601fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021248; cv=none;
        d=google.com; s=arc-20260327;
        b=eIk7lUJt6YUenUz7VE+zRd8M47LRrXIBO83vAE1jakZoI9gWHJVlo5KJLmIihfyIRK
         X0iLRfHYLLD32R975B9aqa5DrtjOnXCB4DRc025eh9/AOd/MsIdbboZ0lBGqVbcz9vGE
         /7xEW7dHSsy6RmxF2DoIHn72hQheZFyxPU1z/e5YaYut0IRlLVEEd+bCokfdK6jAP5vw
         fsy1B5+SpU8l5ZvA4VqPwUqzFngqSBLcJGZCzBL3e5c4GY5eV5a7voSa23+9wXca1O5d
         huntYcw3rvNlxWDh4YhLJDk/oiBuA+50yfEf9TJekzkwxkxP1SfquxqQZs+c688rBmA/
         3ZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        fh=peZI+1r7gZ0C65mreRGNOL96mpaT80f5GzgcSDLlNB8=;
        b=miQ560hvO35JQtDoSAK89EzlODCqd15xZgoLN9BYYIywyFxKFJgTalXb4H3ghgcw7N
         KQn+yrdhZGQ4gBfQ46kMsYyQWF0fXhc36YHyNcaEBBqluGG9KPhgqby22AjEJYUCaCgp
         93ZEdHxP4P1xDfEeCCk4vqQxHOIu23ChV/OsrmSbVt7Ca5A1Nu0XkuSbshs92cvBz8Xm
         ZGr4vAf0cGdfe0x7sbgom839e1Guw75cILk0EXw8cPS3cTgM/WfoImm2fku9uy2m4UT0
         OnwOp56wIKJ2JdmTGM+XoPz0vlOExCJJGHts87upGeZi5NVVbCx1E3VvmkrOpsljH3ZZ
         NZBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021248; x=1791626048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        b=S9RiiPhkA740TXlPgWhCO4ABWKPhDE5S3YYLbXzb6c3MK+CYUPGcyszhEG/Y+xKerW
         WbIjdODwAzRVikfkSnslRFySZ0XMm41XDxg4z8skVc9xD4GDmS/3AOzgnqZZ/NA370As
         9Z3JU+sV4jbXSPphUTZw4Dq+YDMbnzOdksYFlKXVRarLDi+NJ1+xCUpNHrZBj5W0Q+H7
         o3H3Wn8g9Jx6gwfxRlZlUi6/oZ5V0RNqc3F8+fNhz0DR+wbiniwX6p2hWtZNuvCPzp+g
         PSUaeBI8SbQbNAuan00BTF7GsnRnGPAlCUj1p5TjsSvRQaqlGZC6PDMbo535ydxHdv2N
         2U8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021248; x=1791626048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        b=b2nmPgjrsxRsmBWTnqttPl0uxVOs/3oQrxeHNDEOqBp8bG/5dxy1JIwfCsFxIvOSOu
         A/pyoAuxLLnSvSD+v8b45OLOQ/2FFKLVgfjINq8u2w1APb8JPR6YlvOv8Au6Gd0/7M4I
         Wr7q7o7B5w++pnbJjT/Ryxbf72l8+e0tJATn5nVS40QAiZ2g1gFfR9py7GyTqE683ixm
         Mo44MnSWGDL1TZO5Nb109mnYoCuM4WEHhsCKqBS+OAwfjMIsYFCAMqBBJ4bms7XVLKWY
         QgBzwz7OiLLVsBk+OAGyo/oEdkLs3nnmcji1tgGIFL/waM3omL6OlsqK+41AUEMmJ3A2
         G5nw==
X-Forwarded-Encrypted: i=1; AKwUvBy4GYlNTeLum3P+fDDZbAjbiMsXmYGGYmW8pUZ9pl5gKVLCSk0zq0idSBFkwp4ieEwqizbd50C958nHA3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmOkw4Q/lioumnRTdwJzYrGCZPDIoevMuZJqZYcYoB6LcZGmYk
	XJcv5QSHmqN/i9z2ynwY6NOFPWAyXmNyCr5kyCovBe4Ctl2dws7ktaDp9pLLb3qMeyz2whMNvll
	VxGdQqK5mXYZMPl2dEZFsi/sXoKinLB0=
X-Gm-Gg: AYBFou1wtNdh7gyogmHD8mGf4qpswtqj4RDZMwzBGffKCY2VdH/tkS8iUFhF19iwG77
	DBiUMTjOnai27Ib/yFW/9+NnIXqKshiWvPgPPtMw5IZZFRnDZcnvxqak+PvMduCP+ePA/TLjMmk
	vi2c2vsXVHtUwgwajCvw6tvn8czQQzrWo8r2JAOw5yW92fXapm/a9XzTIrSqFPrMyeh0QzZDLWE
	3sI/MC3dsgn6eYZ9LBGIEGA3yrFm+gSfwDgGr+bVPDQi4AmycuIzIrDfEXw8cyTYdqbBJiSdVfi
	RezCDYUoKYzTheAWOw2/ura0kjMr0cmFyN3rx6felfBqji5vXBGRAUpm0ivS3Ih+WWWtzqAxmqv
	Ai+m7/wCTZGlgoO+GRq3Eae/Y60xtuddwKmpaMA==
X-Received: by 2002:a05:6512:a356:b0:5b8:ea1f:1225 with SMTP id
 2adb3069b0e04-5bb9380e793mr1239589e87.1.1791021247487; Sat, 03 Oct 2026
 02:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com> <ar_APS7UG25kXXYH@wyuan.org>
In-Reply-To: <ar_APS7UG25kXXYH@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:53:55 +0800
X-Gm-Features: AclHuK8TZRE0VVG543rmFerG4IkGYKm6eK50YeyZ_bRq_POnKgAP3J-x2u8ADoI
Message-ID: <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 02, 2026 at 10:31:25PM +0800, Weijie Yuan wrote:
> > The translation has only had mechanical changes since it was imported in
> > 2021, and the English document did not change between that import and
> > its move,
>
> Hmm, is it? What does "mechanical changes" means? Does it mean small
> changes like typos, format, and etc.?

Yes -- changes that did not touch the translated text itself: the
address updates in 2023, the tree-wide character conversion, and the
path updates that came with the English move.

> Maybe I got it wrong, but I noticed that the current version has quite a
> few new sections and additional content, though. Am I misunderstanding
> something?

Those all went in after the move. The window I meant is from the import
(July 2021) to the move (March 2023), and the English file has no
commits in it:

  $ git log --oneline --since=2021-07-29 --until=2023-03-05 -- \
        Documentation/admin-guide/security-bugs.rst
  $

The <N> commits since the move, including the new sections you noticed,
are exactly what checktransupdate.py reports against the 44ac5abac86b
baseline once this is applied. That is the point of the move: the
backlog becomes visible instead of "Cannot find the origin path".

I should have written "between the import and the move" more plainly;
as it stands it is easy to read as "since the import".

Thanks,
Chen-Yu
