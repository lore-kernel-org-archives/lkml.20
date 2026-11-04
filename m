Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801057;
	b=kvbabjo0v8VwMcYEHE2HWVUHX/Hud6L2JERpEHPj42FQ2OJ+dU1RA6cnTaX86EGdlc3n
	 BOktc+3/jvmfmEVab4isdCpJUBvBx8rho+6WquXZ+WnppmBMg76wUE32Ek3xcRIv+OFd/
	 TALBfQUklg5ZhdhPH7IOC5N8fM+95IT4ysfD+PVRy7ror2I0RQncTyhxxP1xRBSewJqWF
	 bCkNV55ygq63QNEKcMjtEEK/Sc+LWCtn5R8iRbLlxSBPXjFcPUaNYMYWHX2vbpp9XH+Oz
	 xhoCm9zJ3M5DvOg2hW3HxenemhsS3zYnAF4ZzOs8G/uBm8NXdZ/pce9gjYXxxJYdnJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
	b=ayS1NwXrj1Az4+N4Vsd9ClM3YRAnhVGONGC+5Nt4nH88PUlKcptsyW2JU9Kud0XnOoNp
	 m1ELJuupjyLnxKkhwFDn2YBOn736nAfmO89gMttj2BTiiiyxohZJ8OjtMFG46cp5LxLHr
	 ZXcYfbdPVZwEnSeKOuDpLOTF9Wne3wGtGPyniD3zBA92P+l8sUrzexCOVa7c2MD5CkZB8
	 8oKgn78q2qsE3iLs8ug0t36y6iUca70sxuKIsxxQdtFQrPlZq2/8AhxLD03FNWyVa4LE9
	 9ffOHMntdOuUUUjNLRHQz8jbSRvOEq7BUGOIZ7A0Uk0kHMLuFgv+q9witshL11uvShA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJs4qf8C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15373606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15373606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJs4qf8C
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaFZR2729001
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=; b=hW7tXMvCQpuSSKtN
	ZFd63aatRREqxNb/XXFLE6kATLNEDiKcpvjMvAjmx39RMsGxDeRD5HsnP5epFx8i
	C7VX5AhR/CS7+Kz+Hc8bHQYjGtRDRzcKW0AJMtomtI04C6denBUTQlrW+cOE61g3
	wcFoo+1OtUxgc/Axpl6QascgzF2dWBsFgQCota6CxqKob/Xfr3m5lC3OG7Nzrq8X
	shy8CFc6gBQWyiQCU/8XeClybsI7Vc4YNFyP1eWoxBFkS7sfb7Abq7mUlfTd66lr
	j0MZJpxFrVVyvYsF5pOhzRxflj+eWAlkT4oLT0C/uLmh68Re2kCZr6Ma65mnPw4U
	ez8wLw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbpgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so565312e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801055; x=1794405855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=OJs4qf8C2UkhuuP7ZEbLVGpACKHKALOZhpMwx3Vyb1zRw2SkWVVIbzt7LfurMIJqb8
         IraYE5wPHd8K+DPdAAtovzrEoE53gLn7tWRSFrzITPewgAsV00P4wZCrTBiFNhAu99Cj
         IXM/0gWCVMSFie8fktM8l0pya1GHagLk4ktvx3G4eoqR8e/sXqbEtsy3rbWIkAPLYYjV
         8p++aQoITlIM+U/5mUiBLHIooBeBvvRyI8GfN81vFaCSQOYI9wEd1eOvQ1AoSxwl4ZDv
         TfRKsdDfNBDRmIFt4UhkeW+H5e7uCQ5A3pNmB9Xvw3w3A71UNc8E4fBroRw4002uPIe3
         3XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801055; x=1794405855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=ipc9i1JASqHvBIZb5OtbJv4nAIpcD9C0n+6ORrxi/VDKtqd3owLhj+C0H6kkmbNak1
         TamLCIXy/uxxWtbIJozHAYtN4gItsuwDpE2G1B2D/1Fhn/5UuLqjNIrI74L0EO6xmxOz
         ai0dAoOMQnlj9M7o/K1K8eVBspUT1Ki5+XfeoIkYPa8UYCTqcDdNYxhgGka47rNiJUBs
         9yCPInQkqy+bCejP0LOqmRf/BwdU1hY14OwUAq0Wp2KMLleCtFX7o/A/6kG0xUS/LNV8
         bAsP7frk7ppTynr47JQaAJAXwK4mJfyzBZV5IWIbTpOiIyJZganeZF2fyUh1mbqz3FHg
         fMFw==
X-Forwarded-Encrypted: i=1; AKwUvBxbxmS8MhbZHFk9W6lsXqWyddyJkJopkfttzXrqGJM1enqQDdHJtUj3Bco5DqC7HiaEE3sLexmJ83HeTPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9n5zOv965zJS3Ae+b9NLKyzhJdFkCw2bXxtP2UJpcPLeAxZ+q
	wRklziUiTFuBTJtPyNonX5KLIDFAzFL9z0CyM4tYbsUW00s0gDl5u7ziwZZuoWZ3l13czfYCIrc
	noyyvYhqVzSKur8VbBUQ7+/G1hFZqFGOqLQV/+Radb2uf5ERMb9mqPKCrzRzx2AcW11M=
