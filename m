Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C094CDDC8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063610; cv=pass; b=O5uUJ+pTR7xQ2j+M+Vyga0OCljpQf1AVvYvmh13NcdI3wfHcuuzl+cNBf/RP0FbJMyMs92u3oaYDLwgO6nkJMR1melrUHUfOjpBJIhh85XKNeyxOarsdtPEULNEFdbcY4AI40kFI2vhzE5Jt0G3iG9hqQ1+padw56wFORlEPo80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063610; c=relaxed/simple;
	bh=11b+lqzscsdK8Ta3S3pSJSA/n1DvvcVP456Pe6Yhyds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfn7t7noEWoLz/HHkplBN8VsXhiC9hYkenED4Rz3CMbyR2Wou7BL77bS2ZQIYIVDmFwfftVhTSJbRs/0UFh7oKTn5ZbqFbsVmpik50NGB7k5ZjA6C1ZPYKa+15iUVr+U56fixGN3lu4F+4HUheY1Ng96MSpvZoRtnraNPIJ2Hhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJM1jRTJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWzUq5H6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJM1jRTJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWzUq5H6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sQF93675297
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=; b=HJM1jRTJWzZcVx+p
	mWV08rpifDcLwRU4dEETmvvT3bgJAlIPB4g3kaqx6I9Re+H5w3ftTAXJJSef9bff
	oVhbHiK7C9XnMMZLHuTU45pO+uplMp/JFmBhXKk9/vifIvm0buSM0gc/U5ZpN2UH
	7ENVnTgHl8wUHxxL/TJ0HKk/V4O9OWkyvkxLztXncllM6rlDdHEYEwdIR9Vh+Snj
	530fUHFUzMEoKxvWYt9w84s1r8r0beYVGR/3/7xPE2e73ZCWVDrgG7+REhBMLsJl
	n6KSRZju/Zhcuxn0Dwf00a0z8yL8ykyRJ7ueyn8/TGTEc6sUecKVZ3XrSq/c9PJ4
	6rrMJA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s2fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:53:13 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8200c815489so42005147b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063593; cv=none;
        d=google.com; s=arc-20260327;
        b=VaT77fkOiPaPN/M4cMG49rzmzatf4guA9n0zVbPGzSYBUo5dYa/5+45c+wvWLXzx6I
         2hmFreD2547ChZA4JdFFGh0hK72qv/C6GQgOLD+L6LuvQxPxmCVBFDidHn91RRF3GdIF
         9XMdRVc8w5YK7QOiCu4MUJ0BOWJi97oUsjJ6KYYvM+ex8F+4EFKRz/irzfPo6X6bQsIe
         uM7lG9Ip1hZjihhtvNtwWjBH0zWMIODvUBtJRXu/qwnvKJrOQR1gvamQnFMf78TT8r2S
         0cwF7SR0FK3CoxLLbrWKdg88t73zYI7KiBVySbZAmXwpVX4DMvd67Q+FWBoTLO1Ly/vw
         uFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        fh=KGkX0xvYGG4SiGW7a5MbezsmEN1wHnpPu9AfsGqvrec=;
        b=GbVFXM0aHsS+HJeYsEZwR9tUhDkRETJJHpXBqIb2Ws+wXGTIsn0y0QaO6w1sgFvA2Y
         fgO7ZyLGofwhi9VcgOEFvBUzAuzjMLkjD7n8EJDgi9K6sXG+aPGf1i80mVQeTQm6/u4R
         y9O97eSFxPWUi3YRgZDUcuGo0+LK4z3eDAYDpGmOzcj/ZA452FS2KQXtMSOkwjccbcgn
         CXEp0daW6NE/31eC5jflvmjchCv3XXSXVXWRT0Ektgu/4h5kkabqdo82lzUBRZ7ymLki
         DX6RKcz7zYd5SmT61XmQDVATH8FhFGbDbrKUXYQzFJ06WM4BnmkWu0F1WIvxVZS2W01H
         N6ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063593; x=1790668393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        b=CWzUq5H6bzvd4KyZau18+uJPOTHXIBJ9x4DBglmMrXMyBBkAag+F5PM+wlh3iyBwq5
         spwVW/q5V4sB/jtRn+SK+/mKCDv4TQiX8Yb9pGb6DUcHcfTT9D2NmEVAwi70tJTBbnsD
         FhmEF2upjcgG6MoF8TOy22VLrwUOMj2QagmdJiR5vPxpnkZktDzAqgsXn0TalPeDOMsJ
         lVrCMCAXf/RHzKpjRSeUO5fUx4pT4EkuqB+zT/D3DcflAakNn3/oXXpvdzMTj+kETaKZ
         7+ha74FZwhl+RB2/r9OLepf0pDygaKqhYJvU3Vjj+oQUkKfe4owP9+dWtbqatbTQYx0W
         Ry9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063593; x=1790668393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        b=m49YLEYx/to9Yh5P53V+vR7I/72xBRH2AyYFG0ji5qxiXBppKimrUJn0l0z8vbwHjl
         UImBYEupCE5nG4675rEhE2cK38Y8ktI81UMRtqGmNU1lmUSSRPKGrxemglzKgyL9oFIj
         dSx3SvjIFV+PUjqE6FS6QL0+IB8IMHx7LXzOl3/jss0oN5YSiKbEnS8kmmA2FNCQxG0Q
         EhTvI3vt1RgkEFVZxvrlW4V+nHOk/SEMeEN63FkTTXLEs4uJOGe+a9vVjMUcArGQdgon
         xep3SBKSlRi0dt2rmF+cJ+iYkBynbimsPJ+cl2OLFElA6oKXgikWsOviEEvpeccGuJRg
         Lr/g==
