Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4612488748
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141253; cv=pass; b=sTCqtKo3ysRgfqmmFDhtgnO1lPPt5JPElEgAJNrnv0qhEfRP8ziGWRYrIGZbmrW79Q6N4bCpHFRjwC4J6dMufjWJLmE1q4SfpH0QNs1+YvKEGN611HTAurQmp+0yiM0NMiKnuH/qdbmTB6/mVfxOXqwuai3dHQ0ejMAlxOMghaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141253; c=relaxed/simple;
	bh=kQXQO0oghS8R0ta0G4UMFCbDP7svrBfBTLWTZIZ07no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdT7KA1uw8TxSi13AUibFh28Cd8YjZgxsE2T/Ki0DC6ig7zp6MuH1r5VNuTpaeyJNM3GIPcFQHf1IP0IAw+dpKGcTqFlBM0+xc8hTicYMMYMPaiWw5HqDBxkwXDD7PwUu+s0wxPhhAdftPJNeCs8K6SBEUacfexn7AhUEHPlHEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3TZVEPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcSmPD6B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3TZVEPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcSmPD6B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm029269284
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=I3TZVEPXZXd1Os5M
	NrODBZZh7T1xCUBzKFyUjkEAOKX+RRhB0xUdUtqnXOD7wpDfJgVcM0P8ZAzbzvJL
	17AjNsRXhsgYC5/xF3Hz+eo0TceSARvcGYLMIQwqFJRdfdKtgutrri/KzKcvQE7q
	28Rok/kNb+0XzN8xl2dgjNWrDHiJ/ENoqsceZe9haNYmE2I/eUyUlVT2J1t8q6QD
	SLrrbQEDq93v0gaYF4B2SeI1gp521usXrUP7WHGlDJXSRZNOLmz1u4BX4hHyEwrx
	XGTXtD2+scqMlbuWYo/tagR/1XZRpd1B6QX0sGpdvpj23BhXJClvEu8QAj32QnDw
	vQqPkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52j6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so16747665ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141251; cv=none;
        d=google.com; s=arc-20260327;
        b=NzRgVdon7HhWQd9j7+iSzb7Z70jsWW5kC8t86EoCaUfT+LVien/OwhEBmp0RMDUaXn
         rkUgYhBQZYjslIBHnuG8m6qlASI0bNl7sJYjIpWi+O9lqf4wOeDrb2SSTZjUPw3lyTee
         Msvud9ZPXKaJptIepBmku3/rocq1SE5qubz73PKMBtFwVMfiW7ncr50hOAF1c9+rqvhL
         iANO7eDisMwZG/EiLxvLn2XhkaRAWP0Z8c9GbD/2eF3UfsMr6zzZhPgNb17iZgE7Qt2s
         NJMEKb+fFeQMleFKs1VHl43PImFlq1cpuz/SVc6ETJG0DD9u8ffoKMBjvybm/tjfUX4V
         ArLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        fh=wVFRYIoDR2Qj9+eOLqRhtBL31+ZawaYTGzYuOEjOlWE=;
        b=e6CJLJk8u0v74WmRA8eHOX4/3tNIecCktKSkyqwc/CxDwCmTc6liayEtusi00b2uxj
         Da9msA1A76Mx4oC4K49FS9CTQeBb8HsvP56XURZVbCMz0+69UC1bMia8AtX+IBrhceo1
         QHlLktO/4bDt4t5vBZBlipT6A7A6Oog5LySyq0JJLyUOasrsqzRnX1lOupuGVVRuoMLm
         jvay3OlMnAkMpz2om8ayGO3BCW20dp0ifz5Pw12GSPtHDM6Szm/r9oj7e26gWy9DZSNu
         pbbYSXTWIghUOjwLD15FPWhQYgrCZBnKsPPhD2lgkYKskXw7pSrTyDwFo3sBKm5XPkG6
         M+rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141251; x=1789746051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=jcSmPD6BJrgrQpEw25b8ii4yKSEoFPR95DEDmVVNDlFZ1O7nUcsidogBmjd2HOPvX4
         8ZCUvXccHxdLuRGGz9rL5yTTeO/St0F0fnVUQj2KxS66zQ9rHeInBBwIEbUYf6Fa69U9
         ekG2Y4rRZISnkAhjSRpbsaVyUQENSfvS3Xlj+Bb7SzLIf/y8P/RxhTaFCp4BuUVhUbYx
         n94Z7Qpu/K8vQvbJZXJC6e0hFcjiHP7UDVcfKESGdWut/S4JVfkOjiA9b3XAqwRcug8y
         Iu7vPoTwVk7bJlX7akUB4gginUre0YJEQLH0oUvdW2+hqhu01wBpT+GD+ZFeD5fREIyR
         HQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141251; x=1789746051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=BcwufX17IdNY6f2xZLyc4Mjxf7CXVZ4riQAS003js+tksTz9udD/jomTI6mHuN7ZDt
         1HlNWCkB73MtkJEUwJIFcC5lzgeaqEC2JQU9hBuK+WSa/Sq/zy30XN++R2278WZnUWMX
         0Sm3bxLqGZT8SFyn9w2JDXYBybaZiRd2u1x/QaBxeM7uGhFjw+psw7vHW2ZUcRq9gJVM
         eT8fRt2fFmBOifaU187nAFgFo0K8NOJJ7d5nAMT1t4qImiyI5eOtoMo4H+xnmE5XBg9d
         P3cYuEeuOfg1CiNMKG//lOyvkY9V0R+xKQIgoFuX8bPgrMCJmVIqGE0rQ/PjCnHs7dxW
         OtBw==
