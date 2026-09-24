Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4237B020
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259214; cv=pass; b=HliFOPnAFojWvWszwH/Vnk6tCCJEBNNA6OausmNqJmiF0gmxcysy65plAt8JxazZSUW/sZ+bQCfkvWLNpGkjnUEdsPUHeszN+rZIkYKU++dWdmKHl1kvH+Ji9CzFPaWo6XmKC+qHTMX+YmWtdAB6GLzzcFwU5MOd0+YSAEgGaVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259214; c=relaxed/simple;
	bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qos78SNodrz+odpiA1d1lVFTMcUlEkmHLJVEbrAIVPYHDNapu0FM/iz4/uQDXv0Hi/C59VUIOWMY1YEk6eFDtgUWRC+OzF7CfJ2sGQHyuUh7iLphpdjz2fKNDEerEnJ+lv8AtD4sWm5XOHtEct5plVJIiuJVlzTtkGl0/D9G7ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UbdL19h3; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UbdL19h3"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso2897856a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259210; cv=none;
        d=google.com; s=arc-20260327;
        b=KiSUocc2Xff4vL6S23zDiFKQFdrU9XCVS4q2Gajtrx9gR31e+uBYyA/hB96wFhAiJh
         qxIskE3ygsir+xZ6C8yt/XlI+c+9m+FnnDMUAUI6g2y4AzRpFk60raA/gS0+X1gX3tKF
         9s8m8QZ2abgbrgv/bhC3oad929P/aYQTGJ7d2mDna8eh5QtCm2ZVfzKVKv5sEA/Rn5La
         A0iIfA8mDqiDy3eD8VVVO/eQ8+BfM38Y6Q8SzU9xUC/2kbhViVfE4MZQtQ6g5jk4gp0g
         FSljEctRDJ6P7Yvqs9kzwh51XrdGLpVWcfFD3UJ8hmQ0YjLdS/9lXljTkf4o9CcSaEnV
         PmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        fh=e0jwf7Cn0HnY4fkTaTuzMvzfkR0xXNlJGneYmG1j+yc=;
        b=h0Iw9JLpk5GN55dG+lId7SYoWukiq42CnHNmFuicqkmzZfy2UWmDX2bEDaxqdPUiLC
         ORbeFjaxf1rOZgSwbsHeRDQLHM2HXcKB0UpuPR9tbyc5voq0xJonNr2h7P3LguQYsh1W
         gS0LCbAF4WNefIkNAwz5h1lCaA64AlIL0ff4BWbKQcIDfWZzhr4MNXV45mJrwzfMcqn8
         NPc81QmPpTYHbRMl26HH7IyJQXVVRjGoAbIy0lURmuuDwHAGObHT2mK99Q2pMm6EBjpB
         AU8R8WqHrOLGJBf+RSX0ELVNLukyuaPNwAa8nGkfbq2AOH0hPn9PMWqchwB+89Mw7XEz
         9f9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790259210; x=1790864010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        b=UbdL19h3yFY6+RMeRRcn0pSvBbwBZtt3bR/DDc7oUnz9jRCgedq8PuTxrXMbb05RwC
         KuIbkJi+Qh666ILqzA2CkmAtrEWHQa2XBbRV5iYdZSgyoxyOX0YgRBCXDZ+DToREuMvP
         SqMfW4rFXdHGQhVZrcKajwT0GcEB0caaN4pO6jfkKFR4L7VKHo8an9/jbE4CTzXYoRI8
         XcuaemRfxnpoU/vJE2thHZMMFatDk0oQgxVNSepr2l11FXMji0vMEO0CWlOADtyG3qHk
         S9VVyNJYRtZrV+3ueMu4nPIfZK8BNhhcjgqklObED7flFUZkn/j1WK61lYswM74kLw3q
         aiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259210; x=1790864010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        b=yOgeS3+fY3AZAV1FnWLrGAR+zkQi1FbR2NwLb5IIvXWok6UkM8Vozil0C76LUOUH/6
         seLMaoOH+ey0eTnmEZMUL2ckUdEML2cfsHLkdImckhCe/Wv/W8GPGHFtc4QMcq3NV0mv
         8Fu+isoT/l1MQJJMKgj2jNObcQ5enW58gXbhxkdfwl9Kv6TlUqcRdNFPxy1b9sx61fkw
         4/N/hCx1aG9g2eJVmMl5r828C+eZ0DqZIeOsdxNYrKoIR0EPrAb9BRKSSjSjw6U+ZVPC
         uaql6GWFSX7iHP5XpimrDd9FJuVBNxE7knweO+QDlO+iMBuNggicoaFyHZ6wZMHfcH4r
         aUTQ==