X-Forwarded-Encrypted: i=1; AKwUvBzPeYywiiGFF34tuPCpsKjmVmvdvMiysfQxmrblCMXyebn6z4KfmW2/rdtUNOYboA36+5VgVMPHbRPeyYU=@vger.kernel.org
X-Gm-Message-State: AFuF++k/wn33M/nf3wg9lgod7nQAwg+kNB+cS+iY7T6KCZBnHAmHUI4+
	DFf/aSx0NXvYRveNpwvq55Ubr/X7p3T8+KDdPIbz/RHGJnf0qnr/75bjrx6kKOpm01szWXUqEya
	kUXqQaUXzREOHv8gzv63fdxRPSsPUrWrCvGZmf62egIXLwrTsjw1QytDsXq5YKQqCI4X52VJaoH
	CzQkYbdZoARcPmoBCxKktNihhk7wJ4w2zSul3OOEKqiw==
X-Gm-Gg: AYBFou2Z6ba7tVBss4SD78mTvmOjij4rGLSepGbC1JlR6wAuXO95RuwCy3Yo5IKiO0J
	pU7v+hMc7SKp/e2HINSFIltGY5eEyqnpmqioRDd+BuWh7pyHz+xl1EYXR/Vd4wdlo3BGo/ZJnzJ
	zGg/ydDDY9nw34mx6WjCFmXHP4zfkxYbHko4sjiJPcNlnBDFXu01yqHmM=
X-Received: by 2002:a05:690c:34c9:b0:8a2:2993:5237 with SMTP id 00721157ae682-8a22993528dmr6368407b3.26.1790063592658;
        Tue, 22 Sep 2026 00:53:12 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:8a2:2993:5237 with SMTP id
 00721157ae682-8a22993528dmr6368287b3.26.1790063592222; Tue, 22 Sep 2026
 00:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914175435.118303-4-marouene.boubakri@oss.nxp.com> <20260915020235.507302-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260915020235.507302-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:53:01 +0200
X-Gm-Features: AcwNN1XNGpI1PX37tg0BbLtLSRsjIrFGw8p2FV8jkmKL1NiS6WMD2T0eaz1XIwE
Message-ID: <CAGgiveUEFL+UWzydBGxVveadffpO3BWbKjQ1UbJ_dOPgLu2m4A@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: prepare the driver for RISC-V
To: marouene.boubakri@oss.nxp.com
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-riscv@lists.infradead.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: m9GccwrUsmu8EHORz5O8DWYd2N_NT0Zv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXyyNXDg/zt/QZ
 pceuZt0zIJmze0WvRjlK0mMabH4AeFWaM/3wIwqN1eLgITKwO7HaYRbcpxJbg6oOKT6HdBFygEY
 8HrqGAufwCdZkce7X5/47Rg3sbXPa2g=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab233e9 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=zEqzrABc4qne4u8U3FwA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: m9GccwrUsmu8EHORz5O8DWYd2N_NT0Zv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX72pRpHF/i/3K
 lxMkoK25MhyNfORoXxnLKg4wSiYFi/BZg9mdqHYV1/idADL4hIWIQstT87Arfhy3iJlmKvQFVYC
 q1yDkfKfpPqj15eYA0KRjBc/FzRbWKhssXBMs5zB7Y8os/ST9t53meH0X6bd4ePzYV8Dxxs6jVp
 q/96voWQLvhcq/ipQGwNWQkVCSyNaKfc6QRvY3NTOGBgho9DewKVb2ctUN+RljbRbJ+56LaZbvU
 aH9KkRzmuQziYx1yjpXB3dhAUvtnJmSOj29bCapBWyzznOk6Ls9+eXCCKM4766SWDlKJlaMBdAn
 rCpiNv+zBnjBLylFLq/xqss1/3GR8HOf12NGz6ZIqpvefSa78MhFw43Nq4qzWjIMvwLhhovI6me
 x2RQaZx7NiHGw3e99OxkV2SX/S47K1JrILvpa11DL4Wj66cc6vHA9CXlAJDt8dNN5jaIYWZQPh+
 hKvma7eWQhGwuAQ008g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

