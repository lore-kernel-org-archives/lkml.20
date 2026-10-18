Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866744C2270
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331857; cv=none; b=RXOXfwcMTxwC0rCr4VtbCrGVE4zDSFRZ2WQrGa+kLGk+daVstRRt/T6Ble2I78yM3S7Gzf7lGxNPIR1uYMms3E9zPP28wSuOR4jh7xPkdZawPBA3vUfh23aS9fBU6q4EHnvilhRw1uyayRcdgzHCSERYhKDealrbmxLE4TwrIG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331857; c=relaxed/simple;
	bh=kh8aZ8WNafRjacSGH1jG2P9B5PCo4W0CI4WLUmqctLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n43bKPkWA0XRBuphFh4z99LptJDsusWnMI6kWnaqCVhMXIM+GhF4kJjfZw+Nhs1ZxDAcJ2Cviyn2WmtCXxsK99ntse2najFb3++nyHbpVvfWrxJHfvbuxV5+dn1douKdjbMrXumt8X7CtRP371bi2aqoW/Ia8v7uQZkzHBLrbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SViPoy+O; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SViPoy+O"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so2621354eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331856; x=1792936656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsvqvOOjAYv/RH8MxIA59ba6W3MyZxnSDu5x28CHtQk=;
        b=SViPoy+OY2Li7lDu/ASoC8NCe9QTgIxCUqmi8SEcEVxpxNAI1t7zNzuCZW2+gRUAXX
         ydpASDhpceELKvs4tfKRAFmZj6KJDeerzb4PVFewdNgxewbQjt73ZiJ1zazghaAbGczv
         fu4NcQGjUWa7oSPA0s+2AEwGk3rBQ5Vy8JmdVfcJKttDipHjcz9kW/+NLFaNFpuHSQHu
         MU7A/vdIH1rzmfxdMbW/wqx4OvwxqpmEqCZYer8DTb4tgykySp++Tn5T3wA8SNUKIah+
         evOa0aY9G/5anwS55h7x5OydbD0uwVRgo8gaMIBMI3FTTi8T7DSDd5a/4kCrknwqyJ44
         KMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331856; x=1792936656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsvqvOOjAYv/RH8MxIA59ba6W3MyZxnSDu5x28CHtQk=;
        b=MBpxBR4RrGAA+mnETU0d0EjQ34jcC584BW7nPnBFWgDKVbWxwE+uOwYEeRW1U79SOE
         /snzjH0NxeDExloqXOJSIffl69IK4etkahfFMzZpiz24rrXo62B0q2b9wIfDFfCzIG3t
         BEN4OIKHPEofQYYL7Y87OK9tFzmGgzkD5ByhApJEG6ogpxxZ0E0q7o1iGomXRmw2Kfmr
         9cHNmAf2woWInaie/gYcDx7Y1iNZprFHGLsyKsYU8LjDs+kgKe6id72a+BZERllpqx8J
         wCl6l6PLgP2ar6t4s0ECnOCiE4BbsI9cgwScVe9+b3KpxPI84i5y7uFxoGJt2CvCFCQI
         3vbw==
X-Gm-Message-State: AFq9FYIYTzVYJe2smrhcp4uqAMlTs3POAhfE0PWJ35vycfhVp8B67Gr6
	psMbUuON5qlJNRDeSmBuy2XI05zkDea9VYge5Gzxh6IrrBTTEJc4R4YY52noNoYL
X-Gm-Gg: AYBFou1bH+vjoOpuI5W2H+DUttMfbA6hKV0+Y/U96nryDH1M1RmsJcbyccSLVrkKzw+
	xNfhNFg4LQV+ETkdL1cwuBAVRQllFK2dxf3YPHtaFf2L8mJ7utw53bBgE+LH9o9BA6reFLilPy+
	atOr1YoGSfx37e7gq6z4ncw4DchDuanR0yuJmBn2Cb1Widcg4vKmHTHKMGNOL2Q0qVBzHsFJyAk
	O3pdg2sh+FKjzpQV/QZNnqSrh7UWINUEvHuNQ9gIYtE2VWAT6QNda0BS0i7mLPZoU5x/7SU7lZL
	cDic7V9K9B+LIRlqnVBds/ZKDLnXQhxy7CK9a3nnJqrxbO6S50ANrNrlDV7EcqoJCQJnx3AWe2q
	Dbej1l/WP2w574v4FGd6vemiMM6RnKwtwncP90xq710rmVJfM10BdWVW2kJcBKlKpEhDy60t9pE
	E9V8GEg2QFwCF6TlXytjff+4MIR92yhvCXJm61661Oq8n4LC9g/YfTs7DACVvOys4NVxfe+ml+3
	uOnNJbUZsp9mTRFjC7xjPW0Ww5VyeoIlnBsTpvauntJcwKUq5ZF
