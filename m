Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814925;
	b=Kuqv1g+mk5SQtSqMOP6uj9yZTMx/kdQU6awY0IwHO/MR8PD4Ck6TVHlpCvwK/+NnWT+K
	 qNTiLumH7pUFU9Z2dUPn/Wq/OrRvNW4p0XRal1R/Sw7/daT77XhWQZPXjiKFXNna5LU52
	 In2uXObtvNeU0gHsRwpcrVrhYn7C3o3W0GPocFPxCCnw0OIh9StmMLyT56ywLUJ0vBXUD
	 tekYPDQyuyo1tYN+gaUZalLD8/BDmoQ+Yv2ZgPessu0XD/UcZfdNJhbJ4d7X9Vs3ti4yt
	 7FG7uOhxvD46t3u6bcQnTBsMjvn/p0rAPrgVk88G/ooldEJsGef6vjjrdc4EO6yw/kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FdrxUq4py/L/IJTDH7QgfDzhkrTF8BaEi6xE9FZULpk=;
	b=OIBvc9I6y1epSmyblwA6TeaMBIPfh2fm4OAOgHIXCV/VeZQ6Bqa2LiH13CLUkfvFSXNr
	 y8suJTC48GBXCvkrqa4pCIxWgXKiVTeFv/YKKQp8DXyBGBBfqWayEBPFMYggpNBrbhFKh
	 crmIKtSWBoajWzUHSfnJQ5mrhtCKMb1mYzHXK2JCWwOq2BDdxHZY6AN33vgGlNURrN2jH
	 FIGTo9BaqOSR8ACtJe+nldx9KKQTTGPxBTHN//s0sf90ZB0RiqNBHbv45mnM/U8iOtUdP
	 5+MlOt+ii0EYCcG/e6u7f0T5MwZU/Bm+ZZPl6SVfsm+yFC+LaTj+jB62QsQZiHKe1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jl0ShT8s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azCE5LU1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C34606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C34606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jl0ShT8s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azCE5LU1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ejLt4149278
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FdrxUq4py/L
	/IJTDH7QgfDzhkrTF8BaEi6xE9FZULpk=; b=jl0ShT8sV02hw3hE+oLNgPzajMY
	DYI4X4/Ihe73DT25n3EkNpehsuS3kexsuu2SAYURE3B0+eaCOdyS86Wta4IyLXyP
	Q5srBCrwgLhofAXxoZIjTjESz7twvCKqw6l/g0MrMTGwv4nxWPV7bhgBfMEbKbsC
	ycESXdlbhSapfnLRCG8uMNbd5/W5BpaZwxPaGDsSMHCzwGJd7+Sjdfd8DwkEAddP
	sA8vjekJ7Nc2hIWqGq+qMD91CVm0NYLYB5M/NqaUoCV7sOs/GRHES6D6BE1qCnTf
	xNr1E84HoJHJjUVXkvG1qNmtJIIv929jvM4/IfwTDgcedU7X9muv7lM6Czw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhnb3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so4120254eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814923; x=1795419723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdrxUq4py/L/IJTDH7QgfDzhkrTF8BaEi6xE9FZULpk=;
        b=azCE5LU1bO8FXIfjQALu2cb3pgTtyiJ4qlWPJfGlcYO/WlqTSFKen/5pBg5f/9NGoG
         OwitCUXKFfYXye78P6T51tdg4C5N3JFYaF1P+FVV+p/A4L86rs2gY34553yAbr++A5vi
         BjdANcxP7IWUFd+4b9Zz/0ZQaZAM4nowjgxma9h6Qj98W/Y4Qo/KXlIwdD8SbL50F4my
         JEH0FDj8JA6Fou/rwr5S9Q/IAOxFiVwXz/28bniWoP7yaxf1OhXfGURA1fTzmVtJPcRY
         DUsEWISiQrWMXhMD8UXs8nCQsIIP1VsLOF0QTZNRAMa2lC8sEtiSCPtK1bSR7TjjVaYs
         wh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814923; x=1795419723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdrxUq4py/L/IJTDH7QgfDzhkrTF8BaEi6xE9FZULpk=;
        b=JFCYRHoibvK+zADT9McjvdwyNK25HSfI5Jdv6AElTNjOiBqTpMDkMxez5knc99aH6o
         PW3nHopZsFtEfG+01zNUVuUz5w98MqaJ6rakT2rCHhT9+R/o7QXUg/rZkflmDVqcmFHL
         cmNyuR9Ov/bvPJ2xdREXtt2cdMSHgsyto2SgryiC+bV/LUFN16wvm5Zrl5KRNPb5yozI
         Lha4vhE+VJ+1137d1d7WsX6ZLuOHrUWGcc6OQefre92t0DJoXtnvbrkztjJLomVtJk7A
         COdnwilpNRM090ugoj2cmHlW+BOT+odqzVII463kxon4XT81zwEe8SUf5QPnDdUUIDM2
         hkWQ==
X-Forwarded-Encrypted: i=1; AL+hErH/QR2NLa2MwHT+vFlcpAhcbfmKn2iLpwG+0o6Mjutj1Av/2qzomYgwrngScUpl0pNKGyz7TO04lyU7aT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Q4xaoNgWVW1AUpuwNfNZq9Ii21fzlvcb9jLYUSPBiOlSBWtB
	BOifETFKuzHu0O138ZTpz40Ij7zljNsABmNvI4li/SOCPWiW/ehluOZgAUM5FCtEpH4i41IXuEX
	r1pQU8QMqV8mX91W34YEeR2gUzBnr6MDR+4YGLhE1uNxbv1I5N5oN/QWLys5saKvv3AQ=
