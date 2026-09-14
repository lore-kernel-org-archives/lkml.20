Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47817BCA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344220; cv=none; b=QtB7AkmhvFHjyNO1/1JjdoS4WHGhKYghqspt835+HnfDV5UuBkG5i31im6fk9w6noetHHgcARnBOOfzEBQJgv33HOfw8Uhl2J72/3s4S0oFXnQit1GfiqGKwD0dw4Imlq28fyUhBOfrFOMY+p34W7oS/YEI4w23uepfHXo7FNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344220; c=relaxed/simple;
	bh=OGD1TNkSOwBr1B9et/VubXRxEUrkia2Ij71PDKyP+CM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CSnr5v2idc9ESxr431eszHcJJvPu165zbyw6hDEpHzgU5X/kJgrGm3fVAcfIIQgaie8di42iYHAmyCY7GWEz6/+E7CdAb9XzEJcs+YEG9HLdMQlPeGOyCpH65b9CTRufkyZWu6l2+jBqhImded/slo8wcECLSDoRfzvdjJBHtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=QKkZgBnx; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=oJarUBPG; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="QKkZgBnx";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="oJarUBPG"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DMYx6v434388
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=su0eIYIxXWYmEoMLuLyzaQN4bD
	wmzz65OiZLQZEIHSI=; b=QKkZgBnx+yQlH4szLgHouY/WFb/SblZI/FS2ju+M8R
	C2Ir6QhYlLgLm9jkyIxtXljXkJDjG2/wgOLZd7RqqvApaQFEc+fG/jwXM4VDqVCI
	BboWyT717M9S8gQbOU7MmIskrUy3E8Be25hQP/av5exRJGq4vutVYysvcQUfrqoC
	ZYM0wlXnLENIas0tAuA1xAmGbW6PcF21BW10Z3UjJEFcCNLXRYH/a8X+j11g3uLn
	1Csbmaf1Wg1ukwVv3ozozpTZ8EwC2vHVXv1+kDqEiVo4z/VqPBsVI38X+axJzFVr
	XZkfdOf3Y7VoN4+bvlAJ/K2KNN5VFltSuDp8WUr/6dyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gnyfg1jb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:03:37 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91043af01d9so53735156d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789344217; x=1789949017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=su0eIYIxXWYmEoMLuLyzaQN4bDwmzz65OiZLQZEIHSI=;
        b=oJarUBPG8yjQVysPOFkhA0mUgZwf4msRAmrtfNLRrxKafhHaT4ajcelr0LMBwG7ym6
         WYi2E6b6kYEpciOAOOST9wVLxNoh95WQV5DCo4ILzMhfmlfVvKKszWRrNPWIz/XBv13B
         zMDMtgHlFPrTfr4PklD4DV3m9NcQyM+OL8NdlgD0hV8E7Pb64auVp77TJ4PfPq9kH2tY
         /L2eRWpC7MFp6dzISr2O8nkHRiOcBmFxnd2zcws7Ijrb9YJDEvOgLMDYhvMDzRcI3qvN
         lgjqyrZhpAFi7c3qwHxNN7GnEemiWzI/f42hkai9fgZzkkfNjhxi7/sQ57VLXprnh2mq
         meSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344217; x=1789949017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=su0eIYIxXWYmEoMLuLyzaQN4bDwmzz65OiZLQZEIHSI=;
        b=lllFCNYeUqMFcSScclUVQ2e53FcEiU4W90Y12tv8dGvIUCnowSsJvwEM/R7LkybBoD
         mksU5JTMauM+VEfN3T6VmkoTQrgEk0fozW9ZROWbcUrjeI5TgRJqJ8rN9haeNC9QpTtx
         bB5MajQ0xECzS/XPDuoyTco7uP07v9LmerVrPwsPspp3ZYgolZZSPx7KZt39YCocyiRV
         khcKSY7cfl1bYt9pj5KvKJIBppai9q/NeSgFqEY1fOWcixv927NbaRokxKsDLYxQqajd
         QhNZKcc8GlavWE3Huoj0tt2FKET3C9bIRerYHoRSZPgTb5sY030opelvMCCKpd8TH01Q
         NKzA==
X-Forwarded-Encrypted: i=1; AKwUvBwMc9D+jIH4wDqae8or3q3iwxPKudEwC1BIk/x4lhW4c5oBnHebXujn+jCvgzqtO5XFk7VY2LepbbPisHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lNqR5LvOpO4Qv5mxdfl1nm5Klt4Pid+Ytb4K96g1dTAx06hLwZ
	W2WYA8WBX6EW/3A4+3e1ZyzhNPV6ixTY3feUxevZtsPXhshazxakLm6V22VQqE+tlX0AgHedzRv
	LhmgDm4y7uqX9yjjKrg5xHsci/18kj2yto7G+NWtRf5Ln6E/P6Y3hy3TcCa3b3Vw6c6qQ7Q+f
