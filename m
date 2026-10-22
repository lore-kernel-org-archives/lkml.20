Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792674538;
	b=j09E3vso6xVcRdSnIgImK3jbZSFXOgfOJmy5Sa+N4XX7jTewgRhhOcZPIgiXnCfMJ9nd
	 Aud69nAs5cwXrmYwTYQPfy91H6K0qW18JuTz1cHEso5mYS4MytcdGHuuQ6fIsoewmegLT
	 STrvuq7akP8WXGXodQjsgMNCqzFJxW4x9md5MxyXuPP6r++UVsufp3dadQa5BtH03KVH/
	 PRpE/aU9IFk6QLsvieAPXmCDpSSCw+9hCWi/X5v/tHRyZGY1xRFx/hL6JolReQnGRDL9t
	 G0iN0NTO+rZie2rpih+gJttjMUfaB2E68VW6dOQSNEFSkyUxLi6JgLbopPuOi7S7FaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
	b=FBtXQgQVMuUa/3xVl5uGq3UENzaGLZdTpHHzJspEyJvyMQhwVlCAMDqEPZxHmXiDPL9b
	 BZkwNGDxefj/K2vh9/H2W0zlwYLzCuv33ERuhqZkowsKfr8uGSmrqLCR/qFGbuxhlF3v6
	 ttjFJdD/5hi8aHVMKtHD8dIJMF+08utIVhxFYfx/B0TLuiSbv48c/mcwcbwSAmQxN92kg
	 DpdF3tRg2zgjYqXRpU9h4Ej00zhsvpkEUsLaIlJ5L8R/V3aspNV/0NjgF8+oPedxaGYpt
	 zkwx+Z0+nhrugFez3USNEKDciw3mr1dWzvpChUb9hk9dBXuVrgymKsMWR7tLKoNa6fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08264606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08264606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xqX83478844
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=; b=fFUlxMUBQYcJI4dq
	HRjiZRyz+yWr2OWqoFsvQUGKPGs3TrfXtCj9F7nxrzhnHUJhNk00bA7ym+NGXlL5
	xbj26S8xDr3P7oYt/Klf0INzmZ1i5iFvoBOztup/m9Tq3zVEWYZ8Nc/7H7IyQKXx
	0ucCe/lvbD4CGrzQ7kF0c0rUgz0U4nUBE34r8hJMPgoVF/J8nnPQ4O2w3EGqt5NF
	N3YXxYOVhuFKuNRFgNwIBvZwMe/SVZSa76fWzLxXTizOl36SkvY5021Ai2arSRlr
	saakT0vvW6USlsMLajZnqqL21TAvK18Qh5inPb7eOUsYUEeL6Cw5BzbkkgIef4Dj
	+Upw4A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a3knx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2443896b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792674536; cv=none;
        d=google.com; s=arc-20260327;
        b=MfF9aEP0l1JI3xOFj3ULIUI5rdk0Jj0gXKLQJwfq27H8qkBXyPICrRLxr+bjKfGrfG
         mGCeZJOc+L3NFdXB3Qaf/PwZA23jgF4Pw3Ium2o8dV/p8GmGjGwfTTvR7CZghiH9Veea
         x+FRRHqOT+S2Qu/DNhcspEVV9dzugI7oAABOUXBphhhERPwIH0A+fTnfofu9ky3PEA+M
         qxc022WXp0WfZZ7NMnMVio8G/kHDqejcZLoNvFxjty2h9oaBXvNrXwqQpJBpmg0qErwk
         eF0SzbDvtyaYz86UetUvrRLkBckOz+luNMnQlPdrDi9m1cLG47wjcxUCdzYfKXDRnbuL
         mdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        fh=4oYUy1s2l72Jlrb0p53vZqPqWlZIyfuwPtK4MmvjKdM=;
        b=jViLFyn8hCue8ioqB/esy6PU2Wqr1wurcqfgokYQBUdjM0ERvPbm9HgHKaUUa2F+1A
         wS4Mx6Rs8Z0yFh3l6C09OJXlQ7cxK/3WUPWyyEjm69hl3FfmYteP4mJXjJ1Lnr1mOXkK
         IbPtnpXEDHCPnFlfh5DhWx1Vqq920nF1vx4q/CqdF83i1OT1+bADps/DUghIgoY6FtNr
         tlkD0+CQG1oqUKhLBOaLQUBfubxSjVMpwhkv545VI+qMvLBOaKGnETCpouoJx3WJwtxH
         14/0zYZGMbkc1pdyQJViS6LM99+XeMnMNu1tcw2YUCL+vTJAa0fGacFv1TCr0WTE5vzy
         FpNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674536; x=1793279336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=dv3Mmo2vK5i/Cp1ZEEkeVIgMJgtWkg+miQhO8dalYRJ+TR5qGIuH/WQAplf1CFxrrI
         W7MWcY6FA0x3tVXVsOmcG1dr7Cn8nb/FV+e4SLQ6+DmW/Fk8nVqqlNwbjHcV/K12w0QB
         N8TbFkBFf2k5Nppr4JCBgUjqHIL8HWXbqoPYKSWX3+s64NjBrTfHEY4amcLMsLEFf4xi
         tn2BPggHQi6GS2NT/4viilSj6OI1hmu4zRlYU0s/Z/kJ0pRMWhQ3nYpG8Rq3R0Yue8/N
         kx433BhSfsPhI6lheqp4nBp2dg5dAWIRFPQndYZIb//OWMKJor7nshmMtooIM9bfBAY0
         tB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674536; x=1793279336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=nXRa4ZPX3AtC3z9ReRNMgHU8E+nA126Sq/+0NqVzuVYO1x1t7ARFC+cl7qqkocFSV8
         dyoN3syimDNeUWqP/HAFLiAy0v03HKZKnL8eGcX6cc8LbQDAhHGmCyRWIk5BNbPv9xCU
         FTxZk33Dco5ZCOIQ6Pc6tW6X1MpAyMPGZU7IzgTinpq8g/BSUAqqsMUwGIgM9Yy3xWwO
         RGj/Wa0k1ljFii5BtfrLFMaiSPU2NIRZuF2LvOKTPQlvga2GJ4dxj4Fa7nLyL88wZwaw
         LNH7F3aZfjMGHJurPZn7pbxgOGqJUbooAT7lEvIISeO46F07sV16RegXIiKwPMxA4wMG
         1Q2A==
