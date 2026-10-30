Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357471;
	b=S9EUtvr31I9FC/q9Jh6MN4+pzc/KPq3z8C1mx5r9dEv3raY9HVna6jisZve3iGZ5AU/I
	 LKlCnCmJbmVbQB4g5f8kTJ6T+JslhKP1xiMbds0x9Bu3LFbUN6VOdDRdfo9kEh6tk86q8
	 KVoUNdF+AsGVaNRVatRoLy7wPlhRxaAR5TSO9R0Vm9lXprQ6dzVk5PlA7gAMJ+ebcG060
	 fYxcpxSzdifKkV+wgRdqcp/D8qOjajHtaaF71JykLGkRmd58PWIx+atCTY9u277v0eqDR
	 sKgsz+KyqeMMOphy7WSCSHMwXH2g4P3oj/0RmwMmtq/RMtfuur5d7bRoLdwo0jw/cEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tJBs0pTceSyS3PVExgZo8XWqzDRyuZNRvwKFnHo9xDo=;
	b=nxc5mwqYe9exQdq5DlvwwiiIx0LA9qQjHgX15RndG3xgm8txsndEt4eCa0gT6VVgn6tZ
	 bbmoZC0bb+9d9vdXsXRP2WSCrOEofs3rJnxgMI7Guvq8+6tIYP7If+6XXwiNsLbnoAtgL
	 mrq2Ljq3Z8o2TKLmw8rSvnWl21Q71r/4MW+MfxSPy4ojwP5EqR0/8hazFmQh1S7B1fdR2
	 0hcsXU8W9SIEfJAMhfnKZaNQerTvyhyycG+KV1zDf5vItt7isvQ8A16rIPrGheLBEAWxE
	 H1efdK7XtF2zY7JpSOQ0BDTrLnb0Lrg8BLTMivyVGYBOsw57hvxx1mlQGLZtRTYTLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NGPwwBpS;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=jR5+BhQS;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB05606C6EA
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB05606C6EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NGPwwBpS;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=jR5+BhQS
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U6vbXq3771306
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps01; bh=tJBs0pTceSyS3PV
	ExgZo8XWqzDRyuZNRvwKFnHo9xDo=; b=NGPwwBpSza0naj99pmHYtUOK2/1y5Nl
	brTuCIlQuOr8r94RfzFS6dZtQQPIoQGBmcatz6wMpru2KOpH2S9bYjpWvYRpAAE2
	g9kKT2qm8GNC5v0r2+uyv0DsZhy0hp8wtquvCW7Imu8Xwqh11nag87pKy9cRTLin
	ZmZqAYbIuxZm8IaDCV+x7Dk5IaqjnvmSmqd0Y3pMIyWM2+Lain2ypReU4AlYG4yv
	6aUIpscwZjfXETpIWw3e9eFWrrYOmO6E0JapuD9tRGtXzRAGvKasSZAECCgXq0UN
	oMxihv4MYDEdzVJOvoSzJDxla1kg6AHWlYICVmlIQoTQqxvszLwmfVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hme6uudwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:51:09 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so61989185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793357468; x=1793962268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJBs0pTceSyS3PVExgZo8XWqzDRyuZNRvwKFnHo9xDo=;
        b=jR5+BhQSCud475ikCyTTRIYWc2h3JYGmlwZN7atrIechgWst21iGjMgniRfOQaWznU
         9JFROaKwIQQT37XfTifaGlhMHwPP6zddmAMp6G+35Y0bd30auL9b931/8Glag1FramZo
         3pnuySCDneoNryM0MEH0k+XP2zQm12dW+1Vl7FUJcZ0tzTUk9RMkc/mncxpIcPgo9V7d
         X3aR5RSCgz6QUngiDa8lZ+FojNU6ClvDKxNK9c0sKP0J06kWzlvIcMNdpVMpjxU8puu6
         BdZAGEo9gN7tuviO7r1pIN5Z57mHqWWIcHMiy5ab8LpGL6Hh72FXFvyBgPIpWlR9lBuN
         E/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357468; x=1793962268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJBs0pTceSyS3PVExgZo8XWqzDRyuZNRvwKFnHo9xDo=;
        b=o9J1jzNXV1sgA8z2cvwRnhbms6rIUeu8aEMpBP3FsPAXsPvQM3OWxUAo0g7kvInXF/
         Oi40TShH8kPD5X7bET0NXzY5myZweJhv6oMFrJGeLA6DQyqUfWxht4ofzYSJ8LsB+wSE
         kkPRs8G6bGr3LBk2IERAvC4piUFg3pnG9riDLIWXR5BjqmPn3NmR1j+sJ38GjtqGGmkO
         hNOVpFqkGAmU8c4r1AGd7gfpjhgCm44/cNmAgtiaY5cB7mRKMW+UT4758etcXNAEuxGi
         TK/uuEX50ogRio7Uuzf3+cm8fuoVhRVxkHDtEhJ/FnPMh55cK76vAIw6zG6HfIGyLUA5
         Gu5Q==
