Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749206;
	b=SY21WSlrD1FyIpYncOQ+XVi11PspNA4hF7ruYv8wk/F7W3IiBv3clwPP3i9Tr+XriBa/
	 vF+pdzMIyAif9g60OBl3LB9Y3n67ZuvKp3C6nLSYLDbG4ichkR9nagxXQBw7xnSKRsF1y
	 RwQQjeTcVlcb8lTVK8z6r4xmzobJLTmkzGNJMFepspefcrlnsGrQOXnMSbVa4mYtO6E9y
	 x6FAT8OF4gXuHEL6f6C73UwVKaf5xQM9x/wHDZfTfMYFGdIuAQEdLsGvboVR28u5ldfac
	 Gzjqdy31gbQSQExFWJ0VVgiLzCvb8wraVRs0KHg68D4eTzxhxsOpcPdBKs66KczQ7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
	b=UM1zjtutloJD417n1PB5LjJfcOyxeLLRzz7M42LjDLc3h52c9ryddcf7pnpX1uQAPTO7
	 1J4a6t6w3icCb3PhBemUp/Nm+6GzGwBx9nd9zZECXFuOKr5kEeAKV+IBRZwBffnCI60Iu
	 PsqK8Lsx2vQneGpzd4VC1C/VHJz/eggYTKqh2M0oZhOtlRUBbZpjFTyQnazpwYPmQaTv+
	 buFT25nwVV0DUVyg/FCYAVP6KuM+wBNOrE2Mm67EwR9KwQYqOdzHvHMXWLlKnmYREiZgB
	 HB9kH99rxfULe4YWQZUXTybtW2CrO0UoM33hlXf2r3JxIk8SKmRuPQU7lvUDkaeLVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0gcWcrH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK0ksp6J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CCE606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CCE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0gcWcrH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK0ksp6J
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9WQ2112143
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gBnG5sU+tJaFKPLImFYZEN
	IYfRQYVEBnIoFPUn9xwEc=; b=D0gcWcrHCr+nA9If+gl3dcqNMUZKqEMIuREqeo
	g59lqJN7htaqTGEAVxRIC89yIvHjf5zfO/OfZZDwlbrNSys8laCKTot63mzCn1XQ
	6sHAeB3LvdyjUi5uUGMs5qCLrtII7ZiWMCnYieRAS+V5//zyymMXaiMsnQ2H+hiM
	75yNfOYLatpmkTnmXedrNKGfP4+6iIlI/GYtOHJNMgnVA89a5XZqn5EAD4g05juE
	B0ivBhqXo8YchiMeB8d6aJxJwX2lSzZzHcPYE8Bg4FSM/MnepVEj+23N8GEapsau
	Zw6SYGwodhYAZ9K0ECzw5hlo+FkdWL7dAIxi3FvvzFbV+NiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykagud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:53:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so155956985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749205; x=1793354005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
        b=MK0ksp6JoL2ufkstH2tGy8XORYau38huBMBppAGeV2OPxwHpKo3ZdXsaEhGRckHecj
         DO7uvY9wDrDHpoHTa4XIn7tlPaZ3fVvIzG9i47+HlW53DCnRJKuSo8egkMnXNhQ6NZw/
         onNOVAhcViEJGgq852p85pC/caPFT70+wspqp8R48YvgzCytM7ecJOdTjta0ve/kGYrB
         wpxCfKhtegApnueL5ZXlxLqUPQGNzSJBXC/+7M3Iif13BKBe+b25GHxd2P5dvFh+dpS6
         5CEjp/u8gpPKEEob1mfy2vN9JSnLHCG73+V3uNhIpxfL4rSfVvmNNa5M4IyJ25yfeBA+
         Ohrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749205; x=1793354005;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
        b=s7hx/qRakCA6RRVWdmPYk4Md1sEKmAcmegcWImDRNiYLd0iO9l5FNiFDeV7wlrpfiy
         HkN9t77Pws4538DZVmQ9cr80RIOQlN03zjmV3MuQmo6UV5NBOFpe9nCUA8fHb76lEVfA
         RtgybS7c0UCTtu/9Dyq3z5/lgzoFTdoeO5izE9GTFVEM4Pt65df5lCj45ODaIeoA+UDU
         P6QJEYRUYd6r09QF3AN4UepE/fM7iXK/KgbmoxoD+1sEQs/AzckOyAL2qFfH09bgNcKk
         qfBOXWQrypZR9XgEEUNZfFFwF+OZ/s1fHCrZOdajHaqfSOGBVGf5UvAHqcNfGc6PolMB
         vYAw==
X-Gm-Message-State: AFq9FYKmM6V2YJzFHBZgP1W7B3q3waPReQ6nVD+5t2F/j9OGB9y0dVHM
	3jAIRDs7vzN7JrmMd3j09HI9Y8T5SdzFg433Om1NlrHv6hAlKFp9vL88oKH2ewlPYLusd+GK9U2
	DJQfoggYLt2zNnbIp6uI1cykT43m7p5hZsj03VyGtd6EOauL5lQ8cqqUqcKvulAukVHg=
