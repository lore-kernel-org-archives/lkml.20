Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B83BA22C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498441; cv=none; b=cjrx7WYOWoy6sXzR5m8xxeG/7qs3wpLL20wPImjvOuiaGSvFyBuBLsGVT0Zjr42Hd/daEip3+NwrB0b0gvgifGiSuXCD2Hn+dhYNYIlLlrggpONHIu+4olmGZgyleP6sIeN44VYVjcZ+mf7JeOGe2wBIYLmfjXHppZoT5MTNm4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498441; c=relaxed/simple;
	bh=E7JEhW3K/4jheKK7XYSrmJv6OJRhgoWWWDlla6d2uEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tlqBXwgQ5AVTjuR1y4ElRGxn+NkyRyFu/OcsYbO44+ulQwHqv0aJjOLioZR0sSz830anvXXQ4rHmVn4wQ3iXLLVmEGrZo07TL17x85mC3A2MH2WDftk/1g7reRofaWOQYo5zwa7ob/mCSAMdfasVB+Db6g5YYC1bDsruqBIe4D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEgYD23v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZX+YdPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEgYD23v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZX+YdPA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMEXWU1511013
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=; b=aEgYD23veb6enSsJ
	Uf2ZFzLb39vz6dtSjbphEotJ+nZLaktoxTICwM28dXDXY9MAQiTiGuFiVB0/p62+
	JLq+hZ8MnLOPZ9qViGTOBiOi4nk7obS6KVdzxUJ8+O3aDk6n0IlF4LftnbpuJSHS
	FH9UFm+Oxj1Lo3q3HH+abTgJg3nj7lVNHkluv3J+2VnQFvIL+Ztd4stXoM+rbcJN
	bDBjwypkAd1uInB5aAB4NQ5itEcc+gRqYmB/cImzJGRW8qMXpy7YwHIJeBmktH39
	bDWvVzQEJem49K8I8tHm4cBMgw0W2pj+rbG5Z4XpxqJiVXmKwp9oJP/Wm/IzWlJ5
	6vquuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwan0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:40:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so391597985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790498438; x=1791103238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=;
        b=hZX+YdPATe0E1HERCAL1KtwpU4v96oLFtrG6f89XBC0eUDCtIJvNazyeqI2Kp4GMrH
         MtWHOMZLxg/UQ5+QKklA0oA+83danupLF2T/G+aOv/rawwt5uXEh+Qq4PJrwfxLlHq8c
         1qWFiIq6Ee3ajNdketQwxzJp0afyvpd4Blqm/Qv4kudJloBH5z3gwjzhGG1A1hgSo/5/
         sRhVOUijrVUFizAmRXNPETfP5BzSyCWnSYc6D7BdPQT4cDbrhRGgs5SYgQJPNAteejb1
         j3uQr+vcfncERAaxq8Ss9f4ferJ4suQQaY05mWY97zE4NLi2LZ8CyZkZyM+uwbR7Tmdk
         UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790498438; x=1791103238;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=;
        b=GSbo5VdJ8SG+GGAnB4M/M479Q/ma4sHJQSCaSaGubSHXkvbnnb8dj5NaqBLTQmmx5L
         yaCMZFR9ODRiXLlFDWbiwM7efjGh1yA3ThFSDh/pdBcenCHYxatoO9FVU3kMfXYrEkw3
         KQ6qbgDhLW0J/h9A9qsoYWZJOq/n9Fw91L2hjlK8/cObCTRE051jBpVAqOXDCpZGpbYl
         r3E3hLr7aVM6ZbhGnPIyDX12N9MMTZNttCASzfsXFaCBPqnmSpEJ0j15cfRMHZ431LB1
         YkIQmeysHshNx3k+zNc2+Dag7kxNAUbDegszgbn0uM86i9e80xby4r27aNou/xjDhCVG
         C3SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT1Ka/V5Wgy4glXPrH4/oDDmGUleXfNuolsauv3GpYcjpl3c3vrpinSrnsrhykfsHB/BKHeWyp/i5P/Bg=@vger.kernel.org
X-Gm-Message-State: AFuF++nqfHDFMEPaNSA7SBlnfIrZWHZDfJk6Fspoth9jCIRQMQGIYgrA
	LE3T9Eamm2jyDUfygtk2tgzhK9yRHHaJNfkWjhZAVO2xcSjWe6Hde0S4s1wsGZhZJWgbfbiiMcm
	q7B7LcCOO8j8w1eD0WX/paCVbMPy9JzpGEhpaHlGgJFmgpD1XRHOPZpbPDg4bUYN9ZgE=
