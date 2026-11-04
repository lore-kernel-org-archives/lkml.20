Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801056;
	b=tueVBzzQe9hseRIRPGt1bWrvjYv3lvYCCF9xwdrTi4c/9HpkENi0e5lbE4MiTmQWGeBB
	 qiufcpzl1Z8IDMnC2BA/zboUKuytRrVNSHGMwy9oTKA+bMkU8nq7bkuA4jJ4M6YorRREH
	 MvmIuvnykJW7r3W/B63rbGfUXZNacE6EdCFSj+s86W/L9vHUPwWSDMfGGcMsv/PumGgFd
	 DcwktBw8dTR++jUNBDrvL9SkfUsJm/+iyPNvElzfIeOxGtPVJw1/bDTh+R+YYfDGEbDJp
	 KZmaI41YubruM60mUXoJEYmlGVF6MSVyN9HaIelHYsheKVKTmq5lP6CjfrwbsPxjWhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
	b=VChbbm9wEl5nTff6xzdAxjknH7G+Xgd8Y6kHLFNoZsvZOUtpU7jBsZK+V6nCVteO4vGL
	 mNy/Tk3QroqCiA7pSb8148ZB9LuY5NrXuNSbJHPw5D7LgXtImF/URyHheDFyVc3tl6fjR
	 2oIoiMdtepCwZENbEsOoE2+Vnv4jyn6/WKadZmyKSb/MIVbYNFipeQgJeeRIsVaeFInq5
	 DsroORWf/RN7aighSyChRM/zRF4uj8T1cUZTTqREhtHcONksGzeSy4dyeKN1wtpdbLRft
	 aa59UJYP0X3HUeFJJvZhJYkfewVIi5CiUq/wI1BibkjO8nsUWDOX7uY3m+pjvmsvcUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTK2YPy7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E3606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTK2YPy7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtDU2667770
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=; b=hUrJSP0Mt8gOwM89
	5KbD6f1dJANQXZnFSR2CcGYiV3U7yoRkZhd1NTf0ix8a+F5TXzpgjSDBq7yCUqw0
	GAMse+xcJdgSfPtL4CqWLceUFzTW48Gegyvj9VZJRBu4eWz8QZHrny9HV/AARVZC
	Jdqzp+ya2b2KmUaiZhPm9RNgccFgI/9QAqZS0YvuOif9nxZJUP4zw9niVCspry4X
	eQAQaird7ZE8wsa2OhzgUH8gslTW/92WrZBgUo9M8l3CpI60Hw6l/yrplW4KL/M+
	2O2K0vYLXBkErIh1/qG/G/z8MJ94F4n4n+hBxyqV0imU1U24j/nT+CyLmbc2tE61
	cyQWEA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmedv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6fa0f0so681132e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801054; x=1794405854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=QTK2YPy70Wa2aqVO9UVVARPfeOemuiBQSpQfeLQ/9Ln/6zE4flSFwEZf+OkG32yLva
         SPqpBvjzGNCm2Sp3HlC/fMA7s5O2rnIzadkR3qLY9Sh3NLoMqV/NXVKss9qfimQDGOY3
         ekisPS4axOY9WVEY3LBVJ4ipN5SwF1NhgYhajOdGIYwqOE1yBuOffGmEKYS81sQ6YiXr
         IXZvkZUIh00Mq6GNeVBofI/4BuqQtaYUFSHHKsa2o42UnYxvFHiS/X6kBTv6w5MBX0bW
         bUiSloyv656cnp9t4UEGv066y7QRfES0yJ8HU2Fk+IwibomZNT4gacDiDKzOOrzAMpaE
         lyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801054; x=1794405854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=Wq5NqqfJ8gSsZGZ1zWc6gfVSy0HqDHO4AiBrOJqZN0gcWZEpYvCptAxzc2FxNbeKvF
         xdeTjl0Chyb176ePXUdhzy7bq/uhcqCZWlDbePaKdF2Lc6xMhFf45H2glCNaeL/W/ZEq
         ArYrEDVE+UPT9kHu7anQCW/WoAJb0IgFdW8wQ+idOvU1/veHqKnlmIApKMrIzpw8DoSO
         nF3OdQlPF2+QhEVyskWhQ7Yt+D1a6zkoddZXUxEt9J6kx0qGS40L+/gzJTwmRs6/n+Yl
         bCc0CxbI3Zckv9Pc6SOs5MZBNBejFDLsjzxRwSrEtaTquPsu3s+Ip8VCYvykbi8yJ1mC
         m3jA==
X-Forwarded-Encrypted: i=1; AKwUvBz2AIK92iVDmk8qEnNgm7Q7n0rXUawzH0HggNbypA3pqUQvab0rOnzyJShUzM/q4zJjgdDLxDwRnbaNA4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PBo6CLUVRY72oFw/0hR9ozwW3g4i9KLje1/yxA162l4eFW1Sb
	LN2QcwY0iZFFpThA08KumdZK4+wjCXxU6xgU4h5DoIBvB61kyNmKqF3239347hJzB1GKmZtdhUB
	BZm4YK8h4SOQrsUZBfePdqgkPpiEDggoxkkx8q2qR01KYZSAjnM31KQS8phxnmp7Zhow=
