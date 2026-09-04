Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E750C378824
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523211; cv=none; b=PZjyOa0We5LBUgL3pj0GgfMBIoFXhh3FoSFIhqM9d0oz5HYlO8397fYf4MtGhmCNEFgTCKs/61A/EQsx10lMWamTKOBpv09HoTYZjwlFRtX0+zMTkWmop5LixWH34ESfgNSy0WxEZVv/iS+azxgOQnVUkYtN5BWXI4Ka0uAB+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523211; c=relaxed/simple;
	bh=CgQf+B3SvYZRu1f3QssxgcgWnfYZODXI8JXRV6DDSrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtGdY4Hu9rUAtvhSR/2/jkufl+UWF2uFkCLOYst61yx4/4xkOw2tnTqsJ/TCvAltyQO9KJpdMoV8ioDVJ+nyK3TiMVe6W79i4pUZl3CEHXmg7hgkIc12hRHiJB/kktIQTqZ0krACP/HI9RDLauvacAVFoCDx7L54QZzzLs7UJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=G5dofKio; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="G5dofKio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788523116;
	bh=CgQf+B3SvYZRu1f3QssxgcgWnfYZODXI8JXRV6DDSrI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=G5dofKio1U5ZeIPAVQ3CvYobA4Qxf/xZMUoO2Nb70cdyEzx2ywLWJXbAuBFPcF0ET
	 NHZhCd61+NcrgPjUtMusP0MgoE8fd1TlriDg/ZAIbPhVIr9mmoi5IGshLAHg+yC23w
	 IuwWAmWm3tFdMm98xm6EF5z9FU5Dafno8JTTiAZg=
X-QQ-mid: zesmtpsz7t1788523109t32eeaed7
X-QQ-Originating-IP: Yf6zIeMAQMXg7vQ9lJEY7WQGlVEiqJORvs6GqIv+C3s=
Received: from ggx-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Sep 2026 19:58:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3520154375068366657
From: gaoguixing <gaoguixing@uniontech.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>
Subject: Re: [RFC PATCH] mm/swap: fix swap table count encoding for empty slots
Date: Fri,  4 Sep 2026 19:58:26 +0800
Message-ID: <4442A232A068B3D9+20260904115826.193612-1-gaoguixing@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nv1Zs1ssfOILZ2647zMltOD2pep99YXU4SI5Z9vviMHKTOkhPGUIP9zF
	GUX4fB3GyU5NNhQB4zLiKR+mUeAHqBgJ4pTOrWRbo5C5Ix4nGvuDphlwSxqDVRyXxVjmwMq
	Yr7A4h+8ompDAuv+K8xorFBdRR3gAci/52pKyX5PSPfulDz3yZDVl20vWpqXylGepIshCM8
	inuH6OtQ2H/NQbHJ977v/ymKqkOQTK7ZrNu7ebbIzqvcNQZnT4qMe934zK7iPgztBvrX+5r
	R2BoX5ttFth3EFJnHzD6gmNoYR8nQVOtBrkeq6x/1F2wPcUWHJvDmB30adqZEPnqVMJxS2i
	wceV962hu0+ZJPxcqBASn9U4AaOYHVlAe231mjVoSTZp01c4reG5WBWp6HfkEUcAtQibM8f
	LRW/GWt6ind5QzMvRl6fJZ8yH4sBsGO1wzZcY4OL5rlFcDOBXV22HK1vmhn2oh7yLSRqA5r
	O405BrEGXRNMPeoXYGRaiqaLIcLjRpG9BWi6I9AHqsIC0rSlPC40/r10vd9NoiR/0ogPzBJ
	+6+G7k7dvrePuA2p5Xd3HpBcocOYp58kD2y/wfZj96IvcmQrkDb/b0gsGBAAer8xxtCW3up
	F45k7N91P0WucssxkKRwvIPQa7REYX/5xQevHXDZg4A+g9H7BtPRxbeJNwATEELiwm2LJjS
	1rwmrHqC9nQoQcHrWIEW19LKhP42WX5IwI6qry/7iB7+Y0pHh3ZpOc/1EdPDXNSzHDgCQTo
	ETcBBYC8UArzSybPsEnCXR17YOvWs7GmKieOkqesJ7/g29zCemgBLPxxbeOLYBSbZ+wLiju
	C+VFtrCzqyTUd7129eDKZ6L9f67n+h/3uFXtc/aj5eyadG8lRGjo1+abAJq6aiNYru0CYaL
	SEdrSQv9h1wMprAJkD3danqFBJf3S3FdMMHqdge9Flu0ms2OLKb3m3iiv7AQTDAw24RP9Og
	vYBRMh7cvh0uB2Y/QXOaKvUQOxO7F59zBR0Ysfw+8Di6TItWGUVRsAvTe927HJxKcUYAFq4
	/YoFHqboxQfLcgsQJUoL7f4+UNf2Ur6Ag5SmDvxA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hello,

Sorry for the confusion and for sending the RFC without sufficient
context.

You are correct: __swap_table_update_count() comes from my local 6.18.y
adaptation and is not present in the upstream series. The issue is in my
adaptation, which incorrectly passed a count-only value to a helper that
expects the complete flags field.

The current diff is therefore not directly applicable upstream. Please
disregard it for now. I will rebase the adaptation onto the upstream
series, verify the issue independently, and send a proper patch with the
necessary rationale and test results.

Thank you for pointing this out.

Best regards,
Guoxing
