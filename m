Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858250EC17
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983955; cv=pass; b=Pk0iQYESMvKaZaLpOp/cWwNP0gbhhd66uZ1ImToXxrrr626H8PFk8xXfNqVMpmr0RJWRzpT2Boa6QE6/Mp3XMxa6+wurBq6fHa7hEfqCDqyZnok//NWg3/3DrAMKhf/xfq4uF//cQDUaVYcApDyw4NgrdGh401uKacEnTfqIabg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983955; c=relaxed/simple;
	bh=YpT2Qe/T2mt0iT4P8ZgElxgZygQNwPCoUxNvE7UC/eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bx5dOt+fyVfIWH6U7Uy5CUbKI4VloczvN3P35tt6mAwTShMkoWuucytJzXS2Gjoa1XtbJ0mg+ave3qqPMlkHEN1kVxjz8e1ZWtf+UqvYz+WDqnuLwuPcu0zDJgzoBsRjYCEbG+87FlT/ZtJUse9x/6SyXjuxUa/an+B3tdow4oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaokhI9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoiN7LAn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaokhI9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoiN7LAn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBXarN2686071
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=; b=RaokhI9lpwfZtctk
	tnFXGMM4pdXprSGnRtJD1ew/HugC+VIzM6H8hM0jzHZRwth5cykuIATE/54nIMdw
	hbzL5Aq0lg/zvV1UoDQWgzkWAu68bbdE/u88OfcGyQJlhaEM7YNDj2hxoUlRo5Jj
	C113myqrV2HSinCyZoOLTFmns3LIZCA3IjOpXKlzcBZfZ64/FaWUmDmONRDoyL5F
	QvgNyBNyrUtRmNQDApW/qZL5c/l78h/Iz0aeIQf/Q2eIYL7dgU/iqihNfjgFemkh
	hRN34Ef/+BbXlgyPaOlivZ7YxNqg3ASdYLPnwla5ottWMvBXETXyWR3G7gE6ADBV
	Unm2oQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1qv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso6738263b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791983951; cv=none;
        d=google.com; s=arc-20260327;
        b=RfqOYojE1xjFMBiRNkXupQTZQAFeytNY60erUqG1ELRmAlv1uv1Omja4lObzEywfsN
         X/zwUbjG5eY7vVgZmkZfJDAlcLJLT2L1imhMmJBe5s7OO1y22uOJJ5EO4aP75KlTyQq9
         Zu+uhGYO0pOv3VFwABI0IZ8K9mMgwHL0N9a7g7HiBMCR8DTcaXyOS2BYkdcoM5geViNI
         iWDXOV/NcbWsszOSGpEVkYFKeVMl47GNk6r0P/c1Dj0Ai1P2ZEZ0p3f7+c+rWpWCbNbH
         j0oKmsQ5b5+TRE5xtWcF9rJt5/qP7A8hqLch9tMps7KNpWLKjggh4D1EZkeVn+SXCA4N
         voGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        fh=z6QFte9ZD7hl2X61J5ZKpWcM2XMlbclP0jEVFNhByGU=;
        b=TC3ilnnlCF7fjif0y1aBbs3hFqNUNtdru8p8AWA93A1EmvG4UR0uim5PWzsLedCkVA
         NHvKW1jPKipzcufoS2mwmlmGtCPxs2J4M4zT8dNvc3VPkuf42wr7HDOhpAOnnfHJF3ZB
         qq5bjyqPJUYILvhucG1oGmao5+Vc9IszD/HaoipjYPpz7GB9VsfvL/CqlIlJ/gDQo2CH
         65r+cp0njRMmojM3WkdskWM+Fvc7y6fWPh6DCm1dxB5OBKRl14ldnq3CeHgHeev0xWAO
         xO/dUUxSbCfBuDbj+XCM9e+ceGxH6e3GAarEUY/n7Y25g9TkEF4ciGwSytIQm3xPVYOy
         qTdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983951; x=1792588751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        b=OoiN7LAnnjXiQdTqj+NsoDCFizO4djPAcbVdP7Nx28gM42XLXpve1MOPKK58kIYXQT
         pNbO2OyT3ImxuFhdY893dkQefTgFEoq6HecEte5AmDApDhvPcOP8bxXb6nwnXk7to2LH
         LNhw/pR8nCQ+c7rR0V0tqxcpSJmtoZ6VyeT+K2RWScCW7plq1VgzVMXI0qpCRS/GH0TQ
         sJSHMBDb/haKHchBS5ah+QBcW2bjxrdpInUsenTCmFEDICIH7Ot6DQBEbMcmivyvAU38
         xEY5+wgVFQLfM2e/c/Yq+5h+T0EJPu4IJWZqGuBB+k09M/6D4HTcCm921SJRCyMGEczt
         MLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983951; x=1792588751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbyY7L02Rxh26+8dxarTEhQrgLb4aPc0R4YmO2fQi8o=;
        b=Mhd5ZLaq0x8hZ+mnBUAsmjAi34srciqPExydRYtfoHixh+6em4VFfDZ9mrPJn3EihR
         I8R8KbX4JeZ2I9FN1TxJ/eyQrGItRGQmgxraZqcP1WTZRsujg/p578XXzRPBjKdvVxkA
         vaHU1NYlG7OvXROa+hQzooLqDmDWggNB3FLtnwnFM2ESkAyx74aMFPXhPTF8pE+5Nd6M
         fAVljsXfzBSsparpDSemc/9Rfftl6xI1IaLkhelatBqjXD5BjakVRkXGKVSuV5EyibLC
         li+EUl2XFxW/AsXieWRz5vn5FjJABLE5hbPhCEVppGccUOGzZlCxYs2pcyTVfGUYueAv
         cmjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9MlON/kXRPZ9hKTsx5JM8Tp/ZYcjmGwkYLSR+ufE3WWddKaD2AMOOI536fG42urqqwwU3ErzYQckyp5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVbrCy+uyyfNnX8uoMvtql7PS/A8lz7zBOQPisFX8KgKJZ5Av+
	uKVZBHCUtQMVf+hmWVYXdAC/WYDin3jHLBfj8L0OyyxOZbFMvOMDO7U8oW3MwoEdAoBAmsREvee
	5QOASMPCL0Byze0FEzhwwVUDuD+nxoLgs/P5Faopc51B4dQARrEZfZj96EzNOHMlr7Mz7uzuNT6
	9QV+a84RiQt3YamQtIOppRoA2BwmiF7yod7zH9gVIaMg==
