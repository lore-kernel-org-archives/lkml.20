Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877077;
	b=dRvRnZda9FuwYqDEsRZn3c3Ouo7Dt73iTFdxKWs7S+NdI97uvSGEmnZQHO9WjHjIc0J+
	 2kWpACvLHk41J46haH9ySgvzH8DMyrxbqZOH1LOWRSjm9H7RAURITCk13TcjC4MVigTJp
	 OspLCS4vP9sZO/OWVRwmz5TfIhjGo7BJeVqFIB/TSqEQI4L/9A05l1E9C0WtKY69/HD4x
	 D36Z3A9NFF8zqmhkxoAd7Fppj69ZkhPpCv6suMLNGrdtcWaymME59/226Ea0OEOC0TlHJ
	 Lg2GK4xHH841qpSocJMhpZFKVAn0xdZ67gxgOoWpnfc5OGGDuh1/ydaptEHUc+o62bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
	b=D61cIqoJP4PyOcBHqT73Ar3VZ3+t5eJz4FObwLei7Qs0bFP4MV0CSVxbnnMoIhA3Wywn
	 kqdL1q+smp4yQrNK58T1JarIiVF08OIJVidFGYgCLJZMaUikR6ZpZujO9Sp8rtOP5ERtD
	 8q+jbKc8TxzRXiBGaIEA0oEyZnWLHrlZoxdohKj0jS8/VjrhxHr5B1dRfRzE4LiLa2jXf
	 bIQUt2pv6BLVMt3q3DrMlaNnERVEZBqGeVyrS27/V4K3JYbxhHw0hVx3+M/cj/OBal6zG
	 aGWvZq+3isqp75qjPh4wBdxmFJe7TEz5IiZW495kWZo0J1zz74hk6ftu2dtauer9Ffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFJ5t5pI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2lkbzII;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D43606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D43606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFJ5t5pI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2lkbzII
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LZj3193494
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1OJRD81mFwvYHvL4ipmbVd
	lvEccfOcqryzIVSzhKaH8=; b=UFJ5t5pIzl+lwd4pX13xw6VXWbLaSb9Rn0vcSj
	olEr6DSfbroeTS+U/lkAMnSzEnrXXirtAfQWp29lZajI2v/w2nllQQGDtXXQ72JY
	nMYQvU2sG5myJ8JmAzCAADHQHLiIPTxDODtN4XjvZ1cdx1h5S571asikNmAas8AK
	/cDCfw4H+DqO6OkosqiMnPh0DULoYOpwGH23mkPXp/hBV80YtMJbtmsy7uSqroa1
	p3JV2iGYSvAxO/w4IoQKmzLjBvYhO6Ixt0mndP8IiS1ZqT8YAOLMngl48H924V6H
	QGrcJO4hrk3stjfYeNXxTTWVabIWaNjsbLcPK6LKf90DnfBQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr10e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:11:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1191478a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877076; x=1794481876; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
        b=F2lkbzIInSnMvyhUZZTLl1owrZAXcaO0tva0Kd0WB5JfeiDjwCD29UXbGd63TZbRGP
         hd6ivQbU8sTLbyQoijWUuzDW4CGGMf6DNjWsRrl1A0dp9PJgH5EEYl0w/s+aNwA1N40Z
         Lo/m4F7wOMTTm3dQrZpzeWwRJaiGKcULfxnujOmWTD6OSLDb8vgACTQOH6amj0UUaRGt
         3tTPrmDxdrmXUlykJRmt2gb6UgCD1bhMWBLbO8L6O++KOrIXVRmikjH4B34OYtW2qAZs
         dIV0pGaHAbQwAUx1YuRjE5gqKwxhfo6f46i+HZrcc8q5vV77VgfrWyfM7sXXFH40e9VK
         jHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877076; x=1794481876;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
        b=VLGbkSZ0sEJ9+8pdLv/WRqLsbApK9v6wPf9vWa9Tmjnarx+BIwvlFcLt69IikNY7/8
         yUDHM/j4aVwBIGO7zB5ZWQ7r6u4QH3VYSaBmWrH6ITfh6vbqHB035oCXPeNVyH5MA5WQ
         N2ZPJ4P6aQyoThuzzJ4DUwIqMPwz3umNDTbMOoVjm3xzEYZZXGDKMQxC5CGKgQOpIoQU
         kelBxxdEHOeCmzjAObd+0Xykv1bkckVpKobw65TRXgnAUCzSwn4tTNPneh1cCvNxeLv8
         0sZ4gs8KnS+n8p7EwFbqcS9x7poSnLylIm6tSudvlhRzHkIFsDBF3ubb6hW3E7SnrOzq
         2jJA==
X-Forwarded-Encrypted: i=1; AKwUvBxY4n50YIkRA2ThY6ocEU07sR4jigPznwFIlqX87QgORlJOJIxp9the/6OxOyr1nA9HS0FZ2Hok87+dDe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p8xTniKh/Eye81xGIpPH061fbj0vh8svWhMF+FMGPemjrOMiz
	DJ+z3pe7vMvvcRh+Uws69lHA6o4HtbhTyR6N8JrMDSLsZoomD3CHi7BMw/7YdpdLSIBM3sibeHa
	Pt/Td/DyNUkLgASFGGqBzchWj3OmWh3VY8KBl3ctkVMvuZuTgNPCincND1WBl3jcRPlE=
