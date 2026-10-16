Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9C44A3E9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143124; cv=none; b=F4NkuIvOeAkjZ8h8VzZacr94vQKDw0x1H0mhCsWTJKGhEil0ZosuubmXLIpvUge0m6XvVJfJOIdl8mR8ESrweqm+f9elgAE0A+PWZ8eHWoeVJN4qnJK1pM9/LVVFEiW+v5F95z4M9K/z8erq0dZuKehziTSUec/Bpck90kYJj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143124; c=relaxed/simple;
	bh=f6z7Tn/D6NJP/S0YclENgGNg60kYwd6KWpjGnLoVnWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDH8cNmdcmXCGEsy3lFBGuW+Vom/vTi7a9TNRSETH3izn6jkNEFPnOyNm5KVr8uEcAvVGwbw5rDJ2Nvp1cOgcMoqEw7Vm3HFPNC5e1a1C8puW8e/VXQ7v3xFQE82tP4MBWypu4jLxlyFBBDlgZtpDabGRkbAGkCVNHElPFFSWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgmJOUGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gh7klzyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgmJOUGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gh7klzyE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m3W71465259
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7mPK0sVYw4TuEezWMDdoZ1UO
	LApXxKGgtI6l2erly54=; b=kgmJOUGYAAhvHGZtwQQEHW+eKSv3K4fBh4KDrWzl
	CR9OSS2PGp7qG1jgcLd3nGULVrR6vMsj9m3TPpkxWjFE8K09wrFsKt8AuYvhuJsq
	a+sKtrkDGVD0dIPQfLVMstavx+ba5kqCFueWTNf5efxN67JysyysFUjlY9uLfzdj
	6sCFimDozd6fJ/sldAHYcSH4exvlJ0IJFHQ/63sD6HinCNyaDgJhsNouktin2Jqu
	vNcVLLGOj8UqNAqEHtLBiXQC74SXxNeNr5Wc31VxwTS3i2EtNf3oQqhCM9YOHBoi
	3skqgdUUjQ864PU1gQD/7mnAfzBMGBy/SF9Xsczv1PUAkA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wukd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:32:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4355970c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143121; x=1792747921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mPK0sVYw4TuEezWMDdoZ1UOLApXxKGgtI6l2erly54=;
        b=gh7klzyE1FK++Cwt6MKWhamf0eWCBEG44itGnl4OOujEYbg4zqfD4ejSKlEfONS7UJ
         lXwY9XVlXfqiLyXP91rwjeN4qT9L52iIryESn6eSeqZ1/U4eG93O528p24PZn7UxptTZ
         RfYykd469wlB5hDmS4NKfa85etMKLrBbT4qfRZvwJu2GVQ8cbEyyVPfBbs3y0Zmp1nFB
         D45bOrLVQ00VJEaWd4rrOwhC/pekiVLvBjRZo9btYqUAbVfFhfHcTZz2ErCq7BxqxJr6
         QjeK/huY0jCUSKOR6p96rDfeIISEoM+OttLG19rAA/jqd7+/WUz1HZ2cagg4snOACFI8
         ZekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143121; x=1792747921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mPK0sVYw4TuEezWMDdoZ1UOLApXxKGgtI6l2erly54=;
        b=FK39Axaj7Np2e7MNwjaomPiyvTZIgUyyBt9iz+XTxSFQGFKUmJEnZsv75D6lm/W/4q
         Agxuy3Q3Akcc9tf6tSreU6SYQWGfmXqxkyGcn6DDMqf+G8ZM0a1VjMCUSd4jlcFZFfOO
         6TQOcwwgtzV/nqpML+9jPuufNarhGSvlBQCfmt3/emIOoDYJ/oYY2fGa7UFnRNFL+Jf6
         I9gIBIQ0qAqD6BlmmpD3Du3bpwGTOL8OmNHEyAwnDPCy9/8W5Sr4UaUCmgbOLN+SlhIs
         aF1c6iLnXQREG2TLTnZ0NFyp9J8AwJ9qtOgnOvLy2mUz5p1ldZw9sWcrJv9rKJVhO8sx
         77Dg==
