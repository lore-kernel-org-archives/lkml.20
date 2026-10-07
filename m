Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51546D09F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365062; cv=none; b=S8WGkrH+znqMG+pVbWWTzOv7rh+L3hmuylpr+KY9+Zbqcn7zhi4QhySDNQ6NMIetArZiRcGbY5tpz85QQ6NYAnIwMt9AkIt8U3bBVhpEhMjLL417/ouWWzR6Rlf+k0VJwliBI7F0OPIcGIbFYNLW5EJABIzcVxSKwbPdrGvddMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365062; c=relaxed/simple;
	bh=czGHphqBgYs6gHPwviv5ySMy2P74dcbu3/abDIc9XP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ktjLec+RH8RiDCoVp6DzmM6/mKe0ffZYyfDQZZrtUFwl2PnbbR2kM6PBxm9g05h8rse0CcVxUD6Jw2qWU8ybbtme6FdVWrgzOI53VcLot/aBoAlqlwV2gcLAIZY0SnNGZE7mLnKB8Kohk0IV+uALnnzwwxJ4DsfRkl8jZnPDveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRDbbty8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWbDzoBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRDbbty8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWbDzoBD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmsD3686155
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ynqDIYHMa1ewQNzuLLg6pW
	Nb0JVIGJCGjVJeZk61aoc=; b=XRDbbty8qiLC+1OwApa1LDFNUQRaF55Kh9b5iS
	ThVcYwBxYB8OyH4UP8PumcCA/89eQaz9MHBL62xxvAs2yw0t2wO8njY99/acEMNN
	ELdQ3Lx2Ph/MyA0/oX+y+2YPxUrkKAE52KwU+LcJ7CwcjTFm8RMqoeyRoUvYL+mp
	Vsurp5lGLIy+FVmUbLS/rAppoueXS/OUJioP5ZUaR7IqAPibXcAxam6KAqLO2MIo
	qG7ftysMe1cIqkPhIHXnvqgC4frpzv6c60shWwQoz6Q3O8dJpHs5xPIV0l343snM
	ySDFPSKPGsNzNakQQeAuIWOUOdvoB6WOoq9vP8o1CZP13irg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609eyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:23:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887c99013edso2760243b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365032; x=1791969832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ynqDIYHMa1ewQNzuLLg6pWNb0JVIGJCGjVJeZk61aoc=;
        b=AWbDzoBDxmKDRMvSKK4Gwt31t8Zl5ArjNos4eFnflvL/rmsmVDBcjDoZR9vrQO6mAi
         RyiIO1PuwlnY83P8k5DlUVb8fY6Z2b14niPvtrH2p12vxd7BkYdDH5gSKXiMEzEQEpu1
         6DNaLVwGVB2Dg2LtrQEHJNP08fdIo3Bm4nOs0xe6PqiWK3zgUBZCc984TvYLe0ZWnUvM
         7G4flK2AzejYCHFptm82q1XubYlYukvS/yZmr4pV+Kr70lP9c/YSOOG2gLGedPDVxRQf
         epfJoGK6W/Fe9h6zNxwlxSmshlnfchMLgO6Y4vF3+BgZ6J44Yl00EQqFI6gKUj2tsRi7
         OtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365032; x=1791969832;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynqDIYHMa1ewQNzuLLg6pWNb0JVIGJCGjVJeZk61aoc=;
        b=MBxgJG+A8TFJ7pUtkA2ikusu0N+QLaLvTvhiS8GcJ7qrzw+YlZpMYTjhCZjUr4MUDs
         cC5RR1pN/dv016daR8Z9EoRjqNPXsLYRXq3+MxS98KuwOaIaroer9McTC9tg75FLFxoG
         SSWkO4k2PweZSlTP9vz09C1ZdRzyob2SMktJ4qb7G3tjEsRgnueiDPJiPJAmtPq5hSQF
         aekW+dogiQ0j5MXNR9YfOZB8tIM5JFOutmi04F6s1JgpzJgkdSpOz+uqPJ8Hj9EQpX5+
         6PGJVSj31R2PPe8I3pyExaN2wPqvlOpA/8ybL434fi67UNfLHcPf8zdOGdkYr1gqawKK
         /Cgg==
X-Forwarded-Encrypted: i=1; AKwUvBw/ITWByJu3+Z3I8LcpAfZw8UdjdbWUOnpAeohkYMX524Bz34u7daJXp+j3iABEgKlClyccbG4Le3sRvlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIhufMyBL5Wx9+VIQv0ivfVYL2gluBml7m6UipQgTymf+DcfqT
	HWXFX0PGuCRWJCPnrsWIe3bQEoYNu8e1WQHdLnui+Fh6+IvhqOBd+BJhw4nc4ICshZWfziUE4qJ
	ArH6+YQ9gcVX2cxfag33bqV28bhhdfx4afgjtzl6ei+idfJPLfuaPecUrUI2k6/1LKS0=