X-Forwarded-Encrypted: i=1; AKwUvByDOsoWxUkBbXRQEVhv3jtra7H98cN6q7AikZ9nY5GCn6Z8d2wTSCP398UOjxmqNt2HNqXuQdDKZA3boHk=@vger.kernel.org
X-Gm-Message-State: AFuF++kY4N3kNpwSHJlq0Mezz/5mKQ8KGoAVpt/PeqWKMCtXRenO5eTP
	8NeVtpYsKfYpOW161KCy0/yzUZN/IAKt4fGlQVLqlct0G5rQimjMeE+pDQn7rC+P4/3xS13EQod
	yViSZbSVojiS+ysuIoz7xV0dw9DohmW2S632jVJ3Qhg==
X-Gm-Gg: AYBFou2cMcFfE7B74y4ZjrkgNpki4SkLExnt8+j0OzWxCfoQH6cyHTno2EBou1vfk/Y
	cNce4voNSfXsN2aL13oHanUNCYhzuUpeHYbRumBIcnUmawc0nE6P79JCGiCfzJmBD8KZcTQpUsN
	XyhF18PbqLg7XfXxCpKLu8+ufJ8ZByiszRWRIEnCIRalwggjzn8AaOmWQlNfg39NoxNxDh48rSf
	dE0E9/eVY8cXT/O68i6EjQDOJ+nEPKSV7EHNUcO/3SyETE9Ok26kjR1SCwwqTD8XJn2kQotmlNq
	0X5xsE3GmiyuSl16MZDWGUDpAeuTiDCr1qByUn585kYaxbo+fwJuUROn7A==
X-Received: by 2002:a05:6402:52c9:b0:6a9:984b:4c71 with SMTP id
 4fb4d7f45d1cf-6aac90dca01mr2240458a12.33.1790259210418; Thu, 24 Sep 2026
 07:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924100106.2054127-1-zong.li@sifive.com> <arUSRcgzWurL-YrL@8bytes.org>
In-Reply-To: <arUSRcgzWurL-YrL@8bytes.org>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 24 Sep 2026 22:13:18 +0800
X-Gm-Features: AclHuK-bIWWUadjBwDkFnhXkUVbzOHGI5rymQuXxYOn79n8X8KsdtkoE0POTC7w
Message-ID: <CANXhq0qL5qwejCXcfLNYfK025AYaMbMOzf=p0EP-NOkThL30Ug@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] RISC-V IOMMU HPM support
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	mark.rutland@arm.com, andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, 
	yang.yicong@picoheart.com, nutty.liu@hotmail.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:07=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> On Thu, Sep 24, 2026 at 03:01:03AM -0700, Zong Li wrote:
> > This series implements support for the RISC-V IOMMU hardware performanc=
e
> > monitor.
>
> Do you have a link to the specification of the HPM (and additionally the =
IOMMU
> itself)?
>

Here is the download link for the latest release specification:
https://github.com/riscv-non-isa/riscv-iommu/releases/download/20260222/ris=
cv-iommu.pdf
Alternatively, you can reference the GitHub repository:
https://github.com/riscv-non-isa/riscv-iommu
This specification includes both the IOMMU and HPM parts (sections 6.19 - 6=
.23).
Thanks
