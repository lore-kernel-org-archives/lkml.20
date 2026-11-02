Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608298;
	b=rtL8ZJUZDhkpKHA+wpfFep6KjeA+nZA5IUx+HCkSGkmc8mSsC6M0vnrn/SGvSQYs5UsU
	 34EJLDvYBND3iiSmD5QCX7oddQ0JPMuTw7UFq/zeqJxJwy595uuOGS4IlYYEqNV5ck40S
	 vYuE4MQxRWm3T8memLUhVncfR7BCwIkQJUE+u6d31lXOPSvBl3olZzYQ0oq/64Q9mvvk6
	 pATXTGk5PdzuixOfoABK0VTMLYiVgA11SOUsDEfWHdR5x/dQj34nHyNiuHUprPjw88/xR
	 1K8VAsxTDPlpFQUtnDI8HpsOjSwq96wcXxpkdoJZLzToPEGLQkFCPkM6uStqhiYB0tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=pq5PGWav1E8JJnaWrvcQ5YCVgGEx2FIIN2mIYGG4L9+U9O7e1CQ3VXMWj5//7AUJNRQE
	 pg3fW7LjI9tmK6sExDMo5vAC6BsHp7bebltsb+9FB7vA6eAJUfiR3WJxWU4By/YaAbqUG
	 C4i3Mz1eG10J1lqb/QJUCdgvAkGzlET0rNrUlWFjm8CtgD3j5zUONIsjA1MnX1e/O1lDC
	 OMD9CqB4fqSuVKKfR0qmyJ+kr+ayyAm38AsbiGZCz3Mp5RnUhGKLiin2KgAICQ4/GGGfK
	 vVrZkEC0VX6+U9SMK7glb2jug4avHRMWsqOqMP68JDEra35L2K5TO1XTOrde+IqW5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA0360A2606
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA0360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vMNN3324761
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=UH5DTolj19deutIT
	zqV014fRre0CTOATsmQMidOF+cXwsQAUpJLZyWL3MMotWOYCfN2GfteVrwCBENLn
	IcueiJ/blXe5WsJ+yJmHS0dtO0x3e+CWP5T05BiyUA3jJt8hX6lxrGCfm3MsEBbn
	2OooUqEidWZMeSdIr/f7dMDHNOUmZuzKOm3REgfJ3bAxyHZtWpCp+PopXmDooozC
	BIkvlLelEZhEtJA/dFt3B1NB92KIBU3x5TfvMCrR863VSbgi6CFZyFhn+HxNEe9W
	6s6LvuhSBwYD6FQXS1H/CWE/NKetkc9b4CkhG60DRS0/ipQ8J+sgZnSxEH+tMI9F
	/w3xug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p2wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:31:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8aa185840bdso1642129b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608296; x=1794213096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=KmaJdOPfAhZvEObh1AKcHgUdQBIMGTiVbWs3AGO9qNaisNzlhajryhaseCbQWOyGWi
         v6Kq2sAJ4EayAygfasSgh3yd3dth3MfpImmbCkxhCBBhdO8yWtg8UKd84GHWQSMysaD1
         iwFjCm0AiID00xpUPy+djWE+7Pgn2O2HW8ZSEHjB4j4Js9l5KJQIJoxiD2v4D6TEWfA9
         8H5/xIsZ9np0oK2hbidfbSO/x5/jY7Jq5Ftf/bMYEXofhg0yAxrH1vH6gRrmVABxW1GM
         T5FeXe80vgFKNsAwFa6cjZWgqgAUPbqoAY3nCBlN+JDBAlxryhqqZKdYpStSv8qnTcBe
         E9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608296; x=1794213096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=bvjDOzrXNfhPBP0T6dwb8xM47pzPLceQkbc4+BYOYX3PpnG/6v611MIeRz5/WVnBB2
         Q+ufyUba2DWzTUMnRPu+m+D2cPAkmHbD6EjJ0jzpDzQEpECVrrmeCYDr95B7BTGjtHkz
         BdHQkjsntjHoDRZEc1wEK/fZU1A91XikMjKbRN8AqCLGTBFp039tn+kw5OIgOz6GdK13
         Hyinsq/Vt5aVZEmUDRTalPB8aQzcIMmw/yKJLMTzpHH+9WqG1WtjlOpOsuw6kriGZA8j
         rOtPJE9RLP/phG4ZZViVzFW8zjeAgW69dNfpTaAlo6cDqwQ70jjQSRWPXBjLOl9PnqgF
         XcdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzotMORjf/+gCEjNO9CfXI9Gta+mqWq6O8VivYnWcIzOSTqXN1RU1YQU95BuCOyZy2u1X4zdghkzl+X5sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e1mOgQyyVhbHlPyD8BEMeKc0DGnAqYJkp07nwC9Pu5sSR+w5j
	/rqjiYvPwtTg4hVcXOKgAJsefI9NfydauUwNi9Nm68xgny/7mrh08KRb+tpJ2wkWBcztaba7qc5
	mKRh2u/UjWXraoPjhKfeWKR1IBqGvnbLwEtY2VzyJ5CDsF9gRKM6+YSuNNQb+pDFmZ1Q=
