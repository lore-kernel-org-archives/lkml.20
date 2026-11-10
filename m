Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315492;
	b=SwI+MIGA1ptoQLCAmrFUbigOz/y9ogdOUthPoq77Nu9wyj9TbYX5dc7iW+5rn/3op6Uu
	 jE4vXpN0+jxJHRANjLIueRRNFEcBIk17afskarZcWA+cbG3GpyIfo1N7DbHyuNMqBHfDa
	 0C2LzvrVVPaqKzFFScJwDGMJTjRLO5bRRh5g8pRaTfGkqQSbrw5Qh5FAC3va59XNHlIM1
	 tzRJVKGVu7truS++Ig00hChOqSMfr3CNLT+hXl6AVppH2vdb502C6MI6XQuk+IX1XXGvc
	 QPM1draz+0UkO5SxVoaGoSeW3J1FL9AOldr6MPHGw8FqNkgB26g2rWXOMv/FIkRiHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wAiJMqWpnNg+R4hoqc5xvD0lO/Ez2TNTdCF9h9P8j+E=;
	b=MDiP/fMUSkeTXQ/0NOx3pqBXC1dJF8sn3B8ZNRHTHUWVFlVyJB9eShe+bs+wEDPlf0pg
	 CZDOEb/Oi3s7h6Jw+wfRAaLQjumUj/Et/QOyG4harpf7XdQB/uSOSyb7/RgcbNPe2IAE5
	 XyB5fIiIc7g1uIQV1fg48IFYjxji3qQAUojCsN7wG6Q7YBr1a+AW7J5JFLfv9KWunq88k
	 vc8AqG+ong/4Czja4pN5rcOVmFlVycfhnkCJb/jAWuzfrILl5e92pKx6XZ1oM7jcZxeF6
	 9tu84ua7wnkJ0IkfLn+++8SmoZvGrtqztRH5eHtrGXG6atgtFLlssTpqbrNYufQkMlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrC4GaZ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EdxQ0Ppq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBF606BFDF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FBF606BFDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrC4GaZ3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EdxQ0Ppq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGS72881243
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAiJMqWpnNg+R4hoqc5xvD0lO/Ez2TNTdCF9h9P8j+E=; b=jrC4GaZ3NGSWg3lc
	qcGvOR8Sh+u8vkQAl2vJeQj7mXCp4K00+XOegd4vhw5AKaxq+FJMFNvaMEXpb2+6
	kZVCeQFVrg+HjfFnW7wSxzBToy1ne4DT1aPlRNtq1yi+lJAb7NFAPAOO98xLdC9s
	6+nAkkluBMrOek/4XC1Rmgj9pe+HLoWWMi89r/dJOqURDOgyZir8fBhOGvRN0Smu
	ptos6eK4B/NTmdCwxrGegApxsOGJDrpvEvzuMsPJI4qObgLx32bEOuqqCKzKTbkb
	yYqPEg+omgzWsxS6/P2SHV+tfPez7+pharmSXvMqIlgtJ+sru7EXqeqLyd9SQEyo
	udVBHg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux849bhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99089f9591aso408477241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315490; x=1794920290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAiJMqWpnNg+R4hoqc5xvD0lO/Ez2TNTdCF9h9P8j+E=;
        b=EdxQ0PpqA4Z4XxymHUeIVWjCEOKkbCF6K3nqQL3Y2xp0M4jCtFZVFcBEoTiNJn0E3J
         F9QFZVn7i2CFXXebTH50EpKjqOM1fFcZimKpeoRKleYJwho5fcIihXycbwdjK+LgGEZ3
         95j5lTr9YuB9CpC5HSjw/fjBM4ypzL93uMxwkOoPuiUixQJ4zatfwGFx4MFPjc5xqAmq
         +V6OAw0H3OYupQwtvsAVU39sE6h+XRDTs0kgpgIfJ265VdfgQzgqHppoRD/akPa9mHBF
         Xe+O+xiEkkvveNi0EWZrVSlCqY1FrWrPfiJoueITNE90Jo0/YqBa855vPAx4VhJGjZzU
         BJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315490; x=1794920290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAiJMqWpnNg+R4hoqc5xvD0lO/Ez2TNTdCF9h9P8j+E=;
        b=kC2wRp3Jz4WwLsAs4jijAMPszuiZVjhfSwWbSSoYvieH1D5Ju9dNP7YzSFLwfl8d+Y
         i3FCJszosMVDU9fLuApTQ7r+GLNwges/Zuru/U2nfpluGJcI6sjZyW/y29NfWI0omwa5
         /GU3i0eE0oS5CIyJtgL84TFiMRV6K+AGsMERoJI874d5DweKdLc8bdYkT7W94h9Dm6Au
         mK6C48IJZc7FsSBoScNBfBhH7eZ6ZuwbSqYK+jqB+MvQ6fadkcvlzznF2iuepLV2vKwV
         i1EDz6EUJIAwa63E7cw3PimoOLhD5pfjag48QZpHJtLWJVuMydvbR+cvAsR5A0XqEA2l
         RMzw==
