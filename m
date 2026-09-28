Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81C14E5346
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612019; cv=pass; b=cdh7zUJ0L9gl3r15pPaHxAOEQH0zOPNFpmX1d61OS3tFuekEKxkk/sIPsjg0oo1lJcHUncXdr5Z7nql+yF+0ZyBw94LaT84s0EpobFy1nwcynnTri4a7KW2k2b+LcMJ40fxi7rYUqTOPBdFD8/5adGM+B20EkV78TpAd1zlbHko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612019; c=relaxed/simple;
	bh=t3ocf52Q+sxwlNU7sDw/sQsHiS3xPKtl9PS6SCcb/Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMR7kjqRN7N/Yg8iBP2S/mtTjToYBnR9ydVR1HfCzZClio7yMFAk7gNucyIK/uOaZNV2MhSO1tr0SWzQvRNMmSgJdA1k1zSPcFVq+sSFwRVdUsJB1IXHkxkzlzCNhawd9BewPnwrMOhO0eBDyH6C2zKCM55iuKd0OcDxPUaGs9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCoM/Hh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaBZ+Nao; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCoM/Hh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaBZ+Nao"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeCp7380520
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1J8s0RNGGUxlDL27PewBkTjSNKM2h2OxW2sl/yrvp8=; b=VCoM/Hh0XIxHSNNE
	FqanhQ/ehAyRBAk/KHM5nDfDJEQWGpi5OaQpEs1u82XBXTPZbVQmVgCZg0ESPV7h
	It7DC/lddQ0XmK2ZNxkARSYbPYurhsXNdZrYP5nO2E5NUHorONcGKW6qdPVHkS8V
	Fmyt5mkBPTOyPT9EjkdDVGZ7lXMYXPE/MtaZo/k/Uf8upY3oiykM9RJzsO8Pyhoo
	fPrJlibDJrga4nljh43zYB+HgN66Z18ZGad7PgMGhKjgh/pVY5orDFkqyMr50Heb
	pmK/EgJPB2eW/RKIHFz5IVBlebNFEan1HBmqxYuJAYmisOkNAyh3RoDro0xbqRYS
	pOBMqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx391md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3f521346so3525159a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612016; cv=none;
        d=google.com; s=arc-20260327;
        b=YPEyBOFhjV4LNWZGSaWCSKRXUghtLhRjyWeIxA+fr2sPi7fLrHeASzDbzJ3t3DV56F
         dQQugR/5YGuCMg/d88wGFtINw9IvtJtc3FvtjozzOMsxwG9j7rrMek7pyobd/zyItAyC
         rDPyAuiRCH1jobYWKXL6OhcXKVlp7f1+LUyNtua6tKgSobgeYpIfvLWY4SHVjJ66SosO
         Te7xaytR9LCJuJvDDHB9N5sm4+dmQseE9mq5UL9PT7uuKRzRuee5Cna9psuUe9zIKVUK
         rv1vmISjFtPQl/wzCPHYOo/wooRC9dRS8EMOrime/iFC7v4mvzb9cSST8n+tx+80Gm4u
         aBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1J8s0RNGGUxlDL27PewBkTjSNKM2h2OxW2sl/yrvp8=;
        fh=DGwQeo0dZFiJ01XCRMj4fl+D5sJJAZBWCt+chDkFVk4=;
        b=fUX/JJepaT/8bQcOUzRHjfKHXGPfTaVnjAhO1WJJIdYXzclyTO4Wq5d5sMg+aJPG/j
         qa+ILPltmySAsXJ9GqmMvLKniDagt/neqAYyiNspTHKWRlx99C9M1cIy80sF/VATECxw
         JRGWR7eBTeb+xOyEWZcOoPAES0cV1KvJOa9P/iwlcmRp3y9PersTjyQ3LBZl5Vgops8D
         gVJyexr+aSM+hKHv4P4H8Bth7G3HVigsEOHShzM2aHSzEvHfOuxJYbPTqQDnzV8svkHe
         a93UQdxVbJGfaIHZ4CZgIRpRKHGBXFQNN9yM2Vmx60wrLbll31nj1YDfVuC2PIeXBvLt
         oihA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612016; x=1791216816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1J8s0RNGGUxlDL27PewBkTjSNKM2h2OxW2sl/yrvp8=;
        b=XaBZ+NaoK26h52cq1iAthrXzliQfxu4Gh1HLKKKgqMy6aZLSS+wCzbxcpwPfSDwAqW
         crqGUnWhAf7qmPFJnoAf4ApPjVUyu0Vpd5Kc+9BmPO3lv8QePRf6tjhNWzmiBO3Xs+o5
         HGGtpr4/5gHYu8Oe+ORIi2uJy5O/so2ZlYXSRELamyE4X3BkGxZq8AuONcdu0kJ4+ShK
         WGC0rWQ++6CKJPyVgeAp7Bh5BVnMjliCGB0zAqwmjYfmtgG74atisxjzK9OWNVGPAk5N
         xMFxIzf96yb5oZxrLyMxK0WHJrx3ypLbLFuCIZ24kKyLKkoYrhec2xL1//lByMlQgkr4
         IpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612016; x=1791216816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1J8s0RNGGUxlDL27PewBkTjSNKM2h2OxW2sl/yrvp8=;
        b=cY/n92gCxZ40Ps189dASOPJYw+AXUOirnGBIvUFkDH6F+kNSMhyrVpO7CP+d+Jiqm5
         mtsqGsy5MAR8pi5FlfvPd8rRWSHpEe3wMaDx1D8Ns64WLV8e0HKIu0K19EtPvKklkx4W
         lmKalyiy7n41ngCU9Ri4mNYXIKwdsORKR5PFZ9aZj4wyEMVzT/GOf9A2joJBMxSPqlkf
         eajitHBjHaDfaNGwq7/L3Bb+XBXkmXcFlKn72vFwiAqzskY69W0VAm6RssWAr6bVpcjx
         T9x43JkzZWLdN5s2aoG/vn3bLUA4+MJA0wEwqvSWOdflcOGTTRkba/qULV3L4dYEs1qa
         sOuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJu7j0SlCU14AsmrZqnhDp+UYJBp+p1/Miz27fEH5LOrDu68VNvfYed5C8OoEHThWX0FKd5GnZzljfNss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAaGMIZtKn05a10I81jhyUcPCpRc2yU4qabPUgbN3LiUM4uoIh
	ha4CF/2Q1lLFbeGCxiBBXSabUKxpzNcAXKI/qiiAcZv0uMYWP5xMbnl8JXQHmhEZJ5VQXv8uVw1
	YPdjQD8M1u680CTeqR23Ps/nMCDy6JE2ZAHrFtJUgAhAhAcLr3/nM53yS+l1PdwM9HVc8KvU6ZO
	CDPR94vItHb2kLeAiqtB4eflwUY/gik7RAkJJF/li0EA==
