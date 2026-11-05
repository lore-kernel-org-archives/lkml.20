Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873196;
	b=KjH7g1QKVHT8YD9zHErsCDjf3fdOt2sMalVm/9LxL1QiFVBtb7fFHKy+p54VP+p6HNrc
	 /RLyJVW+QeEGetIdLPeXMDxxYUL2WsinWf8Df4qs9slqj41UmAnOE73prfAoM1LafcgJ8
	 0NiT7QBQ6KxUnsJxHNVbuHC9w1nvX9tN/X8JixTpPjM3ukitSTt57v4v3834M7ychmrfH
	 HrAOY+1ClWD+bwgHG40ZDNN7R+rP9+du4JVO4KVSUOT9Z/SwdSgtblb/vTOvoM1o7u1xZ
	 +KlzWhrTeXZjE2vtbG3BbjqCIACIKzklJcq7XwQ/UoNd7MSJbqtNr4KKDweMo42aVRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
	b=HJy0ueUxVkUVzxqds5Xx6PdzDwz2M4mCDV6TIMPkMBV5lbvZre9jKNdWnpPf95SP6Gfk
	 hdPT+FrDiEnEj8RNvK71zwwyA4be3eEnkHOylrBVWfWJPYmTt7b674S/BsF6Hgkn2gUc0
	 HAo2MMDqQ5tZ0IXMw6XqaLHuaFpOanOwqU0Bu+7p2rI2CdZlg5RfaHjS/RI6//XQ9yoBs
	 UDrZ8aSwe+JUYdQxh6oEZOcdJvKFGXdxPRdbCTNiBi6ML9n62f6UjcgchlbyBnvgpB4XD
	 ACLN+eP8DqjtcLeU9Zqfbo1OrImjKwiGPdUR3+BxfiHHQbg0hrWIxC78gaBrcrWNyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC44060A5BCB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC44060A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tdPH3044210
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jL
	WaZZ+9X8=; b=Iq66cKjq3yYEL2naEJff+GMjZSETIrIg23pQAjdYO/3LsBr8bYF
	NhazVIm6DbcCo5gB/FfecqRkVv9jEh1p5eqdNgqQTFUzMVl7f+qmMlgKLo2EThvp
	b3Zl52OhFTLdzjJ0O1nQbhoMcxFTKj8sKFWAN6boKLCk+bOs+MJVzDPi5YCroei5
	ggkts9pF+czDWjNejC5NJ15rZVwJfYFcDlY+dkU4UOi8HX8eNSx5+3mqw+v1tdDs
	8TUTD3P8s3EPl0u4LevtkT3knVx4jjy2m7BVJrkJM8U+hkkz1NXEXLVIRMzbn6BQ
	kLa1eRu4SNzsYjX4+DG3xYWPULMclroK9uA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sux89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:06:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so2887286c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873194; x=1794477994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=gbaXrJ6co3KCPSM90yN96D5bQmIHQlBjL9NBo6bEQ7YWAAZUYagLoOX6Zwdzr4+KwN
         urLEMXFLzrJpuwaCFfYBcVlEBh/S5guGuEM399BoENvWcbFInRFXvEHWo5ABHUB+nykc
         wblvGTIsEgJxcUnMvyS/Jz/Gjo8J+JK7jFa0LHEqxflzkZGqDo09Psc+NycbgyPIbxFW
         sSQnY+JeTJgkE6C9qPEhaeIVf2r5zYY/n/qah2DheDzNRGD2DO20rYt6E8uBlLgPapyb
         KWzioSn5Mt3zieZeY2pHeMEwY1QXsX1tB2H3dL7IsOug87sf9a9grfbse3tIf4blXQxP
         oy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873194; x=1794477994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=ZNtXY4XeKtNPHs9kowTFyjvx5/SERzgPOW0l1KFjCi1QXHnUMYXRhPjoAU3UbolXKt
         KyHe8lXCuAIK5PRBjou5oBCV/nz6ggp7RxCzLcSN9T7qJzAry6p1Oe6equtGjDY31PBr
         EUuImfe3VP1se86JOJdqJELnW6CnLbmqQfxdOb7Vb+6RWH19pYBLwkD3SrEXg6DYljhb
         HztKrXC0aE5k4wl21Nv31ACirOldp/wdJM1oSyNBM4upS/pzWGyWrX1mchDcQ/tDGVgk
         S4ujujmWZZQRbkACHaGLXs/FnyF76uxJkWuZ8ry4LXZDdGX1AQSeWYdHVug5cH0L9yrU
         Flcg==