X-Forwarded-Encrypted: i=1; AKwUvBxZsA5QHNH8KAeHbdct7rDgYTZ96TwH/vCclKMKv/x0yoxTwejLHGG7ny4b6nOWrWdyVjbg9MAXrc9uy74=@vger.kernel.org
X-Gm-Message-State: AFuF++l/40Z8RexD4ZreDkCttNezNpaT1bN9mWqxr37QQvu7vjEnBafi
	7DVMXJoqhAAQgK7QWSp/cZ6H2Rz/cfkv/p3P/ZwHZWSyW2Jew63JhIbuSEfCyCQayPVlGKobl9c
	6PgyliqmVlk9WcEB1oCc1twsIN/ZP3g+cIsFvQ6JFcMxS7+IKD13ykeQaOiMApLaj+lthRFQImJ
	wWRZuJORzhVklZWTX7wlGKQ2iPrFyE1IzyqH9tz5ThoQ==
X-Gm-Gg: AYBFou3G+bZ/1Bi90hwztwPlW2SZ5YO73C9vZb7zCjl4PolSIYOkyUZz4ZTJGoDPj35
	DaziF+96LIJ18q1zsxtub5Zvugmx7FGJoTUnIcoVndD3dXs/frLeSDp8Ols6734VwVSAhMuofqx
	KhuYuikiODCMO0/Nczcq5crhMmVNcob4TD79A+T5qn/+PimH5jRp49KY/4eQ==
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd2a45aef6mr95929865ad.21.1789141251144;
        Fri, 11 Sep 2026 08:40:51 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd2a45aef6mr95924275ad.21.1789141245940; Fri, 11 Sep 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com>
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:34 +0200
X-Gm-Features: AcwNN1XJiqHpLAh6BkLXLC9WoOCg1aSLupw2Vf07ULv13DKT3f9hOH1d-RT7-pQ
Message-ID: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xps20p18ENwXcXf2nXIdzOyalI-t00w3
X-Proofpoint-ORIG-GUID: xps20p18ENwXcXf2nXIdzOyalI-t00w3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1DMI7D3d5wfy
 WGA3RlQpp9MJlzjyRDKrVL9GbjyROSjLAaNFgTdIGZbEAV3zRWaPDi9PBjAFZ4CTTb+oAmg4L/X
 Wy4uhkD+uU25LQD+mp0X8sAap3Et/F8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5VLh/FxzRFjD
 WCFEu0jlj3ojkWWMP1WvWzr+lVou7A+ajt2LPRmnQmkclJFFUWDKO1sYzstSXehH09TduoJNvpJ
 ajxOBugYR+WbEtuBsghSqaLyGpjt4LezEQGQKz1vq2uNJxdMN89eICV5mCsXFnB1Y2utQRZ/G4L
 z4GQ9RAWZxZb0+NJig4rqBS0x1wtPUBlleBHi8RmCURAa7fEy0pPVjDLY+ByzuvlfLRmzLvf0St
 IXeokLIPwiP81xh2XUyBVEysW361sRMXTU+emPiKWeiDwKstKnFVxR4NrkjKyrUhfXtJmH4CzlX
 3UUDEegP3tX4tlb2i5nn9Vb8IHxgwgIuFY1kPq4Wx/y5eSBgBsmOUkk/vKkTjTkcXPuSmyofgUg
 x3I6V7JGh/Aoj/7S1z2KCfN7VeNQ0oqIFAa1X9P1bHAvqgeTJnV7qTxY6qqfgvVBFOsTGJZPkFk
 Dm9Y7zUFbzwYcU92OjA==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa42103 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NufY4J3AAAAA:8 a=yCDuxKIkwSfSSdlP9cUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

On Sat, Sep 5, 2026 at 5:32=E2=80=AFPM Lucas Tanure <tanure@linux.com> wrot=
e:
>
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
>
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
>
> The series crosses three trees; patch 4 (clk) must only land after
> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>
> Changes since v1 [3]:
>  - Dropped the Fixes: tag; this series is an improvement and should not
>    be picked up by stable (Jerome Brunet)
>  - Moved the patch 4 dependency note below the --- so it is not kept
>    for posterity (Jerome Brunet)
>  - Dropped the e-mail address from the Assisted-by trailer, see
>    Documentation/process/coding-assistants.rst (Jerome Brunet)
>  - Fixed the space-indented error path added to meson_mmc_probe() in
>    patch 2, it did not pass checkpatch
>  - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>    capability flag, not an SD_EMMC_CLOCK register field
>
> Thanks,
> Lucas
>
> Lucas Tanure (4):
>   dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>   mmc: meson-gx: enable the bus pipeline clock on T7
>   arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>   clk: meson: t7: don't mark sys_ampipe_nand as critical
>
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>  drivers/clk/meson/t7-peripherals.c            | 10 +++----
>  drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>  4 files changed, 62 insertions(+), 12 deletions(-)
>
> --
> 2.55.0
>

Patch 1 and patch2 applied for next, thanks!

Kind regards
Uffe
