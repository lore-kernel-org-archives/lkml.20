Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400084;
	b=wlrwzJc6yMb3s7ajTd2uSle2TubB9JygAAYjnFvNNqVyXOAADxPlWrv5WIbjneCJUoWV
	 vCSPOQhiIw6nVjUptm6yz/KPQ2KLip4vZHwTxA8tzzc7GWsOzq3FjmXoOxP9XlfYqAW+J
	 tutcl3Bo/jZ/854Iki5yqRvkw0oPNRnWa5uIJA/Q0yCAYIl0XWI7EhE22+G7ctcopvUxn
	 7IVUBvaRYrNeTdgqIviwFVYc/j+fSDM6IldnjDmKIDSslw5LHNbx1yKlnYMBESXdB8ihL
	 SB/PZ+vFK4EoGi58pGo+9TIla5aInbZa+n0DMu2GIPHwH/ec9zzTr/+6mXGQHKCxy5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
	b=tJY3NIATblPq4gjTieoLbl6msXCeeOOHzAoYDF+AcTO7cHV0qbqmBzsKZDMMNWRGis4h
	 F5zit9mIVyL3QD85i3zGhM3h8YQEqqAdiqCkNVv3TAiosFXkP+Tke++H/6sEnIndgawcK
	 yWZg0F9j121T8j39J5RT38CSCkKTSigPzXjfizYuE2hKoC5Jxsoj5uMijjtOeQKuvEpRv
	 EuR9hK3J6Pbde6edSKYHdYYiB9Tn2PMemCyj/9pz5tN6pJMNFKWvY1hHR5MucStqWa/7s
	 iJXwGhEzswOs98xLvC/CGkIPhJgbXiPnsXIJJXxsu9z9v4l8bUt36Nk8vtwkV7xRFcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFfrCNj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jooJld9j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D971A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFfrCNj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jooJld9j
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtLlu349337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=; b=TLFfrCNjrTTxgqnn
	jxpH7DzAWxcamJvHJR3iQMrEe+bf22GGqFX+jDICN8vl0GxobHdgU78l0HJi8K/2
	UVw6x0zkbgmPoo/RjckWL77qFrlxvCzxDHB1AsA0ScbjMw6IyaVCwiNwB4r4Thqg
	wc3x3HMst9G98KvAC8+rTCK/P+iWoquOVRybUlbNH/1/lwOkb7aBH72QTbSa/B8h
	w/bGHbpMpC5hlSksroN+cR25Seh/7kmeh5xOZSuQ4+tlhmjMF1p5h7abAxOlyRtY
	08Vdx0U6ha9eL1s/k2dwU6m+8/0z3cxytsfQxlk4eviPJH7gQfc4E0LqwvlcksAY
	1jjjOA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0gb8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2882199eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400082; x=1794004882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=jooJld9jQVlLB8yPP6gkXlrboPYRZ1VS2QaTAddzd0mwJ5ik+7BRmp+p27TuriU37N
         2SudshpBooT94CeQt0wEfpKA/p8iwtiQ9oM0KWvKVi3I9y5Xwp+cNMnqDNiqGkVFoIXU
         LGNeLvVkowIwT3yT4OaUuX/MlV9TXlcEsHOMKF2fh4ozSc7sFqSUXRgqASBzG19pVwMi
         Kl+n7t7vF+L84X4v5x+speCZzX7yWe2zdq0bP6+2NZ0dKCCtIopsQ4NVEI5I/92dqnjw
         s/CtrbHeBEHyOWsUnFE7QZ7+wR7ApPXX+aL733UM4pD8xXBoSOxHRN5JAf8miIaGTRcS
         UAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400082; x=1794004882;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=IT3ZfCJ7wmYuPOM4JjLI5yd/gMysiz2zLhmmkqU2OZXPPMxT+niYUgesTA75lrhKha
         qDlLm+4AJyfhR/Fuzn3ttsXg5TnCH+VEBVnlWpP2C71v1PeOpR/nIkSkPBcN/P98nn+H
         z/4FugJYTbIBTb/rX2nIFZbFHrHb4nE9BXjAc0YbbjH6b/fjrxWVdXse6Uj/MAVabpV6
         /6HYTe7LHAReDiv42LlkDUif+cozuOnlT7qvjDZjVCk14Jo+3Fz5lu9DOwFZVDbtcnTi
         anAlmi8/RC2HyyKPp3rbpeWh2Lmi2zatW0Hz/xXmMv7WlfN9qlXtMnOn2GhP4ELOIqTf
         2qag==
