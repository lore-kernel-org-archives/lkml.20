Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785207;
	b=HZIOutYSZg0W0237KUp3lC6dUH1GHPiYgcZkpXTPW0j2knWCjiunHPvmPyiImfjICWbC
	 EQlwt/Y5kfUI5GQrMGPlWTJ51r4BAl5G3rtALqEBJGV9Om+V/xI6iY4ax+QbT4i+mRUpd
	 3U+eNPCG4Fs6lJfJExfNNeT9KfhgagwyblaIPdy3V3PqtMc0NJPg7AklWDYIHmG9PZEQV
	 1QdhGQFkQDexkWZHDyfdJ/DZe/CJwPtX58PXSIu9q43BKvUBCw6gAfZupGn7K29YU+hk4
	 qTUr+42jmRmtBYEwfOke7j5kN1COTerYLNKiv41ut8AaUAUY+Pc1M6PNDrGV4xOd83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WhO3eiwpVjlpu/pA/NW1sjxZDrXxSK1K3FnCPXrmtt4=;
	b=E75hz55Z5D2V8gfvS3UikT1KTuYWSIFeMMtgCVr9coT4CMmfpFIeKHqcZzj1dQlptDj6
	 23yde9wNRtTduCLojgfx56b68v5W4oPNrBJiR0YLvdoUn3CxMCzEwDmatj7EvGOgKFqmK
	 2/KAXhv+iQElHXTRQr3UgvrETcYvMX2G+RvNAbUQfIW2oZN82QahMWAkitYScbP887QdG
	 /P8ZW0SMI5xKWFUgxFTohZKAI+sh4CwKUr97c6oWSFSPqOADagOH7phGWP2FIwFIbZ6jL
	 kRvv6UyEHP2W66HsgOj/uP+OsO6X15RTPcSH+Ui++DX8grqP9g2kZHulYhe8GsFVe/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LyMNcric;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB3606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LyMNcric
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so759411f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785205; x=1793390005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhO3eiwpVjlpu/pA/NW1sjxZDrXxSK1K3FnCPXrmtt4=;
        b=LyMNcrichdsAfJMln78ddsIOmImAHXNWLeOIXtCVEUuIF9LazYd+tN/CYghvWTCrm/
         NuBmZQrhQMzU7BIdPm04SXCUUJUMuBc1KMKYJeluLgffxQnPSlqsdhD8RfPpEXvrvzTq
         vYaK58Wkbbuk4h8XQgud5V+0UJa9Qo9pFUhVLu6TAIIGdXvhnoz76lE/K07/2SGOXW+g
         W/kFt4YXAVdWJBHqteKlDFGn1zL4dXjgvDxCAmNScrbCwvTerOHy3AvO0IZQw5+3GZ6n
         xE7YHrpkRdyEMixIi+pDOCWYZ+kGHxSyJ45b/mN2/EySiIjQPsj1IBisP8VOkfa8bU5L
         AJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785205; x=1793390005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhO3eiwpVjlpu/pA/NW1sjxZDrXxSK1K3FnCPXrmtt4=;
        b=Db4j6RErfU3Du2e1GpRV9d2i78+VrxBFe4Rbr1QdeJl9mNjOIcVIgNJr+B7638pYNq
         gkYkHb0zEc85K/KKPW5qZZv0Snrjx/n2WO7+F8zTfR6iK6G0J7ctVFPQgQrPnQkUveml
         ysxo6KJXjark8Hk6HmYtgepYR77lsShZ5Twl/RKy2/dSKzy0lwyVRdkfO/KLQTj8MxRI
         8k0jxq7gSA9TmNSwoiCoDEfqRn/o/kmcWYoINlUtWPvF7Uy+lCXc6RyMl4LNXk5Vgyjh
         pov7Boc7Ba+CfwXuwkV8vcq1115DW2p7aydeStJVEHpmcBUh0/2WYMuL69oZk246Ttpc
         nmgA==
