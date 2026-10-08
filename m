Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E6324B33
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493075; cv=none; b=stYE5AXOg1QdY01Gbzpv0ss0vtfkcFCavV4oFTDoAXb4ofinnXfXxx86ybXgqhd9PIzUmLbuY+Q6plVUy28Rdq4oAILs3K21eLfArDIsHbTGiOxnYdPMCWHW2GxST37L0BdtMR5rE+LXACMBA3DKnsDqREgxzuGwljeey5qBfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493075; c=relaxed/simple;
	bh=YFfejN3pPK2lqxOF8gW3f+hGbllAN4+RNCZYZ4DJu0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=crxk9/8nRUxLPtOy1c9cbG5mHHihAZ/OLsqz37Ie3epyUvkufNB0/ZfsvPqYWXzndDYOGxbTZxS/y8+/8du1Ahc4BNtlooCUx2wO7Vr7Da98MYeQc5xIOvHskTRByFIZpx+TTLtdf7ZE1TPBgy970brmXtLqOBeg0yyV/4UL81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZfugbJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9It/iof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZfugbJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9It/iof"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HVPqa2080317
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 20:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QpwO/m0KhGvObMoxsteotP
	MJW542QKupAQbqWpIrSUk=; b=FZfugbJZd2RsPKeiq6gJtsgVhcbv1cmvkaDXdE
	iuD00+dTv9ckmg56gEFrjV6LnJTa1sAT5XJdKY4vcZLcmqzhDs0XgLLF1wJUXhKs
	bzf54jwoExc1I5zG1IScKl9m1eAJ61H8F4ZbCU8L87D0eRLEKnRUXBfnL7JQmlxt
	hSgo4UqUOAEOnQgFrt6DsHgugiztGpINWu8vfm85FaJECn74VRYcZbXr+1M6N5S4
	lhX4ESzybe7sRs0or3fdnkY3wGSIpTc+fkF4jUHF2UJPic0xYWwiiL6fAwSbWeKc
	x6Clk8YO5gQewkSSAdEiaKWPrRNQw9xbtSYd9XnFrs1iBQ3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev58wmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:57:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7fffbe0so124007986d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493071; x=1792097871; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QpwO/m0KhGvObMoxsteotPMJW542QKupAQbqWpIrSUk=;
        b=H9It/iofZ2U1YagFB9t38lQOULjGOv1Fl1jnDUYdZRWFNzKFarPSuPljCw8LBnB8i/
         HdPjHMYvuWNh2bTcRzZQ7fUHlFnGYKdB+YMg7yZQpFx6gZR0/nJ1y3STPah1CUCsHud0
         qo46UY3kV49noJeJzbXyZaS70Hag3KhD8B8kdmfklL0z+c5rdYHutLzn59zGHaO3y/Zs
         MwLD8NgCWGThBf1qeL45OGshJqQr6kvJELE5EPxqTkJV3l2G56hOCkK/hzjyKRvggXxb
         yvP/ZIuGM9o2UcmTMmEH5BhKach2++xr9mPJsD8OwkYsycVVhRlViOfFYrCkQROfPy5Z
         ZNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493071; x=1792097871;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QpwO/m0KhGvObMoxsteotPMJW542QKupAQbqWpIrSUk=;
        b=zCxGbpoOlvovhYeNtY+rzsN4DZTPXl3srvin1mHUMMFrjoN2xkUmANBPgu/hpVIHfC
         nHVbjuHWHqtgtnaPD3m0EDtUcTTgtmZ8NEJm0VzlWttWOYDwKonBa5aAY+9TD5w4RSQe
         T4zezb0Auwe6yGat/4bc29eCkaS4jOpW4dSuAe1zWbbL+1tVi6AWLkaw+iBpxnQomqXu
         HdukIEoF/iWbUkHkUoM3Or6pITEK29yYMXZpGxj3JLjyugEKFvZF0llV8E6aICqVV3tR
         P7Q3sWiQFod2b6/p8RakpG7tvnYkBdKSdss6cOEbikDZO7Zb+eo8HwUd4ySw4ncuwNiu
         C2IA==
X-Gm-Message-State: AFq9FYKHhu79A6Z/gIxM+S8V8PJPY0vrzSjgni4UzW0AXCML03d48MUi
	WUe84SeKqbp5w68sKYIt1BE8g56fh2rMetV2tirl3AUn3HsrKvPiakC1CoZEpqB6Li22s9wbkYG
	grxpKaGwHon57CgzZjOaAhb9diLbxljTPkW3fFgE1AXPvJwPvApnWFkTbsmpBgvnv/e9Ns+qaRh
	Y=
X-Gm-Gg: AYBFou35ltOqJNGu8Cdr4+ei2stRjYkQjmX1jWIJhkqKi6JRzupuR2IrdNEXacTLvyC
	FC2ZmzgF+3RvarLeg5rrrHsZ6WJtDgLWL5v0wHDpofagKaFTM2/pxrAv7UL2BtPz8vwgBRV9A7Z
	nBKu2xfVHtdpdjNJFjUoQZkA2WKS1HsZMcQi6Z/xIoXDSuJKlMDC5VzOD548Alv4JNJg13rkLkL
	H3uAc2aN6xoYOZeYKTLue38e+ShZbIFjCZcDUUAd8jbSO+v/r/mlvIhz8EhfZuLZty/+yMxc+d6
	qyO3cLebAR9GzxAHxO9h3C45yVtK2/usIqDfBlZgNsDxKMxofmMKaLv4LIYMYzOC2MHy89AuMcb
	1brh8zwm+
