Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787987;
	b=18uByqqK0GvY6PmXP6IkVG5eOJPeZ4ztZE4JvGLFGQqOE1rH+Jt4gDSLJu1myCSVsLOA
	 yoY7BSVzF1I9fb973zQHfvLdJqdqyzZc1eG4q+2PfdV4ArBAP/od8ZD937D3GYdqMf7jx
	 egKXfYpHRoX+eIBxPOvaDFK4QANxeNt99bgtV6zg5m6VIe0RAqT3uw8jB8Et869+AllEz
	 +ckBrj2dyJXrtvmiXEwJi37JGPfp9N5O6kVzAFBim8HnYDnjvOcbW6rGeIPkPZlQj1NiR
	 CNT2Cv9x/04+4wQpaPfqyxOQYFCfCmTNEcRgqmhUVEx8tKjdQP8qf+9NwYdggVcvcow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AMBk2ozAsAYSDGmMrImtFK9mVXu59cpgop+gTFr58yw=;
	b=tzEDOq+4h++yqR7MGR6u7lfvbdLw0Bz0vqenGU/g+IzS6sVFUFjj1Oj6/2Jqy+O/+T/7
	 ifwgi6hAQGX/2bH0RAFfywUYjLBck8PgPUJw73zJGTl/iJ9HzwZMKbrBSqg6DN4kfGXYY
	 yhQQng6LonUvxe12vv/jW8ZOZMw7+i5DKWgqXKW8DJfpPRe9wk+7baC2iooNRk/6+nxh8
	 /NyYC3uK0DdVsV1hNmbq59hwI8qYtH5lNoqVt2zSTZ6S1r+srRHrbpEWCaVLemUj1jN0c
	 k8+lldcF10sEnDWiUb/UVm72ToI/92oDR3veahrWHussVNcOHc4n9+gCpFbNG3ioZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=dorkq65b;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D1F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=dorkq65b
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9178aabd30dso11922146d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787986; x=1793392786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMBk2ozAsAYSDGmMrImtFK9mVXu59cpgop+gTFr58yw=;
        b=dorkq65b3wraiMrQF1f4TW1yqOA/DjhkOsK5YN4lzW+lfg4wsvk/fOSHcLO0feyWNL
         QOR5EzYwmCtuZeEsIBRggy7gYQoWg21a8qOUutRMXd1JtzBglV0Tg+LJO+oCnyrZBKVl
         rz++C+xKmDK2w4rJsL5PkVkYoULzM5g9l29C9N3ePm1kSrO/fk54o5+JmLnCObOAsFuc
         bqObcGekz6g9SXOWlE3zWuyZr2n1tnHLd3B7hvQa3xrwENO5xZiUKYb2y3Bycqf/qfoZ
         WjSKadYyhwdtm+ZzBvrQpvAxgFED/krMmMOV762+0IwCvObpFk7tY1qtk3luN6J0ZqlD
         bi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787986; x=1793392786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMBk2ozAsAYSDGmMrImtFK9mVXu59cpgop+gTFr58yw=;
        b=G4Jl6N5uI4j9qQE5A0cEphCI9U33IdS8wen0TtmGxpKQ7xYVr+48riZR/ji6FkMM66
         Wv00xnaci8hFKLZ8xCxxOA0udGrPjOCjY60CihqHBEw2XWG2vE06a5SgHQI72+Cr72Dn
         28Y0irz96LZAvT8XDmHuZiVypCUrXKbITjAty+hBLTAp6608wrgTI5C10rUqSaNg3wKl
         16JgoWB7KHTwuqmuM7S1ZnyfQ2rzfMQ8u2p04hRer+EivW3Iavlq3hkXgFOPHZzrjiGo
         LUvNUdTS/vCf38z2077SMr7QYnK/inawA6lkY9hdOWIMrD1i7KVtgBbVnm8uP5HSiHk/
         5nkA==
X-Forwarded-Encrypted: i=1; AKwUvBwUFdwGO670tCkYBU8JsExq6wFDhFxTxcP0jmRKrz8iocKqpitWfMi0dVyPcDJ04jHfeohJRnlQsyrzUn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoKwVM5bYu0qp+VkSPxBv1l1A8rbvjjcuag71Vm2TD/8csL+lM
	0V7sdf64TeN6GVTiwElzWlFIIjAw9zknqxF2hQ1BoCc2zmvH22MoJCQLCHXnLwB3IV05aJuLsKg
	8lDp5BZA=