X-Forwarded-Encrypted: i=1; AKwUvBx1OuIyE5KTVBw8hrAHUXnpSaAFUtVcitUtd3wiLoOZUhh5/Q1xAx35iOxRMmz+3NGcZKpI2GpGSCZO+vY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJprChH5vHi3zj73DaVW8odIqb/MkKAMLFuMd6lLioZGdloyyg3
	B4NxUdtHseojUYf3czNcEub3JMZt55OBVDYmmf+W7YnDcoRvRv8strw=
X-Gm-Gg: AYBFou02IiLJPThCLo6TOT4iH2AaAQYIwEX+YWB0a9iy6JUZXfEjNXcICm4mLmRP4AD
	ACZo0GE4KnTq9Re1B+3qlgcmjSkfVIB2bGSXsIc5VLPLy5TMLkP3x+/hB9oqRdu5ZMt3RUA2rzY
	dS+ZZgzpach1GWCQ7+T5pv5hCA9qaStCQ4l4zNY1Y7H4I/RhbMi6TSJgLhB+uH/X9146c+Lb8fx
	c/JRMh0E1PeDdiqcpdLXi+w7i6zA68tqh86wvzNF19Mc0mpvTVfRE3vddivyXEg8R3wYgfnUcLQ
	/3lJCuIRcOijsQWRn3e6lwBM8SCrChdvffSEP4APdD7nsBti3ZzY5ptNnYFl6+8O+brr/fkTNWk
	1zPcUC1HKXVnafi8mSPZHQw4Vq+opodtazIBUzbbTVwKlmPqFmL3jLuu1PBuUhoqaekCkne8KCI
	23APGvvSn+U+nu7w+eMtW0LOJvEx0wpGw2uhfSJajVEkp0nhMz5BYAWskSbSQZWYirM3v4L1hee
	4B/y28PGwuc3GgOOlyOZYII
X-Received: by 2002:a05:600c:e555:10b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a211ee0060mr36703095e9.23.1792785205270;
        Fri, 23 Oct 2026 12:53:25 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm3299225e9.3.2026.10.23.12.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:53:24 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH ipsec] xfrm: fix output state cache TOCTOU in xfrm_state_find()
Date: Fri, 23 Oct 2026 19:53:23 +0000
Message-ID: <20261023195323.3528192-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

xfrm_state_find() checks x->km.state outside the xfrm_state_lock before
inserting the state into the policy output state cache. Between the check
and the lock acquisition, __xfrm_state_delete() can transition the state
to XFRM_STATE_DEAD. The dead state is then inserted into the cache
because the stale validity result is trusted after the lock is acquired.

A subsequent call traversing the cache can then access a freed state,
since xfrm_state_gc_destroy() does not unlink from state_cache_list.

This is the output state cache counterpart of the input cache race
fixed by commit ddd3d01329203 ("xfrm: Fix xfrm state cache insertion
race"). Apply the same pattern: move the km.state validity check inside
the lock so the check and the insertion are atomic with respect to
__xfrm_state_delete().

Fixes: 0045e3d80613 ("xfrm: Cache used outbound xfrm states at the policy.")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/xfrm/xfrm_state.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index e45aa1ed5b965..03baa50f0df7c 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1632,10 +1632,11 @@ xfrm_state_find(const xfrm_address_t *daddr, const xfrm_address_t *saddr,
 		*err = acquire_in_progress ? -EAGAIN : error;
 	}
 
-	if (x && x->km.state == XFRM_STATE_VALID && !cached &&
+	if (x && !cached &&
 	    (!(pol->flags & XFRM_POLICY_CPU_ACQUIRE) || x->pcpu_num == pcpu_id)) {
 		spin_lock_bh(&net->xfrm.xfrm_state_lock);
-		if (hlist_unhashed(&x->state_cache))
+		if (x->km.state == XFRM_STATE_VALID &&
+		    hlist_unhashed(&x->state_cache))
 			hlist_add_head_rcu(&x->state_cache, &pol->state_cache_list);
 		spin_unlock_bh(&net->xfrm.xfrm_state_lock);
 	}
-- 
2.47.3

