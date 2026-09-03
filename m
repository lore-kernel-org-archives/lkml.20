Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4143CECB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437589; cv=pass; b=NTkWRFZsDXM4gCncZezazm7e3Nf+HpbSX9B8UtiaXmMSYeL8duGr09kbfgBTvsqrgDOMOLYUuV17OVAq6jcwe2PtGnn85PCEoC1a12PE6Dw/Tk4wS7jbq1cBQ5LPIb6tbzXhRYYNbgqkUo/xriFXW2s9ToZzs5yjVXuwLdqwDuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437589; c=relaxed/simple;
	bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buiHOkQrnV0+I3bdIuiD1yFwKOGB8yTuVjAE4ZBccWiQxRcJkS0WAc+rsyKYtefpW3cs/W9uTOiwXgCTqBXjMYAvSBafAxw5EHWY7oYHfS7+vjJcGhLWm1hnxQQBsylLV84oHqu34snzC6T0qM9n15U3sqT4l8NqvtWn0a22YH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiPv4OR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6pURTlZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiPv4OR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6pURTlZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTNGc210415
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=; b=SiPv4OR+84hEgH6l
	RPDmsXUNwVS4Vz7tInAaqyOFtAWWmW/Mq53+MMoW+ppSEyHti73UEj+894ftwZTL
	ZQdL2iCEsYxQ3wfF5+F4ZNAQfJ38Qp3rlb7p5uSzige/fReEKt9tMyc4ICm8s80M
	GOXJ0gUS9XtKZpZ0JYlmIc90m7k+5RoS5AE2lZ8hUPRTnU339LhruDV2SCfAuURo
	QhX3fLJjP+DifKMlYSPEWu4gfqkcPsGf6QESbpJD1vLRl03dphAR8fUY8TGBqvdC
	JwZZRlXUo4mdUzcBS8cwxEU4pwTtxspFVkB6Ay9QpG1UlyOhTOsJqnxfWXjluawH
	3hW3kQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k85eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:13:06 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12abf0e49so3150506eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437586; cv=none;
        d=google.com; s=arc-20260327;
        b=PC6MospzncjhDmjYywyO2IrDH7KCdDVKkH6X8Wrn7e63RdQDWlTbfNI0ZX7V7x5g0g
         zWG9ANO2tPmnMHgs8F4ST2gcnHCybWAy0kGzamrRfgJASiDlsiZLDOdOCJ/HueCRxZwQ
         VWUAu+7wUbKaowa41kLZ5ItwFywycNzgaJq4J9hcMQqMtr3Va6eESpdRNEg47ZFZESxy
         FdJiC9+FNcfYs6tnLaIl3ODZo7/M4amvwgLNmWNXa9bYu41OI2L01wOlf/rqsJS9w2Mm
         y75/fSF1+yM269tpPJUS07URVcibAwCGA4kcADRqtphrL6zjhVM227qsJSZUMxl95vwn
         pIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        fh=c0FVTwqOr75dcM2gTOb7C6oIttIGytys34e0AuZORBQ=;
        b=nt9CbK39DWqeDtMp0OiMlR4v07of1qzeeTYjVOuRBq1OnyckcEWKIVGsNinG51ksb8
         wdoEYG41c63L2wEbi9eW5U/LWEgsNdZBa/frkIZIVT9VAOLIHGv+hLRT+NyGToejAprA
         DqQmx0ZiOkzcAV0/8BeZ5wFOqYSyh3cMgN1ARkuC1E4EGAHLjZWi9CxzvZDSxbbb8a5f
         eUIa+sAzLkhUv/bFcZOgxfyK33fzqr3zBiN8i5HpA6dOderklXqZ5GxAbXsnL2ePbxgJ
         QzgSOIruwKuMCeYwMStm169Q9flUa3+R3IQFbWXS4xtNz6PD3DMoNL4kiH0x8szeiQKx
         wqUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437586; x=1789042386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        b=W6pURTlZf3b3uJnaOP/MUFdsMve15giipOaMoCfjg1O6lzZJQ/YCeKojhv9QxjL41I
         9gM06nDWiZQx3xgTlpSbqmGDdq6GOvE070ckMjfg2Tfrh1JnNVKH1mmkw7vr/wgOhiGz
         aIRCyiBPFWkKsZlCJBNCa1bYXcPq2ECdJMSO2A5IpXovtdwxLq/2bDdFl7YpxRi/XOJc
         PZuFYdI4pAM6eY9k4SQ330CJeGTKse3scqH8B8S7eJr+OvPdm2HNfYKwjLOHmX/F8dZM
         WjG/8kG2Va3rNCnKHTnQh6gV69+K4VIEEfqvBq0I17Q9ciXjgOqlIKGReJfssqnknWr3
         qc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437586; x=1789042386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCAsFqPyObwtdPuK7mooJ6bECLcZM9KoaNHChmdp/NQ=;
        b=HZxm/EVRgvy96CXdYkDJJwO59eE1B+dsDSB52Y2qhhJylpbDiJuSXt82ym8IR+uCI3
         xKSAwY71Rg1W4FDShXa0tXjZ3pA/aw1IlVvF/olEYt7dtGTJYkTcydAxpF0uUIRL0kXR
         NoUGYWwec+ThUkQ+2u2D9iBPnXChkcHVg+PnXJZt2k8FsgVlUa4cLrq2CbGXRnRgYP8Q
         E3l6SFr/7yRxbQhex6DEHspnLFi/70sD9ApKthUuNXUPcKhhO11Cc9oexwZ0VJyyVOmH
         XpOSn9B6rkhl4QJzY1OIdDTxoKHw5CNeBhNWnYScUw236p4wJXJ0kEUXY7ObAK7TQAWd
         siBw==
