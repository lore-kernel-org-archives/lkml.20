Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9F563FCD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882017; cv=none; b=W4ovcxjmhqDv6Q5l5JCmry4I7gxws54xj/yRNUPPPlRqjrD3j+1oZ9LOYgjj66Ks1SIl2rP6BZq1pSrEQX7QtuDcXbkqlKrhbxOjlRnbIh/wbz0g8rQGWvLnMgTzrI3jPuYyl8pZdzSUAZMVIyMlohhVZdfjM6McxEo423S6n5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882017; c=relaxed/simple;
	bh=Aj6AYp3maj+tj00AwRi+vq3RYAAr5WUFsGkiGMfxDcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBzEaoaNxZtlMVYISXkt9YfdEvSymKHPHM6uZl9fexB2WGTZ+RW3x5BXTKxpfQiy/ztAmgRA6mjmriXMti0100GbVkF6YGAIDj256nMI7gRCsyvhFxnEi0XlraVZJHHyEiD7e+vCc81dFIGBqoMsSOT91GNzwZP1Dpl1W417LMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGvPOQYC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGvPOQYC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-86309e1a213so1034084b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882010; x=1789486810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dV6ss8HzJsDKo2QErOAqMqREcJvXSKsZBavq9KzN7cc=;
        b=gGvPOQYCj6qPofAhssdCPer3YVa+MufA+B3LC5hj0b1VhQU029No+AOkIHqidUpvlc
         D8G0Phx/6d9fVD010jJxAXXGM88DShTjvV7GqJulJo5JmEEmhrINlxWfUtp9Jwgus157
         3/SRPZQZbjl7O5EgtsRZjmbBdooZL8pINE16gQDzGU+fx4LGMBFndVUNiwjvHm0Lt71g
         PSr3Q5QhLnHuyyziX3ftR1RRMoRdm43h0W64FmLAUE1Yb75xaDBUutAvn+8VrNuIo+gM
         FfIDUMt1htxuHHvJm8IarfcRNyAa72nBdk9U2f6AKTUw77fiWvpWo3OBY9/TavamnAT1
         Drpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882010; x=1789486810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV6ss8HzJsDKo2QErOAqMqREcJvXSKsZBavq9KzN7cc=;
        b=eXls1dpOiigOR//FHzhdc3WAZyZkdpV/ioTZ+eTlq5WdXHBXAcX2BLDwLy1HghRuCJ
         yF7g815Q4x6nUyWVfTJHWvtcsC9NUKXHNsJ3kmuuIJ/G+KXIx8l3yzrOHyg6HzNg9KpG
         +FojGc062/25tt7ZtVUu5H3WJWyo6L0EeNo759ccOMuROyuK0HetUfkKnbDjM3675OAH
         yI12V+fFdCL3376BSk2+jAiuhKGJucO9Ymo6dsy8FZyK2PQ9Fz2uJoqTTN0bUTE7Phr+
         G1RjklneuOMvh0ln1FdKpbZt0qdmQYFLRyo/HeB7lvSkmc96PpALg5kEQWOowXLRNPTo
         YqYA==
X-Gm-Message-State: AFuF++k4acWq/ITwFpGYEVarUxw1cLzVRmf9uv9omFLl9iLBkFb5RxzA
	OOKWA5uHHFQeL5lWgGSkhHJnZS1CRHlXmPib7fXpCQ/3/BcQsSVOyVio
X-Gm-Gg: AYBFou1odh9KOwS/NZ3JQCPZB1BT5xiVgrwgpcjFe1t8+3Gghn4P9i/dJQy9yokkgsx
	FQ+IFyhPKga2IxhU0tcKT10f5Fu9CR1t8+lfJfspbUmn9bJ5xcAbacEAXhExf6usXpdzeafncPO
	vHpHnNtb/a5UPABT3uG3Qb5veN65I6UdrrjXFLt5CRqYRzW8nZHTJwDn8Auy+1M4l/yNBpg7Z70
	qaU0slU/9n2uYbbMRUajIjPsAbzQg8ZFvRqObQuguQVv1mrnPWmB6ky0+PHOrdb1q23tVqdf2i1
	9QVaSXybElJjImig911cb/3qTrp/EtISrPNkOHnI05Q2/KTpub7Vcta4xKTXNWX+hzBOm5SGA6I
	1XGy6ER1stTHDS0Yi26Hnas6yEFpNtXHr+j1UbrnDmft2chwzOk28VhWmj2SVFznbGk2NHXlHoP
	OJ4gLxy1lTZbPmf71X1LxeY+J/FC4tGCukbws0QWapzu6Xt22KyFZZKbD6Kzjepw8M0yBK2BXNY
	IzaAAJ1cTujB0U6AfghrlSsP8TqZLDH7027oxJ7QB0/RHnaY0cSso/J6324xF613jY8GJ75o9pY
	Gg==
X-Received: by 2002:a05:6a21:9204:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3da39b7183emr50093591637.5.1788882009427;
        Tue, 08 Sep 2026 08:40:09 -0700 (PDT)
Received: from codespaces-1adab9.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([23.97.62.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm35366914eec.0.2026.09.08.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:40:09 -0700 (PDT)
From: rivaldihormat-debug <rivaldihormat@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	rivaldihormat-debug <rivaldihormat@gmail.com>
Subject: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Date: Tue,  8 Sep 2026 15:39:33 +0000
Message-ID: <20260908153933.2417-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i40e_dbg_command_write() function uses 'count' from user space
in kzalloc(count + 1) without validation. If count = 0xFFFFFFFF,
integer overflow occurs.

An attacker or local user could trigger a buffer overflow or integer
overflow by writing large amounts of data to the debugfs file.

Fix by adding validation:
if (count == 0 || count > PAGE_SIZE) return -EINVAL.

PAGE_SIZE is chosen as a common limit for debugfs writes to prevent
excessive stack/heap allocation.

Signed-off-by: Rifaldi Hormat <rivaldihormat@gmail.com>
---
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
index 0b52509cb14c..74e75504fdda 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
@@ -722,6 +722,8 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
 	int cnt;
 
 	/* don't allow partial writes */
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
 	if (*ppos != 0)
 		return 0;
 
@@ -1605,6 +1607,8 @@ static ssize_t i40e_dbg_netdev_ops_write(struct file *filp,
 	int i, cnt;
 
 	/* don't allow partial writes */
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
 	if (*ppos != 0)
 		return 0;
 
-- 
2.53.0