X-Gm-Gg: AYBFou1ii6QRMjLjYncWCfz4edf/j09WMsdPQqBzMNaPpSq/VuoKLV/h3UmLwWQ+Pyc
	nwv2dX3YrjVplcMbwLa1zydWhAj+gKOTSQ23ldymmokfssBZq/Poyj3RFY+qntFeoazp3TjLIpd
	+q1nohlbBadhf5Z1fYLVVLak37nj9pduVc5jQuiHijj5gyLdpoQB6+xB7/JGQkSgXMPXkCcY5g3
	ICb7ZuV7NZeDWZQxguEt2d1Uftfl1erjCMLJVGBhesYFuV6MzuHEyM5H6nlu/i6yWiHzoJoxdjl
	fKWkwtYm6TND6+FC6H/u5tfOVcADdZZDeD0f1cgWtK5u+fsHrT7GdlQhcWob11QCjNqit8X7sRV
	wVW73+tm9f/hgaLHGm8PCblfakUJRzczRu0HshOYx2bXoJ4hmSXak37/E1VKViTRoeMnl/rGgiG
	WpGD1wjCGfecGhq1BO3DngGy/7k2kS15F/jw==
X-Received: by 2002:a05:7301:6185:20b0:379:3c04:2cdd with SMTP id 5a478bee46e88-379686a7f3amr9525442eec.31.1794814923284;
        Sun, 15 Nov 2026 23:42:03 -0800 (PST)
X-Received: by 2002:a05:7301:6185:20b0:379:3c04:2cdd with SMTP id 5a478bee46e88-379686a7f3amr9525413eec.31.1794814922659;
        Sun, 15 Nov 2026 23:42:02 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:42:02 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v18 7/8] qcom-tgu: Add timer/counter functionality for TGU
Date: Mon, 16 Nov 2026 15:41:17 +0800
Message-Id: <20261116074118.822731-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: zSWefb1KP3UicDED9jkhbKuLph_v_pDD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX1iCDO6voIj1B
 nx5agZ92WyU4WmeXINSCVikVPpdqfL2jlrfq8rryWOIuUUsU0WALualA0Dt+t4R0syZ0bXpdaHC
 htVng7zZWo0hUFAlP29Xxsm3vggIaF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX2IoxTY0OTRMl
 NGfvcjiyRLdNEW8ZqKVzFwr15cWqRxAhKaBR2IW92c9D5uevD62w90YlGcELLLvM+vIgNb+mC3/
 tHkkpRh2a7J4hsqqp8/rLUZbnGhvVbQIehLUh1EtuDse8Y0IpxmvWKMO1e/HuEzxQ7w6/maj9IB
 IZ/Xtow7IMF7MXc3w+czXnOnPAwpHPRA2p3zZk5sCDlNXwtiGpKmz5BAUfsDSrWd663d0IqPRJG
 suGUtj3BScGVc94RIW/SuJ2wE6ksq2bGJTLNSkQujnzs0b30DK/icQYpNG27n3EOuXgDf5l67gJ
 7znas1BJHzmhvXywSR3hhPaBn77QPBJ3LVkO5vekg9uN8MEyxoyAKwbh9XAuIKpbVNf/dv2mUUT
 4k07sKiCixUN64g64WykIqw6Uy6a+dLF221J6NL/3TM2Nm/1bFU1jYQf7jPQg3vJwJkS34lbAp6
 XBR/JHwgbEtXRdaR5tA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afab3cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dL9TNO4Ss2-3uZuT038A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: zSWefb1KP3UicDED9jkhbKuLph_v_pDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  32 +++++
 3 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c30b58166a0f..71187071cbc8 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -37,3 +37,17 @@ Description:
 		(RW) Set/Get the default next action for a specific step of the
 		TGU. This is the last register of the condition select region
 		and is applied when none of the numbered select registers match.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 04076eb7a19b..aa7eaed0e738 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -63,6 +63,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 			reg_index = drvdata->num_condition_select - 1;
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -115,6 +119,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->counter[index]);
 	default:
 		break;
 	}
@@ -160,6 +170,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -209,6 +227,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -259,6 +289,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -270,7 +324,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_reg, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -318,6 +373,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_select = TGU_MAX_CONDITION_SELECT;
 	}
 	drvdata->num_condition_select = num_condition_select;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -497,6 +567,38 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_select" \
 	})
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_TIMER_LIST(step_index) \
+	{STEP_TIMER(step_index, 0), \
+	 STEP_TIMER(step_index, 1), \
+	 NULL                       \
+	}
+
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
+#define STEP_COUNTER_LIST(step_index) \
+	{STEP_COUNTER(step_index, 0), \
+	 STEP_COUNTER(step_index, 1), \
+	 NULL                         \
+	}
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -547,6 +649,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 27eb1f81effa..3b103a399815 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -18,6 +18,14 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 12), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -47,6 +55,8 @@
 #define PRIORITY0_OFFSET	0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
 #define CONDITION_SELECT_OFFSET	0x0060
+#define TIMER_START_OFFSET	0x0040
+#define COUNTER_START_OFFSET	0x0048
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -60,6 +70,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -69,6 +81,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
@@ -86,6 +100,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -99,6 +115,12 @@ enum operation_index {
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_SIZE * select + STEP_SIZE * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_SIZE * timer + STEP_SIZE * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_SIZE * counter + STEP_SIZE * step)
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -121,10 +143,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -138,10 +166,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
 	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
 	unsigned int condition_select[TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT];
+	unsigned int timer[TGU_MAX_STEPS * TGU_MAX_TIMER];
+	unsigned int counter[TGU_MAX_STEPS * TGU_MAX_COUNTER];
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1

