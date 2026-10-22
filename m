Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681072;
	b=mE2kAF0sA/gnqrG8v5QD3r/dsDtOFADl8UTPgZE2cu+biltFfjDQsfOzqyfr3tJ7mkEw
	 gq99vZSuiFkQ5brEJ4+DzYXLUTE9LGObZh8TeI38VOPgUE3lH0WI18zbd3Kej9JvsfYJx
	 OUJF/LMQf9EvFg4Iy+TQ7RpJ3WIDENw7Mwcj+Fbrq0nyXMVBcFMtja0NfIw7deY2Ts1Ah
	 I8Qed7qMaq2mDHlU3C3tNFQ3/XTqhRYGCyz6ih7xvxSgpGGXT980UDsRKl/tXQp+APpEp
	 sOrDfEgAK0DZ55ZZ6gSXpuXqpKcx1HhxYVrpc6NW0UZFkzlyEy650TY1Zibr+/Pee0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJs45fFUDJNNiewh1g9rjIHPssvqt7O5EgXXxQLLM8M=;
	b=OZhK+jUsOVr3AVtd8cHieR5+NB3XnTmIA5kHxb8goagTmQx9iLF6hLle0o8IgdOO2/OB
	 2fj7IpH+owSt0tnfTnpinEWC1OiB/U6bNa3yRWERXDBlqjX5b5ud2qFCvXtPiig+sfe9G
	 H7MXxsT4EwdMa9TOXeYIZQL7jRNI2pa6d/OahazB8CI1eiJTQhJrkxLBJ67+tZt4dlSiM
	 oZNHU+tJYcdTsslEsatzJWfNGc/d37AzFxYTwKn8DyRzcLa/VNFJwIEgY1bGCEZCnL+FG
	 IpzamQnyzpDD5xydWZ4UNeWepp/cCK5OeURlUAGVQNh8CSzdCSqQlyTwFVFAqFd2qKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVWyfJNR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5B606A319;
	Thu, 22 Oct 2026 14:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF5B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVWyfJNR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFXQK4098577;
	Thu, 22 Oct 2026 14:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IJs45fFUDJNNiewh1g9rjIHPssvqt7O5EgX
	XxQLLM8M=; b=HVWyfJNRENZ0zXBaKsk5f9NF/S9fUirVuhYn/AuzkQrtKR0NCmL
	EtVKk8FnCQgNsV8HlSGiCB+mCwy4F8nrWuAZp8L7vPtXWFQPqIpqVjFWQ0o+lzgN
	vVBXQAQOj89InxDZWwhtyQA/s2wWZV8mgFup6vIhgAN37CtybRlMD1k1W8hiV98i
	AEE0c6SaSCEe5uR3Tzwy/u2UGDEL+nwi7XSTuhohbfHzY10i6o8jxaOwzzh5ZG6r
	F4v0sVic/YiSeUOPGDyAO8irxTTz9o2lEYcZ820234Uljx9w/GLvd33XDnoixHhV
	Hob+POz8sjnNgXp5IdqfWDvxD+qG8taRgdA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq35dj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:57:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEfW421932679;
	Thu, 22 Oct 2026 14:41:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69MEfV601932659
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:41:31 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id D1E3A66C; Thu, 22 Oct 2026 20:11:30 +0530 (+0530)
From: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix GPR callback registration race during probe
Date: Thu, 22 Oct 2026 20:11:28 +0530
Message-Id: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: hlmCAZDTC2JUn2_LZQ8k27SXRjdGrUdr
X-Proofpoint-ORIG-GUID: hlmCAZDTC2JUn2_LZQ8k27SXRjdGrUdr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX4u0f8ISkhA5d
 tisCRZmYem9ITX1SX3R+7k325PJHQ1on4RYR5kR7NZ0r1c2QRvygSKH2D8dWh/kwaDe9mFApBIl
 0icnuG19n+WyckTMiHgEx6vA0F8By4k=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada2467 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=SdEKr03YgSq6kbhPS0kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX+q9j3IMNLh/U
 3eOGRr+A6Ow7s2mBGtzs+pjR/jh6gLHHmzVpQ7OU0x8IspCcVjQ6rdpx8xXZvQseW1ruP6qvJ1q
 SGml5n8fYz0Uth8H0i7ntUN/pUN1lYmAnX58WVbfjlIVZbnGlw4U1W5mzN0Jk4u6HU5mUNBSBAq
 M4Fib1hFFc/GtUad5vE6cNoRIszILkPdEUTBoNKrKomE2fhbnsVbH8hUQGpPEUtpC1g44kD/kAk
 3/6TYtbsnVhFeJcszxDnEY3gSMMUsy32wJOGT68CMCulzJSsIMb3NDnQcFVUpxr6XDO7HKR5n8g
 /UekM0ZRhUFus+PuLmdHxfo5E3te3WOgtiMiKw4B4RNI7ABEXOZNse16M71vNDJwFo3P99ngH65
 GhPbEZucuD5RNJqd0LnUI/w8HdjEsuXQPIh8xCR3BR4qqDmlx6bdW3kkMD46E4//QYNQCAOEEaq
 euKvEoTXzUcADthiW5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

GPR service drivers can issue synchronous commands directly from their
probe callbacks or indirectly while populating child devices. The GPR
bus currently publishes the service callback only after the client probe
returns. Consequently, a DSP response received during probe cannot be
dispatched and the command times out.

This was observed intermittently on Qualcomm Lemans and Monaco platforms
while q6apm child probing issued an APM shared-memory map command. The DSP
response reached the GPR receive path, but was discarded because the
service callback had not yet been installed.

The first patch prepares q6apm and q6prm for early callback publication by
ensuring callback-visible state is initialized before driver data is
published and safely ignoring packets received before that point. The
second patch publishes GPR callbacks before invoking client probes and
clears them again when probing fails. Existing APR callback ordering is
left unchanged.

Mohit Sharma (2):
  ASoC: qcom: q6apm: Guard callbacks until probe data is ready
  soc: qcom: apr: Publish GPR callback before client probe

 drivers/soc/qcom/apr.c          | 15 +++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c   |  6 ++++--
 sound/soc/qcom/qdsp6/q6prm.c   |  3 +++
 3 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.34.1