X-Gm-Gg: AYBFou2RYsoO5SjQsLfNLfux/L2AQPKk8LRC4CRo9YPUTtuX0PTDgY7IA3w0+OdIQO3
	cx8jkKBZk1JIYrTuQFGuVhY/j4qVHYJ+Guwa+OU5rgBeMd3UOiIDVwEzi/ifCMSCl7mmrzK/YGQ
	1jCz6JmAfPaN19ryR1RJyXSyGxYF6edPJHVa2N2DoNPUtRqyFYMfUeLqkRfbO4EFfWt1uXcAlRX
	+Feyrx6ZZfhWNFrV8LcvDjARn3Rt+8w1CNA4WsjAw8WnE0k5Bj6ammP+QOde5wYGAOlXN40y+dU
	9iG+3PfQbEv8CjQawk4hq904ztMfAZgHCiGkdZ5XxVq5yKX2j8UjNS7IRw+i6FaoBOv3SOgSl40
	uyj0f7msodjMYmKwEYZYo6pErKaX5We45R6jIqh5pmwX1anWeE35fp6MbAyb56mk=
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305605e0c.15.1793801055019;
        Wed, 04 Nov 2026 06:04:15 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305566e0c.15.1793801054567;
        Wed, 04 Nov 2026 06:04:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:44 +0100
Subject: [PATCH 2/9] lib: string_helpers: implement a CLASS() for string
 arrays
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
Message-Id: <20261104-fwnode-for-each-prop-v1-2-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X4m+GBtBmyDIIU2ymTvn7JPXMmdv3wdDg2SwxtGCMic=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSySWtk1BlVtDvFLGvG8VThjJrWy5dSYUhX
 +WkF61XXdeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w6+4D/4j7k8c1zrVHvsP7FPnP0L/Otl5Fq+MKofbzA4D0w0BETcvM58YVvJIHn0rRzBRYjXgFv0
 9qXudM0FtJwygIzyfZIzLte56iIzSHDvMIEkS4RdkjvSfn/EImsCZvUHuLS1FwGEHAY/L8mjvAZ
 7qADB4uj85+JnI3rgvVNZO30GttbJaZv7hUd/IgsvP4X+WqtexFh+HDOGUoca8rX+2K2RRlXDmB
 xXan6FU77l2TRtc+/356EJklrHHYMCS/bcWARKNjk9scpRFZY4j1z5ihdJBNcXdo5hZQfPu7iC2
 /92H9utwbeeMTc7+9VMLVIp5BTnmA+3t5Uy9tm1H0qA678k2SpLmAjHjIqTDEnvJcuTMZZzhECm
 3zQbX1fOX28Kk82WsaTU5j4Q8h74/YWhmpbsNgmOKrVhOoeDPKs4PqPqb168OwbQBGQ2/8cnefn
 lmQ/Hk111jcr4umGsCttNdWUsG7GaK9fzEnkisIUJAzZz1DFKUL76R/H8Ldg3V/6YsMf6Sho37w
 VJp5EAu7XJcDdQ1cyN29EDRHxXg5953KclxYnuuRSHcuJPQ7qUgmfwG1Fp8I/T1hbw5meMS7Uul
 RdJgx9RGQanZK2xKrKQ7BjUaUOAUmSHM596KQlL7gscczn/73v0KSu8d/plig2FW1xjmIPHujHp
 MVDUJD3sOPzk3cA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb3b60 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 5BsmxmExEoBH-6dIAUiiprMfORfKAUsr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX9uH7HLXVIgl3
 lOMaSuNfta87bHfv8yhtHYThL7W82TC5Dm/8osAwjJOjx1dWZ3aBh3HHU1IIewZQNtxeGKxRsPM
 /6BO7IUdOmER9K6mVD3FnPEPVn8i3gs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+M89p6hM54e1
 OI5dxytqaumN7ldBg6uhv/p0Q9klhpjqzTwcM1UvdQIxY8ZpywHPU5O2xo0IriG6b6WW/qM1v/r
 mrUD9AFD2t1CysF8b10lOcACpAtFo/5uRwWTO1bqUS1QatrA05zcsgbdMEa1Ncw39yXsPDYEY+U
 qupDBhYukL8GE0TMV3OmvN4/wxfabDlifmWOIKVmB4u4ySyOIB3vCBQTifJOFeTBi8jLjEUidx3
 M6GYbemTQf4TbfcWKKVtOFKKUQO7W/HzGJ3G4pRIuFSgIqDyShs+4FM/tqHlJ6E6lbPzsTQg8Fg
 InGuSPICohhakHzEOPuPmPzrert/lOppFXlsVmFtk2z078RsgQshYr70bv5Zx+FACTWhFi57WZS
 36IO46wqjn7/0QJfVkT3+MvgyyL59So3mxlIsCLkwappOKX0I+o4ZYuepndLhG63Dnjt05TrFdF
 syTr+fZz9fo7GLw+6/g==
X-Proofpoint-GUID: 5BsmxmExEoBH-6dIAUiiprMfORfKAUsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..3122be1359a36272190264d1c3e4c84dce785e6e 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -119,6 +120,17 @@ char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+struct kstrarray {
+	char **array;
+	size_t size;
+};
+
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.size),
+	     ((struct kstrarray){ .array = array, .size = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

