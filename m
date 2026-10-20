Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479349;
	b=PuLCELx6dpArbvzTXlpBCWtUI9DFiNC2NFpDT+lPcmbLuJKnCn10OTfkE2LPcWWFJvMW
	 gaIq/GEU5xl3IxrIf0ezkOVOygh3wXU/OziVjJ59nyCiKyBeyQ1ANLvVJUwratVCHPMIV
	 pynGAMdldfTQdlrA/dEgeFaF7KQ2uEN+BpMNFTCPLToiYfnWFtXtyspBE/4fnuI2BEUuy
	 y+P3dfm0b40OTGmuFacw8MwQqFCbiyxUmn3Ee46Lwgy81VkmD1gMs8nx4KdsMKdNTGyOu
	 Sd+b9WM1YRBu5yJQ5peA7oO02u025pwkG32UBdGRfXo/JYMObSzep5PeiB/Ita9bsaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
	b=APq7nY+5zA7+oUTz31NFEn6+TP/Zp4xY3nc+DsUoLLKqmYPR6EAw4tzwr6G17jO05VEG
	 cYqShn0lFZ1Zv1S8aG6HcrI/O9ZAE4nOwW7RfHay29A3O+VQFvEanBdyHP5+5HfAdFVTt
	 znZuMgPwrjW4s62YsNQbyCqtKNTfiRaVhgqv0ri83G8gr+iI8bVuHYc/nsD0LnRCVTiK2
	 W5nJIZlxHMJwnuEyMrKge133Ilp3KxKTZdAgxZ04/gECoJKWgaTg138GCBy3Xs36nfvrw
	 snGT1vb8JZzFanSNwUjGR2cBWw5H3pnCiY+Yzxk4Ce2TldPM8VLSmMfTUvh17pqnQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tGi11254986
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=; b=eOXZ77JOS+5qBwf8
	yoW8ccNz6u9NkcR7Ur48gQYnAw6ikuD/RzudVJG5cw9DQmva1MIcE1ziZzmp3XWq
	uBW+/fy8zDWIE9W7y1oPJMv9RwcUCD6UEmd0bz4cbWAv5gBw6XvgemJNgy17z+y/
	y8hwmsT/nHyt3EydGpXFXzgrjbg58hV9ICuRqW3ifduW/gGaaljN/dOXidJiXNKv
	pyIg68slO3S+tYxc01vAbjRpRmkPZxY5D4oCvU2o3dtTxz6td1bAOH/LF/f/WuAH
	Tp5A/fj3W2Ae5/YLvJK7Gfu6nIx2zbRf59hKDkiW26bKWiXEY94Ce+mRVOen0GzY
	6eV1BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n98ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4934971cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479347; x=1793084147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=GN94tP+bZHBnT3KXoZRkN7W0lt/V33IcJxiDEUjRt4LpIpb+VqBm1bjcyomlAh8wpf
         PtRNEaOuCHWW1r0gdsfOtWAvU9H6oCNetbV3pgHmKOKg1nnB9SGAfb5jA4u4ZsN/TZko
         Rx/l62hmkGXZuF9FDQZOhHnRch5mOxEFHE6sKlAKapXSUf2YuqOneDukIELehFmudWWt
         cGjClQu3bF+CM5+PAiE69q8wcilEGv/Qv9fkuNqJEMz+u8Q8b455sVD/mb2OKLG8YFBF
         VFnwKRp7hTTI0wqzqFKLm++0I76XpvEKwPHYnpgLDNP2/lAN5rFvJvFwXhIsDby6nLoN
         ovZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479347; x=1793084147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=D8UjCm4n1LtiG9WVfonlou0gQg6mfz1N2k2Ig1Ur7NZrsH43HwO3dAvhJ0kYBLaBSH
         Wi0tvarYZqbKkbujwwcXFO4mk2JfrQ8SkzE3YKCYYh4ZqoOLgqHummoirV184qUhXMke
         1xC0qkiUZ08KcO+AuAwFM/wGSdV5oWfYSbHq0219e3SIezzw6zRl+u0xloOD12RqHLhR
         RmRxV6YxEkgK5ngr+QfcJCUsorvsqx+NjtQPRqMi8f+NiMi2DmVEINlaKuVLjROSwAj5
         dV/wxr8IJFEPcOUxQ6ch0cVvwmWMUBY9AZx2zE0W94kCYhH20z4fRMaU0m6RQuMGPfGB
         oISA==
