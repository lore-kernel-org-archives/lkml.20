Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC893DD873
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509543; cv=none; b=qcO8i2Ydbs85xTzwy9KnYsIr1YreK+DxDx84dUZZ+H/ZbWHNSUa4dsQxwrXtQWO3Od+NnCZAeJoyjlXmsQRRGJ524bLKxJwGmnUJyGO4HSWknLVjxTfFSM5wwdQ6/X1fcQkbUPf/a6xTB8722/8+urE3ifAz5izntXBAOYldf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509543; c=relaxed/simple;
	bh=ji+1+eoWr7g3B/Fu80eL2dpRSbi+oZVwM3gbBGOFmIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kx5d8YWVfnE7IKRwT+gaPVhSyE3zwySiKnk3mwNbIVhFDi/t8mBs753CPhIzQh7kTIkpFlx9AcRxceZgT6apBLjPWmYEsOAvblPyETpOEfV4HB1Ue013W4VsbH7sE9OL4BWSuKVDvHTAwXFmmw/PRQXvCACDeMn6fxgTImH9OII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3ySIlDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV36WcT+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3ySIlDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TV36WcT+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mv1V2430383
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABU
	zx83Oli4=; b=i3ySIlDmBdIx4usUIXvLrhWx/UIFqrKhGJXQ6pmL0KwGFP6HjUz
	z5+1xGXwvsgk0kGhZOjgjFR4BqLUeruKkZ0G2Vr6dfAQt3cla8IrPamp6a6I8ms4
	OB049DsQ6VZxyphRrGThr8NjFf1oQuZq/0EaZVQ9ZMWIRnSUoLae2wcEM+ZZ6EbA
	Hs2nW4VqeuZdOVjj6PwxjMsc7JCP5Wl1V/i65dxOO/6BAf+zYwiVAczE7f/IbXcv
	/GcHzUBBY3FG0gV3RUu+TPb20lr33mkCpWj3L9TX9xnlmslrj9yEQP7sANbluvK/
	+qCnS40Mbwrt+feNvenI5pgqWcBAkdDsywA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921b3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:12:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91030f96c70so9625876d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509539; x=1789114339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABUzx83Oli4=;
        b=TV36WcT+AEPsvX/oked2aUkrsi/4eNWnbEW+xINUJ9k7g+WDeZ0C4pqDczl7SfCd1e
         AaC2r59jyTIoj83jpAwMku3cHbdWp5d6TobWLptmAnm0ib5juDPTbEWar+bor80ammpL
         /IjEq9VMjnbyU0pqWboQWKas5G6SFY1KaqPWrxzsjVLrH6WO4oOhGs4GnT1ItJLpK1fs
         8N0OkCVrf6LNLRbv8wSvsNLrhp9JGAR0MmKkLUjW9jl5ekUTUP990WV9Van5qARtrmjE
         mAuoS5V6VIL+BjxqwjYCoDn2ZAc2FJb+7fnlHTMsHb54YYSFTznrN03bw5CA2HeP2qr6
         eKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509539; x=1789114339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYOgoHy9wmPlB6HPGaAQVHVyL9xOfEZSABUzx83Oli4=;
        b=WJfFClsMWmxtV4ug8hAVN46JS4rF8s3KMmI7PHXUVV2YsGAiJLaA1pgVhVXO1HSYCp
         x7eBFHMGNA9wRzxMmOXfeYl7VTyf8agqeI3KiNEQmjA0cnlYIvTQqENAG9Svmk/9iZVt
         evy00PDXqDNR9eaHzbrXuXvrnC/mOe5ExUnN3mEsoDDdI36ji7MVqYH4JrJq2QEaZx7o
         peKtojbLoZU4RsgX2OVFwN8PjT9IssR5SKxPfMoHkKNn/DkCzYwY/p3k/E9ZiscW7Qai
         8aSJ1uNw2+Njc/xI1RBtrEISciUWHSo7VNsQVucuGTUTNLi526B1ZIglSs57UjLcr4PR
         rNlg==
X-Forwarded-Encrypted: i=1; AKwUvBw+Nags4G3CwdDCVb9GzZPuUyr+oOTdfsKSEyE1cgSl8vs6BrGaw6DLiZmYCdcqIYbkN8vbg0fWFteYChA=@vger.kernel.org
X-Gm-Message-State: AFuF++nbJYoabyaM0rjNzlOsWh6kt34+bEpmgeAvd14F2ceBxVxOGbQE
	O1vHD5XIER8Lh8lof3M8xYbNmX1+L92DDzyV47+BqKkrkb//8ib6w7WhesS9G+4AXnSvY27ZwU6
	KvEHovHjqqzgge+fRBq5KC9/6UUD2i7KwXrO40rm16zkXkK/8Is11rX37ckdXuhlwIQE=