X-Gm-Gg: AYBFou0+yoTH5D/6I0fBuNyqWPeWDFDohSLVb3B+eUliBq0ymsO5I7Y38956WHKSXZO
	8wyU28Sj7W3+EcV/KMxECv6/6p+/y0gK1rW38B9BjtPmQFpNSKdc9uqQVWojr8DI8Fvr8omgjdi
	GsEjwCHiKWbia4M7d7FR6FJ+jMFVZ8gUSGso4NJznzrGbBpYGBqEJO9Bwzy6JBg/TtoUhNNFTmL
	LaakxDsJy3dQlj7/jJmOEPVvU7DunYqTikfoSzA0Lg+yFQqOqZyLFGQyzKiIVYZ6CTbCX8zCT39
	jHroubuzdF3RAWJkpseK7EDjE6jJHTsv2o28Cr4tc951Xizofs4syFM/KnMw9GziG/WhZ2Ath/u
	GNQ2yM5mwq3kHmjd6Wlh+3IB/FKBL470ucf/tSPXNZOM9+e4Kj4BcSNN34Kvke7pt+q6BOvVt/z
	VsZ+uNgQ==
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706613b3a.51.1793608295867;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706584b3a.51.1793608295268;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:34 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:04 +0530
Subject: [PATCH v7 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261102-dup-sessions-v7-3-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=FTJZktJO19KaCxSo7At3dajbxHwj5iNmGTS7GVKlisRtVjNR01L481DINVU3y6D2KlWjucDwf
 sF+z9zbjT1jAXqJezx4r8sH7crhXH6OBi2c7G839kRPj5ew0dIvVtBO
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: yTCsJ-qInfBkFfufk6x_oAHYmVUCxF9_
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84a68 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yTCsJ-qInfBkFfufk6x_oAHYmVUCxF9_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX7GQLnBkU68Ff
 vF3BlJAEPpMUSWlSaVt5WL4ngcXLqGiKCnwZSVzv9DYSK/iJ9ttIhTC/JdsaDA34Q05neAt0DYc
 v0nLfcoBZ9XbADecbC1b1mHLhVGrGuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX+ys/8mdQbKt+
 PAD17HvrcW6dAxzpk7EPk6N+rjnjNJmZ+C5Y2DQuobB3ue7mFAXqZtqRD7SWX0zRoox/FZmOv8d
 dJAglXxvGRPtAm6Ec/ZemKVZSk/AZO6h3azK3PRpdT9dJCtphWhxSJhgy91Knzh6RGsLf+lnsUV
 q/9r2ZOmi/lP+CZe9B3gxgEhe/OiLBUTjn01sO/eF42zXdl1uV8Zv0ehqYRj+MFWLtb2k1WbRV9
 nciGloiAIapc4t4el5qiG5vm3XG7rpnrBrleZQ/aSOWraboVoJVslNVvde/M++aia58Pb6eD7kX
 GxcdZUHAR7tv/J6IBm24QSNSjLSQBeaABL1b6yKSCGeOT2x5FcO3Zmz3+xsKffhbR3Dk4RCsk+Y
 KepnxIozOgrXLBHhU0W6Oa1FntVDY8BazgvR7zRYqWKvtimYGVedJnu6hWZBmtRHCni55v50S/F
 xPzePO/cRuLb3mLPtmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

