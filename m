Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469159;
	b=KT1xDRoAv0/dSyJxNMvfdaOToM6ohcYzNf6PJ3AoNh9ebVDDQKOLtc/Cl0QnV59hFpX5
	 E8e3tokOTcjWKkq44vg2eXlzuXuIgF4Em4Kz+rfOfClKrt28Zweghfr9bZRFlUsarlnbP
	 ishh4fNpEfbSRUEK0LtiIlHACc1q32n63ACNsDIKHwKbplU65mlwAoeUpWa/caq5J2IGz
	 a11lMq/SGB7Ud7cn3B0GKmPv1fmYfAqyt8ieT60Z8j9hTz+BXdoy+bco13u6G0NwAvfgv
	 YIbL7F5n7QQygEetfvhZRMLzD7dfM3Pa4kA9LDxO20EChhT2yqPCQNTmMGZStShSVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=;
	b=bZFUY+KPjwwadTzD05PPFE4Znyj8sN8r7xeqr4qzJSjiuP8+KLAe0FOUJAnCZdfL3LW/
	 rlcq3LAO/Nm0mcT6tSDlCqW4NbYWUHHPNUa/QgZygBsdLujsCJnbYl5rT55YPzrtvcrzd
	 geG+iYqnZhIUqSbE4Gb+q1EbuD4akBFY/tzu/DwNXV5dgUWSSi+Cb7X49zQj6fycR4h9A
	 LdFhuin58LX+TfW+vED1wFZWEBaxU9J8OSBB0pWoXgjrOWUTAmeU8uTZDNARXcEQSn1j/
	 5ekJWigZv9DC6mfduwesySdEGu4If4p9O5n8W6ceqMX836CIbWoKAmZS7Kol5Bq3w/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jX2FZlFo;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="XjZ+5/yg";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A08606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jX2FZlFo;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XjZ+5/yg
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDkS67969437
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2
	cWtMAH+LprFc5Esi8=; b=jX2FZlFoQ6i2GnZNWF4nLzsyZrPCkNt4TizG+46YfS
	msihij7QNb9+VbrmCP9g7Z/sb99RkIeSUyMR9uh+f52MEf8rbk1DA9WhBrmKL+P4
	pld59e61aAC/svQb17q2nGnEDawOYuOP9pDRJtoweZf3Yh4efYr/W1FTOXg/xTxo
	Ngz5TUoSq5yvCk4zQNZUlRiuNWq0AFj5mmHgjNb/yNu+blgfm9R2gfOQVytb1kwL
	BantX5EiF0LbftYiRpMhxxLF8HZCAs4qavPLFNUD+WWMXTYGR3G5/vAWtaXum7kC
	ph0cz9JeUCcdLkyh84tKdIA0c8jdQc6u5etwZy5RlwfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2x2vp29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:36 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso308693885a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469156; x=1794073956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=;
        b=XjZ+5/ygTSAJDhdxT9j8BJqt5XcAFBa4g6U+dl4l6CeiHx/Ue6WvAsbce+NZ2fGggi
         VhasJJG6jSIY7uxnu1VKiZ3M39JDjiirYc8xdWJIhi8ZwbksqGmAhK4YflzqTBcERdfZ
         u1JyLMjALl6881A/ZzC0C+2/Z8pWIyPY0n8Mva21cRb4xlanyc13eUD1mDEZjy8z3neK
         pukbhv2lqSCIZVtbvmCLaW0H4cNFBa6bnBUIQgXIB5WzOwJ+Cs1shiTzSKl12KGyQqFs
         9jDKM9CLfxdfwnUzNDvlqHGZa/4DOqWKS/uyfx3rhsFoiiOCffVbNx9+N0RxE8ZKvxOv
         LvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469156; x=1794073956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=;
        b=zaSJGGURCK3l7j5fe/AsyMfZA6m7rCtt7P5N2+0z29VNlKX0FAp6VxyREfiasZnAGo
         7OPjh9lUtWKW8epZMJelAZpULH59xme6d6gez77qayPtx+HJEmBzUeRmH/9aCTpQxGsx
         OiPfobf6aV2zV2j2CjOYWH1MXYaNM52iBfFLV2Mw7w5KRY4vU6ZKZZg+x43ufUC1fPaa
         9p49+vRcQrlrAPJBfpg6ZqNfctq/tntl6PPZ5PV6XmeWWBqyJCX51WXCITgXhggRxC+a
         zkEe7szsMRRUsANVaFmUE+m9B9tlb6Qx4393Tc1wxTGowgrupS8vPzf9zGYPJ5D/Wtl9
         WFaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2+OJWnBI0Hqba4fbOxK8D3Hj9vFOtCY/Bvv0eO8xH72g1c8tDiq9fnuB1ffZnx6wlYwljfqBHCmn58QM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIndRu2f4C2fHsKuGTlyXVET1PhsaoV233pXNDHLO8hpkCajwpZ
	xGi7+blUoqC8rNguBLfA9jdkywU6GDaJu99YRFt8XZEUGwrMdpv60dpDfptExbCKFigGn613bwd
	+Wn12ICKvVwODorXTfw6qy0V6OtYN192Gfif8rf7frHvrOaYactx5zbchaj1eqg==
