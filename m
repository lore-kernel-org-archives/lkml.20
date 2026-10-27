Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113334;
	b=wdkqwiB4glRxiKiMTu62aLEYqNu91JGR4CrGOy4zC4VKqWDZUR+P/A3ebhdko4aPZ0l9
	 IVQaNMmnbqUIH6GnHKxfZOLRI7vZ7ZuoWzz1oZUbjzaKSFPZI2D5ZItpeu+qeHKWecsfM
	 hM4HvgNNBm3K7nF0ziI3BZXIT9FUKwzqTLq3dhRfifRS95pH89scZ8bUggdWeFaRzPTD1
	 1JxGdVH1TkdmlQIfejUJYt8nbeMSmvbsC5nUZYpd+0LRQBRPpYdFemFm/1Yx1cUS2uAuG
	 KzdbH4t7ITUxD3/SqEFcnszG4NGYXYTDFjvC0nNNuC+OueHEdqaJV5ZqynPJ/FmSNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U6+MMyHahueBZCqpgQMBjs1Bb3xnMtdVSZFfFSUtdls=;
	b=kyhlU7XY5XhXx4vAzp9l0vTQ5BD6WQoEekEGuqDUH0PRNjq9+bOrxAhCvvyyLNz/77jj
	 IIdFDLzdBI81N2EOBnWFtbygdtalwD0hyUMxJT7ciLOArXLQZUXSSFuq4J5fQcjJ7v74x
	 rYnq2+cCn89WISN1e2gWZXTe1lwyBQ+uTbDoltJuV9eRb0uWWnny19VSVyMc4vLdpDw1k
	 QcMyQxkOageFcPQv+RW5lna5XgD6dT50Tc1sFHV6D7l9WjgwupAXEEEZKysnqV3MyrhKw
	 xWf2gfZfEx+Xg+O16daduh2ieQwCfLNtLKyCLqhRZ4NZG/YX1dp0KU48dba/KvCOFIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F29eTtOU;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91BE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F29eTtOU
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3768893c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113333; x=1793718133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6+MMyHahueBZCqpgQMBjs1Bb3xnMtdVSZFfFSUtdls=;
        b=F29eTtOUzbG09pYK4Ba3JGKIueZAQzIuun3esnNpGzAZBGnO9ItuJ5hgxu3T1RWSxZ
         Jwi4eIypaEw9mxxZ0C2OIoCrfRnib1h1OTQF9yldAwVYSa+NreSqKWd4xoI4ckxCLdDb
         CXFnBP+G2Cpegd40zDEY8EjHdQiN5diLmNlIOyKRndFbcD99T2tveBmSbMMkxn4mcpP2
         6Zw0cQJmKZQ81QxNS6qmkNNJkqKC+yjkhlDeIBB0B++jTDDuamad8EsG5Ukn6simvQv9
         Efa49llk17runxCEH/SBK0MG0ciJMCyYJomnOZgEp1kzDdUo9ggQouYxnvm+ILnDPmFx
         HfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113333; x=1793718133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6+MMyHahueBZCqpgQMBjs1Bb3xnMtdVSZFfFSUtdls=;
        b=XZ9TTsxMxHbk9He7NKE33nBxAHyvSPp5ihskCvSDxBa1hgkkfjMfys5xpUni3JqIw2
         Ddgc2S1gNdNzafAZW6RbeyjlxgG6A2lfN22533AJfDgsl7miMXEf069dgMuUk8A6mS2H
         0rtz3c9fwTEsM3RxIzF0+3zyRtV5sPhogYq+ACyTlLyaCBDccZ/iq7wZNH1xvv7B+oa5
         Pxf3eMgob7ojkP9B9U3ZQKQ78+jBExeIzSX3/NGJ8aI2n9sFDpvecDmPdyAOLA6R2yQk
         Pd2jIKCMO+PrLA0Io0jDhDBXm9ym5tmu9v8ZCNaV+SFK52gdeJTS46hJNecrXqRClau9
         rteA==
X-Forwarded-Encrypted: i=1; AKwUvBymncEbC3wbXaX1yWgYQnrWC8pvwLOsemqoMJvBQ1JEAcr8TypSoOKstzvRG1cvwu6/PSmFjf4lbXWoN3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIukfU4i504jZOspVReOcmCszZ6sS9vTOlUr/BKgIxu35w7JWwF
	M8giI6n8Jw8jvCEgeUiLTCv7i6BqcYzw0COln+BBfDl2L2BVujxmdRa7
X-Gm-Gg: AYBFou0bTMRo4G1kEQi1f1VGXZ7oWtEqmZYaJzcnn+0rrA65BrebVQUexjzA7PHZgkw
	qAjw2+fz+xjeTnR9/KlfFzuy0GEUVB4s0k15QJxO2NZV9S3q/jVeBMWNGaDJ0gcf+/9HO2VXQgN
	VmaUBlgNotuYSe0jK7lIvayEVOiTtCYGl/qm35Nw49SxryaMAQOOHOb9Ht8fRdJ+/2BBNsDxeMK
	dGpZbJvIzPZ3ZT1Lkn4JwjlnHWpYmiHIkb6dKvpx53kWIRcb2SuMiDiMW/DSqSLDd1JA+SLwYP2
	j3ocWmTX+fkJE4X7eD6d2TQsfn35+abFoCFLJfjCAY6pVANg7ac6STxmHjdjlcEA+/pWcgpjaUb
	FVpxYIuLMivX6UvhTIyGEsnoBa9dMgUO2aogl6GoAVR4tZNlUos9Lowdt+wRVOwVAzxupJ8TOmr
	YiFzs95UuSHvm5LQgTDoedgHPhJZIN4KnCagPmUJG/cYKjfI6S5sLaTOJ+5i9y3Teju+9krPVzp
	vG0Gg/PG0BF6gtlu4nq/EKdOCTwZq9PrecgT19b+fLu7Ri1VArl6r7+Z53GYxOFiGZVlTX6GvdU
	INA=
X-Received: by 2002:a05:7022:3b8b:b0:169:9f67:a91b with SMTP id a92af1059eb24-1993505df87mr17132954c88.12.1793113331041;
        Tue, 27 Oct 2026 08:02:11 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm30581952c88.8.2026.10.27.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:02:10 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@suse.de
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] nvme: auth: validate DHCHAP secret before stopping authentication
Date: Tue, 27 Oct 2026 15:01:20 +0000
Message-ID: <20261027150120.3387-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0632ec1e-dcd3-42f9-bd0c-a809a6f6db09@suse.de>
References: <0632ec1e-dcd3-42f9-bd0c-a809a6f6db09@suse.de>
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

Hi Hannes,

Just following up on this discussion. Have you had a chance to think about which behavior would be preferable here?

Thanks,
Sreeraj
