Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657519;
	b=JzYu9h17jhYtSypD8ALes3azbKggL4HGtFK96zLpIcOnR5r6k7ue35v0ZaP4TjubFcNy
	 5ztPQd0qJ1fX5NXTrhSiOpxcdoSs6QFEw9bGzUquhUvVkPAPd3pTwAjn1IpaGoD4Edta0
	 o+Trq1Nmbh10KB9yOBinB97DNwE3AccyA+6A90d03R4l8EBihkpDSS3F0yq+6hb//UdQg
	 rGWXrO49cvbqMMX7mWibztDUYlDpqRrVyPZNZEoAOSeOtXef2TjTDvexj81HRP9iAUWQl
	 QSgEr47FHSqtekY4la0u+WQzjJerSHrMioUpsK9mHgj1P0XhG5HtM2lQO7lrjwSe1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657519;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aw+1Wz0JP4ofF8gkClchV+X87uIHF+8HMsD+9rA1Woo=;
	b=b4d7RZzCN0zvrYbaUcVwmTohuyKWCN1zsg3c2vQ6NCymiek4cl1XAtyYN5PX+M8BhpKv
	 /mkTrcfwE+yfsj8n1wfYgck3EstPcQFpvK23r7jrJj5XkueAdmClacS/vanv0DrtEPWOw
	 8ZqMLNwXpjttW1qtLK8/Hv3SYqJHNxA4DPo+sAfUZAeFFEC8H/tnLvkIvLAv/xxOVBW6Q
	 sfbkxUZl1nU8Crz6Nx/LIEhnYPXiBv7vKY8SXU9waYj46AC3hi/lVIwGdRbyWaUEMsl2Y
	 JTIR0oskCnX7RiogWikZRJlhBAai/3IcnfVN2J/iuDHXmeZ2vZJQhYC9y8aETIe5vMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaTa6Pod;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDB606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaTa6Pod
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB4B1F000C5;
	Sat, 14 Nov 2026 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657519;
	bh=aw+1Wz0JP4ofF8gkClchV+X87uIHF+8HMsD+9rA1Woo=;
	h=From:To:Cc:Subject:Date;
	b=SaTa6Podsj4SGzoyxS3CUbFpQWUHfYrmgzbbx6B4hwAJzq0QSIunRpS3eSKHTcHLw
	 0g8rTcTgicPuZcskL90SL8vxrwn2pwPREyJAzNpRcai0vpryMnbibx2zypp7YH2N5R
	 rwE+XLDjn75rqGjQQlLF+OhKdRcTqDww19DalkMKtVmxkDKpdhj59pcxeCd3Lw5bSI
	 G1MZaCfzgofCTZFic3ZOb/xW7jkw9JXZAd3CCtcFpyyvUmdkGIocTEmB9O787jqFIK
	 a5tpknvofY2+jzRcBn9PF10L5gWn/mZt073BNBtEIRNTNWyV4vINXWY6dVd/g6aaCB
	 RFgvdSXo+Qx4Q==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>, Zhiqi Zhang <zhiqizhangg@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Fixes for v7.4-rc3
Date: Sat, 14 Nov 2026 20:58:36 +0900
Message-ID: <undine-1794657516055390723-80ad11d1aac80df5@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Linus,

Bootconfig fixes for v7.4-rc3:

- bootconfig: Allow keys with the maximum supported depth
  Check the array capacity before storing the next key component in
  xbc_node_compose_key_after() so keys at XBC_DEPTH_MAX (16) are composed
  instead of failing with -ERANGE when listing keys or creating
  /proc/bootconfig.

- bootconfig: Trim unquoted values at end of file
  Trim trailing whitespace from unquoted values in __xbc_parse_value()
  after scanning finishes so values at end of input without a trailing
  newline do not retain extra whitespace.

- tools/bootconfig: Close only opened braces in compact output
  Check key children while skipping value nodes when backtracking in
  xbc_show_compact_tree() so a brace is not closed when a single subkey
  under a valued key was printed in dotted notation.

- tools/bootconfig: Test listing keys at the maximum depth
  Add regression tests verifying that a 16-component key can be attached
  and listed in full while a 17-component key is rejected.


Please pull the latest bootconfig-fixes-v7.4-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-fixes-v7.4-rc3

Tag SHA1: ef934e66dc2ea3b19bcad8722df6beaff4f5e34c
Head SHA1: 381b391bfaa3f10d52da4740529804b0b6b8160d


Eduardo Mucelli Rezende Oliveira (2):
      tools/bootconfig: Close only opened braces in compact output
      bootconfig: Trim unquoted values at end of file

Zhiqi Zhang (2):
      bootconfig: Allow keys with the maximum supported depth
      tools/bootconfig: Test listing keys at the maximum depth

----
 lib/bootconfig.c                                  |  7 +++---
 tools/bootconfig/main.c                           | 29 +++++++++++++++++------
 tools/bootconfig/samples/exp-good-mixed-kv1.bconf |  5 ++++
 tools/bootconfig/samples/good-mixed-kv1.bconf     |  5 ++++
 tools/bootconfig/test-bootconfig.sh               | 28 ++++++++++++++++++++++
 5 files changed, 64 insertions(+), 10 deletions(-)
