Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33340480357
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202916; cv=none; b=eUq61/ISyP0/zWBDaKngXW/rZS6wkQRSVIsDjHzIXZWXxjuZ218Jm3pgAvwbzxYU4rPEFNsXvkHTxz7oQDHT78sDV9XwBHQs1CX0vMk7cY8HLWpV4uK1C36gbT1StlODtKmuceosMOBG0uH68Ti4+E9lGDoDe6xmIV0sOtKPNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202916; c=relaxed/simple;
	bh=eDxLstZ3YgSwfZ0PeFuQrJ+uoiKZuKQRYECamWj3BTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erYLfui+ki6xTxTVXQ+zw7FVvvQKXgopFf96ix7LKPc17dPk8tyQv/q9xvm2O8G2kXpiv284m6eGWZQZlM3Qh2C5xtSP1P6Gx2ZT6jkk07jj71OMgYPwReY0WTmeZKb1Id9Loy0UYEjjCgiciecmb6KGxWw2S7AOYFncgRxmurI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLZzHG1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE2+0KfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLZzHG1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE2+0KfX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFRLs2366079
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=; b=dLZzHG1quqkM18Cp
	Y0SJ1SO13p7c+TaJjFR3d4zZnO6mtGsrmTx3cTsSNnO//WK1GvXjJvI0RQ7KUYW/
	mg6pJ+StKT/cJZVUQk4VbVPxmdIWHT+rLgZdEioCg4kkXjksdcFFT6Mlv7F/68j6
	tJG126ouUHo3yjoLtyjsTxe4uGCwnuhMCpHbIDBwINNcOH52eXJ8BxJ7wblVaFks
	Nxk9IB1PAxoaumJlHGGs4Hso6m3yNZcBiEkSeevF+YqLbgO4boXBf18erVasRD8s
	CXU0fARtLEYL7nev0e9K/J2hgqDPDOqSn5lhwfjM6azNS8r39AfiltPw3SIDn3JA
	/aia4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrcm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:21:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso330965385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202911; x=1791807711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=;
        b=bE2+0KfXlquQXVjWM2E0rMWCqUm7q2gDK4taw+Z1qugPPJQRtNj527gRyDjlA6kMrL
         7JNZ/KLgY2/3WxGyfj5eagaUl+2KXbAe4fqiXNoWneyUK5V865nJhCPxbizQTuIYOjCq
         e2mgf9rlOxjtQMnmHDxdiiFOA5RZrQBjMrVaViQ61Kn06anNPjb76UZNlQZH84n5SZTe
         nem6Z/9hq3LYut8Tf2LpT4q9XKAptm41Nu+KH/rOH9hUmTIiO8XP78+UdFcxSmcR7ccb
         uQxVna2vNW9AOO+32wTY28RLfLPEUO2lJkwlQ1lMsOjHpAoMEFgmSRe+hfhMyf9FV5vE
         vYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202911; x=1791807711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=;
        b=fwZrtmxXuddVNs4S+yBZZyn/76gQMa5g+2Q2SPYzGlLrvjDZeD/oLSXYEcR0d7i1w5
         ZCGkR0UhNwcbHa4tFw/QFV1OD2BeDAGzXWuU2ofaF0+hgDMR7mjSiBA+Yun41rIE0ru0
         yKQa6TgSU6Ayb30sBPGWboEyi5zbL/wSEVpQlN1aYlJp1bAjs4f/ZkRqUGKHHGbfdXUg
         5fcu7g2mZ/qiIyU9w2wIYriChjK2LLPix3jV4e9vUD3ArWqrbKdzuusYFuYgnvmtdDIx
         YOURptrO9XnrF4mu5c1ftbXCJfmE+d2tatSnzqJj+S3IgiNv4DEztD7BTAcSUTHPwJjg
         5FEg==
