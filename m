Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612841;
	b=sDpFA5sllsy855huig5wn9pkNUgka2MAUqp+8wuFTRARIgbjCmc0f+RWEu3/+n7FWEVG
	 HcheVLnFKo/S5sZn3jrl/IiFHnC9kTXfSlMO2TKdndcreom9elTDtj01hUpeXilL+G1MA
	 Oxq9g+MzgggksFwcg1S+x9BJi+jNYNJx9KUeyb3nRfRX3LYUTlUxUUdJPxSsXGDT60c61
	 xhL9lCPKXXqGtRzM2Al5PQcWA0w8f1hVRgOjzVf/StEpsE3X+ZtRW2KXXTi+B6ay6iJto
	 pIduEbiQ6TQkqLPSSKhPm9I0Q8fGuSnU4NE8G97CH0UkW73YwLsewzIGVQSK7+RcpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LR4DGJ/ZrO/IApQp8LHyA6tR1qulP05uQIYbHczvIqg=;
	b=DyPk2hqNTGNjsrTJWuCjZUzzpAqBzj4QR6poRuIO8C/rW0/nEhDT0lxB/Wv8QASSCk43
	 eCK2dBiJMSwN6ldQCK/HY8w1iUYcaCuPumUlR9geCEUysh2Yejljurbi7y3E3nX8ddxa2
	 tsQhiY/nA5mady/jghwLBwzmq/mYSxNpKN4w95z3WPn8Q3Y+R6G00SImZ4Kllhk5hOZG6
	 pipdHyJkH19DMZOSKZC86JHHga2jam2WkC4xKoaSCplc57KV2N1tyHa5TALULUXPIN4yT
	 3BIycjoPakhxlIJWywuyt4l4J6O5Kv69d0WKJZFQU8udSIvVqWv4xIlEuSRAhOvH0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qvm96RX6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjIZjvFx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DD606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645DD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qvm96RX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjIZjvFx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMOW1821203
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LR4DGJ/ZrO/IApQp8LHyA6
	tR1qulP05uQIYbHczvIqg=; b=Qvm96RX65nhdyY1eQ1ArizrZixAcIs1FhdiYZi
	8D48FK98XzYpC6K6IGnEq1jYjC53itRogcPuzJeyhRDNM1Z6HhVySyEcvc311DCB
	S4HixEg0L4NOko9aEMRQ5K1ahKGnXKOymu5navjiTTdFV1BlUmkV4lcK1Auen2QI
	+MGWR5xFi2Nv0GkXbt+v7fjv9OpEyDjPawqxiV6GHAxKKWiJW8FoXxczi5tYRabK
	Q960OAVqSMu+OZ2YWKwWkA0VbmpS5yaSVbsqbe03EFn6r0RUBRsUDskT68duQqPh
	YPSHmyLFb6+3eUyici/WFZk8ESIVSMDgPgWGSz98hPP6h4zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h255-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3946509a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612839; x=1794217639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LR4DGJ/ZrO/IApQp8LHyA6tR1qulP05uQIYbHczvIqg=;
        b=MjIZjvFxSxEEG9fRpqYGU3TCRibwDhZsTUogy47tEvqVt+EmAgNqHHdgh3Vwrjqxok
         8Wy4HCZP64DsBIQq983l+I8niHx5zIG9PoDbS02KJhraR8aiv+vebd+F19+HFf57qPlm
         MkC141SyT23jh2oLmJSn5jEZTaLS6awR622HgB/MyVZ+n7nV8iRIOgOTb4CxO1GgbVt/
         w9sAaIuLclVRNj5hyNmUjuKOMxX8Wrkk1W+Aqd6UIK8xpOA4wvLtoYxpAwoICJAaD92C
         fOCQJYhXAN+3lnx7pcz5J8OQyjgOXv1bIyoltdNOfUXHVouiaMMwXGqENyIxEvIvRzt6
         b8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612839; x=1794217639;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LR4DGJ/ZrO/IApQp8LHyA6tR1qulP05uQIYbHczvIqg=;
        b=nlFg3X71OyiNb6cLc45lo9vGjaWIJ2l0CbvlpbTupq5+d80cNSo04tg4igEV3DVx5j
         4lAIA7e2m4psl4LFcD+XQNJDBpKP0suaR7WvLkXC1JaoeyyFT9sOsy7dswOD1X5QemiS
         yZYPzEK6lmzr/CCBVdWVJTXsXC1ePDocV3fqAcEex8dzcty9KyHolKV4UiyPjokKER+E
         kdBI3nz20eZrpbxGSrCWeaeCZxQ1prE5htVlxQexrD9gsVN8EsbvYu5Wnql6OmpvMXu/
         cPRhFkFMGslB2n55RTbLv9TNWUOa1RExNGZaSLzNsw+uJxUAo+l/VmUsWlHP8b4EwfKu
         qq0A==
