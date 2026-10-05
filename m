Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E034E761
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185092; cv=none; b=qZGAthoF49Iy/8iwNNnq6I70v4Y5qeWtkuSQVYpwg8bi5DXvhG1h6fM63he7me0MWLCq9SnA+2lOaRlpHxNhgMYaFE+CbgMMiAwlKs0y9hRjaTDNRVO9B8+U7FXlJ8g2ojJm3uaEMCJM8MtW3zDSG+tMBqUPFcS+qCWNmrz8qoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185092; c=relaxed/simple;
	bh=UYV+WsT7nWDf65SrpcjzcLryEAw+eQ2MfWVRTolVw4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJlA3W/rlTV3CbVXhXf6lf7eXJkKuACaF2l4v3i8mgh1ad9Vc93tQxYpWHKyXRAV+x+iF35w/G6eGBtPayxjAPSyXVlIy4gRRlgoPHFkAO4BhTqKHAuwwAIAZXWUELY7wwwJa0SqxROq/9ATrTMHG3XZEQJ3Eo3kCmirEqY+5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVeAhzN7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al21eYRe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVeAhzN7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al21eYRe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104SX3838476
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pLJxv3YiFVgclmQBFAlLDhb4
	f78BVLt3FB8EajMmMNM=; b=GVeAhzN7wgouEuNYU6KsJZUb+Tqwxuew5juR5Ycx
	84LTz87YiYuaBBa7ft9B7BAtA8cp9rYwecIT7THwsI8CtkZ6ay/HJyAsMVv2Smev
	9hYeXqeOqY+FgEJBHJXVlez6jE/XABaiaxfSEnZubs17w/FJcN0IE/UoT3gHd3hX
	+Mu84FHjvEcSYasYfMhBvqAYlANMeUxjFjd4ZwH7TtMX5R9gn9pwEtPv+HcQ/gkE
	1kmr+Vd2qzwSr/fZFMxm2+7Rbi/wL2LQJjgZfs7uqO9uP9G6ga/ybmtI37ZrkocK
	hRB/6NU9mAZI+OLOwmGSUiI8dA1k0/R0+yaUDaZLooNy6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08ms7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:24:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so145170485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185089; x=1791789889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLJxv3YiFVgclmQBFAlLDhb4f78BVLt3FB8EajMmMNM=;
        b=al21eYRe+1pZlYi4KyGB8xgYZVGHToOr7nSFcSRYvtI99tWnxt+wj8DyqxgYxqChxV
         zTycSiXDM7iZNIM65kHPakRcHZ0fjpnAl2HQUWoninHXYvH16nMVvjZdb8cR5JsAqp6K
         OThXgoPh6FvujnrU6kJHRrgUCqMyG030zzbKrc27MghtR4UInQBaL0o4GH3vekbjml0y
         gb3SrAw1ro0yRp0wPQ3+PpmstGI0ITFgDr3LJCvBhnqZUrjT3dUL00Leh1cgib5zgi67
         Wi0ghTdQhOa9rzs9vmpqAnDHK4ZOCVj1k/RfuZY3hqF1Mt9zwWsinlJdV/nuw+CLFCNs
         POwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185089; x=1791789889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJxv3YiFVgclmQBFAlLDhb4f78BVLt3FB8EajMmMNM=;
        b=Ohd9K/5GGf4J4QEa3J10DytBLtxb89/0XXxmg7J49LU6XbsQyQ/kNVt6HT4RG7a3eG
         98YDyXTcAhk+pfPwLVnnWtX/6pNntq6n9sKtAJzP1sFg2k8+sEQ+cLnV7Lo3IihgO4ZZ
         CgqXrvdDorpc+aGLWFm6oEnFiBjtHKToQdl8w6YbQo0E68CuSlCddP/j5rhFMAyvAxhR
         FNKXs1hlsK4WPc/C/U0bJa+bCJuhxkmQX7S1EbWZP0eoexR4KbDNZpZKrpS+7snZ2Dbm
         VrhSV9qLLp3JO28b/wHX2ov2h1H/ndSUtFBjCmAC3bco7l+KlEK2omrEZxMwM2axyjzy
         b5JA==