X-Gm-Gg: AYBFou0KoPM7LBdT7yGWrLJVqWOYnQnz95rI7/rQDhnUw6T1V7moZBgjeXs388gwbO2
	1Q3RVc/jMNfor7C+5ktmOlg5b4c8C5pJ0a/3kjbq9n1QhKjV4lFjkzIE9K72dYgVq8rKg1I9uaR
	/f3HEK99iZpu8QGkSKn7mEVhlCezgWP1NYg4QBFaDrnujIa291xbL/4+yyD/R/XrrV8Wc8Onfh+
	QvBK9Yamw1VoM3I8rsHqP+UTi/OHC5VKMa0JKNIAiT5QBYlnXGLHTSCpmb3G2OLLEj12zrwKU/m
	3RWBLX/TUS0JBgSm2HLxiQWzc9qd3vZpGvmV7vdhnvb9NUuasWWYyH2HDWNI3npmrC7Wr5vHVGZ
	VuY0jQR6JjOjWECZOP+6BG3LFhNxSAHONFKuWHJ4xRWcGKpn7Nfg0d6sj3iGhdXcLAvUikMrX10
	ZjVEH7B7Z4MePSDP15yR34Iuc=
X-Received: by 2002:a05:6a00:2d23:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-891b4fd5adcmr1424245b3a.48.1791365032498;
        Wed, 07 Oct 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d23:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-891b4fd5adcmr1424232b3a.48.1791365032065;
        Wed, 07 Oct 2026 02:23:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89271257af8sm119128b3a.41.2026.10.07.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:23:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
Date: Wed, 07 Oct 2026 14:53:31 +0530
Message-Id: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMPxmoC/yWMUQrCMBAFr1Let4GkaEu9iohs061dwRiy0RZK7
 26sn8MMs0I5CSvO1YrEH1F5hQLuUMFPFO5sZCiM2taNs7Y1zxhvsxqyRzec/Ei+I5Q4Jh5l2Uc
 XUJ5M4CXj+jf67h/s8++DbfsC56svrXQAAAA=
X-Change-ID: 20261007-mpp_ws-a041d5cfac9a
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: -Zfj-R53iVJTluqxAnfq092PWk2-qut9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXwEponLgedOAe
 WuenrevGimBdXBwHMYSgy/1nu8pL8hd8w+piHGM30m2qxA1rHbcGIyPOMvL6HAEBtHIDFn5a/S4
 x4v9xX6ow9lOGarJrpagqFrnuY7h6Kk=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac60fa9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PwSPXMvPeXUFY5uDVUIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -Zfj-R53iVJTluqxAnfq092PWk2-qut9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX82jcrJ7e/kuO
 wx3pCuNRBS6ODHu5cxlgAWy9m/o6QKh+riUqbjSWJvakCRGZQWgDapetruCWfKiHKTvgOanP3yw
 TiAMa3S2NxlYXEGCe8XgkZf6hjSvq6B5Q6Df+5BLt7DV2YrCCk/TSrUhrd6GzQJwFOiTFh5LpnS
 H/Zlr/Bnh4kR4KMfqyTzZlUVXw9c99GXqiMAXDHvnPtrAm9sT7p4knvfq2JCA4P9Ft1cK5mS6n+
 b2pPmDWnSC0b5TjdW/dseeFcemopd6C/3UmZRt854E1tiEq+TzfNfoOJtwMuZZQ6wpUcOFbZHFk
 5peZKFW+ZntRprYbCNj29FOlLvCDFClefCfwZsEIE9thVMrMuLn0mXHn3Imcz4qbHA1iHDR6e4d
 e7AdQSdPNdATsgqbRzAZyOnv2aUU7Ai9saHJ00QwfHKg07IeivL2GfOlhcJUVBWnJaS+KDxJgyv
 5cJnYb5Bu+RODl/TGvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070037

The RXDMA buffer ring size is currently hardcoded and shared across all
memory profiles. This makes it difficult to tune the ring size based on
the requirements of individual profiles.

This series first makes the RXDMA buffer ring size configurable through
the memory profile configuration and then increases the ring size for
the default profile to improve RX traffic handling.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
Aaradhana Sahu (1):
      wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile

Pavankumar Nandeshwar (1):
      wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
 
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: a90ebf2176db07c5d91e0a62e15ded1fd50710a0
change-id: 20261007-mpp_ws-a041d5cfac9a

