Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686448;
	b=2qMA0ngUqY/Z55i/fz9xsCzFlaXoz1S65yIZB/CAxrBCyfFBRnrjsSsQ1MLl+BSn78iB
	 /SPo5u7w6qBMHs15+xT3yaSNPe1vpPzgS1jcUMyi5Ibtr3/HAaEjjURTnhmEp24uM6ybA
	 LDxj/LASVVKk7EeNsNb4kgkav7szR/K/XAEFG/TCflAF/WEBCH7TqRfObIY9jVvwYti00
	 iK5hjRtX3+G9CqSka/NhWkXVpErLfmdkyvUxyvztv6jT0eejSN3weg+lwUkEEfF5a6mwA
	 Kw3wtHy08bGPrdV2AbfVVfgk0B2rIGSrao3szVxC+UAtxSkUpD2fWjs5pTtHXExPQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
	b=2Fx7CGmI8LWjUoaSTEXwZXzwn4qRcLELlEQeTJMVzB1os1pxJPGz33IthNsz5jYivYHj
	 AjlLCVxt7PybW995qoXX9juH0jYnihTpK2joGSsvlSI5kF5dS/yQQ1ZZL5sUwjXhsa3H8
	 N70KjoP7gqs/ekJhlz3FOB0HsDvsaP8kzf/Til6dliBLXIJsSoQq6SxVnFjLPSSSNqm4D
	 kK1yAoHcjbLZMhO9hi6Rl7Q/xlVhOvTWzSk1OCYMf8wgSvaHk1N/WAgsK2W0pcCAEKE+i
	 diZSmcBRR6RZnKJVC3Nw17p0+M2jy/l0lAy0rW9n51hISuGJtbxI0L8IT3bmGawFJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7WeFENB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0J5Gdww;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197A606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8197A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7WeFENB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0J5Gdww
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eBBK1397216
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ozx3sL1vjM+
	KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=; b=c7WeFENBSj+ToB28uUo6x+EOLkW
	3o+qH53gHDMstf9MtEsMUm2EP4oy4FYPw76HHQpd6tLEHYjapYiKOxA+ZyiLGNNB
	KS43/vlQg6IxMaGJSx8HJE8NY0HvToCfztnBiLrto9+PIrmBgIdUEHtpYwdo4nQr
	Lh+QFeAiFV8qJpJ3kXU7/h04IJFMQIipLFgrwS4bc71At6/XTTCntqrIcG6ViHNp
	ukTJQeKnOlgLc+hNJKvRBLY8XfJA83HZSNXsSRk5R1CLmoLPsR8hrkQM3RI3Ldw+
	sqMIe364efptEjssdpC5nputuzoZ0MAbYWk3YW6ukoGFP5/GI2KgYbbEXsg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5h54b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:14:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso648012c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793686447; x=1794291247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
        b=c0J5GdwwT9T/3FHZBmUTyRC1AJc7gyJIwEx5gFt8J4ocg/M8aJj4Gz2LySWfHM7xD0
         pQFnCV0FkHv/gIq/XEfsqWL9xzhBNQZ98yncV5Mv5SAbTZP4IKpUlbLZAus54DIuOYxI
         Ofgoun1iCD4qbOVseHMzBHMjSuXVbY/pt8GkvMJ3dNMqHdpE7Z6BA+2vtp8FBRDHuHYL
         J/TVaT3UJ+uI1m8XYVLw7q9foz1tH0E8hLmhnTSHsu5ifiod0xhnIZZ0dvC+fuys6e+E
         XA2XDFieQH9rRhArzS9bDTK3Jz4x4fHeG29iKd89BhTGN3i+7h/4/SeSi76pqL1YUYEf
         IEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686447; x=1794291247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
        b=oNWILFMn8Eeq7DireHuTZ6YJxj1AFzwXZWl+XKmPo/MCyZ2QFws+lltk5ScLcHYpXu
         jgGeufgjB+RPIi/dvUYGrj/NlolVEhEzxTNQ2KPNc+wWAaRYHwnpGaUJXVSHbaq5gs6Y
         OvandgAFupWZ7KXQIk6Ty2+sBiTqtt6oGqcJ3ibsJSL9K1mQMOTyS+VDUJRrqYZDdtrM
         IP8lyWxdg/14dHvOvtJZwmzgaIinQ20G1I2Q4h5VQ7nLv2Q+D8C0KDCRL6KiJ4dtnbhn
         dgka8TUQAstrXVTGhLPDhOGICmXanfs7iHkk/gsAF03Ua80j5sZzZwxITWx/jFo7cwJU
         MYtw==
X-Forwarded-Encrypted: i=1; AKwUvBwApL7aRNwlKSsw02r6HQ/LW4Yqu1y6cz3XvCWvwwJj790VN4nflu3PPWHxnBhH1t9hmnYWwAkTeOkrtIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pejKLWgaaULmxfn1/dP/IhDM1KT9A2/0zc41M3ZG2CWxk5ZXa
	/urn8KvBIer/l7tNNWz11r2KPsrIA0wgglagYt491uyVQXXT33wvwvH6/I9vfK/n1XthYfGeKHd
	5K4UUODzP/AUPnIFkx0VgP+WYb1bbeDkvlaXFV2j8fX8sQ3WZ4uwqErmRB8kd0Rkxi2A=