X-Forwarded-Encrypted: i=1; AKwUvBywVpBrtLcJJgubhuj1Y10MQFyQMsWksCdUB04fNeyLCs0zI8wEwYWXPPAXPDsACm8rXu//AE24Fs4aKVY=@vger.kernel.org
X-Gm-Message-State: AFuF++m16nQ2PeaAoW89sHoJ3G6q+bETbVDRMZ5NiPkQzWcknjcL6Hk9
	+B/gS1U4pBJNgttQ4992HvBaY0NQee3PMAWKXVU6K32+d2P4vbSiBEzv/l+Dg0cjnG2nX+RN2cO
	lYU1Zu5PciDKFf8rxxnMUFpaGsX7j+7LY9cpJo01KIGn0H7Xxu6b+JqQi3PFzi2swyuo=
X-Gm-Gg: AYBFou17cXwooZzQGOT+RfdlpownUab94Tp25sBlxxBaAl+G1MOlGgdiYIubtKoaYE4
	xuh+eWmv/Gum+5LYA0hsibryD2xs3h0HxRx0T2WMbd1mkZ27+94WxYdLJ/QNxINsGmY86zMgLsy
	XaRAmmYsV83YvIe2ZJPlDrL+EyMut0hRNUBjyxqXRR9wPg+ar18Xcheudlp6mcQTDQVMQKIgkxh
	pfZ2EmujRJL/XBSjb+xik0yUQ/VHgTVZahqhH2B64zggBIfilacPW77tRhIecHUw6OzWMwrSmu6
	voUmaW0NT+jYiXR363w9cxMzZ4AjuJxysDWE3zKcRoeveehbTZ8N089VxgZ2bdf3HuUzLoYKm6I
	4JV1TE9BkhxqyPSCeFPlqiHs/lDH7hB73I1fTH/h1DWKYInv6lK5Y9xAps6QX0gIBcrmHoIqFdt
	tc+KpDTj+T+5b3
X-Received: by 2002:a05:620a:198d:b0:93e:50ac:b12b with SMTP id af79cd13be357-93e510f4604mr1169680385a.57.1791185089392;
        Mon, 05 Oct 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93e:50ac:b12b with SMTP id af79cd13be357-93e510f4604mr1169678185a.57.1791185088764;
        Mon, 05 Oct 2026 00:24:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795bd0sm2961828e87.38.2026.10.05.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:47 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:24:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>
Cc: zeroknots <zeroknots@protonmail.com>, amirreza.zarrabi@oss.qualcomm.com,
        jarkko@kernel.org, jenswi@kernel.org, jgg@ziepe.ca,
        linux-arm-msm@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        peterhuewe@gmx.de, sumit.garg@kernel.org
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
Message-ID: <b2xdth3hkuypnvxlrgssnj4toffbceohhnh7w2ju46fzinflfd@qaq6ai5plolq>
References: <20261001055029.1960743-1-zeroknots@protonmail.com>
 <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J0Py-3Nsh7Xwgil4ZSPtcxlcGnsu3HON
X-Proofpoint-GUID: J0Py-3Nsh7Xwgil4ZSPtcxlcGnsu3HON
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac350c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JPaWTS-FHKQWmHC25SUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX350ImHC0YIv3
 2rfYVnR1/WE1IFJCXUTB3G4YcajmMNM6iqNwv+lXaGxtsPGjfJFO7off61OKHMPZ3xOnnm6+4jF
 y+UMbwYGmsy37XRbFF88SZpJ4znm/r0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX0sh2HFwC4dS3
 OTjhLDPffD7RWFw1TzR+wLmtky6zq9e/nI8dHz9uKRCick2oImHybhwCByix0O7kRsKdo0xwTCU
 cbrsRs6xhCy4nMfkhS2OZpHqDEwinfN62GBswfzx0Xg/WMFAwb4YCAicSesHoKtYG3IFlzbkUyl
 Mm7WM86te1R8Qz0VBvB/gJiQs/Mngo2sdQsZ1I97fGdeyUJV5VJdn9UnlF7O9/kULdd0GVMvpcM
 hdJR1Hdpr1ciUZYuX16gLpMuIAUOvEW1DxNhHGKLORaupAYqigWbZq/8GaLKBPYhV99sMKPKuir
 f5Um4SZRDMzlOzpdlIvop8zZC5e1LAwTnyCcjjcfolNGaZLDZYXNVZPL3er69q7FBYdFXklJBjz
 WCCqgWhnjRqLMluqz3HJ0aXYpE7VWcrwl6NktVAbO0xAaMC4vQNrFdZnPDJOUPjlXMx1CToz1lt
 CTqEL2WGgIZobWeA16Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:27:40PM +0530, Kuldeep Singh wrote:
