Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0176340DA6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037468; cv=none; b=IRCyWOin84nDxdwdG3kWcfxxVxF8b1Qc0dot9F8mGlHqCLK4zyx06Dgf80mVY+74jCt+VOnN6k8g/MDLr54nOf41iC6pJlRt35lGgxmtVt3AITgttKkF7noQVzo+S7dREeIJGYOTpdZ8/BqIh+8HN6M5g82BfisrQCpJyo6BNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037468; c=relaxed/simple;
	bh=IDxHa/TQDVkoRWJAIG2dLfdXhjsjJ5M8j7M+zTqdjO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTdnG/JiCAL52f0APRjovsrSIxV/bVONUoNUD+rZRn69D4+aKBIj1zAKJBy7FgqhQ4DnEl3uP+AQxcjR/66pKDMvw55cAFIY0zLlScTI9O960YCVSEu+9nfkgsw+TGuugtVmxNxc81WsBtt1bCDHBzJEL4oXZM6GAO6Xv1vZgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzBWH51a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F54GG1oT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzBWH51a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F54GG1oT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E5usj3694120
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 14:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0zbsE0omg0TYg8XlU4yqOB
	v+Ij+j5rVhI0VbWrq7cDM=; b=MzBWH51aB1b4v71ZhF6iHdMvS8wyvf7D2bD2JJ
	p66iDUdHR1Sq4J6cu7JUvwDsDHThNIhkIauTvBW8ha0IxchX8Qgqj9ab93sZZmbp
	l8O2qaV87vD0UAmvMzH60AgM2z5x7LyLIIj+vrXZ1qRjHWkId62GfBAjid1c4XOZ
	nZ7vYEO1+VGG4pBDIcvUqyXv5IVcyqjl2v2oxIBqhcGhEaun4IQ7vuUU6XU/LrC5
	fnRzHgI3i+n89LNLZD6xvfMZmbJ2/5DyCv3BBSi8M68VFJBpemL9Ch6APsJi5iZL
	3C/z/J/YTrd8ghmMT3a2Vpvc4tO0Jnyoz3C6eEAOu5SGw99g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36h5re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:24:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so105093985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791037465; x=1791642265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zbsE0omg0TYg8XlU4yqOBv+Ij+j5rVhI0VbWrq7cDM=;
        b=F54GG1oTMgFfUOgo1L0Evct387edRnBjL2RS6pSNYWHRHqWt/YQpv4169DmYfTsHOD
         +fTvM+G+JBG1MjCvHAyjiVFfp+oJ7XoNCcTiDLM29opmIkraWP5S2P7KYd6Vnt4IL+A6
         g6aOmZ05fXLjEVNU9GXpb+YEgWdVSTeNXhzbGpWQDcmHElHhPzIOXygk0/bEUDYzNHsv
         11x4dY/6Y1c59Cxkk6aTD/AqEelHE4DO9AszEM9gj7msBCPyfjMNGwLZVbn7GMcr+8dm
         xjX0cUclihc54v81JbyGFdMpjGXIwKKwTzi8N+1OZGCK/g9GnEWtKV58GMN/Ec1HsiUA
         Oe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037465; x=1791642265;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zbsE0omg0TYg8XlU4yqOBv+Ij+j5rVhI0VbWrq7cDM=;
        b=IUXaI3FCbATvJwp6jtmUVUD2beFeIbRKf2X1nlh0j0UhgJww8laZIwkoYy4uDsigfJ
         pv5R0jrHbqU6qrP2wSQMIO1mbLpvIZbfTjJA1AF9QkRtxmvdJL5moyJl92YOLnaVk9P7
         gu0ikKNeqoYfz+UH4+y7x0ONR29qpURR6STmBPGDuacEmW44QsTaHYwkDpoxvoFPH4Pb
         PiwDt1pz79XL44JYAw2yxsZyt3lvEojTWGSNVIV7muB4L6LMZ90RJdfcypHtELmUvQlj
         KGqmS3fW2mN4P580IvGmyXWyeZeTsHt8MTHw6DFQYZ+Kw/EXZHUZyBQoz/SmpyE9u3s5
         H4vg==