X-Forwarded-Encrypted: i=1; AL+hErGkBlRhKZhiZmPlkT1PK+/TPIjTUnV6znBYDaChXNTdVYo8ubkCPCYwwizI2KbtP47rVHFcpBdBAmgWMlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gn3m9Ugye44Sgfu/eKFAlffU1b2lV2WTGHIlB0WUyzOAA/m75
	VC5YuO/0XkwOOUkf7fW/7JzvBBDIo0tzcPB9Or3Nqikbd/TzHahaAIGfn5eUb96+J1IBkruSOdW
	BsX2j8UDTw4JE5kC7jtGWZcFMGzIxm8rYRCZCFlxX1uWNGAF8muRmL2tFoWuM9y6uGsc=
X-Gm-Gg: AYBFou2ap7kBZNZRHL/OyIR2AVEeumFHkz3I/KgF6x3v40fTBbQyVyfVu1bLiPp4EpR
	NyYIIT5IEP104vCq4L+wNqAUdrh/z6M0cN8/X83LCV3+Mcskj8OeoJuDv22M+Fk69vIZevbmDhQ
	mgIot0UYKDIC8PRep7mriUXQGWFIxU4JFZAAXmWw4W7n+CODqq9+iXVatuPXgBSxTxU/5fDcsbC
	yPxXowj8/WL8pnpdxFmj9Mmecy9KW1OwOvYGQAbiiZVInz0vpzyDPdyXZqnpqqNVIeGnPMTI81o
	Zp4o4Drlgrpy4JdGIkn5qeAaCsfI6sYh8oR16+GphmVgtYFJLfcwoBSVPEbKv2nhh4GenAfh2KZ
	c964VZU+6rRdhFoUg2qRSQqsJAXX/ExNoUoTMGdi7JkoUfmaTSuPh31fKH9VNXF0S9JMiCQ==
X-Received: by 2002:a05:6102:8099:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7d301b84a1bmr723259137.13.1794315489432;
        Tue, 10 Nov 2026 04:58:09 -0800 (PST)
X-Received: by 2002:a05:6102:8099:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7d301b84a1bmr723219137.13.1794315488825;
        Tue, 10 Nov 2026 04:58:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:58:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:57:44 +0100
Subject: [PATCH 3/3] dt-bindings: display/msm: Require DSI graph endpoint
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
Message-Id: <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
In-Reply-To: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20896;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jVfl3G/A/ovepjvCEApoyuwzDNXZPvf82oVnUVtYsk0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTSnBVEUs4tyW+qFM9vlmmV6yBKorhjAgm2/
 Q3BW2JEEEKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMU0gAKCRDBN2bmhouD
 1+G4EACLyWP8ANjZsy4CMGV6aXtETfcV4RihOKue1KzQGtxxzxmlRPmR+JgTTs5E1NLvgURlX7s
 9JVn/mxwKpDug92L7pk4D8Gn9gvXtDbk/SvHEs9i9rfwWLJJhH3eh/Df68vxCtZ26WjLkPqHaJ4
 EOdS9g37dz2oHCjXsXzALAAfZVxj1GxMLf3EvDE0RUpXqZfE4tPdg6Arl5K5MZYGdsmKNZpCmLH
 P7HuWQ5f0XygHzvWEWRnbqov6qS24ahTb2sAdl5CNGSFLQ1c5Dqx/aH+svR/MBVPY4fpjsOGTWB
 Db8b5r7pxUkJK86zJY4p3aF5LX2ESKzwcCYlADN6TwBtpmb4O1S21QcERefkId1Ma5kk7LdWKku
 Ta2aaMni0t/O7coGPzyydLZgKM6lBOT8lQFSfVb3qPyAq9dGuJabO4AoTygbeV/OvJBtGg43mUN
 QcBp2HpPdZREPePX5b78JALgVSZajaKdHGlX2E8zuii+jy4BElg+X+rj0lJiZSpvufJVRy0IIJf
 hi+CfOWkpQDKCLiWiNoXRBhE5PKMzPAlmMULXMJDL3Ywzm/W/0c+d+ADISY6HsRIl/Nwi0DUaEq
 A3DR+upNj5JB3Ufbyj56/ndUKU99PCAchKOusSFaiAOmVaHv7sYz7uxCoC/IC5ICGgboH8rBtBj
 /DXxhttvFbX8Jyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX0bsYywFms6c9
 3CnxiT8TVwKk05sNXWdjYvVAmL/A7sVfZoaeCIdqW3VFGwRHo9RLgk7790rt9DrchIXuV1UReHV
 UnwuqUP12ZS+lCK3ism4LWMlvI+IrXcMX+MW03UwsUovjJQcabUqd//s407ueKsDKunfvPceZaP
 mmgwQLK40bagOTZV6F59hGiRzdyuchcRf6zRXY/nziLEpnM4o/GiFSyj/v/88YJCCsSnrTkTBal
 ZiSrdli3iPjnwElOKU9hYhP4IjvRjUzAQ8VwUYhZEAbyXGNky6zfy502Y8aBD4hZNDGzbKqqHNN
 qFyr9k7LFWiW9a8lc2WPY2bAX+BNIoWCU7IOEtQdmbeSBhjjHPABA1kQsErtbyUbIEFIbNCkR56
 ZyZUhl6Q63jgtty7O4sJWCyPwvdJ+ndE9EXrVNED7oixtQWS8ee0o+KG9BUyfVzjtmDG1SkelRa
 ovC/kaPFsfvtjbU4YRA==
