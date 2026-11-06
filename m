Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972228;
	b=J3fR6b3N/TobUWy0JAsOmppyGtu+wYvaFWmKeCSthcOPhz6xigtpsylEH+ox4kwAK01q
	 OWBi62J/b6tKprTYt1s4cA4ru0XbZ7CKL4p4lAPz0whg1u7C3X6VKFaoEScD4TlepsQCr
	 ZejcUkd4+pNlO6Ge4WD+DGtLl3avjp8HvDYoe+fIJPzTyi9ICDb5bPNTgC3WGpv4r8Rj1
	 RZ0r9yjOuz/6n5L1Tb/c9lhKiJwQgSz/LZNBRS4K0mGk41FPHQClaHVs/reu7ls1Koo9/
	 vKQZNCSpsmkFYsuYgJEby61nFkpHdZxRxsUkZq0kKV3si3OfUNeuSufHKiPsmjTojpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sLwuZPQ43zw7H/off7wRnGr3Z+fljgzkXkXA6hTWCoM=;
	b=NUIx/81a/9TIBAm56TSe+Rbmu5tgnwaILDpqRBEbGyMbR3vWirlHoy7HkKxoqnsRlNtk
	 pHRNI1QBQF9WpFrcBKrNqkNxIfIfOB9M8xa50DT2WssPWHd4SI5TdUzkLzIjvlOW4YURI
	 Q3K6UWRW5lXTR7qsEIs/yl8h4RwC2F5YVAk5pck7oOOuZ8YByKfSqE8ge9ZmuQ6PkYMVF
	 PpSxgDD+T2q8ktfmoWnDnP8Xd8UPe1x081M47dRireOviBgwkwpEbtijZJI3x3Yjg1484
	 kBGa1I//DSLr41yFi+aIPm1F1VCsHlHpS4uXnOJ+8LRyTNe3g6H8xOZIvLuQ58/0/5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FzgA16EQ;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C723606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C723606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FzgA16EQ
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93efc0452b5so46715685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793972227; x=1794577027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLwuZPQ43zw7H/off7wRnGr3Z+fljgzkXkXA6hTWCoM=;
        b=FzgA16EQjljGFzaLq9tfZpfjLHW8Djd/nikKxTUArTpix3O6tl8b7uddLWZEcfoTVC
         32NwydsoRsnJIefKxGUjaZab/q9zugce3DrJaY1iuaFhN4iEMJxpeqdqXvYQKvT+S+Dg
         WkTEc2Llp+DicO4SL/2gtaNEqfaLSiIIzutec8q9EA0cE6JP6Sd5A3XZQ+3JQN3Fr29t
         U8xGGMb+2iyf/nBs8VvEoFIROUd0LL0leEPuuvp2aHvHseOS/K5TVkvga93OQNKnjLmk
         i40SlH3/fp8octItc1mH6qZICiYOARuwsPcHARyttPeW9s029/8HymAhtTpC6cfA2aGe
         nFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972227; x=1794577027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLwuZPQ43zw7H/off7wRnGr3Z+fljgzkXkXA6hTWCoM=;
        b=qs4slyQBspmZur8FF92KpYhAKarTJGlZlzoqyIv74y1Lht+l3VPV2aERl/HRuYeAa2
         HS3OIiAcG2xqWzcGkOu9D+5VWbLA5lQZpzUEsPIAb8pjG6sSy0qhPam5GxZOQv1XHpEt
         zbPT7lB0CPfKObQqiwrFFmvR3GQTK7B6JzQ+WfLRHYGY16BpxRryAyhRD/YLp60naOto
         OzmdT4FqNotmDfKCHbQw8mTY3csjolL5tsJQ6hgI/wuMpTCWrGYifjSNTHt63pJwLSzV
         zyyA6UaptlqndMkw8mT2i6TqTRnuk4BRqWiCaZjKeB3YyeGHkIttEC9ty3hkWc+2WBNI
         3uBw==
X-Forwarded-Encrypted: i=1; AKwUvBwUEjXIgZXkhCNh6oDuaRo/CF68eu0BPUtCvN7x/zvpFHCwada84LNuEg/54XCKGtgl1xGeXBkd/skKTBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vKMd5F+mQ79doPPMauJfQFuCpu0TsroYFhCh8laj245yqSbF2
	vZenP5RyeX2UTHKPXd5oeZOIMUtpF6w3oUCSKb+fTcd+ynsAFlLDEANcjGvubn5Yh6v0kS4KyHw
	H0LkNCuQjdQ==