X-Gm-Message-State: AFuF++m1BceORCdTOTb1eaUHXBIbGSTF8BRDHzWpOVbsMSwcsRPbqQLu
	Kx36u8Q9g8GhhjC7D0mfq7XdnedCQTUmmaSV9eOd1bY7ITV3JfmeEpJFxukG0tRk8nP6v+sQXz1
	XY8IOm3gDmpo3dDjnzgFhbhJz6HvtWmkjbzxkTI0LjiGLNkszHNjYAVsE0tjuNs1GGSelY7PLbr
	ZxLg==
X-Gm-Gg: AYBFou3/SeoWyr53UM3Ku65eqH/n/iQbetV0miIAeVBmSrHGH6pWLbNymAKH6XB1UPQ
	tZL2HQ7j14P5iLPAF7b8BrtR7xXKYu7OW6Q5HusUrxTl/4/CeSofUX58x6Sbllsg+3URLjeHMsR
	4aDu5bUY8rUHZGLDkChzweYWSkt+pnxmYrqOY2UJJ/ejOWwRj8Zl20yMLZZxpw5pIz347/tfI2c
	r7lAMeAH+YK3lUhM0wh2EtuLhXY13cWAurvRE9Udnyyi1nB3GqTlF4ZfQnfAR1IMtAsdqtbxk3D
	pvXHrqurx74UO+m/NAe9LlW75sqyTWUMzH3oHt3I5s2GuybBa2lTZ3kBqtBW8FZ4drMZ0wQZg+K
	9pcy4XTWL7k3V9lFSDhlPQXR+ZEdwMnfkIzyJmht64Tx/vg==
X-Received: by 2002:a05:620a:2b47:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93e50fe9f3amr495619585a.23.1791037465065;
        Sat, 03 Oct 2026 07:24:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93e50fe9f3amr495616185a.23.1791037464617;
        Sat, 03 Oct 2026 07:24:24 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e614cc508sm154549966b.38.2026.10.03.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:24:23 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:24:21 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE QTEE update for v7.4
Message-ID: <20261003142421.GA928135@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX1WfIDgZvmdmW
 +70Drg9+8U2whAch7+Gst7nvc2iJRULSQNBAQxT0AxCB1Mx/bZ3E4JHr1BNYj27O8ckYzZ/ok+c
 YQOCEcCnvixDSMBCilokuY6FQ5c0nrw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX09FyEx5P+yvp
 5a1M/5QMVzf+1Cg7hIQ1BgyIUjDXu4o5T4JmDOrTL2Q0OTQURQNsrwuV333Z7HDCDOx+kvBg+Fm
 Mu0Np/ZV7I87FOYSw75G0IzJlu/I90mk3TqzFyMWMbAQIFoHmDyNH69zk6zLtRTDESPJ0fJx0Qn
 GKZhiY54R5vIV6BTazoTO6JEhfxkXgweTECnXgpbmBU0nVLnbwzb91FEORhzmHAAnhhSHL1YPPn
 n6U9JlD/Fg9oncRsUAB18Yiwpv7pSBvpNRaRV6TmoUOmTE6hjg1UaZfKftku2kvT/sOa3O0bG8l
 5YfemGvTHiSA4HUHcjwLOjVAcylaA0/jxxcQLIP7YVj+mzDa7pqdbkSIjuLguBDgK5QQn8azMbW
 FEp9N0ebnEsshpL42PbQ6U6hlaVFcVQTP8RAcWEH/FMPmat4oS+F3wR+Mxm3C1uFMyN5nMgCLs6
 jSP+CWAxj39U6irhE+A==
X-Proofpoint-ORIG-GUID: zoCPAJvQeoi1drHdMWbpoGnvpBhVT-fS
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac11019 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zoCPAJvQeoi1drHdMWbpoGnvpBhVT-fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030057

Hello soc maintainers,

Please pull this small patch for the QTEE driver in TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-for-v7.4

for you to fetch changes up to 615970476444bdf853c7c3ecdbe809dbdca06c16:

  tee: qcomtee: Drop unused assignment of platform_device_id driver data (2026-09-16 10:38:46 +0200)

----------------------------------------------------------------
Drop unused assignment of platform_device_id driver data

----------------------------------------------------------------
Uwe Kleine-König (The Capable Hub) (1):
      tee: qcomtee: Drop unused assignment of platform_device_id driver data

 drivers/tee/qcomtee/call.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
