Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688932;
	b=gseXMkNJta9nnk2VATBEs30/kfd3VszcjjGwF0mruN6FJDxisllKqMR+1JheaqXfE1eg
	 oRbQQzPCXiPpNXDTLpjcvzEBPcKoIOkV95jS10vUYjydamV+HnnznuR6HkvkqIvsD46bG
	 SE7SyrcyMWhCyl1bW5kzR+kBrwdtlZCIroHRYhDnwNtT+qX+/Y8IMxEk3GbdKRqCSqOi5
	 9Bqn581CPre/gVm6Dns1gw5TxhI6GEK1XJxtRlLXiaqWul8ap88xQ72EqgiBOYm5FSoXc
	 gsx5U17oAFswDWtUVROU8qnljBrSScW3zHHrNJNiJjJSfMVXhWIZi4DWdSUdT3CkPxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u3h1/X3+r8JGIu4ype+pHKZpociXhTpLMqQc+auwIMs=;
	b=RKdkoWOt3V0ktDBQdKVkhK9FY1Fer0NptNUiXkdeF7gFr5CuF7nrPCw8vKUWiH1e2xdh
	 Zjr3PaIsFeEzk4x0jqV4gpjZztktbMYQsndhYqeGztYXbDQ52mkLNnl9Gk3rPd+Ao/+/l
	 QdRISImGjInCG9vMFixUTob0istX55qp94YhYpfPMXuKW/mK/bC6xw1ooNUf5qx2Dfvkb
	 6O7w78wfJdGt/WVk6HnioPANfe+beHA0ftvZHjjQbDydrymUkp0GSYaR4jPrKNxikVoUV
	 k92Gp6K9lWL8Qn0cmH0aP8P+GAXYdC1HYYxfYwD9WDdzhhr4L9bUwBWAjuqaAPKPqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNqnkf3s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7oMpQxo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F04606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F04606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNqnkf3s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7oMpQxo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31ehxX1082965
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 06:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u3h1/X3+r8JGIu4ype+pHK
	ZpociXhTpLMqQc+auwIMs=; b=cNqnkf3saiq9E+SxtnmOxnu7Vj+sf+oeug6lg2
	7Kg1diOPs1x4DvAhFRS7dTTKoCRnQFQkvtUaS7kKVOwjBXOu+v3T03KzbjyrAvOA
	gvnD4qJxLKxds6sOZVNXDLZmJd7PcE/ZVXDAIzIHNLL5zOOUjRBDDErDKPrrx5bT
	y9P9nhzZUtonEi2ybWTz/S0hrGT/ulhwXFXPvWkdK+S6+6n0w3WznJvJg3Yq7Q5V
	Ibmn4I/eNETAbmtZJebvb4fWThVIq802STpR5bPnZU8AEYV3Gk6k1bRhndjiQm3/
	yEA8YZKEYaOYM9Pk/hbK8lC2NYtUblLq/UfN6aoNXDTdrQKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r2cw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:55:30 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5437a1d6688so1192289b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793688930; x=1794293730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3h1/X3+r8JGIu4ype+pHKZpociXhTpLMqQc+auwIMs=;
        b=f7oMpQxoDoTnc1yQzIiNfLG089InWguVfl+vZUJg0V25Zr7z+li1DGaUEIfnXnRlob
         A7Ywdj0+Px2zAyfgCTka/96WSl1WGZXiP0bfviP5VR3x6w7z7/7Py/jDerh8PGtr0xJX
         gHvMwHUT5V9KT+Va69vWeh+4aGdhnvH+TiA3c9DXLFmgR8d9cVGSYyCgCsAR6ZMyxVlu
         DQSWzmDALqOmEr6PNRDCDzWSwumA6rTUUjYFw+9ZfYsHJv/J4tifYralJZQuEq6C9DX8
         yOUdhKW3qCdhK5GA6vAOPwDKhnER9OnmSJ/AcOTyeN6yhvPsFPaDhhPjZwHAmkAsHobe
         8woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688930; x=1794293730;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u3h1/X3+r8JGIu4ype+pHKZpociXhTpLMqQc+auwIMs=;
        b=l9BPZaaKi6NNuR9EW18EvjZdWPpu9gkS/1Z9kqeGyE/cAdNoXJBSoIPFvVvrbnMf6D
         sGCLLITsF56Ln2KUQvZKKijhb/KBTNo7tLWZ3I+keqIzX1RSUxuuhV+gxfwFrcW8BQ9I
         yhbvpHxwkuI/ecW7v9MubuOmv/SK1G1jfJBPnxVyMiDPhDLFl5mkZdxVNFmVdaRoI3/i
         vdFFP3l/oEwN73ddJDAH8S8DX+2+yS3nRhZwuZI96fc16SYRO22CntSNfGgMPCTpdRsr
         PUiOkIiqdYUGn2mz1WFqIUWC8jQD3ZYdzoLhsGKuDIHp5jH9al4PUpwH9tc8LctrKKur
         DllA==
X-Forwarded-Encrypted: i=1; AKwUvBzwXnnIeyD4F8BwJcr8B2Q8QT6kXqWwyX5iSGYMZOoE/lQLU3+h+2TUxDWrNv1UpEIkKUHCmhRQsVlTBUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5MMaMB8BoqqNGelmDTW29pWYzJzee6PuxC0yZ0UT+b4rhQ/3t
	lNJC6vrUMaSQZv6iL/FfYKsTh08qv6nmDjy7PI/CEGXJg4o5B2gjD1QWawIYw2uN07EJXE+dKtz
	nZpv0wXy3ac/Yyv5siTPWcivmGv8nhSXKTeluz4rjwzQYooLfS1mIUnYDthFPFh8V5bs=