X-Received: by 2002:a05:620a:d8e:b0:93e:4bbf:cc11 with SMTP id af79cd13be357-93e9b77d1f9mr1360538685a.30.1791493070778;
        Thu, 08 Oct 2026 13:57:50 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:93e:4bbf:cc11 with SMTP id af79cd13be357-93e9b77d1f9mr1360535085a.30.1791493070219;
        Thu, 08 Oct 2026 13:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm9388025e9.14.2026.10.08.13.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:57:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 23:57:45 +0300
Subject: [PATCH] MAINTAINERS: Add Abel as SPMI co-maintainer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-spmi-add-abel-maintainer-v1-1-bd1618a5d977@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMgDyGoC/yXMQQqDMBCF4avIrDuQBJTSq4iLZDLqlBolo6Ug3
 t1oF2/xLd6/g3IWVnhVO2T+isqcCuyjAhp9GhglFoMzrrHGPFGXSdDHiD7wBycvaS3jjBQcke0
 N1WSh3JfMvfzudNv9rVt4M61XD47jBJn+IKx8AAAA
X-Change-ID: 20261008-spmi-add-abel-maintainer-cb2cc1f0c5c1
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YFfejN3pPK2lqxOF8gW3f+hGbllAN4+RNCZYZ4DJu0s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqyAPLHP6PALC6asJlYIgw9MdUokeAbO6M48XsV
 LvQKNX5u+qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCasgDywAKCRAbX0TJAJUV
 Vnz/EADGHll9duxfg//bNlUvZuQ7WdP0w2A4HgXMPR3LjNMuh53mRqlXw4Qt5lIAVGUhfXMaTmN
 cNjM6eHkir8g8iW1w4xI2Z2UsHwnLz8iPXwVV4wwZIHwwoWlVCtkclgGBA9uJfmnWrKLGKy9B+m
 T19MbsMyjv8vulzDDZK9w2pgfb5u4Kma1cMMJE4mt5qn1wpFZnjAgw39D3ny0b4rWRWp2dkbVaE
 S1nRGFaY0mpS5Sco+yQQRbcyZBYpIcr1UAXqS4J6KW5gMyAHKH9AZnqmmSWElokJANfSqFEXH12
 HG+U3eeQt9p0QZpxdqFy/dfyZJAZe6Kd2XAB3MEu0WVNWYgOARu3cOLo1kE99WhBMWlLdvaicB/
 A+hI3Xf3wq8HoyWzM/dgnt6AMG4bW//8GezzoIyxSCBcQhAnhakbs3xeoC/T3hGK/AD7M1/m9Hi
 tO/PBEW4tgkPi8uRNaG4g2hLqOtK+nKNXy9u3+FtEBQYw/OyKoEa2M460lHGfY/t2ecPeLQ1fO1
 HHmy2MuAVdtX0GrVX9pZx7UWfHLACRmzW3e7rMu5jtYM1xZ5v57pKVAJjxKEan4s5Pg+SOwMTdA
 z+YggUtLv4VZwzW71vNb7agjoGWOr61XBg9ySadSlAeHkFt8BVLKMR0f2KFT1HFamh1vSN3gYPN
 b8IA8IZHY9Jm0FA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4MyBTYWx0ZWRfX7+sg2t7wdl3r
 aeAdPAjc/883kehdShh9oMPbJGMTwSP5xW9trmOhXnKVpPWsCOqLjYjV+HAU778ggg1DuB6JSR3
 XAdFnLKQ1mPnh2AMNXFf8rOazG5t1Co=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac803d0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=dCd9CTQ_ivkvytj29PsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: CuLLEEi6JSHqwh8ya5r2UQCSl7h04Qp8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4MyBTYWx0ZWRfX4YzAQcbvXK8z
 0g4nZpQ3paZKuhFdJ5kDCIE1cXjC6Ow/nx3SwutytFFNMGTWwKVLcFO7pNZP+4k/DdZbv8Sp2Tv
 A5fT0dmw1mHQQY7uJ+fYz1FkzG84irYXaKBU+nf5wpksiARfrdA89BgMqaj9noRegT0qy1v/hCJ
 8JlVY6WUTxU/Oq9Du6kaN1uQpLjpzR6NC4nizHbEz9QCAnx26xK0LcC5JzSSLt14FEReldGgvHo
 NmM5da0VuOH/u/VaZpbZFjTjJwRr/BOi6Xq1VR3wxcIpP7gr6fMRCTRIJ8EB34WK5DToOWM0IkD
 wqdBjkLtWv9IVCDvlnBagHXK4jhTSJErHrwhqlXDF3VvZCRGZM8uMMj+TRDyYuurxeLGryc48c+
 jk3aDawKo5iatZuifPk1uTmJSldQixrX75+KzPXxT6FQBlA6EyeWW77yaCsMkyX3XKbHfLWnIEz
 UZDjfedl/ici7/ypmpw==
X-Proofpoint-ORIG-GUID: CuLLEEi6JSHqwh8ya5r2UQCSl7h04Qp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080083

Add myself as a co-maintainer for the SPMI subsystem to help with
patch review and handling.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77bd64bae919..7d61fd1fb3bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26312,6 +26312,7 @@ F:	tools/spi/
 
 SPMI SUBSYSTEM
 M:	Stephen Boyd <sboyd@kernel.org>
+M:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-spmi-add-abel-maintainer-cb2cc1f0c5c1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

