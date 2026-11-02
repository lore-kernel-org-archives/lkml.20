Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614742;
	b=vzqiFj2jS7R7J9PWexMB5AWc+/hrNKnws+b7FoSg/gWorCAyyEJrDB1xlwHIg9xWbM/X
	 AFGyHMOCWxCT1FKzl9Z4KBD4YTJHml8HFmGuax0ZSZ2UKpOwF5tSULtctkl5FQ7nd6ik8
	 7VhyQBpswp1nGQHOAXnFoUTIzRkYf4WnnPPjqv58+4JM8pBMgF1gUQu5n9DKqw9XXFQP+
	 Z0G95GAQdnUHdwPn3NpxusXiMaRgAXvU/V3NnopZCwmJi8spbpRT6tXANw+NLi4sE1vKn
	 ynGHx+rvsLzUf3rRaYSx31MfEjdoQykH4RHglsghSwxb7yyE0geL/oykYDg6DS4bIQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1Vt43DCSeVYo1k0F1XN4acaVmkuXiv0D9QnNdLzA2mM=;
	b=KYNsdUMRMvKpVcEtRXz/2SgHdMFo2xF//WpojlI8pubxQJpIwYsF1jfzv6rQVDtVamj2
	 OJetM/dDAs6+buyvDqB1GpT0pl4zDTfptvhxN2yfnEdgT8muTDw6YQtXQ4BdILwPI0vYi
	 ntA6LruWFGz6e9SyXxfBud6qouoZ31eaaejey09nl7PnIBNS+datGj0sX36HZ+7RUIkH8
	 SHMkIHRB9spSpW4iatw7agrPEHt57A84giXNgVZWj5xb+w75Ph5cQSv3DVvEyfaqy3uY1
	 Lqxi+BGORb7N6zKA4dhKrDPhHXsm+dQ3onIZXsLHClLqulfhXoHgcleIMNz5OADWfMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lzjv8jBw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gSGUto88;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886C60A2623
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D886C60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lzjv8jBw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gSGUto88
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABkO4039379
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Vt43DCSeVYo1k0F1XN4ac
	aVmkuXiv0D9QnNdLzA2mM=; b=Lzjv8jBw6AvLJue/w0TVJp8isBTgyhR6pwwLtf
	0I66ouAYSvkLEQliJWJYvaURBBx9Fshd/CpxbT4Cw78NP49kwW9UMrlx6lCrUdTB
	f2hglaTasa424AKExX4WGpzdtfbu3T5MhJLZCcjT3xf1zIZ4MSm918KXKRfN+HK/
	hFD0p4JtrXb3evnis8D4REvL1f3sCgMtpnwvOAAt1b4Yoj3+UpbElujfvFwhtYY8
	GkYUn+qf8kL5tr3SNyAbA3eI3GoGvVvHuCQAbmBgCjLsK4zaMYmxiyHDeX28Ekhq
	9PpdCkZI/9GLa73sRsIPD9qpCpldenHCWM5nZ01sBsCLJ1yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18mad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:19:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so506465385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614740; x=1794219540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Vt43DCSeVYo1k0F1XN4acaVmkuXiv0D9QnNdLzA2mM=;
        b=gSGUto88OXLpKwj+iG3CQ0hz6w10bJyCnFvxJxJKuJTkbO+W04c1nccBSKJUT2dxHL
         xMuruvdlZQNmIdt3j/0GD4Z5K2MpiFdBTwFt3Y0mxsBLBA/pdERxhDZHF6Ja/AAxmPeH
         Sbt55aqwArvP+HVi0soX+xc4XIE6d0qssJx+9hiuHYV3bwDRGzHXLIn92Pfap5Hd91Em
         jjD591JbPeyxujSqPvp8GySey2veCTmpBZPC4dgjT5bz9mfYlLtWSDlzuXvWzzaQk7w3
         PYXgxArsQkpIA/4dawAVXLTMrd67AJX/hFt1wElNWkmSCa/6dTE6NmQjrUwiO1210UKj
         cMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614740; x=1794219540;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Vt43DCSeVYo1k0F1XN4acaVmkuXiv0D9QnNdLzA2mM=;
        b=KyjquKVA0BgxMGspmof2UW2zZ3Wi4LRolcZh1bIiOqmt9jNuJwiGs7kkSsWSSvz9QR
         vitkpGlPN2ebGps214G2aeJEnijNzXSMyJhrP4PgeiTF3RFpbHz/cUZgwfQrSuTzgARO
         lPT5kNluz7d3r1FpqvGdsYekMq1+EfbmVw0TkeMysVWry4f5KVBfnwYD86UV70RCS7Ah
         1DBIlkIhUxa9sd3f6QvzgBRhdLN0II534c7llsc3Bvt2AObAD1lJTlW0fPgUCdLNLg4a
         uo+gxVdkmzvf8XLdo4QcnVP0AwnlFyNlt1SsbZwI1lXTDEvHyTxX8gLc6RlfqaxRRCI7
         XNTw==
