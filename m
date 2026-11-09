Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239854;
	b=T2xXxySxzvsXgiXgq9OKPbwfwdscYCUMDt40CH04LjBqsxHXKQ5CNeTfWq+eiYx4TX/h
	 +APn8LJZ1RnJYTi+PbmNbH9UdJUCNe5RCOEWI30CKSDIgB7fK2c9Wp+zt3cutgcPI94/v
	 BX6vkT2ugAIFWnHlGgbQRzGTPEtbbGtAJga0XQuo6oMsrv+Z7bys/mHeJvoLO28Qnbeaj
	 jjffr482M69YDC6kUTKAqHtBAyuKWFkhPIp44WR7pOg8YNpqdKsIsEiQF1+99oXepfy4F
	 w+MbFcP6YjsN/bJLpQHLqfKywLgVPz/bQ/ExsSKlPzSzrFPC+34u6YAMOlp9GZ9lYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GHS/9W5ZOpYG+KsSa8cSSai+MXVacssLeqix/uJJEC8=;
	b=2Esc2zPbfLxbl0RcHCEqLPrjDOXJoHRE0c36hwVt8NgsdGzQIjvAz+FGRofs50S9szgW
	 Cy+bQgTL+x4WgFXvSAeoF4hVnWSa8nf6zoI6jZt6os1k2WpmA+VLsUplQKcK16KXahHF7
	 igTAhdFmYTbJ8CgBeDF/RafvftT6GjtCPJOuEHsb6zIYc2WsTTUu3hHsVXkdPIgcSQ0n5
	 LyO9BseuGmVFW7yPLbXWFrrJ4ZlM1C5W06y7M+ryZeqCCKqsrRTaDnnJ3vr57XiPecuZU
	 zo28t+i/hudcDad3+hAZchVZ/bSC1t5t/Kq4bcPGpKmPQjapWa0ch1ZMtX7T01+5O1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkrB5CnR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMaZgVqJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF18606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkrB5CnR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMaZgVqJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFCZL4025841
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GHS/9W5ZOpYG+KsSa8cSSa
	i+MXVacssLeqix/uJJEC8=; b=KkrB5CnRElgC2haOIQDTtdhDMYI+JC1Qs56Nkt
	/y9ftvE+eXHdR46pHm6CdCQdUjPW0EnY8jbp8vGz4JnRTJVxEuAwA0zQ+hI0y9xX
	QYPIEabjXO6klNLnJkK+t28tHpuLrnO048/FBVswJm4VPT+1J4wxNtSAzPKNQ4l0
	DOld++HL8itPJvDZINZ8+4L61wGE21KabdrP88Qrh0JoaLzhHsoewDo/MS+r8Xhn
	vBOhGU1bNWPK4jB+7QtWPVNAQYGGUeOqvsqhU5pPYD188ptW53sE7dNTnDAzhyma
	e392Uy3LR1G7nLdLebBjlMHirrSLJQKOYX6DNYVMCDmYeJkA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589p7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907539aff7so831315241.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239851; x=1794844651; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GHS/9W5ZOpYG+KsSa8cSSai+MXVacssLeqix/uJJEC8=;
        b=GMaZgVqJCWr/wPc57aaAxhZODLx3QNJhbu+aW5+7TXL3KWQvvkZmvJTDySueqUg6ed
         a4TbiEvPaOyq+J/rxTUSc4BQMZeE77zmKRbRW+sllWDJ2Ot0RugRr1DArJQvabd2sDl1
         Zv0rnB1rXC+rDZqDXImekaTjMI7naX+gvuq3AaTtGcyE2vBfSEbgcCsJkPP9kxS73I/Y
         OyW3I/9tGWrPsaYrJJ9VfO/ifnCgp6AMK6gmakt3kOxc2vdqlC0p4im4Q7rXwfVDuR6z
         ymEIe1Ux7iXt55IzCRbo+QemD22Jw/uLqll6IMKN12Atki2iz+feCOFCOmD4y78bjnb1
         AXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239851; x=1794844651;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GHS/9W5ZOpYG+KsSa8cSSai+MXVacssLeqix/uJJEC8=;
        b=ez4VsSWSG5EngqFF/M9IMM/uWB+SxeJyf/K0O3K2jRtUaTPABHnNPTeRunkDhJG5Zy
         Mw0G+yfspENo60AEaAOBX+uPmE0OseEiL81sqEds2qjyHsdSGLfpamk6kMMJAjPindDJ
         QmsH+BQo8HHkq7JqWH1V70dZgRDbmtJuE/d1Nfj/yE3gfrxwN0/+VNMlKZWbytOJhGe8
         dtJjWFjpDwokf7oW7b6RtdLWL2KZ3f1UNWyVEvHUJx/85T68yd4kx03HQNsXn+g/Qto8
         R4SVt49LA7nS0Eagvh19JmOCVURSOmp/JzZzVJLMPo10LdMsyH8FEx1hXlerYBab/ZaK
         1Lng==
