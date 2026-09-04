Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F7449991
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514910; cv=pass; b=e2lBot6iVcdddyAyO3OTHBogObzTc8yx51KBTdIVgtyTqGnbuylIRqVyIYiSPMj3x9s1DppSOuPfSErFzZrCikiqbct6CO4pAxyeUA0G1iCDLpPonxp4b4bi40d2Rhqu/z8o+YV8RhzngwjLcM1uzKxCboyBIAmEg8X2wrQjtZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514910; c=relaxed/simple;
	bh=50uP1eicgdZrDAdIF1X8QHzjHyrWCQ912G1iM8kMKvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUe/S4GFniF6xLqzg99p7tQCmZLF5p68IvJ3zbkrk9shpFVL5S3gf+dFTFVGJD3s6wa0a1BhrWtRMiEmeOFUhb8x1kw96uXdNb+m1tqDpHabAOjrGqpuybUnLAXQnZZd8SVddyyk8W3SpRdBTtv4l/uKzCbP88LQtbU+GGcFmmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOnHgtd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjZkDA8m; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOnHgtd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjZkDA8m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mmQk3234630
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JldoHfs12k74dRK0ZkTsEc5gWGEjCULW7w5FKztiviQ=; b=WOnHgtd+g4Sfp0Hk
	ELZWXPYcMvA34BuPdsdmCIjRKBfex8mAm3BOPnr80WCPsPc/fvz8c4OMkchMC0gs
	hhJnUU+y6TJoP/YyuDqiRrOlrc18tA9SVrDcJAPQsz+BjrzawZTmF9gozQU4ib/f
	EBB2dZarfnLeReRTa1IvG9wydG4O5jFD0xSCh+84YVA2E6wb2iFcZeivISwaqxnx
	qqR7+QXl2n5TVbj0lLvlXfnbiA/pQsZvTSFzU1630gxgIEyff1tsx3EWwx7jf0/a
	vdu5ixJfaKjsa29C3cnmlBqpZT6SdDt1fMdxmAexlOnmdk4ag2Dv2wqoGvpxJcV9
	kqdsQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r147r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1125704a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514906; cv=none;
        d=google.com; s=arc-20260327;
        b=AHzToyXT7XquFpI4Z4cc7IleMBbH56xndXonIBUQ3e9o9rdYa/wfuCko5hMb0biKd+
         S4wSczYPtyxyVzB7PZs9Ul9XqdNKQz7HYxVLNL1A96rHDxA7DrDJ0I3CghbJHuHAjtml
         YbwdkiPZeSLIxot8bBLJQX4u38J0QpcefgeK3p6MEy5gJlNr6PZFVidK3huORgKaaEzl
         f2mQtpFj3C/rJb9xUbODIKi7JQawZTV4jfUN1QENHlXx0nuD6lsVzLpbz1dBQ2hSacAB
         1I+v2E7Tk0BftSuet5Penn4IcitdZQY57jLOnDMz9BjoYKnOIF2J/qBtjZGfyGZ2riHf
         4nRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JldoHfs12k74dRK0ZkTsEc5gWGEjCULW7w5FKztiviQ=;
        fh=eum+VQlf/541pw4GaWKrztfNGb0IMG/RT7RYwIP9qo4=;
        b=MHRkgEstjGwsUE7IQfuwmPFpXjEfgPrugYTAymblE0UH0eX8jerF1snLxgw8UBR088
         tBDRcAMV3IA1bXUOcCC8HgIOrvS5qDWyHAfm5+ZbmE8A3BWPhZoEhqVHf/k4iA7vew9Z
         MQVz89qRAkvcxy89NVEGCdKU/0Xx8IvstFVd6q+J7QHUErKkF5NadGBdOnlV8NY5UtFS
         aVM9e18PH26Tz/NGrR6dmlQko60SVMrfVTEeOE4Ic5MyWnYNY85niJzoRjb6y4EDD/AA
         votQ9S/41xL5Rr/wSzPgDI0skPeezqM/6EclKByVmAfCAsU75EogfVkAJoLl01QvgOe0
         GLvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514906; x=1789119706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JldoHfs12k74dRK0ZkTsEc5gWGEjCULW7w5FKztiviQ=;
        b=IjZkDA8mYmlNSEXVI2S76hlYMbYjzKPPqNYdaKq6+kwYdMtbAGnz1Ad4DTvjWr+Ysb
         55ZMjWYbGYR2olp4oFrO9LGn0zyGuc8mRwaWNCmUjcNRgbcIRtiv0UaT1ZDzDbDk3Mo0
         9KP2Q2VcFmdlwIfwUjQKldHTuyRa2Yh5/aKAmLuxcfJxuBR2gjK91NaLUvGQlswtK+Jf
         tJDf5aUM7rG9kbyLrs73Y6rsYfoCJEjak8WVfc54XMmr5j3dXosC/UmT+gZLOm4KfmVc
         FlCz5FUaNLCZbII3vAi2Qy7QSyqQA/ufuCLeamXhf9ZK7ACiB6SqdA7LsfSjUHY3ABFR
         FZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514906; x=1789119706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JldoHfs12k74dRK0ZkTsEc5gWGEjCULW7w5FKztiviQ=;
        b=pAQoiqHT6oO7M+o5utRN3VoEjbNa/g7M3r62o4Xe1rUcQgWw5eH3y8GodB6rGeZhWQ
         +1lDO1HIHqxXkxvdZU5dRgg/7gSsBjsMmFAPFMRsgDb9LliDY4LwI0KGI7OHHVuCzogV
         h++9wmw30ScV8Hv/3d3ufYVkykg0EZ91yMRfBi7falIp/LD4BOZy2CcT58YTPp6ErfU/
         NCGamHOVXOJxUaJKw4I6IdwOH6xtGOXNEzZrGaj920UZ8Z4Hhpm9Or9eqmhtmsr+CyNV
         ayRa6XKOzUUwSpLigJ6gcUVzlr+B64BAV17lZnBmRh34+k4IuzGL8cz46vP0F+X5Nrly
         lRiw==
