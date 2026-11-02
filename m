Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651809;
	b=o2+HfZ/F9GSTiVSBCKxeb+At8DuR1k/4Ac10iWAU+Mo/6df6R9lq/TvIS2uUtRJBOwql
	 TtWXgHTNUG56kBgsPcBHutuwxD3KFqED3H6Rp6rtaeFQAbVVi75zmyhI7fFrnKWwJjalg
	 PH3KN7EoCLjN+Dp/jj2mCRmw01/cqjFBl02AoJk0KQiinzzEicHwmvNM3dXVlR8LucXf2
	 J3yPgjhIbzliclt9gsBThj+ffhLsXAh8Olgu1jcqsTyp/JroC6+xLYarJts0BEQdIOJxC
	 81azDr2RCIz06QGpgQb8IrEScza51EGL1nIxeJr2NFrLFDohrJDsB39AqmmaMuEFRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=;
	b=hhGZtwzO+rR4H4CGfnkaFeTfcj1p02hkdrr/Zw9YADV5AOEOTBNhFMU1t7s/xCdFwHEo
	 AMdVFsI+2OABWuW5AVzW+0siL2hWD9YF5hGkZufyE0jkSTeQAsJBeQiNtwI/+AtipOj5P
	 8RYY6r+oalRiIh4pzpa90YZDb2HCqcz5V+Wfo9qSg3Z9vjDieV92N/4Tk+xf7a5J9MYj9
	 aRaMJCG8kDaLyAzfuJoQsoVc/b2Y6CMrly8f4nfRSYHAziAnAJ4WMpnlU0VauiGLROOnh
	 D+LB/6PKl1CkU651onGf8aYoh+XXp4bJvzQplpoUQWXxoezomwrDrzFwaJ5lYgQplbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPWzfHtf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSt36b2D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E99A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPWzfHtf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSt36b2D
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K60J83955604
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 20:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=; b=RPWzfHtfJENBbipS
	LKoDxoWUi403tokUQ+xVyD3QL/EsGwcNzV9+ooEbJOzm1xDPrXrqXWFyO3y/ScQt
	M+mpoMePex/U6ctvHQpTymggJ37WQ3kDk2jOJBgHNMgQbvGcmuvPvfTcadxq6On5
	DpsDkUwdXMzx7VhUjt/G+u68pO+9bT5r9/dmiBdEx+MJDSPAup3QluduNNcJ0AIX
	7oWZPwftQBQnRzKDsuR1md4j9cGmWz/eXrnEMOXYLF/pD5/DhXGij/zr8TWKUIo9
	4LWDrHW/lduu0mR27HxLL/3fnQ4xxEWzr8fTjGW7ZG/sPHBLzgLPqZel/qslFpVu
	KfCTeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rcue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:36:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so5830330eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793651807; x=1794256607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=;
        b=XSt36b2DdiKxmCvAERLbbWyXX3pj6uV1+SUuc/kUH51UyDAFXUYMgNNRyymhkY2VwR
         2MP+rSnDL8sK4/Jal3hLSOP6SZYWbQ75Az6NG5ZKzsMdxzxWsrfm8ek8rQYhHbYXnW85
         SQaaAdCO2YD06ZUT0NSTyYp7kajMJO2J4Q0fZdAGsI04WBFHR1nZVC1RyZuZy3yBcEB/
         2AkBXYozqFz4U5NU0ALBIbWeDD4Obu5Xl+KQ3skNVuVBM9phAwpBBIaAMboSpWMSMIbk
         tRqZ5YEfShv9geYb3ErQUmCX8GYb7ApUnb2QLYtxcSpLXfsJ4gI8rOZI42grrYCwcVOq
         KZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651807; x=1794256607;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=;
        b=uMCRz4u7c5LSDIe+K5jww3sd15+CXrmFhLf+Fr/0DQETu2T6axL3Ya9eU6Q6E8RMgq
         m4+wiRdUDg8ZFzUoRpE+deb5IWm6OncgioqjRQqIFhhukczQl4fVjbaTBuVz8UUjYwqZ
         MWhsutrq0UnJFdWnWhWQLZJV29r3PfI0pF8FftI2iFpqhfg4g5rMzbFwNWYd7lmB4rVZ
         iK8RP8rfFryH745ebshg6rtDcBO9dwmJiKb5NXSKV//0QgglQpXpy3xgUpqHJ1c96yih
         ePmQ3zXJfAt1q1RgOllozEfd8KfIduIVuSp6n2Tl0KloCKXF4LLnm0Ckesb51stEhsUe
         Gkfw==
