Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750459;
	b=oenoiY8fFsFv8lDy20oe3sEaPoesbhHPtqBYhmJ/ezTScu06Smls3tM56W8J7vm0uSV8
	 DdGSRAEMEPRdqAa8uobcVDxGFrHjrVJOJZyJeElfqWGkXBccgbPtK2Yl4pqKPsKABJBJn
	 PsvIyYpj9l+rAX3Z80iML8pdqqkc6TMGR7dey4KjkIWQJMcQzQvllBoeyMrVXGvPbnZQx
	 hZ4Z0VRCqRfRD1nQeiHggHWGrnoK6Biz46i95Y8+2n0Z3RJgX/RBoEPR5eSwTLRyIMeLl
	 zoaObYNd7CznzkepUXyyVncfrYN+fEYa8Wo8c6UAogs5OvQz3+Q5l/JLBYcJUaeVhuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
	b=sAbc1RTiPTuw4x6cReDJalxA0yl0Y0hTS/08CwIIagFdiZDWVsDuXJWx6ADs4IsTnMUL
	 ww12xe2o5eWwRJUXZzVO+FWs1S8GRcDFScKrJuZ422kf/OBaSZRGvMzik0meZJFfV0EPe
	 NNCc9Bt7m0YcdqqWZ8p2Nxw6AfBF0KHh7L1+F4d1eUNA0hgSEWwMslRS9Tg5y4xeEbuvq
	 EcS7QsbxDj6iFdhFeq1u551gDuMbx8xL1SxPTTGuNaf9n45A44soEHWS4++KVPSqYQk2S
	 h6LBb++0M9cdy0BMkF1SHwdRUuuXcaokXLFXikblqVgtbLM1EVP7slsYXbZ73WGPeSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFbGogt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdJzH6JG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C86606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C86606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFbGogt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdJzH6JG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYdV2509077
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=; b=JHFbGogt9pHGv2hZ
	WbvRokd2fj7sO7Tpxo6nI8vBrmI+dgMDTIFS+Mq67HZmkI3ua/b73cloGr9G2/YT
	llVKyOTOmlMfeQ47ddNrqZOBdtgpCLQC+H3Mcpl/1bv3JqcZgX5WJRvQCfJQ6e57
	ROpL2OHLZ7F3oTVrVZLJR2WR5dSzr4KQe6iESPeFNL7CccE8rRct3d8UjvaDcrU2
	SkCPdeymZWVT0cdMmgENUe0TfNblg/EdFBQuY8ohmYdrEtp48VeZNnPmavhj4P7R
	9hgxbGikth6itn3Vba0B6S2mCSTH3KxL/7TqsZJ45sKeXMZ4PUfo1a+oNjHGWRek
	aNlANg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykakxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so133294685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750457; x=1793355257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
        b=AdJzH6JGo9Ud+aAjIUdaHt6o12qX6O2/CXBxXeGwZIZfxEE98FuP2435hdrIoHOsyk
         uJCOXPY/Y6bgXBoCOGnLqbfVTMzJw2Kl7LTunZ9EZsGG1AF6tOS9MtDuz3HKgPbyh+rS
         /SF21C/i5Hka5W+loYlwt/8zQLCt6eUcrl2sX6DWkrQsm6sZMfV/a818pJWcliXwdzxM
         R15ZuwDTVfyom2atbj4GIxlb3ndh1iChOrLOfNvy/SJkTsb3qdruvS2XCMAmN1GPJr7e
         g6fPttz1LbIF6zrSNbn0qQSeo8xid9zXFwSZkKea5coZTimqOZJNxAJ7YTpQ2tsqx+HX
         ZLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750457; x=1793355257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
        b=ucQiJ9BCPpeLD7Qvt6srnMC40SFE24gDWCXSyU7gHS1KSqbgyWemKpIJ/IjiqdXwB0
         kgrH99G/Fkvky5WtyM3xFX2HxI9yCiBA1uNNb4APV0s/ccwgBvsY/AkvgeMyr7PcEMRg
         ekafU6kjCFqpgra93Toy3IS9lvFOAD6Z9VSlsHH4kOlAag+qRy+3s9JkPohxoVpAEZMS
         KRyXSEKkIw5+Z5pJAiCisYMBE6NZAdUW4YB10dfGLB7caTZ8yYR2M/E5AQOrsp5bCnHI
         aFTeXd43F8LNKVrRakuuavYzxbrRVzYyBR7sVFJzhT87oAsuiri3Is9S0Xx4EFzCpUQ0
         6Ohg==
