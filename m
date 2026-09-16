Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456574F30FA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567175; cv=none; b=XW8/flGhE56leHnp2vNprPHL9WufZOOxO0BpUl2mW6EagVDrCpcvtl4PHle/3yit+7I1N9M7dBl5gYTOjxxbPrUuwGdGYn+YfxL7379JLv+VxxbJy5QkVj50wW4TWiaTPwtJZwX9uXLWxDyfQ3vd+oz+jyoetcR/HZGPYGEnjbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567175; c=relaxed/simple;
	bh=O4ATV4tEjSWiSuFTbC7ZkIp7EJmcpaPTV5+Vb/a1eTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgCL1hJAwEkZRQq/UrM8xJ4UMxMpMuPJJRA5VQa8dT2utIbSSm1C7/0pO/NTHn0RBPatU4/HhGn8RL9gmSucrWmo5WkAJQZjTypwsL1I329tQnAZajYaoQH62nUvSygtsL40hG0b4JENkktxTLAeL9o9za3FoJ0Ij33BmhNbgQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klNYYsHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdA4QNE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klNYYsHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdA4QNE5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYXm83636697
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/
	C6cM552A=; b=klNYYsHp6jt7v6zWrUeZ5M7Rvi1TR6d1oTwkBnhQpBoh4V/KQdW
	S88EEwiVa0SI6LA1cFbA+dy3iLlU58HO05M/9I8ny+j7vtfaXFUpEMe++G8D+dsv
	zpEsJ07bUWNS06fny0vRUuD5xddKZ+S2/esoO/CfZnBg8pYkw3cal4v3nI8gfMCc
	INM9Y1vLT4+bh49Bh095DxixBbhVoci+W6kiZePC2Hv1gdERha5WsRfXNgpicIma
	32TTLGMzHTUYBi36jw1r7+AVR7d95nnSvYMVssbkCtCo+H5wrtWJxpWF8gX7KKzm
	GJseE0mcSwgQiRNzhkvjV5lKE6h4UQqql3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2sh8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd1631d291so66509115ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567170; x=1790171970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/C6cM552A=;
        b=HdA4QNE5CwKGKj9ATi6y1v34qUcffA1wjlsNIcAYXaHCEcmQ3NNgI2tuYEbRKNwVXl
         FL7zzYiQHI0e4CgYYaitPHN6lB5tl1OG3MJJiC/izVCNDq44E6kh4+eT8MFXAqU5K9h4
         5Gu/yv/fOiwJCD39m3MYM9yuGJTwNcYZ0QybnN7eJ72h/xTTCguk3clYGeQBRj+QPD+D
         VDXtLtlpVwvMXVz4lFW0y5HIcFtDD3JWR99MqU5UTqvSO+HLLE1lg5TfE/uUs2F4zGUA
         +WK2XEN8Dg/PMjhc6e4XrO8glhpzYdGml+ukuddO1KxQMwIqZI1yaR7CWGdZPLBV+SwE
         y3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567170; x=1790171970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/C6cM552A=;
        b=KSe0T2xowUnTuWkudnylyjb7iTr+Gx8TlK664w2j9dmeFPrNr+hb2zYpi4PxEftZ4r
         NTWsDm/kVFnDz9G5cA8OOoj8rdqLp+1vhji9xMpGrxzizgr9UOEw3NflnJFahFgl0DvC
         Pc+rGUzMeCilV1eptnZc76Dxx5ngaCh687UxsAUlgNFiEmUaZHHbTyRgwHKmJrSA0GQ1
         h8jE80c7/hg9Us+wXmOfJQ5Baz2S25FHuNC+BkDMiyENftHGT8dLrgccBFcTdKDnHPUO
         sx01kMVNWb24jIiqLB0rgXy1x8DY1KRkfBZXXaTtbWq1l3ck31d6WGXTeDSuWu2oth2g
         nCig==