X-Forwarded-Encrypted: i=1; AKwUvBx1F0dWFJHb2pl/se7rIIsYhjw8TxXGD8f6cscAO200lPMfWl6B41zFuQVlQqNZ11VGlI/Yind2dSLuKx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mCV2U3+WlIW65xj5is3p6krC0Lf1+aj0zAjIR+7EQMI4pYTJll
	z2gYd98BCr420RFy/4wkf95r3V7BaXraQy9YNzfYkW1CGKOC8NGqufNADCVlHfVXQ/UGHd4JgCb
	Y7/WaMuyVIYeRbpl09YTCb+6nyUd92uUyOB3rZ5hF9IuTZeA1SXyOFMmOV7pOsadZ1VRLBWOAmx
	zmjeloJPiNlGE/TZQOTtPpvehRFeve+UfP//0BbS2GDw==
X-Gm-Gg: AYBFou2O0NuQ8sn5HmNVjSoNcyF0NLxz1ZaqPmhEa2wiTNcj28IzAzD3wcoiZEDG/M3
	y0wJ98TOkP+r5WGacWLb3cu8jiHHHpeCw+ZBLKqlObktfnKLFhfR4pNjJ3lH5VyLKpUUavfRFj3
	/FZk4ivcl3WWKLI6IcNMKVGtS7jBWGfw39dBkaW7WU0znhTkzETOQVC7VYiQ==
X-Received: by 2002:a17:90b:2644:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39b26204e50mr6922764a91.14.1788514905818;
        Fri, 04 Sep 2026 02:41:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:37f:ed7e:7e42 with SMTP id
 98e67ed59e1d1-39b26204e50mr6922718a91.14.1788514905397; Fri, 04 Sep 2026
 02:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814082550.211496-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260814082550.211496-1-fanwu01@zju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:33 +0200
X-Gm-Features: AcwNN1X7jtNoULHEL26canlwRNl7gaaalnTd8u1iDOV2xMeca3w1nhpVHiz7hJQ
Message-ID: <CAPx+jO_NZOWDKDkQ_CkMPRdcG=mR7fUScPFS+urYu4qdCD0veQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: Fix use-after-free in busy-timeout work
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: linux@armlinux.org.uk, ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX9IHj77+UL1XM
 UvxEMTAY0KXO0DHxUuFSqzR8kwdMoYkaBCzZfp43RBVC0kVKBvu70IL0GEPefgHQEx9yTPGaDJR
 JhNjdRu8REUhadII73+pZLcCHpYr3KQ=
X-Proofpoint-ORIG-GUID: IImutvDWbz9oL741ZVDP5LSpv4tvf3ap
X-Proofpoint-GUID: IImutvDWbz9oL741ZVDP5LSpv4tvf3ap
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a925a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=GXuGsSDVByYryeoQmGwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXyI25E42vZBvf
 ewUmwSq/VnccEUnVHCmVzcyHP5BN7TMjqSBt/pvN1ZecglQlKMZqTm7rB5wBH91M6YMoCiJ7Xr3
 yaEe1yUGWlj9ZPNE2WdXXuoWSBoJs2bVOyppkV0NNuqvleQHSxyq+NnMQR6uEBVgOLsTKDq4Etf
 xdEFJ6HFe3huj5RSPAUwcqZmIG/cL+slh29m2iH7Ag2PHxINOmK9cvG7XnBTwTI/rhw+3XTJNFj
 XS1smV5yR1aYDlEKBnwTSzO8BAdQIN8hj/znjpOab/Te0bMkxKvjRHgySJBQX27Wihw8AIkwv/n
 igXF747q7Pj86Q9pb5pjwQG1le27uWK+xnmEnyx/9Vaxwybbsk0K03bIzjzeEoNTLnCyqtvIaHE
 w1PijbHVh7igah001bHan3V2fZ3W1kl4saAnytt4F5fx8MF+8zbsO+XIEV+03CtYvtnmctqQsjT
 DUmNDulxgmH8wEvqRng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Fri, Aug 14, 2026 at 10:25=E2=80=AFAM Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> ux500_busy_complete() can queue ux500_busy_timeout_work for an R1b
> command, but mmci_remove() never cancels it. The work can subsequently
> dereference the devm-allocated mmci_host after it has been released.
>
> Mask the controller interrupts and disable the delayed work during
> removal. This drains any queued instance and stops an IRQ handler that
> is still in progress from queueing the work again once it has been
> disabled.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: b1a665932dc2 ("mmc: mmci: Add support for SW busy-end timeouts")
> Cc: stable@vger.kernel.org # v6.10+
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index e500051bd..416bdb184 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2511,6 +2511,9 @@ static void mmci_remove(struct amba_device *dev)
>                 writel(0, host->base + MMCICOMMAND);
>                 writel(0, host->base + MMCIDATACTRL);
>
> +               if (variant->busy_detect)
> +                       disable_delayed_work_sync(&host->ux500_busy_timeo=
ut_work);
> +
>                 mmci_dma_release(host);
>                 clk_disable_unprepare(host->clk);
>         }
