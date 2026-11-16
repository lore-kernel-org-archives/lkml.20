Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863223;
	b=pxqaBW6YKmlxqBGiadA7WadupgkiWdIwmDcWZ1JCTMQhsF2shmqJnCvXSOu5F6JPRhTZ
	 DLY1wdvA5MFJPh5Hl51NSptx2ii6dR0aN8rMjSBTWwotw+EaDS7QiQkaTU1/QX+CQYadk
	 001VcPwr5TiuNuRVHGN5k1hkRwsX5uOYJdoSOm3pJI7pNbMmsu3WnlOQaNZhP4+Zl9PjS
	 rmSfkM00lZZ4OO6ZKHiMxPeqjY+T3q6RBmy4MQdXhgMPZhM5E0qLQSc4QKM/nWYXaTy8c
	 YlaMYB8cXgqyIl/2v/84OSVmnWmL2PqJ82Y0fMoqP0jkGg0WPl0NbARvH6zwHRxraxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iVDxhts98VbGaLTKoWza7C2upNlIZZcfiRD3PUjGVr0=;
	b=11qulvXPtV4oyUaNjkdT6uXrs8QnLq8jyO0tOUHXQakkjPG74xtdnv3z/OJk+Tf0PrbW
	 4O3N/XsgOOXlF6h79lidXwyYFeLaQSpt/9WbzaH37CrP79DlCpI28dNIuWJMF8ILPVHMg
	 PjVjdnSIc7oJS6SKizypWcGNUQm6BOY5buzTKNUqB1turlgDLMnqS19tGiI8rlrly88IF
	 RZpv8DOUPMb+sO2a/bZG8G9yx27kC05CCvJmIPfu0nPXwQ6yjt2Ch3/CR2JsxfivyDkCd
	 AccnZSNoP7akLKK8ULAz/L43H/trSraJlVDQa+ZcwzRj4KFXuQ12k656qe7rLvPLPdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=FDMSQ0LD;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=WuUp1IoF;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0718C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=FDMSQ0LD;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=WuUp1IoF
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXRTL3458863
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=iVDxhts98VbGaLTKoWza7C2upN
	lIZZcfiRD3PUjGVr0=; b=FDMSQ0LD+Y5wvj8RLo0FKIv6XIDs9U1xDwiABFg9/q
	4aFQvqTOwNPTOi1aT1k0o45Jzur8I5BGwPKwE2ic2BUShev6ehKHtHszcYV/nstY
	8etSptv4/4nMKM3N2NrNWGwEM9dJHJP5LiXBeMzdRa42pKQcJDkTSPOa+v8ISqyr
	fGJae0M16fqbzkZwbaaG0sv1YG5hxOgch0rkoMccYsIEvVpdcg3gIr98IgbJiIkn
	ZZrxijk8MpN6KSHc01g/4YbdHGAHZMeX+dudY312n3sL7xVJNP+ymBnzscjuhf2Z
	hzbbNM5+ah3Al5LmhkUC/eaMFSpV2yQAYR28nggU5ITQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598aq04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:07:00 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so1186247485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794863220; x=1795468020; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iVDxhts98VbGaLTKoWza7C2upNlIZZcfiRD3PUjGVr0=;
        b=WuUp1IoFZ4DJXFoxyKkdms6iotlhbBuoEx8AHqsrdFlHm7I3TIN4pMTfdqw9ysldgz
         R9lJ1t+CC/IVy9/oNdfsAfabv4WXVN67Ypsq7xWBLQcCwb8l+PUGz3QG/IGWaCJgGDIn
         xcp9nYVg7hzqGJKeQDEh5sQ9/HBZNBrZs9zk9BqqmC95ymPb59Q0CCMXX+8VoPwSwbZe
         CeBh6cwjNqD3TpfzHiMtWACL1dwuaFQIjJ3I2ad+GK5kMdp+saZLhNGtV2Mx750ZEmCF
         bigMY3dS9UdZHeOsI/kAWoSmnrBXwzlVxhT4XSooYi/ze54/0Xhm7FBWL8dRY0coaG7w
         LqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863220; x=1795468020;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVDxhts98VbGaLTKoWza7C2upNlIZZcfiRD3PUjGVr0=;
        b=Dk+oN/meZXKpo0D/z7Rx0jeYsddUNI/W2616qipoCJ7y4PISLMlqBE+T7/Xk5KI5Pc
         7020cCZ3+xZ36EEJdFx+dxwc7VAc3Fv7D5YCxKOt5+dhJZzCgsJkBY+w74wOOq6LPXOi
         2StrrbnekHfTUCWZ85+TVlWLwV2rzoZ+6NWd/U3XW9JbQdigrc/UH/o/jmvdwBcVM+Mr
         VAIU0npK6GjgF6zpUNAEB53qUOHeM3yLXTCIRTU8e4Ri0/mkbUQs7Uce2noACN+bFen8
         b9/sI9d3fF/j6Rq7atM5OPduiq0MX1tU0LRp31jSIXREGY9sYwFETWSw2EVtrk4E3ctw
         MVqQ==