X-Forwarded-Encrypted: i=1; AKwUvBzxi8aJJ7RFK7CjO834s/gViKB6sn/F3HmGU8Ss2IFKwOkncZASxXe38oLrmejnQEx844QztaNmGIFVEpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbhGHhP113OuK2PyHME3RT5G2FBoOFPgUzPqM1JPq0eZ+F+jB1
	janZCRVnT0MFMHLmzH897vGm7i/SWVZfzwswp1MQ3Bda6QeuHI3TPmtMgsOOAf/R5om2icf2WZy
	iY62tTcxdMMa9wtShCUR7AldV99WnKbS0el9yzMQOWUTZygaCccLcqxhH96pDgoFI0K5YLpaoRK
	tngDn5yYsxbXMHj4L5JaUESBVHKGuSuu+67LQbZYOtdA==
X-Gm-Gg: AYBFou0XkR633gdnADMu1PPZTYhKm4KRvwCW7bIfaCdEhZbC9VxZ6jFuE4XYJ9CLIr0
	P5FzQZEt3XpKCCqEg5rfaHMxfT4VwtZrmavSp0eq62rY+3cK3u03uSf0KexKSPXRyUAMV3PBGSa
	lE6GKhfxTSpJaMjenx9mQKfMW4M6KOfENTeK5d4wRjxWh5VM2ojdt2zm+mce9UQhk1Xmqfbs2+T
	yCvrymhZvKieRWIHkETrV15gAXevswZvdNfUTf3jXF5aKD1rSc392ZxXrd0y99k2ez+k6i3iBc=
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5535818c38fmr3719779b6e.36.1792674536276;
        Thu, 22 Oct 2026 06:08:56 -0700 (PDT)
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-5535818c38fmr3719745b6e.36.1792674535696; Thu, 22 Oct 2026
 06:08:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com> <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com> <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
