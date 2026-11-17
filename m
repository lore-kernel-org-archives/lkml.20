Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923307;
	b=k50xVu1I4JvWyT6SXwUUTOxB2/ukPw/yvfKXr62vuMr0s315AFsqjIhfWIHhp3FEpRYw
	 MZyR9Ix/ohoLXLG8y0gKZOgnpNyyMj1GAI2QvfTJ2zpkVtiAVu84IEADfbWiP732/f6af
	 mzjBEumCTiH3GbuIKcB+3CCjAsoz9QYo68bWwOjaM4wp8wXxp/6eeFv19g1o8cz16ewPM
	 fHfPhBoJXNUVWK1YU2cqvOpIdDKQBcFhPBKKV83I9ZBDXMjFvUfHJY/neBnoIBbTSxUJa
	 XnpmhbJlcVXrrF5pm66Xrkczj3X4qk0rcHWyvR+ddhb0PmFw8T1srLlTT6VvyLIrJTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
	b=IsMv37cvh+pKbJPBgq2JDyQw3/UmTewUo05ofFY6ivPdCRLtO6a5c9AS88TUNKoEswc9
	 C80y16l33nc6mX3/I2AK15sj9/ZH1UMhxrxhqITONC85/1qJRSg0h0N2iKg7xtpIsELX5
	 gUEmcnh6nSsGtz4eTuvDe7OEq68FHh7aBDPz2v/WBLYNKgmF2hAncBcQgMg0jvghmPUiq
	 X9D+kqppOK50jAfAKb0vE+b2EHinSmGWQ7oC86wUFkFTSTie54x4ICPHQysuutWZc6mOh
	 LZJWkQCoEFOQmgtKGjOrzIZ/FSyhX05a7PQGbJEn/3etC8k3bZ6LaDeor/HP8uyegzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FA606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74FA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3wlA2096581
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GE31aG73uaCXMFbWUeiAs+
	bBtV2hTyeB/8Pr5Ulpk/s=; b=ny6+YOyOmQRpg7+p82AWNdoebYDreSTHBLzHH+
	XBmJ9FcOb5eDQrxxzbbDAcwzcfdKb//HdqTfFL0vCnh34KWzjPXj0sMfJwEPzCEU
	h1c1I0eSmILURb5sJHHQnTyvntY6fxCGndqPppdZh7u0TLgrGbTicCmORRo8RfbT
	TTtgtWSXiKyC8WMhevCBmBPhtLo9PqLUpQeeDlXoNSY8+wQEXmsrLa3NTEkGuZ5k
	P9YMSW/oEVoKK1swvVP6riwZj4DduOxfNEFSifLDAO0/kTV/uW9WIyQt1V6vZ5QW
	JUjpwNMDCdflNlp2S0oslQrXQW3Zq+QgmV/YskEB6AqxYohw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2tvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so2170959c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923305; x=1795528105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=GUbWOVkR793tbUqpeiHeEOsb8xPFuaDHP/X190SY5m+G+0QtRugJv0zcyIgADXK0Jx
         MhodeGUhgQaRiqcyhvoeGOQ3Q1BgeZD9JHo5OSODRJ4VqSSrfLhVQh24QWwSoE090K4Y
         /aRJ+gY9xMIFTI/LnQGeFtE838laA3qhz24FWfxQOhoIRf3oqCsRSmwOQ+jVZegNsiMc
         qqPHleRuzDXRLKE4/sXRCE6ulYH5jOewsBl/+Pq3WUuewf9H2icDxBnY++FD5qc39cNJ
         w1+6+/ZnV3UOx5SmU0bVfN8YRz5wcQ+gLiUDKr4NQP5mZQlJ+cLEh+0OdRuk2wbC4rBH
         IvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923305; x=1795528105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=IvVX2j4zQ87gezZyJUcez9AB/hd2u5DlWqpubpT2gWhUc2sQhf9MAwOUXF3xD/FgbD
         4uazhWsnVlID1cQZsLsOn68+oHTGxLwygaxPQLvxImazSgcaEUHoHVYc1NLMBywiUh2f
         rTad8XWFY6kCTON/Y7SnMRCXbDmS32m4b3eX0iVfg0WjOdALhkD74hJEgKgT/AMIE07P
         u9Y3UGjd2uoOocLHuMsMS/7m0GwY6F1JtTHKTgJ94hrKyO1bjhLBdAs+k4+99SHQd22L
         vMxArLrhsoRXXjn0fAEzhqb/k9EUKx2fscEe0PBvLlI9Y2W3wso9CAHHxS7brhoFJcw6
         NyHQ==
