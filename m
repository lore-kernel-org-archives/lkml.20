Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180159;
	b=RD1wwnf1165K7OQD8F2SG7DvdW9jSZmI/17FGfUiXgvNIwamUw/OS/vRiBfi7JwQq8ry
	 UVYlM9PiGyRFSP+SIrMfzdf5kdP+oHtL2aSP2+zhyxpTW7vITWL1jg/8aDOX87Weslv8t
	 bMmW+pSV2+OIokwoyEuPLF4i6tbB2ZQbYm/95IluBAGrkuBWbiej1svZXcYJ6c65sh89J
	 5LyWlOsLuyHs6Rb9YcT2Y4is7MIp/xE7h2UapjXAylassI7+NWzjoBJoWq4kOG3woxKT/
	 t66BO0LTDilNEIyaRbDlyonAT9eKdYhQFHXbUjYyMpbJaUs78xjERlolk6iLTovvXNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MHhXmWSjTP17S95cJvWqHO6uKt5FNXxDrOyDLF0HSW4=;
	b=b1vfIWE9OMeBEoFd07dgTLaKEJ6UzGXpinSbVLTpFP77CWrGlAaEllIGuwaIAeM1Lb8l
	 xFUORcwgcmzu2qV0wx+/eSXRE+ODtu04T0pawYjk09vuPDVVB+cKIfDzphHt1NXKHB0sY
	 gP/2FpKzVw2ATX7gmY/kzvknCIneuFpVMWvti/j/CKjsBV/e8tV2BzFbNcx3O0pMWHEN1
	 mfB9c3YrOK2ywzIMJxgXcAFJv0naYEUNHa98XFLLM3hVJAODnNaUT0b92Rmqba62AVYsn
	 xs5YiNJvt1ZEyhLt0dPTmwhVaCrcU9htCM7SWCn7NxBaSan3v/udWMl2W34wmo4enqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j372L94+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghPE0PkU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D966606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D966606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j372L94+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghPE0PkU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K0J73892524
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHhXmWSjTP17S95cJvWqHO6uKt5FNXxDrOyDLF0HSW4=; b=j372L94+34Ti0E6Q
	K0EnBgBNjfw5Fv58vunGttUQzhdEiPVTYArZSlITBAoOpN1JRkYdXUISAp+OIKNd
	81ArpJr+6ktPfKrNCaP3rOCl2sq05BHNF+Aolvtd9sFxwCQlIT6KGsfOSm01O19F
	aa7UuokufC5jHlueJiEKSo8dBQAzlM7D1QcHiNAV1oDLHeyeRTJSFgeHHteMQJ8D
	KIyrU7yvVu6Ny20Wm+BazlEJ2esMhhqRmbk8CbXN2kusicu0vEp7HgcUSe5SVP+f
	KdAV5HJ4eOOuYeIp0K6tJ8ulxGRTajUye6hvNw1tUlk4uN9T9pT9Im0JCrj2AlhX
	V5vfXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91s32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso997558a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180158; cv=none;
        d=google.com; s=arc-20260327;
        b=ZY6NS50k4z4Rl+MXqoLu6ECejSkRIJY+Rk8Rl09nvQAwIq0m3tl06Y7T5ccveN+YVX
         w+b2w3a50ePXRKEWpxOvAUYVy9tJijptzxFUKCgSUys1QlAJ0AuBgjXkNnyxLHmR2cSl
         SyQGsnr39pvNQi3gyMffRiEOX4kyqIBIkp7s+2wFZmD+aToSWRNFTrrJK//pGuWp0Z1E
         SRnSTJQJnFxG2jEBOMJNDpc3j0KSH4b54cuEdmKFxXfwWaDeLpQdy9w+lmsVQpOUGDlH
         Kf8nI+SBO8vU9vYDYhdrA6JUfouN6CR8wWB1qbR9qPYgf+Z8SkRxuBw1p13/nVfucXBA
         pApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHhXmWSjTP17S95cJvWqHO6uKt5FNXxDrOyDLF0HSW4=;
        fh=UlxLlS7Wstx/SJ+xVf4mcAgEyY5eiJOTkJwdXcAkAk4=;
        b=bYqe3zi9AeAe2YfXg3OF4SZPXafJ8xspxnp+e5Glv9YwELWvDsZYqT3Y4S/g6Wm9ez
         YwIEPEpQTIe02Nr+ywTMDEfYqRD680mN9//49fmGZEwyIE4l8EnJ9PDGIcgE9OfqKHYz
         B1DiUYbsKg2xS01NszF5FUSBU1XRkBYBrHjc3xSjvH0jwxPRe1P436k9OIAktHAifjzd
         JERoWTzYkf8jibV14HQvb4oq1JcGecjxxi5f0g9rtSCWk6Ee6h8Ws16bg+D6xwe0qnfd
         riIf/NAFkMbpLZ/mtRMJigqAJJPC8018H788r4k9iiafKxIqS1x2FriigrJuREZfYlJv
         C1oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180158; x=1793784958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHhXmWSjTP17S95cJvWqHO6uKt5FNXxDrOyDLF0HSW4=;
        b=ghPE0PkUb3Dtbb4hZ6icTnUEpSsrBAhAQtxMCXuUQjrXrjte3OLwXeY2VnNvfKPJ7+
         FTfdsH4YFYwbxiqn37kGX8HcGd0TOeMoxj+p+nZrB57VpFwgRj3lB1A4m92AmIqko1jP
         Ny51XdP5mxOs7Wkuyc8iCzaW29zY/zdtpahriGNanhZZb45rG03ot1DWVd8w83BM9A3E
         1V7pilVX7p1X/CkgugiwoOaV1fdpHOYQJBRQRcJ4gzgsbKsdFpd2x93bHUFWc6wAx05v
         RVES7Uw5DSTj3xhN7T/qqDHW96WmPCXX0Q99Kf0ykDlTTjr9DRlCeLv8AHl8t5uEruCu
         QP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180158; x=1793784958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHhXmWSjTP17S95cJvWqHO6uKt5FNXxDrOyDLF0HSW4=;
        b=u0HjyA5Evbx+g4BHI4+pCjjlD/cNujNebJEfvu3F6nXk3UK1JEqJx23IqKLgT+QyAA
         31fBhcj9bJaMW50XXnC2avjVCuAvmIacznt/h1T0/Zv5HpBqGBImlN6+KXi6EUBaYnHs
         0H2qkZKX1F8X7fF+DMPXojNcALTar5zhyqSs7Ki+M+4pwz+3TmjMSudsF49Xix+YexWD
         dKCNyhCFYl3B3NQp9ofUXdtNUVu9bsXC3D0PVh0o0tbRugLzV1xm5XKXdMsZalfZPjIe
         kBmfv1NtMSVn5SahyPOHXFvlPZcBFjUzdMDBkQjrPzY0bBTfnFoBjlrUQwBrORWZicRN
         f18Q==
