Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFC39A800
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761250; cv=pass; b=faeWbgqF04pHIicPFI4QpnE/g+M5oHTn3yYn+AZ9UTYrtp/D/gh/8sNlFFWRH5AyExq/ev+EvEk2byB0PIG5P2V7ZL6C5/ikL/MtQk2qKHLRWX5OPfOr9+ftVbdFE8UCHcdb8tQOVEI+bvB6lLgHGUlYlSwAdBr6kvmgYhwGC3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761250; c=relaxed/simple;
	bh=pPskIP3YQdntT0SWxii1FRZrKrz51j/PFfCfhj+7X+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAt4wtvECtdiJFjr+2ZTBulnITEd6KMzGpPVnGa2hJ5UsIy37ziCo8uxxXvqqCayibBJas6A0hgT206LLIdv1fBgXn2+EQ7y2LZ90CFdwmDv+RX7iC+RW33P/Ei9HDgC0HD3bpTvOBXweC/Pg0XAEDOnI6jCGCxuFKLpHZo0FQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/KDK5Qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DepkAdBP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/KDK5Qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DepkAdBP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dcNg1556562
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZWMHLE219x3709P+AjMvXHPWhrcV6RGzOP0PzNMJ8s=; b=A/KDK5QuyIrplEaK
	cpkGymtLE/oVLFECf/FJtenNanLNdr/ZLdZ2Pgd3uOCnfiGQaREMCm8fyGQrpb+f
	9AMLuTld/Li96Hd537JeVb3kRRpo/cfNWJWvfs9+4I3/FtyydlRX/3Q01vtPCB/x
	r3POK/4kZOC8/YVwosUYD3DpqIHafsLsiuWZW78qsCB0Yt74fjHbFDjdz0eHsD8u
	RLGHkubB/ETmevspEbPSmbzjrWRwNaEu+ikYmnl/9sryju4tWcSfDTbVUdnyISOD
	rQWAlanOSBIrfBMMp0NKPGyBCL0eDuBnI3rCRBVExxYT5JuxESS9sdkg12BkPEuE
	G0Ujfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0ju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:40:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88551591365so1218230b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761247; cv=none;
        d=google.com; s=arc-20260327;
        b=WlgrVGJZOmle7GnSDOopiOHjYQVJfj27iTLBE0V7YSAVoIOuq9I4GMklMC3dInD2Ux
         Zr4SyXl4k32/PtzeVPk9FdeR8eODNXRDbL8ryVflLii5trwIeVWLeAXWagxIJf/JJU07
         cVwM/vFg0r6PUaOOmVC9zDB84Kw+hm6bklofHlzucVckF+kRlSYJFIWO34sgcBjSvOcL
         RzEOZaFuxcaGaS0TV0dB1lW+bA0DjEQbu4u+PbZoO8psKAQftKTj20kMDUh2XLJxe2o0
         QXkhZKOQGVSl1xYVEQJdcRdVnx3x7i0F7mqBX6066CaGvh8QVSlVxbBrYGEM0Pa4Rb/I
         +7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZWMHLE219x3709P+AjMvXHPWhrcV6RGzOP0PzNMJ8s=;
        fh=UQF+Tp5YKkxwKs4tGWudjtgf40/tg/GvE1eAeaAfsyw=;
        b=hGX/U4VApNjEpo/DgxQrd1sKJyJwGIQTqBhAvEalvjiL66TMdP2a3LCXBcQSF+Yhpj
         G8zF+IvXzN6n1PgbcQ4tjFy0bdrg/6tMt42hzi8k3sAcK5zKVDxQBGkf5dawyN3eibwd
         N/h29tXHq2oiC9a734kmXrwIgJ8afFh824A0o6mXU4o4jCsw3GONoRJbMFAWvOMoP1YD
         JyVjrBvhuAHtM82M1VBrB3lxT5Bxo1wvqH1e4+GLXCgSM0BoFw9E0O3SpLm/LQKvfcnR
         Gby9hsg/Y3gL2/DNSCD/cX/QlVv9MxUZtuvM8ZdHSqDUR5NU6tZLwmvcbuQRyCmxCIf+
         NcBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761247; x=1791366047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZWMHLE219x3709P+AjMvXHPWhrcV6RGzOP0PzNMJ8s=;
        b=DepkAdBPs5pUFj5pwKHoWVVAc90leP3GmIBV1MY/82g2048M0FiVueOF//tdeOrKUJ
         uP0ECRgfbusRqiJzjplZdMaoQJ/Y2LQEJazXCULY5bkOnd/vEe6kN1g2qAd7Ui5iOPh/
         Ct/OTVaoBgn4F5OE0VGTHLfvd+DJkhdjaSVVyToInYTfrrCC8DLO56wu7YSDQf4da4lm
         R5Sz/rrEmE0HBQ+J2vAF0Wm801u0O0IIxU/0bS9sLlxdAOHrTTWj2aIZK+3qjUmfqELh
         hYvN0fxmNC2uMu5ge8pBcIAvAohJIkByvqkrZ6ZmqC1lyuPfugjNHkduEGtJ1ZGs1VZ9
         e7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761247; x=1791366047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZWMHLE219x3709P+AjMvXHPWhrcV6RGzOP0PzNMJ8s=;
        b=clFeE8CokObrxeFtA5yWUHZWO6vlV6dU6I/QcMqlu59nHVwxfxcG5Y5HQZtDClojDD
         F50+odLrMAjA+qXtKnieD1rDCE215qlUdBewoo9yPOe22xHZwcBUBydgPvESJrEikKvq
         mY1eIJXFPn0K70cM4NPLEzOJV3iLJMRGv6Kl8NMcuZcXXb9/vy0Yy0UxodmUVJPz6UoJ
         afbXR4M1R4N7Id4KY9Z++vbdP7zBmxNEwH0LK9z+YN3wSul+RWMid6Y6eh9RsUZ0AG6a
         AnIEruEFn80yZjrfk1bzUN2k30wxBk42j0M5UN8r8pCFrxib8IG1HNelt0VLxmR1KgcC
         5v+A==