X-Forwarded-Encrypted: i=1; AKwUvBzzGfTK1HmHe3nXlh2X9qUBNOsvSoPEfW3abZ8amBOCTGaYnnlBCem0LDX9C+1t2mK8JV5W+j4X//pvrHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MtmF5EiHf8rBqTX5v206HQi+/2up1ZFtIqlz/2SBY3EMupXJg
	Qt9rjIlBCuJ3DQx3FZymrBZd2R7a5T5n3NeJlS4N5VMmtNjayY/NK/nW3n8o76rkscsc9/Txdln
	vDv4T+dTYZ5J543wOu05jjeua4ZkjRZfXkAiwTbM5CLf7f6VUX6VmVdsNiPOZXKMnhc4=
X-Gm-Gg: AYBFou2vvzMy/djodHbDtRMZ7ABez7ElaHZGQ/CjMe2fRzUpvELMEuf0FRHGn2vWEPx
	cjADdVbUpMFBrRSrYDeKF9m4ka3NMMjVEG17ZPXyO0fnhtDx/MxCP8uF4b8WVUQPpauedfwjX1B
	GAFOiFwuKMo7AE0LjCFzRPIksRC4w+h7wln+1psoJ9DONhfnxa1KSZLSuwxK03ooBJfLiefQ0X0
	duyhLfg/v7KB/hyki2LNDuC9LRdMmRDiirQsvN6TPi7AAXFuKsttSqWjcvpEkHG6VDpeBbxBfp/
	6kwfaAVRPglbw4q4snTvfvQO/AImNf1KaVeoEc97+o2rbaTdXYJ9boBFjaDVhMHaNkS3rTGWPvD
	1zH3fkYOpFQI4+J5sIX0lgSh9aKb/SJsiC7vv6sWI4thLhDHo6/aynlZMNnB1tNTSoAGgpSSCU8
	Qorux8nd7+YWVQFWg2UQDcOpuVPTKqAc7aKH0=
X-Received: by 2002:a17:90b:48c6:b0:3ac:af8b:6f4 with SMTP id 98e67ed59e1d1-3ae898352c3mr7944006a91.37.1793612838357;
        Mon, 02 Nov 2026 01:47:18 -0800 (PST)
X-Received: by 2002:a17:90b:48c6:b0:3ac:af8b:6f4 with SMTP id 98e67ed59e1d1-3ae898352c3mr7943960a91.37.1793612837625;
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v21 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 02 Nov 2026 17:46:28 +0800
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPhb6GoC/43NPW7DMAwF4KsEmqtApKy/Tr1H0UGSqUZAYreSY
 zQIfPcqWZKhNroQeA/kxyurVDJV9rq7skJzrnkcWkB42bF48MMn8dy3gqFALaRwnAYfjsTDZSI
 eh6nwNBYep3jmKVlNGpwNJrF2/1Uo5Z87/v7R8iHXaSyX+68Zulv9H7atcsGjsBYlKW9Jv4217
 r/P/hjH02nfBrvxM6gnEuQmqRoJxpgEHfUS3Bqpn0jcJnUjje9A9ggQbL9GmgfZIWySppEuJql
 TUipFsUbaB6mE2SRtIzFgr5zotPRyjXQPUqPaJF0jbQohIZKVFv4gl2X5BbRpMuNrAgAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612828; l=17381;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D/f4P3+vrjM55H2dtpIeHP7qvpmSIMC+16iDO9G4VbU=;
 b=E9rnN1HuvEGXTAgTRYhLABfoos7W80sSGrcVgPHN8mMk8FkVSibkJknhzGZHs0HaePIDaLpgr
 W+z6yDfLwEfAEPk/XIl+Lhh52cmiTfow9zxdWP8AHF2XEs5dkwyY8dc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: mYWRTu0HuQ5O35UpK0zksgaHhGNd4fVn
