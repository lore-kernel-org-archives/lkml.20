Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787996;
	b=z6YhgolCaa682SVW2XPEkMkhhOfE6m0oqXiyNmQNy4HayJTOQsV2W5z4kgbe8WrFX7AE
	 /QZmo7lmAwQ1R+b92W24RHq52vKPHuts6gmQKOzezPtgR/xpNDywO1xDB44Fp50m1fPU6
	 gyQSZiHLs0Pfu2VMJzNa0waAXfGT+esDTfat3Kntp8cJbZFNGamjzFAdKaaXxn+yFki3r
	 dYrdmuQc1CB/yn+sF07WFXVVgu/W0hbuUMFhuH/0uVT8i9MeqMpw7AoVUGbsLkg8uNejj
	 SoHRMzi/HDAqJyn9b7UC4rl7XdpmAxNLxGyHbfYi6tjw4F+6z80BIwbcOiStNyqocVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=67VFriUns2Mb7cXVKJ9BBxQRXg8N4dY24PJfmsDGRgU=;
	b=tIaydGHLNL0YQJOqQg0AxjdLyvai1ZYoqYxewvdv9YMNmMzPMqCc1U6unxvFd/nYqfT5
	 Ddpb1e3ltvDfocTuBtBkgAaAzlhjsnBuMJZbAX2dJBj8JqiS41MVk5fhDiKshSjcqF+oS
	 Nku7swLJ3uvOOpbLYvVthEH6pposyan9vxWu2nemEarC0URy1Jzsq8vUee3LCBhbtNDyR
	 6wQdL6526M5LRriUaanRg+NsxWdWm7D4ZczzuKMCGitSjh+dWSs57/CEjPapNa8Bjgyr+
	 nly3uST/H6i7/s7dFMa5DseHdmVHHtmz3EtWayjLuQgSM9ktJCj8lhMn+le4FE3XHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EC4u4kM+;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC22606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC22606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EC4u4kM+
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a64f28d0so28284526d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787992; x=1793392792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67VFriUns2Mb7cXVKJ9BBxQRXg8N4dY24PJfmsDGRgU=;
        b=EC4u4kM+S+fjv4gCfuKVx1/xI9e9EQEbCORIa+iZOx3Rjyqi7kWhSevj2csTkRA81j
         aPphX6k4zK0VHqeQCiMn5PS3u3DsM8I4Eip89MMZULwA2rJUaOjvyp4o3zpi9Ms8IHIk
         bWES1TF9Suy8JcMWsv/SblfTYA/QZnOfhevgRgMx+bHt5wvX1K3UnSL6MZYvtv/Dtso4
         m9DjYN9eZmCWPCnT2DP/KrgvbqB+bMd+465WHgvVx6pECAEOoA3X2thMuXakjDAfo9wW
         lLGgB66LwwVgV803jxjpHyjZlN8tFABDBLt89vJVM6lIVz+5hCMhJ35zlTZie82G9YGB
         2j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787992; x=1793392792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67VFriUns2Mb7cXVKJ9BBxQRXg8N4dY24PJfmsDGRgU=;
        b=x764c4zYE+H4JK4hjBzuAGA0RMHgFQ1wKxGKnAJedJabFYdIOgCXWrNSOB7h3Q0gj0
         BHxDZw9OneoKBeosJfK+Uvtjbl5CZ0qdgerVbnmSSdvONw1+nM3BLyWK9FtO0cwjCTv/
         MNf0LoJVNGZc6eDaweyi5Ns47SxTrvfvCtMuIJ3oCzLmLFveBbhHTUQOhNGqNdBDBR62
         TtWSiKorTuKAaz1lFlhMSPqJHFUhHgsfqnTotafhWSzCIjS9ZtylWN4LHteLmeCc7saD
         d5HJF0rera8iv4XeOXADTMtI6acphmp1iBbpFfLtJYqv6kWi2nT5O+/gGycxPcv9KOiL
         doTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7MLcST4P3JmZUo5dEMq6KE1rBrLmEPL0ZtW+CZnKP4Wp0AVQaGuxzHWig4jVBkq9Ky7g6dC93v2FuqdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJDqmrz0Nd1H1D/xP5QKMlB5cZqhaYrOjK+L6gIx3Nleq0rTYu
	jCfW3fuLpoFIBdVAv8Gl1nwzAvoEXicoqAvq36R2mQEJvLCWgGooZ1HdEWKNLXIxcsxAk2vh/0c
	DglLrOH0=
X-Gm-Gg: AYBFou13dXD+YIpX2qZeeLl7XEc3+omOq3W9WNahP4JwAZ1miDXZT1keEjqEl+gKOY5
	iHxP9J3cgW2nDwgt5pu2IuJcmbOtnfLmXNoe0MYUmLHmh/BvfWhiHBgKvhqrr3HoRBg2v+v9Zno
	epkVOdTcFSQnpjE6UB61ep5uIDN/yTHATDR1Eegfm3Xvq/lOhtR5KX8KpTiYwgQ+kMzFtxJP6JX
	vwfubOts4abVvoCMqcgQ2lH8+NqxJfoT3g5DrT0/EZot5E9bmNCjqOxqkjUJIPZ+7usI8FMX6H3
	NNNpYRschJHPembGMsFybDbjgpL0uQdE/oXyyIiMAXmTyjwG1FwD/QILdWb4dsQCVf1R1lK36n9
	xaAMDj/RKbL2H0C3LRiG1C/bEKcqpaHDKhoflICh1DDfcmmeP6IHR06rGYa7IBBJGkBnf6AoQjD
	qmJ2U5mHm1o3kQPnf1dUcr8V2Bq3zvf3VyIp3BVhdRjEfXqkGQCD/gr6h6gVcf+X1t+K8gNEcf3
	Wqki0TdM4ctwbn49FSt9mPN5f3jokI9Tq1PqMl6B2i9oegRnClHeXKLCq8vjMMRr4xKJjk6ARUS
	X/B2xdWkdQfa0PSXjyw=
X-Received: by 2002:a05:620a:1a1f:b0:93e:c173:f691 with SMTP id af79cd13be357-940efb284cfmr21595585a.37.1792787991671;
        Fri, 23 Oct 2026 13:39:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a771c9sm2527985a.34.2026.10.23.13.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:50 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 20:39:34 +0000
Subject: [PATCH 5/5] fs: make umount(2) of the root killable on s_umount
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-s-umount-killable-v1-5-844a341ff1df@toxicpanda.com>
References: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
In-Reply-To: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=910;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=p9A3xo21a9LbtEzxaqKkQt76AUeVVyVBHPs8REsoquo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKV1DHWOfy3oLYOIU6FV1hzHYcxlv+68Rfc9PxOe1ez+w+LSKrg0baWQG7s+Z6mhqWsnfd9BzpW
 EaFgGR8ttJA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Unmounting the root of the caller doesn't unmount anything, it remounts
the filesystem read-only.  So it has the same problem as a remount: it
waits for s_umount in D state, can't be killed, and keeps every later
reader of the lock waiting behind it.

Use down_write_killable() in do_umount_root().

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/namespace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 837f531e494b..b874accabf76 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1897,9 +1897,11 @@ static void shrink_submounts(struct mount *mnt);
 
 static int do_umount_root(struct super_block *sb)
 {
-	int ret = 0;
+	int ret;
 
-	down_write(&sb->s_umount);
+	ret = down_write_killable(&sb->s_umount);
+	if (ret)
+		return ret;
 	if (!sb_rdonly(sb)) {
 		struct fs_context *fc;
 

-- 
2.55.0