Hi,

On Tue, Sep 15, 2026 at 3:48=E2=80=AFAM <marouene.boubakri@oss.nxp.com> wro=
te:
>
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>
> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
> both specific to Arm, and the TEE subsystem and the OP-TEE driver
> depend on HAVE_ARM_SMCCC. On RISC-V there is no SMC instruction: OP-TEE
> runs in a domain isolated by the M-mode firmware and is reached through
> the RISC-V Platform Management Interface (RPMI), carried on an SBI
> Message Proxy (MPXY) channel, for which Linux already has a mailbox
> driver.
>
> This series only puts the build plumbing in place for a third ABI next
> to the SMC and FF-A ones:
>
> - patch 1 builds the Arm-specific code of the driver only on Arm:
>   smc_abi.c when HAVE_ARM_SMCCC is set and ffa_abi.c when
>   ARM_FFA_TRANSPORT is enabled, with stubs for their registration
>   otherwise. The SMCCC header, the SMC and FF-A specific types and the
>   SMC RPC register parameters in optee_private.h are kept under the
>   same conditions, so that nothing Arm-specific is left in the common
>   part of the driver;

This makes sense. Thanks for the cleanup. I'm reviewing the patch.

>
> - patch 2 adds an RPMI ABI placeholder: an OPTEE_RPMI_ABI option built
>   when the MPXY mailbox driver is enabled, rpmi_abi.c and its
>   registration from the driver core. The transport is not implemented,
>   so the registration fails with -EOPNOTSUPP;
>
> - patch 3 lets the TEE subsystem and the OP-TEE driver be enabled on
>   RISC-V, and teaches the memory type check of the driver about the
>   RISC-V page attributes, without which the driver does not build
>   there. It is kept separate as it changes the dependencies of the
>   subsystem-wide TEE menu.

I don't think we need any empty shells. I'd rather wait until we have somet=
hing.
So please drop patches 2 and 3.

>
> There is no functional change. On Arm, OPTEE still depends on
> HAVE_ARM_SMCCC and the SMC and FF-A ABIs are built whenever they can be
> registered. On RISC-V the driver builds without any Arm-specific code
> but no ABI registers, so it does not load. The RPMI transport will be
> implemented on top of this in a separate series.
>
> Testing: Tested with the configurations below, riscv64 and arm64,
> built-in and as modules, and W=3D1 at every step of the series.
>
>   - riscv64, minimal config + CONFIG_TEE=3Dy CONFIG_OPTEE=3Dy
>   - riscv64, minimal config + CONFIG_TEE=3Dm CONFIG_OPTEE=3Dm
>   - arm64, minimal config + CONFIG_OPTEE=3Dy CONFIG_ARM_FFA_TRANSPORT=3Dy
>   - arm64, minimal config + CONFIG_OPTEE=3Dy CONFIG_ARM_FFA_TRANSPORT=3Dm
>   - arm64, minimal config + CONFIG_OPTEE=3Dy CONFIG_ARM_FFA_TRANSPORT=3Dn

Since this is a V2, I'm missing what has changed from the V1. The
patch subject prefix is also incorrect (the V1 was correct) and
confuses the b4 tool. When you post a new version of a patch set,
please don't add an explicit In-Reply-To header in the cover letter to
the previous patch set
https://www.kernel.org/doc/html/v4.19/process/submitting-patches.html#expli=
cit-in-reply-to-headers

Cheers,
Jens

>
> Marouene Boubakri (3):
>   tee: optee: build the Arm-specific code only on Arm
>   tee: optee: add an RPMI ABI placeholder
>   tee: optee: allow enabling the driver on RISC-V
>
>  drivers/tee/Kconfig               |  2 +-
>  drivers/tee/optee/Kconfig         | 10 +++++-
>  drivers/tee/optee/Makefile        |  5 +--
>  drivers/tee/optee/call.c          |  8 +++++
>  drivers/tee/optee/core.c          |  8 +++--
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 52 ++++++++++++++++++++++++++++++-
>  drivers/tee/optee/rpmi_abi.c      | 23 ++++++++++++++
>  8 files changed, 101 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/tee/optee/rpmi_abi.c
>
> --
> 2.34.1
>
