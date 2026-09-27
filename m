Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1835AC07
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486235; cv=none; b=qsEfYZQCpkPhVmLy2MZ3Y51w8okpNUxihUtYVI2FycNUl889uWwCvf2VIYm6k1WPLFW9bpmOk9W4UtId62T5aBvKD7pchCqXVb/F4+6q2mT6eGKoVZKfVP1CzCF7M5jzeYzF/YUQ9k9NYaoWaaCTZjo+1mdrUZHyug4LRrYQ2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486235; c=relaxed/simple;
	bh=NU6QRcYWbC6ozvlXfNRptThKfI89r0/f8cNx0Vdf9+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2beRi+bmNZrWV0X5tC8cTneXh+kRTw8qxopmXyflGFntVeyE+vfoxZRUyVfIh23Sd6WFzx+yy7QqIZ6/vZabNj8eoo+dpOjykfqD7wzCk0yjtp28MHK9WOgXp9ZTzzQKFdtGbYMQRkvmuV4/REAf3v8n+CgYiyShYla+utCymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASFgvPH0; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASFgvPH0"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so918937eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486233; x=1791091033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP6+qvN7EZZEEWS6mx/6BLwbaxX5epJwC8MSjQPD2V8=;
        b=ASFgvPH0Hq8dvFeHdrZrdRmuPYXXCOgW/wj+By/XziMBwPhLv9tDVclyth0GTNoE/5
         hGQpUWnJuJC9S5cU/Od6iUWwn0MPni4w3qfaHSIaJ7IYdxjY3rtVjB1vZwjASbQls49S
         EG0In6ksU8wc7YVBSRtrD1Me8qPT3ST24UjOiYabIt5TF40HDhGJsy6iU3Za2mOcaW3F
         LVhNAuNUyXyCwrsuU/OrlEALCK+ftNZLzA/B+RSlTXDtm6swjsFuB24Eos+GygGj+Q/Z
         GK5vAV4g9mxsQLSEydNKP/Rfmzjm5Af/sgOG3+/iGj1ckYhZLa09/JJm1fW1GGIJ6dUT
         pCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486233; x=1791091033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP6+qvN7EZZEEWS6mx/6BLwbaxX5epJwC8MSjQPD2V8=;
        b=eXHVoz6yHO06bjOtNIR0o360+YFK54+A80YJmO8qhm99k7wcAWqq510WLtz19hEfd5
         daiOnWTFi43VsPs9EFelpXFLFXqhEJzzI1EP1Xd77gjtmxpSqbHVoLDnC6LG1+dPFRkA
         OjIHZaiNmC0wHTluTDsvahBm5U4cxIA/puqkiwgLevUVbqDTYWZqpfBAAUNOsA7NjBbk
         ZpivMm/e8q1CQNjgJt1tEjaHO5Jpm0+fo29CekSbf+ATWFnZ7iE4tqIUNaA7JvbAg+nX
         BwCdPGpdV8/BysN9lJGlO8pjU9FVStr7ex94WBJ8JFV7X6VjDsJ5hoObhwB45nPaSioK
         s8Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxwE5CYtfHHamD7Gxi7WW5nI06UqmWfhOVGpD92nRu5f4t4pTwvHy1lbkYR5Y5MAwcy7UWff+ya/8h47Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYcyHQe8NmFQZK+7JkcW18kUttjobvRiss0H5sHmvCecoSQ3FW
	gz1+J314s1SaUJSVwlQIDjl4YosKIBXigAG39rlwl8DZrUzYSJT9FNXe
X-Gm-Gg: AYBFou0EOPe0juYsJE50EE2q4fh6WOACYlsvqo2MipUpEw+7jK/8v+gS68EVeN7a0gZ
	jjuAY0BIHHuzRBhdgBQ3gRZ710ABGyR9KtFqro+21DBrIlBRtXJNfILq22FZMH4OXMJK4WlHiRt
	teJOlL+0+KRbJr1ojA5YsM2fwvts5nnGezJC2j0gqwLPFpfFhWpgEGE1MshAuvl6HOM+SQmUy1/
	3CKiZeUPL4e1SSALGn7SzFC7UefRJfbdeHTYPFMYX2WPtH4A1DFbHO67r/K4hiaA2IO6Krg1pb0
	zy6JhPWNVD5Zgk/+E46DsBgRstU5HB98IshSMYbJJG/tQb+cUhtA8MzaN7uZgqKQ3GAyzkcyE+i
	jrGFDAqTlkRZuGBZbi1R7Tp+QNBBwnwN13p8GRD7Oz+IppIB2mHglC1/V4JAOlBUOdF4R51j8yS
	hQYDqAZRpz5QkieBxcNFwd+c2cylJJdDYzkqQ9DzamkNo2dC9GWnDVM1txdFJBJ2k6u2ka03Uzg
	L/gi+AOBXuO9zIaM7Hx9dtfiypCXvg7mX4Scc7L+FerXp5jyfKNA6jzKVZMT5IW6xNDt+AKz5Tx
	C78MZK4fdtQH8gVfCHGqHmN71QZyogTf7fGBhehKMqMN4zZW8L1BQq8meoBIrvxkiDVXkWqbVV0
	=