X-Forwarded-Encrypted: i=1; AKwUvBzjZl4CuhE+hUrUxarEAaoLCQgGDkJY9h0NElqtJc4+OvCyCTbYuDk4xgCtVCdneXM29XTHhIhx6nNN/7c=@vger.kernel.org
X-Gm-Message-State: AFuF++nGhvRypT0f+CwWIsJyvz9eLon+1fg5kgSxwngdWQYO1cCw9KYN
	CIWQ4zFpzUKD98BbwsGVpQEOTU+VVZXH0yYZLqbcjh8G/i2p8Ga9a0nSzJqG+a0iKccmMHH3In/
	njuSRniISHBrttamfIYzJD7mDjIVbWUXQUDspGyKX4EmdqhsY0x7f8tAUWeG9F9xxmzBELbYTV3
	dVduoZO4Ycg0Nf3Nyy31iLcRpgRagGMKP8UdNRCIKG5g==
X-Gm-Gg: AYBFou3/bZbGbCrE4Uibj7aYIkwtPS1Sc96ICiMRH+CiHWger09Os0tUsqUfhyXLvXi
	2R6NCi90fJZv4tpdCShDt1Tu55rxRpNqSOalcaXvNecpO5FgihqH6flg/+4UlVmWt2ml2IgvVW0
	brDtELhcR2VBNDTuqVDAGd65/12VCkWbO8ORXPG4b0P5Qq8KnkXLwWPx7AvQ==
X-Received: by 2002:a05:6a21:6194:b0:3de:4275:6a03 with SMTP id adf61e73a8af0-3de9f2958cbmr512613637.32.1790761247571;
        Wed, 30 Sep 2026 02:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6194:b0:3de:4275:6a03 with SMTP id
 adf61e73a8af0-3de9f2958cbmr512591637.32.1790761247121; Wed, 30 Sep 2026
 02:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1790742751-245571-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1790742751-245571-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:40:35 +0200
X-Gm-Features: AclHuK-_lv5zzUnSrJjhUo8Ov2oy9JCpDePqu6u44Hk_CSvC55A3_11o4qmYvKQ
Message-ID: <CAPx+jO-8tii2kFmVQUfcYN5YUGuOpX_8aPg=BndPurt6bff2vQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Let mmc_regulator_set_vqmmc() use ios->vdd to set vqmmc
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX4LEhf9GCMUyX
 o/sjKbqZSdQtcVdKqpCpbxOA98CseMefU4Xs1fTrbAP6a7yMuN4xzjIFGj+7y5YxLFz9BjuoT/2
 QTGg/w3EFJVS2h7HHa9f8f+G9TnQnFM=
X-Proofpoint-ORIG-GUID: ORAFSKvOn8MKMkoWU_sfX2lPVmbeiseY
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcd920 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=s8YR1HE3AAAA:8 a=Qqk-UaXwsSa3U4-5TL8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: ORAFSKvOn8MKMkoWU_sfX2lPVmbeiseY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX0YnyyZrsu5Yj
 XdLXaVp2rm28tsqifNACtQi+1PIaU2AvyJGj51LgUOdMTfhN1DJhewipAa+YOTC1B7h4FedPkog
 kAZlgixGIJqlr3B3GeHn4obmCWe9sEtwZmxnS6ooMp887jW5aXTeJkB5E1hBwpGFYJ3+tRprOds
 XDUi4XxxRvq7l0EC74QAjvAXEPsgDSJtWNAOYzXmwUolFyLqU51FCAcmlrSLkQ3+80z90r90VtV
 KtdrcgF1dhELtVHEHcQcVuAIpjS6ikf9vpVRenX5S3VTQ58lDFqPXDanBHVlxw9ViNzSX0BGBVc
 xolbdnhH0tSJOrCsOTwWjsdvUxjaL5BafAII9lKSkXh0kw+KIgjTKqTB69sKgplBnUjE8xyupDk
 mKqRy3LdRBcFKLF/TxtJkq2jtsTz/HUPD5zfYFaO85erK0dVL8EHP34eZt6EDmavId05b6+xyr3
 FSAAeZdGnko3gJHSIxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On Wed, Sep 30, 2026 at 6:33=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
>
> mmc_regulator_set_vqmmc() derives the vqmmc voltage range from
> mmc->ios.vdd, which can be stale with respect to the ios passed by the
> caller. patch 2 uses ios->vdd instead; patch 1 prepares sdhci-msm,
> which passes a local ios with an uninitialized vdd.
>
>
>
> Shawn Lin (2):
>   mmc: sdhci-msm: Initialize the local ios in msm_toggle_vqmmc()
>   mmc: core: Use the ios vdd when calculating vqmmc for 3.3V signaling
>
>  drivers/mmc/core/regulator.c | 2 +-
>  drivers/mmc/host/sdhci-msm.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.7.4
>

Not sure how you posted this, but it seems like patch1 didn't make it
to lore nor to patchwork.

Are you using b4?

Kind regards
Uffe
