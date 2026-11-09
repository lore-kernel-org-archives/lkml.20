Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220033;
	b=B1UbVTiFxjHOReUN4JnZP+jlykHAjyY3apbyNTmkPVuY9/3XI3oLT1GbdM2q5QaiHT7R
	 Dcw4hSGhxcrlVvmqJEl8zbVwzHmIU7fsyidRrPsnCePSLUFQSLNTiiGoc2gxMBgcawjgJ
	 GHP0P0/FSdVegB7AeRLcansfme+91dVscH7b7dbp13VUOnG5b57VMbgfX/wXpBwSuf24G
	 aGI5Fos3LeWduCwkEjO94jdKL90nJJ7uFko37jlcLSZQW+e3RLpjBhFSyzH8Ym/DjrYJe
	 4w75EZXwH0x9oG1jrMSyBTWIJupnGVlGFUp5topG21R6UpMZ4Ekf+AIQzyxnOl8Pj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
	b=UFbhM4qcNF2D6j6qNRicyJwZzFXlzEwg85ann0ua3zTkus0puvVgbCl/P8dYnAdBdNYz
	 1e0VsuN0JvGUauhAJSwxmpOxBwYssh+4vfhFLyREPOvPnN5u3ta4RH0mZWbloajJU0wn9
	 pX8mbPXibyXbrptG4lUM3An3nVrgad2+izvQMAl5Vhpb3uH/HKJ9RSgYebqwiPPK6Djrk
	 eolg/FsRShSzD9nnIddc1K1Z8/TUrz+2ER8c7IXMgLCWeqDfR6Q2UXrOpQrF+4kRB/s3z
	 JEonZKQfeVr1g9RNcYh6BFw4tpEqzDlS69qVKG+l9QQZm1Vt8/1Lg1eYVvbQ9I+r6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hM+0fCt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GL8f6p9a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A01606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A01606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hM+0fCt1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GL8f6p9a
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5MB561972
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=; b=hM+0fCt1iLRTBy+j
	yhJ5u3hdjks4LptgGh2+Z/fzyHLsKt28e6ntCrUiC63u7qMKfLhZLouBug5PONFs
	mVj+hEnrrh3RAhmzXqSF2BxNPxlEMrgDMuIsBhRMjhmqz4sZX+3K0gpfa4D4zq8g
	aNoKXsWhhyQQ72sFweXKYuNz/p248Ly15A1VTrtoGjCbXZLr/WMI9txavIfSRv4e
	tAxU0kkVqxOkOzssiAJU7YuNJSBErYVgbahHdfNnBAuB5vap9KzPyRmdQkl0u1c5
	83ctLpLYOyITbq9djBaEA+5mYU5cO2OCAUyDPxl3uS6UT6ePZg8lZaK4d6IWHLjH
	d2uqcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdy4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:27:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso123173085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220031; x=1794824831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=GL8f6p9aeCyiz/aDGgDsUFc6cX8+s+QZljnod1gaJT8unI457QDojevA1bkV3IVyt/
         z0Tfv7MdXDcSDBGQj2n0UZ3ZnnnHSktA8//RHgvxSsoTDNaPOG0Uf9zLEV0OsFDaeLjW
         6ODTP7oyDSsVjHZh2GKcRzxzqpqtSGT0VC6EWwIJ6XbHbQ8hSdY+6M+GsohO0ZrwAVYb
         Aj9tJ/ceTRHZ7/7CKolbbwjitdiU8ocghrH9cMXpFjFymLxoHl1l5nJgnhtsAznfMWgm
         bJ/BGhvSWPo3e15/Nu9RVU1HvDSLfpePNQq9uhijRXtexy8hh4hHFkmY7prgbZDe7Fnl
         Gbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220031; x=1794824831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=G7wzUfN+L+AdVXkX9oUH1WAVelZNhW50zLFe1OTtaR78q83ZL1wsP3YMR/vKHq9JGE
         Ecw1EoEq77p56uHjzyqsTha/vXt2Fs2InnGsTxbV2mPtLcnUyuRhBszrhGWdBbRSegTP
         hHIPspjZBLdXgq9Fdlbm2Tv3Yy6Ro6ZjYkCv5xsq2pMGqg9aD+ID6/5qilEV5I13C/5x
         pu7AJqV/r64FQKUV84WQ4dNYZiUIgHExsPnxhPmJb/tfiGz0/CEqAHmSbAt9N6gLjBup
         lKE253jgFloDMEGnJpbWb1eA3bEyKyvjO2WTuV73VZAGNDalhY6+6xjYDI+pTzb5BQMr
         ADXw==
