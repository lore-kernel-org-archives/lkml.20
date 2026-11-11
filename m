Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419130;
	b=Hoo36VG5JfHF0MVh6d/hGdW2/6nye63ML/3gJpbOHWgQEjOLkcy0xtnkvY4JksA7P5rO
	 gj31OCcfPyHgfQwAmFNiiZRodDPnnMMBlQ4jWhslcC0YaW4R97lcAnezKogkV90eSyL6w
	 ptl/WxvB0wsDQPwqKwhQ2bIOr/dXbWSCQnq9n4OeSL+U1fns8JIAKdjkRprCgOaPBhLHW
	 g2vtIXjfGPb+9PptEvG1RZrLPTwFGpbAct5vx5HECUBxxPimmhZQvMS1/VhvzhkZyIF3M
	 47+6Al5j9SD75diRHWIOTXd2OxkkaKKe5zrTHSq62LVg0JPnNg0b96VU4GkbI+B2afQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
	b=4rUvEVAMFL2LRPQY14a5S7HWt8/fxriUeeSIwymyDS9+7cAjHyLumlQJWqza/+viJCMb
	 ma7fsrMc9YrMJx9LX7AQ61C9TUNFYtMJKoFPd4NrwnYa69yqtKkA7QrUGGHwtQ0XnorDN
	 Jw20sEvmTr72F8y1fXHYMDDR4AOzk2dKSAoH1ehmZTMCt3JQOa16iGPM5RX03fakUFn8Z
	 +l9O6YJ5ARW6bugqjXp6SQLRGLU+q+RSnUFnwN6ly4MANTb4XJwITLDRSJSC6SUSVyWq9
	 UI24m4QdInaAxMnTlxhl7kBGIpmW6CDgieFJzRVKyX/yymmniw1sKlq27QD5ruZm5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDoJJP0e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hAUhLIsy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E6606C1C1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4E6606C1C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDoJJP0e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hAUhLIsy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0HNi2651040
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=; b=GDoJJP0eAE0qI/vF
	ZHtowE6+wn4rJ7X1HVwctF7CzVU4i5XLBCPqRX+DV4wlQklQi71jtv1R8cHkB0nQ
	quN5RMOujMVh+inBUW7JEkd24V8j+Dq1vR2jsM7ADvFPBeZPfLhWDZQ4PbIGzGxF
	xxkLIk8MFOOEXAtnnhhngoxLrJ3R9HRlSrkrkADoRIPyHj4LjHLwyjLeGyiBc6xp
	RImN9lia5D7QSD5ZIPnG4hFQXMTSCC/mTjebjX2CPICpkAi5fZOWUSp9YozFKs+7
	30tAWNODkQcXQLkQwbVp47+rn5k0oDDMZVmuM9Zct8akvtiNxFAOcGBvXUfe4Afw
	n2zQ5A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbys7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so541532241.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419129; x=1795023929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
        b=hAUhLIsy0Pq73OSCDqu4cFhudemOGrNuB3WKtiOKlMCERyhoJyMibCnVZIBuLdhzff
         5vnTyFJC5yPqln/z+t5uOWHFNOF7KS9GWn4pXeEEJWnJRReDGzxs9RLwOPVyr+dZ55el
         brkkdFxjhArWA/0x7H3+rfwXcY7AhpzPRVLvx3hLc4FC1HuRUdetjkwJxwAnqLY3Gl/z
         GgDE7vj0lHS/a0oS67cKh+BbsRJlUKVCKLP8T3XgXLVINJD1EgjGpeQ3pvT+LmkRRMCG
         /OL4er6+G6+wwaNS9N9dI0E4UpHSZMW07scoQdbndv0Jy8/3qVBAUNdGrb2PsVTZUPGT
         +HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419129; x=1795023929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
        b=qe7XsRquKzQ4qkkBNh1VWQWlHG2E4r4lhFil7fRO0xIbaWjBiPFIuHJmrNj7Zv1nDZ
         71UyhXBR6cHgeO9dHjD53lGcf7dXt++62T2kPF3kHUiMKY69s3/aTfH3JxQGj8eBF36D
         tUDFbukln/5y3HHZbT0IUo1mL27IpOAtMoetrQckmYVmMPD6aH+u5e8QqWxzmK47ckOD
         xagMyJ0DOIJQeklDPrWkThQGNxjcrllMH8CZCYXtK1Dge/elZdJZuzZnz2iNvwBOSwRb
         u8swf5QNoXShrqQOiTXz9n791GHpfhFTEvJgHMX01AoQj7F28E9aC2lCZ+aY3ytr+sKm
         IHIA==
X-Forwarded-Encrypted: i=1; AL+hErHHSF+uynfzScGZDC2eo/X306AtTOp8w8mZhT7Y72OrvCtc9J112+1D1GIkMccVmGsJGOLqXSiu+3Htgv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UFU496IdxhmCTjRaUSlI5pvxSL0hOGC5Etf7Na0PlMCndHHpi
	N/va38q9yptt/OolNBBd5dajrTNGlyz6qIAy25Mfwp85hz2A8H8lPca2inkjn7s3Jd7wOq02X3N
	5NpOmr1iYOmtkax4mpq3Qhd3vePIL4HlNsmWME5HIW9+0I9poP1BrewutO64QFxTJxDo=