> On 01-10-2026 11:20, zeroknots wrote:
> > Hi Kuldeep,
> > 
> > A data point from retail hardware, in case it is useful for this
> > series: on an ASUS Zenbook A14 UX3407NA (Glymur, X2E-88-100, BIOS
> > UX3407NA.315) the TPM TA is not reachable as QTEE service 81, but it
> > is present as the QSEECOM application "qcom.tz.tpm".
> 
> Thanks for reaching out, Kindly check below.
> 
> > With the qcomtee driver on a 7.3-rc3 based kernel, QTEE reports
> > version 5.2.0, and service discovery finds neither 81 (TPM) nor 413
> > (UEFI secure app). On the same boot, qseecom (version 0x1402000) works
> > and backs efivars through "qcom.tz.uefisecapp" (app id 7). An app-id
> > lookup for "qcom.tz.tpm" returns app id 1; a made-up name returns
> > -ENOENT.
> > 
> > The Windows driver for this machine agrees: QcTrEE8480.inf configures
> > the TPM service with AppName="qcom.tz.tpm", SecureApp=1, LoadApp=0
> > (preloaded by firmware). The EFI configuration table carries the
> > TPMEventLog and TPMFinalLog entries, so the firmware TPM is active.
> > 
> > Through that app, using a QSEECOM transport (based on Xilin Wu's
> > out-of-tree SC8280XP driver: QUERY_INFO_2 / SEND_COMMAND with a
> > CRB-style control area, here at 0x81d10000), /dev/tpm0 works: TPM 2.0,
> > manufacturer QCOM, vendor string "xCG fTPM", firmware 0x40000, real
> > PCR 0-7 values, GetRandom, ECC and RSA-2048 primaries, sign and
> > verify, and a sealed object that persists across reboots.
> > 
> > So, as far as I can tell, retail Glymur laptops may ship firmware on
> > which this driver finds no TPM, while the same TA is available over
> > QSEECOM.
> > 
> > The same applies to the prerequisite series that moves uefisecapp to
> > QCOMTEE [1]: on this firmware service 413 is absent and EFI variables
> > work only through the QSEECOM uefisecapp. If the QSEECOM path were
> > dropped for Glymur, efivars would stop working on this machine, so it
> > would be good to keep it as a fallback when the QTEE service is not
> > found.

No, the existing paths are not going to be stripped.

> > 
> > Two questions:
> > 
> >  - Is service 81 expected to appear on retail firmware through an
> >    update, or is it specific to the CRD firmware?
> 
> Yes, there's spinor update(bootfw2.mbn) needed which is in progress to
> publish as QTEE side changes were already merged long back.
> Roughly it takes ~1month(ideal scenario) to get firmware changes
> available but somehow it's taking more this time.
> 
> I think i should have captured this dependency info in my series cover
> letter to avoid any confusion.
> 
> With the changes, service uid 81 will be available and won't see qcomtee
> driver issue log there.

You are responding to the user who uses a COTS commercial device. Are
you suggesting that the user can somehow update the firmware on that
device?

> 
> >  - Would you consider a QSEECOM-based path for such firmware? I am
> >    happy to test this series, or any other service UID you would like
> >    checked, on this machine, and to share the transport code.
> > 
> 
> Qseecom-based firmware path is not recommend approach as it's not
> generic and less scalable leaving less room for expanding featuresets.
> qcomtee uses mink-ipc based model which does all interaction with TA
> with just 2 scm calls and is very much scalable compared to qseecom.
> 
> So, we are planning to use mink-ipc based qcomtee path only and I'll
> drop an update once QTEE firmware changes are available in meta builds.
> I'd be happy you to try it out and give any suggestions!

I feel it really sad that the team (again) ignores existing available
devices. Yes, QSEECOM is legacy, etc., etc. However we must make sure
that devices are being sold can be used.

I guess, at this point, the best course of action would be for Xilin Wu
to submit the QSEECOM driver upstream. Xiling, could you please do it?

-- 
With best wishes
Dmitry