X-Gm-Gg: AYBFou13S23fJzKtqQO7Mi9HpC8z1bBmNoopGR0qiS4xB3WkJ3Py9tp73bTS6A0pAWQ
	E8T5fgyztPyDKJpGWNb4m72upvWdXYTQ1tBuSd5mhWPiSB7bWc0NjQ1Cx3lWwRWYgZXGIxqsZaV
	MnwdisX77LQCqu5mCt3Z6tF1yOct6fCJukZ5b5ln0k7dYQCS7LEPybLHxazc94Pa/z1fU7Im+wO
	RR5P/uyFK/SZrh1rsOeoPeS0XWN+OtI6cGywwXVc5N/HxCU39y3qRVZewgYiAIfCcsJwG4nODkP
	YfVY/qB4sU9hqGRG6NAaF52djmv4KacQN7LD0NTbjkjRfTaMrvKmh7ObSDw5j2FkxZzZGTaXeNB
	O/Z8JdcP66RBw0DU0w0XynmdXHsGWxQCsU0PczdZfazHN4bfW5vTXTg==
X-Received: by 2002:a05:620a:6892:b0:939:8ecf:6025 with SMTP id af79cd13be357-93a297bbc66mr53262585a.20.1789344216851;
        Sun, 13 Sep 2026 17:03:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:939:8ecf:6025 with SMTP id af79cd13be357-93a297bbc66mr53256885a.20.1789344216397;
        Sun, 13 Sep 2026 17:03:36 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f19291sm872250985a.10.2026.09.13.17.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:03:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] ceph: remove two users of __page_cache_alloc()
Date: Sun, 13 Sep 2026 20:03:04 -0400
Message-Id: <20260913-ceph-alloc-page-v1-0-c436f2f4c068@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALg5p2oC/yXMQQ5AMBCF4avIrDVBUVxFLGoMRoSmRSTi7orll
 5f3X+DIMjmoggssHex4XTziMAAc9TKQ4M4bkijJozKWAsmMQs/zisJoP+eFVKiytO1VAf5lLPV
 8fsW6+e32diLc3gzc9wN7gNhVcwAAAA==
X-Change-ID: 20260913-ceph-alloc-page-6837c754bf78
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789344215; l=561;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=OGD1TNkSOwBr1B9et/VubXRxEUrkia2Ij71PDKyP+CM=;
 b=+9D8Qse6yTUumDumxi3Vs2q/FN/sxn5/sqXItEBDygzcrEZhZknBx6ENddeqW5xMtXKuwT6p6
 nQUYcMofG6cApRNJT+DympQxgxQCmfbRcTaNdxX5dIz9SLurTkW3oZP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NSBTYWx0ZWRfXzxljYLrfH0+N
 nkrPXeKZk3V739dHs2nAvgKYxdFtMf0mBqS+KEKM1RPDPgXt4yA361ww/lisujXkE+H/lnF85vM
 VbI7cteI+o4r4/hNSIjw1ndsxboVu2rC/4asUT8p6LTs2LU0uIxO
X-Authority-Analysis: v=2.4 cv=bOODs/+Z c=1 sm=1 tr=0 ts=6aa739d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=keSSM9zJSnSKbyYQy00A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NSBTYWx0ZWRfX3RmIsM8UcWA9
 jdXNjgdYvak2WaSD9wb2LZ48rgu0ucJkpM7RQQbV+FOL3HNRo6Rt14wsk++tV+qDm7P2PHdGy03
 Ff8W+oUIqg+2+ph81Pc6kFIzwsJ28CHcIfAJSP8fk/DhPmQLBdnqQG2NhBauIozfVlvJIggEVwG
 uvHv9hq92qkgUXJBmvnmzgIzEypF5FzbP2Kct70Pb/krh5kYV5s/S0Tw51oUPJtAlGikvlU9kpD
 6jXyURTP2pl2hI3yKMB9xc+PjjY///wrO3gWdtXmYuYev2tK8mnQriNC5GgvXDbOexvKR/NVuo5
 QStaDqUIIcp94ZG8+i5k8eHHou88SxSEF6C4plmE/qn2ZbcPgwTCnbTMiDIT0d/hQq6AcES0BU+
 guSdfUiitVrJUA+Fsrt/ydqtHurBsUeExlcdc5IdkdRc6OIIB7z6LTt/U+cUvs506dHyE7yZl7P
 25Af8d2vQ4yWyn4bO1A==
X-Proofpoint-ORIG-GUID: x1v2z2yjtE_uRbfa4uPmg7RabwZfvdY7
X-Proofpoint-GUID: x1v2z2yjtE_uRbfa4uPmg7RabwZfvdY7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=10
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130345

__page_cache_alloc() is slated for removal. Switch over two of its
callers that do not need a page cache page to use alloc_page() instead.

---
Tal Zussman (2):
      libceph: use alloc_page() in ceph_alloc_page_vector()
      ceph: use alloc_page() in fill_fscrypt_truncate()

 fs/ceph/inode.c    | 2 +-
 net/ceph/pagevec.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 4d584eadc178349f4d2b4f37ff71d025b4ad1921
change-id: 20260913-ceph-alloc-page-6837c754bf78

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