X-Gm-Gg: AYBFou2JWfsGmah4mer8LYy3/ib1dcDAMENgkue9gF2VfR7wNaL7nhyooO5CQjEZmCm
	5K6ptdY8KAV5evetMjUCRiCmfLa8jOvIa+yCHxakJZGqZd8G/RO5E/rtGakLLac72RRQvAMpbWX
	eIbp83NcGQONYNv2euZ85ngdHppXvuDwZ0w/zvXlL4yt81j2BYugax5H8UFQVSsusoYU9hyOa5U
	SBSMLGhjblrRrSFDkG886BHqC0eL2tkFtqbD44Kwzz1GcZN1+dRYryMTOpdpC/D1S4ti77kKgRw
	ZtnqmEv4QhT6f/klRflsG+xg+5MacduENXdhH2pxL9D8zFNmXNoniXTKkBXKB1EL8AMT7GSIH2k
	Tu8w5vkA1Uz5dLXBqfRyI9RnEm1K4j4tvHhw+J77KO2UGzFmJcLDqVJbaK1M6Zx1rWWgsxxOKhJ
	gzjUmDM9LAnURwokpQLxM=
X-Received: by 2002:a05:6808:308d:b0:4c0:c8ee:adb0 with SMTP id 5614622812f47-5640d654132mr14322798b6e.0.1793688929958;
        Mon, 02 Nov 2026 22:55:29 -0800 (PST)
X-Received: by 2002:a05:6808:308d:b0:4c0:c8ee:adb0 with SMTP id 5614622812f47-5640d654132mr14322789b6e.0.1793688929539;
        Mon, 02 Nov 2026 22:55:29 -0800 (PST)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe423fasm10305974b6e.16.2026.11.02.22.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:55:28 -0800 (PST)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Bluetooth: Fix Transport_Unit_Size and remove
 redundant NVMEM dependency
Date: Mon, 02 Nov 2026 22:55:19 -0800
Message-Id: <20261102-fix_kconf-v2-0-b4bd28de37b5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFeF6WoC/22NQQ6CMBBFr0JmbQmtBAZX3MMQA2WQqlDtANGQ3
 t2CWzeTvPyXNyswOUMMp2gFR4thY8cA6hCB7uvxSsK0gUElKpOJQtGZ9+Wu7diJtEXCPMWmKTo
 I/tNRGPfWufoxz82N9LQFNqM3PFn32Z8tcvP+dRcppMhUmiMWSh4zLC1z/Jrrh7bDEIcDlff+C
 wr5DiS7AAAA
X-Change-ID: 20261028-fix_kconf-4d8e8748bb9f
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>,
        Kiran K <kiran.k@intel.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: i6UJr9Vw85kVkHvnA3sRkhHhMtJRdG3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX1ByQIl7I271D
 dTt2WfO3l02S1BVoeMlLmZv5lR9xYrYHEehMw2kBt10SiFPH57ohi68GIjHBzIRWxv1PaC6xx/K
 Xjxy+Rf2+JXI7W7MCfQIylCvyjDpnT/DtTZgZ0Uslc7BCR78J8XF/r41it0gDSr0mSxugezByPX
 qz5O5TZ1FjeRqeBOgZgKi5JC0Jz3Pf6Pnot97xQ5F8FItBSlyfPzdkMFuNiCahv25Hdu8ngc3eg
 v4iJ8oz6N1OthvUEv7WCHWdSCI8N34Bww6RB+BBJQYLx4bVw2Jo1I/sPaiRUq06ICZyyTCGiWre
 bmUyTLugk1osp3m8u8rv9rab94b1zj4AXi1bphP0/Q2S6tWHjvO13VPfX++pqq0dTRzLgsZE3qg
 PXdlw97jyQi8qIGnsJ6+bpfGDCYHE4qvIjZpqtvhzL+YySuua5AgiwHab4lQwn9xIFYg2uMgpWc
 KJqPCmV4X7VKUQZaM+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX/te+a1/5O7Jk
 yi5xFMoVqZwnqtBF0vzKWrXuGcydlDs5TicDvsU8Y30iDfFB2TEwjjsoJ0F9QUhDg/TBfJwa4t8
 i2m6wSWBsQ7JsAnhvRsY/fRHUJqOYXs=
X-Proofpoint-GUID: i6UJr9Vw85kVkHvnA3sRkhHhMtJRdG3k
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae98562 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1nq5aM8V5XYSDQTivPwA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030027

This series contains a very simple bug fix and a trivial cleanup.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v2:
- Add patch 1 to fix Transport_Unit_Size for HCI data path
- Patch 2: Reword commit message
- Link to v1: https://patch.msgid.link/20261028-fix_kconf-v1-1-624788921368@oss.qualcomm.com

---
Zijun Hu (2):
      Bluetooth: hci_conn: Fix SCO/eSCO Transport_Unit_Size for HCI data path
      Bluetooth: hci_uart: Remove redundant NVMEM dependency

 drivers/bluetooth/Kconfig |  1 -
 net/bluetooth/hci_conn.c  | 18 ++++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db
change-id: 20261028-fix_kconf-4d8e8748bb9f

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