In-Reply-To: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:08:44 +0200
X-Gm-Features: AclHuK97HFIdPEr61N5bt2T_LHXrNyu9E7auEMGCcuKFJXvXq_yVtWyXBQ__JQ4
Message-ID: <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfXzitmJl+v6ZO2
 JImt0cOrSPT2DmKW/sPsaN9in2fwb8E4GGJfGtk6RXrNNGigNqVhZ5W5ej9qPNNX42PJzm9t4rR
 cK/A2dY4Vef+jkyZQ5LW8jizaxknlPNaHDDVGs+oqO/Yg82Sy6MOQr2dWfJbKIPdwP6OJvpBXQd
 jEmGhHUOoN+1tXfHERF7QvNyFdasd26Wo4bzsLdBUbnfaJ926QBc+HNI5nMNJ98e+ntn4yUnNk/
 sz7TRlOrYazuN8cKXSdRsRyyHxjasLarwZhmnl4uM1M+QFh/2YR9TjB39dQHyRNiw3xz1WANkkC
 EAaEfnayeCsLmnwpISwBSGurwMpDnJkjTX3AHD+JLXgi3xXKSXbwfAuMBQndG+5ixngOCFIR9S/
 2PhUQ9PpUvvZ9L6JSSO9z+vLPa1zb82vIsPQFfLURXoyZDHWqa97BefwDyWN6mUjJ9IwJt3dTUw
 3nVEZhtb3iRbaBx98CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX+2ZoiROMegG7
 oKUrNd8dVAT/qBTouhXzZyP6rSQiK55KtrU3CEruvBVT76DGYob8y5BLZ//RpFTmIYZ1fRSvyX4
 CHerLKtwMCucfs7XgEUsTfrj9KjYM7c=
X-Proofpoint-GUID: DkEmoLQTSDgy9hF0VWpTvk9GT4c2a74B
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada0ae9 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8PI_4jS6IWSl88OZsVIA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: DkEmoLQTSDgy9hF0VWpTvk9GT4c2a74B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220052

On Thu, Oct 22, 2026 at 11:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/13/26 10:13 AM, Loic Poulain wrote:
> > Hi Folks,
> >
> > On Mon, Sep 21, 2026 at 2:38=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
> >>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
> >>>> (monaco.dtsi) for clean DTS layering, so that board files only need =
to
> >>>> fill in remote-endpoint for boards that actually have an M.2 connect=
or.
> >>>>
> >>>
> >>> This means, the dummy port/endpoint node will always be present even =
when the
> >>> M.2 connector is not used. I don't see a compelling reason to do so.
> >>
> >> I don't really see a compelling reason to defer re-defining them to ea=
ch
> >> device DT either..
> >
> > Adding an empty port/endpoint at the SoC level is problematic for
> > uart, port is not always expected, this depends if the uart is exposed
> > through a connector or to an onboard device. So we may end with an
> > unconnected endpoint but still have a bluetooth subnode, which can be
> > a bit confusing... Also why adding a port/endpoint only for a specific
> > uart in the dts, and not for the others? This is a board/SoC level
> > choice to use a specific uart for M2 or not.
>
> From my perspective it's removing boilerplate. Currently all USB and
> PCIe hosts already define their ports and endpoints in the SoC DTSI
> and if they're unconnected, then simply nothing happens.
>
> Both 'ports' and 'endpoints' are an abstract property that signify
> 'X can be related to Y' and I don't see how that's a problem here given
> UART is very much expected to be connected "somewhere" (with the
> "somewhere" perhaps being external/a pin header)

Yes, but in the UART case, where the connection can be represented in
different ways, we can end up with devices being described as both
unconnected (no remote endpoint) and connected (via a child device).
We can probably live with that, but if we go in this direction, we
should consider adding a port/endpoint definition for every UART
instance in the DTSI for consistency. The same would apply to I2C once
endpoint support is available there as well.

Regards,
Loic
