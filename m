Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400694;
	b=rX4s8Zkj+Bg+o3vPmPuM1LkCxSQ86U3PpXwJPnA+9IEV8WLH8KQALEwlFxH2y/2gEhLF
	 iOm56LTprnioDLKpMekJnWaQsqRfcHeXLUYH2b5/Xxmfn+NYQLxZdQvSvOVkhR8yCLlRK
	 dgsuH0lEoev9jTH6XJQ7f7J/orE+JKT7kx0A05L++SCzgEEIcWhvq/sIOfpYFl2dpw13W
	 oDc+8f0VwgIY+kz9dgM+gxy02FhekKoZNashdEmf0YfNRbu5Sq77scYljyb71V3nQa7Eh
	 FXCj3gb6mQGSy/F+CPIM5Dmfa0PDJqmyXCVl29jLsWau6KkIlxc3ovblAsqWTYuERcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N/aRmjV7cFcArA6Vo1LK5MJrHqjUEekZ6x7SBzSyzqg=;
	b=2FQdTwLNEbLVSRV4a7TWhLn/7afFHSrjP3aOMEkPqrW0JVU2zI/Gb86FkNKZG4Xt7hKY
	 PUJ+4sOxO3ZF/DqKRsfeKMiiSiTNyNU7RkrHJiqWwW4NN2VzQNdZcScWxeK91NvpnSG22
	 SfAIyyfmKD0Ri3TmUjxXlHf56VTZ5WCUTax2Htf5u9AmMzImN6CHzvbV3MKzxWltXEGXN
	 CTVSINuQ6pQWGay0I7/POlfwM2gELGjVW4VKopxpLc/NquGiUHZtbzir906EhcnaswMd/
	 +sB64EW3yAekUURdvh8E/vFqtPFLgiD16VGDyR9Fj8+5Vq2ZpXha9zVAsZ55uGPAe8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFVp+Ac4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmJof+9l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC25606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC25606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFVp+Ac4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmJof+9l
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZboC708281
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/aRmjV7cFcArA6Vo1LK5MJrHqjUEekZ6x7SBzSyzqg=; b=gFVp+Ac4kRHnINFN
	2Gxzh3Ia932399gYojdmLddB7NhIAu1oXhA2JDP/wn3OFqDmsIoWWcL0djWCrJgT
	iIN+lACHrY4/NwEeHH/0H4W+ky1BaPiUc5av/lxGC3oSz+Xm3sz3r1EccMINd2XZ
	wBrkvlAIu/b9irr9+ZcUcY8ClbnvVB2UePBc5rcdjHNCOAPtk0ZXsoZuk85KnQxK
	jsChlJc1HKtlhz7g/D+usVqsitC0497NApjpqUXHDRIktBNFye9bBr5QzyqZ4/IC
	TllwhmkeYLrTSiutbHh1mlelgFmHFrfs8LbCa2vy9qc8l7CvN+UkWE1jSBQyF3xG
	yHqWAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33hdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18741aaf8so540586a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:38:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400692; cv=none;
        d=google.com; s=arc-20260327;
        b=IyE9lXJ0ujm3AfTQ0GEsL8majs0H5dqSbUmhMYHU5eUZJPxsBd8ybtSYKUahCQn02y
         3tqtty+gjwT5BucV/CwCCqeMrmYSQQBvNsp8aeeFIOAXV4UhLDgEl51ytq0JmaxX1HHB
         QERCAqUNsE8ugJjX8Oo4y3U7DWSh0cMaAcqBl4VQ2y9JT7cuV9Zn77vMnRglkHU59Kix
         jVmRlOAGalLXNOkBRcTt8/0+Qgdr/X36e04Z6kNtfvyD00tEgDpQz9jLVUgHpCOS/oBK
         AvdIqE/bNaK/6Uqi0ujIip9o8Kxjn2G5T6VGHcN1am/zH2osBvuW+M7tEe+4vAG+V8zv
         D6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/aRmjV7cFcArA6Vo1LK5MJrHqjUEekZ6x7SBzSyzqg=;
        fh=o9z8WThvq1Ytt7/9fmr2ubUKDuXZYoNXA80hr5Vssv0=;
        b=mU15fi5EmUxtg9v5bxPPbHKfXye8Iq22Oe1BvikhX764ucexnH5waUttcoWowc8skJ
         7jNwb4/bsj8sn9uzwoxFVXqRNnRvUOCvjQIUJ3yDRao/tVMmkBf++W5R37lrLqwM/woY
         ksLgXsIHrDoBITuY34SUHG/8R3P+wjNH01Koi6fFMC6v4YpCfw0RJBeLjj62VoVc/myY
         B9TOEQ1RAW5KC/2wqBntFj2NBNRCxc7m32Q4rd6m1EZQCKIfdfTt//Zygoob/DEQ7nn8
         uuRgEZBIFYVGMsiT9xO8Bpmxadr73YQuiRwj/+SF7ZLwKJoEWp/crz0qRei73eMmXbqd
         Fqzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400692; x=1795005492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/aRmjV7cFcArA6Vo1LK5MJrHqjUEekZ6x7SBzSyzqg=;
        b=JmJof+9lNArolaJU8MZhpGNpN//8Nxgp4dQ9vnxEXvCr1lmhLSzoUQwdQcdyuV8OdP
         AqBUcxwc5TfGxPV87WqUSoavMB7sXPAongKU1G7sE/M7AOWGraBEShC5yBh5QNYtUOQM
         84Mv5KcuCkDcrGbV3Re5qua27aJnUX8mb85zJKfsJsIrQMsrU90OaqjzEq+ZPgRN3orE
         W+CxeE/7ljizuP68+KS1RU78Yqn/GPTEqsF1VRWElYA153AUMgv/Ku2Lx2SQv2NC7T0A
         aH4bLBqQsLnTeDVdTd2nCnjcf4zhPfio43B3F+FD7xFqGqCl00t83wXA1At/xxDkBbpB
         q0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400692; x=1795005492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/aRmjV7cFcArA6Vo1LK5MJrHqjUEekZ6x7SBzSyzqg=;
        b=WGLvzVycMG5W1n0E+VG2R8NnxYc5dplE22Gszst2rahABZrb5EcZb3uwFks3+E/Q7K
         FYM70anIxFFnHnyHDPUJJg4E5JQktsRHoRgPOddPdonBoLGPZ8uQ6W5i1YuGz+WknCyr
         QQjqlrdfT21X5kZEiFfxWkf4U2pvT8kdd61EM9j76AT7CzBSXeOkYvuKMGCenNbEf/Fi
         vPQeGSMBWzQxDHgPKiZjXPZhyxBUaWW5US1vuIP4cnGKZji/A49e6n+u4wLDJk3cHWke
         dms9tiMn0vdF/QNSYlQtqMPkaYs4x+GOIrfSHLhHNQmO1UKOlcrWU/+S8xyo1kiumRSO
         IcpA==