X-Gm-Gg: AYBFou0hgQMI5BEQskIB6OEW4C6xZpyN9ZV3FDdoP5feeXIvEYMGWvsv0p919/m7C0s
	q4ogN8j1AAHfCH6iQ/Pc5dF/Zjmtro7vh33XP1jEWgKblnuHsvBDeOXDoSCdFtzKHmExbjluhJJ
	br+p8gQ5ITLISpcWzeIwTZlYybWm5c1Lp6T2RzkcDdvM70A6oULOJj6AFaxfZTc2Jv46cq40qR9
	ukx9TiehyG1lHImOCbCeJ8oeTjHnzUcTxoekKyJchxvlVwQt9XnSevu/JgYfT/SpDbrTwEGvQpC
	jCl+RdW3dkbfQoMa1fD07CuC1av9q7edeu4vdIz5kmlDVbqra8SZ1UcYPY4m2Y346hzfW6Fb8Mv
	HnZCjicVaEwU2xef6GUE8Wiy72uNCXDu+38Tb8flX45lO02IcKjLfEczOBTiBovmGklBVCQ==
X-Received: by 2002:a05:6102:370d:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d4fb168b20mr1157565137.5.1794419128022;
        Wed, 11 Nov 2026 09:45:28 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d4fb168b20mr1157534137.5.1794419127325;
        Wed, 11 Nov 2026 09:45:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:02 +0100
Subject: [PATCH v2 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
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
Message-Id: <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21015;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L3KdguA9EB/L3Ka74yLQYceKLesVgN0wddzf9NKIWoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmmxXJDxUDnxvQ/QM5vv19ACO7cQvXHdjcrv
 O7GKozlYn2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppgAKCRDBN2bmhouD
 11KMEACV+f+8YCBTHl5IxMqyhainpZoqN+iAyCkwQztut82vVve3dT/t/LSaEDEcpgJ4YoSyQJ6
 Uv7LMtB7HiMO4bBS/l1eStJB0ao0eY7ngvbETDvi1jEzuaI8PUzrPytdZPaNx5roQ5yyrUPU4xt
 2+d5mK2HlTpS6k+Q0QFuJWMpcSjqaLkQp5YnJYwXURjnSiki7doFkWEC74mC4rwVIipkqq8ZXUX
 y1AdNuo1YdpOU6gz8hXb6HiyMgFlJXwvRw8Xlm88ixptMxJQR2ju7VEVhy6o5z4O/Z3VF9zZpK7
 w4TOThyRojePZGaBc95QXxxVxkQPO7iieYu7kUiRZw2EevM2v0h6ycio1hAv5KWpjPlehllRY2x
 pEC9v3dCGf4JXCVSBUdOhj1BcXmAMNSleT7A51l+p2wSayQ9VsLqJwjwa+soH1NVRo063ESegQm
 yYutmSq5C+wmWfKkdXQGHYvdiYAnh+BXmkd4+wVxSgN0ACS1hvlbCNSwhzF2pIpz9FjgJomFBCW
 R3wK94yQFOpcgJhTaS4kCVwPSD0Rzq1EaZUQbrNmpA6V3mYQyEgPtf//19l9lfPIT/xGlcmcNXn
 ytlutxXtcmlVN922Nw93+kwOVYsU/LHoMptb3IIbUPL6G2Fvs4CzGsIdT+7VJyuH+YoFMuj0cT9
 lOP1uYjbLJbCMYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: eCK01M7WnReh_8XRDNyJ1zgqxQ7D886t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX7aZWW5OQxQSk
 3zDFsgMqHt2IS7zOCe1LQV8OCCAwMGs1G57uI4LNM/yY0AXvdb+0J/eMkdjeOrCeE7HKmp8tGPx
 FQjVv1QwLuXbiqB7mr25hTB/CSnr+h4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX/FOY1TdoQFxC
 zLK3iPUXM0L3CYUbxrfa1QpAb3/y3K6hhgK3B4y9twNsskFkM/5ZnoEnlq+2lDIHu60NucRA+ND
 3Eu7nkmfP8JvKUV0W6o6ingoxKlnfU2UftnGWqd4ADt99kdDR2OS2EmlLOm1U4LADZ3f/Qa5kKj
 ucWW7hPIDjCqMJI/7MEh2ItiFA+8hNg7vG5QKjfguX5zQQMF0r0TpsTonnjIOsR1lezAJjLwr5b
 perIMabqeoFWxXhDnAMbycCx/gvWlqx+Dd/Ejb+4675d1qCDzDcoSXi/vDAuPffLZmFJiWawmTj
 JEMyJnQz9WJ2pkgRrgDh+u6gJQr35ghQdl3st4VyoJMYH0g6H+q01GF8GI+JG6JpYMC2N07I5rp
 spLp6NTI8DLvaT6V0soTDCNZBdX2YnAnJpFpNNRuOU4ipLzeo7D3UqS6UevlcBatjNNL9Le1Dt6
 FReC48uMQp2VKIOB7YQ==
X-Proofpoint-GUID: eCK01M7WnReh_8XRDNyJ1zgqxQ7D886t
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4a9b9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cjt56oMJJs6jdj95yyUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110070

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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Please apply after Qualcomm Soc takes DTS changes to next.
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
index b68e7efbc189..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -258,7 +258,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
@@ -335,7 +337,9 @@ examples:
 
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