X-Forwarded-Encrypted: i=1; AKwUvBy67IU/962lfIxLugvKbsUUIprQ22dSkpdBFNbMcUMg6u1hMkixAvh21/knvT3r/6mGfjE3JEHRM1QxGgw=@vger.kernel.org
X-Gm-Message-State: AFuF++moK121/mzhVH7+9tImcmDeH2ClallcA9ZXpO3bAHvuwH1c+QaH
	jo10xRUlQHSB9HD8rqahmGDmDX57Im1+QM+U8Au6bnp0zhhw1bzNzE8V93Vr3qTlYMIc52qY0E5
	9NBOySyRL6PAsJskEL+2+cFDFHfFsMs+rBt3Fxr4zltIPqcMR/mUz67egn1mipMB9Soo=
X-Gm-Gg: AYBFou1KiOZo/hN61wSgxb7z3NammkxSSf5izsfQJsPr0n8GF0QXQZGCEkNec9iGLgw
	ZoBWs9p8dNaPY2O87jjnB4Qqf60v+//Rs2fzUs+6gfxmRHoXszC/ZM4rdMQ2f9PR+qko9dGBQ6C
	7KrMbbRMl+ZzwS9OBOnFqYzWQX09yJIKBiqt/czm1in3Wa6wrcwCCWFNyzdcg1VKK4zRgRR+UF7
	reskR8BKHh6NW3od4nizSnzc4lXNHkuR+oDvrGwDMR4DqhJae9FxM1Pm3juxRkWQimTVByz736y
	56VMCJsh3GcMrmEjXjULwnT+Xnw00v1W3hT04VVoDu45TTpZZXH/qWsTwuRVNc26l+fe8ecB1C5
	Id1JnzU7wkElvw9HA2fXabZdJqehvHMUeiZolKvV8sYqAP000iRx2Zxl7zyIJJ/U8vmDEuCc2hh
	GSuCR1sYOC/A8a+TCXllBC9EJFAtBQYyD0zs5uqdLy6IfY81lzCCbDFhsK4cSJ25hFoavt/w==
X-Received: by 2002:a05:620a:17a6:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93e50fe9ae6mr1314321085a.27.1791202911070;
        Mon, 05 Oct 2026 05:21:51 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93e50fe9ae6mr1314317685a.27.1791202910624;
        Mon, 05 Oct 2026 05:21:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:33 +0200
Subject: [PATCH v7 3/8] Bluetooth: hci_qca: Set 'bt_en_available' based on
 pwrseq power controllability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-3-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3965f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _2h68gdkPGLBapDr8fAwNXkiYqmjYgDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX4N5E3cLW943R
 WbFN/PXWfrtna2X1NdfQNP3EQGDPSDr6s4e6H/5D+QJKwOpP2nC0yjW9i44sTtilr8qVdiBl7xJ
 KJ0KQG2WRzYWlV1C4g+85fJ5846FfHCgHi0wV/y1ybAnESOs559F5TmFx4OHmXF+Xgn2FsMScyC
 KN/uuaNhzD/wuICTP2VMjfbiJBGrilQbnkom2mdM+DeV9NGMTXmefEzkkPXrUB5BFCvpjm3JJaO
 iGcajSfINVBDcz/mCTfPdIZ0x7SRctCtfV9mTn5IlvciXrZtbBiq3KXR4e/wHL6ogCmvWcvwIC/
 haR9khr82QbnYHK5ncrIGr7l2ZYnpwpixGJUxrkXqZ1rN8TTWMcZ5AAM8tKRTSP5IPapupCQUGQ
 l1YJ+XnrW/oUBtZQhUT5+F4ZtTrwNpu9qBlfWpszG1HkT5qjUNOuHGryvo+9rZGCEdD5KrcmK9R
 cGISZS0gTqnJ474verw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXyl2ObRcpz0z1
 cYCEP61uqfhDm2UbnpGC3QTPP6YIkC1mRwqXeusV1J+86v7iBz+1JvTw44slOmbqNJsYeI5C10W
 iUimMqc8chkLhmwPdqJ7AQd8U+QlJGI=
X-Proofpoint-ORIG-GUID: _2h68gdkPGLBapDr8fAwNXkiYqmjYgDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f53f95601693dcd8356b4b825776317061050f1b..20d8c5e890a8903a07c3e7e37d037c44d383e8df 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2557,7 +2557,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