X-Forwarded-Encrypted: i=1; AKwUvBwwB68NI8o2f/hISFSjphz5+zoEmGwWUIRPPyndofTI0hd/vm2fqMNmqQhjSqH7xN/L+TNFIC1eNHuPGjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB0ybbNqFV6KBkAnzWHx3b5Wf6sF8BGa8C+I9cXAADkLPzP+mQ
	k51ylEDePRpikIPho1rn2ThPDA3qQm5HV2/4dOPKpuyV3nkMarruCvYZxiQE6uh/dW3m6gBroA2
	Yu8M2UlPbaEjShgJrEPVsB2Zwv2k6TnWZEiaKYy5gSxO1bYOw5UwysDeq8z7yr8V2T/Q=
X-Gm-Gg: AYBFou2hQYmwtFcZ6gt6amQJ6qXlUc44/8EQAeYYkbdPi6FwlCu0xYjrSqLkMa9hZ7A
	ZCG+z/tfoSFddQAkaBFm7yNjeUu26PnkSNeBD74Jui3CERWA6HeyXaf64mhAmk2y9DYh5WgZzMB
	mEFy8iNKBpn3P7wUTd0pKhsWNncm2GRxDN8ThTkpPHL/wJ/VPDMGpTn5QV7zP44AQ5/Ww5rKn95
	6Z0KCn4nqviGotJbzE5PevhvFc+YKHzfNwY2RkcyiC5S7sx3rVw84DLSUDa2ZCv5zTx7dEL8aaA
	UxEZ2e9p0SqGU11HtO4MrzfFOOoNwEDZhJrOXX4mwxsU0j3kiQ4kABfqnkNZRnrEkzUqIei+blt
	r2fXb86vzr27K8gUI+xin/7jhdEt6
X-Received: by 2002:a05:620a:40c3:b0:93c:aff9:52c with SMTP id af79cd13be357-93f6f9b5740mr319046585a.60.1792750457415;
        Fri, 23 Oct 2026 03:14:17 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93c:aff9:52c with SMTP id af79cd13be357-93f6f9b5740mr319043185a.60.1792750456961;
        Fri, 23 Oct 2026 03:14:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:14:04 +0200
