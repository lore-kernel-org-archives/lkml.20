Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302525;
	b=kIc/jRfXAX0LwnDTfnsxIoEO6aW3uL4YnhIF9shnSD+vrtRWnKjlxpxX2kgl75RBpf37
	 m/e90AcOVD69QGuJtD9r+fpr9fic/IeRix8ZTN4oFuPUjz7ajeUhNQ4lXBEZnjIqSd6R3
	 vOaWec8ZoS0CO1zJ22+gjxn4n3lRCJpBTwxTyiEB85mdkVLzRrZZotuty9IRoPRkg2GxV
	 wrD6fWAhjyTi2226h4PnClr3HcMXSjPgaisJ1MjPI2t0359yAR8z6vt8TRkS3kvso0MJt
	 n4lBTpBI1DBVQy1nP8UeJEawsnFH5KPTziPQ03ySEmapYSJOwxj9vbZTobcR5K12Ncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
	b=2q1ZeGA45bFjCcANodeOPMIjVhu2sLG82+u/80tl4ZYvVg4b+BnschcyXKY3FvaLrbvk
	 SecHt5j7q3rf/qv8lwhUoZduU3ceFE4VxlWmBU4cYcMbMkhKA40eo1LUHxMcxEhXg+CuD
	 ch5Ch2/IrYFopUW+Zt1JVzCujMjjB5YkbO8GAFJOH7x5YtfeXes/jfIqCy5ik/9Ca+KrF
	 LA23Lo3e/nRJ2cGN5PFdLvg31/ehL/olwxEuTMC1dyyNFf3pKcsS6GbLLeEjlbq9yF/Do
	 U+p2soy6D0RtJ/BM8NODTmV2JQ0LE7iLBNvdBX2lxisI98W9KxAEvuxwLj6NLeFT+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F7606E58F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22F7606E58F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7khv02779719
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUCh
	V+Og8680=; b=e121AiPk35J30TLioc7J7i0gE+kMarl+GfW7fO34cc9MUxOvx0H
	EXw967PMUZWBci80nGFD6EDdpcdbUT9hmjnZiTm6UBgsV43KrQLE0KUvr8syA0Ji
	lKaGzHB1saRo9p0O5Uaq7WOghMaLkNsY8Hk87/EvyQPNgZxDwmt/e/x8sbru4cqv
	BCBpqJ4LNUyUoVbEj68gxqS3gNrhTv/sKWFh83N3SJLbltLwJy0t7C6KLIHLqrp4
	L/9UXpUu+L1vRP7Taaxa49v4J+Z/OwLBta9fS0NPcH2DmwK3xM+DtxKb1h4JXSfG
	LVmfOeXTwrxd776VQDJq7ABVEdS8OZtTe1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8cf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3306869eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302523; x=1794907323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=kOfFfZMoCDemRvL2FC3l4BxPWSjlZjCCtdhxe6VRdq+lcSeP+LuykJIXyjhhaAK0pD
         gCoDsTtMLdqZmw3AX/d7GagEinMwYJug9w6YEZx72bRv7/H55mPFVwonJ0Z/7DlCwocH
         +RbU6QppvdZqu11M16U5GCiwmBSZkn/jbdso/Yq0Rq/o2ajn/ZUpAX/LuKas4T7f90mX
         HUTDyCX1p5ZTvE0fuarYP+h+rzh41aknue09A4i5KoL9jV61MqX4d6D5yGncej22dc8N
         Ol3T74T3oHs6E8UBRVrqbr1BE6BBDyfQKHz3a8GjEvrDM6oj5xpl8gn9QeTGB7X9mzxK
         JIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302523; x=1794907323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=PylRy8qWnT0b9OuV0ExSan4UoB+ZkFlhf6b7js8gSW+wSIpaGO3ZjfIqbockl/huyw
         4P79nHec3G7RgDk9JvqJER9sWcDuBuWhUp/1B04Y01vPCoMROkVrl/ZHuKEJ2X9Hf0yS
         XiuUnt9yH4myyoOXAaJGmejHfDmX8LwWK4bFsqeQvUI3/GLNEJZ17rFDeJPG+RTsrMHu
         Hu6fipPf56bUcL4w5PA8Yh21ygDAqjIFQFGBp61YTlWgNLkdK4UYSs5Hh0+33HklLymd
         CkklsBF/UqVKst5VSHNsQm3eDYChLURKvp351nRmglGhfxYoj4Qlfb7loIK83CsaAQAm
         HnZA==