X-Gm-Gg: AYBFou1sEpq4Qb6a19yqmUpcOzzHc11Dertyq36N52PuHWPwvcllNIabACEk51n0PeT
	/V6in7fTn+X9X32pBLuTa9by7DwgCYNGbCDDsRbwR4C+n0FZ1v2LFGOC9DldjO4+dCMosz7uvPr
	/RUkLREIJcWTy7lIaUoa+dztyTISf2KEkfn92zQL5ClC3hzCr51TIUzK6HuCDE+hin90+//IM+l
	hD8/+cpDyW0bTWvAHvYEqeqUrkrM0ZHJf2s5b22ba3sF93TG9omnO5QGGJKrWXnrRmrv0ni0Suq
	9UOUt7fAwYEBXNGoaf3KCsXlKQInAWya61lGrNPmU5S4ClC/imwRN3t1152clzdDVRyDRY9aOXq
	KGYJhmXPLNahXJnPS3A+KwSalbbdpJ3IvlPkSO0QL15v74k0rit/3ixusu+wkkuNEoDpyO9Nkxm
	oGTdIwWBZZQoG+0GF7LsurytOGr0rk5/mMlaMOJQ08+zvnVTrStTDzOzjQd5ORCppyFmRsAArTs
	O85lFG9se5YF/OS6I9DvEPIoKFDBo0iwlvhl8csGHFtibF9A+3KMj9cdgSvHAUvOLl4yYd9FQCd
	hi6LXFQOl0K7ve49CoA0QoaWPASn/p4Mz1cKlTeauA/YfQ==
X-Received: by 2002:a05:620a:28c5:b0:93e:7ddb:5098 with SMTP id af79cd13be357-945f34af8b6mr355669585a.25.1793972227555;
        Fri, 06 Nov 2026 05:37:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a95e82sm144243885a.12.2026.11.06.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:37:06 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 06 Nov 2026 13:36:48 +0000
Subject: [PATCH v4 6/8] ovl: cache dirty overlayfs' inode
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
Message-Id: <20261106-b4-ovl-containerized-sync-v4-6-6ddde0b7dd8a@toxicpanda.com>
References: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
In-Reply-To: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793972217; l=1773;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8D/WsTmpQhuh8wOYjV18U8givpb6bYlz8XjxGqBtv7o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA9RmpaU30QmRGQWJMahS83ENZAdOVQF1bFKvrcIoJI82hjYmRv/lISjRXjFBS8IHeqXVpuFldu
 fYqirWgLzfQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <cgxu519@mykernel.net>

Now drop overlayfs' inode will sync dirty data,
so we change to only drop clean inode.

The purpose of doing this is to keep compatible
behavior with before because without this change
dropping overlayfs inode will not trigger syncing
of underlying dirty inode.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
[josef: also keep an inode that is under writeback, rebase]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index fe4ff5c6ce07..87773b73f228 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -388,11 +388,27 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return ret;
 }
 
+/*
+ * In iput_final(), clean inode will drop directly and dirty inode will
+ * keep in the cache until write back to sync dirty data then add to lru
+ * list to wait reclaim.
+ *
+ * An inode under writeback has had its dirty flags cleared, and only I_SYNC
+ * pins it.  Such an inode is not clean.  ovl_write_inode() may be about to mark
+ * it dirty again, and marking an inode dirty that is being freed has no effect.
+ */
+static int ovl_drop_inode(struct inode *inode)
+{
+	if (!(inode_state_read(inode) & (I_DIRTY_ALL | I_SYNC)))
+		return 1;
+	return inode_generic_drop(inode);
+}
+
 static const struct super_operations ovl_super_operations = {
 	.alloc_inode	= ovl_alloc_inode,
 	.free_inode	= ovl_free_inode,
 	.destroy_inode	= ovl_destroy_inode,
-	.drop_inode	= inode_just_drop,
+	.drop_inode	= ovl_drop_inode,
 	.put_super	= ovl_put_super,
 	.write_inode	= ovl_write_inode,
 	.sync_fs	= ovl_sync_fs,

-- 
2.55.0