X-Proofpoint-GUID: mYWRTu0HuQ5O35UpK0zksgaHhGNd4fVn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxKzmTiCjEAo8
 sOBnsY/JIYaDkHCQuo6jebt5/NIBeBjBHXPoYI9y+skgQRZnuuG8sx7Qb17OErL2dZ31sHqth5z
 CZNYXSIjjKv9dEYuuuZIf2QSgOBS33U=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85c27 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QtmrLmk6OMFIyGgyf5gA:9
 a=qAhTI3y32W47uO3E:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3e6cv4Ts9css
 SrdgzsDwb2ijHy+CD5eMY9eqmvq5bUPp2OM8nobePyxCq1BpSM5Kzfl9OQiKoPdB36QWdK2msls
 fF20IUthyyI0PAnt+hnVIOJomGq45jXsEaj64HraJeSu8YVe1sqzlSRxMW3POQOs/NTSY4jPOW5
 m2VU/SJJpbaf2ZI3v5H0PJkeQngzrN/z2RAZrdzqP2sxj7TEPkixxULEHBDsW0Zg7caRvYvoMoK
 zY0mHsvl+mkqaECK7FJFgfB6Mox5+wn1nFfMMSo72AJwWbYW++57RDzf5lCRllLiO7IjczX1+mi
 P7mo7aL9bzaaOiciVQicNkUbFC4bdecSaV0WdZFK/xafyFjO2wM1Jh2kOgc0NhWe8SH78Gd0qfs
 UWp9+XPzvB3394cTnMaIEP07z46tMZrXt+H8VPWVKuKlp2065qmirAWMvjqwLuEkvw6EMy7C7h8
 T2qOpmAcUOuFP2RadzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v21:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Make the byte-cntr read and the generic sysfs read of the TMC
     exclusive: tmc_create_etr_buf_list() returns -EBUSY if a generic
     read is in progress and tmc_read_prepare_etr() returns -EBUSY if the
     etr_buf_list is not empty.
   - Wrap the live sysfs_buf into the list only while the sink is enabled
     in sysfs mode, and keep it in tmc_clean_etr_buf_list() only in that
     mode, as the sink enable path may reuse or free the sysfs_buf
     otherwise.
   - Don't create the list in the reserved buffer mode, as all the
     etr_buf of this mode share the same reserved region.
   - Fixed the kernel-doc of struct etr_buf_node and
     tmc_create_etr_buf_list().
2. coresight: tmc: add a function to switch the ETR to a free etr_buf (new):
   - Move the buffer switch out of the byte-cntr patch to a TMC helper,
     which stops the ETR, swaps the etr_buf and restarts the ETR in one
     critical section. The switch was done in three separate critical
     sections before, so tmc_disable_etr_sink() could run in between and
     leave drvdata->etr_buf out of sync with the hardware.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed the drain of the last etr_buf after the trace is stopped:
     tmc_etr_get_sysfs_trace() falls back to the generic read when
     byte-cntr has no more data (v20 returned EOF and lost the last
     etr_buf). Other results of the byte-cntr read, such as the one of a
     signal, are returned as they are.
   - Program and reset the byte-cntr register when the path is enabled
     and disabled, instead of in the read prepare/unprepare. The CTCU may
     be powered off once the trace path is released, and accessing its
     register from the read unprepare, which runs when the file is
     closed after the trace is stopped, hangs the bus.
   - Serialise the CTCU register programming with the ATID programming
     with drvdata->spin_lock, as both unlock and lock the same register.
   - Fixed the use-after-free of the byte-cntr data between
     ctcu_platform_remove() and the read unprepare: the remove waits for
     a completion which is the last access of the read unprepare, and a
     new path can't start byte-cntr once the device is being removed.
   - Wake up the blocked reader once the byte-cntr is stopped, instead of
     waiting for the timeout.
   - Start byte-cntr in ctcu_enable() only in sysfs mode and after the
     trace ID is set.
   - Check the interrupt returned by of_irq_get() against 0.
   - Report the interrupt overwrite of the etr_buf which is handed over
     for reading, instead of the one which is tracing.
   - Make byte_cntr_sysfs_ops static and fixed the kernel-doc of the
     structs in coresight-ctcu.h.
   - Count the byte-cntr interrupts since the trace is started, and not reset
     the count when the read session starts, so the first etr_buf is switched
     at the right fill level for a reader which opens after the trace started.
   - Ignore the ports which are not initialized by ctcu_byte_cntr_init().
   - Updated the commit message.
