Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141A368296
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621279; cv=none; b=kErKYDAv0o1SAph5BplFSxV9BpE57NfiylrkMOXj1GAt/NnETyl60Ap3P7fgaQuUxv4kXy7gEs/TGfM6lciamZBZMc5vDH8mqqvEk4b/Ds3v1CM1oYsvaT01tnKzXz5fEgUPElTmI6s7IunDUFVJxq0n5Ls9RxRUY5dqMB+9zCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621279; c=relaxed/simple;
	bh=B9hvw12ucRxbLcRN9tLWEsbsGsdpj1MFU+KgEe9XWk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PEd9KRbOYC5r0a2zgsKtetPmX7ZGM6773TTFkZFYBl8+teH5PDMKlK12qhiENmdDiRZ7vhD+fCv4e/ux6yYFxUPhRTbbZK7uxsln87tiLN7/wfpe3ERiIhnp+hdW1Zg4L8nJNwAcdUMzPBY02c02nMDWJRD/6qDAcEQUBJg8u10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBnuMxME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrQx652w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBnuMxME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrQx652w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMV0N92471486
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZkJ8KEC6J8yYg7v82eTft1
	ff2suKTPKvllmbNOmQNPs=; b=pBnuMxMExn8ilCFzKJM2wtYMXMYpQ635Zq3Rws
	hZBLaeGlGs9nAo6XLPAhSFpDjWKMEGQn1p0JU5vjz0Gg882gIJyR8M5cKJUJVCT/
	6MfCH20X9Wu0MBjG7BSGk4PZcijxX1y3xNwX8+iyGm/CmoTzlrDfrFj8f2ty7heW
	YVEAJpJXwGBKzYVpaC5fxytU8tbKVU02CV6CNnxJJJKXeuYmLYQXo0AUT9QdAKLJ
	dIyfzHOuLGJGJu8DK6cT0l8/VVa3dwGmo6PzweNLRJp7v/NOa9hZmib2K3jdFeuM
	pMpxcVjhW3uiPUDA5ihnhAzlkYyngTIYXAlrefxHF+uwGp3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn53u05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so639701a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621275; x=1790226075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZkJ8KEC6J8yYg7v82eTft1ff2suKTPKvllmbNOmQNPs=;
        b=OrQx652wnigIhLV2IzyW30a3RJONYc4Zt/7ghZV9ggivMiZDGCGadqslFIpuWP2foc
         lBEodIJq7UTiSWu9WUvgQ+aBD0j9YaNk5ITN2htjo1i6jg4L9AgPas1H8ybb30gQWnrr
         casl+t3WERWAR7UY+gXb/VBd0U1nuoboVVGfa95J+7KR3WT1NmXXMVDouz94OD8IKfq0
         KH3tQjeMzxVoeajsvVyqammDg9PL0PkHFSwG/ex4v0myRB/BIk/wk1xm7zthJtiEnE5U
         1lyVgeHFkmeAqiFjzAhLrLcZsCaI8WlG5saAAKIwzMv69baxqLTaBFlxFGLvcvSQ77Mh
         pBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621275; x=1790226075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZkJ8KEC6J8yYg7v82eTft1ff2suKTPKvllmbNOmQNPs=;
        b=ngWR1NCdGkLikZhAQzjJb6j4iKfZu0UdcVUQZQ1WAAsKAvWKZg9UxeMSPKobLsl9/g
         rrLjFbNlI/lN+AT7Dw4vkxTn+p67VyT2dskZNUdRpNOII7wxA1LVUSjhbXd8orui8pjm
         TNM6DLm873YmWYr7B3rL5+I4mBsVdnqThjOHT2/oSn0EwzIhBeTxfdA7M8/fHL2yLd2d
         SLnRYUyHtXzKyLPwpoN5j/rXHYTHNtyU2oOZqoMQ0GBGYZI17DBAUyuukgkRRGIs1OTW
         uSk3QwK5aiTQJ0nCY2smvyvWJ39ER2BR8go3s00uWMT8skkB3eNTB9CtEIK1fRO5nJ+B
         60Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxf8VBuH10zMJ67gBek8NSs4yacAUqUyNWfCBHBNCuz9YJqL5e1BtmWb95IHGtG4dtIZVAY9mvRatc+JRs=@vger.kernel.org
