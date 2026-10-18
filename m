Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D180476062
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322931; cv=none; b=Fs2aQo5ELB0TLlrUCI7D2uWiAja+lNvspQ/XJl/7mkuNUWUJ0loIfd97Pz82EPmPu+j2HMrtt9csNNV+RJvI6sfMa6BtKVSFwvtRTgKh/88y18VEpbjLl16e9AVShlV68HOkOp8stso6n9nMCmIYO42/LUFTsA0Ki8zvpZ/uphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322931; c=relaxed/simple;
	bh=kh8aZ8WNafRjacSGH1jG2P9B5PCo4W0CI4WLUmqctLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMLf096tD8cT14RRthRm5APvUnb84RbetBmLhVFNeySH+UpM+sFf//t276cgMbwS54S8rLjlIavieFwxEK/a+jHBHz9AAfF5JDy6HlCwZX29aEd3hKqRBp33Kv/ChaKek7PYo1Ylh0Xn01nvQtsWEUdZz3Pw9WkXB/tQGppNc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCK/vq0r; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCK/vq0r"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so3450463eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322929; x=1792927729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsvqvOOjAYv/RH8MxIA59ba6W3MyZxnSDu5x28CHtQk=;
        b=GCK/vq0rQUawg4g4U1TNz3r/UpQH54+c0r+7vbqmNRsp7LwB3/I6yeLt+ZXrzGuGwL
         htvmIW/970x3b8KAlHT4Hf5rAn58PuzKDSQyrLPxsEtZUsGktvptgGp+qKhBdOtB/EH/
         GR50Mfw/70xZVvEDtFu8VrZHKGcVtjXSfb/8aNxInQLGOHokjDqi/81yGCxyZahhSTc2
         XSQTb9NVkciPVR5L3VGs6pW5CqtZQ99yzCASiFPMHb9FUBL1c1XMxUgdJdNZnwNUUdJr
         zKV0yiUZ9dB0gy4U7Loz3JtvtLOhBbfSDX1hsTl3i798Nkod917TdZewtYyNvi90BviS
         YUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322929; x=1792927729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsvqvOOjAYv/RH8MxIA59ba6W3MyZxnSDu5x28CHtQk=;
        b=k1duYVnMWs9PgqeU7iXmbvF2I79si3mijH6YZFNdLR9j07jQZo4PhbqkpLnuPJF2Wq
         HuQsw92ATjvzOhbqYwxcjCV+FXpNcR0wd53qkyzEod8QGdYLPbiCHsxD5TbAfW/DOQMQ
         OdMVogXCN0I5iywAi8JhW8PHL1mFdayFxRBOkHcD3OC3n/yNu1GSTXCMOq47W5igRlyv
         w8U4aiPYIc210HnaEsnvqi9wVgQZ3M6Nb6HP2FgzUAzH+49kO2pn/I+WRtekhGeHQHvD
         jPzPwir7PPpg5fzKtWMHMygIcIB6pY5H52s7xh9fpU1Jj2VW6lSva2PRcGF2B8+M6LkM
         K9YQ==
X-Gm-Message-State: AFq9FYJYLnsiC7Ln98PU/Z0fpJ9BK0j5w8VPS4VdY84lGaOdazDoyAb3
	nlhI3uuRofRHAlsIY20SrhEMlV36sqfUrLiRxLlZZeTaVP54U5Ymsphry7o+Iwga
X-Gm-Gg: AYBFou0v8BsYHJXCnN2u+AIIvc+9g2wILkJd6HJ6bZzyWpOxDmGcsS9QUpVMNrOsnaF
	CybPUypxWvu5qG2lpMfsW5KZtUtdX0gYFiQIezxXqLAY81GAde6KZuG4PFmPPHDIm79kmEaAU7x
	9vMNJmb6ETYDWlKDDQwTu83QF0Z+7FR4XdzLSjJ03RODcnqrXS4ZDDPED2MCwCEY+3M9PL1IZx7
	mCDroP0v+cmHOMai384EEFO9H06R8spJUnWRldSeie7dDLHgQmlcfUFWAiJGu7s13NagQf4h5Jz
	LVSsmpghbjDbv/ZCxM/i7amrGqc7aI+brMq9dYaR6reR8Ur1H+MCglIbobHIm9ki3mst5QRadXD
	5dOc+Tu0C0IUEAWSPl87UQc95QT2RUQZ3haXiJepCQV+L12abEpWLa/YtDOw5oSwqpxZLSMgm55
	jouDpWQjy7ZIV6ZlmcqFj6jLrMgotoypxxN/TvxUjYI6IH2QyS1OAV4UPhjHDYEWqJtK5OZaHNV
	IIZu78GeONVwW9KOdSc/28t5aLEtBZ3aMp0gtKmYA==
X-Received: by 2002:a05:693c:409c:b0:351:515b:4e85 with SMTP id 5a478bee46e88-361a136abeemr8154582eec.16.1792322928504;
        Sun, 18 Oct 2026 04:28:48 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:47 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 2/7] scripts: convert extract-module-sig.pl to Python
Date: Sun, 18 Oct 2026 08:28:33 -0300
Message-ID: <20261018112838.16355-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018112838.16355-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
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

