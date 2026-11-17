Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932357;
	b=LKJPv7JeO6ysjCEVUvljO0cpL83l5xB3bdsWbdBUS9pRpmmJBUuc3U4kgVJo+QoYbSrE
	 hYRBp0mDQjuUjNxrOcid6RuX/CqJdqa9jq2yrJQ+czaqxwH5saJ83yWuszfAUXSecphHn
	 xgiX98xrUlhgIhXS4DGtvEotz/0jggv2Fyetw8fWi0a+puIwQk0ybJlYATK7vpGmZPTrb
	 dZlDdcFu4t1Z7Kl5uGp9IdB28Y66uZKQ2tH8qHjdwL2kxjikSGLBuFFSyFiwhKbSxLIhA
	 3YzcmLZTLYcTY5WR03hACMjRXmP+/hJpFHQdaSMrs+ifAFGswyskkzwON1P+/u+lkpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
	b=eivso8hb0NSy8F3IXj7N8BanX3GLpMOqrWFv4xY+nmtVdFnDCM0s4cSPL/Ljr4hq1Fr5
	 S22eGxCptbq+27pDvsXl7V8phFq8NriM9t8GYXRXgYJ72hHCAgJMpgTM7RZgIRLME3i8A
	 +A/FeEOHmS+gRhsk13lYNVbTajfK9fYD+TTBbwqFnQdB72q2qdJVhUKMKufNNmhqlyxB8
	 LTwLJFRKM0GATk7mA0JsFWCkrnhFtdFh+EYnuMHvyFDoa6tHCi7GMGeMeCNh/NdPQI4O/
	 s88OMHteotQFcLXgCpRjDL36Fz8c16eCh38xF1o+E1ohXrgDCQIxH9Jdz7DWbVdP93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZvKDYHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E22606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E22606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZvKDYHZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR3md3503925
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PoydfNflc37spVuYW+Qn3aq9
	PQN/sV/Z8s/hao3VHYk=; b=XYWAiliCsqFDfQmgDEgLMBFs5w3ewAqotIg/w28g
	CvkVNqkn3B2gfqbOfqQ8WFSTaC5hLc9DM3pbbKf4U4uhrd2TqkOriWTEY+SKmFc1
	FRWpVg9r1FA9PMPExtBvOCboddjvjP1jPvTnFUMCYrWZ24E7PZxawrTxBwaAWNpA
	iDSTI1qAswQSUNuM2+buMCWPotRapEJLJYzy38Bf+qZkdzAoJ+IzmKRxWy5wiQPy
	apcy9XzZB070kVX1ll5hzTacFY8nI96kpuBohOgDxmURkDhcsdx4FiQkW9ynoXvZ
	CPOAu5UNNonEitoFwsP9cT6hCU9997EVBQtLFSIMFsLehA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv11j5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so33121eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794932355; x=1795537155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=aZvKDYHZZXstA6wSA/KqMbhSn0JE3uuSd9cEa68s66ChbKJXpeV69KK2qOvRZhr+S0
         tPGl+jOJQkV1YsRQZROZwmUqGqO43iv3UFdCpYORLl+I2+kHKMvuY1I91q9vcAFIaqfD
         PvIyiwrMaPcLpM1jJbpyYrXwqLO+voTUkgGdgD/CVFNk7a2YQ4ZMmYIu1ljupc6188Ts
         j4jtisADPAjXD1WFDkxb/iir3wwrB9IArjiGStvg8VhGLoy6GTrIJr7rswICXyEl+rWM
         KzkFykjzJ8E9VtXXVQ0nkhDt1Gz43gFbX8s2+nDegHQpnyMqIgGJliH9657bB0DQ2L/K
         qgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932355; x=1795537155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=MF/CQObUwGSMmjdeY27NeUhJ2TvRm7MBvJ+FpCVnidbNDuHtOFVk/93XDYijOM3SOc
         gV82g+FTrLNiqUCqiuCNRpQ0hGadj+Ahf1KJ9jVpelWo10iBrDk3wTbRWltaEoAz6Rc7
         PrHxcjMWTgat0JknQd0quL5ARU0D1tELR/183Z3lA8OVgpS9TJZxcdCmPYTeIjkCBKZg
         hsE/22fqSnhfHxmxrWMTj7wBJahw9XPcoJQJWXxyLvkU3FMth+G80fc4ut+527djRO24
         NbFQQBJjfYEYfqKBQLRl/ptt5trhcgp5sjY9z1cvRseAB+1eCsvmhl4QAgS+DYdmVkss
         NMiQ==
