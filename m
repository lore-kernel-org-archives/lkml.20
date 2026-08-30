Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D59234994
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788053601; cv=none; b=FpZrqX3fy6R4znsvd1HUVIPrfmO32m97TegrS+/DK5YLWY7wqaD8GZC85RisuapYBlORwSDyaDj9j5KDXcgiwMoSKyVFLXDioOryqdmL72uC34Az01g310iIv+D5MidoFyuPrk5dPtJscv0Bq5SHAEP7N20X1ZZ0r9voUmE0Goc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788053601; c=relaxed/simple;
	bh=L7IW1tp/lGDKRsN936NmztOL2L700ArRooNqrimHdTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkdSjM8TrhQjZGKGPIhdc8kmpL8vRiJC+eRoZyQnMpNHybTESd6XsTVURG50jcUlGL/jR+zGTeP//1eXoIfZEWy6jGP+4ReeC07TrsUU3vyTyMsvEliSAyICf6mss/21IFH4rsnlMv/QHF/43Kb9/l+HwD0HThB84mR7hwO0gYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GssOtfoO; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GssOtfoO"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so794069a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788053599; x=1788658399; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=GssOtfoOTwxohc69IRbUYnIbUvU/Vqc3OQvX7jvHnq8s3s59j93eyBGrZO12fd8Sf0
         otLF3+AclXlEMQ4sRLGg0IzL3K9DYJ0Mz9CjJLQ2FHJBCtDoeD4a4qyK3WIuqtmOQuD1
         euI9fhMvtXKvGxtOB0z6MX0+fHN4RWaQ7ma/9tzimH/XdHPRLT7GflbCqGqcMalgUu3A
         AHa372xoXjM3ey/k8Gkvny5l7fcwbuP9SCFmB+RvmkHfI+5BF9TSJxLiLUHA4PINFtsY
         Y47LXwBt6IERM/ej0X/WuMYY1613rP2Ljj1lWmfImgHPbOIOMcPGou95uPxpZUHDafuT
         hseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788053599; x=1788658399;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=AavAD1MxubqwW4PlY9qJatSxRIWo7+q6TbLMiTKAagOxL3t1AhZR1qT8qos0/b6smU
         NpGPnNwd4/IBqI/nFOJ651+TkS1BInIe2d8+Hykep6GFvnYZmSs280oGNjLjixqG4nE/
         VBR+Z2tvUgM2XEdWDL7ad1QO5sJjAydcGY36gH0cOk8aZygi8+1JPQGU06bZ6qyN6oXe
         xxqFxtblZUMQcCeHAHijLfyx7u4kd4IMmDVMWnmhYFQ0AtV5GuP0hcjKVksf8umeqxF+
         swnObuBulm2qJGHKQ3RVW3+xDRB7pUE78Y52gnVMDsDpe2neAQKnO+jPL/Nz86rlF+cv
         egrA==
X-Forwarded-Encrypted: i=1; AHgh+RpJDTNA2zUn7eo8SVXpDP8bNWCNX6Xxt+aNnXdT1h7/6bk6+RJW4ZCBy5Ev17TEEp58l6ik5WwLKZVWJQc=@vger.kernel.org
X-Gm-Message-State: AFuF++n7E1hCnNXNCQLc3Z0pR0eCNLk81PN8lSnf0/01rJhGO9ObhVdJ
	8JLl9tFUwcCW2Vvpe0WNpshT603Z68YVKKiVaF4D0gkoBPReD65uyT39