X-Forwarded-Encrypted: i=1; AKwUvByfQx1aC3fJzOVELRXuwAjH3RuJYlHMjywvigjtIKWGw39B252GFuO4Up6GaT+KYckknfYbdeAuRQK7XWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTSGl2UoWrw1qgC4YzKhXm14tztZo+laOlEVjt8rMOOcHWHQaZ
	2IZuI1hYF/c2fVP/aOhIsqRnSpeX0TJuOofO2mnSQApMusXaDXjHF9PPfeAYAdqzDmMBwWnmqRt
	Gx6ZIVIdiPd9B+r6M3t9QaFVJ46Q0w60kgRY9x0RiiJ0Qu+VUkxTy1jwsx8VajQ==
X-Gm-Gg: AYBFou08o+0EOXRZ4lyfXTO/gU7+sNx2MTpWx+zdRBkEPzAkt1+KCG+BVonb0M5hku7
	X3FM2dCjfrNHTExHEpJz5iiE/D159cg8AY1EgBadcs+xXNw/Nj+zpAwEEGkfDpRufi+T0Pbp85+
	1xZKKJGMRTCjtRpItM1/QARo02gxdWy1qD/iiVwyY0F6kjiKXTtGOwh3p6V89w9T0XXYnExrlSc
	onGHPstReIp71Ze8fXuNKmTdeHeXoU6iiqet/J9AHoI/4SYtsc/8TpSe7DNOouwkk5nQZg0dbwx
	QchU3pSiassSR9h8f6fvyM9PJf0UGfEBWgGZNXJDOOCOWuic1RFAvEwyges/Gfj/jbloL2pGvwu
	0k0Q86Czf7fkiMhmrgnCXLuolncKwhCp/cwZAGHmwFdn2V96HgpxyOyI/9ARLWP0u8UnkSpLt
X-Received: by 2002:a05:620a:1a04:b0:944:3c5:ffd8 with SMTP id af79cd13be357-944216ee039mr321429685a.35.1793357468071;
        Fri, 30 Oct 2026 03:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:944:3c5:ffd8 with SMTP id af79cd13be357-944216ee039mr321425985a.35.1793357467484;
        Fri, 30 Oct 2026 03:51:07 -0700 (PDT)
Received: from localhost.localdomain ([37.142.146.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm51389245e9.5.2026.10.30.03.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:51:06 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
To: david@kernel.org
Cc: akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        lance.yang@linux.dev, usama.arif@linux.dev, linmiaohe@huawei.com,
        nao.horiguchi@gmail.com, richard.weiyang@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mcgrof@kernel.org, liyouhong@kylinos.cn,
        tz2294@columbia.edu
Subject: Re: [PATCH] mm/memory-failure: fix folio refcount leak and min_order_for_split() locking
Date: Fri, 30 Oct 2026 06:50:22 -0400
Message-Id: <20261030105022.903008-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260806-try_to_split_thp_page-v1-1-a259e3387e38@kernel.org>
References: <20260806-try_to_split_thp_page-v1-1-a259e3387e38@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MAGoiUqOl2jvBngnoG1vB5x5v7ZOKWOO
X-Proofpoint-ORIG-GUID: MAGoiUqOl2jvBngnoG1vB5x5v7ZOKWOO
X-Authority-Analysis: v=2.4 cv=GfuCDgXL c=1 sm=1 tr=0 ts=6ae4769d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=2Vv74F+liJFs5eLlGJuaDg==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=Z5Fxo1IbJ55YNqwXoCEA:9 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXxZ0+RKAfqyy2
 tjBhCSj6l+H3M60XZEFp7qqQ/Ws3KrIhZ0OKziO4Uj2owZLLXWzaHXLlxc6Y2u8k1udUGySqVFb
 dToUAk/eMHKGlIzJGP5Zlfd+yUS3c8cLx42/jfQRNCxsjZqXN/yx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX45947QG+4uB5
 NcCAcauFD28z7pGSbd8NSSpReUBJy2iJPIwN8OFTZZf7YUWaiNpKs3+mVPSfy0tbIoNQtzY8AYt
 McsWYtnZvB8j5ZPHGh3vSrAjeKAZEyRpEx6tMpeegyJRVRGYI9cxuVG2wypQatOC02r3Jq7XCWv
 CQjXbuXPjymfxX6kesBElY9DFAAOPTF5d7NYCH+xN+iObn/qdjNUMMdhMwKwuKZcBpxYfor9V3K
 7ikVaNmcp51FJ3FvnvzzxmRYkrSylhKg92L9QOHNi/1uyz0Xa8xuljGmR4bOcwFVC6oKxl0txtm
 w7G9vLzirhC2ghzRYAZ8eNt9H5GU2uDl93znsv8UwvmP7c+0V+kki/x9sTfBLT3bryyNlveiv1e
 Hq/UDYq1yO/nr+XeKppWnc4pQ6B+ETS5L5odvwpQrLNXi8WSj1KfG6hfbj+5JpAd19DzKlH1Im3
 M61h3xE0jdjP3ABQd+Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 bulkscore=10 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Thu, Aug 06, 2026 at 01:14:38PM +0200, David Hildenbrand (Arm) wrote:
> hwpoison code can end up calling min_order_for_split() without holding
> the folio lock. There isn't really something that would prevent
> concurrent folio split. Consequently folio->mapping can get set to
> NULL after checking for "!folio->mapping", and if the compiler
> reloads folio->mapping, mapping_min_folio_order() would try to
> dereference NULL.

Hi David,

Did this patch ever make it in?

Thanks,
Tal