X-Forwarded-Encrypted: i=1; AL+hErFafspuDv4xhK0XdHflmShloAAsqmrP3tKyy+2gpBJhKVT5wBfEdkLqF3KFVGCUw2OWax16LC1zYINrowc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ml1D0Op+6pC2S5Z2G+NZLj/S6d62LDXa1e5rVXvQfViofEW5p
	ElUrexcZdjSIQIo8YM2WXaAOkydaZP89v6DqO/d+LQydc6BDRM2iXvJVlLCrvTRPTadO+VVRKVr
	Vy1T1yWNZDOkb/qtDC3zCYZRHyzVGattbwmK/T1rfvz8DCYwZ6UYdrDEKvgdTMYD2hNqyCl++s3
	wxw89bq4di0ZdO5/dXK2RBUMJKNezyrcyBZoACzwL2Sw==
X-Gm-Gg: AYBFou2PBo38y1kM50LVRP2EG72otn0gOjBSQn2BPvB/zZ6+HFOkhb2B8sA8u4gPEfW
	pAJg3u+OxAOX0Wk2Pt6uN226OhxLlv6vzgNgHy6Faja7D5QS9/EU8NDcl9Pzl6TiiL5C7NqbZUI
	BBLk/p909skPXfKEJF4ZGpebJywxu67qsIzmi7RaBeL7wQAcRMddM2P04TTA==