X-Forwarded-Encrypted: i=1; AL+hErHeXQJrNPlJ9hK1kj+2fgcT8suvZDaeWPY+S0W8W/+cCl4aFIAo7SHKnh+454bBeBHfLg3XCr7/hE8e4HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Be8uOzcWjdeuBbjii48dYX/uvbEfOPGjjwj0ptvCl8WaxAJyj
	DQ1qKvH1gtaA5jEZGsJpCTtzXcAU04BM78OhHYDTIrT4DHnU9FOowB7u2hraYTF31thxcylnBm+
	6po6qpNpwhX3cpFkLeEzYSvjvYcW2B99lX/aXrOApSwIk5vle7Zl7Cn8gRRWUvw==
X-Gm-Gg: AYBFou0Sa5FKxx35BKX/M6iqE8DLdtvSaynqj7R4WnROK4YNkXZm5HQtcuQUvENWJM+
	76I4SU9Z+PD3/fY0dChOW+v9FACQuaOIcKqOIqsT8kBvVPbLz/GYusBbSaar+mnS6ezXeS+7ucX
	qYLVDVE5vvGO5kWLP8LHbUVqe6fN3wKEIfJwncGhZTxO+kelXsZxVr/aH8CR2m/9gCkDdKEfqCR
	ugirYfS/EGrB6thWcTEmqHXskfAHUOy9c2O9efPCfMKFwngGbLYt40L/aVR0z2TzSoQriwLptm/
	gq+5D/2kTcsfITWQ2uupH3cMrbB+/LgCSMh38ateUwC/QAiZUfuZ3Rx7cKBven/zqGxAQe4WnsT
	YAXb8Tm3acWpwkTT0nsrsXMhmD5bVe1FtK5u6wVlP379RGzktMZ47ylteGMOnNYE9nX91HYpDtw
	K3MXanSJ4gAiXTb5XRMs+N
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr140905685a.73.1794863220253;
        Mon, 16 Nov 2026 13:07:00 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr140902885a.73.1794863219873;
        Mon, 16 Nov 2026 13:06:59 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949689e4e9bsm629661685a.17.2026.11.16.13.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:06:59 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/2] scsi: scsi_debug: fix zone reset with virtual_gb
 and DIX
Date: Mon, 16 Nov 2026 16:06:52 -0500
Message-Id: <20261116-scsi-debug-zone-reset-v2-0-83c8a9841f4c@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAGxw+2oC/3WNQQ6CMBBFr0K6dkzbgIIr72FY0HaAMUpNpyUq4
 e4CunX5kv/fmwRjIGRxyiYRcCQmPyygd5mwfTN0COQWFlrqg1KyArZM4NCkDt5+QAjIGEHlrS3
 Ko61cXojl+wjY0nPzXuovczJXtHGVrYueOPrw2sKjWne/hpJ/GqMCCbq0plJlbgpsztbf0t1Qs
 0eXRD3P8wf/B+EizwAAAA==
