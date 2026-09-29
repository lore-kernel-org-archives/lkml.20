Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C73D955D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694308; cv=pass; b=jO+JNV9YOyRE3XKqD5+yJh8r6zeZcG5E9lv+aYAkpG1UNNWw4P+hdPvl5b6kpw/RPaPRROKx2c1EeM4hPf5cb2/5CTgFzaKl3o0jP6lHLgbqFJqIKRZM98ede4rXp/zNoeRvrlDl/wY/D/JVxihF+xwW/hAOSSJNeD8QIWNcFWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694308; c=relaxed/simple;
	bh=RYV0Fke/zryIQypMo3pWYA4hmOw8U2yNCXU7He5u95Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cw2+wIrQ0sDCaPV5EJGUivFUNQvVPyiK4198a2U7tAZYuEq2U0mCaKv/PbF+wIgr7Q8dOs96DDX8jQ1pqwsuPByGT6odUFy3D0ust/t8QmYM3GSQuDF3n4ufva+quQjXyX5VpWY+l1i6wlax3G6/D2NsiYumLdvcTWAwxRMpATk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3Mdx5Yk; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3Mdx5Yk"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b36a8d5b5so1579853a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694304; cv=none;
        d=google.com; s=arc-20260327;
        b=ILsjtFQLtUU9oUDpfOQunuYVVqKLLxAActbVX+hEdF4uQ/5nTbxoDWaLmvqx/4/Y5R
         SQyHP560VO9vqpR2Xh2q2ZnJ206MKeOMctxBrwwOJwDQgc849YV5KaJGQptZ0E1CDtMk
         YoyyWNIf+Z2dQnylBfc87JTmrJX5MN4WEFrWdxexunR6ql38sHxHX8Zxwr6u9fQ/GlIC
         ms8fzY9efGxGGZ1f3ft4cjcWSH6chB8O4R2v55AhyKYArmwpwpLBZxAJqEcgYuwgxBVp
         SOYdlZelUpwn0GGpyEvQG2djxkV6nPYcgxEGvsG1P05EE1Apgw/Pn3MZIruRxScxToQC
         y2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SxYLhnOzmc+drgJLlfVKMnvEVhnHQOKOuWMtXRb1T4k=;
        fh=riM5Zn1bkzv3WgMWIeJXhtOgvg4pA+MLEpM51Ygqelc=;
        b=Ra7z4N18ycO3QbDMcOQc2ws+cl9th6WQCOnQiEyPQ+1Bb8Yt2OPMAXGAse9pqo3+Yc
         /vJVuoZIqP+yTmPsR8ngd5mAEuiIKQVHSPCG1CDJGwSw0MGb5ND+qRihMbIBIO4EV4cW
         2dUv7h1Q4h/HgIwlEYO82tlvXJil2tozPWmq5dlyOLkDgV/5XENMWKa0ZzUeD3A2h/Ik
         iHcZHPbicRTQLXF8sxbxIqUA61UVx9kV2KjuThqlcomn1XvpabWHNSfztOqGR7f1AB1B
         ddXGxHZJ+Up7LvHUNxm+OWivgrbqpJyCyUwLIcKmyPWXAD0JmrCHnmQML/NJz5zejcaj
         sk4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694304; x=1791299104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxYLhnOzmc+drgJLlfVKMnvEVhnHQOKOuWMtXRb1T4k=;
        b=N3Mdx5Yk5e+O4SymkvAFpuNL3GaM0+aSdQkELk60n7ddOt+npYhklRR7jK7yyoUU4W
         4HKXZYDExKE4wuAxCCRoemjM8s6zrgewf/m5irv6cHMOsCFxXmqtoHIAAVjSaeIwwUuT
         XstAMnFp+L14Xi7msxZFuDWgzpLJFUCtCCmaJATdL4dHW0wgXsVxyD7RiTkvkdsnGg5d
         hAqnsUigxu5/TK2c15Dw/S2KF/FEyNxq/0A6YtcZINuDdEw4aiWkg7lkn7W10Vf9c7cb
         iA4Kz0SnDuPnCvz7+jcyc1hUsTpQWTvFJB8uEPm+eMVBrVcdnozJX1Tcj1G3zO6FSFmQ
         /YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694304; x=1791299104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxYLhnOzmc+drgJLlfVKMnvEVhnHQOKOuWMtXRb1T4k=;
        b=HOWAtIzsBgZK9zRy5UP8nUJUX/sfkIqBmmUh+CP3oTKVZu5l0T/gCV9DFaiH4izrU1
         ZJ+ZxB9uMO2SC95TwsbVZxtcCzeHOaETzc9oj/3W0NSh97+/JJKWEVEjrXqItuzfqhaK
         l2aWfgQt6GVeJju46rH4xEtcmt73vZGyv0EuAxEU6cIqUn6oeYfCEEx366dPigIs0qvg
         T4jITqJSzBSn+YaI8Ac4679q4VaTpBahiZTN6DQjsD68ftVDYswldMD4pt/jhrjGbl1F
         v0AvgKQptHJ+aN6jhH+EsHuBB8B5yDqURlNGcYLurRi7YvaLLuh7qE26fJ2y2e9A9PoA
         xpNg==
X-Forwarded-Encrypted: i=1; AKwUvBy0Ssv/iR2ikdjHbTGV/qI+guL+ia90z1t4dcoBszGGK6xO3Ghl87R/d6NJD9+jrnSPChd4qgVE0gRN480=@vger.kernel.org
X-Gm-Message-State: AFuF++ks4w09A4abUzsJgjStX6OFBL2ebCBaKGbcVs7vyBHeZwt53b4E
	RZNu3Pk/ZWnQqkcKmC48f4jQlui/nkVGITGyYzaOdTcehl0t5Ep7OBSueGmnkht/a95cnm44Rd8
	o6YWpo5co05HgPmErj0fAYJzKpqIFEDU=