X-Received: by 2002:a17:90b:4f43:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b182ed93b9mr2269250a91.28.1794400691889;
        Wed, 11 Nov 2026 04:38:11 -0800 (PST)
X-Received: by 2002:a17:90b:4f43:b0:3ab:4f1:4f7e with SMTP id
 98e67ed59e1d1-3b182ed93b9mr2269224a91.28.1794400691415; Wed, 11 Nov 2026
 04:38:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104193521.1488192-1-matthew.schwartz@linux.dev>
In-Reply-To: <20261104193521.1488192-1-matthew.schwartz@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:38:00 +0100
X-Gm-Features: AclHuK8Wl6w7WfkH27qfSdFdd9nhOmyzBOg2pz93Kf5iIkFUVMWyceq0qKzLxFY
Message-ID: <CAPx+jO_Hn3XWNvd9u-t=Ra7WNgAjHn0vKU=ioBFWNaJ+-zEC1A@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-pci-gli: GL9767: Wait for UHS-II wakeup
 before LPM
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: adrian.hunter@intel.com, ulfh@kernel.org,
        Ben Chuang <ben.chuang@genesyslogic.com.tw>,
        Victor Shih <victor.shih@genesyslogic.com.tw>,
        Lucas Lai <lucas.lai@genesyslogic.com.tw>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af461b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=MTqqJCi6AAAA:8 a=QyXUC8HyAAAA:8
 a=k1VgLetk2nvzqEboKn0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Ezp7Wq9ZhlihhAROVjRg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX8dQkKVOh5A53
 pzmwU0m4oqGZaz2St+BsxHpo0halzGVLfCA/krk+eHmK25WukKVnPWsqYb1Nwhpwbsd2ini2tN4
 veSjx6WP7xoP4WhdYInE8m7lV2XckQQh2yn35++jIRRmDKmhTyCy2k1fH8GducB5ToiIOwF3E0R
 RT63rS8Y0PO5CK2RhtoHC4tDK1xaj+Eumthq7Vis/l73P/fWxWbZZK7Q2BlJsQ7sPJsSY27Ufbf
 HPbmUaZZhw1zN7pZHNeZcwdV3W1WjiOuN74uHfzkvjpWv99EYtikE84curtHQIxbznzsn3sWGMc
 1rzPeIBQWnuqSPCuTomT4iJMZXUiiHbz1vSXloFkp1AegIgreIRnmnWenCLHBXEqTj8NZUtLNCQ
 Z67FjbEwxCZFjz17r7EfhvDrv1D53u2Ivwugw0HVqahsE/Y3PNl9RzPZxJhfRsG/QpSPGMhcJZ5
 I8M9FRv9TJ65CrpOTMg==
X-Proofpoint-GUID: HGbByfx4NODd5cC3Kem9iDtbasXxMPsF
X-Proofpoint-ORIG-GUID: HGbByfx4NODd5cC3Kem9iDtbasXxMPsF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX/dfQIgLFHaGa
 x+rk7c5WdeZYKd3V8fMm6N9BCZInjv/mBGPnqG5DO3HFlDY8baradQCgmMPaMKnPkqVNPi5AbE0
 9+CbJ7qLSCwdJk5iVRcDqwy/uo97JPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Nov 4, 2026 at 8:35=E2=80=AFPM Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> sdhci_gl9767_set_clock() re-enables low power negotiation right after
