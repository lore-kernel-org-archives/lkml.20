Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320711;
	b=K7H0sdT+537Oy9Bsb1z+bVrrZDQ4CnHlUgLzpiH3qvakuFUFO/z8Hb5w6eojb/nJJ737
	 GFKw+MOBud0yhI48Htb4skVOQie5oXuuuNE0ocLsI7KZkgs7Cpmpv/qHhip6CFqbvhsrL
	 WtgNuuboXdVMTp345ikdKlGqXpXk/BB3c++G0vWCwH9Xsqo6Ps5gS2TeaQMkF98NDz9s7
	 0hwLgDWOu9nwwieKyF40XhzLYf/fLaJ6ZA2QJTucrHzpE586gSx8SShK9rDFEQpN4tpQz
	 hxyyyGGBV75087KdWKzfWbzvjkEE+HAi3ZEbF9XSQe8JS5SSOsluZHwPEfumUPnFZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
	b=c4e15guQT2sWb/OxKwrL4+wgED6ueg3eGOsQT1m9bgHRhrwzb97KR8O1nUP857QBoU1t
	 y9rvPzXW/Xca7TwsHJ+MnJ7aP9FwNe/XvD29RC95Nb5SKbwtpRT4LrdZtGI+z8Rxmt2E2
	 y8siP+XjFTjhBOvHboWZff5I+T7GhG6AUvg3F10y/R/NKPplNNN7KCt545JTpW6w9U9d1
	 3fKBbW0hLutcj055Zd/ryxiZ3j/2QN0OacI9uaidHHWdqxFIs6XtijfKR9xVCUNgkYKce
	 R18AXoyuL2u7hbhI54nNAouU/+vzWjDnhfnh8i1WBKBZobD/1Eu7tNZ4fB4HGG/1Chg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="gMvp/4tH";
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC860A6F73
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BC860A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=gMvp/4tH
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e635220b4so188997785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320710; x=1794925510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
        b=gMvp/4tHZPlWdcSsmWMjI/yNPB0fufeNNrLxVB2i4TwxZDREnjr76w0+nPjrm5vLwi
         D73U8xUzIq7iEeAKifVdrzICeIAZdmR90LYDol0kkboU4Aoy5mGJrVTiVLiOdLoq3Wk6
         z11Vdty7lHJiMDF9CZE/Y4eDs7V95i2wlK0hFrVqxS1vt01ZGWaMGd+o4DwQvtetE0J2
         xDtw8BsuPSAXvc/I08lkJ5DVlSoLJvDOoV1MJi3nE80CTivTmhXDGtZrJeBUGPHFavOV
         9lg8sPSkdFYX/+uMFzqAafvq4RVusxDTbiD+McY56ltl3YmQ4W+ZAQkie9X5/E/v2Axf
         +7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320710; x=1794925510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
        b=NPUf3Q/ySYNdWWfN74UZSL9xjWHvWo8wPPJR648FbMKVzkEHpqooM/8y7F+d4RRk+T
         qDMDL9nvv2JCg2+9lLjTbE8E/dqoPgKbM2F10G0RqB4e8crPRmviV+pSsEuCzsbhdd/1
         0r5x3rQnDFe9pUZ3dtuj3gqJf45xjWTLX5ZRk+qVcySMjANAgmWbn69mMqwFvqcOr/q8
         aPKVHEJxIE12LJ3EzT6PwUh44VncfnRcqEEtGrdU1QGDCx+CVp46eJqTYmBdM7lSO/sv
         RCwxG86SeBwc23U4OJAbCr22Tc6XjRqrkuZLLCYdUyiYofYm0KPnrzbPzVtlg+0haX+G
         wQ7Q==
X-Forwarded-Encrypted: i=1; AL+hErFiiXmekb6a6hjeyrPSeNuVkHcfjUJojdmZmVlkc2YoBR+eCnfVJ5eRoQ6/m4P+du8Oi0HAl8XX/9MEQ0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yhGyC0BMP5dvuCrLI90uBFx4s1UTmpW6LH0mUCx4z9yQe1CdL
	gY22iMJjSOBYQ5O+QNmfBan42aweXHwcJA7q8TKcKynhxYjFi3EaVXKhiHNuBhZhrmE=
X-Gm-Gg: AYBFou3XYml8M95rOExZRbVSWuTO/Q/vlqbInKKNi+zZG2SVJyMiWmTwLBqLt5Ez4EC
	ObeRzPgMwX7QqqZ+fupDkoK5wfPy+RroN2i4S8+qe+ON4kya1D4iA5/nE7cDF8pXc0EMHwrTD2w
	rnKBFKbt7FLj0jQm79nXNo5bX/DxkVYESAfGVZzpJ/Q/DBBnvasGRO53Tc3+t4e4EWMmcid5UU1
	gxIkZbGZQ5RkIKnoWzZxk+rjE5rtLzLrso/nX+kDGNyoODXqJT5v+r72aNibA+qNyImjVZCg6xf
	4pkvPptX9GK9LEhEI+Z9Cvtv6OTQKQjD7bvjbzUULK6uM+mNbusbY3YxaH+QnZ5EFjR7jbBV+KV
	nHdxEPVa2HoSoCUZjyu3LCIcqVfP3EoL+xsR7GykCnI09/+coxVlDyynVuMLA37CZkIILApFtlU
	wHU5DyZFOXQnZr1m4tAVVtiZqa8amYIiB8ImW22j0lMmVe9DVPqzUTPAxm4cEisEiQAroMbIhZy
	UPV1No3R4RbSjiSuW8j77UaIvoeWi15jJRoep+r+iUOV6Ifq7PaDsM/LIG8m9zOcN7AIoY23uBn
	yL0NXjOfCmvfPkHheEuwkgvkboz0mgZHnJ1o1rLQnZ07KOQra7FTUqoRf3aUtz1ycc4=
X-Received: by 2002:a05:620a:45ac:b0:943:faab:a149 with SMTP id af79cd13be357-9479f38f7d8mr474237285a.63.1794320709592;
        Tue, 10 Nov 2026 06:25:09 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e770d7csm235081585a.17.2026.11.10.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:08 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:54 +0000
Subject: [PATCH v6 6/9] ovl: cache dirty overlayfs' inode
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
Message-Id: <20261110-b4-ovl-containerized-sync-v6-6-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=1773;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4vtTge6/ThBXumR/B3MN7k2/gMZpZtKv00zfzARf7Uc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHMUwCVvUHJZIqDJQPoatfq/63xIDsZ7l1dryd7bHmkdczxNnDK72RycPGk1V0k6C1rUbAWZrUU
 LCp+SndZgEg0=
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
index 41d0d37accda..ccfbaf9d8797 100644
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

