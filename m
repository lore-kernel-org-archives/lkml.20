Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794583296;
	b=OOy5aF6Nh7QhnktBisdQ7RZt7MHXbn5txXMXkNfJt6uQd+JVTEfME3sr9O7ZYP53yEqD
	 TWhKDfZj6NKoDc0P4hLzX1bAr0fq1tqBl7IvSRWrNKB3g+slJWEnpegeFnyd1xIdstp/c
	 PoHU7cvSfdensRQp+aCYNiVytbmtIsLdDWK6OrV6ELti6D9wkNcPf2I5q8vE4NVsl2p8n
	 fjDd4xDFEsEj03XOuzm+OeYz5Zr+PfjJ2i1jTcYHEey57M03BcP9D0xUwiKQ7eAcAqYM4
	 8NRUCM9b5bYRzVtde6raQRFMlskbBEalXwOG/34o0pn4OqH6dxEIKHtocLcV+98bHyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
	b=TUGJPSb/vwWX+kLTirN3GwFVkaGIzKH/EMMkSGUGOREQ052gUGoYMXLJX5OLGh/xVeLT
	 i74KX/j3VnusdoQO8aN8iGFqzEvhHDYz8ox4dYEjFjaOUt2+hqzMU4PsuZI6YeJNAJH5A
	 ODJFdTN6QF6IM4h4mk7L2ELkVafYIoHOsuNduC9kAquA/HeMEQT/6k7/XQPXkkxHRkvYx
	 dT/IKPtaOTS9AuuCCDm2edWjdtn+KFXp0s4mnhEHc4e0aoZMhmG8GQNg1/EAg5kv5h6pA
	 7831j51uy/kRbiYaU3jWuJymIJb5aHx6UyK+M65mEvB8jdMCYBEUvtl3+gz8So3jB0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R62GvGOb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clBtZSQp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56297606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56297606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R62GvGOb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clBtZSQp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcFV242581
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=; b=R62GvGObSKKij8es
	xl0IUxjIKVy5igLKNQ7usayh1NReBI4OWX0viyH1+kH13L9yKg1IA3OAQPlo53x/
	rqGPkv71NGhjv8qSAMxMo+Kl2ur1YKXTA5ZrjfNFOFH/oc98my+xU1YdEW4fwBd1
	1kZW5pEfcqO0SleqqdzRp9I6uMq/geWcCuMduJgss58viE8w3YvqGrpktJc7MwkZ
	BZeFkNeNq0ZgWiYOGzUv5DbMw3/OBIaq0au3hU7aGswJdUg+Dd7U5jKUMUZHv8Et
	EBmbzo6E4QHsCl2QIs48gJphtp/d1Aq62HC0XmJwlhO2551YhIG5w1dxmPLT5hJl
	fxD14A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j3mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:21:35 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso1359271b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794583294; cv=none;
        d=google.com; s=arc-20260327;
        b=Ae8fcBC0IaV8xFN6rMF1MKPeg1x9IIwZHwRlOEw7QNKp9L2zPdwvUnFNe3Kve2d/RP
         0DtmPGE1VcgBn/jANGqtcPa7JT69Gz4qUCgd7ZxCja3KVOAdxnNsMXo+Zgb3I/BjBmGG
         ++Y/h0PmIqb9wt98B7hV45l9mNzmfwRdBnfbuWbafjrS/31oKlX5ndu588wfscQQZSOR
         42m8PwtVe2ERWZAgAcmfCbGRra+gl0nn+AjYvlSCYUGC3cyNJ6oyLQOmkMa7ENvfXeFc
         BhmhKSmaLmWqgj8sTioXeAPePRA3nd78Pf+CnBeSY+pNntZ8WVXUV7cogmQVxijEHVj2
         GWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        fh=0GrSp73TgodSHmlmiejXqF44hF1nHPUQ+WlUJqFvGW8=;
        b=Gugr2GgLmg+zFr3aLCFcixM8nRf0y7qF8+9h9XaC+/I8Fevf3wCbhBBoSVbxo4Dvzn
         xzxCHOaYB0dzIqOTyLRO4tUdKaRLntLb+4Efnd6tF7rfk37uFL7++IKevMWHUm3jQIdo
         VPfuC3XNPft/a2q1VI0wlnjvvXK/vixzLIbvOXqk2FMhdyp41EZArdYuJPFd54p475+Q
         l2TsCBdNYU8i6yrF1aG8l3/6mzByGIrxn7QJGysSvWH+mh6kjoCEbgPmYmj3CMeB8iDI
         tx9FcA8n0DIpN3p6HW8BnhN0jXsxGlrKXJ2MJea/+Cvh0u6NPwByBVdedRn+lZz2Oy8J
         QQqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794583294; x=1795188094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        b=clBtZSQpDsXSj5PvfYpZwSGHhrwv2MUMC4ssl7JQtw5vvH4zeckRfsOhyQk7cC/uby
         RvxPySVSO5913eN5i5JW6PMbq8iRG+kF0c1q0tNwOPF17eRd+YURDHWH9xbokrRZkzaG
         vPZPO2eMYd0hjLqEdOFklJ+fG3aiAew6CTvVMqC6rxSPQ+VI5+hYHJVgfLtCLNtzc53B
         v84BigmXrIF9h85+POrKMAH9X0+AXa49kijR7dXJfcfy8VHJkT+lH1d0qgyh+8h1SCXY
         0EJG3m9AuW2bCRrOsFJiVyQywr0mDfQ5MiZxXx7guJmuq5pvT0NTduDeSRX8lOrCNzbT
         BGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583294; x=1795188094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        b=WPR5oRwnwqsFjxi4c2Njf4uIQpyCl7EQr42UReaOE6ZVEXy3poPaVjmXC2EiozNBUj
         Kn7iCzWmc3YlIfD/54MbyANd7OQaFHHfaqYlZgC1YyxYEqgx/hTu2zkRVII8dLFKD5Wv
         p4QDpuqnihcOW8I19DL3Jx5c9Qzh4R8uA0DGQ5AoK2QELlkLmPn37UW2Qf9Tyv3ZwWj0
         OBaX/499++qLeQc/gU8bSVfTjasn8jvfQeV1HFMSPbFlDDRt0sP3uWgh36GwDaKWxwNs
         xvjpVWviE2hBSCV6bDLqR7Iy9p6huodVYaORdHfRc//mhOE9JCI10B5B5yl/uvAEPnxk
         kQUg==