X-Gm-Message-State: AFuF++n/G9yJZL0WDBnZb1toooDWa6ty7SSi1e2XoQR1uk90qkM+G0NQ
	vkqg7uAaOAN23OGKT/KLO6cGUudJ90QHfLbWi6c+ac0N3Z3Ug8LSo48lrK8h4qnTwwKqapY+d+E
	1XQa/spzjhL81UYcLkaoiA1D1UjIt3GEfWafu7hOSYan1toJV+EatZjNr3GUakYJfgBc=
X-Gm-Gg: AYBFou12QZ/S/dqkLF8nGp1dcxyr2xaeQQ+k9dCFZ/1r/Y1s6esxIdGJf/urMs6gL8T
	X+ITa30KA39SQgA7exO3nMRWcJc51tfPwwdRKf7cWUw3xSR/fQ4no+HOTZMnf6k/3yjvb+QScmp
	5T5apjyudVDTpcTtJP9WBkf2hVKfY189GL/EGKLEqmiXTYVvaHthQBijrVtDSiy15gBH4NsNcSP
	SQPFR8BN6PzO/uALNE9+7buev4c5X89E2ZwL5OpW2DI0ijQH6rddpKHjbQIHddvigi0R5Rdmubp
	LOU8m3IGFMbgG9woHfATfk8SNAvC1xXBgnfeqPGq5T1jlBTQaRlKQ8yCiEu0hY99gErp6bBRfbG
	Piqz5tPJnyM2MN7KQwDlzij5zxEJ1uKxQMw==
X-Received: by 2002:a17:90b:2585:b0:39e:261:4e10 with SMTP id 98e67ed59e1d1-39e1e5380cdmr17563282a91.22.1789621274165;
        Wed, 16 Sep 2026 22:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2585:b0:39e:261:4e10 with SMTP id 98e67ed59e1d1-39e1e5380cdmr17563102a91.22.1789621273475;
        Wed, 16 Sep 2026 22:01:13 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:01:12 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v11 0/9] media: iris: Add support for glymur platform
Date: Thu, 17 Sep 2026 10:30:19 +0530
Message-Id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAORzq2oC/y2OXWrDMBCEr2L0XIWVIluVKaX3KCHI0spV8E+it
 UxLyN0rO3kZmGF2vr0zwhSRWFvdWcI1UpynYoR4q5j7sVOPPPoSMAmyASM074e/MSfeSO1BGQO
 AwEr5mjDE333p+/T0lLsLumW7fjUS3nJBLM8aG5HI7oS2+ngBFF+v+Rzncdx0tefyhB/i1PNVc
 eCmM6CV1UenxNdMdLhlO7jSPhT53DCdJeRbEpe2Am88+C7I4L0LoX6vjW/kEQ24fQNqJXWDgp0
 ej3+TEfmwDAEAAA==
