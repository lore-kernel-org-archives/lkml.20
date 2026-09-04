Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F880448BA8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514907; cv=pass; b=ouumKug2thyITSjd4tiYA4ceDnNCS/jw4NrTcuDG1wAj+ppFVjPYEaRqL0aTMxOx8fKYeiISd2MT1283PZdGFhFcr1xDNR9r84za5StUBfk9ZKyQ/t7mYSvpWqEOQAD1Vk/BPWxN2XBOb4twtXn6uqCXe9355QASIfiuGXN5fLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514907; c=relaxed/simple;
	bh=oe/T6Y/FRUUrrhaa53RTdb7ccil+Ty21E42JRSBu4DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iY0OcrUQdDYx6HDlruNQWP/fa5QSbLDbYSu7ugChIqyfcX0dJGu+cGRvbwcWPWEEKb9+JTqDsv4xY52bqErI7mNl4xJ6aL4gSvpN/LbhBhtEuyO8GuHTGbgZ/8QgfveZC4wsVeHrO1r5lJur15d0EVfGqaVOlMWVuiltIQJWwVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5bBjrGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHtSi46u; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5bBjrGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHtSi46u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mn292351556
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0CXHz7ekqSyyXlE66+G+z+OMwp8FaZS/VX/QUoLofYM=; b=R5bBjrGmPSFpV/bI
	QQ9W9eZhgi/X2GKxt7anXTR3RSx8Fjueac/1HKxMozL7D7UvLSPnjvasPwZxvuLe
	RvM6qmQxfPBxiojKvh2WxNWc7G4we5vRajEErTJ0Ga/JHvjtygDx1g7QAzFVmkXH
	3bjdEaiQVCaLm5ivqafBxa+vdOR8gmBmsJM4hs6x1fSECabeeCnuSGheml6p1z2U
	qzOoRRBK6QqkBWUZPJz62aQ44KDi29l+ag1nbxo84SV1ceCPDZtvfnzjRa6sIf+c
	8HAt7ay59PVDrh0TgiD3OKwSqaJrkSK0oOjO6iuMv3zbATdNCUs0gqky3c5xRYVx
	Y8itnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh4p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so976829a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514903; cv=none;
        d=google.com; s=arc-20260327;
        b=Nx6VwDY2NGqCDXUXxeUh//jPazcuddCsdAWcwQjiylLG/BDaIAFqaYubYWvcy4FOMI
         s1oQOufn8CxX34SOek7sM7Qm2y2pzOfhVsgslrIoC8PwGvSj3UPARbmNoFhfCQGylAnm
         203RQ66YvbTMI0BrAJ2ZY2F9Nr1eQgfBklhBX/L06vocSerPsO1tX+IKogceN2isELNq
         MMDGTaj6HlLITstaWbj9L+y1XWwBO9az8b2FqKBZx50DvvgxV0Q73l/PEJunWCbg9WHp
         b1lUxYKMJNzJdgYGQKiuFgGp3XDMAdACB0vmScds2JkjsEZjCa1digjHmVwkD7ARvw1w
         ub0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0CXHz7ekqSyyXlE66+G+z+OMwp8FaZS/VX/QUoLofYM=;
        fh=s4H16cCo7G/vr6HUQz+/Hs5Yx76vHy270ZlavgS2rcw=;
        b=FCA1FR3pO2I30Sb1R7Nf6EHMXrANlsIaqNwNXq49fZr3bYdCIaxTFY41iL9p+7FOLl
         zRx300250nQVvtqrZjZ5j6o9fTHDWaVgWpFCN2dEglAlHSWeXRxOX0K9/QNgu7Cr5dsy
         9GgKpbylYQT61DVRwu1l7hr76AQ0SSs1DYRwSw/85XYSqcmC1azsqBWRrLRnio182LQT
         WLmJwiEqbV4rorXS0+WCaclW/1WY2jqeSVJTU7knotPNC+4gHTVf/eRJNffF7cuvkSlW
         TzROh5eaNFl/u9zMEx4iy2297CeXkxExbw6++x1nIBFYf/WqIjqpX1Ymxi/30pIDXl7z
         PTtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514903; x=1789119703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CXHz7ekqSyyXlE66+G+z+OMwp8FaZS/VX/QUoLofYM=;
        b=cHtSi46ugh27oIl5S4jMCZsahVvd5tNJku0w/uOwybwP1a6vYqZFTG+Mz9UgO7nX+Y
         I/qpcw36dZZSfPJZVJMMtn173Xto48rOTT+Q3nSHieaLsKN4wOF1pJqe8KJamfC5kijp
         pHk6z6RTPZr5DK0322k+WFV6DofMbG7e2FLNsvCg6Fii69JdiF9POlNV7xHyJMo6B5c9
         OFucld2A/cnKzTcPl/vJDpmbl+t3cq4emgJSRR3m+bbSs9wW+Hb7rPBf2RlaOJe0NtN8
         IT6ykcJKiPVO64bpdZ9/jeq67D+0il4Fb19XyAqAaKO5h+LaqTIZEsKBVwdYK7+ZMlel
         wULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514903; x=1789119703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CXHz7ekqSyyXlE66+G+z+OMwp8FaZS/VX/QUoLofYM=;
        b=NEDdlA06nGPGY3aCcnvcH3Gv6/dq3N8SWCvuU0qLC52Np5TwpIQ5DmJh9JCxHX7XBz
         VBmxmJkSDH80DkDjPejeYu7LsfRXBq9NNjNxbOXNHmNrh769Mc9y+sl8nN43qQd1Qe46
         OPMPO7j2dRNtZdKOcCJKgjle01t281kvBIhh3Utul2J9plrHGWvox8R8ANm0w/YcCPS7
         bzUhDqXy63J+8HGTRA10jkxUAPY4eFffoMd9VhKxKkpqFGgA95fnkEQH8v4Xmwk7a8/K
         IcOEgr23qJmiM016wDnMfwJdNbMSpUYAF/UltI4BLCpAO4+8LTXNiykLruevPorUAGPQ
         HWHg==