X-Gm-Gg: AYBFou18jHSj6bxlreA2Os1cRuQKLzxRgxsmV/9Mci+mz3HTpBUIQDZP2Bu4HVClSgY
	A9neaqZSqLURoUgsDC/IwItRlALBlCECuNNWcCgOdkzR04qchkTGlbOmgqJAUz68GGH7HhARMVz
	CAEtCf26N2WuauMtnFuy9LrAFdOaVDolPaY4ZCBl7xogyT/P+m6QzHNSmpWU8rNpqhUkECAOeJX
	GXa2vcihsrf7UwSln1wZmC4Bx1hzbReX5RhUqbz7nOais+NJeRl2mI2OrUbF31jMsQ2FsaquMKk
X-Received: by 2002:a05:6808:3203:b0:50a:6fcf:d287 with SMTP id 5614622812f47-50c5804970cmr14735557b6e.37.1791983950989;
        Wed, 14 Oct 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6808:3203:b0:50a:6fcf:d287 with SMTP id
 5614622812f47-50c5804970cmr14735512b6e.37.1791983950378; Wed, 14 Oct 2026
 06:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
 <20261013-cci-imp-v2-1-6873326b44a3@oss.qualcomm.com> <d39189f9-e9fe-4019-9b64-c4d7c0694c4c@nxsw.ie>
In-Reply-To: <d39189f9-e9fe-4019-9b64-c4d7c0694c4c@nxsw.ie>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:18:58 +0200
X-Gm-Features: AclHuK_Mz1Imq5hkpEYTlM0BjO4RGLxYs653XPdMkpOfKA6siGSGzQJSVK3xg4Q
Message-ID: <CAFEp6-1pYGy-TdQCY0pK8Nir3fg1hun_0pfdmH+j45sHZd8vnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] i2c: qcom-cci: Factor out write command queue programming
To: "Bryan O'Donoghue" <bod.linux@nxsw.ie>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXx5S4rxY/ZEHq
 SHW+V+9syZhonH6yIoJBy7x5QSD4toObWMrXgb8MY05UvwoT1uq7U6Vf/CXP8Ie0QeeX+zkyRCw
 9pKadSwJ2UzEmdylBgLqa/vzu+XT9Wg=