X-Forwarded-Encrypted: i=1; AL+hErE5BWZpJRqGV/oaysqij8aVegDZfr9VoVtFqi9HnvrvgiaFOe/CS+YAx6mzitDFZy+f2bqVauX/ofrZ0bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PoAbYIZGbj851FmK3PFIhywAGSGeq46jIF6FAaY6xOPWTgLYN
	UkrWHPDKtZeUkfDWPsbCmpPvD4IysansOBvyvJzvx51mvd7UHHXaBcj94Fjd/krWxeGLOE9Xw8y
	LmiiWmqa40C7iVtWzj8gnepV2aK4DWK83GStE1RAASPL7M6pGguzkc+4n+xNTvoMDxc5+vykgYb
	s=
X-Gm-Gg: AYBFou0w11xhp0e8dbTy49KQbt6z+pgDgLugXitHl0OhSa7vHEpydUVKfiTdyjsZKNp
	JAVOEohgm1bBIOp6DTU5JUcYz/mzz8YBd3m/K3ekUrYhK/qCXasUZ1Bt5Lr5Th98aRFzZRLc41d
	8Ql7eYr6SxDCPP8XDDZwnzrwccCrH4ThLEu9zWuMg2hukeOwknEwYpvI69UWYXV7JIsSfpjfTzf
	3kB6pujZPhsb7hk9tHqYcj9vPsAJJMCMmObzBeOAfBouya9JoxHijuadn1hD6mRa0cLXEtnyMp2
	r16TTAXsBINsDYiqKi+COipdO4m08H9DoIGSPx0V/7SpWlAA/r9swxk4jsWO50EBiYKRIbmijpU
	s7T+aFaPpN7ARc8jtgr1miyW6BTwb4gexveaJ0Sr8RqODae0Cpes6OnRY0ZTGWn06sN/44umOBQ
	j/5KGR44MZIqjtpMfUQBoqKUeWyO+Ks7a3/n//mVGjyEVaj4n2mazujS2GKgtrf10=
X-Received: by 2002:a05:620a:608b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-947842a980amr465610885a.66.1794220031438;
        Mon, 09 Nov 2026 02:27:11 -0800 (PST)
X-Received: by 2002:a05:620a:608b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-947842a980amr465609285a.66.1794220030985;
        Mon, 09 Nov 2026 02:27:10 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:05 +0100
