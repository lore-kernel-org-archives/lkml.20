Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972676;
	b=JFILGj/2Hd5vh5U4+SqJ5eIH+MidyMTVB7hmZyyG2kfRGq75qqwY4JUfuC0/xSRNvcEy
	 gPvmBE1Hh62/tRxOf5QiR9dYhR61q4+9Nv+qRCmoPHITU6eoyDcZM5z3TgB9ZmMEJNbkV
	 ocPepxWVt7HwxnxXvU+G1j/7y67FYzonVLAZuWua7jwgDFsGr9i3a1YJTU7q3NUalg01D
	 DSJ7Q4DeMqVt8f+u53bW5PgVMrrjZYr6AXkE40PReLWfKJMMsXfGBq9DJFJYTeTs78Wra
	 VQqM4j8Ve7Hpu6ArZIAEJXveTozzoK38m3H3nGgc6+EYrUsjJxiPFWeF1Hjr6PZc51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rZtFwhZNNp3I4CxFlYMx4Z+4Hq02VTYQrKNwwmgilIY=;
	b=nDQNZHM8NVqC5Ck89yBFI9uiNupaV/idYFW0qrU+y7VmBpxZ9yUkZ+zq5elcpMRM+ezd
	 idSCY6u86SZxJm8UGXrwJCvPVd2sJSjbNS/ztesyz1AW5rUUuixkzjsC0p26zvB6/ayq5
	 0zBiIljiRBcOw4lcdEUKmFyjKKi1aJ5W72qEHIDdYuhlNythR/p4/GQlWgUgusF7HW3zj
	 Di3SDn7VmF8Gxja9Ov44WTUHJrmfFVkBjRXWH0IGfGmuhj5WD/j8i1TzERqiW76ybWhgo
	 +5G8FFaJV9zuCL+5s9QV4XiaefKO7XDab326DA8zYz3JFEdfqVdgzWS6zs5W45JqHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5FbMcjH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InrJ6A09;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6652606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6652606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5FbMcjH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InrJ6A09
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJLQ2593305
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rZtFwhZNNp3I4CxFlYMx4Z
	+4Hq02VTYQrKNwwmgilIY=; b=C5FbMcjH2kUti17e9wxnO6sIoJgyejo1a4AZXQ
	jqoXcLwUtibclt7aRakhxjOs3mquXNjn6p4q65One1N1HPYx031cEIre5KceMAVD
	TlM16LtZF2OonQUtPqHN0KPVsx6FCtK9sX6CM2cFZwxQUWp+CO2pg8YhN8Bl6VDz
	cygD7D1VWTgS+qX07U2Bfux5ZoX2vWc1xp8B0ObqMZhCtSpavo3TneePhsNaEuok
	NNs3Oco+FLYZt9Sc03SH+TwxZaZLJvo30CHgHf2n1Mzck4IRhLvwo/OvlYoK0kdg
	B0LgWoi3XT5EMy/SMj23PxwSAKDYL+UKUOujg30bEfVmSHoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paaxe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:44:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso350671185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972674; x=1794577474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZtFwhZNNp3I4CxFlYMx4Z+4Hq02VTYQrKNwwmgilIY=;
        b=InrJ6A09TbE311IkiGEC6i9cLK3+Dy4IGsZ4yORjoFl4klUAkhc1pMRpSvupBDBBQC
         IdSln7SEFaPsAEF4Al0G8au4koI+1ucA5JNgNCC3v7BSTKMktCFlKOVVrHZFfHiS59wF
         DHSjBtTpE5UVkvJqpCpq/8IaTLa+XABh7r5IogQeyl/Iof2XKr8RuCXRQ5bqy97RJW4B
         PBss9eMRVgGysXjYPKJWPzhWjOOPtg8Dv2+35Vy+Av4XbShjBPJiU81j3tPQ5gnrDLNS
         ytaHY1EVnZdT2xWAc99GEnUPdeCdlT7uFZ1Fh59FIo0sI3ppZjSbJSAH6qSH/gd67OYZ
         /Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972674; x=1794577474;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rZtFwhZNNp3I4CxFlYMx4Z+4Hq02VTYQrKNwwmgilIY=;
        b=PodHhV3aNsJ7+UgX00twEIC2uSFGTrJiroqjSfybvF2s3z0eyNaxC3otW+yi72vJmE
         4qfBaF7FawCWDGxNkEEQtyp+vJrxUZYrTBAdzHzLnGuZTXGUeDOqTLiVU0AcXwoh6pFA
         zo75jZI1gQc6np2eO5hMhXUWrpqEAoTajHv/3JBfUm7WsWKUluBIsI+oob/ZmtrUyEWq
         3L8et0kq+xR87DKUZegdss1eFV+NsHsbxmd+qGYTR5DBppYY3PTNgEIq29vrMHEXLTHr
         lDTAz7VTYc/5Yk6loAMVIschRdKfu3MQH5KB4JeuxuUPwTYaJrYEmujAURfbgokENYV/
         kG+w==