X-Gm-Gg: AYBFou2tFrqTuYH9lqeIjVn8mW1aGOjUuuTlXBeNyrXKd+BM6gS71SjWWQ/UUtVfHEX
	xZfOtRXcR7j008cDafTKW+kTnT8J3yHLhLl/NvvSr8Qbh1K15bRQFtzT8BQ7/xfBJXeadmiMGo6
	g4OdPjJMG3/f6PKyZOpN9csxAxS6C2DoNB+1eMrSzvDndv1SDJ49eTaObU4tCkEswDY7p+qjtt0
	9r+ibIy50xbtE4amtz/42qWJrXc0o4P11oNZcDfqmCHGMb3YYrfBSoImPiHooPdFZkdAiV2Gkk3
	SSOHteSPUqLyXOv4pzHmVfc37XbDsxWxKDP31KGptCY6iMgT/6BjAKfYrpZSX4UWslx+nXz8NRe
	Owx5HLDknCJnS0T0eNkPZqzUoZy5wcH7ldIdoREk0FEdcsR+tfBbY7TxN5WZi/eO0LcRZUxO7eN
	ho9msv+0KqyfWFUWRFNUR0nw==
X-Received: by 2002:a05:701b:2086:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-1ac5e31f780mr19304269c88.34.1793686446876;
        Mon, 02 Nov 2026 22:14:06 -0800 (PST)
X-Received: by 2002:a05:701b:2086:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-1ac5e31f780mr19304228c88.34.1793686446281;
        Mon, 02 Nov 2026 22:14:06 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm1947091eec.29.2026.11.02.22.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
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
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Mon,  2 Nov 2026 22:14:01 -0800
Message-ID: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZBx0XkXAHdM9xCTXeVCrQPm1w_Xaanru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX14l8wfKyyiMy
 sN84BzI1/UA19SNKz8bbKiFmuPUIXC20he8OOPnzQ1JRZa4lWyJ/QAXNcZKn6137V8rDBn8gnH0
 HNTMvQmq+xIU6/1ljYvxifz9Zrrkhxw7BOJDpvhNp/cG2zCxoVs6HlWIsiNtD4FspiTfU1myPFA
 vf3MWBUQswbeqgEdihEobE7sVpea8OMRDtaCH7T0g3qYJ4o4e0Uea5Yp6AUpHLMPcyPaGMujCIo
 V7Ft9csGY3pRua0TwiWpNCYxg7RgkB0BCpRLVRHMyPHHliZyM+rWKhXjCfZvGjufO6sADuxOzDv
 RSJutd4EQdlC0/8UmNA7Lvr1uNiPBcMG4+uzrd+vWnLSmoA2cQ2UNb+QoeBGoWJqFfJ6zMBLfLg
 4+APBHl57ii+d1zZXBl3wByYSOhT597m2Jhex1CZq1+0JWjjWXPp7LTU/0iCVlkJn7qyvLa97Na
 7BeJawqVQP2OB7B+ATg==
X-Proofpoint-GUID: ZBx0XkXAHdM9xCTXeVCrQPm1w_Xaanru
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfXxyHTb8ppMxZ5
 cy1LlHOpokxtOUuv24uvPZoZcwnjRsGmOUFyV8EmqnlBpmK7ndvYTlq1o04aFBPqbqyn/m1xYJw
 5Q6LowOFRyQb3qdz3/oo8gB6KWkIxhg=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae97baf cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UBq5q3rzQQf4y2_YTtcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030024

The "wakeup-source" property, as described in
Documentation/devicetree/bindings/power/wakeup-source.txt, only says
that a device is capable of waking up the system. Whether wakeup is
actually enabled is a policy decision, and drivers use
device_may_wakeup() to decide whether to arm the hardware wakeup logic.

Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
property is present, so USB wakeup is enabled by default and users who
do not want USB activity (e.g. connect/disconnect) to wake up the system
may have to disable it through power/wakeup, otherwise, unexpected wakeup
may happen.

Having wakeup enabled by default also costs power. In host mode,
when device_may_wakeup() is true, system suspend keeps the controller
and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
powered off) so that the wakeup interrupts can fire, even on systems
where USB is never used as a wakeup source and could be fully powered
off.

For USB controllers, keep the wakeup option default off and only mark
the device as wakeup capable, so that the user decides which USB port
is used as a system wakeup source. Users who need it can enable it with:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

While at it, drop the local wakeup_source variable and use
device_property_read_bool() like the other property reads in probe.

Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8116dc94c181..1451b5eaccce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -653,7 +653,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int			ret;
 	bool			ignore_pipe_clk;
-	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -757,8 +756,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
-	device_init_wakeup(&pdev->dev, wakeup_source);
+	if (device_property_read_bool(dev, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
 
 	qcom->is_suspended = false;
 
-- 
2.43.0

