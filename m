Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806626;
	b=aOJizyharr7SAaiZZpyDj3g54cnSKgda3SmcIIA4AiviIqdK0IGO/5tZ3dWjG3QtXyll
	 XvCcnR0/E18ua3y7PFpMjK29NYHNq76QRgc1pHXMXAkkVIsNS61f4zFNjdtRyN91B3+bc
	 BhRYNdHFRPYsluyCMgfNWRwa+BmkYSKO2eU166uBfdWhGjUyam4nfQQZT4VCoyeT1KZ8V
	 5Ysr6r9R7jIFHXMh8Bj3FE43AMiFN35C1qlE8S1T+e+WKrwXv1odUnOA6syDfsHFbd+T8
	 kR+3AE6tA7dcQ+4dKmK76hI8DrbqsiQO3MoFHAA6zLaR8A8W6GYSwKK4nZtdGF/b7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
	b=pCiRp+/3H8aiKwvw8Af/yHEikHYsq0NLCF56DsuKXq90TxajTFkwPQxWGezaTtfghtm0
	 37/0U1EOvw4Em5OF3Xztn3b6rJBhvPjnTrLSIutC1Z97JeJWYwZwiFQZXcCX3fehcI2cD
	 w62xAKUIKUIFw+Q5fUZ95f5wIe2lYg/1pofwS215biuhQcF19rHPa52TW5aoV6HIvdtdz
	 +GK5rx7ardiU0IhZ3w7bPQV4wRO7GJDX8BtLShTcqNKN9rnEwn9+0fbALyNVDSbelbJK1
	 ytW9RvhlReY+lyMF3O7Oj36ixJ/x+BZv0YisxdM3zBQ2kJDvxgOjQC7eJ+WR/kfpPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=heTYJtwm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jKrSZ329;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A1606EEBB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357A1606EEBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=heTYJtwm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jKrSZ329
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtct1700396
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=; b=heTYJtwm/5DiNiwY
	G8SJwdU9hl5Qmd1VtPf3VXuJFQgU+snsccCgNN6Kn66PMZrBeOUQSOV/cSHbFQ0f
	K3KpWHi8mNIYbX0/lJLxYRSgG+AnivAg6FdHwN0SR6PAy22SNw+fKsMO+JJu2uLd
	1uuh42lOcA991KSL8DduSShy3BPNPV+27zxyuu1hau3r5flI6QgyI35FM7apgkai
	3XfzoiMJ4neOn5EOrZTUIryLIFRgYgkpWUT2hGI9Q+ssJbutOrw45HRO7esFq5eu
	mx4oUQyv/pw0tjQ5SndvtcFY6rvQGIJ99RsuWsahV73+1Y5kZQv4uMgP9dwCFeW2
	nTXt0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyh0va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:37:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so96017185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806623; x=1794411423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=jKrSZ329HO3YGTdgE40mXo1GcyS7g2SoB+tBCRVLZYtcbzw30SIWmPlsomQ5t1SAJJ
         WdoYm4aC+Owcm/vi/+p/FrxB6apzWfPbHatCUQyt1VrD1gzPweT7SU1h8ihofFHl1AOA
         gNopuxsW+SrTPe8yEepVcnfcYxEgy5IMBm5khzGlfR6OOarlPhapWPvNx4BMnlaS8yA+
         xejxYyfRsn0u96aWXa3BFZWqiqCFtanCnUf3wG2VfH08hGmKEEIoA1dOefbf8GC8sym2
         VfYMlLKz+83bfGwJA9ygGthTc3C2/WXiV+PR1+rS4muOSn136YKS/r/RUNfou52qWPNn
         9SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806623; x=1794411423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=sEjnhrnNgaBDOp/ubrHhYUo0v6D0YpAEQcTvmjZg/mDJf/uBRKHE9cmfB4sW/vD0iA
         5UrT23Pi9XCdYjfD1GAl4ygRyt9AV5zW2TELygFsHXLISbq+DMyg9OfpGY3V0hSSN+2Y
         4mBybhkBDQvs7tkX044DudgVYHbhcSjb6VdWsAhsVL98JDkzsBRYTTA7jFxePPyrBARd
         GSDLR1do1RlWw6COy1CBjA3vnzfpbFNqCA/adhcK+2ogm4x7RFuLI3deqe63d3tqgGLP
         tbQbTDs1sqJHy/yd/6DDFcbxt2hrvfh5CUqBowrWxgmz1Uwr4wXKKtEGDEM+z8gYuUCv
         aJfg==
X-Forwarded-Encrypted: i=1; AKwUvBzfEvY5PFDyIhEo+tvEno8Md9FhwyigfzqEMENkuL8jAsG50VDEY3JDlC0+aK+9jBl2StM5D68aYt8FyGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ilEQG3TMTkD/cuHbB3cULBGph7dVrDmwn+7AmW5Px5NoShBM
	qH+Cpd282py9aBc9RfFZFjWHqrQkHGG+mgjHtRA4wEA8G98VJrmQaELHOgkSON4XrsGcMcaX98J
	k1/8BZI0xcO8U4Y2R8JLYq1fBQ9c2r90XS+Bu+Uvt5uujlurBYtGrMtRXHI261W1Nr559Tjhk97
	o=
