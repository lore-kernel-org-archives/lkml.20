Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF7527582
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687932; cv=pass; b=HYbtg/TFs0wCI7Mm0Tj1CNBPRzmKWdWQdlF2vKWLzbMb8nShxL+ZBw7oUGVPlk08qMQmlEp0F9Y21MN2QsHTDYJduMjep2UPAuuNdYI4/uOxyOD5batK2tk0eDIU2PoZWxwse3TG8xqK8LHCApuTGzGpSsSu7/VjD70C/Q6H6gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687932; c=relaxed/simple;
	bh=dnRZgOZPN8h1C48So+KfFB399+wu5SK9LTEtwCEcT2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGrUttlcNf9P3sLvEdcYtYZ7nCgwQlkDjDZzDifLQnojSte8WpyuXVAv8gyzKRRudjaFXs6ASc3DivuBUzFBN/xYvRiumUDO+yaOc0tjffIRtHWSRQ3Rvn8ybSx6QRbcbEHkm4/kTyNSpix3NnsRF+gdmcWrCgfcoi/qmU/m8jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcZF7L3O; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcZF7L3O"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f00cd132so200836e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687929; cv=none;
        d=google.com; s=arc-20260327;
        b=oFQYp8Ws6bq7pWkPtr+yqlXj7Dy5D3Iy4G5rpssphToj2bDBF7x10RkTpq7TSyQS/X
         MAHB1/agS5LbdWOC4TRdsP+kyWo98AFghR2ftDbbA0X+G1z0dQlVLiERTPuAZkLYaDYa
         Kqlu7qkwWpn6ym8VQcW7nGi4IQlQLhhZzIOIPeeweoWsMMH7rFUwo+XPl9fqVLTvkyCn
         BobFds5ur2d5MfKoqVmhhwi9pFeviRnmGrGZ2NLMNLr0YQo9RgGFAQb335hJthVFzdZS
         Ig1bHFIglPwxf9A1tqWjz0sv+4U5FFg9Cil7jwsMHhtP1y0S2KReqbCD5MNK0gIG7VwQ
         hzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        fh=n8/EpQLExlcN3e6Mc6B1qUQRbxur0uo63WWXWAX4xCo=;
        b=r12qgwYxinb7XJfRZij8/u6ttP3DrbaHvxILhlPFTWULzuVvXOpO5jzMtmaNuBwYao
         2ikvofwEhcDf0mx7qlov5HTCskzKC7PTbe4niiIzGl2a4FNtMd4hs+/b2bdTYCEaXO+E
         AnbKyt6NGqy96qUi4y2IIFGDWnzjtlXBUz/UoZMDOOpFJEEwF/lCJHmuTQJgAtUhFYm+
         flhxLt7LGH8xpi7MHST/YiQb3LkU0g2qw0QVdqi1FN3BnM2iwfunUpJJi0TzuNNYI5an
         PyObFB6RS7oyKvZg4wYgjFQguwPFM9oVkP76IoYwqWjvhJhp3e7NPA4Ce612nUMraIC8
         +lWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687929; x=1791292729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        b=qcZF7L3OnrfiKm8Z+a+sMqBBK/erb1XVb+acvu7SHvhz4HD4v/VgDy9RWTE/Tc2iQ/
         m3L28MVnczYZ9jBAYJyzw0XFgN2UieVZF57ZaZ8iwu3I4vTmU9UHQIJe6NlfVO2dKdBk
         mjKUUAEhSgNnqzaBueuxHASqHxqJVmLw6zRmatTf6rzmJPNbvWIlpQADLkeEXLxV4B0H
         wGqc09VYdp+Z77+fXbwMopLYyJ0mukcoyNp47B9LJkXmdYlb7Q6eMOiU8mRPNbIUaA8G
         yEtUqvRCV5PH8uSlXNu85tAcgy+iz/efYcSKXjrJtpw9JVm0QiqPqkmvYbaaGxrU2N/w
         s/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687929; x=1791292729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        b=DgE6Fr3sigun1g+yXeKeb2c0S4rn/vE28YVuC2ds6SIleJJ4lJ6tFBEhWZva8Tw8yW
         +/iSuvhAgRQNBIswnsF+jpBufL29rmI1IJsTYZbNCqc9ygyU1yp0mCKKUgURDPUXxWRP
         vsNXDIpeWppw/QGKFdLghbX1ewJIK+OAfAvGNFYa99IL38NPYJe8kvI+OtJTArGtxx5h
         zI9OVT9v5tvjm4utz8/kOgdWZXdPk8zpZaIe6qy+GTq5/lvjvphTvqlZE7MK1cVSEf8s
         dPzRxtSXFrWJ0RqT7i1d96/ahosApqO6ZYaV0o4miPNQFAgvvYvsCpelodakGmuoPoFk
         HBAw==
