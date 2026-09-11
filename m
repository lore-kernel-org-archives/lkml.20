Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176223B8406
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113617; cv=none; b=utbFOBF/GePzhENGLgX8/3916q2rfX49XsLK4s/kPu7zy4fQ4KhHK7MEJ9a6ZZrAK0GNyNuY4S/eXePha8eHZm+1HuZ405gXIiZMQD6yrC/UdsjuLPzMaZFa/b4qspvf0hS8EzSfwvlELNJRxJ/BhBEkJ/eLpyeZh7eUpvigM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113617; c=relaxed/simple;
	bh=3QuQQakF3Zi22G3iYl7aYfWmFHhSS6FeB684lImThr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXirjRZ76DloTk4ouZsvrDCgepAN1S8SvnDiKIm64SQxsGj2yU/qFspaSmXeluj8kGdFZgR4FIndW93m6AlvjsyTWzix5ALnVenXvjKvMzoMZZJTjXWmpuX+130+yvjnfYTYbBg9Djg877fxsS5XkTBfh+Y6fwkRAGb9fCxuM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9ZcKIIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3qXjWUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9ZcKIIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3qXjWUc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l5ZC2311747
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=; b=L9ZcKIIzT679hoaG
	oQr9TBNGi49c5ulNXEACFjFIbhARSDk+DJXp2fMPkM2WVt32eAriYTMh0F6TcZyW
	WRPUIeKM2eB39cKXB1K3oETEGlK7Fnr+Axn4JPLiFQTg8QPmLghpngZfPhTRY1dC
	V+wppBXeWax9rhN+dvVoyJLJANF3MBDW8/uBUR3eIZ5eIWJyy0cL39jfIyIpDW1g
	mwIalZkIe4ZnGm3Rds/UT+dRL65vIPdCavGaNtojWu1BdxYkaRdRPGOQY+tUQ8HN
	tf0kNJyU7Sn6Gb58QBfGlCGoxoeR3RRnN975WorC952+PwxqscmonVdwgWdVwsNa
	awz8UQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchcpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3989b317c31so177991a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113615; x=1789718415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=B3qXjWUcph/6PxJLYjC+04q4uU7Vv0HtRqIpbCQ0Ch49sUNcZQNZURf+6oL1QorEwS
         q+pV4FZyuGTFAYToeDik0yoRWqvJNJawR7XnsfzWE1MPykzNwqEe+UAIr9uHNsDn9OvU
         qoqznmzzHSOzoUfHhDi8N51gfRsDFik4A1R6wLoBaKr0CbO+8R3hs12LHshUWwsnz1AJ
         Ww90Yh4Y/mTp8Q8X9s0mYd9zbJVdM5aQIKf/qZSEtcTRlcI+PCrWDp5E9Z4G9Ms6whTr
         6bL8y983rIgl8lLVgJQI+uLGvi2l3pGVs6XWmP0M7vk+dR/xOVNIPFQ5w/14MfTOJOq/
         9Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113615; x=1789718415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=ej981Y9FlQUctsUCh5euC8wrzEeN0A2AkUKy3Myp+WOBEaifqVM9bt5Xs3qJ4CoQh9
         MZLZg21L5aaOgMtLcEA0lzaCYcl5bG7ZoOekRpXkP9uJPBF37NN2oaJsT8JAjDANyIOq
         ndsa85K1FRilgMp+3Mvj00Xmflepbf5M4hGL5oJTa7tfuEybV2gQx9aK4XUOtpQ0SWQ2
         vmJ0/e3yOTA07BRa/dOKNcD/Xjk/KOXpzGZhHlHGFBHfBfMpLbWLuMIVkOWc/CqBcRKq
         Nv5ZpnYqCbczAR8F1kgzOv2kdTLIRwtxna+WIZNdJGljXt6yO0dV9vBwnTltrWKk2XMf
         zNKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7JbIZYqxbl5ChTc7VCeu4b8dPSPOoJE8ITqeBC6g2IWCK067+LHKxbSXl2plLx33yeqPtr5ra3KbGu7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l/qIIPOczGbfm/JCsEw1BIlJGgbOVXLKyvUuqXCzvFFwoYJqEM
	CJvRYaKf/p2u3VIuxPanxEC3ekdoGok22UKrjK/wv8AMmyAkajDgr00qhsixp8P0LZnPMCBxwTo
	X4UUGNGIz1i6u9hAkgARXJ7IYJrW1uts7RQ0fcg5QweWFWBmprFuAJfR6Pm1IUtg0Obqsnr7gtJ
	o=