X-Forwarded-Encrypted: i=1; AKwUvBxmXpvuA1d6RBl1kUZZzDo48cmBMJe4TtjeJcVP/xBMDCVRhFnQlzfrr3Tobu7S1+oHtXWnxURsECNS12c=@vger.kernel.org
X-Gm-Message-State: APuU4Z85dNNjV+vazXH3pH7NeAKWpo75018bsPlt/V6e0l++Zy37PhVb
	N5JX1GvyiF+DbJTy85FcO4EYjfZA6L/ue2HC7KgnnSXmcNoHCITvBerPcx0AiM17lgaS0ID+6Pw
	NN6ElvGbRpiChI/6OxLko2N7K35ikTPMFYm3USZYAIzsO+RI5EQM4X38nf1lt8XXxk98=
X-Gm-Gg: AYBFou3aiYp3RwhyIAt3+XIvnwBVQEvSoeGYVIRgUWVVtmqwcqo5CB+uYDMJIOlBg0E
	/xuDdw+i0mjEUc96vxr4b6ZrUwaReRvVmwkWsHkvAmx1VMBUB/VpHY0UNPNpv/sXx+v5bvxIV5B
	qmDV7B1jHQFSrbDmMHnkjHSjM7yhXg18b97tcdGuD7F7CuBf/JYz4J0l8x31Bp25wBGBQAiWZMF
	Cdo3lGRMzuE0aKwRCj+vF/fnBJ/Gwmsu0F1e7mlwIpPPB5OX8jD6rbyG3qvPshneTdBepjt4hUG
	3wX4EhIBZmIamPJzcBqbQXg5MiAnI3n2GwGZegPzVP0W1NkMmiuumLKQzzik8RwWJyrJBZa8SiX
	7JbLW1VWF/n53CEoimPvQ+HMKYKunyrlQNtWFoCrgaBPLjiRjGf6/WrgZyixZVLD8fxKFRhFFke
	lw
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126435c88.10.1793873193902;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126382c88.10.1793873193120;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18719239c88.15.2026.11.05.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:06:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu,  5 Nov 2026 15:32:16 +0530
Message-ID: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: BuhSLojQtUKj3pC-fbLYiXA9E8SUhA55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX7PsJ7pJIQnbB
 p9gCSz6AbjUadsPh8jwlCSXSrUsEW9KSzKYz+vGPbuIOhhCw1hCF0SS+xFO13aw1orUFMNufkf4
 OLal8szW7zQspfvhFUT0htLCETyF6L95dPwyhh1XJpXWYgLaIkCKEkXh1jCNc8q2L7O0BaTJwuX
 Qoap6zhYTPohYmk6X2Gp+PPBtFHz6KmKUC1uZeQs1liHR+/2oCLceMv5n0L5qpO/dVM9W/NfjoC
 miwfMzHB7I+eOmhaC8fRJDiXqsSyyLQWqh8KK86g41eTkkDx4tt7/ZrTkiMTdw2dqRjoDtnYN/d
 jqRkT35sk4kIr9FsuERrNTm2Ml0qgBNxejSWygryeE3no892nW/ppbppuAxjOjTbB5KV4nDif1A
 uzW8veYkW/6EIs4H86Et0b8amCytQlc151ALFdhdIxawfeAuaYqc/ntiN3O+jlYxSUeiaD3Z8dr
 OpM6bvPgPeT3TETrhXg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec552a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pXwHkFXhuZ6WPUJZpREA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: BuhSLojQtUKj3pC-fbLYiXA9E8SUhA55
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX84CGPYLiZjl2
 zuZIrc08rwqifimVv9kT0AOfabY7W4b8q+ECXiSHjOdb/DWrd+++3jGqZh2eLSTcXIp0sJlUkjU
 RQD9lnQO3JxGdIm6SrN18mSI3Pfqn+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050040

Increase the nominal max USB memory bandwidth vote to let DDR scale
higher within its nominal corner, fixing glitches seen during
simultaneous USB audio use cases.

USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
MB/s, ~1.8x). This ICC vote does not by itself determine DDR
frequency; the vote-to-frequency mapping is platform-specific and
comes from each target's interconnect/OPP table. On the tested
targets, the old vote kept DDR pinned at 1 GHz within the nominal
corner, even though DDR can run at 1.5 GHz (+50%) within the same
corner. At 1 GHz, glitches were observed during multiple concurrent
USB audio use cases.

Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
With the updated vote, DDR is allowed to run at the higher nominal
frequency, and the following were measured (not merely projected):

- USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
- RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)

RTD-USBC is the round-trip audio latency measured over a USB-C audio
path; lower is better. Note the +50% DDR frequency headroom does not
map linearly to the +16% throughput gain, since throughput is also
bounded by other factors along the USB/DDR path; the frequency
increase is necessary but not sufficient to explain the full gain on
its own.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
v2: Added Details of targets Tested.
    Added details for usb vote.
    Added KPI Details.
    Dropped USB AVG BW vote change which is not needed.

Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..3a19385969dc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,7 +46,7 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
 #define APPS_USB_AVG_BW 0
 #define APPS_USB_PEAK_BW MBps_to_icc(40)
 
-- 
2.43.0

