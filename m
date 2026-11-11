Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398648;
	b=qzP6ezOWhH0XHJ2Y7ce8WcOdXBszpwfsKg/8Cm63NoevICpZ9PGep27u5pfuoHvJ69zz
	 lX85rKSAG8l3XBbAljlMbnBrm1F8HEa0hcriCqBpuZIS2fJB0cOOEZP3rDhkpruPkcwdn
	 z/2g+jNnwe1vrRp/hS+j09LeB6Ln7IsZwa2K+E4FWunwr0IZSh7UPyMiSm7JC0eBjMdtW
	 tHhUunP6D6ug4iGO59jZg2QneMAry+5rNhyRwjqedOIgOBI+xIETG7lIjAvI5gKBTkpEy
	 saEqQ7zcikYkECG8eF+KI/m+BFgSyVPZFgM9DewhApECKUQL51K8UBQsTnyje/TV32w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
	b=L+apPcPefETgPan14GA147W30XqwkstBiIl9LPf0u1uPy8MwnLGMc3BqFjeiFm4+fRsX
	 DVPdCdjwWQdEmFVDDEVYOj7y2YvdAu5m7cPpZEmy2dnalr8B73JPSzadcuEtKeVyYK+5N
	 PzU5ee8xH5O7nCwcLeluSRG/O3x8b/FNUXxaAKvQ4BcD6kYtsQC0O7Zk164z5GNQFgdLr
	 uWstyzXU7+sM43hu/AE4+maO1F9YbGaNTGQo9hy2cO7yGC35jgAGRLJGpfwLH0UvDsSjL
	 EtFY4Q0k+jJOQz2oDfEpcv1Zo9X8cmc4GuHWh4fgvamcn2fObEus1qRMXx47xCj+uaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CvY2lH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAcHUnVk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DC606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78DC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CvY2lH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAcHUnVk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABBQiBx1409027
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=; b=X/CvY2lHnrvPCeei
	JRPs/8T6Bk5CJZOtU0EfTBYOS2lQmbTIVqOzkcqcqrNmsyZBuVmgUrDGritvAb+C
	xnmv36+J8fK4+sEoG4q97VH7WaUXP4gs0TuJR44UFCW3eooQDoDDZ6zRCV3bquGd
	U+j8qiiDNbWf2e5TzRLwxYgxASRCi6I3STt7ZMcMvGTZeBdEgVk19dnU/aUdTHeR
	kE1WWk/0UMYpIUG31V57uBShQCZcZjFbJZX1oWPV7v9xdi37mIZ1IO/2PDkjQT7m
	XEpXLPS+lfJYdvABe0yY8KfH6E7qcKT8lOp6JwJd+Hopj96CS01nt5iHdzKTNO3u
	3N30ig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhqpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so2440024b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398646; cv=none;
        d=google.com; s=arc-20260327;
        b=p0XD07WD+OGdzUY3alIG8jdnIhB4/a9DtnmSRiH+akxp8386gjr1CIk3A6Mn1//yqx
         1cY1eIQLpP3aOWYYQuDVQJeN6OmDeNhXhnymn9Jpza7P+Cvll+ES4VNp66GRlX8rSj60
         2rKIqm0Ay3Eozt82sQ74YHTHAaebIrpS6BcROYJ/CV6AbOX4cknvjcXFg1NsMhgpeAWE
         0Bh091j/3MjmG9Cy48Vn+K3SKjwSj+qqd/19jWDhsTlP2OfTXPIlQ6zeu7wo/ZXILOFa
         lHWcLbAZIDqw3gGcb1t+b+DX7rEjEYvFNMR8bj14XuiCodfIiCHpT2bwZBb4LTI+4DTS
         C4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        fh=4VYfYXvMOOUYQI6xZDyVwsCupYnT/KgGjJFSmBoq6ng=;
        b=N8nNbz3REmLbVyBZQdQ3FRDLI8wCN8jLsDedTqm39ucZ0QRJKtdee/aN4l7idpH0kb
         HrCfjR/lmBtuQLFMzC5YjNMeRe9GbUYetm2wJJWQCEp+maIL7ELxNj+OIuS5PwPNG0Qe
         wQ6NI0t9dqWJPQ3JDXzXGgRiMV9+MrlXz8jGk+jOEkQc/HeTQo8qfj+6VjxrmeioY2B3
         CNZAJaMxOqcPZdDFPMgMdIrPcYTCEiFwTiKceEAAr0FPX0peJ3IqniaewH2NxyTNvnlL
         /DFpssbr93HNaTiouxPw0oINlppgreCMK8IdzFPZyFap6mNN8f+HCZaOgCUB3ZcBHu3y
         JhEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794398646; x=1795003446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=OAcHUnVkbsxxCk9J1E5i4npIqER9Dolx1heJL/EnpuDI4PHROFyn6XS6Hy2JkVmObm
         93gXtpZ0pYlVfLgAE8i4B+eiGE0preKtX8CxNkWSJwGI0QKxAO4woewt6ddqjzSGJrV6
         kL+qrkI7jNnFX6U5Dx7w7LRbvcRAZfcll0lpphPkASGhs3J6nmUZjNBNK5MYxrWNGvhM
         fEMEZ3eOk9aTnErj1aUZqWSWIgE30ocr5f2MlWsXw6J2lTQFMWxcnzoYLW66ZMJrm2U4
         mgqaRvefOBOXF5YeWJBFaoEgNc0WHRW5Cd1mpKWY3oUphqQyvMgK8+EMCyAGk9RiJ649
         TjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398646; x=1795003446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=HjoPLa/IhVdiCTyFcxMS9/L4vbKeJNHgZUsc0jkd+H1ch20MIKqLZd0InMaeSI44bS
         dXdCnfo8Vxw0NH5afLRTABC5b2/nf8myTOY9EYhQ6A59VKIXcAQSXDja2AvZ7E3ThUu6
         dQWku5b3rIpIOE1wbXkGBm3pBakONs/a9ExcWcgpdD51a3eNiPBtAIsv7Dsk9skuKv7S
         iT3fj5RZplbtkj3Khkyeb/CmzGFxrw9MndEkXwEK5OWN4xCG+T7vY5jlIXGfHwz7Ihra
         ofGpqF4vQ3MKl9tMTzQzjFo1p5BpSMFBucB6DgB+p4RdJJz61qeH160N2JuEwLSAlwvM
         Lwcg==