X-Forwarded-Encrypted: i=1; AL+hErG7mwkQfc3KCYopQ8G5UCzZoFJCVrQsmtwdtLSsWArm/mtcObjUmy3TW5Uduxtl1+Ljw3ViYzNSikPohqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5z8ehLu6zBb1Ndo1a4JVRQnM56TNkh2A9QH4qKPUtK9u1JkHu
	X4nPxEYSxUwHjqmcJk1JMiUoHOtSszp/04yBeNkdI8R9njq7KXgOUp2AqnHsInMS91Np4vpbM9R
	wOmXNCPj15fiVCfv+hHGhodroVvqX4cTcY/WfDF9rar2sckkyUgGNjsjIaGUy/EaejoaoLF2nfA
	U=
X-Gm-Gg: AYBFou0j8iJ7kZKNwI60KNAzoFwjsMSpNldaE2HPa0WvQziPoLrtuOa3tqa8HHFkC9+
	Uo0Q7KKeezM3xS7l5LNbm4hyTDH5eMGnkAJHJgIGEjPvPUz3bQeobtgRyUXgTKk754wMXwJFPiG
	SzY4wXr5XxFSye/c6ZBEqyrOIj0ZFLN0UwTClPL2uMnlYjhqPkKZYic2XKGKdmsqW/++mX46Qjd
	gIxTnFSqmOusbrqLmv3oAsuBE7LcTVcP4tDuIK0xx+XD/yDk3KXI6pFZYhg0dqQjhLBeV1wq1MJ
	C5Ddz0K3+/Bsw18500offA+ByTn/Mqsv2qUBo6KkKf1eS1HRdk7nxTX3ukEwex23AZhM1be/+NQ
	tHuu4EJGr+ioVf+FM/5QahGDqch/czNhbLXXKGk+ijy3098zWGSH778RQyTPtZHLmZh8+cPSsAV
	Emsg==
X-Received: by 2002:a05:6102:4b01:b0:7d2:d9c0:2e96 with SMTP id ada2fe7eead31-7d2db2f9675mr1668006137.31.1794239851284;
        Mon, 09 Nov 2026 07:57:31 -0800 (PST)
X-Received: by 2002:a05:6102:4b01:b0:7d2:d9c0:2e96 with SMTP id ada2fe7eead31-7d2db2f9675mr1667982137.31.1794239850766;
        Mon, 09 Nov 2026 07:57:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm143607065e9.1.2026.11.09.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:57:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:57:25 +0100
Subject: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in
 examples
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
Message-Id: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGTt8WoC/x2MSwqAMBDFriKzdqBVqOhVxEXVVx2wfloRQby7x
 WUgyUMRQRCpyR4KuCTKtibQeUbDbNcJLGNiKlRhtFY1H8Pm+Vy8Z9y8J2VcwL2FdTBlVcJQSvc
 AJ/e/bbv3/QCq1kOSZgAAAA==