X-Gm-Gg: AYBFou2idwD8ORaegQqZgFHzz6Sp0GAgUwXpMzR3knfsAJoJdkeM/6RF01ZqwgSXjbz
	5wjz3J7bAOn612OuyhEXqyrOl7qfq5sUiN7bQ0LN7TWkq1HB4rFGCeU0NlNWGgcHlfelz5DJmge
	3Yu0Ocm8fL8CNkpFlchM7tbyOIAfZlOhAvsCPtE7fqt5LzjFTPZx0BPImPAg==
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id 98e67ed59e1d1-3a0dec0d44cmr6441580a91.63.1790612016456;
        Mon, 28 Sep 2026 09:13:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id
 98e67ed59e1d1-3a0dec0d44cmr6441541a91.63.1790612015533; Mon, 28 Sep 2026
 09:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915161947.2479111-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915161947.2479111-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:21 +0200
X-Gm-Features: AclHuK-rCSkbx6ET_8ztVCrCgQ1IFSY-9oEQLK62J2Ir0H3NwcNF5BRthCX7OXw
Message-ID: <CAPx+jO_1wuE-zTxQB+-k-yKTzFfpLMGwvae3mKnG7v-ocB8b2w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-sprd: disable runtime PM on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX/a//kwXgm363
 9y3Qn3bi2ZaWyeN6jZqRsovq/gQgm8+guO45Xs5zYPOpIUl2ah2uLGOwVWJZ95sYPecNMoCn66E
 Ib9cjS86Bk5MJExfMDivMBQn1R2CaCymfhzfyPfST0ZZ/KyZwUbbTxoikSF5Weqzn3XPNIiHyap
 e1Q1x2Sx36XL5L/Vj0uIoKeC3T/p1NzD0rm40uKK2PY1LVa9tk5V1kpBsasHR3ofVedt5ArS7ok
 hPYZahg/ztcL04wWdRDBM8/FORfIlhZtim0J+c6+WeH02YJsScnX5XvYjfIlJ/jFo+V2CTit4ow
 Bat99WRF8BTyfrrNNPN3ZKPt9SOZhdkfcy281s429TNLp5pNqcA+8My0LyuHg/Osyij8B8FC2C9
 Idvqa4uD7vpyINwoyxolanpgI1kj4fPEGHIssgvsqS3eXqOBem8zaqgmu1ShlVonI9cngwcfOiS
 HYpoun8tQy4Yv7jkDSA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba9231 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=ntNj6TDCI3ddbZwZ8hEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 5BL7BPzobZTFMNtE4KmyAXOC5NXqPsnd
X-Proofpoint-GUID: 5BL7BPzobZTFMNtE4KmyAXOC5NXqPsnd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX3qZi9BonpC20
 2gRmI5Kp5eruq6bVpMzAqL0YQKDwjFrqSwACgIX9Le+jOYRF5RqbaCEk9U+CpeY8oi/KBdAUdqr
 MLaOwFllNdZQiTWfy8izkkalcsnfPxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280064

On Tue, Sep 15, 2026 at 6:31=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> sdhci_sprd_probe() enables runtime PM, while sdhci_sprd_remove() does
> not perform the corresponding runtime PM cleanup.
>
> The probe failure path disables runtime PM before disabling the clocks,
> but the normal remove path directly disables clocks that are also
> managed by the runtime PM callbacks. If the device is runtime
> suspended, those clocks may already be disabled.
>
> Resume the device before removal, disable runtime PM and drop the
> temporary runtime PM reference before disabling the clocks.
>
> This issue was found by manual code inspection.
>
> Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host cont=
roller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-sprd.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.=
c
> index 3584a2b314a9..0c8f389fe584 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -890,6 +890,10 @@ static void sdhci_sprd_remove(struct platform_device=
 *pdev)
>         struct sdhci_host *host =3D platform_get_drvdata(pdev);
>         struct sdhci_sprd_host *sprd_host =3D TO_SPRD_HOST(host);
>
> +       pm_runtime_get_sync(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
> +
>         sdhci_remove_host(host, 0);
>
>         clk_disable_unprepare(sprd_host->clk_sdio);
> --
> 2.43.0
>
