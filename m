Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFE4E77FB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019859; cv=none; b=NE1LwlFcGf+AWjqLAcQyUqahi0/YUQBV3mBl62soJCo4qnM4tAINNbZ23g+KJsnW+y1i0AFul2MHU7tpvuCZjRugl34vS5k0YthshDLUOKcM6ONr1RxkTFMAPk/RmQuz2E2wSZFFQ8tZ+Ii/rBFuSFZN6lYudzNozO13XQOBkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019859; c=relaxed/simple;
	bh=St1gZ90pzOpfqNw14C5SvWMC9IiurpLZKUBjI/E3gDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOQeM2zs7+qbaG5nfCavymu9KrMp2ONqRdtT4GhKSfW9fdLXUv8AkC6RVAnuuwZ8eLif6ogVVF6EXC0nSFb1AqHmlrGAPodJMyPt2gspmDOgyuQ41ylSK/ecSto4X5Nu+FUF3DRt0mVp2GFnVccqDqVo92TQBsnQEmTOU6s857Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=SK+ttYET; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="SK+ttYET"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35d7fa491deso1109085eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019857; x=1792624657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2sW8vI4+bR675XoSRFOVOmwfcwxpE5GLV3E+V8eF34=;
        b=SK+ttYETphAB/ojmw3XWPifcEq/v59HO1yd7EhX52xBdN0S8OPTjIz5FDiXl32Bc33
         O+yWvxALu+mtaqrJ/U7q7Yx8A3U7mctlyJeRnwNoUVljR/lqLArEAxgUI/3BDNLMmF3K
         GhdF/XYjSxjnCxtySF1wD1EGcMy4ERjtVljqjgZVT+nmfxRw6rXP9rfuFjR1rYExqZ8a
         Ik+smg7ZgrS1g43hfl5BX6H+rvh4fUup0t9BxTBNkaFkzjvod9gcQm4cnB7j2IGLzHaF
         vvkVbqqSQdUAfZ5pHs4lCMQLQZFS1IvxxYSgLa/u2+cYB0fCuZRNsc25UMLqLHj1J4sa
         yaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019857; x=1792624657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2sW8vI4+bR675XoSRFOVOmwfcwxpE5GLV3E+V8eF34=;
        b=VpsiKZKUOqdfuUWSP12qsYfO6cX7Z14FNp1DiQi2KpqMAb1uCXM88/z4Wmf2NGlJta
         ex8xA5VKYhCnrCNef9RDcCN/zNNiwsu8TmTG4kSdmMF3yxkGUbx6r2Xiwu30XazjmQHL
         jS84ES+Vvd2Qze0v//9D26CDni1mcynHjH0JJTWsqDSR2jB3otWFi19dee4F1SwsCQIJ
         xS4cwveNFovnIDQssSzz7HpkafNdPgh76gi+XIK5qvIJVMvM7zlk3QXPlpXIwTTHQlE5
         jk4uroGhMHjUCCJ7x3NTSiZftH28p688+0Cmoo7XfDFmYIW/gue2aZXEKXasQ50Jyiz5
         u73A==
X-Forwarded-Encrypted: i=1; AKwUvBxIiuOHpsRMdakaPEa/LdtPWKMvYeiyMqPvbbZHnq6kkDgRrZQFIAdfrJcpLQCgP8VJeRvpDv0Lmtm+RvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXG50PF0gxm1ldNjD0nuvnYtttj0M1VYtO6oDZ3QoeIhv5XKc8
	SsSYTMgctSFlI+gAsSPVPyW2FJfiA4SVTAdJIB9qo7vLvvbCiBG7F6rJOt2er422UlA3UGYr3uJ
	ECrv2CoY=
