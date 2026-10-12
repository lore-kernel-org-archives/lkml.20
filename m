Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D3148EC95
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815954; cv=none; b=ChX3CwFgOGk5Gzg5f9Zb/c69gybUN6mTONeBWExFRz/pn69xK4FZ1f46yTxr0Bhno+URxNdIEPx08U20oXrEzZz3E8NcBvfjLcQl/cTZD+NQtmYtyIJ9mv3EMlju2tRyWzrpRkoq66oAV+4SQPEvxvF+bLmvoOlXzFAZF1GTr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815954; c=relaxed/simple;
	bh=dCzNsc/UyHSNWyhMujVFFjX1xweeJKNf9QhyoZ11TZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fKBcpc0sWpPzVI9o8e8LrwF/7jT0KpYwZeUSDD4bNdt5ak58lXJR1JVgblCRQvCWjH12u/UIPV49uN01tq0fqZJrcfdb8kYpaUZatkg28mvEfckS6au4/UBsS9XsYk4ahRY/qhzOL5AmL1E74tLGoPikckAenzbaLK1FcXk3oyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2ArXta9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODU1H1Rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2ArXta9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODU1H1Rp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0QcU2088624
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cD5qIIrI3b7fIHsYT5GgI2
	tgrbyN/JfOOCDSMZMQJME=; b=h2ArXta9WZ1qE6jY6P5OJJJDkw7HbuHSHWul3B
	7nNRIkp8/p2cxBIn8HiliDKB9xNrjustzLdZjQ4GgDOFMhhp/gTzIGUuN/oBc382
	RPNcNKR5YEdMml5cusrrGz+bIKw4tkDULHIoLkgSIQQkPFK5CJ5CQwMebIf7YkOU
	EiuRqhG/BvH6ZyCMuMa7RBqEa4P/tNQlcGkLaN4RbF7FwkK6jFJ783L4UIIJwtv6
	tgDWfNeMzlRd2mtsCUTGPZzr+a/JBp0w9GQNlBditqsazTp27pdh03P3739NBJo9
	KVHGSQA1iJ/sEllJww772zzKN2fgJKoTGSzJbJi0rlg2WbJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2d6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso347022085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815952; x=1792420752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cD5qIIrI3b7fIHsYT5GgI2tgrbyN/JfOOCDSMZMQJME=;
        b=ODU1H1Rpkpocy1Rz5Ou6Jh0Vu4YlISoY/cA2MavAPoGErpo8zZYIkmXdMfY9Zb1rVu
         aq0VzTCMkH000e/q7hfzW90kewKVMMl4MHAUwQhXO8jM48BmzVkLJL84hw2ye7gru02u
         +L/YZJCD4Pbop3eejj0NIK7IeQpx7IgH7FUS0vbxWMPi9sojXt+KHtfwVsUcDg5hp7oN
         P+dYgjV8isbhb93aoXdR8oA/5T06PDDTtQdo48i04R0fkxDbKAh0jQmoZrz0pCSd4Q2E
         dwdlFsDd5mdZl9EXYe5TJ8PaOIOcZuWux3Y2cOdcTsuIjbfD3gdMBsc8zMfKs/te/may
         S9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815952; x=1792420752;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cD5qIIrI3b7fIHsYT5GgI2tgrbyN/JfOOCDSMZMQJME=;
        b=otTNxlwuCEsrmb9xRURR+w1RFzzUVgdIuk6x3Cn6Gj08JWB/H9U89sca1/VivNpZdL
         HdIghX7F9qLti3i7E+gj7MV79gsFeoeHq8ow+EDjWy0FkG69/b5X+Cj1q4vp+/svjNzR
         98y3CPdRsSMdeDdirB2rm4ayV1kGdOykb0vZn9sQIUuOmsclTa2Ygh2S2qktEmQj5HRe
         xNPj9YzxIXJPP5cJ3+LPT3EayP1aDS2ehNqRMlnxPyJ57JEYwgfUjHfpj1eu+//Fp7km
         zAGPhjHM53yNaEUDSve/Wc11ZvV7YRjCQqVVsGUFSP8APOJuX81X82MANCVfuZVGUWn/
         dbww==
X-Forwarded-Encrypted: i=1; AKwUvBwDxWU2aSHCIYX3oQE74Aq8jrnONKwMQkl4gtkm+2mnbKw/CRe44i02CLO4xxT6kWa/1m6L6H1vG5sHf+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlq1+4m9Dnw2waAH/2g7wh8qr6clEW4QdnSiE+bSgGSfZJ+4eG
	tBU5SvMYOLKXD/OxRZdw9/+epZ6bJl92d0Ru7CNX4qzUD2zkcjw5hEy4OZj6QkcrpBewti9M9Lw
	c/qO+rI1SNigU+7W1+ArR8sr6Fj/EC64chHazurZYicyh7r1vRklVc5qse4zu8dMyOgg=
X-Gm-Gg: AYBFou1/IL8CHQAchm1cQINDqSo9zOYaCsJP5MOlqE27rNvoFO/Esm7MsmggFyDybFq
	qM2U9hDk1WOV30OOq+eChH2BruJNvkwVDp8u/PearMNcIVZIaG5jdLTNnoBf4VJLvXg737u9WuB
	41PpAM9AiksFsiFPJtJCuzU73DYnHK8lYtmEy/hOu5kbX9E3mshEtIcV80d0OmYq61DnD4asW91
	LpAXTrfMzYs6uiSBxbcuJ/bbAcoetOOZtSjx8qbYFnwzc+Bqv8rcyy7sWRXmw48kEtP9Rl5GckZ
	6oadKdI9wlzUP64xSQbdSNmrqjUZipF/Tie3Qu7hSL7L9Br026qqpKstKKagbro6+9nMJQPhHON
	Q/F20ac0D3jRkYFNJOZdtbG/jcSc6
