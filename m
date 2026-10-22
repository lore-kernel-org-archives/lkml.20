Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664821;
	b=vGyRdBFwFNcXZLhdd/0FwWLnvihEwIdQSOT6kZS3khk/JYaoYr5Ih4xGGpvuRApCkaJp
	 G97rWSqHVB8sMlzi8EovRV3iP3zh+c404NwMMBh0trcWJBM1njWxOJwn7GCpYQKFxyODh
	 kdqVveRCXW9AnA30holejnpHmppS8Ooug//BM3wTy0snbGMi6q/vDEulpHsQPMoy/uMBJ
	 E1SLfaCwvw6maALOjXYZjZp0OjqB0VrrjIq1ngu+X+DdAMtO8OTD3yAyqgopSVkYbopsw
	 eCeRbYk65A6L48DkWpID6vpeJiD9nviMVklpPBh85MDk1LdVAhPoGKx+iLqtxhoG/VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e2KBzrPE0/o2A8dZGSaDZAXFxxxAfZMmxtyqxNNywSE=;
	b=km8gMG1VumR6bJgaq9gzCSYNJBbe/9EplkNwuB+i6/VMRZOysA5rL5+DKB28CHbGWEvl
	 xiImCSQnL8MvdS2iKRY4gf6sMDS7qSgJoaYTFiK/fKn9G5Gq25zJyeq2YVwOPSy4uUmxP
	 fUkC5I49a+XPzPPCqMD+JPDr0mMqQaYdyZg5ZPW9gQfv83QIR6Yk8KdimtvddqohEOlDO
	 LqFo3eMVIM05JGQwzYS9PWbAJGO8XGlAfRdO8FczYKmT6NzC1pyW+VYXVBVS+TBpnia4h
	 7uMdZFgEIFC57TtctBbxmGOHJlnRi3x4lk+Myyn7TFHW57IN2vAU8OzalJ97U6ChFdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e6PJc0B5;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DD606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898DD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e6PJc0B5
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so17301081fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664820; x=1793269620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2KBzrPE0/o2A8dZGSaDZAXFxxxAfZMmxtyqxNNywSE=;
        b=e6PJc0B5EaSmQK5D/4NzScSFnF+dysZ4DiaVEQcvsRB4n9qruixsu3G9EVtQffmTVM
         cbmf2gScCqWqkqf2x/DAxaEAqnCA1SCu3Br/aqavKZNcek8kYBxgh3BdHHGrq5BpfpL0
         tN1fCZlroTd/7jSHbqYz46YdLSojbk0gyHPbzkw9E01EoPJl2evXcj0aOgGAYe3IEeii
         1hivUzHYjdbTDDkiNMr32vLHqkeBB4vJBqD3w3iOxzfLmCOuCWMEgtWBY0L+AGjLVaIb
         t2oNQOgZKJljcl/oK85MJjeRKbMGSwtWXiADpiTqUd0KRGWbtw9lQfy08gaJ292H/fwC
         pl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664820; x=1793269620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2KBzrPE0/o2A8dZGSaDZAXFxxxAfZMmxtyqxNNywSE=;
        b=Qs2KIQUrtgZnu9KBwyxibwcMzwjGYNUBZc46tsTuEBvAsg6rJzeAzYl/SY0alQ8A8v
         f9+dOIA1pskrTj1MBK70qxYEjuXC0v2xJv/eqhrrcbapDDEfSwKLJihPp3bnrBmE7pzG
         uwSPdWqhLdrgVWhbGAc6wTM1o40wyBF/KRqLzxclVrKZ11Ha/7KaXlw2rkXIQOxdHAAC
         pxxgbQfDwe4rPJegeYSxykzA8TeSjwj385OdcrYc0sBtiqls5gRjcab0mpeGs4uzNnOV
         D825r5ExFrkEWvezdJWwEB4PPK+9eY2cCTb4L0hFEmuxiWdBMFy/kTVUYJWvB/5wkGdk
         GiTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5+hwDSwHqcyuh/gGhr0AD85CaQjPhBXWmjR5oLGLMkl0dkut4X1TMgJDLzOLV0X2RBJ/2Z9rcGwSUalQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfsHXw7oWrGbzToZljM41aE3FPCE2CmNrtymTIjUcnOW8n+91I
	JGBDVSEPtXoogCCaXDZS/A+Em4Rn5Rd9UzCsjiaCOdd+YLwGfMqBFDbm
X-Gm-Gg: AYBFou2RlDrqLKPMByPyR17UOy3gqzG3///7fi6mjyndgZQ2oXrOphscwyUHBoxVakt
	MZ5/1EM8P9fN2Mgw8f9bkk5/F9Xk/78F2S6ElLqb2VC1uvx53K4yoEvPyTDhxQ6e98x7xwfrfZm
	7b7tm4OdU4Rh/kE/ukZHtkN4GXJHi00ZmV6cVnIZMC/0UvWrtO6925Lg8n0l1PerMgooEfyXen5
	xVrrUyiHDuJvNGi3GA2nyiEbx+gAI8MqWNhiBBpzaNGXCXdjZgxU4m80l/b6jtLxiXJiaIl1+4F
	TUfw6/ss1+y41qUtQwaKziOWrqAtOfRmc3vIoZ60RGiH3nC8CQXKoXsR45GoTFSJW6USklCBbXx
	C6B9K3ioSgEeQYjqytQbSoSoyUmtR/3HYQMHwtHVAmDJTI9VrJc38fzeqlXCuoUyIheV4M/3UpL
	aveB6MIKhJ2L2DUuf+Xjeae1gzfS2jt4xI9LVNTFYikzxdKVj5FgEBcn5zrMEqVFx0NKDOMhn3e
	4yENPxH1mwmbj7lZPKSkv9Ion/52XpMewQ90yrCQdj4sa9WNTruQusbzQ3p2wHYZ4omZKrR3w==
X-Received: by 2002:a05:651c:547:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac4416e587mr12026331fa.10.1792664819457;
        Thu, 22 Oct 2026 03:26:59 -0700 (PDT)
Received: from linux.tail9b532d.ts.net ([196.240.54.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f67a8c8sm6643221fa.33.2026.10.22.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:26:58 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f3f4fce0609f8e91b540@syzkaller.appspotmail.com,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] xfrm: disable state hash resize work on netns exit
Date: Thu, 22 Oct 2026 12:26:41 +0200
Message-ID: <20261022102641.1429128-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
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

xfrm_state_fini() flushes state_hash_work before it inspects and frees the
per-net state hash tables. A concurrent state insertion can queue another
resize while that flush is in progress. The resize worker may then replace
and free a table while teardown is still walking it.

Disable and drain state_hash_work before flushing states and freeing the
tables. This also prevents a new resize from being queued during teardown.

Fixes: f034b5d4efdf ("[XFRM]: Dynamic xfrm_state hash table sizing.")
Reported-by: syzbot+f3f4fce0609f8e91b540@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f3f4fce0609f8e91b540
Assisted-by: LLM

Build-tested: W=1 ARCH=arm64 net/xfrm/ (out-of-tree build).
No reproducer was available to run the teardown race locally.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 net/xfrm/xfrm_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index e45aa1ed5b9..8a2e465bd73 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -3392,7 +3392,7 @@ void xfrm_state_fini(struct net *net)
 	unsigned int sz;
 	int i;
 
-	flush_work(&net->xfrm.state_hash_work);
+	disable_work_sync(&net->xfrm.state_hash_work);
 	xfrm_state_flush(net, 0, false);
 	flush_work(&xfrm_state_gc_work);
 
-- 
2.55.0