X-Forwarded-Encrypted: i=1; AKwUvByDUVg0cjwKXYFlhB/lI9+Kozi1H58w1RNRJmHq4wHyXz4MJN44Wrl1VAiyW53fkJqz7uCrQwnW/XY/tt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTTbi72JzKPBnV2pOHckWWJmcd4+9/sN1ePEwggJ4eCZk8YuIB
	MA7ZyI61XLmjXYYFYQwDScf9pHNMUoCNJhATxxSlXF1zFhyZoKkQG0lt2AS28Rp15JL64meNkaS
	U74l3sGhit4XmaD1bQ+/v4DX32nsPlBQ=
X-Gm-Gg: AYBFou1DnUy3TfWQIkQj3Xn1vRGFV+ghQekJ3Q1iVeogCDg+/rTKCjeORMdjI+odvT/
	f7H0/D2BKLDO/Gj5cJorqDfHAEojXNrrTO9z8HeWI0XpYip73/eN3KgLUrBET3hTucl3VXkfE6z
	puI6Z6t/YaZ8n8zQBOJK2Ey+8PQGos7k6lE44RGr+eXS414gWmAgiOalj8PgKII+lo/Dzp7Ve7x
	NDv7I2NM7D4gFnqN+6ziWy8MIhdtCKYnLA+9BW31p9JxiQijPig1StNkOvLEqFtbYN9J2prl+F3
	cBuRVX+LkNMZ88tmc9CcNfa2EgmUNp4zHOxHx+69sUUnmxyLd1jNVsLSdy6efDcZyumxqD41F2w
	1nKTR2FHjTutv9a/Uxku+HIqQ5vb5aTVgJjMrLfzMxBMhmzng
X-Received: by 2002:a05:6512:4020:b0:5b8:f0a4:350b with SMTP id
 2adb3069b0e04-5b8f0a436bdmr3345652e87.1.1790687928678; Tue, 29 Sep 2026
 06:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com> <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com>
In-Reply-To: <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Tue, 29 Sep 2026 21:18:36 +0800
X-Gm-Features: AclHuK8JI9A3jbYNFYQfj8FyUPccoS-iBb3m2QeZc47P98WPh-RJeMF-A3fYA6A
Message-ID: <CAKspUh+rJ7qm7VKXTYcqqPxwNWnNJ09p3DAciwGXGzpBCOJ=NA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Yizhou Tang <tangyeechou@gmail.com>
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

On Tue, Sep 29, 2026 at 8:14 PM Yi Tang <tangyeechou@gmail.com> wrote:
> I have no objection to removing the duplicate contact information. I
> noticed that some translations in these commits were changed to
> traditional Chinese terminology, such as changing "=E7=A1=AC=E4=BB=B6" to=
 "=E7=A1=AC=E9=AB=94". I
> suggest submitting these changes as separate commits to make them
> easier for everyone to review.

Thanks for looking, Yi.

That change is not part of this series.  What you saw is in the
range-diff, which compares the v1 and v2 patches as text, context lines
included.  v1 was based on v7.2 and v2 on docs-next, where the zh_TW
process/ series has already landed; that series did the terminology
update in separate commits, e.g. 5f0178db86a3 ("docs/zh_TW: process:
localize terminology in embargoed-hardware-issues.rst").

So "=E7=A1=AC=E4=BB=B6" -> "=E7=A1=AC=E9=AB=94" only shows up as a changed =
context line (note the
blank second column).  The v2 patches themselves change no wording;
they only delete the credit and contact lines.

Thanks,
Chen-Yu