X-Forwarded-Encrypted: i=1; AL+hErH2gNj4hLCUlnNiATF/zplhnjmT/JHyMHiPLBQqX3vtaYxdGo7Qdb/w6gmD4Xk/+DgLjPHey4kjyRf939o=@vger.kernel.org
X-Gm-Message-State: APuU4Z85wsFIS5b+luPCV40CwqIIhtHCMUJFW5+Er0NugJbCpUSQaWS9
	NFvD8/w4+9AiCA9aFiPVVzJXIGdg+v2CbSKgm2bpUS7lQPLKGc+JLKOrzX+CSTF6qJ3ktyr4m7H
	wDG4ScLzM3K0jo+YCK/LaxsBqF0THVn03OpB8vX2JCIObb202fA6PLmLpe5tKCrpXDDs=
X-Gm-Gg: AZFdTZdpFFwTt71G4SPyR7Bnz83buW+bbzuwmo0TSqXw8sin7U57UkSfp2Zis3+R+ip
	i9U44ef7oFFC9lyJhBPH8coUZiP0qAM6aZh40DnYwP8PxK8LnMwBcsmDmqDLOQS1qsYMolqqMq/
	wXdD536aEkBHApWfP+IrK4PzeFjKdIuwKUO3dRRmIN+wnHSxN6JfF+WW0SiLcyBOXyMjVsi/9bd
	Cflzi+qSSfFa18R1XwComiZ57PyhnlXuSWzc0WBmfxipKWHUrpOCAO0T3JwadKW4VDRmjFe3aNw
	q1zGnL/6MyJrxPU42psLHqfkIwtk0TSKOgJcTUBM08NA1dVYn6HXQfiviXlLjcZYV5n6xbPzHez
	d6vypCBh8vlzMaEdigaAoEZCLK1tUw+3UnCU9BUoaqEUFteSntR0Tqp6rUYSr1VkjZNYa8ZUCuY
	4=
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866916eec.38.1794932354385;
        Tue, 17 Nov 2026 08:19:14 -0800 (PST)
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866871eec.38.1794932353720;
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68613294eec.8.2026.11.17.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Date: Tue, 17 Nov 2026 21:49:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-Proofpoint-GUID: EX2VluS93JG2DB6myS-LadzfnrndOmMA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX+l1E6vLqW9PR
 sm/NNWffqEeCoEy/f4AB2PnvNAGozpDnPGaueFE7nXv4rFCyqNMQf+6soEuBGr2Hwep2R/fb1ju
 +QnWAINPNAo86HxBxBVTYOGtTF1SAc0=
X-Proofpoint-ORIG-GUID: EX2VluS93JG2DB6myS-LadzfnrndOmMA
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc7e83 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX8FRIqIdDcIKs
 kp5ZlraXdt85JlKwLI2Nj6g6TRV4Emjhd0HxiWt7R/GTKlQ3Iv0SiTX99RXH8fnYvET36xzSkKJ
 50qag8hO7uKr5A8QomSZaIbW++Ul+lmHL675Cxas31LAkDsl48W6I4qUrlNbhcFkEdCHJTo3/Qc
 XWdRF9T32ZRRIOK1pxfDlN2tT4WYxohk5bKZYFWyh1FYVLqQJo+4JX4pmpqfKf67o8JyjKlH5/f
 1YP4MbZg9FAQ+Un5S5lrijK5zjj/sDs/khtSKLsPfdztcQkez76pojJrldQXJNaxwqXY9crpnWa
 YP1AFlbDBQWG1zIQWCSRoeq7dE3ZpUHEigqbxR9Q0eb8rKFv5UdEhGkvxcC7Ygdm499Xtr7ermj
 QiLdDyTO0Iw0ITekzw8cyZP3SRv651pgsocFyAf97IgrvxpOBZU/lkIhmYa2GvK1cUb8AO18kU7
 mw+7ve59QEOrlVzzzag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170064

On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Why only for Shikra ? 

> ---
> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>  			reg = <0x0 0x045f0000 0x0 0x7000>;
>  
> +			no-memory-wc;
> +
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x0 0x045f0000 0x7000>;
> 
> ---
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