X-Forwarded-Encrypted: i=1; AKwUvBxb6u4jkVcEcS4BbVwQ3R9SsScF0EIziR3tTzZoFmo9xFloTS8P58Rw5/9rRRbCIJb4pK8Z5qxtsOmaXKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NeYNwjZC41/PHzeXBe4PHiwDnuRV7hBZ1t6Zx5V4HnX+dxlsu
	8xvffltRQ6zVk3zGHww1O89uvxoBXs+IeQKF/rnGpSJsEnUCY3FwPJEKnBmkRSDj/2nDEzXyOOz
	b9uozvwmqweknAkLbh3DJrJBOwfyj4oYrQYEfLQ7JKjuAH6msiO42I/P2Zdd5qp5F94Q=
X-Gm-Gg: AYBFou2g8vmvhi1tjmGYiiSvF8QH4RITQBRpSVie1q3yv1umMKZwUnbHb81dnm6AlqB
	3r32FSzsJHbGHREbwSiFgG+W065HhvnEOGapnVeHFxExMirpwBINBhWJHmVoacRZ2/0Sh3KxGyj
	2wapjjgu2Pr+sDRzPDpWKBf8gHtm8dmKTAlj3rpRQZL778hx8WMmpxpgHWGaDQnPWLPLNWvzR+L
	bwAJk6DbGE44PJNvJfCKZf0MgL0pFWkLx90YLINJhJHl53bPeuvcPYbA9Rk9/OrhWr0tkkUAc08
	/nK9miwxWoFW+P1u7/RycDlTvfLVcAYzskGa24pOShJR0n2daXmue+DM6Z9MnDWLmWSgQv/B03v
	eX5wbluQ9R2WkcCddhOAHyUZIHXIM0UIL6U6aQtHyTWsKZo2i7zc04uMhMM5bL20oUeeA7YKMVc
	Lkd2H+NqhWoGvZxidOggFHlnLG7x4PHHX+bfuiM/KmcMNsEP/IvNe153rx7ZM0DA==
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr926069685a.0.1793972673623;
        Fri, 06 Nov 2026 05:44:33 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr926065385a.0.1793972673171;
        Fri, 06 Nov 2026 05:44:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/msm, media: define the UBWC buffer layout
Date: Fri, 06 Nov 2026 15:44:06 +0200
Message-Id: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKbZ7WoC/2WNwQ6CMBBEf4Xs2ZJtbax48j8MByiL1AjFLqCG8
 O8WOHqZ5CUzb2ZgCo4YLskMgSbHzncR1CEB2xTdnYSrIoNCdZKojBjLtxW1D20xiMpbFibTCk1
 GUhsFcdYHqt1nU97ynXksH2SH1bM2GseDD9/tc5Jrb9dL1P/6SQoUx3OGWqNUpaarZ05fY/G0v
 m3TGJAvy/IDe5QvzskAAAA=