X-Change-ID: 20261109-scsi-debug-zone-reset-14fc587c9d45
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Douglas Gilbert <dgilbert@interlog.com>,
        Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794863218; l=1274;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=EVbVloU5JgoABmKS+qHnRkr8QO76vzr4B/4YSXIMxBU=;
 b=nSOnE73IYUXvryoiy8erkG4y7Ir0srTUWsASOWXfHQ44Je5KJZ4echUqVi0oeOV7ZgAIfxeYd
 dcLCTQgMFowD11DZL9B1t5jFPY6kCuXohBQ/LlGdk8FQ7IdP7UBlHRR
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: dup6_weQUh-Xzqs_savSnp43Qace80K0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MyBTYWx0ZWRfX7/EhbhjDqF4E
 hREbPpKTpy2DelI3g3BAPgtFzCBHsiFXDlS+EtBLVGgK2eqOPYYVqwqfIIPSo68LyPvkRsdG0NN
 pu6wf6f6dv1+5IzdvhtuzwGbnOD8NmPqv9Ows8MBLrFZq6UMio5M
X-Authority-Analysis: v=2.4 cv=aYD0Dhot c=1 sm=1 tr=0 ts=6afb7074 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=bC-a23v3AAAA:8 a=Ft1lhZKXRp7ab7J6uJ8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MyBTYWx0ZWRfX1J/cLWXpcOzF
 CIeTKAxc6ZjRRD6LUppJVVlpjqCVJiz2UtwZ2qv+WSV5eVAIZryZlmtW8CFRu+eDtihscb//grf
 rjIND1Z2rwhbMeg5Sg7EEuMERX2DnMdRvc23Gk2DxXNJ2kMq/cOJRF4/W+QTFkrGSc0lhkqPFOI
 5Vxm+6VczDVDkIEjq1DhvD4pgtHoLVFZObUwAeZ9HkTlERQ+B0WJ7LiNIFzDLnm2CAkht9LSMkF
 vHr94MXjY7YibqME1xZ1KTWkaAaKcEFi9tkFnjLeAtSUQiFFImNvlj4im3N/p/nlF59+/C2fO/x
 yFMqJmNPA7r4yl2e9ZVM+fwNIziB8Qw6c0C+0vlX3WoQwVp3QNI6O59/Qrh3k8A7MKWrBM8WZ0e
 cDOm9rx/2AMuDvo9Wc/oVmgnE6D76bnrChUcuA8+5KN+9UPD7pTosaJSVhqXgbGCgDWyMC+zaTd
 YGj+l+5REDJviCJihiA==
X-Proofpoint-GUID: dup6_weQUh-Xzqs_savSnp43Qace80K0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=10 lowpriorityscore=10 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160083

Resetting a written zone on scsi_debug zeroes the zone's blocks in the
store, but does so with a raw offset that doesn't wrap around the store
like writes do, and without resetting the blocks' protection
information. With virtual_gb set, resetting a zone that starts past the
end of the store oopses. With DIX enabled, a reset zone can't be read
back. The first patch makes the reset wrap around the end of the store
like writes do. The second resets the protection information of the
zeroed blocks.

The fixes were proposed by an LLM.

---
Changes in v2:
- Zero the at most two ranges with two memset() calls rather than a
  loop, per Damien
- Point the Fixes tags to 2d62253eb1b6, per Sashiko
- Link to v1: https://patch.msgid.link/20261110-scsi-debug-zone-reset-v1-0-28cb9184b5ea@columbia.edu

---
Tal Zussman (2):
      scsi: scsi_debug: wrap around the store when zeroing a reset zone
      scsi: scsi_debug: reset protection information on zone reset

 drivers/scsi/scsi_debug.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-scsi-debug-zone-reset-14fc587c9d45

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

