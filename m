Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E753B8D7E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035482; cv=pass; b=k7LFf0L+AE1Qj/O269xKTv869aWy+dcXOY0gs9iawwZsxUWScLZSad2s6Oy5SuEmDm8bYB7GSe63IaOmRVsTvrG3ChIWh7kWyZVzhKOQtbQkFs4zpseWiwYkTOrtMsYxUo/SKu8tsAo8B3NfyviQo4k4fU0rEx1lvhPkk9gmotM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035482; c=relaxed/simple;
	bh=xJtlT+brubTDzcwB1LsQU2wH8jfhem1ycRIpQIZsMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf9fc/FBel3M1lNKrgAqGvVaIe1Cjy77J68oDtuVQrdKWWEtSTNd7gEbjiW6kbr1DyC1ZzU+Z8jtkhzj1wVXnlXD8g3wOCmAsnupvqzP2wNoYK3rO9+8M1Jb04Yd9fd/uW2WYdb735OhNl6U2+dUOfSNOBDrB2kP+nswzhdOKCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGKqZv6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRIOU46R; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGKqZv6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRIOU46R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xW913468699
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=; b=PGKqZv6uqTxJsb4V
	yz/56PwDXoYI/+DTCIsMR3DS/Z1r3noojO+XzGn4dFF++mrEALLWcGYqgjyWe3WJ
	ZHYBaIZghgOs2KV0ThF9P+XHnCRbNDHS5d/9EFsz6fhbSRUpiEfy/fBUN9IdRTOA
	TW0teNVSH7BgXWyi7J4XQvW/RwS0u1vLSONrNTUqUcRTkuyenE4y8wVAhp7D12bc
	YYaBUeeCvKRDcdXwi9yU0Sf8UBVOV/8PTrIKBN9qSXquo7+Dyvmf6QsOlNPpf2Yq
	nah7yoUwbbBLZawcshuQMNKa5GbnhltI41cGg8CkvKkDjBxyHIp1j6SDVwjDSzKP
	JBStIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8rb29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so10839595a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789035479; cv=none;
        d=google.com; s=arc-20260327;
        b=gmSZKmT62i+2GFLwEiguPpKWlp6+2OOG4tWBxfr/rL37UI5JPlCTKy4qcAaubR1nrk
         G9sztIUJd7KToyfGJN94fNrrKyeSOKWxILEhKTtBamH4VTviGZizjtS7fMVxz5u6/JYT
         L+3+Vn6dg46smOCtZOMfFFeBKkaU+Q6qM3QqQ8s1g2awXjmTPEIeRdqjaQNN5rnoIgaR
         PLEUSS8yBOrZ4TeJVY1F9PXlbvRNDJCWFt4ATw36SityFlz+Qh4wEfMG7v7yAFLePt8G
         9y/ITERddengJKFOtqkgdNo1acu5CP1bgQRvy69Jw9GN6fZYq1pnQeNiGdyfLGeJaWNK
         ESuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        fh=79iAWm8Z0wpe/w2eE+6OSzjU6+h885jcFAZXVSVrBDY=;
        b=MEgcCINxTjJqKamKR+a0/IWqVxTwPB6K9T7yhTvjxbRBHapJkhk2blvyuA1to+1YMP
         JAkO6RuphwcMMVX2C92DuC3uy3ULkkDqLHyqTqFNONOSgrIuYQU8ySrUMnYpH3Ip9Wdi
         /tBTGh+bkyq8S4s0DIGfAn5vdV4y7DHcJvN/2uZ/AfJbYiY5GEik0zrfhs2n0xRyoh0l
         42/O8zaCVnVqpNFdMk87zXXE6JDYT4JBrWIBdbcM+QVLU3ykZ5EeYavURwe2+RJqc3ab
         da6uXFxjNIuvgwg17vkZtMtOZ6q7OVro+1atZl8A3EQsmU4S8Ikv33lZlmk6XvXMXYLl
         Fxgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789035479; x=1789640279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=JRIOU46RYjLzM+OzlFWSoiAzGZC8HVthbp46z6ampFh07vfPRs8L8s3XcLkhq3wJzN
         NKFMXNYJmFSYPof3j7UWnsvANVHzR+LepjrVwmMpOxNVkt1OZ8FkwaczxKGcRb9Xdu1z
         aPAuGq/L+jdtkWOqcQhbGG174wpWEBwqAefPcpHnb0SSpboVLLYqSe+FbFOrfytz/TBi
         jGReDCK28cgezx2HJtICFWBAnJHgNlixB5x2Y9QMBmluOqQUePevXHJBWT6eTu5/+m3V
         cix1y8iGuxnD4Q7d0BuHIzJDV6S8svDafz6WKv9m9d2oc4XjwEMs2rqVhoFQ1KHFMDWi
         FXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035479; x=1789640279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=G4quL2WgQhGjx2F5tPHYQBOLz6KYPWhGGPtMslwF2+uIW7OiDb39jmumbqwu2g/1BB
         MYL9R5b2tcVg+XoEC45c0bZDH673lDXm4uk1iZGxvUli6CjqhaUQE/UjJyY7KzPyVVIX
         PEVX6xEillMiSo8U6vm4+ZW0kIx0Bnz9AnCRTWMrymbvqYAsQMTGASv/cB7Hr6auhFVU
         ci2wOQjBub0H/tDRulODokvfR9+Iv+sdkvLMkHDJonnQwdpESbtr7WE+YEXovIcbhkiC
         9Gj5xx8t+r70wnwms19Yu+BKVKNbGjRIguVbbP+cTRuJ8P2x9yI72uc2EVonXbeh+JsJ
         XjBg==