X-Forwarded-Encrypted: i=1; AKwUvBz/QwoBw15NCVbgSJx4YHljOHkzezkZozSjCbYLG6UgtksLp0lwjxzp3rIHa+hYAlD/pPR31bzAPoAAC0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcV0eYbQ7h9XPp2yBORh9SU7Ik3lUjanplhtkOVLBJa4duWPE2
	GX3BkzVPugpUiv+xO1jxgpyQd0St9IZaopZHJA8U/Z+3ZHqVdJ4OOkMzDpbHlBbG0uJ4a9+BdN4
	xeUzuRX1Ltp3j/yZtSURPzX/hNOiVGIB2W23HqaWo/HOOFX17mvmKe0ZaV3epqhpk+dlh/RGaaV
	o=
X-Gm-Gg: AYBFou17nUiPcd8oIqo8DrrlG+k6wtLqXTIeLdTcOjz/YbDR3kxRMuZM8U2mzydppnf
	3NLQ21ZNQOOETopwvYLZwWvss8Pn6SZMajr9QV7jy+4f5RJMmBQK8enFhRkg/jSxmcZ7fNiVHxQ
	GG0gYhhM0rvOM8tYkNwNeu9lffxzeWPHS8ThcfFBwV5ho6N26zZxSLAdB7raOSCEA+lH5I9vnia
	T/zn6/VLiz7qjYUww3gaT+ggbI1IqSDNbth/0WrI54tyWxh0jlCMZAhGnNgiOAIWZorpZsuRkq0
	WoZ07wDRxtmEKsJWdXY3v7pHSEcrNdDfcp90Bz07JvDhv41H+nI7vPmTxEBxKXlNkIjwfDSnYw0
	vzEY7L1630rgaXvgiJm5R9Exz8BvXk351I6Rs64+/gmA9gdg9Phm3m8INqNlHo6//8ZvWGgt+ZS
	Ex4Q==
X-Received: by 2002:a05:620a:4627:b0:93e:d364:c9fc with SMTP id af79cd13be357-94421585475mr1592523685a.5.1793614739942;
        Mon, 02 Nov 2026 02:18:59 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:93e:d364:c9fc with SMTP id af79cd13be357-94421585475mr1592521385a.5.1793614739545;
        Mon, 02 Nov 2026 02:18:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:18:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] firmware: qcom: scm: simplify code by using classes
Date: Mon, 02 Nov 2026 11:18:51 +0100
Message-Id: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAItj6GoC/4XNTQ7CIBAF4KsY1tLwT3HlPYwLpGCJtlhQoml6d
 2k3urBxM8mbvPlmBMlGbxPYbUYQbfbJh74Ett0A0+r+bKFvSgYEEYEkwnAwoYPJdNCExsLURt9
 foFHauZpxTmUDyuktWuefC3s4ltz6dA/xtXzJeN7+ATOGCCLiuLGIGMX1PqRUDQ99Le2uKgPMb
 iZfFl2zSLHYSUuBlFCYuxWLfiyF6IpFi1UTKh3VgjOLf1jTNL0B5TU8HlcBAAA=