X-Gm-Gg: AYBFou0yazb7YiLvQaRVGTb3gQTNV+3iUUfcxHOe0WV0cJGFR06m9lppLnS+Uuri7KZ
	ex9v+cLn+7E+MilMbRY5cOuYX82QX9x/dnTENOjNdCl/eF4HTNuwdYMrrW6h5BWjrFpKwuCsMp/
	qHWQNGu4DV49c7dyyIgfkvulDb5731IPws+nQMlaU2thizAILWQVh9oHP93YGJMFxvcViBaLD9Y
	UToChBZeJQRED2KmbNPQ053xpc9TI+cW5D6vRIFCGlU0wKSb320t6WpFAHv/tx957i7QlVyXwxr
	CMBdRuCX9tH5L+Wc80vhA0rveEfwWzgeVbfUKAj4NXjOvvXEJlHdNvoZbdAG3+/A9zXvFdqfQt0
	4I0B6MFx2jsOmwW2xO64HNOMPKRjlsfrcI5igUrTBMbUn+HftePq0K/4SNyJXpZWUQR+r2emrWN
	79ztUY+EnwppZixQXCn5lrdYXqFZeD2go0miQK5nJCnDDGwDZMOkV1caCZRfcigoWo3HWSWB7a1
	q9P2qrc/Ysi2Sk2m/ydxtth4DpiL8VAIIWRnYal98Gyh/5RtYGE7k7k48eyZ1LWvhaF15gf
X-Received: by 2002:ad4:5c88:0:b0:91b:5d3b:4abf with SMTP id 6a1803df08f44-91c48eb3cbbmr2918536d6.52.1792787986400;
        Fri, 23 Oct 2026 13:39:46 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd1d42sm4059876d6.12.2026.10.23.13.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:45 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 20:39:31 +0000
Subject: [PATCH 2/5] quota: make quotactl_fd(2) killable on s_umount
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
Message-Id: <20261023-b4-s-umount-killable-v1-2-844a341ff1df@toxicpanda.com>
References: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
In-Reply-To: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=1587;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=y9KAa5l0YqYGEQZOMGAdty5zYtWUqx4lSAJyffrFhPI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHBDw973e0WCTK2eaNm4OEDb3Uuc1sI/uVtNgOAEEl2j3Y2dir4EpfZpCCxcn1nCnUY72HJ3k5q
 9be+I8FIwJwM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

quotactl_fd(2) takes s_umount of the filesystem the file descriptor is on,
exclusively to turn quota on or off and shared for everything else.  If
the lock is held for a long time, by a syncfs(2) on a device which doesn't
answer say, the caller sits in D state and can't be killed.  For the
commands which write it does so holding write access to the mount.

quotactl(2) with a device can already be killed at this point, it gets the
lock from user_get_super().

All that has been done by the time the lock is taken is getting that write
access.  Use the killable variants, and drop it on the way out.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/quota/quota.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index f906e4fd3f0f..94e6407734c7 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -997,9 +997,11 @@ SYSCALL_DEFINE4(quotactl_fd, unsigned int, fd, unsigned int, cmd,
 
 	sb = fd_file(f)->f_path.mnt->mnt_sb;
 	if (quotactl_cmd_onoff(cmds))
-		down_write(&sb->s_umount);
+		ret = down_write_killable(&sb->s_umount);
 	else
-		down_read(&sb->s_umount);
+		ret = down_read_killable(&sb->s_umount);
+	if (ret)
+		goto out;
 
 	ret = do_quotactl(sb, type, cmds, id, addr, ERR_PTR(-EINVAL));
 
@@ -1007,7 +1009,7 @@ SYSCALL_DEFINE4(quotactl_fd, unsigned int, fd, unsigned int, cmd,
 		up_write(&sb->s_umount);
 	else
 		up_read(&sb->s_umount);
-
+out:
 	if (quotactl_cmd_write(cmds))
 		mnt_drop_write(fd_file(f)->f_path.mnt);
 	return ret;

-- 
2.55.0