X-Gm-Gg: AYBFou35LRUqIItMWHwK66EBi2cPOWwpO3Mn0Rsf0TIB1/jkQny4kW8x4LvC4wLU4qj
	DIyYjmwW99mmKpQ9Tzjfk4SDsZUOx74ZTmgqxx7UT0J/K/qXsnmCAQqInBjTXtxdL5diDdQy5z+
	Qz4zAh1g4FswJ7Ph705OH4KihDoPHIsm8oJ6dJRuI+j2nBvVF1P1NIZofVwzP6XfKHBDLNbKzLV
	pmFko+hOSmw3l8UVTW3pT3DMxvaw53XT+lrPTJB5Zr7B5djk5pw2GHRG52QqA1xo/Jyp0b2xUWq
	v4SKCnyewwpUY+Mjx1btIY3ZVV8XOqa7UncrcDZgeUocc2lqRxJd7PH9fb77ltlSOEC/mi/e0jt
	ymQDZYyWJt4Yl4qHhmPVMqdGZ3nNdFR846C/WQmZ+IBWea2k=
X-Received: by 2002:a17:90b:48cf:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39d9c359923mr3078366a91.3.1789113614788;
        Fri, 11 Sep 2026 01:00:14 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39d9c359923mr3078327a91.3.1789113614348;
        Fri, 11 Sep 2026 01:00:14 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4422328eec.1.2026.09.11.01.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:00:13 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 01:00:03 -0700
Subject: [PATCH v5 3/4] Bluetooth: btusb: Build the driver from multiple
 source files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-btusb_qcc2072-v5-3-422754f4e938@oss.qualcomm.com>
References: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
In-Reply-To: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3b50f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4J4qWk0Wo-fRNhQ-KTgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX8hw3z1TnpYve
 x6XmloI62gdKjdsZckQANAbAqQILOUesxDrTkg8ODPUh4g/qnd/JEI48fDb3u8H/yAncKsrk+K6
 ja+3ZMjCC/09v8tWkm8O2DdBsxuGTyQjNKZFAC9nTdQs0bBCZ95hNnn/GFCYaXgvCMB+erQ97qS
 psI3qVY0+3YZ/nV31IQVy7KACGmaftjU26Qdh+vo0DUyLND1NGkN+zzb6dmK+T25g3TDRbqrvhj
 MLfhUZlEW6Z3ZkptbVaFy4t34LkoL/v2Tu+G5rhAphEwBo3HCmFZrZycoATjzdVLqOMXBPwfNaQ
 5ZplTDyWCSRrwGXUsOixMn9wcwtCv8/2DPCr3yjYESkCryP+5lqDxVLKrGK6kyK8/HeSMK6FK81
 pee0YA0/OQ6R6TwvdGso95IlNpw/6Lb5MISmjJs0Jv2uE25WpN42cz/98k+tPpg7B2ONp3n3K8b
 bxxxAiHp8mRVUnqC4fw==
X-Proofpoint-GUID: WF7LUeEicsKyC-iVJc8db-2W2DFmR6qq
X-Proofpoint-ORIG-GUID: WF7LUeEicsKyC-iVJc8db-2W2DFmR6qq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfXzBuMMmEl7d9i
 VRwdAwNB2I0SiymgwVun5DM7ot31JNRlPLv4f2u7xZv3ke3xBAPgOXnWWvnjRqt6WWWgeW2UIzY
 aLlKDcMB4B8f7W0tqJ/RrxcGKXMmFks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110110

Allow the driver to include vendor USB-transport-specific source files by:
- renaming btusb.c to btusb_main.c
- making btusb.o a composite object

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/Makefile                  | 2 ++
 drivers/bluetooth/{btusb.c => btusb_main.c} | 0
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index e6b1c1180d1d..8b436c6de8b7 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -46,9 +46,11 @@ hci_uart-$(CONFIG_BT_HCIUART_3WIRE)	+= hci_h5.o
 hci_uart-$(CONFIG_BT_HCIUART_INTEL)	+= hci_intel.o
 hci_uart-$(CONFIG_BT_HCIUART_BCM)	+= hci_bcm.o
 hci_uart-$(CONFIG_BT_HCIUART_QCA)	+= hci_qca.o
 hci_uart-$(CONFIG_BT_HCIUART_AG6XX)	+= hci_ag6xx.o
 hci_uart-$(CONFIG_BT_HCIUART_MRVL)	+= hci_mrvl.o
 hci_uart-$(CONFIG_BT_HCIUART_AML)	+= hci_aml.o
 hci_uart-objs				:= $(hci_uart-y)
 
+btusb-y				:= btusb_main.o
+
 CONTEXT_ANALYSIS := y
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb_main.c
similarity index 100%
rename from drivers/bluetooth/btusb.c
rename to drivers/bluetooth/btusb_main.c

-- 
2.34.1