X-Forwarded-Encrypted: i=1; AKwUvBwyd6rB05sm/UyyoICV2Q+i0dsyt4urFMXN5eYTTl6Ev5ETO3qCeu/sfSDTohvSKckTHzcg/Lxd857npvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwQmvQLFPfXag4+AplKYHq8teLkZlS2OFP6SCcTAK9zLMBh+Ni
	7sPbo+Q6N1ajZ+Hk4aaRD6OCa1DYENVGyfm+gITGGocoR4vG8P7SUQRQ5ASczNdJJ0gtbtkHvrK
	yvey+4L6T/WXGE7Q6EeVe38JZoBcZWHP211xyew+qA0gHGhPrxV+Ny5weVTCTkui7lcY=
X-Gm-Gg: AYBFou265A4JVN0eBgjt8JwUd4YzP7IEc4Lwb0wG9aWSwuIKNQXZl47uJRCfKASE69O
	P1I7OnKdle5HCmGX9HaD1ByByAC3aazWXMrEUUFmGvrsz8zz+mxhyKMPDkRvWhPrFsLuMNbAM2A
	PgPiwqH2G+zUwQVwqw032ImXfBobmwNM6e2etKkQh7AwPQz5yzlzOoqOBo2W2YDOWCwolYqLJcF
	bsMIRkMxokmjqV7r+BM4FzeziP5HaIghdSkJ2k9IwL7YDFH0SvyTlB7w7Qa1voFgSGbGvpJR+ch
	f1c1bQz9EAkC0mqQ0/+EBx8B+kW+R9hK8W8UsphWArhIEHwwHp8oJHGeFOmJxETcOcJkDfceg7U
	h2bp/+f/2Xb87ELhJOBm/2565eLF/kA9taQNl4pJDNBW78B4USxLOEgDYLfPrLfGEqBlYHFhUGX
	nSb+uuwuaaamWeo8Pg59Tcc/IF1g==
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr15772340c88.3.1793651806377;
        Mon, 02 Nov 2026 12:36:46 -0800 (PST)
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr15772281c88.3.1793651805604;
        Mon, 02 Nov 2026 12:36:45 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm61679802c88.10.2026.11.02.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:36:45 -0800 (PST)
Date: Mon, 2 Nov 2026 12:36:42 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261102123642.000044cf@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfXyEU5dpVX1+IU
 eKCWmb7s23Si7awIIa4esOo9TdACfU8hs/FnpA1XZFTn6FZYrsgp8l6RIT3PAGl/wtu6z7ZcXr6
 ZW5oJmq22yeO7eXtduI2G7++1wk5QWc=