X-Forwarded-Encrypted: i=1; AL+hErEGNSxbWu2Ul+DRlX+cSDLSyFLgoGacBUWG1DNx/2SIWz5CNrqZpp9VaYhcfnnG4zecfE4kqB/CbD+r/UE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K0wbHmcVmRPTv2j4glOMkMBk4e3C4CCywgj3uEWikcIvXDikR
	BcFNr2Po1W3n3u9m5RZH/t6eFD5OxvGuRj4wd+BIrVxeJKXEoaKdCxUeT26L6IoK/Ys3pY3qag0
	55X8KEKgYPCyzapwmQK5vAw83OJpOl48MBryWR/ijddKX0+URkXgstYAG65B8IKE3GQ2oM8C7nZ
	rzZJBUGb85dCgXPuVdOpoAy8y2QUWfDY50KRgyHV5nEA==
X-Gm-Gg: AYBFou0Nmwn8ttarVA8BV+i6bg+XBavOVswh9RV7B/W6RFtpFia+XTMTTNRG3oCE/5K
	9Re6Ryo2qaVheVIPBm8klGD8QJFfgPIUrYgDZGV9ofOm/2vwMwBJb4ixOFU9kRyJpN8y0hCVdjY
	rYaG0XPbSNvcD0KtvFEHC9GlowiV/EAfYtVXuRd72fn13YvkTpt+KS1aywOqYCs1qlf0yiIO5ka
	4bgRANEvpPO8esIifvF/7/h2/t2rTFHXLviyC6YwZouVGdgiDcB6zz6kVkDdL1SQnzCYrI/WFQ=
X-Received: by 2002:a05:6808:181d:b0:4f4:73a9:f853 with SMTP id 5614622812f47-56e611df811mr2085688b6e.1.1794583294438;
        Fri, 13 Nov 2026 07:21:34 -0800 (PST)