- Link to v20: https://lore.kernel.org/r/20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com

Changes in v20:
1. coresight: core: refactor ctcu_get_active_port and make it generic:
   - Check the port number returned by coresight_get_in_port() against
     ETR_MAX_NUM in ctcu_set_etr_traceid() to avoid an out-of-bounds
     access of the per-port arrays with a bad DT port number.
2. coresight: tmc: add create/clean functions for etr_buf_list:
   - Take drvdata->sysfs_buf and add the first node to etr_buf_list in
     one critical section, and do all etr_buf_list updates (add and
     delete) with drvdata->spinlock held.
   - Return -EBUSY from tmc_etr_get_sysfs_buffer() while etr_buf_list is
     not empty, so the ETR sink enable path cannot free or replace a
     buffer that is still owned by the list during a byte-cntr session.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a NULL pointer dereference in ctcu_get_byte_cntr() when the
     opened ETR is not connected to a CTCU device, since the byte-cntr
     sysfs ops are global to all the TMC ETRs.
   - Fixed the sysfs read fallback: tmc_byte_cntr_get_data() now returns
     -EINVAL unless a byte-cntr read session is active, and
     tmc_etr_get_sysfs_trace() falls back to the generic read only for
     -EINVAL. Errors and EOF of the byte-cntr read are returned as-is
     instead of reading the live buffer.
   - Fixed a race between the buffer switch and the sink disable path:
     tmc_etr_enable_disable_hw() now checks the sink mode with
     drvdata->spinlock held, so the ETR is not restarted after the sink
     has been disabled.
   - tmc_read_prepare_byte_cntr(): check irq_enabled with the
     byte_cntr_data->spin_lock held, and clear reading under the lock
     and wake up the waiter on the buffer list allocation failure path.
   - Pin the module with try_module_get() for the duration of a byte-cntr
     read session, so unloading the module fails with -EBUSY instead of
     blocking in ctcu_platform_remove(). Documented that a manual unbind
     still waits for the tmc_etr file to be closed.
   - Dropped IRQF_SHARED from the byte-cntr interrupt: the handler does
     not check the interrupt source.
   - Read curr_buf with drvdata->spinlock held and handle a missing
     current node in ctcu_byte_cntr_switch_buffer().
   - Initialize the lock and waitqueue of every port before requesting
     its interrupt, skip the ports without a registered IRQ in
     ctcu_platform_remove(), and only expose irq_enabled for the ports
     with a registered IRQ.
   - Refcount the byte-cntr sysfs ops registration across CTCU devices
     with a devm action, so removing one CTCU no longer disables
     byte-cntr for the others. Replaced the single-CTCU-instance comment
     on byte_cntr_sysfs_ops accordingly.
- Link to v19: https://lore.kernel.org/r/20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com

Changes in v19:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
     and tmc_clean_etr_buf_list() to state only the required contract
     (caller must guarantee exclusive access to drvdata->etr_buf_list),
     dropping the over-specific call-path details.
   - Lock the required code block in create/clean functions.
2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a stale reading-state / double-free when irq_enabled was
     cleared between prepare and unprepare: the byte-cntr read_unprepare
     would return an error and tmc_read_unprepare_etr() would fall back
     to the normal unprepare path, freeing drvdata->sysfs_buf while it
     was still owned by the byte-cntr buffer list. irq_enabled_store()
     now returns -EBUSY while byte_cntr_data->reading is set, so the flag
     can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
     additionally guards on byte_cntr_data->reading.
   - Moved enable_irq_wake()/disable_irq_wake() out of the
     byte_cntr_data->spin_lock critical section in
     tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
     irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
     be called under a raw spinlock. The threshold IRQ is already
     disabled by the in-lock register write before disable_irq_wake() on
     the unprepare path, so no wake event can race in the gap.
   - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
     single-CTCU-instance-per-system assumption.
- Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com

Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (8):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: add a function to switch the ETR to a free etr_buf
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 400 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 184 ++++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  88 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 344 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  43 +++
 12 files changed, 1089 insertions(+), 78 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