X-Proofpoint-ORIG-GUID: Dp33-YNxRtnK3xUBGDejjNHsFgDFSTKt
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae8f45f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mpaa-ttXAAAA:8 a=m260jWFFa7gU3xnM47oA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Dp33-YNxRtnK3xUBGDejjNHsFgDFSTKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX6gkziC4S8uwV
 J6RiwUBASp9ZFyTxm8zi/W5OW/40hV0fIJ8/Zzc6X60w3YRwkP7hwF/CJbALLN4e38Tj0sHfDas
 XAs8E3e7TE/IZnyJG9kfVSmWKwQtiN66kcrVW3vQuI51VE3S3NbLd+SrlMCDi52+Q9HdyMROGbx
 GCst0KnhVmAgNZI9ieqhyQJ/eRTJUqOevssodsgxRyi23RkFqWDjIAlDTadTczs2nlewD67qMYb
 KDY6AePGY2A6atsKtNVX8ytPQG0gTnJ1ATDK8zlt8DRNMyhFiEdpUoReY5Y52bozBnEAID4MfWa
 sBsYLfn2ywZ+utcy01ifSRw6iwFsQFjUoHR8si46YUSHZCKM2sPwIOdqG06Jgr08R4Bu6Fl4/Br
 3ca8nyg5cEcc8ejGANLBCCPfLS0P7HDQ/64hapsafS7tydXNLximfmYN2tmAcqNm6CHSaGpNg8F
 +/vXwuebc+Di525uqtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020082

On Mon, 2 Nov 2026 17:23:22 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
>=20
> On the MediaTek mt8992 SoC the DRAM controller (DRAMC) raises an interrup=
t for
> every corrected (CE) and uncorrectable (UCE) ECC error. The interrupt is
> owned by the secure firmware (Arm Trusted Firmware at EL3). It reads the
> DRAMC error registers, applies the error containment policy and the CE
> storm protection, and hands the error to the OS firmware-first as an ACPI
> GHES record in a buffer that UEFI describes in the HEST. The OS is
> notified with an edge interrupt that the DSDT delivers through a Generic
> Event Device and a Hardware Error Device (GSIV notification).

So far this all sounds standard for asynchronous error reporting.
I'm assuming you have a something else for synchronous consumption.
=46rom a Linux side of things we just care that error record shows up
and is signaled via GSIV (with normal Generic Event Device and Hardware
Error Device in the DSDT I guess)

>=20
> The record carries a standard Platform Memory Error section and a
> MediaTek vendor section with the raw DRAMC error registers.

I'd like some details here on what those raw registers are bringing
to the OS wrt to handling these errors.=20

What extra info?  I see you have a subchannel in there, but Memory
Error Section 2 brings that.  So why isn't this being reported
as a standard CPER?

> This series
> adds the driver that consumes the vendor section through the existing
> ghes_register_vendor_record_notifier() interface. No change to the GHES
> core or to arm64 code is needed.

Given a lot here doesn't sound mediatek specific it feels like it
shouldn't necessarily be in the vendor defined path.  More discussion
of why you have gone that way would be help.

>=20
> The driver
>  - decodes the most severe error of a record and keeps counters, also
>    across boots in EFI variables,

Interesting.  How does this compare with just making it a userspace problem?
Perhaps you can't do that for some reason but it would take a lot to
convince me that it makes sense to have an upstream solution that relies
on custom EFI variable path.

>  - isolates pages with memory_failure(): immediately for a recoverable
>    UCE on memory that Linux manages, and for a page whose corrected
>    error count reaches a threshold (leaky bucket); memory owned by a
>    device is only reported to its owner,

This sounds standard, so I'm missing why you need a vendor driver for it.
Please provides some more info.

>  - lets in-kernel clients and user space (generic netlink, tracepoints)
>    follow the events,

Why your own netlink for this?  These are memory errors so I'd expect
existing paths to be sufficient, or perhaps there to be a need to
extend those as Pierre is doing with the Memory Error Section 2 series.

>  - exposes the containment policy, the storm protection and per range
>    severity overrides in sysfs and pushes them to the secure firmware
>    through a vendor SMC call,

The pushing of policy down to firmware is possibly something that needs
a custom driver.  I need to think a bit more on that and check a few things.
Input from Borislav or Tony might help here.

>  - after a fatal UCE (GHES panic and reset), finds the error in the BERT
>    of the next boot and reports it through the mc_event tracepoint.

If this were using the standard records that should just work. What
is missing that you need?