X-Gm-Gg: AYBFou1rjMP5H6p/cZp5IHPnohxYwt7DOmyZ2VHcB9t5hQVFOofXvpsLpGJtOEL2wmu
	N/Wxd4SO2SvJQy/L/zkpjJ/e3OAddj97Dz9ntfc5QqFQbbvpd+y8nvN0JO0F7lMLk5RkUj7wnNo
	GL0yQMf3x7M7xtPQ99smMgX4yEx5BGm68assbVIC0Hd9S6u6zazzISQ9Dxtb+9YOJ4ij6toPLL9
	54oPudgH//0EOtEHcA/EX7CVk41YlsV/ywGQv+0dsHXVrZnUtsxhT1ndSejJTlCzQN+L78yxBph
	e/DRml9XcJoyz97D+aiu1XtLv0d/kdJ7T9NairpBlEGvR+lxrkjaq4U8fed7zyiVhJmE8SGMpq2
	OVTT7fyZzxZYSShznR0xJl9CicNPa8qlhVELfNbWl5NEoI7Yb3Zy86vyZLtOT89GDMqcuIs4LS1
	cKVQ==
X-Received: by 2002:a05:620a:31a6:b0:93a:9ef5:d370 with SMTP id af79cd13be357-94421541a71mr2748314185a.1.1793806623453;
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:93a:9ef5:d370 with SMTP id af79cd13be357-94421541a71mr2748307185a.1.1793806622911;
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:56 +0100
Subject: [PATCH 1/5] gpiolib: don't overwrite the entire flags field in
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-1-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Ea3P80RXVixb4xgFgjxcRxf1vL0VxehPiBy
 7QS4KdUCb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGgAKCRAFnS7L/zaE
 w7geEACcF/NiCk/I0Re12FiNWQm4mEYvpGHxzcCsBNkeQ11ISgsK7tvi7x31dfjCEgHsR6vOMzB
 eCICUznDuwqFAj3Ggt4vzYtcH7F/xOwW2oti/OiMXZ6wE5GSHS81Tj25/JmytA4kDMyQKuizHUv
 hIEbVuci2bRmtfhI5qOC6E+ndYA28UXatc2kvjL2DHrteaFQZqd+tWD6XF0XBazY7WZYyXXuGVe
 1OXYUb/B01rYEUvTfsUh1CrYU+fKvPmHbw3rFu+Ms8rwwqG8yjdK0v78DTnhEgV9bHZwsbXMXAo
 sjwlT5EssyOFbD8qbiU8+566T4TqXpxiKlp6P4//ydzSrsmq3PKCmNWvxAoIdJxnyQvF6SX8V//
 PEt73I5bCmW1fIk6noX1/DzEAFQo2lXd24XvhaK7CzKhNIjbPIHrGIW3/z0v+ztyKrd1B58oOIc
 qjg5osqMmkC34AoQoUSxAZDjkxXzz2L7KLzGePos/9vVp3KK9gopVS7Doe36QoenYYS4JyvuBI0
 7XWdLqQosrUdVg99PyhLtiMA8HmUnXCafxInEZ39C/LVH/73rfeB34Dxe34WkIv3mXBumBwTIgI
 15MfsL8HLqa21UJwu9Ak8dsqZXnk/QDAx9O1Ns+ULkuiqglpPdqhkgbiXSKZeS/hMg3lSqEYP0b
 pKANiOu2dd64/ug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb5120 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i4ZC8ekb83Sdn_VXTnoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXzgzQdpOJ44Au
 TBM5UrXpjHNs+jaYE963mag0qWZi1R1ITE8DdhbmIj3qP5O9a4CwXNeUISg19ZCsR6Dk0qmXsxo
 NK+KDVqRQDCp4HUsYpF6uUTfS3WrIgVlezI4N6wDYj9J4dnyEWOAsxRIV/BKMA4M9zGg4B7g+hu
 tII72iWv7WAYSbEKWcG/xImAj1YPV4+FFL6nadwPqV/2eS/vJGk/Gw0jhUVwHIkpULy9txpco/1
 PsJvi4GOtQ6KMuLpA/FuBqXlx8zw+FlK7Aqe5l+s8379U91YQbwFZccNQgw6K6OxEV//UFyagCg
 x6EeHWlcK5CM6SldbAsRiPVjCDoN80bPg8d3uW1qpBguGaEn7Xc6+I+5KlrXjl9E7S5838VWpU+
 pseOQw7znhekpXeFCiMo4fHIFUmLgWr+xSjzrcEpCqauLrVdfureVjInPiHWOoQsn90GWu9rHkF
 ex0qexayh2yRZt8bGzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX0mqj+7bH5wlh
 G4sh0CZMqE58tXynmII8FGLqp0NVbhXptEMNyMNeMpUZ0xdFuuss6O0CxJLEJcirV1rZiTc8zVi
 MSWL04JWw5OWvi0NXRYk2pgkfnhBQJU=
X-Proofpoint-ORIG-GUID: cLWKQMXHL2BTEkXFsQKdzUFwPkwetHyo
X-Proofpoint-GUID: cLWKQMXHL2BTEkXFsQKdzUFwPkwetHyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

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

