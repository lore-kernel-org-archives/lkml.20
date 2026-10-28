Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181016;
	b=wxTWMD8zv+nwPnuYy2VqDsIo2O8BbfoR8kL3TIK7rUwZBUYhbhnLSrmi6Xx7crVmOhZv
	 4AoIFTaIk4UjchgdULI/SYeojYwiCfPIZ3tAc8GQusvcNYBxvF36m656uRvtou6XiVzw8
	 NH2kgdh6Cq8ir4tcmnqIQJTaYM+Ys0sWw9EU0NNKS/xvtVOMnwy90z0e1Gnd+9Mcp6oVd
	 nxYJ2QwgMoQe0bVRVKR9EUJmg+RyCJLJXjD/YLHbLyYiCnsGwTmUv58HsQvEG7vgDAFIl
	 yzZ5/hKZA5MPw+FSe5odo0eEjZRrcsttFqYtpJ24LHwOPFdJzaEDVFZUy7kxr3w+vfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
	b=zAfu7KeKLos1OeoLqOdAez6yP+FV/jILDbQs4VJOwbuNrVdbFqOrGsHNygeCiP+2bq87
	 m/gA2aoBzf8lktRomiB1poDKIH2g0phLGm4nHgkAy7gw7oD6+jvkKHmkSDRoKPM7DzFcx
	 BZybFq4T7AjGeDJySdBPrwQTasmXb1VG7OgZ71DU3QFjuHtp7PpAI4NXqh4PFDZpRo78i
	 jkBkbMDKCQbARcbkSOaJgbWzZBQpKCZQkdBlxjWMb1yrbYjhPLQUsHdoDIfubxVmo5FVO
	 Nn7lbgGsi+iUmnGiAOBjSxkWXsNtzyDr0pfFfoNXcBhQAuzB5BSNOxanlhXk68v+LCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nuT/AJ6v";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgbKY+P6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BFC606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BFC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuT/AJ6v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgbKY+P6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K4Mo557254
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=; b=nuT/AJ6vg4EDrAwj
	7gHn255zdRfOwT8CVDhc0MyCFjCMjcU5hDl2IMVi8wgBUhZjwpMPSLxo87XeAQ9D
	K4ek+BwZOjSeXfCIUwJzHrtZr6oIqaeDP733uGF6gNSpbtZksZ9oaZfnqkKo7RVE
	NXT7c8pXncphNUHkR/uWt4BL1+RA78JReCFlMw2oFn8keSWBseHhhazdALp6iKwz
	RngzNaoI3IrbtRLGLCexJ++N0QBbEMgl09g6za/3l26hCK2g67z2aqOYLfHpMBf0
	gdbc8OmAuzDIdWHhjviNGXQ8f2roaMraHyoTmljMxhV1BP6GESaJ5CDwhkD3ov6S
	BpGNdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsfm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso1924839eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181014; x=1793785814; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
        b=dgbKY+P60/T+awRQYvuX+Dz0hKr89QBIDg75H8osBWoq6BtQ5H7tpDez4jBF0Ia9k0
         7814UlNJhfRU7ZEBihKDY56KknB4UynnX03V02PUo94IM8As8exP7UEFfLyRPFSlLw4W
         p+sRJFfdNEF3sibujGO/9W4RDQes7vsBfWdkyYV8IGaakK3RA1KpQ4Y2o/lLsNMBv94m
         HSIse4Xw7LYK+L4nKQFj7QIG5CKMmWH8xi4BShnLEwGpfyXdHAy9UcbnEyvwy4zBHzEJ
         wLdBxXZQCoaHT7N+F0G+Zb3V49ze9hmAJezw93MIdaUUM5yDyn0S71qxzMQl03QIQQcK
         J0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181014; x=1793785814;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oIfJOxjR4aVKlueapz0BQz+9s7InqH1f9hF6TH1K0M=;
        b=L8NhUdWVzvtnQeu6InT6fsORMfOxSFEPDGEBl8ITqu8wRxszaaJVEvM12ySfd5ihe8
         IUt0OuQmOSJFLAXKBG3B1hxlEODQ8NDk11IyIBA/HtYWOUXCe3ubItl2HC+1ed2dDSQT
         DjpQVMHxaLw0XuP0fW/n/1aSwvlsz/qlhXWrogluiW+bjfguPsIxtrvAVjwBCewaRk86
         DHTr0UsayYFzUuD5eLKTIgno9bHHqZxWAzH6D1pGAYsoYl68Ig6u8Jum+mXW81BGZApB
         PKk07bI7g1nPkBKA11zQv6p2O6CcwvVUndtMppXnyrpsScb/6yawQ0MKB7mWbsOibp3V
         WvYA==
X-Forwarded-Encrypted: i=1; AKwUvBxy6uw7r17D37qi3ThM/qhR/JCxAEyEGt0yWVDITr0yVcVQDAd+jv+irKeMScLCNBusMkSPVpbvq9q23yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn7vRcvhDmQ8nM39TKQE8VYHPDHEl/ufyV78uiVO28SkE7Rwgp
	18i/M1lcj1K+kIX+XTFeUbA700AqVfdlczdRWV8TxaBle87Q1bvAJ4gVCA+Z4cYvYijQzio8svK
	+D/EZiEFpFEF3WHmmjKDOIj7ZR3kHHOahGFy5K/DrpOsrx/Z9WfrQmASh6/h4kkteQ0w=
