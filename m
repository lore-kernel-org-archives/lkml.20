Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078849;
	b=JS11fuGgSfkGroTtvLsnK7HNC+saI29Pi83Fx+nI1DO+EfOzW89IJm3lrjwugGDkhYfq
	 SNxJ159lplJs3+MDDzM2LItNkq4VuZ5drtYSL6MLktylgJVYFXq8w0aSrtCCCgt8RAC07
	 FIHq/hs02JN+oFjt/9Xq+nmPog7F4H2fPLNG3pCfv6j3kASZqYaWdGUTXyeIjMMe6gXV5
	 f4LZfWEowqJTXN0OIMr7jjz4mjNqkWGel563XokTXyTxfdP6Jf40tIGuKOyeRq3pc3/Kb
	 +c2uDHjH3sSk2Gr8W4hTciG7OqwJ20VwSibLCdNSp2W/rV2OgZnSLN1c5CxE3LZXWkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=tunTQ1LmTP+2zaktre8ztPhkPmVKZKY+j+RBegBaJ7Q=;
	b=TOZbGkrO2ThVx4yccpp0KHar5rhI/GcIEWQxV794shVYW3ZDbd+u2V2r85HTs3GbV5Yd
	 GbFTVl7s697P3n3j6rzCAF9ZXyyYXUQ892yAkpKMVniHepyo6zRrbW95+g4ah57cStOnJ
	 c/ufWPu5dpT7sQ8ySbuynmTzSjW4FZzbzEUuC6Gm1CS1GRkuvucSnIREH5w4A4yWw1n1G
	 zTOZyjccHjhstyNVjIUDt5+TPfn9bkZKedXLUrE2K5eA1NfKLmnSlymVOknk7JcsPng1c
	 rqc1nbHBN8xN2rbdNFgoh3lftzfnOI+r7+ASuFXfC7P7OcatgWcIuX2WcT/FC2krYHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=daylightlinux.ch;
	spf=pass smtp.mailfrom=daylightlinux.ch;
	dkim=pass header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=ODXiXbsE;
	arc=none smtp.remote-ip=185.125.25.10
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B622A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B622A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=ODXiXbsE
Received: from smtp-4-0001 (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jMQh65wsBz3lY;
	Sat,  7 Nov 2026 20:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1794078838;
	bh=tunTQ1LmTP+2zaktre8ztPhkPmVKZKY+j+RBegBaJ7Q=;
	h=From:To:Cc:Subject:Date:From;
	b=ODXiXbsEfgfHACbHkButIGn8Qui9QaVj9av+pSIq0bIz+WwzRNeC1EUuv3GlQD9xC
	 HA47XDoLBkOfLkwJ9It3DP6XfbazSQCQmVzO7knCuKFZ9lqsiNZ6jqQTP5LLPl6CLi
	 mVb8mgeCsJCOSLT1767NA1nmKQmYkdtaikfrveqcHgVA0L6vaCoL+SUv3dG1nma2V/
	 E38T4/zGYMmmlVEAnsmr+tajKtKVY1QTl82KyPEOwrqRDx58emKuSmN5vFUKxDX9Ta
	 5kLenOUPTrv0aPyHoZe3Xyx3fZolvev44LopKiMFRlfcRXdVbhKgzvcpVai3RuGAE+
	 yEq8GD/myzz6w==
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jMQh56RrmzGlk;
	Sat,  7 Nov 2026 20:13:57 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xPlrR-00038B-19;
	Sat, 07 Nov 2026 20:13:57 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sohil.mehta@intel.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] scripts/x86/intel: keep the highest microcode revision
Date: Sat,  7 Nov 2026 20:13:56 +0100
Message-ID: <20261107191356.151287-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
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
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

Ucode equality ignores the revision, so adding entries to a set keeps
the first revision seen for a CPU identity and platform mask. When
multiple input files contain different revisions of the same microcode,
the generated old-microcode thresholds depend on their order.

For example, passing the 06-8f-08 blobs from microcode-20250512 before
microcode-20250812 keeps 0x2b000639 and 0x2c0003f7 instead of the newer
0x2b000643 and 0x2c000401. Reversing the inputs selects the newer values.

Keep entries in a dictionary keyed by the same CPU identity and platform
mask, and replace an entry when a higher revision is found. Preserve
the existing output ordering and debug-revision rejection.

Tested with iucode_tool 2.3.1 and both official Intel release blobs in
both orders and with repeated inputs. Nine regression tests also cover
equal revisions, distinct identities, malformed listings and tool errors.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 00e05495c572 ("scripts/x86/intel: Add a script to update the old microcode list")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
The real-file regression uses intel-ucode/06-8f-08 from the official
Intel microcode-20250512 and microcode-20250812 tags. It verifies that
combined input produces the same output as the newer release alone.

 scripts/update-intel-ucode-defs.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/update-intel-ucode-defs.py b/scripts/update-intel-ucode-defs.py
index 9d6cc2c60..60f5ae329 100755
--- a/scripts/update-intel-ucode-defs.py
+++ b/scripts/update-intel-ucode-defs.py
@@ -95,7 +95,7 @@ def main():
             print(result.stderr, file=sys.stderr, end='')
         sys.exit(1)
 
-    ucodes = set()
+    ucodes = {}
 
     # Parse the output of iucode-tool
     for line in result.stdout.splitlines():
@@ -114,7 +114,10 @@ def main():
             print("Error: Debug ucode file found, exiting", file=sys.stderr)
             sys.exit(1)
 
-        ucodes.add(Ucode(sig, pfm, rev))
+        ucode = Ucode(sig, pfm, rev)
+        existing = ucodes.get(ucode.key)
+        if existing is None or ucode.rev > existing.rev:
+            ucodes[ucode.key] = ucode
 
     if not ucodes:
         print("Error: No valid microcode files found, exiting", file=sys.stderr)
@@ -123,7 +126,7 @@ def main():
     # Sort and print the microcode entries
     print("/* SPDX-License-Identifier: GPL-2.0 */")
     print("/* Auto-generated by scripts/update-intel-ucode-defs.py */")
-    for u in sorted(ucodes, key=lambda x: x.key):
+    for u in sorted(ucodes.values(), key=lambda x: x.key):
         print(u)
 
 if __name__ == "__main__":

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.56.0

