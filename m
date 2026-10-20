Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506397;
	b=0zGgU4ONry/Qt82WJO3leSWg+HRBksVBIRFq3MiHDIvs46zZp3lgi5nwMV/wGZCh09Es
	 SfOJz3H3MKXwqc+UyMtNg6jFQMi3xSURb7L5iObkuohry7mtjNdQZL39FT8ZYeCrb0oL7
	 ZG21mxLoy1TJYFnGfjplgitHq0TD8w96I88SJYn2Z1D+ki85N28Bl7drbrwdKQRUVO7AE
	 UFgzgjHLb01ZkwD1hTgvXMULWpiiF+hnzlhApiXB7sSuk80mfOEL6zN+Rb/8bauECPlxD
	 xR40aZ8KTmmEdyUyi6dG0iHd/ufj30VPPnNn42yRaEvGSrSawfFqDPWkxaVHPb/FcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=;
	b=3oAE16BTafIF36yKBJ6K2QkJ9JG+75VdHIPTxhlywSVSHD9Wf9yh2psdLR8juHl65ODK
	 071Mtdgh+4p2/rISpId60XOOfT2hwKd7AtLDZ6+1UrAOYVo+fGlt4Kw0Of6r5fmkGJ42h
	 Ia5ItFvRhbakZvmMPgiXwhC57bjzhVCZkNscGG1lTZ1biyktnAgDg+X/SbjDaSC+jzmn2
	 KHF+vZzSQzy3DUescOpT6p3om+VY/1l74yQ5Tq92ZTu2XMvFrnM+8rxgbD62NSGwemoCp
	 JjMZMuoeOGJtswugN3yEGsG+DudU19cGg4KD3Yah9WAmoRFrcbTDESH2fctrUGC4cvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N9weUZMr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCbTEtvi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA982606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA982606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N9weUZMr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCbTEtvi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA4b01575152
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHq2L56t//wbyoO+11weOs
	kejxecAUIHbZU7bhxKdLc=; b=N9weUZMrBc3yK8X3ExRyuRwmah+yiMPm7GU4s4
	r+cK8x84bovh/jFQYKlkP9tzmuQ7r/SIYqplKE38v5Ai5MQ/a0T+Fc8VkMUeusCX
	2QdbMNrn4fyWdaf3qVpqKCAdy4SHvl1Yg4X8b4eWF4spL8AXOPfljHgGrDjm10BE
	wFtNjiiIpvU8XL/HepXHsVjCnWpzAyGDGw6Oj4ctkdVybzRDP5WYHqQ2a7cngSsp
	C+TFgZ4/2C1EH8pdnEiQyZA/g3tUvPh41/s2jG4K1UzYkXjMqRawOGZPoSfCt+S6
	kQMU2e6IhEyxYX3JshE/FklRQ733jhqCddA3tH4i2XDSJhog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2wab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:26:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so974815137.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506395; x=1793111195; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=;
        b=CCbTEtviezla96tC8rxfWVyQr8Whtqqn9vWklrQgWXfpezHAM8hkYcFhsto1BuTel6
         vOutBE8mmChMabzK4PWzLvqDl223nb7PWsQvcRvcyzvQLxmDzAsWpuAuV0zgdNLox29P
         nHmBiVRPOd7K852fDJkTJ/hOwys5Xs4BaP8b54NvY4KhysTCnNNTYuSI/ljp3tx2dYc8
         16Hhh3jNSCfkbeVlVWNtR3TX25e/zwIElg1XCPBDXR4ccncCTOIYcoEsvFIJDaBDdAF3
         543vsVPsbPJdV8Q4fJIRgjwEoTG9XcfLHZoDCLigpIeOayNt2l3AMRhe8Mr9iTxC4kKi
         5p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506395; x=1793111195;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=;
        b=OrwRBXmxpvMmjHnlpVRqz36iUVoxdXwaxHTu5hoWOSM6wyXriRG4e5xMfJJftW6zEZ
         cPYw9PnOmDGA9MZmI7JTy9wIJwyQdHWEX6hzuZL94mr+QfINzx5RKDjdwJuy0SPbl3H4
         3qupUFsYCF0n5HwVmHQajqTITHzjw68XHSIYrPzdv6tHZ8klBYdEwuBmqp/XX+EkaECO
         PdNuneMOo7/8VhpmPRfU5WpcVfli9mSrA5W4JocuWPemmIR8So34tRn22E3UCJdIgOBh
         W6IyUIRJQjCtAvbYqMpSyR6jfpunvic+9TsfDPAyL5kmW8WWyxXiUstpXhSs0/koBAWs
         6eow==
X-Forwarded-Encrypted: i=1; AKwUvBykhQ9X8OtFtWB7TYeSEre5gpYMDZ4i+HUj2cQbJkbXJRqXL7lBmZixqeiPlA4dBvmAD96EkDYBXXuaCdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsykCxCBB0HDgT7jy1pnhut7YPBukx4mBSgdQuCKDaHQhRTX21
	DmCO3BIGFDFOFQFV1/I9Vm7WTy6K6DdPyGbwHjWSTs2QQQ44iGj7NgAzhhVphdsTQ3mTfndl4p9
	rns3xa4B0V34qQkXhrpehFojTuxsLuWWP6ZNiJ5MKtiXov9LB9RpeaZ0jtiinfuicZew=