X-Gm-Gg: AYBFou09hBRAZghhiQNph0REw5KPjR8Sy5IPNNuVJ1spG7735Wv39AOt2xg2YUM0M3q
	ST7UUYsF2TFSjb2SKNEWdrZm07MVcy2keQ83ynq3uwhzzNwmrRToL16CHupMPmdWDWw43VEqzML
	VzXWuxFinZPVhRn1sTSYQ6c4XEAeLyJBWcegWVVMqh8nLfWyOS+5DN4jJiHJ71SD4pi56gpUdrY
	N+Sn0Rqne2EYS6xt/VaD+QzUvCGdT6JgaD233vkjoauX1lUMHP9C/sZ3YelvhLzrd22BLz3ISF6
	k9ORrIGdtBu517LCUEpAgmjH5yaTq+OdUes7QjYq3lCB2nXMejuk9plMU6pjDl0nS6jXWOznfrf
	GyLBu4djr1gtUz9LfNSd2PWX38uTXxw5g5UfRqCYdbW5yhHmNBKEtg70hng==
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr967078285a.75.1793469156425;
        Sat, 31 Oct 2026 10:52:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr967075485a.75.1793469155973;
        Sat, 31 Oct 2026 10:52:35 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] platform/raspberrypi: vchiq: remove the last use of
 set_page_dirty()
Date: Sat, 31 Oct 2026 13:52:07 -0400
Message-Id: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAMcq5moC/yXMTQ7CIBBA4auQWTsJg1Fjr2K64GeUcUER2kbTc
 HexLr/FextULsIVBrVB4VWqTKmDDgp8tOnBKKEbjDZn0nTB1Ud54ZKyJAxS5g9a56/WUDB0PEH
 vcuG7vPfnbfy7Lu7Jfv6NoLUvNvOBJnUAAAA=
X-Change-ID: 20261017-vchiq-unpin-dirty-abc9a21d2135
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=872;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=78l/cY42q3FsGgA9aAmNP7rxKPH0mp1TX7G+9tb/Zjg=;
 b=6GBLu3IHLmc8tNmCmGJOOmywqYXrR4b3Tpqba9Qxt4eDqNSVRB4ADsrAv2I5XHG7LK9PcJChH
 ECRhEGdrW5iDGoVL38nx3NAxOdNz8S0f+pObpe5WBLCNsnccHCDgQ3D
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX8n+oCcJ0IVe+
 zJVJlLsg9nunpUfU5TmADIsO53VjY5pT4gRbOYCxItw8plkWSn5OqJq0KPu7ioLn0FW3pJe1Xpa
 vEDtOJTqyewEtmaK7sQ1vSJOyo5IQl7eIUlekfjsxucnK6b5DQDdybR2/TWMUgCA0QrX5SMfSsc
 Fzz4qPRHL23OJcx4ck1067K7KQjWG4gWq3KFTKLwVovglTwbDZm5dYn+pUHXwc3nmhziX5G7RB+
 4v3WMzWljmXvVWV5ORzNdYA7TlRVp67D95Q/q/zTh+vY00//LbJUuy8wK3QfosZtnMwmfIWJfIA
 X37jIRv28lmBIFavSn778gS7F4qmd4rSSaSvLp8qJxEyUpyHgB1AZuM5lM+2mNVHjg1+5YmKYQm
 34Jw70iXsUS6ZkTjwrehwjZONpD+UTSZUQMBUQLd2I72jO1KzOm5XoK1KYousljBfmEngIpEwuo
 9MShv4NruCwE5sN78Ig==
X-Proofpoint-GUID: c-oebAqRhEcfykbsD6ODGBu-R5zKk8Mf
X-Proofpoint-ORIG-GUID: c-oebAqRhEcfykbsD6ODGBu-R5zKk8Mf
X-Authority-Analysis: v=2.4 cv=YLMKWhGx c=1 sm=1 tr=0 ts=6ae62ae4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=n5EFpTFFQUXBHQ_dOw8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfXxZ46B31P58Jz
 wpg5RafrV65kYFWRqTrYe95ohi2kME/cDeXQn32HzGJHF59RUoJHT0hDk6FkQ6FZnrFha9G5rl7
 e2nI9cCkaSADokotJvjBo/zYfl1eLx9MVH7tzYDXOV0G3Fv7QciO
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 phishscore=0 adultscore=0 lowpriorityscore=10
 priorityscore=1501 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310071

The bulk transfer path dirties pinned user pages with set_page_dirty()
and then unpins them. Dirty them in the unpin instead with
unpin_user_pages_dirty_lock(), which takes the folio lock and marks each
folio dirty once. The first patch is a small cleanup of the gup flags
passed to the pin.

This removes the last use of set_page_dirty() in the driver.

Compile tested only.

---
Tal Zussman (2):
      platform/raspberrypi: vchiq: pass FOLL_WRITE to pin_user_pages_fast()
      platform/raspberrypi: vchiq: mark pinned pages dirty when unpinning them

 .../raspberrypi/vchiq-interface/vchiq_core.c       | 27 ++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)
---
base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
change-id: 20261017-vchiq-unpin-dirty-abc9a21d2135

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