X-Gm-Gg: AYBFou14WGvQTaPWuJHjRCm2abRg4tIokYwly6M3y6M1kFN2BMMiWKp71raqLuIOuqU
	ullncUOJaNJFo65C3wPi5+ol0QrLMqy4POi8xPpiTBqWNOtZQAGGrokfd2BJ0xdhD69zNXm/sMI
	BYQqvynYzr/Kjx1cP2w3QrLaexhbfPj452ddjn/tQvkSIHI8VqEsv7egvWlm5eijEhH7V/FqC6b
	QkKoDMPg3nOXaTx5PZhjnCP1D+Ky2YE0s6i5fQnMtSr5Yst9LUkaUvuTk7geU6tW7QaJIsFOZXo
	wEKvCubSyft/qPZbJJGdUJ61WFSWALlvxjTA4cZBwkWicvpPCqV1yj3Ooat95D3V4TN9AXM9xDP
	uKjipSG49SW972042LhCc1JSoNgRoAxo1byIwYEZX0bF8PbLM643SBYewpaE6SZ+Yo1Oat9WHCQ
	aVWd6CwPCX5dCZd/OLxQcJBqJ3rtMZubDBhoIEWjj/8+QmQJOuRDfvEIFjOpmL0HYusQ==
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr1423864385a.33.1790498438397;
        Sun, 27 Sep 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr1423859585a.33.1790498437693;
        Sun, 27 Sep 2026 01:40:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd8badsm2910285a12.22.2026.09.27.01.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 01:40:35 -0700 (PDT)
Message-ID: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 10:40:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Liviu Nicoara <lnicoara@thinkoid.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
 <20260925164054.25831-1-lnicoara@thinkoid.org>
Content-Language: en-US, nl
In-Reply-To: <20260925164054.25831-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SE7rWOfJinQaL8atduUmgZcgjVRqn_yP
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab8d686 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=KOsBq0R2AAAA:8 a=Nv_Mk3N-tBtoCUosGXcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-ORIG-GUID: SE7rWOfJinQaL8atduUmgZcgjVRqn_yP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAzNCBTYWx0ZWRfX7ZBo2gJw6LGV
 KOzocBhnoiMRLHM/6sr0yZaYpN2pM43vAkOG5eFlh6EdnSk8MUkPMUkKCysEpT6ueZeAwlBQngr
 qI3sVJ/gu6AC72z2hHnE0O+f5f3aHLf8o+apGxNgAi571mvnH/+bIX53HNzjNGO4Yb9sk8F8WVd
 rz3rtiaHoDTPHuefEUwhjoQ9wzgfNFDMoKr3QiHLDWptQP/3J+Poni2PoJ0JRHuA/la4hb9/3Ys
 NkvFYpoLgCcaKUsnnech1CUZoGwwC7KC6G4tYBQVt18hsLpu4fh5CTPaKfGi6HPUyles7uwVBb/
 S7EmObKxXi4KV/+OXp3NKlKtPUFdaQ2bCCUR2VevYpG7cjlyQnEvef2j2D8Ry9t5CNsoX3MaVcl
 M5P7lx4M1am2yoXBMHgN+jxw6g+84yCA7uBLrrw64w1suOBgqX92afz3nwp02zICd8V6fWXsomN
 KOg2hLULoeVO/D87Cpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAzNCBTYWx0ZWRfX0xy1BoTZM/b5
 ObT+rVeUCGvF143RyDbSoviNJ10ciG+yyUiWnqeTAyxyB8hJEPS0varYfIIeArTR2qdzp7CL+46
 PeRGO/NOWElkTD2LaoRFqgiq3pq02W4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270034

Hi,

On 25-Sep-26 18:40, Liviu Nicoara wrote:
> On Fri, 18 Sep 2026 14:56:40 +0100, Bryan O'Donoghue wrote:
>> In the first instance the code will try to use the new PHY interface. If no
>> PHYs are present in the DT then the legacy method will be attempted.
> 
> Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
> lanes), with this series, the CSI2 PHY driver v18 and patches 1-4 of
> the x1e camera DT v7, on 7.2.6, plus a board DT for the 9345 (to be
> posted). CAMSS picks up CSIPHY4 through the PHY API, and the sensor
> streams at 30 fps through libcamera's software ISP and into a browser.
> 
> Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345

Thank you for testing.

It would be great if you can post your DT bits for this upstream soon,
then we can add them to:

https://github.com/linux-msm/laptops-kernel/commits/qcom-laptops/

and more people can test.

Regards,

Hans


