Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4745D90F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450012; cv=none; b=lrjaG3xCXnfu3QfZngneP26QRUC+q5RbYPv/mgxEMv7/nbAy9WQw/GEItxnuvyLtuDaGHnAMIBA0g+Oghn3kaRQ7Lw6Efttd84H2++uTytuHQx8FIIFvZF1dmnxP5xPJJBrDj2Q+ofg/uSsXo/RRrzMq43vk8rTXLj4PCw/EB+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450012; c=relaxed/simple;
	bh=4x7HE79cFZQUKfInz2EKubKlaRMHEHpLNZq9l2ahRYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2d08TvRaaqO6EXX4WzqLR6hEdNbPjBHjSAbA77rdUcj0P33YM9mGqJVf5ph6gAchrNkBLBrJUIAzU7M4d9JWw1IKX2YITM2xert308q9CqJAD64O3WBKzkCH0IAQ8jm8Q6rQtCX5maG+nEYwKSxRaDP4CFWwhHG3facGwfZWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMvDNhPt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6sLc7Vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMvDNhPt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6sLc7Vk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9XE2560086
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BtR6BRtJ9WsZm/mP+S6YJ2rqRG2pR0lL3Ti
	aauEbcQs=; b=BMvDNhPtXwKnyAnHlB9IjaPYNVpOiQjk6jrShEPVuxhpUovEPrp
	1rcpUTBoxpx6PXqZaEKXdWwEShQnPlAe7ZNz2tLcNZH0ShVfcF5dtR8xymPfYDND
	Gaci4yMvDCYGuCSWLFRKNlqn98/KeN9RVPGUJolZkdKquWL9IgvRcrqCrl32OMoa
	z818Rr7zLknwipyWUvc0WCdusWCLqwikicdxDOpQVQFGSq+3ivvlxYXa5yAhSK/Y
	nkHj/TuxScSQAlAuiA0EtRrpRLZeuGPJbKw4bkdK7N5kfD0tTU7UL/nVunK/Ng/e
	lyr8tJSKWSpCCdd9N5NRXDhrGwQtjbqj4tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe820ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:00:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so1094749385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450008; x=1792054808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtR6BRtJ9WsZm/mP+S6YJ2rqRG2pR0lL3TiaauEbcQs=;
        b=P6sLc7VkKQG9YnJGm1GxY+PGWp/1Ldp60ZbPIc830g9KSDYoZRU4H/kJ0kGbThD+Qr
         de3VekBIalE6Fy6hDtOq0wLvTfY7g4ZwfeY/8xYWtU1qUCov7k3Vm0ZKlndkeKAqVu5j
         GCzsfSblb4zKRY1XkFINIdDrwm8FEAd2BD/DHoyvpcR3EeahkSio/yLO1RqTnhnIn7UH
         hIsSCPahCV94Bus/b4lqfqD5GmDaqwPE5G/Bw9FF1DZZCaefM8/djc23YpX6vtYUlsFo
         YLr/wenZFNiBqj0PJV46apcMGc1clqOf0sA/kO4Z7DAgsAg25FAitb5Q2gMpCSV4ATWx
         /0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450008; x=1792054808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtR6BRtJ9WsZm/mP+S6YJ2rqRG2pR0lL3TiaauEbcQs=;
        b=TUDn3qX3C4x+I/9KTJQCpkpTpbrnPFZ94ErR6ixOyEKzOANWRRLi5ZZNTjWpCuob/Y
         mNLKXcMaQfYG5kWnS/wd8l+uAxOUAcj8g4Nlcw6cEaLzx2BlK0s742BpMhT5/Jvr0EMt
         cy0J2IccXE/x4a7n5A88FEkUYb5sbls3RIdpv40qrAeODllmK4aSrqTxVarkF0qgiJgW
         FFm3QqARxFzxOI7Sq+wglXZQICozRej/e5CqTm8fDl17e9BVdIRNzuB0ih/V+lSgLnav
         YsvW867rtJCcpYczfrBJgRpK/0aEs7IBoWLGCcztRiRVgccPvhhwHOyN4rNYHaL9GqXL
         OREw==
X-Forwarded-Encrypted: i=1; AKwUvBwCdPCWgm11rkgEqy6hsPdOOtG/BHb+APF78jcRK6R041xe0BRhAmUdrFClPyASPpt2pD18+4jHcDwwaEM=@vger.kernel.org
X-Gm-Message-State: AFuF++kv2rpq/UfqxFQWyJwpBPMRE8ayrpZkIAsgMwzcRyeQYuSht1v3
	xksNvWu4y/tQow4nhkLG8I9prMdGRsjAgwp3vkA9GgmmVQ1QKtjI9cSQODA1bxPTpVHTRcYwY/K
	QTc5t6DiXDz6WqXjBjC+PPjxIQ7ZTTdcVf/yGTiAifMSw2VnrntXlRCS9wsf0LZnq0u0=