X-Received: by 2002:a05:7301:fd8a:b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-3426f9c09a0mr5078028eec.3.1790486233118;
        Sat, 26 Sep 2026 22:17:13 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm20283753eec.4.2026.09.26.22.17.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 22:17:12 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] NFSv4: use match_uint() for ids in the legacy idmapper upcall
Date: Sun, 27 Sep 2026 10:47:07 +0530
Message-ID: <20260927051707.71187-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an id to name lookup, nfs_idmap_lookup_name() prints the __u32 id
with "%u" and requests the key "user:<id>" or "group:<id>".  If the
legacy idmapper is used, nfs_idmap_prepare_message() parses the id back
into the __u32 im_id with match_int(), which parses a signed int.

Since commit 77dd3b0bd17a ("lib/parser.c: avoid overflow in
match_number()"), match_int() returns -ERANGE on 64-bit for values
above INT_MAX, so the upcall fails for every uid and gid of 2^31 or
above.  nfs_map_uid_to_name() and nfs_map_gid_to_group() then send
the numeric id instead of a name.  A server that requires names, for
example Linux nfsd with Kerberos (it never accepts numeric ids from
RPCSEC_GSS clients), rejects it with NFS4ERR_BADOWNER, so
chown() and chgrp() to such an id fail with -EINVAL.  On 32-bit these
ids happen to work, because match_int() does not detect the overflow
there and the wrapped int converts back to the same __u32.

The signed parser has been used for the __u32 im_id since commit
57e62324e469 ("NFS: Store the legacy idmapper result in the keyring"),
which added this code; it only started to fail when match_int() gained
its range check.

The client only maps ids to names when it does not send numeric ids,
that is with Kerberos or with nfs.nfs4_disable_idmapping=0.  It uses the
legacy idmapper (an upcall to rpc.idmapd) when the request-key upcall
fails, for example when nfsidmap is not configured, and always when the
NFS client was created from a user namespace other than init_user_ns.

Use match_uint(), which parses a decimal unsigned int with kstrtouint().
The id is always printed by the kernel in decimal, so every __u32 is now
accepted on all architectures.  The type of im_id now also matches the
parser.

Fixes: 57e62324e469 ("NFS: Store the legacy idmapper result in the keyring")
Cc: stable@vger.kernel.org # 5.12.x: needs match_uint()
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
This patch was prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5): the analysis, the fix, the changelog and the throwaway
test described below. The trailer only says "Assisted-by: LLM", as
Documentation/process/coding-assistants.rst describes.

Dependencies: none. The patch is correct on its own on current mainline.
It is related to "lib: parser: reject out-of-range values in
match_number()", sent to Andrew Morton:
https://lore.kernel.org/r/20260926012718.15675-1-jain.sm@gmail.com
On 32-bit, that patch makes match_int() reject these ids as well, so this
patch should be merged before it or together with it.

Testing done:
- W=1 build of fs/nfs/nfs4idmap.o with allmodconfig for x86_64 and i386:
  no warnings.
- A throwaway KUnit test (not part of this patch) called
  nfs_idmap_prepare_message() under UML (x86_64 and i386 subarch) with
  "user:<id>" and "group:<id>"
  built the way nfs_idmap_lookup_name() builds them, for ids 0, 1000,
  65534, 2^31 - 1, 2^31, 3000000000, 2^32 - 2 and 2^32 - 1.
  x86_64: without the patch every id >= 2^31 fails with -ERANGE; with it
  all ids parse to the right value.  i386: passes with and without the
  patch; with the parser patch above applied it fails without this patch
  and passes with it.

Not tested: a real NFSv4 mount using rpc.idmapd (legacy upcall), and the
resulting chown() failure against a Kerberos export.  That effect comes
from reading nfs_map_uid_to_name() and fs/nfsd/nfs4idmap.c.

 fs/nfs/nfs4idmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index bc397110d977..c7a20286d0ee 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -519,7 +519,7 @@ static int nfs_idmap_prepare_message(char *desc, struct idmap *idmap,
 		fallthrough;
 	case Opt_find_group:
 		im->im_conv = IDMAP_CONV_IDTONAME;
-		ret = match_int(&substr, &im->im_id);
+		ret = match_uint(&substr, &im->im_id);
 		if (ret)
 			goto out;
 		break;
-- 
2.43.0

