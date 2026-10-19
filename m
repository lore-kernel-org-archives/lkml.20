Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CE4052B7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400865; cv=none; b=u3jWKo7D34ubVEWgOFqL1CFAU73XvglsTd5PsWfBV2bCWzykAhxKZEM4R8LTqpx6gW1O49qMk8aB07oZmJ3T8ov/owRKLjp8Fu57OBOs1dNGVGreONArht4i4tQfmeXsW0M/xdjRQSkiWBNG1fPNXyEiZX55exP2nUDB68qBe6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400865; c=relaxed/simple;
	bh=XEbm8c7un/ubtexMiqmCilOU/M/0muLc3BE5N3+cOHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orFZAfBfuEojjPtu3faFUjA1LZhy5Pu9Of6O9Fu1DU6Yv+xAx1eHeCrGfqRZlLSQJ1RQKaFXgl34dKWJ2rA5Lc81BWX854sFSP+EPvQ/4X61zmuK2rv3+yPvOuKDmAGUXOIqf2zgxkdWM0ed14+Ec0SMCDsKbAnjqpfYJEbhg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOvs/ARo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMM78dmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOvs/ARo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMM78dmd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P20F724563
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=; b=hOvs/ARo3bMlI9Vp
	klfDUgexlNsMYfJobkIfYmvLcK0xuYIGh20CxVreq9svF7xUc4+QmRsHd1kov+wW
	KY38iuAAS4wb8daIdU7Qz7SV8sBGZtjjCp/4gormxU3Wkfx3lT879CrJn4BOzhKe
	CGUTTaQflK0oiadZBaHKZlwGsCswV9d382k0ikKPvAI144RRS+OTwWKGIIaXHwRr
	OiXFLvBoqv4xTmk25v+qXWvbKmAkxWaLNY2F8xPEsDTk7XPvvmRWhGke+XdawqbU
	BtqxY1bcxWFUAm2mhp+ZDe4LLr9PdhUoOGzE/wmIOxZF7Qivq7SybtY/aUPbmvkf
	78QjEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65g9d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so69401985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400862; x=1793005662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=dMM78dmd77JUNZVt3+Hr4kwg2UDxXEqzzNGivwjXdCi/P7YnplB5R92mIe7D4Y+XCl
         Gr662vl9woVFg7KelHmSc20gKN09wxRIWR5G3lcQo3sjGSNG3A0P6tQPbDDbEwl+5g50
         ybjJdk+4cKSks35nwyd/xj8D/ohstTW2YMdfpaO46oqrhImIldyW5oBa6Hgzu2ZvUNxf
         L4wB/+YLU2PKeCTlUzUAO1Py0r+iivzXfkUfzuJ/4Bw++aBRQax1fUMVwXV5FOCP65xo
         4RTVDnY0EJnqkl93IpTMRqrfR2NR0hrwo8VLQvpjBeQpPITK662YbnU1ttl9D95q8exx
         zZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400862; x=1793005662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=qmUFhnn8r2aW2B8/aYuYDazKhCtSKfI5VCnHNGLcGqjN84DsWl1ubZ1yy7HJ45UnxG
         xBybfpeAKvD9fyjhSOLbvi7hPHbwCCSu1YdGfzb1ldAVWDE6DEDnNiUm5yKt7kZFfdmk
         L31j5BtCbc+oppM3LFUbeVD0yO8Xecm6IH9uTXvGZFwE5GmqdBD9c7mvGhaTdB37gTPQ
         xJBgG9gfG2UeqdHwD/Wv5YZEn535My32ok8NBB5NY+DVg2r3IfESLunQOZbReQ2mh5iN
         /DNH2/x82b7/aN2Ec9FlCcBDv5HePDlFH0Iz69ZwDkFLgVNxV5D5zsdYNOojEMX5arlC
         UPew==
X-Forwarded-Encrypted: i=1; AKwUvBwxgCrYR+7OwpHELkKyUPdRYROE2rhNXwiyMVVyiqMlztfuz/s24XFOccWn+6GBFnAAeL48Ztcin5otE1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC0jnTvK5l0Ua8svwLS64c+r/j4XeRKEkn2sSj9xEvUWyRBnTX
	n2snyRDkubJ7tfeHbvjkX5u4IQJobdekmobSJYf1DJ24rUskRHauaQm87DWIBrAZFJgDK+Vnav/
	ZbyQa3Bd/Pnc9eXYgGrUdGLbF3CNMSk86gMgBwpNQc7bZckidJ0Cnf4gycGMzikoJGyI=
X-Gm-Gg: AYBFou1lPejFOAuxmGNvXhzM/B+++b7cgC7aUmfZIHd60jHDq4TFHghcB56DzTsp50x
	SDfosyN4AqEexIhgKK/gQapm45wDdXRt1dky+syDKY7t2QKLqX9JNu3gjJakPxSa5SBi+D2q30g
	MZ68t7PVCLZQnQ/P6vRlZl+JEs4yr4mCfxjNkmitLbdjdSQezvkg/eTaQHQQbarTefh9gnda6c6
	6ghO0UzzsmN/Kj7MEvoUSsIgKXPg5hWQdxyYjkdR4OhQwNZWtwMRanMKU9CeYx2NtQdaNGhthux
	7kGgpKrkLazmVdYejL9ajMkrU2wXy9GPOP5s8YmDe+t8yMgUusjBAGBPStZmSoDXg2j908DZtxq
	u3uCt4vRtQcZM8K6/+IXb/Q==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351061685a.0.1792400861897;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351056585a.0.1792400861324;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm324440966b.64.2026.10.19.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:40 -0700 (PDT)
Message-ID: <d7acfaf2-f416-4e83-85c3-c30aa4e6111b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX9DGhqXnO9d+k
 I3Cwo50PCLvwaVQkGYjFtaVAOpUoKKIi/mBsR5Q4vgUItjup6sWB7K8lLKzzp3PAJUHkilZpga2
 5x3l/mR1VKyCqirIOQy7PVzkQjnJU3k=
X-Proofpoint-ORIG-GUID: 2sY510cgXWQatXdVnh-ybwv49-LJs91_
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5ddde cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SFmIH4a4ZRYK_P-DvPgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX+lcSbVcG7IhM
 MwnTZKgtYq3G+Jl0akrlvCUV8EDRQEva/CELDQT+El7Y5gPkrv/gtJICVaA2EFxoXbXmiSCk5eE
 sWKBDCS2bzaY/NjTI894VI6yS6APwpMhxMGbEjk48qGw0IUIKMUUjViUcsh6GF78qzeyFvWLAts
 2Lhp1Oj3bR61V5Cz8JaFC9LEQKcGSdO8e1RRISDD950EqZdrAZRE0sWPCcFVnQIFMg1/CUdD1BC
 h2X/ruFjkNl1wRyvmhiWBFkJw/8mrfBt3b0vUkK0/1trnscS6bsK8GNkxIGAHVUReFgfQ7Hp7c5
 FVOGsdOrOe+zGx8ANWplcaDdBUBnBaE0lDJkoc8sK1d4YYha9Vza5EMNKU8q70ouScgXMMtkmwD
 65B5LDVOOewFC6vrHfkW965tTvWfFp0NTwDcPPZpkBMay49i9awB63RqLMZHfNJarSFd0E5vy2H
 6jkBA2NarN/qw6GjXfQ==
X-Proofpoint-GUID: 2sY510cgXWQatXdVnh-ybwv49-LJs91_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