X-Forwarded-Encrypted: i=1; AL+hErEtklR6JVRvHd0AJW/1L3nl7fDBFqmsbTZqrrAA8+0OuZNdv7W/ZN3Nw+NF86yyCYBhDwMRECIh7rgA2DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/4PtN2ShrDAVBk7OUoDFdCHPLfAsuQOlCyDDkk2b0GbOJVc4/
	PJq4ff3wXaj2Bi8GWYx9h3XtedRuiXMDw+7sim45xGsstj15O05WygMJ0CyVDJfjq24R+7NZ2rw
	i9Di4UAjJ+IPhCSnkApJiKLDMXgkhUexklKCMC+2KyuEoojUKwtfCvzDV2j0BjNusako=
X-Gm-Gg: AYBFou26tHEp6UocaT8GFx51eXJ8Qi6fCWtzUS8En0kSqnScNxxCidhM+NUheVXiJ7H
	4KyJrqTbNMcYe9yW1vt6/E3WPHLk6AmVsL5dgxRb2YlmP+Ap6tUfnfX6c/RHqMJ7atRD/XQUvQ4
	9UlB8Sc9LXhtD+WKsrqR2viAL/NJQYN0PCGtSWziZnE30ItbtiP8EKvhIvhRbyNHelYOX7QM+w9
	hpFVwMq55nw+DIyOIIu4I+Z6V9ZENojr4LA8YRr5QFxkklJ20qtF+puZB/LAAhdedflo93kUzhT
	eNK7ZD5vMBoP1UTlxFzchcUYq4J57BeiN6Wz8bI8sb3uL3yIaetHZIVNNBo/5QuQrnwz3sxjocB
	k9l6RQ3/TXHUmya4B/qpJQkeEpKtyjecQ+kMRYuiq0VUB5KcZ3gN+l6zgX1fVNqfk6/xRJLIQAg
	vo5g==
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789296c88.26.1794923304686;
        Tue, 17 Nov 2026 05:48:24 -0800 (PST)
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789259c88.26.1794923303986;
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios support
Date: Tue, 17 Nov 2026 19:18:04 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABRb/GoC/x3MMQqAMAyF4atIZgOmYgWvIg6SxpqlSqsiiHc3O
 LzhH773QJGsUmCoHshyadEtWVBdAa9zioIarME1zhNRjycXReZow81oOubDDHJoxTmS4NsOTO9
 ZFr3/53F63w+ABvoYaQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: iq3yR2M15_ibnRJzGgGW6-LCGvWuHgzt
X-Proofpoint-ORIG-GUID: iq3yR2M15_ibnRJzGgGW6-LCGvWuHgzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX4HkcUI0Iusx+
 TrZlXoMIZ2ftETiRiBpEQrol+qcCBXm8BoaRR8fgyLyBvneghhPTsPDeOtcRMuaTolHPkj4dbN+
 KjP8v5+aR4bovKXFhImvdrv8HEn7rdJ36Etzv7RkRuGvWnYcRGXenEEOCl52iDzOnxQI10OlDMd
 Dwm6Ls3EqlMx4HuL6LYZqNGT8AVgMggATXr7N3VtRYVHfp7CO3pM6ghnCcJ/mFi3YZVz+YO7yZi
 2uhgXqtTv9D8BOmFtY5l4JxDovXANaI1oKIo120qiqgAO+wu99veqXOAoeDF8Ta7BC/CUBaXUMr
 Yaf32akAzYgq0eBd3110C+QBzLiUtsh8H7Y+Qf9NERqf76GOALcwW547H20QB7vl5IwWspUusUr
 XZ9nmVWB9ABdhxQgXPRC92YBbztidWAFsyO7DuSHCDd55uSa0RTrMYGMgMPsIJAxdrRFMnnPbwY
 soIHtRv8ahXOX/NwdEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX+35C4E5YVtD6
 Jx0a/IO4lcaO3GNLRBK3ajyGQtcne8zOLhA4P88BPTntwSHvt/omWp6ORK+EoypY4t77lIK7Zbl
 oWt7UDRdjLYRcehl+tzxzfb4kXUHeuc=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc5b29 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