X-Gm-Gg: AR+sD13zL7mx3c0ZQhu2jUcusd9aIonxtUKxzFcBDHoD6c5L54Ulmeja0979s5QgoO4
	8xWODdu3UVHKLRk3TluhS8mt1+pIZMRGbOq6luumnx0SpDBStkeR7zP8jvCRHCR2UPok3mvmsFP
	SEgLIDWmvg6VgKHBmY3g74TLHP+g5ckGZ0YXzaYr/8ngIgu7A4B44uS+JHTnyybeT8DLEkgHYed
	RM8ojezY0o/plEf2FCfGqsctxZp+SUcsuMHuOlw62yGjVRH6EgGhMfZWgeVo42wHKI0umAaFxxh
	duEJNQ7kvJwSZZs3lnmBTGahKzV0Y8goteNz+tE99XUX/OyRklTRdrXc1ovycEzn9xrO/SS830w
	7bu2XU8yU188G1yO+oetkZSzEbXvPDh9w6Y17UgBkIltWPWz9MSrKKY4A8jNLfKdWDbmWIM5Mue
	nEzhmo/AXjo2jrQdCdML1fanP7B3/kK0xbtR+69MpdwoDjfOuGr2mGAROvMdKOUF5G9jHfS+TMd
	cg+iaQm9TblFg==
X-Received: by 2002:a05:6a00:4f8e:b0:857:73e2:9102 with SMTP id d2e1a72fcca58-85773e29356mr13611225b3a.18.1788053598822;
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
Received: from hppc-archlinux.localnet ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea798esm1818145b3a.32.2026.08.29.18.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Date: Sun, 30 Aug 2026 09:33:12 +0800
Message-ID: <f-IgWNAyTmaoW34tfNxIvg@gmail.com>
In-Reply-To: <apL7ctZhcN5t77Yu@wyuan.org>
References:
 <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apL7ctZhcN5t77Yu@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, August 29, 2026 11:32:02=E2=80=AFPM China Standard Time Weijie=
 Yuan=20
wrote:
> Hi, it's me again ;-)
>=20
> On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> > Update Documentation/arch/riscv/vm-layout.rst translation.
> >=20
> > Update the translation through commit 954260ff5a46
> > ("Revert "RISC-V: mm: Document mmap changes"")
>=20
> Somehow I guess you didn't get the actual meaning behind this "Update xxx
> through commit...".
>=20
> Correct me if I'm wrong. If you write this line in your commit message.
> Then it means if we apply this patch of yours. The Chinese documentation
> of this file should be already _completely_ synchronized.
>=20

I agree. My fault again.

> However, the current translation of this file is missing this part:
>=20
> RISC-V Linux Kernel SV57
> ------------------------
>=20
> ... which is not translated/synchronized in your patch.
>=20
>=20

Didn't see that because I just used the tools/docs/checktransupdate.py scri=
pt,=20
which cannot see the commits before ed843ae947f8 ("docs: move riscv under=20
arch"). That commit just moved the Chinese translation but was treated as a=
n=20
update by the script. And I only looked at the commits reported by the scri=
pt.

> Note that I'm not blaming on you for this. But I feel this is a point
> that a newcomer might find confusing, including me and Chen-Yu a couple
> of weeks ago, if did not read the script.
>=20
> Our current how-to.rst only asks to write this line in the commit
> message but does not explain the results or the actual work behind it.
>=20
> [...]
> 	Update the translation through commit b080e52110ea
> 	("docs: update self-protection __ro_after_init status")
> 	# =E8=AF=B7=E6=89=A7=E8=A1=8C git log --oneline <=E6=82=A8=E7=BF=BB=E8=
=AF=91=E7=9A=84=E8=8B=B1=E6=96=87=E6=96=87=E6=A1=A3=E8=B7=AF=E5=BE=84>=EF=
=BC=8C=E5=B9=B6=E6=9B=BF=E6=8D=A2=E4=B8=8A=E8=BF=B0=E5=86=85=E5=AE=B9
>=20
> 	So when a newcomer comes and just does what this asks, without
> 	considering whether his/her/its translation is completely
> 	synchronized or not, our script would be kind of inaccurate. ?
>=20
> Maybe we can add a description or a hint like:
>=20
> If your current changes make the translation completely in line with the
> English version, then please add this line after your descriptions and
> before a blank line and your sign-off:
>=20
> Update the translation through commit e83c5163316f
> (Initial revision of "git", the information manager from hell)
>=20
> ..then follows a template commit message

Allowing partial updates to the translation?

>=20
>=20
> Any ideas?
>=20
> (Should I cc the original authors of the script?)

CC the authors of the checktransupdate.py script?

>=20
> Thanks.

Best,
Yukai Wu



