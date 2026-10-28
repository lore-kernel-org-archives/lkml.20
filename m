Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219627;
	b=ezvwL+IjoqHnSc5SHGJXP/xXfF4PJjyeFbPQ1TSxc9XacOh6Qz2uiban37w6tfX4FGHZ
	 di8RNRzmY7TtRkmsM3Brb0pWwfdMhfB8Zcj/flcFaSK53OcjmqBDRQKwQ4bZab6u9Kqxf
	 vkrB4yjGJrySoe2B9a5VNDrWmn2dnDtEMNejlBiYjva0TlAQvlKK8w2pu8fShsp2EMCOu
	 5LuwYeY2DSQ4iCjwHSOoYM4NQZvdgszUgEraghnSmVMiWTKBv5shywjGkiBTw3/oOPLCp
	 d2hwfWktT8zsNWerhqy3VZCpeERtI3vB6WktocZCRQu048V+L885asFY57t9A051SRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
	b=lYlHu79iMc2zmtj90Su5Ir3Woa4R4rL0VbjhqAYB59RCtqzVTfPxNMzjHvm1YIUOMUWE
	 5R/Iy2SDiRs5quakMCNxfIfBEY9ZR2aiQWCZwoUHMfMcGmV7tZsBX+H54iAxim4DHl/gR
	 Itgp85QANBrhBIy+FhYknuL5fMpcZwltqdG9xgFjfenIwf1ClYsM7v7q/lOm8A1jmFI5M
	 dsQT1ZtZVT+R9HO62UOV1WF4AuKgAGILMjKl3W7CHKVjIrFfYYYjsPgMPKQ6xr5eOJjX1
	 aivKHnRSaCYSxur2/w88yNBUChaFiAcIHRY8prmbZN/pFl6ruaCm04RxB1Bg78UjT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VIAHYoX/";
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9164606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9164606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIAHYoX/
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1949fbcbe6cso56052c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219626; x=1793824426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
        b=VIAHYoX/gWbWjx34bja30pDruefzNGvjIYWXpOMoYXWW1mUOtOZlhkvEbPwNePYFUn
         QfUIJQixpcDi+reeukzBUdBkhjA55ttY+/3fETjJdUOW42FIxNYzDebmi7iCh2VWl/ln
         ze5aI4gcNybe7B7pq1gtOGt2W27Tt+dYcpcb9tWCgdnIFk8QRtvL6+ROASGzsvO5gLbH
         JZLIbEqVx5aY8Ke7U/Va1aHI+iEx3VlpkWO6TdszAMuDSf/kKvcWRuc2aejFyJYHcI38
         VhZ6b5Te9kYxtYtCfqqZWVZNG3QlQFpKwz3bQ2SeBxyRwFd7ltstAnke9Y+vHzAmf5A6
         OQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219626; x=1793824426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
        b=zmKbCWT+zKulLOM4AvbQLw1+d4UvQcCAT4k5bggW9UxYo56YZXLK3RARe9q80dqJi6
         ruUiWAH4g/hw/WPZkiyNDdcJgzJ2Hg8bm4BUHCiBo5FojinD0gdhroKOsotixYhO3wLe
         M0943QyQ2wkbbWsaqEB6A4CBRjK9Pedu/ISwfhdasWta6JB33oBEgS2nPpYGI7PWzW8f
         7OieyfUBj4mgWStriUlqZxsESo4As630HjIvxYy/4uA9StuRNBYSbAMS+EPoR3PerYzJ
         HcrWnU9h48y7JPFL9FIAoWLESBWvhpNi+1P1GykGpdatPmIysUPJQyFE6Jyx6OyXCLNB
         Y54Q==
X-Forwarded-Encrypted: i=1; AKwUvByD7QseX7nSUk6+45nNWHimNkbw1fbKFy7ecMlbvnJyYM7qAZ6uESLmbnsrzu/Va1XyYzBv5vMstzhymls=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7BT+VyhlhLFRiPJx348kNmPkt3VCbakgB0ps8AnvDFgOVGZao
	HaeUZmoPvge3gNPE9wIsZTOW2GFZYG5SZrdstjLhnOOTm00MC5pIb8BX
X-Gm-Gg: AYBFou1uOALzBQs+OrgBLYyE6OVPxtLsrePIBFEZKTFRD7jvUUmTItkOqCb/zrVf9TR
	i1S5xIWUvLluAhzJJg4+CrycRPjFbAXZ3huEUAKLvBRLhGs1MVj+i7YnqLU6KVG//VB4Z5OlVOn
	Di96YTLBoFjIJhyNRjEl00PNHWgbxAatM1yOdx6be//JGv40Bw8HAy5ZTFzkznMrMcOHAQDxp7c
	nSOWYkgGAnSlrxywcVBcIn3IdxmGWVx9wyyWhLhIlGTeHJXF0Kv/x/qmlmL6dSnfkFXSWwoANbn
	ZqzJEcSyGtYX1O5yCeb0evGZF8GYwGGy+Z6KmefJ0AxNsJAfF7xLQnhLx9aMy5NKSFOiB2zDlSB
	Hp96kIzmYmq4JOTjNz42wece57mJLS8kqIAxis2pyg3JQSvCQEjANA/65+F6HwRZumAknfzylBx
	JAQxkW8dB6SxPMsu4c+s/yxcfCXkg0xJ3CqK/uykfJRu1pZAFX4Dmua5Sq/+JnF1rzKNf7KJxkd
	RlDlaRvSlrn/SiTvAcgSo1ElyC1K3LAI/GutJeWC0puPFPu9VHha3pCHfCvxcYoG7le5n0jMBsg
	9khtbLU30DEJ3rwXhOxUfOqVA53HcmCiVD+BPwyWqS4ke32Oj80chmCw1JD7hy7WL2L1zts/EWD
	RFw==
X-Received: by 2002:a05:701b:281c:b0:16e:c820:b20d with SMTP id a92af1059eb24-1a6c87bcdabmr3617245c88.5.1793219625684;
        Wed, 28 Oct 2026 13:33:45 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm14699522c88.14.2026.10.28.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:33:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] exfat: fix parent link count when replacing a sibling directory
Date: Wed, 28 Oct 2026 20:33:24 +0000
Message-ID: <20261028203324.6073-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

exfat_rename() adjusts parent link counts only when a directory moves
between different parents. Replacing an existing empty directory in the
same parent also removes one subdirectory, but leaves the parent's
link count unchanged. For example, renaming one of two sibling
directories over the other leaves the parent with four links instead
of three.

Also adjust the parent count when a target inode exists in the directory
rename case. Keep same-parent renames without replacement and the
existing cross-parent accounting unchanged.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..24110e7fde47 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1309,7 +1309,7 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 	else
 		mark_inode_dirty(old_inode);
 
-	if (S_ISDIR(old_inode->i_mode) && old_dir != new_dir) {
+	if (S_ISDIR(old_inode->i_mode) && (old_dir != new_dir || new_inode)) {
 		drop_nlink(old_dir);
 		if (!new_inode)
 			inc_nlink(new_dir);
-- 
2.43.0