X-Gm-Gg: AYBFou0GrbOxj16PPDLkO30bfNRj58icrYDy72WS7kbSBPTPUzSH+rnvT6zoT5CDgAF
	UxPraymb61lPLo5oIoTTBqlpOqHqDDOckHFebera1AzOiSdZ4lmUh1aoTDE8HKmAGkW27gug5zP
	bJ4TuaUnDI3xbvIkoelCwkFuZpBQK0vwNoqndms6fMcF3JmF7an86AgBloCX+ZZ1mkbLBTXZe3x
	pR45A9ZaOFraB4dWLCcnizJ5YBUuLzYTbmXs+we0xknewNs+1iL2y/riiyb+GRPw+Wa0Yd22lpb
	skcv+iywozmaz9iUZ273HRJnwwrRasrz6Wjo+vHxBG9AFAqxGjw5/9fppEUTtXwzUypOnO/ugh5
	OQdaQjIDUvfsDVbgKHKOxZBdkhWj3wpwdkCE4UTTnKfemwNbUt+8zXvWR0cd1Y0OMjZNQSB8Tr5
	OZj8X96d37DJ1Gjrq7f5GUQK++/AmmmYcw6IFlagGfe6SJp5jM/xM=
X-Received: by 2002:a05:6102:e06:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7cc3691d1femr2646879137.12.1792506395038;
        Tue, 20 Oct 2026 07:26:35 -0700 (PDT)
X-Received: by 2002:a05:6102:e06:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7cc3691d1femr2646872137.12.1792506394517;
        Tue, 20 Oct 2026 07:26:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb8d5csm80483915e9.6.2026.10.20.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:26:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:26:30 +0200
Subject: [PATCH] cpuidle: psci: Do not log probe deferral as an error
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
Message-Id: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABV612oC/x3MQQqAIBBG4avErBN0koiuEi1Kf2sgLJQiiO6et
 PwW7z2UkQSZ+uqhhEuy7LHA1BW5dYoLlPhiYs2t0ayVO07xG5RHQFIWrensjMDcUGmOhCD3/xv
 G9/0Ab4IH7V8AAAA=
X-Change-ID: 20261020-cpuidle-defer-4e6184bef223
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: l8IDU5dAtVtMyIWiOg8Bjgj33mdasUXj
X-Proofpoint-ORIG-GUID: l8IDU5dAtVtMyIWiOg8Bjgj33mdasUXj
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad77a1b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kuKeJkFhgiUoOUCgA38A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXwoNQHGd3bilG
 QY+GVZUqvmysamUbrLm6gUQ6e9tCFvw07izr/z4ZmfiFCRqH+/zFMdHBvKzjFRtvAnv/xgUv1bb
 UYjXznFMbswEXET9hSA0SWfTpVud+wyJjzU5aYXx16OfLNG8Ty7BPX6PGQIhxvaUmpT7yEungzK
 o3EnhZ288/DHJcvaQUISGQtEuOFRXMI4dfFlJlxo9IiBa2QHs6+HFT6vMcVhLhbHz8ONI0lDhPu
 iD2SsoDgd9ezlFl1dYj+/Z/jVjMGmjwYsd5jS09n7H2b3vyOmpsBGXvBthbTzGMma8R2pWB7yJK
 vWlMTJ42WiazDhc7ddT79sYmcXy6vOukX0o8gjKl3p4tLxKSffVT1coIebLElt4JK/VVaNb0doE
 GdgAvByb9SmyZgNA8QxMvfCkojw97zdceEas8Apkhb+ohQKhOBUBbItOLPnY3inNwzAENRmE5h/
 vWGvJvzjkx5375IkXpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX4Wf7oGLz+ERR
 xKg/Say8q4qAgTCMpHfSB8X0Y8trcrFhZ40j18HabCme2b1aRA3cJt+ZQvpf9nunSuU9XDLg/8z
 8N8Oahujc5iUxgs5tDQ3WbdgyaYrY6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

psci_cpuidle_domain_probe() reports every failure with pr_err(),
including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
whenever a parent domain is not registered yet, which is a normal and
recoverable condition, so an otherwise successful boot still logs an
error:

  CPUidle PSCI: failed to create CPU PM domains ret=-517

Report the failure with dev_err_probe() instead, which downgrade
-EPROBE_DEFER to a debug message while still logging genuine errors.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607e058ba96132bad7 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	dt_idle_pd_remove_topology(np);
 	psci_pd_remove();
 exit:
-	pr_err("failed to create CPU PM domains ret=%d\n", ret);
-	return ret;
+	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
 }
 
 static struct platform_driver psci_cpuidle_domain_driver = {

---
base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
change-id: 20261020-cpuidle-defer-4e6184bef223

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