X-Forwarded-Encrypted: i=1; AKwUvBwutq7T/cGJZlLEWpzFPwIGIBnB7MI15eCw3184Q73GU/4r+NLJoy1Fe+cyqlgzt6/JnyDHxs0BkgomoO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz8SNe7FqgDYaXlgB/zxvpzfauG2Nlba14LkHEo0CugIhkXeFC
	6qAvDSTgNAId+dv6+aLOnapaIWgGTbatpuG5XBSzD6v5Q0OaMdzG6f0iV7GBVNHhFEOsbX7YjEl
	U8a2J+pZT2k/rOKnjXG5gYEIxFiJDQuQe1elgPqgoLidBSTpBoI90A7ypx1mjktZc0gB9oNXG2v
	LRaYb8PsuQ9WYjb6NADGJMwx5L3JQeA+H6K2iqm9+tuQ==
X-Gm-Gg: AYBFou1oaAhJ5c36nGgTflokuAeGbZei4OhyhopbV1EHcJOrkbj3HW2jmafFf4J86lq
	iC7aqoWmhY/mM+WvVMhh7OCnJi4AxgPYnAT/6Lsi1prZdRBhcP7z86hna56Nhdus+NUIZhs24Sa
	BI1mKsjOqKsoG9mtETDGFAcoAYTthgozwGBME9o+Yuw7oKpQqDQChpTVkZrA==
X-Received: by 2002:a05:6a21:6e86:b0:3e8:b7fd:6288 with SMTP id adf61e73a8af0-3e9023eca31mr1324558637.41.1793180157476;
        Wed, 28 Oct 2026 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e86:b0:3e8:b7fd:6288 with SMTP id
 adf61e73a8af0-3e9023eca31mr1324549637.41.1793180157009; Wed, 28 Oct 2026
 02:35:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com> <CAKekbet7B=EvD+3Q9PFJAOJZvpz_hCn_dU__e+3=qhsFet=FVQ@mail.gmail.com>
In-Reply-To: <CAKekbet7B=EvD+3Q9PFJAOJZvpz_hCn_dU__e+3=qhsFet=FVQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:35:45 +0100
X-Gm-Features: AclHuK9QRLe35In0U3gtxLoFryGbGO3wdrYHhHW1QKxnqJjElusxrdPoYE0LnvY
Message-ID: <CAPx+jO_HUTrMnzNw-Ev0FWfJdgUQ1nU16knY=qC6oCTQh-=Yfw@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] mmc: core: Keep the card powered across suspend
 when firmware needs it live
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1c1fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=auGEOW3Oc7kVmTz6KmgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX/3Edry7JF9O6
 rTlsa93PiDcaC9yjFfDblBeD2T4ugkW0jg7L4Y3bg5O+DxEDVpU76mK4XnnCy4ojLxQbW2gKuxl
 8UfqO6fcnIHVY47fPymGwRSjmE2ETVE=