X-Forwarded-Encrypted: i=1; AKwUvByiemJC0RBIDDLKw9/NHchMMkAsU0tE8hcTknpowwLUj+mvKKfiUaZvxc5l3lr5+UVxTel0i3enCD/ktGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYukKwRlhTkj8ANUlYebwZNz+pDqmUUHtaCaFlwema1+EdFZnN
	ow6cTU4Wmx9fC/TjeO/tdfMqsXiqD+QQMItvBmWQSDMc52ePjQpBSXm4SN5TV/j6CwzIzTPvAjo
	NS8yp6nAHHlDBWTmU5/T+LHaJlLiCieqf/TkHP53SgNcEUUXtwwjpYC58P3q4qSLglGLfkrIUW8
	NzGw==
X-Gm-Gg: AYBFou2p9TVW/9r0u1Uz+acHapeOJZVIjQ10HUe+PaBqfY72r7vg4hPmEo6G86fu6UL
	fqi9jczhTK5i1TzwccN59L4IcfKovc01fIavt8mkNltRct0wD03q43G8KfCEpYUmAridvJ6PgjE
	SunJ+bDg+PmKxQHasS6Lu/Us7u8MHrByqEl7+tAutqmB8f8VMSm62KEwcD41SyFVL5IobD6eIp3
	zzrDZyW4BHi3/pTE4sh9y3YhSuFW5dFE5ni2UugEMRzkABhgdkuZ8vWYqlReAWLMbW2WJFb7vVx
	iYv6jcIB4swe/Yfj5oh/ySZqkB9uN62ZkdU87va+6oEH7tfAWmW7suz7MZ11Yj2ALvDGL5U6j3Q
	eYLOYOnUA7RDBKQQ1C72fTUSUppTVlI3+45c2ey3AYCAyyFuT
X-Received: by 2002:a05:7022:ea8a:b0:13e:6efa:78f7 with SMTP id a92af1059eb24-16a5dc00e99mr26848785c88.15.1792143120640;
        Fri, 16 Oct 2026 02:32:00 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8a:b0:13e:6efa:78f7 with SMTP id a92af1059eb24-16a5dc00e99mr26848755c88.15.1792143119997;
        Fri, 16 Oct 2026 02:31:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm7170569c88.11.2026.10.16.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:31:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 02:31:57 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Message-ID: <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
 <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sQDwaA5rnZOHWtpyG8wnmChownHpRyy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX0DMEtABpL8E0
 HBfuzj2mnAt7lBo29itTpP/WGPOArpe14gq1uurVh73wtbszHJgPFYIFzImv/Kv2ujB19nn8Gew
 M5+yIYo5a2iTLCU+kgBN29/8cq3uge/6lX0XEh1HralSv4lTr2byDUPdDJNOmx0jWY5dxzrJa/F
 76ymqsnXptIV7TJkLX1o60WmOAgHjYARB2z3quVdlYgv2axzmC5ijOtiiv0H0CIW/+eCLV+H6UK
 K655PfonXh02A5y3/KxAYYP2SiBvKTNL9J3I/jrzWzYtYZDmUW25DVOXwdiu8PigsLshXSN62/i
 fhShYAUopl69VSeafsgyn5FtajvC9zwEY5jgN7D8VN7Xt8gsJ38LBysGBcM34CvzRz6MVtCi6jw
 BpHq8nUQ5KPGfy+isTVsLDDUY2oIQ2BoFDeqbeqX4xvEACjkvRBBPT9zZPRhiyuZKmRfhM8srsr
 5kZK9mZBPmsNa4UCAVQ==
X-Proofpoint-GUID: sQDwaA5rnZOHWtpyG8wnmChownHpRyy6
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1ef11 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p_3MysCZGzSAKd4OFykA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX1dpDUceGyKbv
 tGAUdlin7V/1m/cdpppqWKI+WSkrZYLW16ZsTNltHbpbK0VK6f2Bdd93jnNTj3zxzgZNEHgKb2D
 lvxtC46IiVUbV9f9ZxgOa9S95tJCI1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160037

On 26-10-16 11:24:05, Konrad Dybcio wrote:
> On 10/16/26 11:13 AM, Peter Chen wrote:
> > The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> > According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> > (RESUME_OPMODE_HS_HOST) must be set.
> 
> $ rg -i m31-eusb2 arch -l
> arch/arm64/boot/dts/qcom/glymur.dtsi
> arch/arm64/boot/dts/qcom/kaanapali.dtsi
> arch/arm64/boot/dts/qcom/hawi.dtsi
> arch/arm64/boot/dts/qcom/sm8750.dtsi
> 
> Can you send a fixup for all of these?
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sure, but I only have Glymur CRD, can't test this change on all hardware,
is it okay?

-- 

Thanks,
Peter Chen