X-Received: by 2002:a05:6808:181d:b0:4f4:73a9:f853 with SMTP id
 5614622812f47-56e611df811mr2085665b6e.1.1794583293886; Fri, 13 Nov 2026
 07:21:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113151940.2922539-1-lenb@kernel.org> <7ce7895da501c3204416b69b0049ff488904f6a5.1794582108.git.len.brown@intel.com>
In-Reply-To: <7ce7895da501c3204416b69b0049ff488904f6a5.1794582108.git.len.brown@intel.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:21:18 +0100
X-Gm-Features: AclHuK_0UjCIdqCIyIhd3UJgroX3dB4L8LjioVSu6odip5Gimgv192l9aPp-fJg
Message-ID: <CAFEp6-2sE6bAWRSsjeLJYLawcc=N4DbLZq2JHVtPrunG10j-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] bus: mhi: pci_generic: Prevent MHI from aborting
 system suspend
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfXxPpZ/nRe1vJ5
 Mf9UnXNTYYMhbkbz3gauPTNtvxZ4Y5+lu85EmXauI8ZlQHKRsWuwsKaNuLFDWgDdiqYIgxCyxXY
 UkhkycpKPlFf4O5WD65EMG8n9r3uJrI=
X-Proofpoint-ORIG-GUID: rHL0IPTbkr1IJ4NYp6s9L2WikPaa7pRv
X-Proofpoint-GUID: rHL0IPTbkr1IJ4NYp6s9L2WikPaa7pRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfX5yrkbR3jBLGZ
 LNXPTthfK9xAeHVI85sq0rXialOp+vVbyTVho9fqsXUh75CaxpECt3PP0hHJAMKtgjjN1+xfRxX
 pzJcdO/JBb+PuGGUsiFUlwxCu+lOxSLqgSgO8CiArPbsTX6l1Q924rjFZpHOXvInIQKBKG5eco6
 5VQSUFekhXjvj+iDLgTnr+H5LnfTIaoQsQ0vNbCAEzRG/UC+wfqmJNYw6qrlPbA5nwUxFfC5exV
 IA73gLN+XV5gGSPlJ3buI2BIBv35vzTndmrVDdApb44Z2y87jP7metE+M6+Y+FcYdA+RZH7wUd0
 Y5+9xlyFsjXgStKLPCQVFrBn1+vr4HLjGXoYnc1FxppwJUtrqDfrcaYrlpzg2KaQscBaSe7Dz/r
 rBl2474D2vlTXsDg7DBdU/3OiWMh/+g0fszvHQEI1J6JKUW2g87LHALNWhfEjMdeGkY9SQAXAq8
 L91/yx+nL0ssOysg3wg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af72aff cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=YEmDlaeyN0JEUVdw9q0A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130061

On Fri, Nov 13, 2026 at 4:19=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> From: Len Brown <len.brown@intel.com>
>
> mhi sometimes aborts system suspend on the thinkpad T16 gen3:
>
> mhi-pci-generic 0000:08:00.0:
> ... failed to suspend device: -16
> ... PM: pci_pm_suspend(): mhi_pci_suspend [mhi_pci_generic] returns -16
> ... PM: dpm_run_callback(): pci_pm_suspend returns -16
> ... PM: pci_pm_suspend returned -16 after 15145 usecs
> ... PM: failed to suspend async: error -16
>
> Prevent MHI from spreading this device-specific failure
> to the rest of the system.  I.e. "Why is a modem that I don't use
> preventing me from suspending my laptop?"
>
> This change does not comprehend the internal root cause of the
> mhi failure, which should be found and fixed.
>
> There is also a risk that ignoring the MHI error and continuing
> to put the device into PCI D3 will leave it in an error state.
>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Len Brown <len.brown@intel.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..343d1046a25e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1727,7 +1727,12 @@ static int __maybe_unused mhi_pci_runtime_resume(s=
truct device *dev)
>  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
>  {
>         pm_runtime_disable(dev);
> -       return mhi_pci_runtime_suspend(dev);
> +
> +       /* Ignore errors (e.g. -EBUSY); a failed modem suspend must not a=
bort system suspend */
> +       mhi_pci_runtime_suspend(dev);
> +
> +       /* Must return 0 to allow system suspend to continue */
> +       return 0;
>  }
>
>  static int __maybe_unused mhi_pci_resume(struct device *dev)
> --
> 2.45.2
>