X-Forwarded-Encrypted: i=1; AKwUvBx8NhMsHYsKuYaYsI9FY1r6Gjt3fpANU0k9K5ptmorlBCtSi4cbyYLUf/A9OM9Japi8BH9DHMLr3gHWNJs=@vger.kernel.org
X-Gm-Message-State: AFuF++n6CLqfI77E7ysJY5TU4qSljCuyES6emeCW/+ZPgVEQE/QIkVUH
	4LarlRYV2WRCTQm5AlX66cDerN1QB7gkiL8GG3oS410Syv2MKB5yJI14V7Fg3zXwMP7I5khrR0E
	BFDD7PnbQjUX8ZFtu6dv1aOZWHdtLYm6VYsqJSXg70cRpOlCNqCbWezprgiqMaPKGs80+iSZw7W
	a+WG1U8HSQukgKSp8PNTCbEpVyIc30Tfw+PVozTjxC8TWInKWpAw==
X-Gm-Gg: AYBFou1D1FIFbpaMN+eZ1zeOT2BTcQUBRcGXLhz4HCAFERFwFW0Io3Dj/AapfFNFp1a
	hhmZGNBR8/oPmIThDG5E8EAYQ05VHbMNhq/W/ihipgxnQCeBqkUUhAevWAsLPRcHgfdkiMyhBtc
	jCUthiiX9yjC+ZfcLWlGUXBEByhK7kOg4H47Jj7vAsDKnNF0kObGvtWiDb3g==
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr10579651a91.13.1789035478541;
        Thu, 10 Sep 2026 03:17:58 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-39d70ae1a5emr10579584a91.13.1789035478102; Thu, 10 Sep 2026
 03:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:17:46 +0200
X-Gm-Features: AcwNN1VvsxYSlSneh1UTJxLDFcgkCYVDC7Rwi96BfcNazOVn_vX8zy2Sk9dMolo
Message-ID: <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HpXQsghl8u_jpLMZcV3U_oLXW08ReQKy
X-Proofpoint-ORIG-GUID: HpXQsghl8u_jpLMZcV3U_oLXW08ReQKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfXyYoUzqDpYg8G
 aMnN/h/OD/UdrP00dIMXJyXyKX7KdFam/1sVpwvI6MFT0A1rQ5KVO5Q/mKZ6mDWHOXVZcvgFsR2
 iEqz8w5s8+esd/dlZr6c29z+sut3YgRQRZ4eCvJkd7Bp8gThWoRhrWw1eVq/RETSakpLksD3odW
 CpOsu2pGkiTht6bM34PHthSSVXLUv+XWJY0WenRCvdvRiZRVeZd0169m0lEoJmvK09KxsbnaPYm
 XB8/6uwq3xsV0PBYLNq4t/WLCc/6tGlqiVuU043UvdKKpp5aq6VufAZiq6KIxjfxuvrCS0AtRhq
 bF4Wb0hcbW0aoktRacxAbCU2yx2znBhdEkgMOd5nB0Tl6E5ThdUddIcrIVdnjdlJW/z8FlSmXW2
 g+fb97qNXhzGBn/iExtKSLcNu7yy/KFbpLyD72SjhsGEGaJJfwBm7hHJMpf+ATr8zM6Rfh0hRu+
 THd7jKUj+0D992IG6EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfXyk0cirFgxzI9
 yBjju1OhN+fCC4WOl4Pytco5AOP+tmw+fWZgQ2sOTy3Mo8yaurvK0ge5uLCbEGe1XT+VhLsDLOC
 AmzJWKZ2Y+Kq0yKRSWV4zY+0aEWrp8c=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa283d7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=i-sMpDq2_rzAXM5hadQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100119

On Sun, Aug 23, 2026 at 9:48=E2=80=AFPM Abhinaba Rakshit
<abhinaba.rakshit@oss.qualcomm.com> wrote:
>
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
>
> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> to align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
>
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

This looks good to me!

Although I have a question - should we never drop the vote? Like at
suspend and runtime suspend, at least?

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..1b4c276dce34d76dcbe75117d=
e37e09ea2002633 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1902,6 +1902,16 @@ static void sdhci_msm_set_clock(struct sdhci_host =
*host, unsigned int clock)
>
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward d=
ecl */
>
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
> +                                  unsigned long target_freq,
> +                                  bool round_ceil)
> +{
> +       if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +               return qcom_ice_scale_clk(msm_host->ice, target_freq, rou=
nd_ceil);
> +
> +       return 0;
> +}
> +
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>                               struct cqhci_host *cq_host)
>  {
> @@ -1959,6 +1969,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_hos=
t *msm_host,
>         }
>
>         mmc->caps2 |=3D MMC_CAP2_CRYPTO;
> +
> +       err =3D sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
> +       if (err && err !=3D -EOPNOTSUPP)
> +               dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
> +
>         return 0;
>  }
>
> @@ -2149,6 +2164,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_h=
ost)
>  {
>         return 0;
>  }
> +
> +static inline int
> +sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long t=
arget_freq,
> +                       bool round_ceil)
> +{
> +       return 0;
> +}
>  #endif /* !CONFIG_MMC_CRYPTO */
>
>  /***********************************************************************=
******\
>
> --
> 2.34.1
>