X-Forwarded-Encrypted: i=1; AL+hErFI32nltdbqGfLpLTQYRtYqTVkcoYU4SqiSjf4zTEqhTLOsHJmxkm1BLf7BXY3RRvAoxdumlnQqccAI3QE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pNUxrQHX3RUn7FjJGGIu/SC1h+AM99htp0e1qY0Yod+lw6QNE
	C6X/PhwRWXJh5HY9l3U7M5p0lkah9HzI24qZiyfTZCHwwceHiIpn0uKx8uJU4UvOXmatwCfxLBS
	9I9BpZATMMqCDiWB8QZPTbDherHtO8IaZL9l0G0PoZvJhgzPGs0+GHMY723T80m5mJmE=
X-Gm-Gg: AYBFou1jdHmrk7RbiZCaVzY8Pq4OPUK7q0J54ubCObmIIX07x+JvWX0RD1ziph7eI1D
	n/5YgDmaQxyXbPLpWFu2e0tyHMRENhPle0hR3dGwi2pQQayv0zumqMCVHFZEYw/JYFN1c9fl7iA
	MuWXtDi4FcB6iIaPOx5pMQZ1CanDEGJcS5zSs1pYYhBMdsAyCEEw9sfILaRI0/CybqHxb31ElLe
	oNFDBExbJSQz7rxMRHk9mJQYr/TH8DjVy0KFHo+atHpJWlhaIwjatgKT2W1ROtMXgBipAPeAzJa
	zYuX9LhS0wK1Jm1BiCuO7d7vMnCFbEP2aCqBkRlN2TDIA/Rw2e7rqTjeuGpZwrJloJn+sFGy9zD
	YAENh+KbFSugcUI7xI5Tm3q4GgJhJpI3uThTZ02688mAHrR8Y1ATn552JUisn0Hf2B6XqDoEfZ+
	lEo1QXG/Nkeygb/lkUWFDCXA==
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201344eec.31.1794302523276;
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201290eec.31.1794302522745;
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm5257153eec.28.2026.11.10.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Tue, 10 Nov 2026 01:21:56 -0800
Message-ID: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZNsCkQ2LluP10zAVhtcscXfh2DBHNbVQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX8K5xtBbJnf/2
 l1YMLkFItBenDhhHP0Jo3Dy77rgKeJfPzczzzsDQhh/Q2jt/rihITiIHTuI6xUM5iYTguLEeW1T
 y7i5YBah0qZ0wKDx3oInFdr2JDLyVc8=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af2e23b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_NthRW4p-O9EqLlfnj0A:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ZNsCkQ2LluP10zAVhtcscXfh2DBHNbVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX1bMImOUooM+y
 JOoNNlo47kTEzvgy/aS2shMcfrf117Cxg9n8znYVNtrFI+GXxUJ1iGlQzFbRznI8jurxrm9i9pJ
 Gg53R3tYVc2qyc6hzyG/YShec6mduItUVk3PEY4LMJm7j3CPO+vHQfymqtDUpvwUqmze+GMYjZh
 3kg7EIEl+gUZHo8yQWYWE8qBKU83O8g9Yzo/iAwbhCnccgj+QxVkYZLzeFA+E53i9J6jMDI9LH8
 0b/HCUaPAh6JRgEvzVn8MO6ViHnvBYdwM31jy4MOg+zXHPIBkTIo9H38qJuXynoskQ1baILn9Ng
 eADCGi1SD1f6H6/pRn1AHuay7Y0Z2F5ZcrTvmV40uZAvXyorTVzAc5hBvAYJO8Qd3h0WQATkUDE
 C+iVquHWjT5W8F56ztXpYitASpVlBKYMyUKpLYNCYt7c+BeoozjzVgk9gxAVTglZQ0YIh7sPJa3
 yKnY70UpKEL1CgJv6PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps PHYs powered (dwc3_core_exit() is skipped) and necessary logic
  for detecting wakeup must be on, so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller. With this patch:

- USB wakeup stops working until userspace (or a udev rule) writes
  "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()). Platforms where this
  power down path has not been tested may fail to resume.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0