X-Change-ID: 20260917-glymur-627d049900e0
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=23105;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=B9hvw12ucRxbLcRN9tLWEsbsGsdpj1MFU+KgEe9XWk0=;
 b=jm28BRj1TljPV5VsYS9fPYc6cMD7KgbtFSaPj0DbOvCowUaw8VQQeRMeC6U/tXo+X05uQ4yaU
 u9VW3gX7rBEDxy85UG6EgtYjA3FcFnjd6h4/z9EtFRjK6jRCK3XbuTx
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX9DU9mhGUg36r
 7kSd21F152IDOabqt1cch5faky4nNdhOVuGzrMhWl/pQ1LdFo2zT1vmavip3D+RsY3kBbfSMXw4
 EuvKxdBemfaoJ4fRe2ZUE5XM3nCK/Q4UIXYH1Zc/aWCJhlDen3aSddtLB3FUw7x5+94bwnl+c1e
 K26m/WLIwJxt2tJpwZ7eXmii0yd0PDNX1kBffgFNDzR0qDCU97Qe+pbp09j6KwhANRJ8x6eXuKM
 2/VGcFzo053GBpIXE9dWi6BP6m/tdN0qBiIdJV6b3KfajZWO5ISgd2x8cbdFlJ5OXiaQA3Q3N0G
 qGdTD1NZWLwUw14SlvIffbyOLFnnhjwAOH4zM45g9u2fueIqqY4UbcckZpEMP+937XtkVIAmAlH
 amhVoH/ZsBWg0upgCsdcYEPAmmMBZX3ax9ziVZqF7oJzOuKadtoLJgjLP1J8H5r3rqRGulAbkd5
 6kJm1LgiRalt12kn9rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX+SBEfzNZ47eM
 S/GBL8JwVppWWMamy1dJn587SOaXvk+uS6b239gJjAemYj6SrTkBaSpyqoDhmi17Og7ntQuPa6t
 7sqcbRrzdjvm9IeSdqhyocyRYFhMgWM=
X-Proofpoint-ORIG-GUID: og05VxU72iMQ5nHc5GZjQv3alJZF_7v_
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab741b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=bC-a23v3AAAA:8 a=hqlDjt6WuTLSZAQ4g8MA:9 a=sqOwoaClyjXoDT4S:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: og05VxU72iMQ5nHc5GZjQv3alJZF_7v_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

Glymur is a new generation video codec that supports dual hardware cores
along with additional power domains and clocks.
This series adds platform specific support in the iris driver to handle
the extra cores, power domains, and clock requirements introduced by
glymur. Add support for firmware loading through context bank firmware
device.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster test report:

77/135 while testing JVT-AVC_V1 with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
- CAMACI3_Sony_C
- CAMANL1_TOSHIBA_B
- CAMANL2_TOSHIBA_B
- CAMANL3_Sand_E
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- CAPA1_TOSHIBA_B
- CAPAMA3_Sand_F
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- CVPA1_TOSHIBA_B
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
- CVMP_MOT_FRM_L31_B
3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C
2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b
1 test case failed due to unsupported profile.
- BA3_SVA_C