X-Forwarded-Encrypted: i=1; AKwUvBw8CtFlRUDWy8Vtsrum9rZ/mCnF1ttoXmrMzA4KIKrK55l4TSIv+DJ6Wui4xH8OVcl9jB1sb3xRZOPAZ0U=@vger.kernel.org
X-Gm-Message-State: AFuF++kqB31+z5tXwBe8C7/x8RXBLds2cLKk4uor9c0jHbk6kKgwI4F/
	52g9GNyYETxDkxAAXGvrV0mH2ZRLyc/hcP9xL+V/eEDnn9hQ/QxAG8yIRgqsgATyjrG0+Wz9rnD
	Qy351dQU/ckM+Vx6UD96rVHG8t4uXVdSDQQKvD2A07lwDFzZjn/6J0LQjfHgkmNjp7L5Uw2kiNe
	xDx8nzG0q6e1mIPABaPKiUE8AhyskQekL2eob4xXQheg==
X-Gm-Gg: AYBFou34PCz5KPPtZfl6MV0u8VihnTC92YN519ijvGrs1M0AvICbUlijnjPfjXKOuZH
	3RZnm9aJPtCoJaL6lbtBwqd6pTjaq5vZX9bQqpnnMIxUnxe995Y55c5/8hd0BwUAvIHAuSHCYgv
	mETCqCxmWY0Iq8a8WZp8Ci5Tabea610OhGLz2boofeYUQXblpFMcPHR30Syg==
X-Received: by 2002:a05:6820:2d08:b0:6a3:92f8:96ab with SMTP id 006d021491bc7-6b47ecce067mr9305166eaf.1.1788437586051;
        Thu, 03 Sep 2026 05:13:06 -0700 (PDT)
X-Received: by 2002:a05:6820:2d08:b0:6a3:92f8:96ab with SMTP id
 006d021491bc7-6b47ecce067mr9305119eaf.1.1788437585657; Thu, 03 Sep 2026
 05:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-skip_suspend-v1-1-ba2d877e22b1@oss.qualcomm.com> <5bsz2arpufrnbglizghlr3ztkjeqhvsc5pr2qmgmkhj3n6l6ia@atgkmc2igd7r>
In-Reply-To: <5bsz2arpufrnbglizghlr3ztkjeqhvsc5pr2qmgmkhj3n6l6ia@atgkmc2igd7r>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:42:53 +0530
X-Gm-Features: AcwNN1Xjdf69rGqtBAINnrwGBccYKfXH5cndtne3yrRdPJSmPRATyngrRU3ToFs
Message-ID: <CAMyL0qOSUzMjqMgVuhbHAT3oCfAQ_n2mtq+9iU=ZDC=y_n438w@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Skip system suspend/resume for
 firmware-managed PCIe
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Rashmi A N <ayiluri.rashmi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: IGHMY-CddfDuUaaoGhaQKRfyTXLj5sz_
X-Proofpoint-ORIG-GUID: IGHMY-CddfDuUaaoGhaQKRfyTXLj5sz_
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a996452 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=Nm-cwpUMS-KaPtIAedgA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfXztDQIdRv60Xd
 KmW+lLsRU21NJfVczC+eei/C8ZMNG702AuqNncgBy9PJS5L4XshgvfqvAXx1UzcNhCpecJmsCMp
 AcRZOeI/r59NGw1HDOl7duKUgb6Xs4qE6h/ylEjfANaFNIe9hJ8vOPqU+vfHAzRkLGNQcoibjIn
 TVMqg3/9UwcAIF2Y4E0WIgqSnIWHr0qrVjwUrRlcASo8oK21U6DwSKy6Blwnf2CoZwQ3L1QDyp+
 ygbIwEmBon5m6hROxA1vwjQrWIQgaNfXERnVSgLprhFzv2CG0VIxSVEI09yBX8iaRLzKgCW1Uu6
 tiUqG4Kcj7ZDDklwHdTig0n2yzumNdPkngaNDZwo1z3/O9o7lkKd3v14TEMrnBeVP7BpyyZDvqf
 RUqQgqiWcSSS/fiATcRR4uaYG31LyPhb+rLi+GuBPiOv/ItvshBOfOrhJ9HJZorFCIKpcN9Xi/P
 4pSv5hoC6ytd1Z/edCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNiBTYWx0ZWRfX4E7TkHummewI
 4egHPRGk5CuLtBu3dp/P0mNVnLA3ieeWWYgm6UkqpPUl/ANuHsftcrDHawzIsER5ZoYA8++VEVp
 fivepZR37qYC9JLgh1eyklzzeHkG9Ps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030106

On Thu, Sep 3, 2026 at 5:05=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Aug 31, 2026 at 07:07:02PM +0530, Mrinmay Sarkar wrote:
> > For firmware-managed PCIe controllers, all resources, including clocks,
> > regulators, resets, PHYs and link state, are owned and managed by
> > firmware. The host driver must not attempt to manage these resources
> > during system suspend or resume.
> >
> > Skip the suspend and resume operations for firmware-managed controllers=
.
> > The associated power domain transitions are handled independently by th=
e
> > genpd framework through its own system suspend/resume callbacks, so no
> > explicit action is required by the PCIe driver.
> >
>
> What about the D3Cold sequence like broadcasting PME_Turn_Off? Is it also
> handled by the fw?
>
> - Mani

Thanks, Mani for the review.
Yes. The firmware sends PME_Turn_Off as part of its port
deinitialization flow and
waits for the link to enter L2/L3 Ready before powering down the controller=
.

-Mrinmay
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