X-Gm-Gg: AYBFou3iEyY67sV9UNrs1V9Qoey4P0fCV0Cly0aKQshhxC49XmUMy8bFUWhQuKGqkKR
	BMSDF4BleRGMGJzhEydirU47v/pjNY9o6c2vcZgLujZJ2RZ4l56BW+tHrDLI3oeZcIdSuvEnY6r
	9sEz8d0+wE1xpsuLfLz28w/WlNzQNd5CWuQMJye8wZFgZ/E8mN1PQT6Y+Tj8EFnFxf2DHAP1Rdh
	g5oJsfuPevoDxgWUA1/B+jdPCq18SmxlrerfyzHeb7ZfUoI2yPa39lZhDytwjTXcimWSBkH2108
	K0hFdh+6lpxyDFprYY6+lBGcWzWQyHn3jYfPmDVaWkj4EndcDqRNGAdbMWRnw5gXBkN0KRQ0NFe
	JNKl11b4NtTnXLevzmyaT4cRkZiXAtKr/JrjQlshMU7z5Dg==
X-Received: by 2002:a05:620a:1999:b0:93e:9809:275 with SMTP id af79cd13be357-93e9b88431cmr868049685a.77.1791450007871;
        Thu, 08 Oct 2026 02:00:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1999:b0:93e:9809:275 with SMTP id af79cd13be357-93e9b88431cmr868044885a.77.1791450007218;
        Thu, 08 Oct 2026 02:00:07 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1272esm10168981f8f.27.2026.10.08.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:00:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] power sequencing fixes for v7.3-rc7
Date: Thu,  8 Oct 2026 11:00:02 +0200
Message-ID: <20261008090002.5062-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX5mRGnNMZnJ1N
 F/+8WcKi++pXoJF1MKEybULOJGQiIoGGJaVyeFn38z88uY5aVdOdo9x+6mGc3gvVkPWhWdsN8M+
 euZH7q4Ea+IclXm+6o7sakB5yWpZJbhU9+pIvMDMqv0WULFLJkVHEiVjgdJ5K4bC0U9/s+gRMoF
 /0Q6GjLdJtjKI+Fx/Smhe8w7pMhKKhPXUi+O3FiW0MwNCB0azsIFgger1H1RvovQMiK71Nt5aOS
 i/hZkCxq+xNkj53Ibgjw6IYzFeEaaoOK9XjjNcRAdPdz6wM01Y3WAni0exfXFxanZFJzv0AJS2w
 g8j71nZ1Sd+TJqqewzhpD+cC8vkpktm8dHBZCGeJyBOG1o/7Z9+BhruaTxD/kFfnEPTLDxdJSje
 Ptw/IoBnvEH/W3F5Ureq30vv/tmwgDmK/1adEh5ug/7aKm9TxQdBdyOkZZrlkJDGsVIx1ihHV2H
 tG/EXSZQfbtyPH4F1Og==
X-Proofpoint-GUID: xZ_HUFg8cwCKy9zi-gx-kwCIc7L0jq6S
X-Proofpoint-ORIG-GUID: xZ_HUFg8cwCKy9zi-gx-kwCIc7L0jq6S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX4vPxb+Xy7o9V
 dMv7TrXj/VLeA5R33Wv95gk/ZBheNaLaunzGqhRIO3iYlKp6GyN6Cf2ucdcsBu9/ZAqQsdyE1Xs
 t4AIYLDMhAn7vK8hqUny0npZdmaTwNQ=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac75b98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=-aGbykG2G_iJnsAG-6EA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080035

Linus,

Please pull the following set of power sequencing driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq-fixes-for-v7.3-rc7

for you to fetch changes up to 0d6c5794fd633427f0d4ad8b51d94061295649da:

  power: sequencing: pcie-m2: Fix leaking array from of_regulator_bulk_get_all() (2026-10-01 09:51:59 +0200)

----------------------------------------------------------------
power sequencing fixes for v7.3-rc7

- add missing PCI device IDs for Thinkpad T14s gen6 which should have
  been part of commit a39ac4651e3b ("power: sequencing: pcie-m2: Match WCN6855
  and WCN7851 UART BT variants by subdevice ID") in pwrseq-pcie-m2
- fix memory leak in pwrseq-pcie-m2 (leaking the array returned by
  of_regulator_bulk_get_all())

----------------------------------------------------------------
Alexey Charkov (1):
      power: sequencing: pcie-m2: Fix leaking array from of_regulator_bulk_get_all()

Hans de Goede (1):
      power: sequencing: pcie-m2: Add Lenovo ThinkPad T14s gen6 WCN7850 subsystem PCI ids

 drivers/power/sequencing/pwrseq-pcie-m2.c | 4 ++++
 1 file changed, 4 insertions(+)