X-Gm-Gg: AYBFou3FN5DcuwORDNHM8JJnOBJzfR6OxbjofwBZBxDpKQ9pO4gIthlopIIDWG/LF4n
	4R3xKKbWReQYm3ltnpCwOECBtN255GW2Mp6Y9R375qkCmzxzTcTU17SdhNUTlBVs84gleXJTwKy
	ebAavqBT4Zrq9LbCa4i5fTbkZUBbOHMY3aCNRrX4WyB74npMrDFRzdRASICCcfPGbA36IFqrxyD
	IxoUiysZkGbunN5JbkHVQygBk7RBKKVSji+Tpp7xWMWrQ3hWyS3R8nhvH7zyslflww+L6g+tr0s
	ke1YtQXp9FLymh68tJRgJkeM9Xos922TyC5WncPcx9sfBYQ3nsk4OC1EkI2VjboN0zKiSYj3Ba4
	B5Nzu/7bTy5SI6IXPaOj9G2cpxVKWQR5vlhik0VPvNuA+lINfXFEAlI4n+5xTldjd+GGlfCZWmJ
	iNRmB8uUse
X-Received: by 2002:a17:90b:390f:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0a4bf0bb0mr2982060a91.20.1793877075558;
        Thu, 05 Nov 2026 03:11:15 -0800 (PST)
X-Received: by 2002:a17:90b:390f:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0a4bf0bb0mr2982013a91.20.1793877074889;
        Thu, 05 Nov 2026 03:11:14 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm3384737a91.9.2026.11.05.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:14 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soundwire: qcom: Restore and fix set_channel_map
 support for SWR master
Date: Thu, 05 Nov 2026 16:40:41 +0530
Message-Id: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADFk7GoC/yWNSw7CMAxEr4K8JlGTlvBZcQ9UoTR1qYE0ELd8h
 Hp3EtiMNOPnmQ8wRkKG3eIDER/EFIZk9HIBrrfDCQW1yYMutFGqWAkO09A+KeIx3we8Hr29CSy
 7ptpoV1SugfR7i9jR69d7gIeG+p/x1JzRjbkwUz3xGOL7N56gzOadwuitqpQpS7kxZrUWSvjQW
 +9tK6PtSHJv6bIPzPI+2asL3sskUM/z/AWnYd/50QAAAA==
X-Change-ID: 20261105-soundwire_channel_map-e3fb482c04cb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877069; l=2402;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=yEk84d9YWCKTyA/doCJLWy1unHQD/uGC5BtKbmJpAvk=;
 b=LpzV9+AxRvewjKFdBk6/ANHs37a5BeDXsqi08bauApJyiX5GVoFW8Ymuh1jndLllACP/mibzA
 vhuCTyO+/C5BzYCaeSoi1T3RJkAWhMBfdOhk6K3eLN1q3d6touYWtH9
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec6454 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ry3R8fqGuPX2O_Zx3tQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d8_VD9ywTIHeAvBXrIx3mocjLmQ1Wz43
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX1vX8HEVm5lm4
 UiueFHScrocnSDF1A5CuWJ9heuSayO/zJwdkVQlkFGCbhHRLBBrhyFTanXccdJAlsfpZV58jk9Q
 s+IY6x5xgCQyIb7ySA4amP3pCGxCcQM=
X-Proofpoint-GUID: d8_VD9ywTIHeAvBXrIx3mocjLmQ1Wz43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXwfMrCdZ8opBO
 R0jzUxIsmaCH0jhb+9PIGN5u9dlRo813YgaPQPvB5zPvfW3pULIrAkK+6+zzMKle8JZf1iFhEpM
 Oeoi2dfjosbSOIoMlRbGtzZ9rh3sQDcffbaK/Vk2uRCQGPUWc2V92/CVdy0hnzeS/yQyNY5MueW
 YyTbvVzrgvtKs5RhvW3yIDv4oK5zipW0ZStnr4VbxCyguyGiixdgrDYuWKIreNE+aVsmTNoF2Mb
 dEoibFIygHVNdc7EUKr9S2P37zvzn1PYCQ4Q93ASNKSACR/A7zSG78cEooSeBJHKVWZZ0+FBRs9
 uNO8HeOpDmhkmWEkwzU8/lyYwPsgRXvlUfVwOISOC3NmSk4kmFeVCR4SF2xMaCHT6FH5NQPKGeP
 /ks7XI6XIoV1FNnqGNvT6TihCCPXDrnQ80PICLBhkyhK8HsLXRJDPm3EiLu8izDmyGahy48+bjk
 pgSY123Bg63Rq2WSBUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

The original support for set_channel_map in the Qualcomm SoundWire master
commit 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
was reverted due to multiple issues reported on sdm845 board, including
kernel crashes and data structure corruption. The root causes included
incorrect port indexing, array size mismatches, and improper handling
of TX/RX channel information. This series reintroduces set_channel_map
support with a corrected and safer implementation, and fixes the sdm845
machine driver to avoid misuse ofthe API.

Add a robust qcom_swrm_set_channel_map() implementation that stores
per-port TX/RX channel masks safely under controller lock. Ensure the
configuration is only applied to valid ports and does not corrupt memory
or overwrite unrelated data. Preserve existing behavior for ports that do
not use set_channel_map, by falling back to the default SoundWire stream
configuration. Fix the sdm845 machine driver to avoid applying SLIMbus
channel maps to SoundWire DAIs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Removed the set_stream hack from the SDM845 machine driver.
- Link to v1: https://lore.kernel.org/all/20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com/

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
cc: Yongqin Liu <yongqin.liu@linaro.org>
cc: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (2):
      ASoC: qcom: sdm845: apply the SLIMbus channel map to wcd934x only
      soundwire: qcom: Add set_channel_map support to SWR master DAI

 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/sdm845.c  | 16 ++++++++++++++
 2 files changed, 70 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-soundwire_channel_map-e3fb482c04cb

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

