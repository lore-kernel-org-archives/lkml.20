Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B538331F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278065; cv=none; b=JrUF+xu50mdYMYIt3mZdsfW2mw5saInHRuwJAZEk/LEzMfBOgHN5fFcmSI9yvAMeLHg06/Tk3YVSb2I2GtooMrWrVfIqNmZBeW2XCxYMfq3s5FhhLMHGU796WZze4etp4DIlieK2AA4k2qutrIJC9CrMjpEUnTTubJ9gPs87MJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278065; c=relaxed/simple;
	bh=TFnhiszZZ5bK4CJmf443JA0CWYcIimJHjJa7vcRhbrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DFu4c1fmME6vt0ig1j16JM65BP/bRzLyZs37A4/E4FRJJn81CDpj7Dqvr5cJuX2ynUWGFS5lDOSBoxhHVtyYjlTKWOVupVTRmj0fMbN09mYcMKYPs+7unw+ErUZ5bSobAwkQOLFxFJFZu5nDuhxb4UWPQZioU6iML/ZnL7Frzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdGfH3iW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTXqOdxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdGfH3iW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTXqOdxy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eCxK061310
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hVXnSdCW5cjmKygQI5dCwG
	O11nmMU6X624qaoCSsgfw=; b=LdGfH3iWHw4B6q/joYJDlL+bB5wYXXP1dJeYud
	1Dtn+RjVFTjZzdqA4mg5n0lgtocHfADEnDKk7ZfmtOJMlXO0yWf8cc1GQVg/4zBe
	DZbuJ8AAcgorpNMUyqc9fblQSmZEKBR9e8EV+hZrbY77MyZqRQ/248ub/jiis5vL
	y5oQnpNwBF8HZ5XMyQ3wtnC6NE+O6AbYEyzmOw54qfhGfZcM+BTdY7pW/XkpD2lt
	wtAWmLDiXmlgpfKCV00ElsNCKgqBWz59yGSDO1mc92yk53hFvsWXgzkhdQ8BkD/2
	LnHUsqX7w6ryk69H0+GEZbltIYo64bYZF0x/ctUK2Hk34hvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj645a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:14:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so1517273a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278062; x=1791882862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hVXnSdCW5cjmKygQI5dCwGO11nmMU6X624qaoCSsgfw=;
        b=VTXqOdxy3sybz41ZSDXyGDhn6t4QA9n6/VSVZtb8Nca7URTx/EP9TjpA2wN8YAuaDt
         yalxmgtTxnLT6Qdhr/NWzQyw5BK+pe0owxNK/W8z8DKVETOQADlnbPupV0ecakpWlv4S
         eFhEWFRBLs7bd3iOYQvSgWMLK6fjWHtpwaWFPseCXiTXePdMRVQVV0M4EfdtELT6EyQa
         JwmjjvOMrOmG9LyIQTAOWXtQKtutFCyoMJhQAdIQXZiRH7d++25gyhJevgRYc2j6kYM1
         45yc7Owt2x9kPQpXSQmf7E2f1z7wxsE3Iz9YyINhgsiOYmP94DgtwSBtIoKTqtkRvs9u
         G3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278062; x=1791882862;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hVXnSdCW5cjmKygQI5dCwGO11nmMU6X624qaoCSsgfw=;
        b=QoCJ0Z8GaZWsqp+0Tq4HxphxYyJnXoBZ5BDR4RNNG9REaIIJ5a7oWsaro0aCFuE45r
         gP9O11S8v2mnRBdoA4KiNY+YsS2oOXYebiblkMQFIJV4J7MPPIhqsMh0TyAWcJlycG4w
         MP4IhslkT8RJuA6i9G6S33CylZnm89ks3byEwRwhQM0yr+ip01H7YVyHMm9hjmtNv/nX
         fb3sjdVeZiPl4jTmlKLL0i9sOTnRppn22kkBPTV5yIH/oqEmBqaVfdOvL8tnJYz9ZvQi
         PRLk3GtixKN+60gkymeSU61ROX+i6V/RlUtCuQt+TaeWWXMiX3SoA6QzKYdIElAzTpyT
         B22g==
X-Forwarded-Encrypted: i=1; AKwUvBxnj+n7aG7kxEkvZDShgmZd+akC7+GNhbGogCa8/9pn/5UWZZCpz0SEhkejmQHhcElzPzkkTiq4ZQBXc0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf4on7+qspO7RdzLGroaSs8iRP5EJZL4VQSO7ZvA9qALu5gFjN
	xD4Jx1b2FELf8Vep5GBSW86mGN1U87e/Ytr4Ye7OY9R1jFolOktA87vnY5zO9lL9ZYGGbFQB4c4
	M8nAC94w+cRVtm21rmTfkvANziNBv/L581BdBbMHUfynI9mXHH+yyMrDKwWOO0pD1glI=