X-Proofpoint-GUID: TZG-70lfqblGHaYNVxmAK-CiEcL80-i9
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf814f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=PJnx2EBGx5yzlk0kfSEA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXwOEOa6YLJNYL
 d7UVzYScT6nM21HU12kAL7ZRubQ6y3drBmstOSGC4y/PWCcXlSe1NBhPqtEfdVp59bUpZWzm1QA
 8I3LnU8LwV1AYkjhRxvmnOdp4vimPz6K3EX/Kvq0waKpd3guvVD3mE0+dExMuTmre3EqKbmNcew
 eyX8LLnos28n1ohRhDU16e0Jv08IuRR+hztm/nR2XH+91FJe6AUuRWvzGJc32Ro9PAkhQMZUwFx
 OTZk5qaLNwJCOW5AnKtuF4yQhwyHYyExpdahD/Ngq24ahadAZDYC7Hnk4droaCXueB5JUljsAhF
 Jzz9B6n/TCpAcVAEspcEfwXcyyjwuZ3HUkGPEc4XyFi4gLm4BXf8vgPna8ZFacuZYa0ZtSq8Caq
 wWOUCM8XMDleffTDo7vkBfqxNzVNwTvz4CsvuOL4SwsoGRST7rYbV4Mh7kzoJ4KjAUhBiYzbE9y
 OZPta9k0XnCLFMUNLfA==
X-Proofpoint-ORIG-GUID: TZG-70lfqblGHaYNVxmAK-CiEcL80-i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052

On Wed, Oct 14, 2026 at 2:53=E2=80=AFPM Bryan O'Donoghue <bod.linux@nxsw.ie=
> wrote:
>
> On 13/10/2026 11:30, Loic Poulain wrote:
> > Factor out write-command queueing into a dedicated helper and replace
> > the manual byte-to-word packing code with iowrite32_rep().
> >
> > The resulting code is easier to follow and will be reused by
> > upcoming burst-write support.
> >
> > Also add a sanity check on the write buffer length, which should
> > already be validated by the caller/I2C-core.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++++++++---------=
---------
> >   1 file changed, 22 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index d509dc1c14700d9c199d67df19082bae4f1ae470..3304760411082b72e10e529=
a2bd66361e100fa06 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -77,6 +77,9 @@
> >   #define CCI_I2C_WRITE               9
> >   #define CCI_I2C_READ                10
> >
> > +#define CCI_I2C_WRITE_WC     3
> > +#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
> > +
> >   #define CCI_I2C_REPORT_IRQ_EN       BIT(8)
> >
> >   enum {
> > @@ -485,42 +488,42 @@ static int cci_i2c_read(struct cci *cci, u16 mast=
er,
> >       return 0;
> >   }
> >
> > +static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> > +{
> > +     u32 cmd[CCI_I2C_WRITE_WC] =3D { };
> > +
> > +     if (WARN_ON(len >=3D CCI_I2C_WRITE_WC * sizeof(u32)))
> > +             return;
>
> Why not trap this and return the error - cci_i2c_write() has a result cod=
e.

Because this condition should never occur, the I2C core is expected to
enforce the transfer length limit through our max_write_len quirk
before the request reaches the driver. This check is purely paranoid
and is not expected to trigger even in normal error-handling paths.
Not returning errors keeps the behavior aligned with the previous
version, though we could have catched this issue earlier in i2c_write
and return from there...

>
> > +
> > +     cmd[0] =3D CCI_I2C_WRITE | len << 4;
> > +     memcpy((u8 *)cmd + 1, buf, len);
> > +     iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
> > +}
> > +
> >   static int cci_i2c_write(struct cci *cci, u16 master,
> >                        u16 addr, u8 *buf, u16 len)
> >   {
> > -     u8 queue =3D QUEUE_0;
> > -     u8 load[12] =3D { 0 };
> > -     int i =3D 0, j, ret;
> > +     void __iomem *loadq =3D cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(maste=
r, QUEUE_0);
> > +     int ret;
> >       u32 val;
> >
> >       /*
> >        * Call validate queue to make sure queue is empty before startin=
g.
> >        * This is to avoid overflow / underflow of queue.
> >        */
> > -     ret =3D cci_validate_queue(cci, master, queue);
> > +     ret =3D cci_validate_queue(cci, master, QUEUE_0);
> >       if (ret < 0)
> >               return ret;
> >
> >       val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > -     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +     writel(val, loadq);
> >
> > -     load[i++] =3D CCI_I2C_WRITE | len << 4;
> > -
> > -     for (j =3D 0; j < len; j++)
> > -             load[i++] =3D buf[j];
> > -
> > -     for (j =3D 0; j < i; j +=3D 4) {
> > -             val =3D load[j];
> > -             val |=3D load[j + 1] << 8;
> > -             val |=3D load[j + 2] << 16;
> > -             val |=3D load[j + 3] << 24;
> > -             writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, q=
ueue));
> > -     }
> > +     cci_i2c_load_write(buf, len, loadq);
> >
> >       val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> > -     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +     writel(val, loadq);
> >
> > -     return cci_run_queue(cci, master, queue);
> > +     return cci_run_queue(cci, master, QUEUE_0);
> >   }
> >
> >   static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], =
int num)
> >
> > --
> > 2.34.1
>
>