X-Forwarded-Encrypted: i=1; AL+hErGuVreD7qXZ7I1PZnFZvCQ/HnOMmLK5Zk4KzTlVCnv8lbP44W7stNfw5G/v4T3MKbBExhF/caeG7anYNNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T5nPpNRHhDKHj5Z3p9HBzvhGDMBdec3KOz0ramTpM02p4RzWY
	8fQTTS2JJ7b62PyEddOCPLVgHqy4jMulXQzxUfNrM7b73EPFcDomVLSzORZTNihPkpL3/HTF2Fc
	HoDpXsev+Y1yYt7r8AHyfkItPSIZiVlQg80zZ8q4u9S4IeRj33mfd+NP+gXRt4tX2v/6sGdfE1q
	r68RBPAUM1aEscHi/uluO22/2zm/Y1ggYSCvtFCff8uQ==
X-Gm-Gg: AYBFou0wc1JzvZpH+0wqow3tyamO1ohJu4GV0urD2JpLyRy/vHrT20jc3lJqxrH4osZ
	DRdnerJiM/56d+r4cWmZOtD5l3KsfIVKsvRBChpQ+ABVHOj7Cq20FdIimlBhU2HGqbWpZGTshKf
	uH3g6JCr9EWf9XlyZo27XElULRblw7jiQwck9u6JiQUqaGAPH6n09KO9GYBQ==
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id d2e1a72fcca58-8bc1cc6842bmr2465036b3a.28.1794398646212;
        Wed, 11 Nov 2026 04:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id
 d2e1a72fcca58-8bc1cc6842bmr2464996b3a.28.1794398645717; Wed, 11 Nov 2026
 04:04:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHazNbGtMQJ5pV@sirena.org.uk> <20261110170253.2694265-1-sashal@kernel.org>