X-Forwarded-Encrypted: i=1; AKwUvBxl/RG92XJn7SrJxgSiGqFZY1QP40FSeY2tVFhM7D3dzZCzAf4QcuFA4pl09qstgh/DJS7YfTfKlhYBVzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXloldjkIbdPdVi/urhpRwdcCt3qeI3TVwBq6Rf7YJsLTYfvoV
	QFWrGrv3zgB+zo95SN/xNf3zX5iBZIPd9y/zLpnmdTr5Lc5vLLzQNF9BrPJR9jv6x3f1tjqL5iM
	EN4wxMQslKIdy27Q33zU/kUaTbWs3+ADREbbIp4yMOypxaVh932g3OLIArIE0QMFUgI0=
X-Gm-Gg: AYBFou0o+w53nYq+3N1SSA+Hw/UL9ztfYucwyMnk+yRdpR8ripRE8J1ATcleysTO2bI
	5JT6WkTW0WNxeV4n2e+t3Xy3EnKn5XZq/5KkVZdp3QotTCTSgRBWf2n23ZJKNXhLf3XB5uUgBLn
	nUXJ6SfAziO6zBn/Hy3sT45hsG1sLGVj7op+DAruuRhhHGmE5MPx/JVoM1W8gwf9D59GZLIh3zu
	oN73FOEB2vx1KGm8uRJJbEe2W+gt+GYsBlAh/w8y6aM7T7nw5Vmc2EliUZ+CuV6UczOjfCH8bwp
	Qw9zxmEMoZZUqdiT/ur8oHK+UaLhyCKN3MU4PxZgFj/axLxBqz7VyoS59iI9Wpiwmc4sdYwI/B8
	HH324si27Em1iLYuVTpwwNQ==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672931cf.3.1792479347255;
        Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672411cf.3.1792479346744;
        Mon, 19 Oct 2026 23:55:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm462296566b.67.2026.10.19.23.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:55:45 -0700 (PDT)
Message-ID: <4df039eb-f89d-4a82-9f2a-dc90e31548d8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:42 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wWankGP-K_gdwTtfT-ScPks6jlBbJ9WH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX4Eu7wNLTkapD
 rqiX1C5xv1qznxNBpdu3IvtUtEc5xvnUaoKSm+oItwR3a5p7HsdTxkvlJKJkxkXt9cUGgRaJhMU
 VYg7TiTEKg7pqOyRSTQUC1JoOE7m56++5XaUXYNlS/AHTEGL6A5fEeYwCuFLrVv8fGcpI2csJpl
 Y1zj0jhFH16TdsNjjKOuF8VwuDtiZBC30udnCHCPv0ZUBkLx2z9GWOWcj/FuAdOjMvJmc7Ixn9g
 o/4iClgMpcGFo5lEGsy21yolrdL5R+7VZkTGuJ5CuXzjuSVAu0Ku/3obQVovJIzER/lF9Frs7pW
 mR/nsQ07JoANa59H9yCWpp+YMM701xLKpNCV8IBtpcJI+Vk44zKqve9JWrvipH8D14rjlDJ9EE7
 iWyizp7kYbAOoXyaFdtLFbBK9SLXjr7HHZxxivwQBBPtKsJkEYOuZtWvqmLX/MmyI1tFkMb758g
 r9Vt3ljM/9WzUlMFZ0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXzIVstKlNSO5Q
 WK6lN1QhYZfTEHjHxrlJK00Jm1zPmvkTERDauBt085EcXJ1ZHrLuMbt2B/oSgvv+ShN+465QKkY
 TS0f/Sgy2CFnhgtEmENLTyNRZm0N8hI=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad71074 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2OWSJv1YRWKtX4VDGZoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wWankGP-K_gdwTtfT-ScPks6jlBbJ9WH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The CPU clock controller of MSM8996 Pro needs its own setup, which the
> driver can only apply when the DT tells it the SoC is the Pro one.
> 
> Use the MSM8996 Pro compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