Subject: [PATCH v2 2/3] driver core: provide new device flag -
 DEV_FLAG_SWNODE_NOTIFIER
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
Message-Id: <20261023-swnode-dev-notify-balance-v2-2-948d920a79f6@oss.qualcomm.com>
References: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
In-Reply-To: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z5tLITIjUCn2/wxigJLqLXjNPdX0Bvyssm0baENgvAQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNzzS7a9efzMJqoSDafgOOwwGv0/WLtL+ni2
 mZcl/cr7naJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcwAKCRAFnS7L/zaE
 w1bJEACxsOujjz9kEdVwyqxkI+xeW0avr/QAZ1MVU84l+Qx7iwBUnDnWO249oRQspS9PHQfzkYq
 8nM5D/01xbF1UKk4aQnZYVv/NIh/ra0zfF+7CPuR6/uGmt+yVHrsbM/NyEpstQ8jxNJxVUi5Tpe
 kPw9YkVSMku9RUBOjCF0N77Lz0EKfrOFb0yLu4rmyhgzxfFGIBTmf33De961W7F30J4jeL4NcF8
 nA20MdOLSD7+x8brHleXbAnsGihBnmXCYYUt8uwHSye280wO7gwcnN6b7RZdgEnEorYx7iEJLVp
 fJufiJ6vb+LX+yfuSpG0tYZ0KGyyUyG8AzHvonITYsN0Y4UqOROkqfO4synwAy3Sv1rNMApcY5i
 rqoFU4TZkAiJPPsE0ZJFQ8MFilWd3eMhkVwsjtAk+U+vPsGP6vSFjix8QfbB1RCikSefj4CqxMU
 92m24sxx9nql3kQ9aat6KaOuHcq0QxPozU6Gfcg4ZkpGvszSOXi5Aew3zawTzpP/bb9UbxtMVXa
 DGahS4WDxJXUjy+OJLtCN9eVw3nuY7I84BbONyRyh1IEHYIgasXdhv7NsgCCJKXqsj05OUQo78q
 3hbUKP3OJqWljTk3pCtExtcwMMWBhJ/l2M6ONsBX4gpHti4RaKfagVOd3gpB+HbiuU/789pVEbe
 0hx55m6hAhM8sQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXxvSGptUbwdO/
 O8WhwJRyaF4jnKFb4ODD+U00WfeNt3y6yVzJNu2Xa+0Tn9vhBn4Up93mjtWCewAWwfA0nGxBl/7
 J75hNauZS3ORcIltPSCyX+9gJee/2PoLN6BhIcrrzaIr3HTEvPC8qgv53QkkEd60nB5KtKqb4fK
 sKZOXg4CNNwBe3yFd7GlnKuCnNJgJVwYNMIIPDnuKqSpWT8CIYzxXK5ErCrVglepAO6zoKjL5dy
 ttz9tTbFxyWY9h60MVe3L/mU00aTbnmQQEQnNPgI0lpv66Tzco5TMx28aNi7cu54S2nod8wIhGB
 i7ol12gq6ub0sSXN7q6UMvYCdE5L9T1ZBCzs5zFwlmV/0FUqnZnElTZhpMXx8+4CYTTzAH1X7uC
 zUs7prwPWgjghwQ7eYosRYcp49WMrrq45Qxz6qa5oEkfBfHWU/EyLQoOwelSRI8HlUn49wAw3v8
 kcRteOeNIxKw8mD73xA==
X-Proofpoint-ORIG-GUID: PdgUm5kkzAwx6fgfnu2I5DVGe-lyDvoa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX+lRc1XIkI0RN
 AxNenBLlSq0eBGQdKQ+OmEV9Z3odYsDhp1Xmu9bmkEW1QLf9QNY/2SFQ7gRa3cvT+kw1ar4aZvl
 +790LR0PhJQPJF2TT7Uv6wjlfe3Dlb0=
X-Proofpoint-GUID: PdgUm5kkzAwx6fgfnu2I5DVGe-lyDvoa
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb337a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pFYeoU0bCXH7zDU5Pl4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Extend the set of device flags with one that indicates to driver core
that this device was passed as argument to software_node_notify() and
took a reference to this device's software node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f31fd62dca9a89c1c9ad565b1cd673b71b740faf..6b082c638d451deef62a607095335e807b0841e2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -604,6 +604,10 @@ struct device_physical_location {
  *		ancestor device.
  * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
  * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
+ * @DEV_FLAG_SWNODE_NOTIFIED: Set if software_node_notify() was called for this
+ *		device and took a reference to the device's software node.
+ *		Indicates to software_node_notify_remove() that it should drop
+ *		the reference.
  * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
  */
 enum struct_device_flags {
@@ -617,6 +621,7 @@ enum struct_device_flags {
 	DEV_FLAG_OF_NODE_REUSED = 7,
 	DEV_FLAG_OFFLINE_DISABLED = 8,
 	DEV_FLAG_OFFLINE = 9,
+	DEV_FLAG_SWNODE_NOTIFIED = 10,
 
 	DEV_FLAG_COUNT
 };
@@ -838,6 +843,7 @@ __create_dev_flag_accessors(dma_coherent, DEV_FLAG_DMA_COHERENT);
 __create_dev_flag_accessors(of_node_reused, DEV_FLAG_OF_NODE_REUSED);
 __create_dev_flag_accessors(offline_disabled, DEV_FLAG_OFFLINE_DISABLED);
 __create_dev_flag_accessors(offline, DEV_FLAG_OFFLINE);
+__create_dev_flag_accessors(swnode_notified, DEV_FLAG_SWNODE_NOTIFIED);
 
 #undef __create_dev_flag_accessors
 

-- 
2.47.3