X-Change-ID: 20261109-qcom-tlmm-ex-phandle-baeafe6373e6
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10695;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UXFFZ3aJ7yneF7ZsDRankm47eMBNEm0TaoVDTHVEZSU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8e1okyN1hFuzZDh/rPPQ7A2r3R8rWomchn5b5
 33sbCg4ca+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavHtaAAKCRAFnS7L/zaE
 w/jNEACW6otbaHKUpyAcOdsyFfG/2T4OlsUNwkiYEULcQiRoCLfwMsxRSBwYk5YXZpq4QP+F8yB
 f85Ps2idazcZUuGbxGdzH/iXGrgDi3uEBQm4FDjkltunpmAM9rAZNsy2Xf6atVygomJ7KF+6Vfw
 2Z4xljryZcqeABeoPLlka1aLHUxFRO0Yxv+bmZzj/JbxqkIGYsEdWyWXLq3IHV35/iAITBAahLF
 1C/dVlRRdnJpLj/a1NApHXzWxwNX5m+621ZaJvka4aILV7rSQYRXoUFvvz7gee1MMmp6cWnslRg
 eBFugld/+BrXdCMLokSJG2r3E+mjsdXZjHwKfa3C2N9srZC8v+gkDBDUlCY7eHU1aiYsygmGxTK
 Wc5zoWqd2X6SxuuQKfsUVg+lIRfdj07h4CoPSMvl45a0s8QiPnClYVwva0yzuV/ITQ2dmU57Zl5
 g1PDx2355UilDvC/C9mQiQhgE7nLnwkttnpyOzdgCRlY1YTh6BM6Bl/mpswibSnQNzn7L/hlMge
 4SMENblxQdjxfIdaNiCPac2c3/N3WZw66ZAdPaRA3bdO2I/rJNaSFaJ6QxG5m/Zle2SYRSRUDbN
 OHqRacFsMwHHuzkRVWwWCMxEjCRIMnZzr9Hc2vqqmwtt2C3D15LPTJt2ti4g1yr6siqjam7xUFL
 i23BxxqNcMD9sSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX63E0skZWRcZ5
 JSeZ4Mbo/J1hAeoSaVfohsHeplR6KrrJqJhQZBb4ELS6fDQDw5+ZLFGKRHE1/szj9JkcRsYg8l/
 BbVcFE1cuF0GjOr8r4aISQlqRyFsAXYQNuzJx735nSQlVFknaS9mLjiT2HC4m8zxXdZwDKEKm4a
 72gpe9ij3UmuZPLVz/MyL1y7dvXDdhuouY8St4TkDd+JKeHDyrHyenA6l1PbGUfup+gpL/6Kmoy
 TYVFk+0uCbCKx/u8uSXWHmBmjdEDo917+pGnvX2z1KeGdEMXfZVm8zUVnnacnhkFoAc3EoS9wUQ
 8c8P3xiXVkrmQfRA5ZzOr+c0aYlnNBsIEonHs7XBF9ydfWS5igzAA71mRkxSNCNJ6yqrGR55mHN
 +lzUJ2qt0B9bKmt00juvc04FiCSu9f9m8NHcXfRyLuwXiP6amMC2Gs505LkoO/mOg5qkBfx/nM5
 hpOeb6vSU3lCwEbUpIQ==
X-Proofpoint-ORIG-GUID: tHtqhqC9DlnmTw5fQWoRXVEFC0-kpXZl
X-Proofpoint-GUID: tHtqhqC9DlnmTw5fQWoRXVEFC0-kpXZl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX0KmE8PFatqLO
 GkvHw/tIogc8tQHmqnHBECabe47BsAHtL2X2APIqkhLK0flijmz452xDH+xaS9zmDDLt5xMs8iU
 oOy2LeNw7TN5YxCEDu4qkSyl0vdgeLY=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1ed6c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0WL0dOjlh28m-vuih1UA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090063