X-Received: by 2002:a05:693c:66c2:20b0:35d:eafd:5737 with SMTP id 5a478bee46e88-361a204e06cmr7864221eec.22.1792331855424;
        Sun, 18 Oct 2026 06:57:35 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:34 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 2/7] scripts: convert extract-module-sig.pl to Python
Date: Sun, 18 Oct 2026 10:57:17 -0300
Message-ID: <20261018135722.27410-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018135722.27410-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
 <20261018135722.27410-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of extract-module-sig.pl in Python 3
(stdlib only). Same magic-number handling, same descriptor
extraction, same -0/-a/-d/-n/-k/-s output modes.

Verified byte-for-byte identical to the Perl version on a
synthetic signed module.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/extract-module-sig.py | 103 ++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100755 scripts/extract-module-sig.py

diff --git a/scripts/extract-module-sig.py b/scripts/extract-module-sig.py
new file mode 100755
index 000000000..e9a43e72f
--- /dev/null
+++ b/scripts/extract-module-sig.py
@@ -0,0 +1,103 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# extract-module-sig.py <part> <module-file>
+#   -0: unsigned module  -a: all sig data  -d: descriptor
+#   -n: signer name      -k: key ID        -s: signature
+
+import struct
+import sys
+
+MAGIC = b'~Module signature appended~\n'
+
+
+def main(argv):
+    if len(argv) != 2:
+        sys.exit(f'Format: {sys.argv[0]} -[0adnks] module-file >out')
+
+    part, modfile = argv
+
+    try:
+        with open(modfile, 'rb') as f:
+            buf = f.read()
+    except OSError as e:
+        sys.exit(f'{modfile}: {e}')
+
+    print(f'Read {len(buf)} bytes from module file', file=sys.stderr)
+
+    if len(buf) < 12 + len(MAGIC):
+        sys.exit('The file is too short to have a sig magic number and descriptor')
+
+    p = len(buf) - len(MAGIC)
+    if buf[p:] != MAGIC:
+        sys.exit(f'Magic number not found at {len(buf)}')
+    print(f'Found magic number at {len(buf)}', file=sys.stderr)
+
+    p -= 12
+    info_raw = buf[p:p + 12]
+    algo = info_raw[0]
+    hash_ = info_raw[1]
+    id_type = info_raw[2]
+    name_len = info_raw[3]
+    kid_len = info_raw[4]
+    sig_len = struct.unpack('>I', info_raw[8:12])[0]
+    info = [algo, hash_, id_type, name_len, kid_len, sig_len]
+
+    type_msg = {
+        0: 'Found PGP key identifier',
+        1: 'Found X.509 cert identifier',
+        2: 'Found PKCS#7/CMS encapsulation',
+    }.get(id_type, f'Found unsupported identifier type {id_type}')
+    print(type_msg, file=sys.stderr)
+
+    if p < name_len + kid_len + sig_len:
+        sys.exit('Insufficient name+kid+sig data in file')
+
+    p -= sig_len
+    raw_sig = buf[p:p + sig_len]
+    p -= kid_len
+    raw_kid = buf[p:p + kid_len]
+    p -= name_len
+    raw_name = buf[p:p + name_len]
+    module_len = p
+
+    if sig_len > 0:
+        n = min(16, sig_len)
+        hs = ''.join(f'{b:02x}' for b in raw_sig[:n])
+        print(f'Found {sig_len} bytes of signature [{hs}]', file=sys.stderr)
+
+    if kid_len > 0:
+        n = min(16, kid_len)
+        hs = ''.join(f'{b:02x}' for b in raw_kid[:n])
+        print(f'Found {kid_len} bytes of key identifier [{hs}]',
+              file=sys.stderr)
+
+    if name_len > 0:
+        sys.stderr.buffer.write(
+            f"Found {name_len} bytes of signer's name [".encode() +
+            raw_name + b']\n')
+
+    if part == '-0':
+        sys.stdout.buffer.write(buf[:module_len])
+    elif part == '-a':
+        sys.stdout.buffer.write(buf[module_len:])
+    elif part == '-d':
+        print(' '.join(str(x) for x in info))
+    elif part == '-n':
+        if id_type == 2:
+            print("No signer's name for PKCS#7 message type sig",
+                  file=sys.stderr)
+        sys.stdout.buffer.write(raw_name)
+    elif part == '-k':
+        if id_type == 2:
+            print('No key ID for PKCS#7 message type sig', file=sys.stderr)
+        sys.stdout.buffer.write(raw_kid)
+    elif part == '-s':
+        sys.stdout.buffer.write(raw_sig)
+    else:
+        sys.exit(f'Unknown part: {part}')
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