Subject: [PATCH v2 1/5] gpiolib: don't overwrite the entire flags field in
 gpiod_get_direction()
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-1-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+8v3qmfY3AHKzOT4m6VAF4oSiX3y/ZfBI6uqAwNRMe4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7M2isf6VFcrEpCq3kwNQysgIQFuY9WwBKF
 +Vjbwj/HqOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 w42yEACMyA0vNuDexn4cQUP3/PnKc7t3FlugzK4kjC1G3e2Plup1GNhK+5/SpDLx957RxOXOH3u
 TlWzdYnFzH11Yl4jD/5gYVJtLxlMyjo23dqxOCrv/zVWTk0B3BXvu9fqrBx6itDyIjsKWfHafcD
 Jt3SAqpInu0bmYl7AeTcS8DF2IIDzkCDeG224gyxkVZlAAraO5uKZ2NXXSgn08URO/33LyQk4Ke
 iIzsXBURYljQYU6n9Am8FcCH9qMiMpa5EwMGha1Gx3YDDgaBbnm8TdVcU65Olier170ZHGattCf
 i5d8pXvsc61hLrUoDe7/HvqsTr7OC+tOHPzJyl1HlI9/HQWgqUk+kgwlSdusLDWQeUKG74JJRMt
 smE9BrInj/GRrpk3Guf2U8p0nCHMiZGHfpdHQt+Nd4/DqV21BR2+ei+7qVxgDxzy6av9V8LO9hN
 4P9u/y3bKQc4PoWmbgzIvQuA8SxNrXoORuomVyEaxROt3AuYierN8TYOWZDNOZPWCcdjY36ymFi
 1C90YbZ30hEbQ6jvKovpTFRtwOkSvXLwbAOuRtzX/Qgo5bIhC2NaEnya/uMGUXr3CXHTT0P4LEw
 iULt5mX45sCH8av8RImupuMSkPcLhkyLMGUJQaj0gV+KTIYG90OAC7FcfBV622+OX08+biPN8ke
 NgCy7no8cZ2IwSQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: C0PYFavPEU_Ct7MP2hlpT0tFlYbXSLsU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX9xIEzadEWEQ3
 nR/DuEW7r3OG7IPSMS+93sSJZ/eVSfTn+KLA/NLfuOlMtB+kMVVkNad9c+wHz+hRZVeXhaUAzGI
 IwWwquzYkffKc7uyTo1KXKEYfRof3jibPdaZz2dj8DhE5DICTZj5B5znVX6w15MNaKuyv3UIn6B
 6DvW3+CEjYdXK46s/lr7T9NrdylZ/Yx2fT0Ujr4QbN6XeWCowYlMCQlF2f3BfO3s98Pu6gYsfmt
 1E0lb6Jo9eZH1NmXw7tSro8fkMsGYqMAAp1Ep+gVG+NBSGoTqdnbex13LYyAidroAtMufVzbUeh
 J3MyKiwMx0Fjv2O3g//9m9qHKRIHQVsIiKRyRnhXQ4hILgWrXBez3h4yraryQWS+wxZ9xNyG0Pj
 ukpneKhxvMyvlb3JNd4FJEbRXAanwxWKdLfz0kIj54AKxHI7clrTW6AcWFkCyVdBDfT2WRhCJRZ
 M8vMvDWONv6HBjuoQ5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfXwmmr7bcZaoCb
 gWky7X+F6/pi0Bqtzu+PFMmZFq2QEO5G2Pj0z5nO40vhc8nTIxqR+mkH+Fgnxnwyb6MZa1Wxl/4
 ea91+K4v56slQqHkuGXyG1EvYq1tYT8=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1a000 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i4ZC8ekb83Sdn_VXTnoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: C0PYFavPEU_Ct7MP2hlpT0tFlYbXSLsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

gpiod_get_direction() snapshots desc->flags with READ_ONCE(), updates
FLAG_IS_OUT in the local copy and writes the whole word back with
WRITE_ONCE(). Any bit that a concurrent user sets or clears atomically in
between - for instance: FLAG_USED_AS_IRQ from gpiochip_lock_as_irq() - is
silently lost.

Update FLAG_IS_OUT with a single atomic assign_bit() directly on
desc->flags. The earlier READ_ONCE() snapshot is only used for the
open-drain check and stays.

Cc: stable@vger.kernel.org
Fixes: 2559f2e09211 ("gpio: reinforce desc->flags handling")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -486,8 +486,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (ret > 0)
 		ret = 1;
 
-	assign_bit(GPIOD_FLAG_IS_OUT, &flags, !ret);
-	WRITE_ONCE(desc->flags, flags);
+	assign_bit(GPIOD_FLAG_IS_OUT, &desc->flags, !ret);
 
 	return ret;
 }

-- 
2.47.3