X-Change-ID: 20260701-qcom-scm-code-shrink-c9aff845537d
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Go7jA9kl42GxgMx676uyHveZFs1QoF/4dhlPIKSZz5Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GOOK5DbnOLaCQ3tmKqHCLOCLXzG4YxB20xUo
 PfnplZDlymJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjjgAKCRAFnS7L/zaE
 wwh5D/46sOKNzPSJDZFTYjObYx0kgXlhG4t07JEnv277m7vBL6MqEx8ud8toTjykB3WfRMMad+w
 oasxJqgg+WF6R7s3q2gX4LU/U1dCj7fS0WVxkp3Q4KEdsEyZ9KH8qqh0RQloOnHL7i3WOil6x8b
 uXeVll+MvGOKRC87glkWazAaU/3onV5o5CIsZIrbV1wMdDNkziOBKQpkURdDpkFSXht0+8LIrvY
 kqBhZAlKKdv0SEc5fKjSsVQsRJKY5KmFO8+TsU6TpmdWXsSI7nJpn4c38EGCKmb6Uba0+Xjo626
 d2jase0ebM2T2vMtvxcizwrKklLwEBZx9bB9tS7e3ZPYYcaWNrd2Zp/XvwXkUycutxjdyofIo3K
 fbvK1Ns09zDb7JbX1Af/1aMv6z6451WrXr+mNWfSy3FEPE0b/b6kn8qfrZVkqK6S2P24vzxybGl
 XRkEX8sOjCfGNiEdp2iX1GynftmyEzYh6UZHMX0Z+aFQdeeoR2HAolsN7OAMZEAFr2VJ5TzaTCw
 IQbfKtX3PWvypf0Jh0hwpTlgUWXdzNXfI96IrGz/Urv4yWLE645wq+aVASIM/MtCsX7OsLv9tTs
 dV1KriIZgEeEmovfDqHD8fkROrGlj9Gz6gsEO3hMyhDNRnhKZzyf1a40pAfsYjACIHb1k+wwfRj
 xcEHeSxcRiQq0Dw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qpDgqinEf6-3FG_YfUIxnDmV0iNll_L-
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae86394 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5l7mOxLdhVSCUz1tciwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: qpDgqinEf6-3FG_YfUIxnDmV0iNll_L-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX55CcRtkJmSnE
 JuEcknc0isqjOSksnrk1/6VduJTGQq9D3xqj7Wkwba5WgV76LIIOfMHlacvVT882BWCERFdtFzI
 K98aKyqdk1v2EIsg9l9w0PNIXktV4L6skFiGtSm78AsiP3tgLsRJR+MLEVQHO2tUBjZ3C2+4o5Y
 pRTd5npvgqLYwzUvMEXrozHcOH+wcVA3io0hY/xtbpinPTIg0rsFfGrrZyD+dilNul1U+2rSsbm
 JqwG3KQwmf9SIxWWuEWv7EM3BKBz56UlxHAHt55AQHpXZM4Pea+v7KqN5kJWUNwqttmXFM/nEBM
 eVaU+6x9ygzIMB/ZxhkSnMyah7iSnI9q+tHOtP68CKtB6vFgbp9Ay4D7i3JnfqGAjkvocR0RuzV
 ZDdadULpEs88qXv+C716Gw9QOcn3F+xdCRE4JcJZtMBoqq+JF+MCL/JNmmCecLXmkrMaRd6qk0T
 y0HmD8PVRX037oPOGBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX22kMg54uYWUB
 oTW5PUul8Ac7D89Qn7ssCc1twtKU2lIWn9fbE5OpwRCBR/KtV0pf7rL4EHrBrj7bxePFeetRrSO
 vp7+QBT0RBEzpAZ0sIuzhSifM7NU5h8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

There's a pattern of enabling the clocks and/or setting the bandwith
limits before performing an SCM call and reverting the above after it's
node. In all places it's done unconditionally and can be simplified by
providing appropriate classes. There are also a few places where we can
use __free() for tzmem pointers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of v7.4-rc1, resolved conflicts with recent changes
- Link to v3: https://patch.msgid.link/20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com

Changes in v3:
- Change the naming for clk and bw guards to be more descriptive of
  their function
- Link to v2: https://patch.msgid.link/20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com

Changes in v2:
- Rabase on top of recent SCM driver changes which introduced conflicts
- Collect tags
- Link to v1: https://patch.msgid.link/20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      firmware: qcom: tzmem: guard against IS_ERR() in the cleanup handler
      firmware: qcom: scm: use __free(qcom_tzmem) to simplify cleanup
      firmware: qcom: scm: introduce qcom_scm_clk class for clock management
      firmware: qcom: scm: introduce qcom_scm_bw class for bandwidth management

 drivers/firmware/qcom/qcom_scm.c         | 193 ++++++++++++-------------------
 include/linux/firmware/qcom/qcom_tzmem.h |   2 +-
 2 files changed, 76 insertions(+), 119 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260701-qcom-scm-code-shrink-c9aff845537d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