X-Gm-Gg: AYBFou0Mf9b2dHQoRbSFxTPNQSyV9jvGv1qnBSM2yvjiwFnXEl7+gbvt0q6aB/OvHTq
	mdGiksGIhCW3uIayCNETLpdR55P/EeZFEh73ywKyytKhRCXB0CUOoNW404Xz2sqb5p0PMOGSXSA
	AS53akYw4KscalA3muHoapxQixbMOCEQd5k4VyLSH97eHzsycZS6fCTUq/5wrYeeWCAs/IHa6IS
	/M6U3LDbQcPbK9rK2t6TxnpLj+KzEbqGHeHlqk4ZOWL1hrycx+eVG7hn85mwoeuBI5vfxsYb8Ch
	MrUAbKuTK1QX3x3sk4Pxey1dV3l47LR8XYBrwe72b3KpoleNednOqHir2Une2WWV7HM55gwiwcr
	PgnZKIB/QOh2846WcD3zJrJFsoJMe
X-Received: by 2002:a05:620a:4443:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93f6f54b7bcmr304297285a.4.1792749204711;
        Fri, 23 Oct 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93f6f54b7bcmr304295885a.4.1792749204126;
        Fri, 23 Oct 2026 02:53:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm63057895e9.9.2026.10.23.02.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:53:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:53:16 +0200
Subject: [PATCH] gpio: kunit: add .kunitconfig
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
Message-Id: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIsu22oC/x3MQQqAIBBA0avErBPGEQq6SrQoG20INLQikO6et
 HyL/wtkTsIZhqZA4luyxFCh2wbsNgfPStZqIKROIxnlD4lqv4KcNgYnXpHBBQk1suuhZkdiJ8+
 /HKf3/QDWuB+hYgAAAA==
X-Change-ID: 20261023-gpio-kunitconfig-230b02010ef7
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zjxLTlDB1bmGq/ndSdl5co6qUjXdqFMK2uUuWfMZJlI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2y6PcJBrvhGVu47PchKoX03yZiusUOp1xM6p/
 bAIq3UYKxqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsujwAKCRAFnS7L/zaE
 w0jNEACdTCfQPbDGWrsB3vrhrkBKS9tiXuCZkr3mTXAjdkxAeBniW9conXif1JxPt5nukNYbSsU
 pAfFM4XePrwmcJ4H1+ov+qk9reWYF1B6TsFjtNiwSO6rXCy413n7dP2fogY3EJTT07EaexLJFy0
 aIPQslI6OX3LZIHIqutmsYZerR4AURKuAEUomlkQvaekU35pvQTb5rlq2cnio/RJa5n5dYhbpfc
 MNlE8dyzqAt7dj9dHvBiLBPRHwDwSELh1iqu4lkHOlflr+VaJbtGR1+QmwJ3Wb6VIAhwtijFIPS
 HYMq1NkvrJ8i/ntR3xbsuDBu4GHBOcViv/ZMygKijUzNXisbkrVFkzArL+lDH2rupcrc1dSsjTk
 wi3d7JQHh/sCuaJNywRdKvlUKHc4UTue4AI7DVvvAuFH+erVST0nCscvG7ASN4UUT5r6Fa74P74
 WEzffKcbQgSrMHwtKuGDyKxZRlWtaG9t8SJUmzciQAT2t8EhPEv3bMXnNwqblI4+O81AUqfkZPh
 MvL4/YTthWGk5UbW5wZUlMNxt6GuyL3UF7o0RKPlJ/PbFQyyC5rn7Fo49quPjOuU+2i75Dr/zl4
 HQ4u9YzYW3PWcHJo3yT6l7aI5htkkNA9xmAvxOC+8VucrZeclXzpndrmkHXDUYvo2CpDc3FJmoc
 +Pg8Oa4UY4wMV2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX08x4+PtW3Kab
 MpuKainfhaXMASEIZBOTr/YBOzrCaq17g18gkbAKPoOPjcHyHK6yjEh5cOrPbj90dWuZJZ7TxV1
 2dWGwqRi63HZQw9DY3tRm/o+gWtLWVVY3Ds82QnO/8OUbAXLMufP+usGwy2WsQB2TgTYik+ymeb
 wVl/RHcr8nGOYUe7ogcV/7HszNQlA1J9CI6zvUmfUXZKxHinMhBzg4M+gvzpt6M0obD35mjPVOq
 Lhx3Oq9gZUkE70FLmpr6h3arzsZQrcqS090i7gqbfv8oekl1wJ/tcK9jllsCRQ8W08PEPsmbo4F
 eyYF4TC8HaOqZa4wv5WgWyQ2LebY5B8PF3+S0rCdMOSKJXeIbZKuGcGi7zDcRoKoA3QPDio9nE5
 EaxZBxse4t2ITPFlARATmvNzh711gCP7E+k+0bZrjoaJN3sHr6X8KWBxPVY7buvSyT4A5EQUY17
 QgQBGX6sLjVdx/a4/uw==
X-Proofpoint-ORIG-GUID: niikph7yahM2H9xkPLdA87340Bz0HWHX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXylT6NmorXoyQ
 GrmKRjE4LBuJAp9QyTf6ZionPm7a6sUuJpTJMSLaD8txa37znvoqcYgrHmME2uKbZXYYB2U3B7q
 ijKMeivnn3yBchuWDdSIlWOEzfariRc=
X-Proofpoint-GUID: niikph7yahM2H9xkPLdA87340Bz0HWHX
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb2e95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NeeZg8exDCvkGIFbdGoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Add the Kconfig fragment allowing to run GPIO kunit tests with kunit.py.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/.kunitconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/.kunitconfig b/drivers/gpio/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..2855ce948b608425b121020478b506d9cb94b649
--- /dev/null
+++ b/drivers/gpio/.kunitconfig
@@ -0,0 +1,3 @@
+CONFIG_KUNIT=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_KUNIT=y

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-gpio-kunitconfig-230b02010ef7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

