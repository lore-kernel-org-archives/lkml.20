Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793794976;
	b=R6MdGBsp50IPQlhMtTYCr7EOqbQJ5HX81svkAcs4ZXVSgSYnMXisXcERGSOSl1RRcV5q
	 dIlpFzXJvq8lfL+YqFYlsSc7/LIhBCMRuqw2bftGZU4BcibliEXLzfTiecnC8uGfXYS1N
	 j1qBNWeR7DEJcqsBMTi3FCuFIjOkulmrn1mSVzXruxMlYBtrVpEBQpyHS3lN8sqZrsyWj
	 YNLe1wYr2noOgUJmiT0ditLgMkXXpKz86NK0dbii5Xst5HnqJzM5UhYxom97GKGI5FEds
	 t+wOvGx9zkQUd6gdJfl3ERzm+/cBL7rUbHPpnD1pZF3wFki3y0KW0YkWM6nmooFA2+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
	b=IhpncDRq2MK+gfhybJVmEUcAQfE36Am2nX3BdBE/Y+cclZk3/Qce0xYyTQov2qwyfnUb
	 YH4S3kiK8plTXaYaIcbB2Rb7dxQ9k+mSPAdFMuKOcfHg3ZDv0qM/K1OoGOwY3TAwvqIDE
	 zRNo1wKFSbntgck3vpv5rN3sAt1frmzeSMdJCY8JmAOAKhoAz8u6915XgEXttiQf0PyPN
	 YHBIkqQRqJW4xhwzX/Zgd/wid8cZFVajTiyrSfPXE0ArBMDK/vCs9I+D0wAYe+N4MJ4mm
	 dexGRmBwWLm2g+b/4urv05tcAIZ42Gzn4mhbgf22R5DN+K4X3xsfuLocgADDlxuYRDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e++URqAP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6EuVVFB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F2606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e++URqAP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6EuVVFB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1UZk1764308
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=; b=e++URqAPjV2+uBWv
	KvBE8IHNar7e9Ek+2QCX1cFhh/bL+ASAp2foyPDAdL9q9O+XxAoukzmKsil3gQ27
	/sqVAoGWJFgQisseGrkL9QT8vy1v57Twv6jBdox55WwwGTHMM0G4B5Xn4ps/qU8L
	8/xTMY9ZEJjJsoZFer5uw1Q3SUF9IAzAv3YpyhP+XxzWhaETK0Q9KoBtXoZNCrVF
	D10+R22caa9YS784MiVBkQ8UJ8sTkqy7FqlyR24ZX6mdA/+Z9F4LqPVnvo8/GXcT
	7tGhxFsBUo7aheLs9SLHZeAMzyPJCRn/8IVj/6aIwCKxBK7DYoIYYBppcKNhCuqj
	5ifgwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn02c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:22:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so113972785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793794974; cv=none;
        d=google.com; s=arc-20260327;
        b=qJTRQC9PKs/j6IfbNwhXPEti3UkNMI+yiG7SRlV70SBx44LlrNTX61jOhKPoxdFMUV
         YtB4MjhdJwr2wC4vqGDngoa2CrjwI6UajsMJYo1vsTGku/KBIcM4pMFEcqslfsWX5SAd
         tJgfP7tSVDoFUTi8AqmYUYIOAEg6REO7bvq0tCzokA/OcpnkS+nDk3PlLbigcdlOEgDh
         0glrG8nD3nifgkbt88VPQtNPeWRXxzR0yujR9Z/DDrAtspFQwMk9xqVzjpRdzzFPgdna
         uRYXuFHXvCMcMvqaHYBpPMnoP4T+hWU1Uiw+1PnyWDIcKe+LiP5TI/1AxBFQnc8x6Fl/
         8IUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        fh=8KbAvRZNxA22SS+WDHKb4ySD43Oq2xbGJhrCJ1Mj3ok=;
        b=L6fhzTo1xzD1BWB/u/DscaiEsqkGzYReY5+gDPta/nWSqqzBPMpSJKhpjkIvLZGCz+
         r0y/63ugzqadlgmI88Xt2udupEdjgus1IKpPj86cMH/wtmDwFNazYhnOGVHhI91KpA2L
         Kb2W/QunLaFD1yL8TiyuFhvNDYur81pF6s1qDMoScvOhAKHfY9XifmeG2F7DPYRlhWDA
         26pGDK5GSfTAUbFkqbZG3Y//mavV4Oq9xkUhMRVUL2HJU2/wsD+QjDyGuwrLuQMrWWQd
         kwFO36rWFBHXt2XEiqkDHZj7JTVNu7ij0rVydyIRGpQgUSV9VrhCUieS1bD11W0BIjTc
         SUOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793794974; x=1794399774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        b=D6EuVVFB33Fw7/xXPWv1osSp1SMSsV53nADdpp+kIz6HCJtpULB1iZ7mNXj5z+gfsG
         D7J7sHHWnMYSqtQUmL9mYRVUhwOtwRuUcXsz695CA1KRirM0PnxPZtoQg4hcwcSYzQTJ
         5Ux8CU3BOmHvaH5oI+M9WCEkp7aKviRBiOa/ouGdTfdVQMYnELo+QjEa0Se0/jzZG8QW
         KWm64O1X072Z486H3l/8S0Zik8QZUSpFj5AGMnWmxoaMzPEJRUytTPcysV7MzcAXjZOR
         QhmMyXcaXGmw7osTrTQ0g2OT9OL9gx2iLJaWdxWT8k6+ZVHhb3g1iIqixZ6g3XRJ2D3P
         Vxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794974; x=1794399774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        b=auNpvbRNcNYS2VBFHZaWJ/DmZg7iL+F0s9DQ3RHGc8brBhKgw3jF56nNxUTIuBCxNH
         /7/Is+8FD85XTC3RW3jAp0uyNkLATd+gwn2RYNdH+94Yww2Aw+7lT9H9OzU2HlGPbikw
         nXOwNyEVTPi0gol4MKTNaRrG5Zl24I1+FRV+NwskybFU8QBD6fzc4ind2BrovEcLnJUM
         3Yid/JEimCJK6EyBwBdQHCjiA8Gg2c+3YRJPw7cCJlSYPqsAlBhY3PSJpgKPSIWS+vbx
         7SPUPGqaVGVEQdPpNHwfHmAssEOMdClrkaHM9QLSubed0geFDVEqWGXCZ227gZyu6yLK
         c6vw==