140/147 testcases passed while testing JCT-VC-HEVC_V1 with
GStreamer-H.265-V4L2-Gst1.0
1 test case failed due to unsupported bitstream.
- TSUNEQBD_A_MAIN10_Technicolor_2
4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2
2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Refer the below link for the
discussion happened for earlier platform.
https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/
- RAP_A_docomo_6
This was discussed on bug report
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be dropped in
the firmware or driver. Discussion ongoing with video firmware team on a
way to handle such case. This issue is not specific to this platform, and
its there on other platforms also.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
- vp90-2-02-size-08x08.webm
- vp90-2-02-size-08x10.webm
- vp90-2-02-size-08x16.webm
- vp90-2-02-size-08x18.webm
- vp90-2-02-size-08x32.webm
- vp90-2-02-size-08x34.webm
- vp90-2-02-size-08x64.webm
- vp90-2-02-size-08x66.webm
- vp90-2-02-size-10x08.webm
- vp90-2-02-size-10x10.webm
- vp90-2-02-size-10x16.webm
- vp90-2-02-size-10x18.webm
- vp90-2-02-size-10x32.webm
- vp90-2-02-size-10x34.webm
- vp90-2-02-size-10x64.webm
- vp90-2-02-size-10x66.webm
- vp90-2-02-size-16x08.webm
- vp90-2-02-size-16x10.webm
- vp90-2-02-size-16x16.webm
- vp90-2-02-size-16x18.webm
- vp90-2-02-size-16x32.webm
- vp90-2-02-size-16x34.webm
- vp90-2-02-size-16x64.webm
- vp90-2-02-size-16x66.webm
- vp90-2-02-size-18x08.webm
- vp90-2-02-size-18x10.webm
- vp90-2-02-size-18x16.webm
- vp90-2-02-size-18x18.webm
- vp90-2-02-size-18x32.webm
- vp90-2-02-size-18x34.webm
- vp90-2-02-size-18x64.webm
- vp90-2-02-size-18x66.webm
- vp90-2-02-size-32x08.webm
- vp90-2-02-size-32x10.webm
- vp90-2-02-size-32x16.webm
- vp90-2-02-size-32x18.webm
- vp90-2-02-size-32x32.webm
- vp90-2-02-size-32x34.webm
- vp90-2-02-size-32x64.webm
- vp90-2-02-size-32x66.webm
- vp90-2-02-size-34x08.webm
- vp90-2-02-size-34x10.webm
- vp90-2-02-size-34x16.webm
- vp90-2-02-size-34x18.webm
- vp90-2-02-size-34x32.webm
- vp90-2-02-size-34x34.webm
- vp90-2-02-size-34x64.webm
- vp90-2-02-size-34x66.webm
- vp90-2-02-size-64x08.webm
- vp90-2-02-size-64x10.webm
- vp90-2-02-size-64x16.webm
- vp90-2-02-size-64x18.webm
- vp90-2-02-size-64x32.webm
- vp90-2-02-size-64x34.webm
- vp90-2-02-size-64x64.webm
- vp90-2-02-size-64x66.webm
- vp90-2-02-size-66x08.webm
- vp90-2-02-size-66x10.webm
- vp90-2-02-size-66x16.webm
- vp90-2-02-size-66x18.webm
- vp90-2-02-size-66x32.webm
- vp90-2-02-size-66x34.webm
- vp90-2-02-size-66x64.webm
- vp90-2-02-size-66x66.webm
2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm
2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm
1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
This VP9 bitstream contains 20 superframes, and each superframe consists
of three subframes in the following order:
• 180p subframe
• 360p subframe
• 720p subframe
Each superframe is submitted to the driver and firmware as a single input
buffer, with one common timestamp attached to it. For every such input
buffer, the hardware decoder produces three corresponding output buffers,
one for each resolution (180p, 360p, and 720p), and all three output
buffers carry the same timestamp. When these output buffers are returned
to the client (GStreamer, in this case), the first buffer returned is
displayed, while the remaining two buffers are dropped due to having
identical timestamps. As a result, only one frame per superframe is
rendered. Here the expectation of the test result is with 720p, last
decoded frame in each super frame.
Discussion ongoing with firmware team and gst maintainer on how to handle
this case. This is not specific to glymur, and its there for the other
platforms also.
1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v11:
- Rebased on v4 sub node series (Dmitry)
- Dropped the patches which are added into sub node series.
- Added poll wait timeout logic during poweroff vcodec (Sashiko)
- Link to v10: https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com

Changes in v10:
- Dropped reviewed-by tag for dt-binding patch (Krzysztof)
- Updated commit description (Bryan)
- Updated firmware name (Dmitry)
- Removed comment in dt node (Konrad)
- Fixed sashiko-bot reported issues some which are seems valid.
- Link to v9: https://patch.msgid.link/20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com