X-Forwarded-Encrypted: i=1; AKwUvBwF2M9HoRFdAs9cA87t9uok+1ed5tEHoqSCI1cSW1oVTwyYhOYjHTMA8WV3QLY9G1q8ibZSyYUHrA6csBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnbtFY3xJKqhGs9WBaPEuxS/clc+JavR5pcEs7ZR5gP05qpcxh
	m9E6BOYQ8hezvdtsEKPOJLGQ4cI4ShfnA9S0XtCsrkhrlTCJgxLmib4to0fppu1Wy05A2Cs8hS4
	qxx03yY2hI9jrQts/Ah9DWVtyOvKcYm2ykXRMT9R39/kmvEGEAcjr74IazTvZTDEOSGA=
X-Gm-Gg: AYBFou1tIkPZg4PfTE1Es0uGynn5Tilfu3wsKVSQsILlMEPeBvMddJgL3VqgkhgWRH+
	2ZaiVC8kVUIZ/N//fON4QcPKFmJHOmZvih0lu1cWD6JqkcpjmvpA5DDAIfqJvkCaYVoqDb1zbba
	pGtPQfsM+b2t1WKg/m5zMtnRn+RMlFC55nrccN9VmimoTQDLiuTifG5aJmDgMTq2RujFrgW+09E
	93HTRHTULI84HqYGkJ/xYjogS4OXRfj/DsSVXMtYu+bppT1Ni2wDIspBK/eee9K9ja2EMsT7xnb
	gfFxBtsWN1drNlkzM72JNcmN0/jFiZqLkCE0f/dbEEN2HTBEGHVcMhzGinwP8oRdCYgH55mmwRn
	sqScgHvvM5vSffpmoE7O9GEQ6JcvkCiTcmiHOu2khUWB8S+lFfttekT3jDBJ/j4DjcLpATC4NT0
	a4CWZi5TPSJ/pz9lVgtpA4Lk59gsE=
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570391eec.13.1793400081643;
        Fri, 30 Oct 2026 15:41:21 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570352eec.13.1793400080933;
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Andrew LaMarche <andrewjlamarche@gmail.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-Id: <179340007978.1790611.11188538641227151930.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:19 -0700
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
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: p3roD5g0SUrVfCOYf8uq9UADn7HnhAD3
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae51d12 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gIeeTYuhQ723c2I_zY0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: p3roD5g0SUrVfCOYf8uq9UADn7HnhAD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfXyzoLwJB+DFGl
 PxLw55pFumQguHewSQ3LKBcEvr8/WYNTvlQckbtM0+ocGkv4baVzaHAxuj+Cnbk1A2hFHGfhHSX
 yChirBV7HcQJh7gymwXe2xnRo9Ztf7ePaYk53mhwKCm3ukvaMs2hb+etMEMcq5jVGJ5glpPrp/6
 S9mHjuM0g+nwhNGJk2kg0WnJDv+bdyfWP0AaALftb2B6yis83s+JLhKYCHOo0JrvC3w2ustdveI
 PIV8OBU2Ddsxn6amV+H/TYrOLUSJaNmq58JjIl9tOVTSxQLT5vlrkLh99+zjsIyp/XggIcEq8A3
 dMIalk56dKU2kOWIlRrI0J0FfA9XY/VYW5Uaui9hDNF0u1B5cTIMVmznb21y3X2clPPGj28PyV3
 sfixiaxTX8C4zd+RPuf/tUTw3EgFn4KnSUEa5pvt8jEWZ4PO6H4sznyDCAqrfOoILTzi4KmP6tD
 y6fJ867ZbgIKRr6QGTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX47qJU7T6lCFJ
 wsQCailIpOMcaVvM7IKL1gZr5H9YhrofkZk6e6TcNqKHi63z4+xgpwq+l4zOG0o3Vva12GEtAOU
 Z5xwSgOgMBxcox9+iTsSC5JEnrrk/M4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300090


On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: wireless: ath12k: allow calibration variant for WCN7850
      commit: 75bc725cd92b2b4dfa76850ce5983aacb52d894c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

