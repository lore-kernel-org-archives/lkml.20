Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439803546ED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054716; cv=pass; b=ogzYtzeHNDm+YfDct6YZgZ/dnovTMBnR4in1Z3K0lhybvOdHWtAW4Fhf6LzzSAUMCi5YdJRV9w/wMUvLhxXWuWc6RqvVFY/rOr+Xyn7Oq7pdByQ4Vw+Ko7JR1VOCL6GykKHKdv+G4u6nxi2g4vLj/sSQWsIIv3mX8ItGSeF5x9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054716; c=relaxed/simple;
	bh=0jd5cLTp3SOx8GkiEE9xyQ0WO5u6raBQoIhOrOBec+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTpaf0Io4L9LGoALCc4O9BDMD5eZNnP4bcWx51g+jPgFWFTX8Uka4q4aRsiuvxLSoQXqF48MjmeOPgfuXymhG4KugVrG5pe8LNJypXl3AWnueK7RiaBmJN+41eu/Q36BjrfcIrj8Rjeg8u0QWwjmXwizUz1DIYoA4kY/HLsCzDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtZxniBR; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtZxniBR"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so3093749e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790054713; cv=none;
        d=google.com; s=arc-20260327;
        b=nUsxQitkJj1lwL2eamnibYLMBjdC3bf81Lwjum+A/gGIcIfHv2eAGAZBScOmzFJNwE
         XfXYp8YWYlxPT1EGzPyvCARSr3GNxZXn7wJ1tojfYxR6DG+wUd0cn5AyB2uo7Im/5vi5
         9JIt7q7xX3ttffGhuEqlNM4YdqyAyxmx7uQCWhXpRO3AVjbWRMogv+WU3brBHD9l9eMq
         0njhng788DEFW2W7FYAbHMK7ez5FfXt73GrTCYjlTnm/281n6llKYNRFOI539dh5y7Hd
         kcWmV3GQKpCgVnZ1oowmc6Mz+uosuTJi0eyQh2hPDsdQOB+yagSifqcwODppR/TO9u7O
         Zvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        fh=ZCnLomcvUTAYUGe8BPyF2RexGZSDI6Gj1xjJY0wRdIA=;
        b=jV712ZVNvrGmLm4UEOzJNGBjTLlCsf2RDMMQ692OR4krwcbwYggxIOQoGYd0c1uxyI
         FfWtx4mTvfjg9UJTJzo1sBjT1IlXEjyq0LVSNKVqPLZ7X/s6kGv4IcWmBm53l3rcHmzo
         ItSjJ+YB/e/xghCxTG96h/ImPOWaWsh+CHXt++1oSFYLx4DjfkU6hlCcUC4b/s/xQav1
         +J7mNwUjzE2S2B1WTisN5FXkfxkxLfbs3gf9KxW4XRI9Jkz1BxX7VjyrbOICWRDWfhE7
         Zs235YCybgzvi+mjlVN93A8ejupz62zTgZUlW1djEexZJ7kMEijMmw8E+YUKRQ59znmP
         EKVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790054713; x=1790659513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        b=HtZxniBRGW0mjCasv63Wz8btkzTxkAu8O25X5V3c5PhoE5uvh2/w/OG4LKuc6/vb21
         jHMUH9u54VZbssAS2qbamUhZ24WLfpHcG3J43HivMeouvMT8XCIad78dscRXNSFhP8QJ
         oUhN2ikroGTKtgjs0G923ZHWpUqgP2JwyuaYFhyYtwWa4n5XvGzAxSFMY6cdXKbqLK6y
         GdVUhv/+jdE9wouVQx1JR8xirSloZx+aEPoo60mZMpb3U6T4tYUQXZhkE3a4eMCKpLEU
         1iqkn/oabTE8Tj3hd4O4WP354zGfGKhv0jX6ke+XP3s02JmIkHBgfeCSySahdvou0PJH
         rP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054713; x=1790659513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        b=Fv8vkpwfPpqwC4/eD8hFwvChAMvjQ5/H4R8Yl8pqUjeGBr0srtZhIgHdh8jup1TXhM
         74CA+81rux+j+pyT4CC96cqIbTfD6NMBfvEl8sDO8QOwStsHsVpM9akfWSf031SfqX+z
         a8WDnmKibxWA/0jVH6ixOg7LTI6fXurIH22jCHfCvdTckOxDPJkhzudLjSfSifARQP96
         Tj7FE9WtOoWu3XMwAsvliArfvgcuRafZsLUINcA9obITsW/Y7PWRLt9g5043zhAd8TYi
         EjbwXt6oci/dZ22kTHCXX9+CTb0bRCnKGgG3dFSA2G22NR+PUgNfEBe8ry0k1NADvoJN
         xtUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoYGjzoZGWeSRa59o1vecnZSr/DEJ3A8LR/K399J6KHy1VN8vur0oTlLHykyUtFezpYodxdLQyPGE5tzg=@vger.kernel.org