X-Proofpoint-GUID: MxMWjgH5yw8TEojWv_NY6leKF40r62t0
X-Proofpoint-ORIG-GUID: MxMWjgH5yw8TEojWv_NY6leKF40r62t0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX22mLeggOQETr
 U1Re/mWzUTr71KyFc+3zA0StUQmZswz7f3GZmnvgYnH2rRsZzrNB5i5F7ta7xkHGLec0j78V3nT
 vVKnINGcng74llVPfE3PVwEl/g2ox1rliyPygE+Lzy+yvP9VhEMJJu16CU9Cs5HCEgF+jT55Wv4
 594mHarbDgLPF76bWtjkMP9u0glljhTV0WTD4Bbr/k3IcflJENPrLv2W6Kl2dqF+nrC9KH8t8Iv
 jCZk9DJsTCjKXX3LeXlAMPWbR8V2jtHt8LKa6nIkH3AUx74Cusua8OUOObJ/Zn6so6PhFxvebFw
 seJb3GKbihdseIUce4DrIz9C7CtmkNQ6wDRRhPsO4C3ngTPG8njld35KJexJHPwHbK3UqCRvOfN
 H7UZFxC88EbF9Z4erymglriCt8763OqCuBuhhkPO13MiNIckuo07F+je8SCH48Ao+4JXEaD6DVZ
 kJeQGj31/+N7VNy0s1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

On Tue, Oct 27, 2026 at 8:53=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> On Tue, Oct 27, 2026 at 10:41=E2=80=AFAM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware acces=
ses the
> > card directly during resume from Suspend-to-DRAM, before the kernel's o=
wn
> > resume path runs, in order to load boot code using hard wired logic tha=
t is not
> > field updatable. The card needs to stay powered and responsive for that=
 access
> > to succeed, and since it is never power-cycled, it also needs to be res=
et
> > before the kernel reuses it after resume.
> >
> > Changes in v10:
> >         - To help out with the implementation I offered my help to try =
to move
> >         this forward.
> >         - The DT patches are good to go so I included them from the pre=
vious
> >         versions.
> >         - Patch 3 to 6 are new, but based on the work done by Kamal Das=
u.
> >         - This is completely untested from my side, please help to test=
 it.
> >
> > Kind regards
> > Ulf Hansson
> >
> >
> > Kamal Dasu (2):
> >   dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
> >   dt-bindings: mmc: Add reset-card-at-resume property
> >
> > Ulf Hansson (4):
> >   mmc: core: Add option to keep an eMMC powered on at system suspend
> >   mmc: core: Split sdio_set_host_pm_flags()
> >   mmc: core: Move reset functions for eMMC
> >   mmc: core: Add support for resetting an eMMC at system resume
> >
> >  .../bindings/mmc/mmc-controller-common.yaml   | 10 +-
> >  drivers/mmc/core/core.c                       |  9 ++
> >  drivers/mmc/core/core.h                       |  1 +
> >  drivers/mmc/core/host.c                       | 10 ++
> >  drivers/mmc/core/mmc.c                        | 95 ++++++++++++-------
> >  drivers/mmc/core/sdio_io.c                    |  7 +-
> >  include/linux/mmc/host.h                      |  1 +
> >  7 files changed, 92 insertions(+), 41 deletions(-)
> >
> > --
> > 2.43.0
> >
>
> Hi Ulf,
>
> Test results for this series on a Broadcom STB board with the Kioxia
> 016G01 eMMC,
> which reproduces the problem during S3 suspend/resume with two DT variabl=
es:
>
>   keep-power-in-suspend  reset-card-at-resume  Result
>                             no                     no
>   enters suspend, board resets
>
>       at resume
>                             yes                    no
>   enters suspend, board resets
>
>        at resume
>                             no                     yes
>   suspend aborts, -EINVAL
>                             yes                    yes
>   s3 suspend/resume works
>
> Changes applied to Kernel: v7.3 + 7.4 merge window (linus/master
> d135ab453a74) with this
> series, plus the one-line fix I'm sending in reply to patch 6/6
> (details in my reply to that patch):
> mmc_resume() calls _mmc_hw_reset() without claiming the host, which
> triggers WARN_ON(!host->claimed) for every command sent during the
> reset. Claiming the host around the reset removes the warnings..
>
> The -EINVAL in the third row comes from mmc_host_class_prepare(), since
> MMC_PM_KEEP_POWER is not in pm_caps without keep-power-in-suspend.

Yes, that was actually intentional as we can't allow the system to
suspend in this configuration, as we may not wake up correctly, right?

Although, perhaps we should also log a warning earlier during the
probe of the host, when we are parsing the DT properties for it. To
upfront say something isn't correct.

>
> In the working case I also checked the md5sum of the first 5 MiB of
> /dev/mmcblk1 before and after suspend, and it is unchanged.
>
> With the fix applied:
> Tested-by: Kamal Dasu <kamal.dasu@broadcom.com>

Thanks and thanks for the fix on top!

>
> Regards
>
> Kamal

I will send a new version shortly to address the comments and needed fixes.

Kind regards
Uffe