X-Forwarded-Encrypted: i=1; AKwUvBxxm0ZgX3E9UgYhRIVy52f/7/EMYrtjCXpixTLXm5GT2sSXVrwbO2OjT7zJj5hIaf2YIJrnyWXjKxVUYPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxYAgd26T4mvBlJ3C7fe2jpBK2AFOCIdOfjBBA9O+k//96Wa2
	HMAINQJTyaLw+ivL7b7egxdalKrNbHvVZGrgMsknJtGL9hSrE086fHjrwq8YkaUtJ9CJRHRThTy
	qBnqpHYXCzT8l5d3eYyIJXRCWwxojqv0rwmanUqQ6j+O365LSH8ExqxEJLJSYWJh+PR7aUsgWxC
	v1XGzTV45t3E+v4/M5x/xYfHIgMk73JRC7Op9drFDSUA==
X-Gm-Gg: AYBFou2xWCkzWqY3de01DlJ0dKXu0KVEgVthJQcOr9klcFHUQdP68tTyd5eDapvvLmi
	S/XTF38/x87reGV2MSYrP/vTMGK3MGOfDKp04o4eE7mRwq0doEL8mFo9IFZ5jObC+hq5ojAjgJx
	fxp3RuZWE4TOI4Rn3on6BGmjSZyNk8WzHMZyslMN7695XZr6WWXvQwxstpZiyeXkiYGj74p47gt
	jHo35FAdiaggqaEQzzO8TOsnE2nnQVFs7X2rxbVIyTPelZClDNrkLCi40CWMrgv32FHVZHrV6M=
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id af79cd13be357-944214cfe6emr2450264885a.4.1793794973651;
        Wed, 04 Nov 2026 04:22:53 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id
 af79cd13be357-944214cfe6emr2450260885a.4.1793794973130; Wed, 04 Nov 2026
 04:22:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