X-Received: by 2002:a05:620a:2993:b0:93e:5870:12c5 with SMTP id af79cd13be357-93ebd1ddbc6mr1562406385a.16.1791815951663;
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2993:b0:93e:5870:12c5 with SMTP id af79cd13be357-93ebd1ddbc6mr1562402685a.16.1791815951208;
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] gpio: kunit: add test cases for platform lookup
 tables
Date: Mon, 12 Oct 2026 16:38:56 +0200
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADxzGoC/4WNSQ6DMBAEv4LmnEE2i0M45R8RBwcMjFjGsQElQ
 vw9Dh/IpaVqqat38MaR8VBGOzizkSeeAySXCOpez51BagJDIhIlhZDYWWIc1pkWtKNecGQeVos
 qS7P8djVKtQWEsXWmpfcpflSBe/ILu8/5s8lf+1e5SRQo0meri6zOm0be2fv4teqx5mmKQ0B1H
 McX9LhNTMMAAAA=
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dCzNsc/UyHSNWyhMujVFFjX1xweeJKNf9QhyoZ11TZY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEE1P/mnZ8LiO1K5wf45pJAY5YSkBgeEYYa+
 Oo1n7evp4yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxBAAKCRAFnS7L/zaE
 wyPeD/9HAO8OqRtesmPrca+7zZxjY7p72crzoAsoICPz0i0MPbLNLt6Sg8t6OBnPHN8Do0Z/7SW
 3no+Eh7wV6v/pRkF3ZPGzHoPVx/81x4b1hfNYsvvSuS1XJGTXdgmitpRpuBIhI+XRBKHwXZrkvh
 A8TZX2mIDjbv/hjtThCCrpx2ISMcIs+st2qyCGxEZYWQCHkCo9LevTsGuxDco8pn9xQisO0W6fN
 aNN2IaXOavrjcZAyvOiivEZmWCYUn7TTnIwgGL0WmyV2DMbgPvgJNQGQiCphWYxPUYkmNCXJ6CO
 /jhQ1P9CnTHJ5Y4zOGOQUF5Upx/q5MG5m7McQFOrycXgfPQ7a+nDxKPbU4S3PxLJQJw/pt4tCrq
 p9NZBXulk0BnMtVBILMmNesVDgpDZvh4KeVME1FnLVThm1hdmcFqbrb6p6I4B/qBFWCSrOTMlyJ
 qaaQDmHnurZyae0hYT+2bxUgzaS4fBKycLE5LM+lkaeCHep043sEPUubdMzTwBZmKNaSjiUHwsg
 MlJyuAWYIHCJJuFGyxtiLQqeVjjqu43yBISW9LrvMUbgJnIxJFynh2E/J4ltyDq5dYvE8KRpjLZ
 JbYItwiZCY+fQ7hbgybfBw2QWc9N7upwLP2vDFgLmqH2DuC457r9FiC+RQvHmGT8Hhytg5NU8B5
 arAX08mhsiCU2hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accf110 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=aOpRayBpXG_u9rxlwAgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX7cJc1lx+Gork
 38PHOmrjDPPdK+xsH+DsvpkwxnTK+6kQvhYlxFu9Xqd6yo8E4HApvN6op3+Aj1eB9PndQVAEIAE
 0r2ua2+ZnuFOv1mtWFxWcbk4ZTEjoJnXzMl23AEfcspS4MFh5bN/2GY9aFCXVaw4Gu4agT11PCD
 UwsBDefRazYJuewQe5pFIPbVs9kHTkeasy4LULjs+fgHicepk5R/YX0xHj0DTzrlagvHHUuRr9Y
 7YNO71DZKR4qwn1mSrPT141CjM6A1iSvL5u0GJF2CpFkkjLe1DdlXCnZ6WYGbLaev4+jZ0PHLZT
 v+C32ewOvxLRvaLGNln8F+dzLgdeDopeaM/kzO9qM6ScThnLNP0uXL2mh7Rrqci86Kd2h4mszak
 DT8TPQo7OvwZoHwwzvZzcuk5xkU+XTUcpujYJbaGmKRGkG7xBtRvblX4IAjG5XJsWArz+B2MKYb
 3yYFHHo2pZbmACQqmcQ==
X-Proofpoint-ORIG-GUID: OHfs7ZOqnyqL9cRzgTAQZ6HHAYQWPZyi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX9XIIx6YvXvbj
 +uCpIDn9rkGTa8opUjIJgn3hzETdObWmjn98uwn0rPP5nmkJTB7GF/jgk9YfPSSZLn3a4SlU2bK
 G3CLRsWri6uMhhy7Qav+RU/PP5KxhMg=
X-Proofpoint-GUID: OHfs7ZOqnyqL9cRzgTAQZ6HHAYQWPZyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop unused variable from new test case
- Drop no longer unused define
- Fix one leftover variable renaming
- Pass correct flag to gpiod_get_index()
- Link to v1: https://patch.msgid.link/20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 233 ++++++++++++++++++++++++++++---------------
 1 file changed, 152 insertions(+), 81 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