>=20
> The driver depends on firmware that is not part of this series: the
> secure firmware provides the SMC interface used by patch 2 and writes the
> vendor section decoded by patch 4. The firmware side (the TF-A and
> edk2-platforms changes for the mt8992 SoC, plus the preloader that keeps
> the error across the reset) is being developed in the vendor's BSP trees
> and is not published yet.
>=20
> Open question for this RFC: is drivers/soc/mediatek the right place for a
> driver that is built on GHES vendor records and a vendor SMC interface, or
> would the maintainers prefer another location?

You already got a reply on that. Almost nothing should ever go in drivers/s=
oc
and definitely not something RAS related. +CC linux-edac, Borislav and Tony.

Anyhow, always interesting to discuss expanding what we do for
memory error handling, so I'll be interested to see what other feedback
this series gets.

Thanks,

Jonathan

>=20
> Testing: each patch builds with the arm64 defconfig plus
> CONFIG_MTK_DRAM_ECC=3Dm on linux-next 20261030 (W=3D1, no warnings).
> The series has been tested pre-silicon on a Palladium emulation platform.
>=20
> Santino Wang (11):
>   soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
>   soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
>   soc: mediatek: dram-ecc: add tracepoints
>   soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
>   soc: mediatek: dram-ecc: add error counters and the address lists
>   soc: mediatek: dram-ecc: keep error counters across boots
>   soc: mediatek: dram-ecc: add containment policy and storm protection
>   soc: mediatek: dram-ecc: add the corrected error leaky bucket
>   soc: mediatek: dram-ecc: add a generic netlink event interface
>   soc: mediatek: dram-ecc: report an uncorrectable error of the previous
>     boot
>   Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC
>     driver
>=20
>  .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 +++++++++
>  MAINTAINERS                                   |  10 +
>  drivers/soc/mediatek/Kconfig                  |   2 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/dram-ecc/Kconfig         |  19 +
>  drivers/soc/mediatek/dram-ecc/Makefile        |   3 +
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |  20 +
>  .../soc/mediatek/dram-ecc/core/addresses.c    |  88 ++++
>  .../soc/mediatek/dram-ecc/core/addresses.h    |  13 +
>  .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 +++++++++++
>  .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
>  drivers/soc/mediatek/dram-ecc/core/counters.c | 336 ++++++++++++++++
>  drivers/soc/mediatek/dram-ecc/core/counters.h |  29 ++
>  .../mediatek/dram-ecc/core/ghes_notifier.c    | 377 ++++++++++++++++++
>  .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 +
>  drivers/soc/mediatek/dram-ecc/core/main.c     | 113 ++++++
>  .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |  27 ++
>  .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
>  drivers/soc/mediatek/dram-ecc/core/netlink.c  |  83 ++++
>  drivers/soc/mediatek/dram-ecc/core/netlink.h  |  14 +
>  .../dram-ecc/core/policy/address_range.c      | 120 ++++++
>  .../dram-ecc/core/policy/containment.c        | 107 +++++
>  .../dram-ecc/core/policy/leaky_bucket.c       | 277 +++++++++++++
>  .../mediatek/dram-ecc/core/policy/policy.c    |  57 +++
>  .../mediatek/dram-ecc/core/policy/policy.h    |  23 ++
>  .../dram-ecc/core/policy/storm_protection.c   | 137 +++++++
>  drivers/soc/mediatek/dram-ecc/core/smc.c      | 137 +++++++
>  drivers/soc/mediatek/dram-ecc/core/smc.h      |  55 +++
>  drivers/soc/mediatek/dram-ecc/core/trace.c    |   6 +
>  drivers/soc/mediatek/dram-ecc/core/trace.h    | 119 ++++++
>  include/uapi/linux/mtk_dram_ecc_netlink.h     |  44 ++
>  31 files changed, 2720 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event=
.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_ran=
ge.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment=
.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucke=
t.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_prote=
ction.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h
>  create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h
>=20