In-Reply-To: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:22:40 +0100
X-Gm-Features: AclHuK-6UGyqTawQ41_TfIwEP-0YIAdV-QtuDRMs9UNfsFep-kXTj67L-wbAe80
Message-ID: <CAFEp6-2xed2JR-kX2a3cbTTtTF3nUX7rNS0hKMew=tn72Tv1Og@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Fix potential CE configuration leaks on PCI
 probe failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX3Lj0RwcjA0pn
 lnSKdEptWXr4eNRp9HX3NZxzh9c1ce8hrtW7teDiKifjRaDjuwPMzShYNf9g+aXO3OnVdA8Ibg2
 /UV+7pUq+JtRVjgshdWP+2h46wK3lqAJ0fqvbYpyryDx/QrU6rC3tiQBymaaKMLt3I99VG8T2en
 0z2M13C/hdiCTnwwECnEsqIQOormbYGeCY2riiJRDMGNg3wVCmVwOrynKd66+anzTbiCoLyjgSN
 J1+Y2PFDmMW9goe+ca9bOCp1B7Muyf8oXzZEcByF0HzKBXqhi7zR7wQoDuYufa/mqV9voE/t8wI
 OieU1BpiXXmXhQH2Q4VSMM7Ai9gh05O2v7bRE3vZQlSwdYJQBFLmhxdjcOFqbq6o51+UYqa7t42
 SdX+ZdO8dqsDR6HZ8/pkevW1PlBsyM9Q665zjdNayorgqi3nz2vI2cryjL/N616sxzSJGYd8Kmm
 k3FzFJDoSOOJgoNmJtQ==
X-Proofpoint-GUID: 9u-EZ19yRJ8-bW6Dj6B_-VHW3ja9WPIW
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb239e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=DVFfUGNISCTMBdQC5joA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX8m7U/Lpg9TqM
 HM19IYcL7nb+GLrCgOnY8Xa4xhGkcjjX8YULXDajbInP3X1SiEbYFvOudb5ZpMU0T0cCFtEn+jC
 arGngrW47jtuAurd8GIAemBYCx2Nyi0=
X-Proofpoint-ORIG-GUID: 9u-EZ19yRJ8-bW6Dj6B_-VHW3ja9WPIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

Hi Guangshuo,

On Wed, Nov 4, 2026 at 3:34=E2=80=AFAM Guangshuo Li <liguangshuo@mail.sdu.e=
du.cn> wrote:
>
> PCI claim, wakeup or IRQ initialization failures bypass
> ath10k_pci_release_resource(), leaking the three configuration arrays
> allocated by ath10k_pci_setup_resource().
>
> Free the arrays with the CE pipes on the common unwind path. Keep
> the later hardware cleanup separate so the arrays are freed once.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device =
probe")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=3D1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>
>  drivers/net/wireless/ath/ath10k/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488e4..f3c4fe13f76b 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3716,7 +3716,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>         ath10k_pci_free_irq(ar);
>
>  err_deinit_irq:
> -       ath10k_pci_release_resource(ar);
> +       ath10k_pci_rx_retry_sync(ar);
> +       netif_napi_del(&ar->napi);
> +       ath10k_pci_ce_deinit(ar);
>
>  err_sleep:
>         ath10k_pci_sleep_sync(ar);
> @@ -3724,6 +3726,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>
>  err_free_pipes:
>         ath10k_pci_free_pipes(ar);
> +       kfree(ar_pci->attr);
> +       kfree(ar_pci->pipe_config);
> +       kfree(ar_pci->serv_to_pipe);

I understand that ath10k_pci_release_resource() is not entirely
symmetrical to ath10k_pci_setup_resource() and tears down more than
what has been initialized at this point. However, would it actually be
problematic to use ath10k_pci_release_resource() in these error paths?
For example, is there any issue with calling ath10k_pci_ce_deinit()
when the CE layer has not been fully initialized yet? Using the
existing helper would avoid duplicating the cleanup logic and keep the
resource teardown centralized.

>
>  err_core_destroy:
>         ath10k_core_destroy(ar);
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
>