Several DT binding documents for Qualcomm TLMM pin controllers define
the gpio-ranges property in the example node that references the tlmm
node except that the label is missing. It's harmless as we ignore
non-existent phandles but for correctness and consistency - add missing
labels.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml   | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml    | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 295dd5fcf4c3d261b3f6139b65caafdc5c093b5e..5eac9e5f44b8b6915e994deb1409ecb0f369f471 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -106,7 +106,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    pinctrl@1000000 {
+    tlmm: pinctrl@1000000 {
         compatible = "qcom,msm8909-tlmm";
         reg = <0x1000000 0x300000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
index 88afeae530c68234506c4e15294c0a3a617e5902..e2463f78a51246392fc7db3d3ef40e9ebedabe9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
@@ -101,7 +101,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    pinctrl@f000000 {
+    tlmm: pinctrl@f000000 {
         compatible = "qcom,qdu1000-tlmm";
         reg = <0xf000000 0x1000000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
index b388380b1ce02e21283e2200bce241bba6100024..e304a3a0a005158a48f762877a812370c4343bdf 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
@@ -106,7 +106,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@f100000 {
+    tlmm: pinctrl@f100000 {
         compatible = "qcom,sar2130p-tlmm";
         reg = <0x0f100000 0x300000>;
         gpio-controller;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
index c122bb849f0f72b31d24cd0c23fdb0963c625247..bc15d9758c64989fe2518deba1b76a6cbb9a7834 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
@@ -103,7 +103,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@3100000 {
+    tlmm: pinctrl@3100000 {
         compatible = "qcom,sc8180x-tlmm";
         reg = <0x03100000 0x300000>,
               <0x03500000 0x700000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
index ebc3a8b34a4c625f08b48b72c56fe878a485d655..8878b3d712b1d2b3ba3e9a14a470edca679b7e2f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
@@ -108,7 +108,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@f100000 {
+    tlmm: pinctrl@f100000 {
         compatible = "qcom,sc8280xp-tlmm";
         reg = <0x0f100000 0x300000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml
index b56e717aa28e77449bd19cf5f821129c29f64e31..e1ba3700925d7f196fe69d6affd42f9715e093e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml
@@ -94,7 +94,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@3400000 {
+    tlmm: pinctrl@3400000 {
         compatible = "qcom,sdm670-tlmm";
         reg = <0x03400000 0x300000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 3b33daedc018a2e5ff3a78304677e576833a55f1..4bebbf9ca60cd6d6d94e9b86f854f931a7794e27 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -105,7 +105,7 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    pinctrl@3400000 {
+    tlmm: pinctrl@3400000 {
         compatible = "qcom,sdm845-pinctrl";
         reg = <0x03400000 0xc00000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
index 5a57a59cc1e579bdecffcd52ef4b2e95d1b5c895..f0c3a8806972331a7f6affcfba45b3228819977a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
@@ -101,7 +101,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@500000 {
+    tlmm: pinctrl@500000 {
         compatible = "qcom,sm6125-tlmm";
         reg = <0x00500000 0x400000>,
               <0x00900000 0x400000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
index b262af6be97da3207e2711a1367e400b2a25adae..5333930fae01e975b368b9a163951ba31ed8f4e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
@@ -107,7 +107,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@f100000 {
+    tlmm: pinctrl@f100000 {
         compatible = "qcom,sm6350-tlmm";
         reg = <0x0f100000 0x300000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index c11af09c3f5b89e19e82d6f77cd72a69dc3a6afd..ca7fdabe62aa209cba8971eabee19d4469ccf539 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -110,7 +110,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@500000 {
+    tlmm: pinctrl@500000 {
         compatible = "qcom,sm6375-tlmm";
         reg = <0x00500000 0x800000>;
         interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index b5d04347c064d598d8600333f415fa412255cd2b..b11edbf8bdc05739a34207be561c49c95c64f221 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -104,7 +104,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@1f00000 {
+    tlmm: pinctrl@1f00000 {
         compatible = "qcom,sm8250-pinctrl";
         reg = <0x0f100000 0x300000>,
               <0x0f500000 0x300000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
index ec5e09611d810ca13b8cb446d97f5f4072467c8e..dd84c715bb260687070070f835666ea5624cc83b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
@@ -103,7 +103,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@f100000 {
+    tlmm: pinctrl@f100000 {
         compatible = "qcom,sm8350-tlmm";
         reg = <0x0f100000 0x300000>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
index 16fd2c5e233931565c40c905f120dfd6d94f69d6..04f0655f8e72d8538da4e28f2f36128104dbc22c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
@@ -102,7 +102,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pinctrl@f100000 {
+    tlmm: pinctrl@f100000 {
         compatible = "qcom,sm8450-tlmm";
         reg = <0x0f100000 0x300000>;
         gpio-controller;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261109-qcom-tlmm-ex-phandle-baeafe6373e6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