X-Gm-Gg: AYBFou2nxSxIVA9Cz3+pmNbxP6/A2QiYN/mwGQdSuiXSUMxMlkXN0jf7NKTGDE89du+
	YSM/TTmBvefBm5iH93Z7T7/QgX+NeN2hvLSNeONKpWhS9dOnXAWtab5/fK9LABbZG3L0pjvqufE
	j4TfV6jvJKoH/5bIh2uQuNxWaUtOLL7gpYRq6ThXdP5/PgFxYsDEfGRUqwde6ENWD1QqfbGBupk
	zk7gBU7ipM6HEkN3GUWgm2+b/+0nKHwhlGGvfyZH0HMmVK2b4sVf4nJrw5XYtqNDcLqhEbnU/Fa
	GJhKSjj6G2wu7so5LrpY2osw6p2HZVRuGhup3yri6m4lW/Win2AgcVw6J9O146k2adpxMMfLASD
	yrIgUOq5Qc8/l/VJucplE6+k1DDP2x8syGqOFVF+5O8lipB5t/gY4tz4Bag==
X-Received: by 2002:a05:620a:290a:b0:939:ca4:4d5f with SMTP id af79cd13be357-939803240c2mr425009685a.5.1788509538968;
        Fri, 04 Sep 2026 01:12:18 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:939:ca4:4d5f with SMTP id af79cd13be357-939803240c2mr425005885a.5.1788509538469;
        Fri, 04 Sep 2026 01:12:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm71610666b.15.2026.09.04.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:12:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle fixes for v7.3-rc2
Date: Fri,  4 Sep 2026 10:12:15 +0200
Message-ID: <20260904081215.215528-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfXyZg170TQM/Bb
 fA7BIFi8kxgIvPAL+7Tavo7VON4yQtBiLhPY/rdR+P71th72v+NOqYxuRZ+j7osIV21bVGTzKgd
 9W2JVh23R9TBPEQ5BhvbaeE+OMa181iIhwTeEltf8o/0uNYRcIluZPXYCqWj8yWA0PSa+D0iU4O
 0nOwy7iGvDi2E/cSR/I3TIwhyX/czBCaeiV/4SsmLJmQIbkquLpXnDavJpYMQN1F9otxuR5A5k7
 jlpEHFVcK6B+peV9zn0bPR68peV5qb69fn1k4QAgPLprIKOrHnQXqtaza2hr1LfT5nG0SQ2qw2o
 YSlZRdDT4rgRNw9tB+8YY8hhtH5TXQSeO7UG9KzTVY/n017v4NDDYiRe3+v9P/hLIBLotfkBk4U
 mcFPdocfCZalv25YSAotO0iqjCg89OWRc6k+56WyKY/S85h5UOdfCYsJaaTsHUvPP7J4VBhMom1
 B0DLDodPofjWIdEAlSQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a7d63 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=mg6DjbED1CunOJUx780A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: rvpB3fchHuGq1Hjzmu1MFoW_Ciadp9Qx
X-Proofpoint-GUID: rvpB3fchHuGq1Hjzmu1MFoW_Ciadp9Qx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX7+wuU6ZsGpzN
 NCd6q/yMVrT2xmxtgQVAHp53VHbPgfmevRMtAhw5HpX3sVN4U9oJNnWuoZniJCg87Q/DQ3bwmK0
 lUVgzY3DP/iY5ohHvyQXpQMnBRQ8pqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

Hi Linus,

Here's a pull-request with a couple of pmdomain and cpuidle fixes intended for
v7.3-rc2. Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc1

for you to fetch changes up to 2b0ac85512b7f67479127b2713254490662eb13d:

  cpuidle: dt_idle_genpd: kfree() the original name allocation (2026-09-01 17:28:56 +0200)

----------------------------------------------------------------
pmdomain providers:
 - mediatek: Fix Kconfig for Airoha power domains
 - qcom: Revert adding the missing power domains for Eliza

cpuidle:
 - psci: Fix support for probe deferral by dropping the faux device
 - dt_idle_genpd: Free the original name allocation

----------------------------------------------------------------
Abel Vesa (1):
      Revert "pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power domains for Eliza"

Christian Marangi (1):
      pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig

Linkai Gong (1):
      cpuidle: dt_idle_genpd: kfree() the original name allocation

Ulf Hansson (1):
      cpuidle: psci: Fix support for probe deferral by dropping the faux device

 drivers/cpuidle/cpuidle-psci.c    | 42 +++++++++++++++------------------------
 drivers/cpuidle/dt_idle_genpd.c   |  3 +--
 drivers/pmdomain/mediatek/Kconfig |  5 +++--
 drivers/pmdomain/qcom/rpmhpd.c    |  4 ----
 4 files changed, 20 insertions(+), 34 deletions(-)