X-Proofpoint-GUID: CUwo10xCM0PEski0mjsDlaN3YIqHx7Xz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX4nzObnz+PvwU
 gg88kOo2I5JQ2iKCrbn6sQDs1/09a3bv5f32G0KWIsngfpKD2mkx8MckHruxfibvuFrcAC4I98l
 BA/F7YXA7ZJLRDZlDu4QU5QYboYojrU=
X-Proofpoint-ORIG-GUID: CUwo10xCM0PEski0mjsDlaN3YIqHx7Xz
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af314e2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Cjt56oMJJs6jdj95yyUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

Technically, DSI controllers do not need OF graphs with endpoint to the
panel and could rely directly on their child node (when panel is the
child of DSI).

However Linux Qualcomm MSM DRM DSI driver never implemented such
approach and it requires a valid graph endpoint pointing to the panel.
If it is missing, the drivers will silently accept such DTS in
dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
of lanes is not initialized.  The number of lanes is initialized to safe
default only when there is a valid endpoint which is missing data-lanes.

Extend the bindings to validate existing DTS to match expected ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 25 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..e9446a333fa1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -201,6 +201,12 @@ properties:
                   - timer3
                   - timer4
 
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
     required:
       - port@0
       - port@1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
index 7010ffa0ae35..8b9f54f189e8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -241,6 +241,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 2d9edab5a30d..dafe5c5d4b75 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -181,6 +181,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -251,6 +252,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 49a7b5c4c678..60ba466382b8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index 287cce4dbddc..c00c4d5dd918 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -235,7 +235,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 6c827cf9692b..4dc0055cd841 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -257,7 +257,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
@@ -334,7 +336,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi1_out: endpoint { };
+                    mdss0_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index fb3d24bbac7d..3e4a25a217cc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -326,6 +326,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -418,6 +419,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..16ebd5d701d0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -206,6 +206,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index b643d3adf669..9f84ba248a83 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -230,6 +230,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
index 00e82bdbbcc7..7e653552fdfe 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
@@ -242,6 +242,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -333,6 +334,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
index 7dc269322b8e..4430baecfd99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
@@ -196,6 +196,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -266,6 +267,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 6e8b69e5ec62..1330a5f80e3b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -192,6 +192,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -262,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 309de1953c88..2993fc1eafe6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -179,6 +179,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 3deb9dc81c9c..a942a479a440 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 46e9335f849f..62920c8fba0c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -221,6 +221,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index bba666bdffe5..faafc451633c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -201,6 +201,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
index e22b4c433fd0..46a8539308c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -193,6 +193,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 9b0621d88d50..5ae181bc4fbf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -263,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -355,6 +356,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index e6dc5494baee..7edf4ee9e52d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -231,6 +231,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -321,6 +322,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 51368cda7b2f..bce5ab069324 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -234,6 +234,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -324,6 +325,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index f5acf528d0e4..b9087a06198c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -236,6 +236,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 747a2e9665f4..800144f1c7e2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -243,6 +243,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -338,6 +339,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 59192c59ddb9..977c2fb1595c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -239,6 +239,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -328,6 +329,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 0f7f79527748..05cc2f9753ce 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -227,6 +227,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -316,6 +317,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 46dc0d28da29..0a8010f4d9d5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -364,6 +364,7 @@ examples:
                         reg = <1>;
 
                         mdss_dsi1_out: endpoint {
+                            remote-endpoint = <&panel1_in>;
                         };
                     };
                 };

-- 
2.53.0