> releasing the UHS-II PHY reset. If the bus then goes idle before the
> UHS-II wakeup has finished, every SDHCI MMIO read returns all-ones for
> about 250 us. sdhci_uhs2_interface_detect() takes that as IF_DETECT and
> LANE_SYNC set, so a UHS-I only microSD card is treated as UHS-II. The
> attach then either fails with "SDHCI_UHS2_CAPS_PTR(65535) is wrong" or,
> if the registers come back before the CAPS_PTR read, runs DEVICE_INIT
> 30 times with a 10 second timeout each and delays card detection by 5
> minutes.
>
> Bit 13 of the UHS-II Status register at config offset 0x8CC is
> UHS2_WAKEUP_ACTIVATE. It stays set for about 250-300 us after the PHY
> reset release. Poll it before re-enabling low power negotiation. With
> the wait in place 12 of 12 UHS-II probes of a UHS-I card correctly
> found no UHS-II interface.
>
> Fixes: 27dd3b82557a ("mmc: sdhci-pci-gli: enable UHS-II mode for GL9767")
> Tested-by: Ben Chuang <ben.chuang@genesyslogic.com.tw>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Rename the register and bit to PCIE_GLI_9767_UHS2_STS and
>   PCIE_GLI_9767_UHS2_STS_WAKEUP_ACTIVATE as suggested by Ben, and the
>   helpers to match
> - Use read_poll_timeout() instead of read_poll_timeout_atomic() (Adrian)
> - Describe bit 13 by its documented name instead of the inferred behaviou=
r
> - Say "wakeup" instead of "PHY" in the subject and description to match
> - Link to v1: https://lore.kernel.org/all/20261021233313.247155-1-matthew=
.schwartz@linux.dev/
>
>  drivers/mmc/host/sdhci-pci-gli.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pc=
i-gli.c
> index b55618566d651..263bb091374be 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -205,6 +205,9 @@
>  #define   PCIE_GLI_9767_COMBO_MUX_CTL_RST_EN             BIT(6)
>  #define   PCIE_GLI_9767_COMBO_MUX_CTL_WAIT_PERST_EN      BIT(10)
>
> +#define PCIE_GLI_9767_UHS2_STS                         0x8CC
> +#define   PCIE_GLI_9767_UHS2_STS_WAKEUP_ACTIVATE         BIT(13)
> +
>  #define PCIE_GLI_9767_PWR_MACRO_CTL                                    0=
x8D0
>  #define   PCIE_GLI_9767_PWR_MACRO_CTL_LOW_VOLTAGE                       =
 GENMASK(3, 0)
>  #define   PCIE_GLI_9767_PWR_MACRO_CTL_LD0_LOW_OUTPUT_VOLTAGE            =
 GENMASK(15, 12)
> @@ -1190,6 +1193,27 @@ static void gl9767_set_low_power_negotiation(struc=
t pci_dev *pdev, bool enable)
>         gl9767_vhs_read(pdev);
>  }
>
> +static u32 gl9767_read_uhs2_sts(struct pci_dev *pdev)
> +{
> +       u32 value;
> +
> +       pci_read_config_dword(pdev, PCIE_GLI_9767_UHS2_STS, &value);
> +
> +       return value;
> +}
> +
> +static void sdhci_gl9767_uhs2_wait_wakeup(struct sdhci_host *host)
> +{
> +       struct sdhci_pci_slot *slot =3D sdhci_priv(host);
> +       struct pci_dev *pdev =3D slot->chip->pdev;
> +       u32 value;
> +
> +       if (read_poll_timeout(gl9767_read_uhs2_sts, value,
> +                             !(value & PCIE_GLI_9767_UHS2_STS_WAKEUP_ACT=
IVATE),
> +                             20, 10000, false, pdev))
> +               pr_warn("%s: UHS-II wakeup did not complete.\n", mmc_host=
name(host->mmc));
> +}
> +
>  static void sdhci_gl9767_uhs2_phy_reset(struct sdhci_host *host, bool as=
sert)
>  {
>         struct sdhci_pci_slot *slot =3D sdhci_priv(host);
> @@ -1276,9 +1300,12 @@ static void sdhci_gl9767_set_clock(struct sdhci_ho=
st *host, unsigned int clock)
>
>         sdhci_enable_clk(host, clk);
>
> -       if (mmc_card_uhs2(host->mmc))
> +       if (mmc_card_uhs2(host->mmc)) {
>                 /* De-assert reset */
>                 sdhci_gl9767_uhs2_phy_reset(host, false);
> +               /* Low power negotiation during UHS-II wakeup makes MMIO =
read all-ones */
> +               sdhci_gl9767_uhs2_wait_wakeup(host);
> +       }
>
>         gl9767_set_low_power_negotiation(pdev, true);
>  }
>
> base-commit: 4df4d2a577db2d3d57b888bcfb1206fc74661d16
> --
> 2.56.0
>