X-Gm-Gg: AYBFou1sfL028DZ00yD+QJ8HWUJDu+z8DF8OWUryE4CaXHxcfoU8BvrrE25z5P4Mc/7
	BHmls+ByjdoGmKADxHCHPxDGr7rwNnn7rL5nIBOLvZBntYiKbhmy4G6iPEl81Se/Q9BmkPYwVhC
	yy4y4toqn0KOssjVvh4dgGCerXqJvhIlcDhdgRm6wA+Go6PgvwKbc5r7YgeS0yDwKXl0ANUi1uy
	Ah7ea03RVHvfJ4zNO2ZiV2SqtGtSY7VGVXn2DXZHFrsfHph2anltABQy7UXFp2JEOa6mVXh5DUZ
	TSmpUqv3qVkzJxNKhbsUywbFDaWDDcWrp04F1m9orkYDPy7+onH3KOKpbInHHD+2VrBWzuTnRzw
	trRE5KUI7YhzPTNJHcspH2D7W
X-Received: by 2002:a05:6809:a:10b0:4d6:90f3:74af with SMTP id
 5614622812f47-4dc66070a82mr7548908b6e.47.1790694304147; Tue, 29 Sep 2026
 08:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com>
 <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com> <CAKspUh+rJ7qm7VKXTYcqqPxwNWnNJ09p3DAciwGXGzpBCOJ=NA@mail.gmail.com>
In-Reply-To: <CAKspUh+rJ7qm7VKXTYcqqPxwNWnNJ09p3DAciwGXGzpBCOJ=NA@mail.gmail.com>
From: Yizhou Tang <tangyeechou@gmail.com>
Date: Tue, 29 Sep 2026 23:04:52 +0800
X-Gm-Features: AclHuK_KzzfKzL4l-grenIAxx1Sm9JijVCMZ7ff6XE5coebowPrLv7qkSaiuoKk
Message-ID: <CAOB9oOYdHd3kpnj4aQOnbubTsLLgjw4n9aFMcjQqL-3unNDLAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Deng <theandy.deng@gmail.com>, 
	Bailu Lin <bailu.lin@vivo.com>, Bernard Zhao <bernard@vivo.com>, Bryan Wu <bryan.wu@analog.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chucheng Luo <luochucheng@vivo.com>, 
	Dave Martin <Dave.Martin@arm.com>, Dave Young <hidave.darkstar@gmail.com>, 
	Dongsheng Song <dongshneg.song@gmail.com>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	Eugene Teo <eugeneteo@kernel.sg>, Fu Wei <tekkamanninja@gmail.com>, Fu Wei <wefu@redhat.com>, 
	gao chao <gaochao49@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hailong Liu <liu.hailong6@zte.com.cn>, Harry Wei <harryxiyou@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Junhua Huang <huang.junhua@zte.com.cn>, Kangkai Yin <e12051@motorola.com>, 
	Leigang Zang <zangleigang@hisilicon.com>, Li Yang <leoyang.li@nxp.com>, 
	Li Zefan <lizf@cn.fujitsu.com>, Maggie Chen <chenqi@beyondsoft.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Punit Agrawal <punitagrawal@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	TripleX Chung <xxx.phy@gmail.com>, Wang Chen <wangchen@cn.fujitsu.com>, 
	Wang Cong <xiyou.wangcong@gmail.com>, Wang Wenhu <wenhu.wang@vivo.com>, 
	Wan Jiabing <wanjiabing@vivo.com>, wheelz <kernel.zeng@gmail.com>, 
	Will Deacon <will@kernel.org>, Wu XiangCheng <bobwxc@email.cn>, 
	Xiaochen Wang <wangxiaochen0@gmail.com>, Xudong Guan <xudong.guan@gmail.com>, 
	xu xin <xu.xin16@zte.com.cn>, yaxinsn <yaxinsn@163.com>, Yinglin Luan <synmyth@gmail.com>, 
	Zhang Le <r0bertz@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:18=E2=80=AFPM =E8=91=89=E5=AE=B8=E4=BD=91 <chenyo=
u910331@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 8:14 PM Yi Tang <tangyeechou@gmail.com> wrote:
> > I have no objection to removing the duplicate contact information. I
> > noticed that some translations in these commits were changed to
> > traditional Chinese terminology, such as changing "=E7=A1=AC=E4=BB=B6" =
to "=E7=A1=AC=E9=AB=94". I
> > suggest submitting these changes as separate commits to make them
> > easier for everyone to review.
>
> Thanks for looking, Yi.
>
> That change is not part of this series.  What you saw is in the
> range-diff, which compares the v1 and v2 patches as text, context lines
> included.  v1 was based on v7.2 and v2 on docs-next, where the zh_TW
> process/ series has already landed; that series did the terminology
> update in separate commits, e.g. 5f0178db86a3 ("docs/zh_TW: process:
> localize terminology in embargoed-hardware-issues.rst").
>
> So "=E7=A1=AC=E4=BB=B6" -> "=E7=A1=AC=E9=AB=94" only shows up as a change=
d context line (note the
> blank second column).  The v2 patches themselves change no wording;
> they only delete the credit and contact lines.

Hi Chen-Yu,

Thanks for your explanation. Please feel free to add:

Acked-by: Tang Yizhou <tangyeechou@gmail.com>

>
> Thanks,
> Chen-Yu
