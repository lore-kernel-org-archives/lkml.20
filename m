Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F433C8C52
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787771464; cv=none; b=jqejIAPho5im1HPu+HrAtA/rRVHRU3UrtysyvMAiEHnnG0w8nDz/Ma9i9NUYVO5hww0+RZ+aOgNeOgABo5Gc1vl4HcXDijDHl6xMSn3JbdasNmzn1wtF8/EJ2tJES9LO6A+/zhDabX+/KdhfNDt7olq5vkmIdEX2sG8Uox0UNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787771464; c=relaxed/simple;
	bh=hA8SRvFuua85xZ5A7WL0pI+8AgdAGDofjCeAaFmQkbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWFHsY9FlWXsPrzvFo5ySgp5jnL+X7996fu9FV911aBt4JdCTKE3yQGSScbFJi48yjDYfvTkQnj9uAPgGDgM4BFNPCOKjNOsDyQoHp8X6E6Nhj2RXJNkP814Eoa96Rz+UukCtzkAg2BsLNDJlHIxea3olffO+5SUyopEaJvk2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUE+NTQ0; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUE+NTQ0"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-459281bc13bso1283620fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787771458; x=1788376258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+kYzMea9PvaxPnoMNSVSpZwSGyo0Hz87g0xc/2UNKw=;
        b=KUE+NTQ0U8SGgusgxjHltiggAY7AKzdhzvvwv/AvI7fi1bZvlkyG5TB85DXFbzvv0w
         ANr5/McCw8/5EYfON5nyZhO36Mrk+3ya8ptetMI4X+HEU9Oxb2nCOBAoPfkt0rjdvPmo
         5iQjp7CMYbdcwxcxfAyB4fFZNx9yZItOGMCZ8fnloG+DK0Eb+oVMQuT81Xd/y44mF3OS
         U7rXHuuf2svxkUfV6ZzQ95V5O5S2dtgmByl+UYj/ddWjNLzOlVBTnpmRBXka5gTt+b4Y
         JFgg5YqjROfERzw0SZIp9Syaxw4NX5DoIxLTBB/+SUtvAy8LAlDe7LEyMXm0mCin1yah
         YEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787771458; x=1788376258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+kYzMea9PvaxPnoMNSVSpZwSGyo0Hz87g0xc/2UNKw=;
        b=ceotpahdAsxdq+0WZRJQb1znRUDObhNXfH0+P4p1dsv74VaOBobGwO5bIWdV7w+oHd
         rkvcniy7VPOcwrIps5pxsux++BFQDsJaM43+tvOdjS/X0PYNd1p4iH00jbBae29tqC/+
         EtwlYDbbtIzIJz2j2cKywyE1JmdMlXMV0UHrdI/3luaeYiseV95WnjGO1tYX2mXafUM0
         wR2JpC/oD4U5wf7sM++jeWJ6FKCyC3m5j603qylHZon/4er46LH3fpgc1k4dkKzROIQg
         Z5SWVLd375m+KLIEXywiQFeqfECaDC3CEQFU4qGG1c3g9EMp8O9DJtkRirRb1UyuAZQV
         296w==
X-Forwarded-Encrypted: i=1; AHgh+RpaLb2JJ9kXZjs8PRE7eHYK9Dk5v8mlw+ZozGf0nKlIvaus4n9x/JFtXzxQuhFNupxB0m32IwOBi2PjY7s=@vger.kernel.org
X-Gm-Message-State: AFuF++kvNBknfFr34Tl+t9hH/Z8Qi+jIZBE1wEgoo3M7up5TnrCSi8PF
	06uvaqQcZJaRgz4BwOuAD8rlwESYObzLbNyGyLVvF50c92y2sKu6E1CR
X-Gm-Gg: AR+sD12uqBuYzwkOVg+utDtYkequtnQKk1uqJwvDV0+RkLh3eeXAhz6xy4ODa991erO
	oR9ikyjAIth8OaY0hWQ3LZm45wOnoYNBy66KqsgqLQK916tLm8CDHNpH5OqZ41rMAYTmdRwhQwf
	Fpah33ZwKWuQLeY3cM+h+k0NXKwLGIHg56+IaXRQ3ZXT1z1kbKB0ELK9y+cT4U4xXVVHAdSj3Dm
	VGSKxKrh+XEz9HVTqQ5EVMcA9mJHYMRb7m5GId3jYEvVWh/97zjijjVQ9a6BztG0vgulR0UAWrg
	eJFAq+aikRro3hyBGq2Lcc9XRt9MDzs9lxONr58/GHIKqqxoU1kWAAOKCMCKRZ0TQrxltC0P02f
	DX1FioIVs+OGrrDMrR6kHoHSXMmriSbovBCKRUotVMb+yhZSc7vsnzaeza5mW3dXJlHg0aQESYh
	zt+n7Y+NEGpth4pJF2CKkDJirgqjo15ePMALAP/ftM5QBji22ouVhjw97IU1WK+3YgSeWbi67iA
	aCZ9A==
X-Received: by 2002:a05:6870:8326:b0:45e:9b66:7175 with SMTP id 586e51a60fabf-4659a399422mr9554944fac.16.1787771457575;
        Wed, 26 Aug 2026 12:10:57 -0700 (PDT)
Received: from FredPC.lan ([2600:382:3107:46eb:31a7:8fef:9fc6:7e8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-465ad9ecc2fsm3060369fac.4.2026.08.26.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:10:56 -0700 (PDT)
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
Subject: [PATCH 2/2] smb: client: prevent out-of-bounds dfs_info3_param access in copy_ref_data()
Date: Wed, 26 Aug 2026 12:10:33 -0700
Message-ID: <20260826191033.162320-3-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
References: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, copy_ref_data() assumes that numrefs > 0, and unconditinally
accesses refs[0]. If copy_ref_data() somehow is passed an empty list,
this would cause major out-of-bounds write and read problems.

Enforce numrefs > 0.

Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
 fs/smb/client/dfs_cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
index b0388c460499..b51c8355d73d 100644
--- a/fs/smb/client/dfs_cache.c
+++ b/fs/smb/client/dfs_cache.c
@@ -389,6 +389,9 @@ static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
 	struct cache_dfs_tgt *target;
 	int i;
 
+	if (WARN_ON_ONCE(numrefs <= 0))
+		return -EINVAL;
+
 	for (i = 0; i < numrefs; i++) {
 		struct cache_dfs_tgt *t;
 
-- 
2.53.0