X-Gm-Message-State: AFuF++mFdkn3JcgYbMGy5gBxOdgvjXmB2QtHm5r1BOdAf3opMjJnOloA
	ttjlEIuQ3AZ5edFukB889e06oDiAz+zKUcaxdSNEf4uJd0K5NPZoy0RcDepNJ1FMJpxj6pCSV19
	3Mr7M+XEVwIFu6FFi4Z3EK6ES1ojE1Os=
X-Gm-Gg: AYBFou3V26xgI7igXr6GMBJLgdhebOxc3qjTwE61HEsuX9VkrmWKj2520cxLDc7x9sY
	l0zW4WxjrorO4aEmre1DLAOkIKAb3ptqBoR8OQJdPVoHogF+exWGmPZ2Z0GPmAiEti4IIT0PiDm
	Y3F4IGF9cU+SQo43jZ1ig5whLscCYVim4hQdOIad/AlUKEcp2uZ138pKemSWJVaeEQ3sB6I/U0/
	EawLuLvZgFsAo50GsnREo+7yX+FD8TuoXfIeXUxkfDXYgJr1zHhY9/pYfiWek3buIAcDIiP+SKU
	exIoX+W/wDQePpI+0mj4yTzvjfIZUEDRjLBJCLnse5XVv0HqvuQF2F8=
X-Received: by 2002:a05:6512:2348:b0:5b8:9a84:74fd with SMTP id
 2adb3069b0e04-5b8c17ee9ffmr4248097e87.4.1790054712894; Mon, 21 Sep 2026
 22:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920083131.1880061-1-liubaolin12138@163.com>
 <20260920083131.1880061-9-liubaolin12138@163.com> <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
 <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
In-Reply-To: <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 14:25:00 +0900
X-Gm-Features: AclHuK9DpvIu8lP7A2qR74y5flfN5b4SPq5kUNXAggxDycWJuA--ecJM0kIN7ks
Message-ID: <CANFS6bbM-OpYLoRvQNAhmo-FNBd9V0K7wEt6iYTc-6cPf+2uEw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 12:27, =
liubaolin <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
>
> =E5=9C=A8 2026/9/22 09:21, Hyunchul Lee =E5=86=99=E9=81=93:
> > Hi Baolin,
> >
> > 2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:3=
2, Baolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
> >>
> >> From: Baolin Liu <liubaolin@kylinos.cn>
> >>
> >> Add a fileattr setter for immutable and store its state in bit 0 of a
> >> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS =
EA
> >> attributes and restore the flag when loading an inode, so eviction and
> >> unmount do not discard the setting.
> >
> >
> > I think that the name $LXFLAGS is not appropriate. the prefix $LX
> > seems to be a WSL-owned namespace. The name could cause
> > confusion or a future semantics collision with Windows WSL.
> >
> > Thanks,
> > Hyunchul
>
> Hi Hyunchul,
>
>    Thanks for pointing this out. I agree that we should avoid the $LX
> prefix to prevent confusion or a future semantics collision with WSL.
>
>    Would $LINUXFLAGS be an acceptable name for this private EA?
>
>    If you agree, I'll update the code and documentation, rerun the
> relevant tests, including the Windows NTFS and CHKDSK compatibility
> tests with the new name, and submit the revised patches as v4.

I agree. And others look good to me.
Feel free to add my review tag for this patch set.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

>
>    I look forward to your feedback.
>
> Thanks,
> Baolin.
>


--=20
Thanks,
Hyunchul