X-Forwarded-Encrypted: i=1; AKwUvByHpPK8iQTBP08/ZBoA26Gq/acytqyi+in+dMU515bEyFKh5qIE1gHgob4N/s8VskDa4dzP4KwOO1xpjYI=@vger.kernel.org
X-Gm-Message-State: AFuF++mRpN2qeWDmWiLDQdBczi+cMy0nKjXxXMcgIJgqOwEJtga0zsmj
	e71TXhSeZrPS2FdHgD3Gt+QgOQ7YLKhZG2tGQYDJQhU4Z3s0tuT/r87cvOrVjLzTZxyakdCGtgk
	OrbEohMizr8RsAHnig/KMnLYHNQoaeFQB0e6x8qjId9XRxxPcNZvMY4yWt/eZcQcRh1qc6rm6cL
	nL5jtFeefHzOJErffah0cQ+45Lhdp/fCnrjAVizAvJoQ==
X-Gm-Gg: AYBFou33oSsURVAujx0L5ANfu72aXgcav62D/Sv2ufEpN7B5a4kHtvtx5apjnV7xpnK
	BtkNtN1VVTQM7IrOvKidTz5BoK74+lLmUBHpbisvjCGiDLcJ+If3BwW7MJcS/BINEya3DPct1k8
	j4EZDI9SAx7y6xWxoOYvHMN8Hzn55csPgUJZcBt3aDx2w6COSQvGhRmmWj2w==
X-Received: by 2002:a05:6a20:c89c:b0:3d3:ae1f:d7f6 with SMTP id adf61e73a8af0-3da3a0c387cmr7804147637.22.1788514903447;
        Fri, 04 Sep 2026 02:41:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:c89c:b0:3d3:ae1f:d7f6 with SMTP id
 adf61e73a8af0-3da3a0c387cmr7803981637.22.1788514901957; Fri, 04 Sep 2026
 02:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806130233.465653-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260806130233.465653-1-fanwu01@zju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:30 +0200
X-Gm-Features: AcwNN1UVLDail-yVP9JPMBYQDYksgVBfNqLh0P4igKJMMIGBKTJgWq3Cf-eBdc4
Message-ID: <CAPx+jO9=GhjvLonVfiy8tUOTAPeKv3aiFvLMJiDMQOZWb4+W1Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Cancel SDIO IRQ work before freeing host
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a9258 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=MT0tJ2P3ZsTGS_FN_9MA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ORvwRZ3_Cc7_sOwq5bHPPRYXqp1JWIk8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX9dWpGiQ1Fir3
 Zl1DWiH8h5uPuBY9DG6X39KeilpEjGIe7o9CL21YYY32vm121Soh7vM15lDHmoFh+FRTqINm0uO
 l0m2+AVJciXmy4qCDQs8PR0zUPLbI4w=
X-Proofpoint-GUID: ORvwRZ3_Cc7_sOwq5bHPPRYXqp1JWIk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX32hTCG4zxgb+
 /g/cWB1+ywW6xolCZIjw0vhGr9K/PMpRZeYsA/lU8+2275WNrOJkN/+aoU57BFF4WHWys7P57fN
 TJYMxOtY0x3t6SOTOf0WiMe63aBTkLNQm8MTY/CMwy/jc9Msyrg9fcsFaOUhQec5a4osxdbVJOA
 PkGxofUn4uLAxM5J1G8bhrI6Y2JlenwfA8JOeK6GqBDkxdMVk5PpP9dLpjSltb/6SbSvulN85Vq
 IVKvUd1ShNQnp0wNg5dxOO888Fa26j/1h9I3aEzwKjZPrb+hnHGXsS7VVik69Ps6qShumYcDpBB
 MSch10qEn6JtE0QEKzvOnbcYxG+Tr8AlHxk6nn9z4RrUDKtw4XAmd8/TOfokG74I/MhLeMKHnzE
 pAIhnwF+iQwrpPp9CgDT/pD5z6RJ1bk5gF37aeL0htZnet7ufe11RNa5KQ5yCwXWa3SB98Si2SC
 ziZt9Z04tiurz9o5n9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Thu, Aug 6, 2026 at 3:02=E2=80=AFPM Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> A host controller that uses sdio_signal_irq() schedules host->sdio_irq_wo=
rk
> from its interrupt handler.  That work is only cancelled on the suspend
> path (mmc_sdio_suspend()), not on the remove/free path, so a worker armed
> just before the controller freed its IRQ can run after
> mmc_host_classdev_release() has freed the host and dereference it through
> container_of().
>
> Cancel host->sdio_irq_work in mmc_free_host(), like the existing
> host->detect drain added by commit 1036f69e2513 ("mmc: core: Cancel
> delayed work before releasing host").
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: 682696605c7093d ("mmc: sdio: Add API to manage SDIO IRQs from a wo=
rkqueue")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/host.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 88c95dbfd9cf..becb5a850a2f 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -693,6 +693,7 @@ EXPORT_SYMBOL(mmc_remove_host);
>  void mmc_free_host(struct mmc_host *host)
>  {
>         cancel_delayed_work_sync(&host->detect);
> +       cancel_work_sync(&host->sdio_irq_work);
>         mmc_pwrseq_free(host);
>         put_device(&host->class_dev);
>  }
> --
> 2.34.1