X-Forwarded-Encrypted: i=1; AKwUvBx9e+93zBdEtEcYB14P7/UBcpWLP13FwyDMv6not9YQCwVbyVsUshtjEp9lL8Pl09cUjITe7bMEemnM/xs=@vger.kernel.org
X-Gm-Message-State: AFuF++nVpMD6edrEIZI0i7KjWL96EjX5ZyridOGIdMVYC5CJPWvvxbNl
	rTjfhDD2MFl8MhA8kznqeTdIMj/lKchJcnFbpFOg8ElrGeSFGe5R2JyYnrlBqr0BhF/8IC1isyz
	LImzH27gfrJTGFkENHMlkJ8SDjkl+i7T02X6FhfJnWgCT0aKGtU5rC9lIFVqKXl2WUvQ=
X-Gm-Gg: AYBFou30o4stA0SSPgxxvRH1O9dxdJqcgGWK4ygtNVYbII9lf2AP/mAYwYxcXwdwsLH
	4I4DXZoCJsxa1IsEQQ84as6/YTfhxxOoHasuwageGlKab2SnNqudgkKdKB4iU3E5217KzW6/SXi
	IJIdApWerEUASlKxQtrMmKNeTkRRPPNGl9fnP890H27OZFLB57vtNu7/Thvz45c7ow0hAU3zWrT
	XgUfxSrtdaKbS7c1AxlFkUmw5JVuDmrReY8EFTdqpj24XrYeMcqDF+ZYmXulNAyBp2wwKFIvMDI
	4VchS6K4fPQYrJAYn7SJtSHA00EdI8VaFtUMOMmAvX+sGb/e+GZjg9RbKF8saL5UVAaskiQ9PLf
	jgcDqyJXuFpR2VNdEq0NdOe6eYEpz7WfVFbIJlMy+f1GCoG1Ig4BGKLfDPk6V
X-Received: by 2002:a17:90a:501:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e25c2ba53mr2266368a91.25.1789567170138;
        Wed, 16 Sep 2026 06:59:30 -0700 (PDT)
X-Received: by 2002:a17:90a:501:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e25c2ba53mr2266305a91.25.1789567169662;
        Wed, 16 Sep 2026 06:59:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm6507940c88.9.2026.09.16.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:29 -0700 (PDT)
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
Subject: [PATCH v3 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Wed, 16 Sep 2026 21:59:16 +0800
Message-ID: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r3dOAIz9j7ziG5vZfyouduxFHv51YCkb
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaaa0c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: r3dOAIz9j7ziG5vZfyouduxFHv51YCkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfXwbS2Dm4pGiX+
 m/roCj8VQZBFf5gvIGbR3GjxsIgbmMQawdnBqh0bJy3uOgJjRn51jEZ2FqYJBkq9228Tf7Sy592
 6TBUGC66HyqLR1EBlgPCC+yic6WiIeL5ejo7EtVsx0oMU5ah3cu5RI9DLtAn/qmea7F+QQqSAsc
 ka+czQqUc/aH32h6B1ZAKc5zuaVIF8Qnk4Ki5m8Yq3vAbKlB7GuUsYEOSpmSxHhUr288xT4bAEu
 U5CbncmnEgPXGYlUVcwVQHyQd4Jq+aTEAfkfpgyr2zb4llyHA4DQq2Rgy60mu9EUFjEtx15amaG
 1Y1N0A9eWKG5szey3BG1flrXh9f/5fJTke1tP/RIW+e7VNnujvPlJLyDLYcstbjxQ0aZlFB1z5Y
 +Yuc3TjbI2i4fmhtbTavL0t0qaseuDaU910jTV9Rq+2rGuP5OsL13U3gnB5q3g/1X8o/K/720X/
 zU1cwIr+7xmVYITafig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfX+EJiorcmt3gY
 +hS3KvVTYWgqaPbRveyPoGeGiS89AhGsdfPQax265ooXUwdMHZvE65P7KXiIdfBeGzre4JV718Q
 hYfjzUVKiTwXJuyD/bPdCrfeDvX1itg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160188

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

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