X-Gm-Gg: AYBFou1nqZxk0MSVvEDzOb7oIV3gog6tKteL7i6ZAcDjmECQfQH3GQFncebeaQI1u9q
	p0kEgmPuKgVjB5gexEpMyRbJoG9lV37jQhtYdNOJwIdhtGtH8IpZmqCm01bEyPkc1yqlVsIa1iH
	dNJuvJfPxvjGgiGsMO4HBTPeBkzcqWJT2M2FHOyOWODf6jzy7gNN5FbY3x+xfRpKytgsR5HEpzC
	AmxhuFQ30Qln8CLawueRS3B4HOB/3AWINi/gaky19+n8rm+NPwp5RWZIp4zSLpwCQG0xwegM3XG
	MsfpQfL6srRJSqJbiBmzrFJnBe+6iSxYLT0vK5uy3s5SRG0r1RUGk/fIqBY2I0HWHscuugwlg7c
	KgC67F/u8qHAXkU2mjhgygukLyEXMH0Gx0+8vryhXKi92rqCztAlS2t6rFQECOfu82/FqsTBZZm
	MaSAzIFftHV3d0sLx4J/MC8QcCoveq+XM0xk4RTv+nJil/DqFJyuWofwP+aFjTzBIcjKW3gd8=
X-Received: by 2002:a05:693c:880d:10b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a20390c1fmr2689403eec.9.1793181008663;
        Wed, 28 Oct 2026 02:50:08 -0700 (PDT)
X-Received: by 2002:a05:693c:880d:10b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a20390c1fmr2689372eec.9.1793181008098;
        Wed, 28 Oct 2026 02:50:08 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm6200731eec.20.2026.10.28.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:50:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register
 using readq()
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <179189473286.2132802.7434637844183959510.b4-reply@b4>
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
Date: Wed, 28 Oct 2026 15:20:02 +0530
Message-Id: <179318100276.2544529.9468208278273297735.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793181005; l=2659;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=AhwuCOFFa0XarszG4FWlhHz+3Hx/qE+SKyAfeGzSlUQ=;
 b=lzvaO9RLAriU15rF+bFkcF26jXirwmG/OExUo0H1/ZCxT0zGt7DCdyE28XvVhuEdaEAP3s/m+
 wxGx20veYnABO/nGkK8+3GM/3KrwLvWHRvGrX/CWPZ5EFUphMOvau4t
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-GUID: 9toQPEOmkoXBVYvm5YHDLe3kPlvxnIVP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX28fz/hCoZrCI
 0k4o9F3VHkxwagK4EZ3bnQzgfqvbgb7BtsCNptIRI6ufSGbbZ9feB9QfCyTcEkYVzTXzh304bao
 w/1wlDcSVZ0U3vkTzOb2a71mR43iRfk=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1c556 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AviaC4fXV1LfX5AF1TUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9toQPEOmkoXBVYvm5YHDLe3kPlvxnIVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX9LguVqAUE9mL
 f/n/4i5rW1DtXp1Aueiw1xoCNZq5rlHPqfMuOtMBH/yVmCAtsP7hjyr8mLoZ4kziFY740NDjLuS
 r7grd+YdIrlEXasYDOCvOZAZ0FXshDSOWxWI6OTOTZTmeVnfKPHahDqY1yku3GRFnlPyEKvXIUW
 OIvHIbje402c9aV+YPkHkBRfIk9w2SyDbOmp5PZ1CYvVMZgFLIWo5rLuIycwwVh406PLP5Fzrq6
 O5HaJdTKv5SiaVQVdUu2z2rPuaiSvfYsK8orG6xljaYww0FN6n7CCzgWSmyVPJCkuCISowEwpIx
 wYpXz9w8ke06L1E9UnJqU8KHhXrU9+98Y++MoQ+pKuOjsJkQNsdIhIDG8P5oJQ2E89KbRNXX98e
 mZ2C5Rd2WOab+DL/p0Jf4uO9ZHFThGmbTq0IlmMa3vmrZ6wOVpJ0q+gddxu9vlZWRtlxxFzmPLC
 utdcmUFsQwOHL6kGlIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

On 2026-10-13 18:02 +0530, Sivansh Gupta wrote:
> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
> > On 9/28/26 7:29 AM, Sivansh Gupta wrote:
> > > Mailbox hardware registers are 64 bit wide, but the interrupt handler
> > > currently reads only 32 bits with readl() at offset 0x4 (upper 32
> > > bits). This returns an incorrect value, while reading using readq()
> > > returns the expected value.
> > > 
> > > Use readq() to access the 64 bit register and pass the expected value
> > > to the mailbox client.
> > > 
> > > Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> > > Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> > > ---
> > > v3:
> > > - Removed references to an out of tree driver to focus on the incorrect
> > >   value returned by readl()
> > >   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> > > 
> > > v2:
> > > - Expanded the commit message to explain why this change is required.
> > > 
> > >  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> > > index 862e45e8fbd5..0b584d9aad6c 100644
> > > --- a/drivers/mailbox/qcom-cpucp-mbox.c
> > > +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> > > @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> > >  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> > >  
> > >  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> > > -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> > 
> > This still retains the writel() later on
> 
> This is intentional, currently the existing mbox client(s) assume 32 bits
> writes instead of 64 bits, changing to 64 bits here would require all
> mbox clients to be updated to send 64 bits.
> Currently there is only 1 upstream client (arm_scmi).
> 
> > > +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
> > 
> > This will alter the indices of the mailbox channels, but it's ""fine""
> > because it's always zero for the existing platforms..
> > 
> > Konrad
> 
> I am unsure what you mean here. The channel registers are spaced 8 bytes
> apart. In the old code, we used to read each channel's upper 32 bits
> (channel base + 4 bytes), in the new code we will be reading the entire
> 8 bytes.
> If this is not what you meant, please let me know!
> 
> Thanks,
> Sivansh

Hey Konrad, you might have missed my message, so just sending a gentle
reminder!

Sivansh

