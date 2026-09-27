Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983F3D5C05
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549409; cv=none; b=dMt3WSr+NQF4QM0FxAHT+adhQAY7nYZfTAwl2V6xETDoyqEyBCwnyejBxVYF5RvVmEVrJcu5OAqT3v+fDxc26UmrdlKbW27gKoYnzhV1+qY9lLGo67CQ/Q6c9QhnIIUcTw/2rXESp2ji+JZWSFSy7lCQ8gR0S036R+dmUUrpMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549409; c=relaxed/simple;
	bh=xnMkM0G13d/99Xs7RMKUARa0W6RoJ0+onrZaWW1xL1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnGaU4NdMTCo502QcOhER1sta2BCUoFDazK5lHXonut30D6unvpWbEeodQ/piRnxsuVhCJVmXcklGdgZCMIfae4wuTPgg1CEVVI8FOkB4Pw/Q1l+H24rk1//CDng66AV9F48PqvwL+1dMvfu3CxMdxgco8T33CurxqVMyB7UQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqA2Pw3D; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqA2Pw3D"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so1580245ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790549407; x=1791154207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0ix5EZDXiF2tF+99ranIn+ggS6Fcte418NHD6GLqsA=;
        b=fqA2Pw3DGnsrV85gr+5OFaTlZrj8pSAkAsxkchX6Baa+qbSdfZ7tRnjOfDeGCekdmn
         N6xQtBwJh4c7eTTRBtRezfQj4HQjHVZom1ALX0pSK7iUq1D2TPm95SrTo2jzQz2SWDe7
         R1i0tFDV/z6W8cT0L9DZlefo9novQGUCyP910oDBnkjWnqviQx/JjXeLalMmLivpQr8J
         woUft95zXEJIiw5mPMGIF5/owyLQNPL7OGZEov83m4ScKusHcWjBKWqVxMuxv69OaG9b
         +UMZxeOBT0LKui0zOkTxRYB8dypuUIlruoBEq80iU01WvA7ocfWa7VoP24x6gO3zwK9W
         ePRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549407; x=1791154207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ix5EZDXiF2tF+99ranIn+ggS6Fcte418NHD6GLqsA=;
        b=m/ve/9GwzZBpUSuv00MMGLYT9DmESTd0cNfeutgBtU1pyIDlooZ2n6z7HxdwAXxwon
         /2ipX7pNeZl0Hn2xcYtqycty1U1JBsKuUv7bZD5iXAHhM22hMoefu0srZQ3ff9KuJEIY
         ZImIPMhWxXy5zfJ3f71dK38MXaB5RXY5qOTDKyyYbtP2rnUeeiF4MaV5Q9ddIIeLr7O5
         1mP8INY3r1Wm/0OoX4czMULTRIOWpTPthlLyRhALZ12Sp1OVyM0dFygapZDCcMyDvrlZ
         OnXxQkBvmALCwF77CAwxXIxYPWMrnHMkVrkZG/PaZdpvGNpwzc7huH2mncwtpWURkA38
         AfcA==
X-Forwarded-Encrypted: i=1; AKwUvBzvaLZXM6Ag9TbWyd7gMxwtQTT+H9rq1SvONwwcjATRpFENUk1I58Yph+VNFJP3bE2C6Yert7/3qnnW19w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7RqIDfFbHVoWy0deRciV/MapZ26zem5feDk7ahL4Un8oS7e1f
	zjgzWEq4gb66tf5libwqdo//uIQ7KSKrxtSUGbnOlClpeQ7FewTVU0ab
X-Gm-Gg: AYBFou1veWZ5NIB4Zpe9JCFQfN7tKCoiMcJ2vFOm99des4yQ11XTgzZO0VzgwDQ0PyY
	P+fBdLxYvunnFnZfNjtqvjyXVsOOJVKpgA7Zbgq+qY2MxvxpRPsypMmY+qpIR8iBn7C4FXjU8vR
	2biPZ03qA66v9TggYtodCoIFf3g4kDZhPTFEQACr7EF8d/U0UTe0pFl1TEUOR7Qc/X5UrYgR3wO
	jC+t2ddibZyfmDiIk3xXJlcrr96+/s/cS4f7kX04MZrIzuxbvCnyUB95jAdj9nFSb0rKkxebuCW
	n4kBPDbIpWfnBXdO7BbVbVDOVpPGtOfRn8HdylmWK1S+sj/GmGhiF061qxnCrGgyCycAF9n0l4c
	oaN7Nw3JGbV8vYjDxpC3LLg97xGH5sxjbnAT2BR47oAMcfEvrKlv/8DcEXeAeMr9jw4uI/QhPJk
	ydJqa0hZhSAlLv4x/D/9gQF5Ou8uxx8QGOQvnOByv14PmhqHCKd6WtaOukPPVJJn6g2j8xHhQM4
	W92Jq+P9vs6bbuO6/MT3J9IftoLpNyEa96IFGkmMITe5Z+zWpQUtR3P2aCE9oxpsTi3eRLH1E26
	3HpFRBjRvxO3PdB/sTkorJ0ejVPU5y+93CdN97qMhVxXQ7oNq2hwuG3wCXU=
X-Received: by 2002:a17:903:2ac5:b0:2df:b45a:b673 with SMTP id d9443c01a7336-2dfb45ab781mr27172175ad.41.1790549406960;
        Sun, 27 Sep 2026 15:50:06 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e13c8sm31971165ad.25.2026.09.27.15.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:50:06 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Hui Peng <benquike@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] qnx6: keep the top-level pointer index unsigned in qnx6_block_map()
Date: Mon, 28 Sep 2026 06:50:02 +0800
Message-ID: <20260927225002.509062-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qnx6_block_map()'s top-level index is levelptr = no >> bitdelta,
computed from the 32-bit block number no.  With bitdelta == 0 (a
depth-0 tree) that is just no, and assigning a value above INT_MAX
to the int levelptr narrows it negative; the levelptr >
QNX6_NO_DIRECT_POINTERS - 1 check then passes and di_block_ptr[levelptr]
is indexed out of bounds (UBSan array-index reports index -16777216
and -8 on crafted images).

Reachable with a crafted inode whose i_size is large enough that mpage
asks for block numbers beyond 2^31.

The only other assignment to levelptr, in the loop, is masked to
ptrbits and so is never negative; making levelptr unsigned leaves that
path unchanged and makes the bounds check reject the large values.

This is independent of bitdelta itself being too large to shift by
(depth * ptrbits >= 32), a separate bug in the same function that a
still-pending patch of mine guards against; that guard leaves the
result of a valid shift assigned to the same int levelptr, so it does
not fix the narrowing this patch does.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/qnx6/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 6de49333acad..7df3eed5142d 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -117,7 +117,7 @@ static unsigned qnx6_block_map(struct inode *inode, unsigned no)
 	unsigned block = 0;
 	struct buffer_head *bh;
 	__fs32 ptr;
-	int levelptr;
+	unsigned int levelptr;
 	int ptrbits = sbi->s_ptrbits;
 	int bitdelta;
 	u32 mask = (1 << ptrbits) - 1;
-- 
2.55.0