In-Reply-To: <20261110170253.2694265-1-sashal@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:03:54 +0100
X-Gm-Features: AclHuK-TQiAr8PSNCnxTwZnldPhQ9Cil9VcJUdagL6jktT0AFdXWIAAJvTIePqU
Message-ID: <CAPx+jO_hPY0wZHwE2QdryzgOOAPH-2C0KXZTpt=cT3Aca5d6ig@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Guangshuo Li <lgs201920130244@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af459b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=FacbNd98rA_P5PhHUj8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xcVRvcllAfD4_tuzTq4p2KCWyjOVr-pa
X-Proofpoint-GUID: xcVRvcllAfD4_tuzTq4p2KCWyjOVr-pa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfXxQvHchAOfrzs
 CNvXSt3TBWFia65DenhjX3wo6RV7ZPHMRPsgXN5MsgnXDOxpQa+Q0vPIKxbZChryJ9QbBjuOmPR
 5SCUNWoXPUBbRobve0mLYsQy+03nOGe3jC+0ITvptE2agvRfZ8ptduSp610Nc2I6UUKpBIJNLFZ
 cXrYAZuz48keOdtbawKVNC/WXGU3QalkdMYO2hulrSUx2XjDiDZblLSuM2j+/ElOMcAMzoY9JcF
 NdJLrmUxEXeP3LGeUbnAHudmbIWHS5sXFUKwRlTrXx8ok2V9GDi129ob+BqAV+aLedCt5TdgOz1
 7GuUHLin5GUdUzjvrzYg/6z+0z/iySzP1Q7gbCFn5EtWZFbGlyDhXJBdyhKEKxKuS120jtRMnmc
 lCsXoSEWjOzJK0zTQQ0Vx/n6NZqwGLLpn1thwtD73FZvDPtR9qlQ1VnK4xx92RbO3HXlBagUd+O
 5WND+Q/2S460hZ6u34g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfXwcKjHdKDtzx9
 UtJiOHe/0MrABNfCmo0wdaeTCUNv6UDvKBa0uyHkYOCvUCB7br7dvJLI5FVUjOT37mTi1zoNu/0
 /mZ94AsWz/z2amNRajHvONEA2UrrRUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047

On Tue, Nov 10, 2026 at 6:02=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 04:33:47PM +0000, Mark Brown wrote:
> >AFAICT this is caused by commit
> >
> >   d7262971a2acc (pmdomain: imx: gpc: remove all initialized power domai=
ns)
> >
> >though I don't really see how.  I have used the tree from next-20261109
> >instead.
>
> The while loop that commit adds to imx_gpc_remove() is never closed, so
> the function is still open at the end of the file:
>
>                 while (num_domains--) {
>                         ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
>                         if (ret) {
>                                 ...
>                                 return;
>                         }
>
>                 if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
>                         imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
> The patch was posted that way [1]. gpc.c is only built with
> HAVE_IMX_GPC, which only SOC_IMX6 on 32-bit ARM selects, so x86 and
> arm64 builds do not see it.
>
> With the brace added, gpc.o builds with imx_v6_v7_defconfig:
>
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -536,8 +536,9 @@
>                                 return;
>                         }
>
> -               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> -                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
> +                       if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                               imx_pgc_put_clocks(&imx_gpc_domains[num_d=
omains]);
> +               }
>         }
>
>         of_node_put(pgc_node);
>
> [1] https://lore.kernel.org/all/20260924142520.1594149-1-lgs201920130244@=
gmail.com/
>
> --
> Thanks,
> Sasha

Thanks, I amended the change like that and rebased my branch.

Kind regards
Uffe
