Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DC39F18F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787771459; cv=none; b=qvm3nS4TKUdbmIkga2a8xpTRznYesblLjGRuWDK4UrQD106FwNxihu2fKN2757MUQ4CL0lAKP5svi+8mRwffyBcqlRfyMFuSTCTWYdPSx+EQTOf6nbNrpszye2ZSERUN7yQeIniGrmYHqFJ1Aams3FIZxTuKekYj5IF2Izrw5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787771459; c=relaxed/simple;
	bh=XxNAZCalPh6e6X9eCvw85ifGWwF8EfX6vFvqgKgWTDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhSbVxHsvW5fG8IT/zJd9VI5/sH6UCp3df0rEt+4jgEF/6MI/IxhmBn6D+sW1NUvTqmwE4PZLmHZka+hbSXgHJMVVk43d4QSqMmTntFEiwsbrngWu7pHrr8pfvXpKOKVY3oys6hOh7qU+J21oknmwLB+lKN90uPFJcxgMkceI4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0FTCG7J; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0FTCG7J"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-465e7ba7b4bso468810fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787771450; x=1788376250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0kyZvIf4PveC2J2iGIydryLHHNVkmbY4dqDOyGBcDI=;
        b=a0FTCG7JUEaJ12dO6g3LtbdkLMhN+drO37ApXc9/7tbGcHZ1ti0II8iwJYHtaJ9n0M
         o3kQg92FH4b2zouRW+RU0c+wOen2QhFDOeL/bjcvTayQKacPF4G9UliLi5FyF/N1JD/S
         mXHLjyR5deolIzXTjfgOh5X3s3yQcMnOm3EGW3BvVG4MDVwxn3n6xB678Ow9AjrcILLA
         vPijnpgnVk6iQ3/P2Wf20J8Q9+kpGUlQPDJKioKfvKe9KcBmIl9Oj4ACY84R7cKpHGtl
         UxJlsS+lunjCzAMyqBJZqQ++no26/tfK9ZDF9j4uQPVxZjbcxBqBj3hTskfTaaIrLzIH
         +q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787771450; x=1788376250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0kyZvIf4PveC2J2iGIydryLHHNVkmbY4dqDOyGBcDI=;
        b=eyUQLg+a9vmpFF54eNZl7axqjTzFz5in3eXI7rXieSV0gQr4ZLKBHaPJXTgz4dQAtZ
         knn+G+2DYiyA//2BdoDAV0USPMwjCIsF438362r7Mmg30+r2V9De9NAyHufjddJQQ8Ca
         0rXoNGy8E/jBpFUE+hYRgEq/7F+g3GhwZ6NATWI4t7ncj+6cibUHf/Y6apHsbEp5jf8E
         YXBZYHi+Qb81CB2YoC2BPvju9EeYqaSlNh5C8uNJlQCWDF1usTOiwxaZYSy8aHq7B1fn
         mwJ9TIvTtJ04291XAblZ2lhCdxc2qCecrYVrxOj6uFPaAWdRWcWjhyHa0npqYRBN2IG+
         Od/w==
X-Forwarded-Encrypted: i=1; AHgh+Rq31SOQqpol6leScbxK8kJs6R7ZN70DwIkRXGeTD64w7WNta9FgotBVLwGtqkT9SPby99IIkYUdY9VlSWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUpByjzBpY7Y605P+KUju1x7RMRJZ5RrepFfqq75mYGsnaQRjP
	aTWL4sjpo/mK9ZoZhMSrUH+1JZqxFzBtau2gB04VwSe6RncLuxkYq/Po
X-Gm-Gg: AR+sD133vzye5mNhzJjvX1kNuHPbHXaMKadIk1iZB+Xpvt2LYS7z9LZFfERxZRd7tye
	iSEdxNKaLa0QOmNv9A/3Z2Sinh7efj/7v8Efcc3N8HpQv9AFAzRdYlf0o9k52F36rsxs4soblkp
	ygp1C0bhpgB2G3jxyL56jrLqtm7KCoPwrNmvrfkpouH4ahANhl7pl1XdRNk9KFDWRWggeTdNZQe
	xLaI+ZUb+WcPe1xr1TaAJyEUKOEyVbGV8OMc6KgnCymNhN1I/lrUg0JPDcEJrSzWRV+TJXaPf8S
	PI+C0C+rOEYI2+vHV4qCpAA6cGQoARm+f9ltTEBTFx3bAe8Ojm8e9Ox2Gqzadsn4qkOxflAo+Rr
	JMK6CIRKDfIhQ7LYlUrdK6CutYMdWgrMfvV3/Nu8kzaiT6iqkgwMtXlc8y051Mu93gqurJGsAQy
	TKXlv2p1iOUYYKyGqs7J+9PHgfl+rvA8JCIJQ/81zHDmTQ1l3WT13NsQahbsg5QtjxNWYqYYD00
	1ot
X-Received: by 2002:a05:6870:e08c:b0:456:cda4:be23 with SMTP id 586e51a60fabf-465961b8941mr9942326fac.0.1787771450512;
        Wed, 26 Aug 2026 12:10:50 -0700 (PDT)
Received: from FredPC.lan ([2600:382:3107:46eb:31a7:8fef:9fc6:7e8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-465ad9ecc2fsm3060369fac.4.2026.08.26.12.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:10:50 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH 0/2] smb: client: improve copy_ref_data() robustness
Date: Wed, 26 Aug 2026 12:10:31 -0700
Message-ID: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 1. Avoid setting the metadata of the cache
    before updating the cache.

 2. Harden copy_ref_data() against an empty ref
    array.

Fredric Cover (2):
  smb: client: fill cache fields after populating cache in
    copy_ref_data()
  smb: client: prevent out-of-bounds dfs_info3_param access in
    copy_ref_data()

 fs/smb/client/dfs_cache.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.53.0