---------------------------
diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 819685d6c68d..948c8c10e4b9 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -428,9 +428,9 @@ int __init xbc_node_compose_key_after(struct xbc_node *root,
 		node = xbc_node_get_parent(node);
 
 	while (node && node != root) {
-		keys[depth++] = xbc_node_index(node);
 		if (depth == XBC_DEPTH_MAX)
 			return -ERANGE;
+		keys[depth++] = xbc_node_index(node);
 		node = xbc_node_get_parent(node);
 	}
 	if (!node && root)
@@ -793,16 +793,17 @@ static int __init __xbc_parse_value(char **__v, char **__n)
 				return xbc_parse_error("No value delimiter", p);
 			if (*p)
 				p++;
-			break;
+			goto skip_trim;
 		}
 		if (strchr(",;\n#}", c)) {
 			*p++ = '\0';
-			v = strim(v);
 			break;
 		}
 	}
 	if (quotes)
 		return xbc_parse_error("No closing quotes", p);
+	v = strim(v);
+skip_trim:
 	if (c == '#') {
 		p = skip_comment(p);
 		c = '\n';	/* A comment must be treated as a newline */
diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 6f476e3c06b8..d3f840c5adce 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -68,6 +68,23 @@ static int xbc_show_value(struct xbc_node *node, bool semicolon)
 	return i;
 }
 
+/* Match the conditions under which the compact formatter opens braces. */
+static bool xbc_node_needs_braces(struct xbc_node *node)
+{
+	struct xbc_node *child = xbc_node_get_child(node);
+
+	if (child && xbc_node_is_value(child))
+		child = xbc_node_get_next(child);
+	if (!child)
+		return false;
+	if (child->next)
+		return true;
+
+	/* A single subkey with both a value and subkeys is not compacted. */
+	child = xbc_node_get_child(child);
+	return child && xbc_node_is_value(child) && child->next;
+}
+
 static void xbc_show_compact_tree(void)
 {
 	struct xbc_node *node, *cnode = NULL, *vnode;
@@ -128,14 +145,12 @@ static void xbc_show_compact_tree(void)
 			node = xbc_node_get_parent(node);
 			if (!node)
 				return;
-			if (!xbc_node_get_child(node)->next)
+			if (!depth || !xbc_node_needs_braces(node))
 				continue;
-			if (depth) {
-				depth--;
-				for (i = 0; i < depth; i++)
-					printf("\t");
-				printf("}\n");
-			}
+			depth--;
+			for (i = 0; i < depth; i++)
+				printf("\t");
+			printf("}\n");
 		}
 		node = xbc_node_get_next(node);
 	}
diff --git a/tools/bootconfig/samples/exp-good-mixed-kv1.bconf b/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
index 8346287d9251..0b8b2f59da31 100644
--- a/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
+++ b/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
@@ -1,2 +1,7 @@
 key = "value";
 key.subkey = "another-value";
+a {
+	b = "v";
+	b.c = "w";
+	z = "q";
+}
diff --git a/tools/bootconfig/samples/good-mixed-kv1.bconf b/tools/bootconfig/samples/good-mixed-kv1.bconf
index 1761547dd05c..35442ee62b75 100644
--- a/tools/bootconfig/samples/good-mixed-kv1.bconf
+++ b/tools/bootconfig/samples/good-mixed-kv1.bconf
@@ -1,3 +1,8 @@
 # value -> subkey pattern
 key = value
 key.subkey = another-value
+
+# A valued parent with one subkey must not close its enclosing brace.
+a.b = v
+a.b.c = w
+a.z = q
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index 530ce7e28d63..f584f7637e12 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -100,6 +100,16 @@ xpass $BOOTCONF -a $TEMPCONF $INITRD
 printf "badnode\n" >> $TEMPCONF
 xfail $BOOTCONF -a $TEMPCONF $INITRD
 
+echo "Max key depth check"
+
+printf 'a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p = "value"\n' > $TEMPCONF
+xpass $BOOTCONF -a $TEMPCONF $INITRD
+$BOOTCONF -l $INITRD > $OUTFILE
+xpass cmp $TEMPCONF $OUTFILE
+
+printf 'a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q = "value"\n' > $TEMPCONF
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+
 echo "Max filesize check"
 
 # Max size is 32767 (including terminal byte)
@@ -171,6 +181,24 @@ $BOOTCONF $INITRD > $OUTFILE
 xfail grep -q 'val[[:space:]]' $OUTFILE
 xpass grep -q 'val2[[:space:]]' $OUTFILE
 
+echo "Remove unquoted trailing whitespace at end of file"
+printf 'foo = val \t' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "val"\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
+echo "Remove trailing whitespace from the last array value at end of file"
+printf 'foo = first, last \t' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "first", "last"\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
+echo "Keep quoted trailing whitespace at end of file"
+printf 'foo = "val "' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "val "\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
 echo "Showing correct line:column of no closing brace"
 cat > $TEMPCONF << EOF
 foo {

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

