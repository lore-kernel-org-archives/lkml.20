Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10813D9665
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031886; cv=none; b=TC27nnDUJ8wOR9AuT9hmGGg1MMv7UePg7D17bXWVu/L+bucpzeRXWRYFDz/0dQ1yTbtKCrSBJvvx+XDUrzXUQLMSv5Tuuvcn0wDyt7UTrNHOzXbji2+73SYLceINdqx/ZVqFwWoKcfgm3Yuj19wzS6ENsfC2sgTez9TbCK0P4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031886; c=relaxed/simple;
	bh=oMsTPVxD3adyYqXrZsEmwysubsy2RQPrnblfLqNinT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=avN7P2uqiZl/W8mqsSjwIzWDQGyyrUE4UJMyn83LFScqgrnjIiSc7608DijeqABoM3qbk0NFCqRFZZMrW1AjA9wcEW+C7VTpUcF9EozyO0gndmZ73XyB+cNI1tU5w2muDdaHMTb+jmvOuOR3rL8AT9YUx6fMXWGh7mmH532XhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcL+gMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwPUfKdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcL+gMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwPUfKdg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pk3G474849
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiG
	flj4Zs4k=; b=mcL+gMAEqYPl4aemhJWYDtTHCKbeNWmqxp7JRl+KojLCtxEZbW9
	w7IEfNqNK+QPt6I64B0Mdr7RLMnAVlj5FwoBTdUFvQD9dtSi8kz9AGsLJqijJ8wI
	buH53sKQEkkWgdLRrG+JfgMKpFMoRw1HSFfXjQM27LYLv7u2iYK2sJuKHJDGEY+a
	D84vEW6sYSGAjWR0BtLozQQWlC0pykonftxWR/eere2xWzbc4XiBgPdtdNkyL4Ma
	zq+DBqrGaHIaoEesBNWAIw/OTx2J1YVCT0p1DNoPCnydcvSL1egok2kDlCK5mBQI
	5UowIlzifqsTi3PZNkxxVCVBuHK7dr0/lNg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygu2vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so4953332a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031879; x=1789636679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=hwPUfKdghaB/oh4d9iaAtljQYaQvxxj0ZqQK6l3m9tTfD/P66wLIXY0fF8lG4cA2gz
         NAFZmOkfpII1luLLCbCCE4tmmGvOtpHESATN/27IHgH4hwDcI+RsTva/EGQ74bAUHD7L
         tZgSXbobwqnCuOkGrSS37B99TFShuz+nIUubjPGJ0jaxI2Xa4Ar5EtrDNddgnNd/mTEm
         Wf4nF38vNFfwTuLC9EoXnzdrsu9o67UzfJEY+z5d62AjfXa8WARSHiFGI7mjO2WpcBq9
         96NfFde5zqj6hnQai3iaTaNi5oRhozUFo1TjXjNsDwP+hNESCXSzzSBUye+muGiNxUf1
         KYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031879; x=1789636679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=ECBo0FHLs/ze+9IpjEw95df4XaB0QAL8mI1yowlrMYL/QLAG8a9YFhW00DFDyMaqPE
         NeLYDioi3PNMgvT2Gnr3gHy7Jrdvp24J6Xg/H87OQzHyaKWbMdNvIE5KQqt5C9rjJwor
         /ywsTAvWZ8IFGRvkJFo7TpL2mfrtd+JbFR9XVTJY+qspvY0RDATrvl0Ka3+4biVQ7jIB
         Om+oNjlxgvqE4V4IcgsDqt3g1E5/TT1xA7UQaVhqb6zL30Tx3SmR89iycBJW5UgMJnK5
         eLACGNVc8x70cS24i3yTPp5mn7Pak5/YCEhFOfGmOBqU0MXZ9XLDiGsq1jRgsrfnHtL7
         2Icw==
X-Forwarded-Encrypted: i=1; AKwUvBzg65zC7SWsxVCPZJNjsFrUl1lNWDn0ffVx5pn0kL87OejkemyfwOHgb80KHr3Wo2iAT8x8IHV5G20rWiM=@vger.kernel.org
X-Gm-Message-State: AFuF++lu4V/kVWR6JHu84CW0D/9sXpmmGJA5RjI2qY1jjx3om8gB+Hdv
	wiufHbOfAT3v+O/I7KtT/+wTHr5wOKIZKCWNAKCCLYqrfVPKVx/c3i7upf2R+HpU08ZIwb7YquZ
	MNVHs7aRv5Pffr0py5f09IehLgXxZFK4yOb5mIQfg7S93tBVck6pSgcLgz+yJytH99rs=
X-Gm-Gg: AYBFou31DxvmVcplhIV9iUws9f/zs3sDGqsDVBYUR/ELllXFYFWUdAmOGFa0lXRFYUK
	+NGhw9OXPpMAadR5AFyGI/IYOcesSfY2LJPpyhdjoSRV3M2sSkOxWtM2GvJu4uRkpleeYrIHqT3
	kmP60rx2NY/BZB4xq6TclY7mesCJTnJnzLUoxd825E0XkQFS6B6ww/iND7X00zZ6rLuhhcMgb8j
	xhiSV8EvW/DxHbd75bCH4tawhdNQdFzeGTihG/1SuuIFI8tWbqNNnUFr9cKavnawdYm5jiGVzl0
	Gaxa7e/G4xd2b0OLTvL86XAmcjiEa5BQfRcf0ps6nYIdpZUnQKOZy9UXeNBEjauw48VB13p5F2+
	Iv3EC0rsh/OGNopvahrLmmJIDLvEdhhRJx5mRYrtiMSzabbZDeyzsQQ90jffu
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858896eaf.54.1789031879221;
        Thu, 10 Sep 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858879eaf.54.1789031878830;
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Thu, 10 Sep 2026 17:17:49 +0800
Message-ID: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX9Eb4mFaopZLk
 64ovNKxHWSUr94B6oV66Fw+fEGfcMqb6eOgS07u3XKvQ8zhwjREZtHdF8JqzFN4SewE0gyIiN2N
 beEs2GxnTXzhfw3qGHSbjOxQtiLYVI8M44Fu4tDr31/RPx/Pij7g+piY1obgPlBIUKEuC/FZIdI
 ZRcXevBLqq5JzRk5tB2Qr1EGT1Z+oVS8j5G+l8as32RqGvsIrQZBy7NL+afjPsv6ZxdUDQkj0l8
 7REcRFNT9EPnfvR8pmMhocaFOjPzX7KeyktNjH+T6L/NRnV8HGYdad1Ct/G/Bh7Y0HX9GNm0UyR
 Qol2CDcIpV01S+oUkMkfD0ReNbY8RlRkZptrdLDkt0/9bQ8/CChSvAnmVXnXRue4ThzXiXMCxGm
 RQ4iwfJcXREvtRgbuL/T5Ux6xia/vD5IJ8jcKcdnqK5+amRi9H1WlpOV/jul/Z5G8kA8pAEDj8b
 zjDZS0LhO3NpGygMPqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX3qZOo7s+9Q0a
 8mrBGSepWSsNFN8AkwC4JiQdb1rOm0iFIoeE49frVzYGS2N931KW5i+ZBf9mvgtjv4zv0zv0cGY
 9bSttyDN+Hcti6jd/uQV/InubrLK7HE=
X-Proofpoint-ORIG-GUID: fihfZLHcGV3GoXEPghSp-SrjROFNII0I
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa275c8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: fihfZLHcGV3GoXEPghSp-SrjROFNII0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