X-Gm-Gg: AYBFou1xIY9Td0cPbdqYKFqyWOLVLDPHZBegdExOuCl4HqPCMPc2SIHBzuIND8J5FvO
	Ws/6LIlxEyZpHC3fyEOy6HSTUjM4uYmfDJQwFCUMlccWzzhRqlY5UZioDnDYZz+Ne5kMhfwy+BM
	v9Bbu7sNqeI3KgMvRpIcApf0hGSmXQoZXjMFE9wsDRYS7uFhNCN/e3mGTwT2i0yt+M/XTWuv+39
	NWY+hjtJq1wVlzMkHSsuXWJ8BTS1e4KNMpgNZ4F9+UOaU9Ck+2yaX7LymqE6kubSScQq1CVeL1G
	QxBdN4IlN0cFOrkvA8bTO7j32pfUd5xIe0a23EHElG8TDvaq65js3YUlnkTaG3dUxgQemDHePmf
	1F6+7uAeb7Ek2KS7dP/TOdw+z46jMBRqq2siZ
X-Received: by 2002:a17:90b:4c8b:b0:3a7:a42:c364 with SMTP id 98e67ed59e1d1-3a87379dcb3mr498314a91.51.1791278061691;
        Tue, 06 Oct 2026 02:14:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8b:b0:3a7:a42:c364 with SMTP id 98e67ed59e1d1-3a87379dcb3mr498301a91.51.1791278061261;
        Tue, 06 Oct 2026 02:14:21 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm10199342a91.3.2026.10.06.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:14:20 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH 0/2] mailbox: Remove redundant mbox_controller_unregister()
 on probe failure
Date: Tue, 06 Oct 2026 14:44:13 +0530
Message-Id: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOW7xGoC/yXMQQrCMBBA0auUWRtI06aCVxEJTWesI5rITCOF0
 rsbdfn+4m+gJEwKp2YDoTcr51TRHhqYbmOayTBWg7NuaK0dTOzNM+Y1YC7xQaEkoZl1IQlXXk3
 v0Ft/xG5ED/XxEqr59z9f/tYS7zQt3yns+wfDjE2rgQAAAA==
X-Change-ID: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791278058; l=614;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TFnhiszZZ5bK4CJmf443JA0CWYcIimJHjJa7vcRhbrc=;
 b=0TF8DvtvoJGd0sh91rb7AfJymT+19l7UvEpcHEvOcomyDswL1BQop60p25Mao6o/bYwSh45sw
 vnSn1I1NV9ZC0EZzUJ4VEECSB69EhB1B7YhP6haya/xTZgek9xWtWRH
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX3EL2b2bxb2tA
 fe4XEXOWDowJJx661ndQQbTEhoDGMM4sFBYGQEx9eeGOzwg4ypzdUcbFKsexjWxRUR5EJHGqlNN
 HgctumSEJOkQA0tNOabAvq64iWTtDr/nfu8bC+vTi2zPUk1beuHEZEIh7WJC7GDAJqfbq6kKOBI
 x8ObhOUu0x/6kcDUqGsp0ttDem9qTr/N9JDf19tvQXYabZVlfoF03Ds805nBVrFe5ANN/uUXB9Y
 qAgIzLYSkfhIBSpF3beDT4ME/XNXEo/Qpe3ozK+xVp0mlKzEsYPplzFdwJ2/GzvOnqYoHdCwQuZ
 XSD1B+v9IUuKQLbGmnD8aQ601aEpzP/fhs56k8ijahc88x+cOk9bg0KICe9Lj47rXwhPHe1a6ZY
 RP2zcjeDj2TmEUBfm1zlRz1ytIiCrsNhfottXmVY6zhMFm59uS7LuLvn00PAEa/Owd4gO4gDfb0
 NqgPRQPtqMQ34rieXMg==
X-Proofpoint-GUID: 5wvB99zIIJytWxXerON2EA29KLKp7ZFW
X-Proofpoint-ORIG-GUID: 5wvB99zIIJytWxXerON2EA29KLKp7ZFW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX40YmWj8LwOCY
 lDJ7SGlEZgDLqNe7dPYakTdh7YY79Ln8na4sTKAZOHp3Me90kv5dyTGtGDkzyBOVwmkbIrbb2Ea
 qUyLKYp3L69CTkZfIaXC0P18zOiEQKE=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac4bbee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WBG49SfUN3VnnY-3IEQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060036

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Anup Vishwakarma (2):
      mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure

 drivers/mailbox/arm_mhu_db.c | 8 +++-----
 drivers/mailbox/qcom-ipcc.c  | 2 --
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