Changes in v9:
- Dropped iris VPU bus patches (iris-vpu-bus support and its iommu_buses
registration)
- The below listed patches are added, those patches are derived from the provided
link and updated the code based on review comments:
Link: https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com/
- media: iris: Add hooks to initialize and tear down context banks
- media: iris: Add helper to create a context bank device
- media: iris: Add helper to select relevant context bank device
- media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
- media: iris: Add hooks for pixel and non-pixel context banks
- Replaced the iommus and iommu-map properties with pixel, non-pixel and
firmware context bank subnodes in dt-bindings and dtsi
- Updated the vcodec poweroff sequence with proper polling logic.
- Renamed the PAS API usage to the new qcom_pas_* API (qcom_scm_pas_* -> qcom_pas_*)
- Updated the reg address in dt node to 8 hex digits with a leading zero (Konrad)
- Link to v8: https://lore.kernel.org/r/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com

Changes in v8:
- Extracted register addresses to separate variables in power sequence (Dmitry)
- Fixed sashiko-bot reported issues some which are seems valid.
- Link to v7: https://lore.kernel.org/r/20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com

Changes in v7:
- Replaced enum-indexed clock and power domain tables with per-block structures (Dmitry)
- Combined venus common schema update patch and glymur video binding patch (Krzysztof)
- Updated CPU_CS_SCIACMDARG3 write value as zero specific to glymur platform (Dmitry)
- Updated the clock and reset names (Dmitry)
- Link to v6: https://lore.kernel.org/r/20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com

Changes in v6:
- Rename function names in iris_vpu_bus (Dmitry)
- Update the venus-common schema (Dmitry, Krzysztof)
- Add dual core related functions into platform specific vpu ops (Dmitry)
- Update power domain enum names (Vikash)
- Remove unused macro
- Link to v5: https://lore.kernel.org/r/20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com/

Changes in v5:
- Remove clocks, clock-names, power-domains from the required list in
venus-common schema (Krzysztof)
- Update core selection logic (Vikash)
- Add macros for power status bits instead of magical values (Vikash)
- Add new config for iris vpu bus instead of using the iris driver
config.
- Re-arrage the patches (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com

Changes in v4:
- Update existing venus common binding.
- Update glymur DT binding required properties.
- Patches are rebased and resolved merge conflicts.
- Link to v3: https://lore.kernel.org/r/20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com

Changes in v3:
- Drop generic dma context bus and moved to iris vpu bus (Greg)
- Update commit message for platform data patch (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com

Changes in v2:
- Update the clock and reset names in DT binding (Krzysztof)
- Update firmware device names (Mukesh, Konrad)
- Update the selection of core for dual core platforms
- Add new generic dma context bus instead of own iris vpu bus (Dmitry)
- Add patch to get power domain type to look up pd_devs index
- Update glymur platform data (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com

---
Mukesh Ojha (1):
      media: iris: Enable Secure PAS support with IOMMU managed by Linux

Vishnu Reddy (8):
      dt-bindings: media: qcom,glymur-iris: Add glymur video codec
      media: iris: Replace enum-indexed clock and power domain tables with per-block structures
      media: iris: Add power sequence for glymur
      media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
      media: iris: Add support to select core for dual core platforms
      media: iris: Add platform data for glymur
      arm64: dts: qcom: glymur: Add iris video node
      arm64: dts: qcom: glymur-crd: Enable iris video codec node

 .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
 .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
 .../bindings/media/qcom,venus-common.yaml          |  11 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  10 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 120 ++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_common.c     |  10 +
 drivers/media/platform/qcom/iris/iris_common.h     |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  32 ++-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  69 +++++--
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  46 ++---
 .../platform/qcom/iris/iris_platform_glymur.c      |  78 ++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  15 ++
 .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  26 ++-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  26 ++-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  29 ++-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  67 ++++---
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 ++-
 drivers/media/platform/qcom/iris/iris_power.c      |  20 +-
 drivers/media/platform/qcom/iris/iris_probe.c      | 153 +++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++----
 drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  58 ++++--
 drivers/media/platform/qcom/iris/iris_utils.h      |   3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 216 +++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 ++-----------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 102 ++--------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  13 ++
 38 files changed, 1229 insertions(+), 444 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-glymur-627d049900e0
prerequisite-message-id: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

