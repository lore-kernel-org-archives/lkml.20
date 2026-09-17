Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA84394E91
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620384; cv=none; b=HnapysfTRFy2i2kQPo39VvXqT52mpLLYsvbKTbQ5l9RjPyMyhEm/iQ5Yf0hByHuPdbr5T84CRddaoTtPvjzg82uC49Xf436gShxiuBbeZ0Ncq5rTpA6BAJftXFDaVzqGh0s/1xfc/cDP6Bq8aAdLABXhMClcSteqRUO/eqYyJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620384; c=relaxed/simple;
	bh=bvxNinmhhArVjCNyHtBoEX2+g0Xz/lQjyb7Hd/sVE8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWdiEoI62EZTzdpnZ4h151JrHLF58Sur+IQS5OWSAdndumC5iP/TWG4+1/dndWYCcELPVsdxVTMnhdXlAFuWA/mwEsZCELgUOuEwil/gefin3GwfqXGzN/JxidMw7OyZT8HqSw19Eot2JZJolmHL15pJA3oYshY5Gjqfmvxki0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgB1bCvO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgB1bCvO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so356463a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789620383; x=1790225183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adrTALwJCdcmS4nJH3ZIST48L5iXRSGsY1/xx0Jbnik=;
        b=kgB1bCvOKkvYO63S23mxUs4tu9tbuNDC3DufSo5TuLxnvN5uSY6pgvwEWT5mZCE6ja
         utAQPhai8VLjXqaTBqNGMHNs2o/rIHLjvQG5T279CpePQsVo61sBvgYAZnAvHLcoeHnQ
         NqODEQj39kzp5zLCkYvzDmyGpEo96F1Zz6uCIquJCzzrLNsTwqBOnsMUbrU1WJxB4Zd4
         IFesJZGBjHjbapYNJIckkgSxcgANkXdHXpgWPikbKqrKLm1VLeorWKwSnWH8WGX7vSa5
         eMajtfYlNQXE0rd4kkPerweH9/yJ1YOYJ9/sg/v8eG8lU0MWYmER/Bz0aMIVEVbiV5pp
         yAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620383; x=1790225183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adrTALwJCdcmS4nJH3ZIST48L5iXRSGsY1/xx0Jbnik=;
        b=VeZDJouX85ERLTVsbhfv7sv1VQJZxr28wcbzIMzfizVgEnyjmQncT93Q56icQnNJYU
         /o3TsuYNuNnbApQuFJeailVWlAew/ys+No7CeA5W3sO5KFGZ5X37voIS9uKAiJobg59i
         ECdPg/Cr/X5C47y/ArcQR+7FFitZkpbwZCh9OLe7QjMHIou/nXRijLoeCUcQ8px/Vu3t
         sHECdJYEido8RvISP7y4981tw62beQwygJoiDHIkh+nxEgCBwkcoJ8zg9nYptnspxhYS
         AYBiE84XvflkQDF3hpi6eRLW8oBQCAmJ/l7JC+e/EOG6pImd/mJGMvY9S8m2A4TqTUX4
         sXAw==
X-Forwarded-Encrypted: i=1; AKwUvBw9b5Zep+7A5NYfN3fW85GNNTSfZX4S+4FPpmID4oTvhaUkfMJVPKOFhVyTbtUBXYmkmyoBbvkD5Cn4GgI=@vger.kernel.org
X-Gm-Message-State: AFuF++mzeayTm6/dMISy6lyAQR0ViGUM8n85+Za618LQBUPhLRqpGEYW
	lrHUQj/RxiwVl3cIQ/VJ70o5lCT6SdkritTIvhdMM2RHb7iY7hvdMXIhrnjT+sTJ
X-Gm-Gg: AYBFou2ymGV8NofPzL1kONeses9PiwBd2fp9CxzRzrESyxzBSPc4aB81hFYyG3Uiowt
	Ff+xKGUC0j3otrscOAJJKoVraHSXXZgcKEw2S3/kKjTib4Xz0dS8SGO6WCa44MmK9+t2GSpi6YF
	KSW+hzoFTV4A0XZ6TiwKW4DFFXryFQJGeE9og78gXz+TgfsbMmfzv7DKwz4ckLqeXdG8nNeJTvl
	gAydtxRqcAXwE2Ci6njJzYEbTB0H6z0K0VxoPbiAvu8DYdkXit+oMrvDBpPYClXmlfx9pXyV5KP
	qO1AmHWFowmyTQykB0vSIHOq0HMpReLCXaPiQvTcoZZ/AFYL/mpArCTd45yLOtVfcMB5k5a+JWk
	bGzKSsgN/fdJ8otb/yjfdlJI1xPbTcJdV8uiE4kQO72726OJkzPfnFbDY7CjISOLavYIxfsPyKw
	vsNzz9eokguHVe14YPWOSW+AI/qvC+PUM7hEpPf+KCRp2yT4tGSgX9ajaV9r05vSy8ZrPX+xgkl
	Ryq0uJTINwCYqdIBOtB4eQ9ehK2+dag5FSIDfPpV31x1RcpBpDjIg==
X-Received: by 2002:a17:90a:6096:b0:39e:1fb7:5676 with SMTP id 98e67ed59e1d1-39e1fb757f8mr7992415a91.5.1789620382745;
        Wed, 16 Sep 2026 21:46:22 -0700 (PDT)
Received: from casta ([2401:d800:9045:4f1a:4e6d:4c1f:5b78:9e96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360aa230sm2717236a91.14.2026.09.16.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:46:22 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: code@tyhicks.com
Cc: blum@kernel.org,
	rdunlap@infradead.org,
	chenyichong@uniontech.com,
	zhangzekun@huwawei.com,
	ebiggers@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH] fs/ecryptfs: fix slab-out-of-bounds read in ecryptfs_verify_auth_tok_from_key
Date: Thu, 17 Sep 2026 11:45:58 +0700
Message-ID: <20260917044558.41677-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a bounds check in ecryptfs_get_key_payload_data() to ensure the
key payload datalen is at least sizeof(struct ecryptfs_auth_tok) before
returning the pointer. This prevents out-of-bounds reads when userspace
supplies a short payload via add_key().

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 fs/ecryptfs/ecryptfs_kernel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..3baccd4143e8 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -124,6 +124,9 @@ ecryptfs_get_key_payload_data(struct key *key)
 	if (!ukp)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)ukp->data;
 }
 
-- 
2.55.0