X-Gm-Gg: AYBFou0Fb86KVcbvR1NmX1ZZ2AUndPzEmJkVuw2FwJt+pxCWyUZXPjHQCMibriSOE4e
	BV9nCFQpcbvs+n/7w2H3Elk0+oicq4Fjlt7vUfFSjN7dGbZsMcdx2b01xy8/8CNMqSI7dkv/0Me
	stK8RXyXjSKnTv5PQTixOiFY2C5oGUkfjq4j6KgYbN83N6x52V2R8TfZ53plvWduP33Q+dmXk8K
	t4Lntqmo6ZIcFV3UxgGRbRjD1C575jQ5MlXAJ5i//jQ7lMPD4Jj3IAkgroRakfJSq88TJ3ahSnq
	3qK9mK8iR4MjSUHIYX8i6N4zF0kQ12Geol1fOFVNsZJ49JZzfrrbTRXuZqNMdT642myOANcZtjm
	MuoSt122cOGWuXN4N3BUzq+CuFO53PHbuKbDTt4MleuO9z8uuONBMlzNZg21e6/SsENVW9JVYvu
	9SwEUDoh2YvnYOuS9e9vgtSaK6Ab1c9OYCB7PQ76g3+ZgMVBKXS+ZOGfWNz/k17+MONNt9HiDnN
	GpN/V8agViQHA==
X-Received: by 2002:a05:7301:2127:b0:359:27e6:b684 with SMTP id 5a478bee46e88-35927e6b814mr16811879eec.3.1792019856896;
        Wed, 14 Oct 2026 16:17:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:28 -0700
Subject: [PATCH v8 3/6] of: hold a reference on of_aliases during alias
 path resolution
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-3-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=3588;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=St1gZ90pzOpfqNw14C5SvWMC9IiurpLZKUBjI/E3gDE=;
 b=+NRsYFjU2wZMrGLeK30g6ROiusguMHMMIRbn7seED1Paso6e4V31RXIt2EM8m90PQ/9ajL1P1
 zyrYVYZ2OpkDr4Q659v6WjR/I5dHSbY/SyzZomAlSa1CA1/r5PbWDC8
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_find_node_opts_by_path() walks the property list of of_aliases
without taking a reference on the node and passes pp->value straight
to of_find_node_by_path().

Take a reference across the walk. The walk itself stays lock-free
like every other property iteration: it can race property surgery and
see a stale view (a removed property's ->next is repointed at the
deadprops list), but nothing it can reach is freed while the node
reference is held. The pointer load itself needs no locking:
of_aliases always holds a reference on the node it points to, so a
reader that observes a non-NULL pointer observes a live node. A later
patch in this series clears of_aliases and drops that reference when
the node is detached at runtime; the detach path holds its own
references across the transition.

Validate the value before resolving it. of_alias_value_ok() requires
a non-empty, NUL-terminated, absolute path:

  - an empty property has a NULL value and crashes in strchr()
  - a value without a NUL inside the property is read past its end
  - a relative value naming another alias (loop = "loop") recurses
    through of_find_node_by_path() until the stack is exhausted

All three are reachable with a malformed boot FDT today.

The name comparison loses its redundant strlen() pass while here.

Fixes: c22e650e66b8 ("of: Make of_find_node_by_path() handle /aliases")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 17 ++++++++++++-----
 drivers/of/of_private.h |  8 ++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57313055d9ed..6a6d9f8439dd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1003,6 +1003,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
+		struct device_node *aliases;
+		const char *value = NULL;
 		int len;
 		const char *p = strchrnul(path, '/');
 
@@ -1010,16 +1012,21 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 			p = separator;
 		len = p - path;
 
-		/* of_aliases must not be NULL */
-		if (!of_aliases)
+		aliases = of_node_get(of_aliases);
+		if (!aliases)
 			return NULL;
 
-		for_each_property_of_node(of_aliases, pp) {
-			if (strlen(pp->name) == len && !strncmp(pp->name, path, len)) {
-				np = of_find_node_by_path(pp->value);
+		for_each_property_of_node(aliases, pp) {
+			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
+				if (of_alias_value_ok(pp))
+					value = pp->value;
 				break;
 			}
 		}
+		/* the reference on @aliases keeps @value alive */
+		if (value)
+			np = of_find_node_by_path(value);
+		of_node_put(aliases);
 		if (!np)
 			return NULL;
 		path = p;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..9bba999f0bf8 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -215,6 +215,14 @@ static inline bool is_pseudo_property(const char *prop_name)
 		!of_prop_cmp(prop_name, "linux,phandle");
 }
 
+/* alias values must be absolute paths NUL-terminated within length */
+static inline bool of_alias_value_ok(const struct property *pp)
+{
+	return pp->value && pp->length >= 2 &&
+	       *(const char *)pp->value == '/' &&
+	       strnlen(pp->value, pp->length) < pp->length;
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