X-Change-ID: 20261027-ubwc-format-docs-7942079e1472
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QToJndkODS7Wj1YHga1gJRm6FhemYLcKo0eeSk+YgxM=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrt2aqh4rO0+jTXqtLOsn8CGU654vcQ8JUTBZXoX7TpE03sB
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq7dmqAAoJEIs8ij4CKSjVgwcH/0zr
 wV15bo40Cu8PIUFuvzmC31vBuhBFrKwZt4mUUYC+cl+bJV17oEHTKzywvuakL40gNy4pHizHP/C
 3MpM5PTgjyQCZuXvpY+qKQCs/9hDiixtfbx8Yd6D0Rak16/TMGw1J+CwOEY892pdraz9LAdNELR
 WreE5e1vxav7YDr237+PrCgwzAwzuE+s39W89Imm98AIzT+MS8ApVHsV/Ok1Fi0aVlKEaKFdk2q
 Gtui+o3H7/GeLqOsD/XrGKnQ8CAWUFnAdHllryrTMt92dZP39qcxW1hoD2nhWhT4bCnZsYhoLUX
 a4lkP64czSXyE0rLTCnd56zjRN7i0fiwJoHKzp4=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JrCYJoZQr718AN0qTdspAktvvWazgvEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX4zLMMKZd3o0D
 35jYTB+1rXxVkHdvU4ImHYBBxpjEQ7iaa7LOYnhL0wT5tie2WQe8E4GIBmufEXb35yXzUllmw1s
 EaWlIbotQZcPaT9WImJpAE7BBcau7IMfSuFzELa9UDT916l7BWnrvan5nPXWNv3tHvOT68USmO5
 PkYG7DasYCjxIdgL7DcBer1KphuYLVF/MN40dJ99ofK+Yx7vVRmWMB8DL/QgPmsBwk2u7vPh5jY
 IUCOAfr1UfOrzcmg/JyfryDRFBrOd4Tm36tMgoFVbkCCiqB9uZWXjQ65J7A3XVKcYYrfMORnhT1
 wrRRjXSlFcipH3Wq0FC1tlVIlbHCiiVQqE9GZTymPBVF2xPRYjmzmpI3i1USx8IdKFWNMA76ZKb
 znnljqpewu06aHoNU13LsW1M81Dsybvc142E+7LhD7kJTDG+tSdD/t0Yyp2Ey/RuIyen1hUn7iB
 T+5KlphlzWrR+a11OXg==
X-Proofpoint-ORIG-GUID: JrCYJoZQr718AN0qTdspAktvvWazgvEQ
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedd9c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7UXMlWAF346c1l6B0ngA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX1RUueKbsgqym
 siGHkDpw2uKVYOfeDALMCZ94izrAqnGsZFXHm/IpNtdcqrQwBt4L1yDB63iF1AIN+xqn30xtuVF
 25vFKlmu/cuON9gMf0bpfpo7+ndqpzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The layout of UBWC buffers (DRM_FORMAT_MOD_QCOM_COMPRESSED, V4L2 QC08C
and QC10C) has never been written down. The V4L2 formats are documented
as opaque with four or eight planes, the DRM modifier as "macrotiles".
In practice the video decoders, the GPU and the display controller
exchange these buffers, so each side has to reverse-engineer the layout
from the other drivers. Nicolas Dufresne asked for a contract to know
what the V4L2 plugins have to compute when passing decoded frames to
DRM.

Note that patch 2 changes what P010 with DRM_FORMAT_MOD_QCOM_COMPRESSED
means: it used to be set up for P030 (TP10).

Mesa 26.3-rc rounds the NV12 chroma size down for odd sizes; that is
being fixed on the Mesa side, before the layout reaches a release.

Tested by decoding a clip and scanning the frame out with the layout
documented here: QC08C as NV12 on RB5 (Iris), QC10C as P030 on RB3
(Venus) and on RB3 Gen2 (Iris, gen2 firmware). Each frame is identical
to the same frame decoded to linear NV12 or P010. Compressed P010 was
tested on RB3 Gen2 with a frame written by turnip, with P010 support
that is not merged yet.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Described the compressed 10-bit format, P030 (TP10), as P030 instead
  of P010, compressed only, as the SSPP can't fetch linear P030; gave
  P010 a UBWC entry with 16-bit samples (Sashiko, Robert, Rob)
- Documented P030 next to the 16-bit P010 for QCOM_COMPRESSED, mapped
  QC10C to P030
- Explained how the meaning of compressed P010 changed and why
- Venus: dropped DRM import as the reason for the stride fix
- Link to v1: https://patch.msgid.link/20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/msm/dpu: fix the comment on the RGB UBWC plane count
      drm/msm: separate compressed P010 and P030 (TP10)
      drm/msm: move the UBWC plane size calculation out of DPU
      drm/msm: check UBWC framebuffers against their layout
      drm/fourcc: describe the Qualcomm UBWC layout
      media: docs: pixfmt-reserved: describe the QC08C and QC10C layout
      media: venus: report the QC10C data stride
      media: qcom: iris: describe QC10C as P030 (TP10)

 .../userspace-api/media/v4l/pixfmt-reserved.rst    |  64 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  84 +--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp_format.c              | 113 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +
 drivers/gpu/drm/msm/msm_fb.c                       |  39 ++++++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 drivers/media/platform/qcom/venus/vdec.c           |   5 +-
 include/uapi/drm/drm_fourcc.h                      |  64 ++++++++++--
 10 files changed, 271 insertions(+), 108 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-ubwc-format-docs-7942079e1472

Best regards,
--  
With best wishes
Dmitry