X-Gm-Gg: AYBFou1qZVkMHSG4mUT7GPl0Qkdy0ezo/0AHlRovAdwVOTUfQdNng4QxZ3fcyVlShKM
	Tl+kFGxMSglX+g6T2jXrchua+5b1T3an9W2+wK4jHKXt5KdLH1NqAumubYc8ExXQ2Lz4IEKnFVn
	VHIP5o/dJ6TV0etNxzXh+uYQ+yzcZIyRS2PjOKojcEyVY4Y7UpR0Y0nH36RJR0wSKOo48hMBMS3
	hTYtO73rPIQ/w1YCT0s4ZsBHVDChzv80Tp0/a5Nx5sv1RkIQmzOPgtaPDCgViFJhJWBBpAd1HmX
	zfApvq4zoDOHKJdK5X6m6OPFkV0KbkPbepNXCKOBiPMQUld/1uRptolMIMqdtjweYsGMe5SyISy
	ucE/BtgciTNYMtpU2XlU4Mp7akidbmd7yf/GXu6t63GqhCSbuW/JmZS7dv8JZkugdcyeHafY0OV
	BBfg==
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134468e0c.3.1793801048573;
        Wed, 04 Nov 2026 06:04:08 -0800 (PST)
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134392e0c.3.1793801047851;
        Wed, 04 Nov 2026 06:04:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:43 +0100
Subject: [PATCH 1/9] device property: fix fwnode_name_eq() for empty node
 names
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
Message-Id: <20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R5+4YFOhCFZOKo/xPA+jYi8jqwmw0oVnYVkmsrZp3qo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztR2VZRR8SSzbH/fsbXq5OEdxvsguiNVfCLx
 Ww5wWSa7BCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w5PBD/980NX1kpJDXHWY0ehLFm7ONkPKAuH/9fpNf1NS3nxrcWUQisefHOE7Rtk/myleJL9pvTZ
 YMTEJgUAddIze2s4CfeWGuQ8XZFF7XDUVZUbEbOtrLh48sNh7UZGAGdmdk0hiu2lX4cpQgRYCSK
 uW+Wi36cN5USM/zBa6uHoUVU16ijpbYdu/5buK2ZDpIuGVch9S4Cdi3QYTY4GuX5TTABbhDhMFv
 7DEAV9ZrMrQ7dAL2gqjtxufFE2m9E4dVq/OPbCMJd4uGCAFlbesp6DVR74ibKRP8u3vU2ZR0Y5p
 9IoMSuYhDCzsg34QdjJIKo6DlnCAH69Bv8z8luC+IjDAhxjCkB/BiSaU5R9/mq+7N+8UjeaIhqA
 GBwQmXvGVSyPqZkUseXbxJRz1zqT44o2PPn4T3Yac1vkXS0a2/FttiXRtpq0Yeuavow36rpt+Y5
 6/jgqc5sChJIQi1fUCFZZZtM45m46b9Zg9iVvaHk5deuUjR8W9Mrepc5mmFJKzrcaiPf0uy/cDO
 K157bZ32oblK2TKDNhw3Vsw3q/WsJ0zudQpSEB5tTuopcYARa1H0I7e/v/UnvXs8HYQ2tMzx9k0
 aT+SQXgewV42y6g5n3wfSwcX2GBztUDAy2y5NR7b3xRzlyDSGDM6IpzefrlsoUKH4riVfSSPn1q
 dT7ZIUbHUkPawWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX9ykhTTctfByK
 WxPuyIYcChKgENsTvaW3/2CLdS5W8usty+cwX59HwcSR79LKlqN47dBfltXAizpfjfiJO8aAbxP
 CU2bJBcRZJUEjpnBVIjAceGiPLztf38rB5dXTqmF9vCWuWrFef/NEuPILZKAGWYwFCZRz3POiZB
 c9zdh/HfF56cWZzA350NWvYBCsnYV3iMGMn/X/+xe6Jhvs+ArF3+oW62W50ZS1HJ2GePFTshfEW
 x9IBVUWrhUha+wIe5Kx27wkHgqGp9+qjGPxeJecxZKG5QgVhP3mobv1mduHc2lJ3CXFl06AzGoc
 Jlr1MpcS/rvxCOmYeQFujRsTTZb1Mhh6dH+iD8yX/G6ZOOmSCXJx1J/ln8eBOWrexbP7JdHn6qM
 UaWQuizZgC9ybNZFA/s3Ajaec2esG2hhne14GPOHmgzTEJinRfnUiweGyxLdCd7riw/nWX5wY0Z
 LOw0qbmd/m39qoJuo9g==
X-Proofpoint-GUID: 4JS7IXtamTsDqBowSMAVnsv2Yr1KB4YA
X-Proofpoint-ORIG-GUID: 4JS7IXtamTsDqBowSMAVnsv2Yr1KB4YA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX3RoBT9o00gbu
 sx1ZAzofOq8gNGXEFjCfAIWtG/Sp6Rye59ZUlDB7ya2TVKqp9c1PNQs8RRuydyBWET78Jke0B4X
 8Rf3kTN8DniQjRuViPlnkLN2nZF8Jk0=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b5e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bz9ZealoQtrIp7hKp04A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

str_has_prefix() returns the prefix length on match and 0 on mismatch,
so the mistmatch case can't be told from "empty prefix matched an empty
string". For instance: the OF root node's name as returned by
fwnode_get_name() is "" and will return 0 for any name matched against
it and since len is 0 too, fwnode_name_eq() will return true.

Do what OF code already does in of_node_name_eq(): check if the length
of the expected name matches the length of the actual node name before
comparing it.

Fixes: a9c8c738066b ("device property: Add fwnode_name_eq()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 51109794d7275ddaf4571584d0e77d8573ebb475..a97575ff9199004b4f401f432aed6c95e40d0c25 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -700,7 +700,7 @@ bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 
 	len = strchrnul(node_name, '@') - node_name;
 
-	return str_has_prefix(node_name, name) == len;
+	return len == strlen(name) && !strncmp(node_name, name, len);
 }
 EXPORT_SYMBOL_GPL(fwnode_name_eq);
 

-- 
2.47.3

