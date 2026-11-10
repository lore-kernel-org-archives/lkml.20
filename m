Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337745;
	b=YYL0xEjgoxeYJDyjTrCZSXrdPF529cSaOACxDrhQRUmGoNEjQUw33km6loD+NHgQEwct
	 DdDyvdZXrHyZdyNqQ+h9fZxa2q9iWKpkSrwunp4v38hSDf/+lDfdhFLRhT+ekHlOnbFrc
	 3ZFASclq56k+fZy1JgdZPHIQVupX/ctUioaoZ+/kWKJaajN920XJueGkyjkkgAJ2aY/CA
	 Wm7fVNwSA+28GTNl4hmNkv1jqH7DMifD10txcsLqlOeTNdhA1PsNMjkOVQ0vdBUuM5wqr
	 VcdzCez0buUJAi7gw8Ho3k3SeoHyNijsbPva5yEiAmHGVeOs4sxcDhrhNxfsygbA47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NO2sdAez8S6n83liUUR9377K8rTnW+Jzv2+weGto1Hs=;
	b=OE3dxuZD/YKb7m/W3y6esgmkCnIf47lUWMK52VMv9ozDOFOwjitm8/CiRyRj5Y1CB1Nm
	 b61P1yGsfSlGR+VgqKu3vxtpmppGpXY07gJCQFeLa0YYOdflyCpUssV55xqq+CW09tBNu
	 2ErP46/XpHkFtN4+QsAUviffAxKRyLF23Tk5TlxX0R+50EXbfGZfuqDUevaB7iNzr7Bi6
	 UkPt7wX6lykp8ROMzJ8c3VJ/iWorHudTx1AYgKPBKeCPVSdEGnoKstHBKYOTG+CQaBfHJ
	 ofuGrgB2d5w+FePuX6JKRNn569muqhCYCMmk2O9YZSAsSkZXVszFKbYpTl4WN9JFKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d8O/6G9y";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C9D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C9D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8O/6G9y
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so25360235e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337743; x=1794942543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NO2sdAez8S6n83liUUR9377K8rTnW+Jzv2+weGto1Hs=;
        b=d8O/6G9yk4Q96PxRTmpH3fURC/KUFi7ptm0Vg270N59SiKN2q6kNgcFB1R9KGL7kZJ
         kswEhaDNNFR2HLx3TRnu9NaQ9Twkj16uunHvhd0ohq47FHKXLXuLEnb31WFNlofpsUKE
         vf3AHQgikKwXC4zGkpOOnT5Q+F1s+4evHm1lATUNcedREXf1T267XOHp/8L5QBA51+8B
         dWxCyK1qOMONxp8OsWTQd3LAzaVIFNfSOliol6GaqJRRXRT1oHeq8spzP8isW6xXeBSN
         ySX57FeaKZWNxRXN5XJWs2/XEEFnEWLSM8q8odPL4FpwGTYS+kCPkXo69Zv7SxHYbdDG
         ZjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337743; x=1794942543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NO2sdAez8S6n83liUUR9377K8rTnW+Jzv2+weGto1Hs=;
        b=h+yhezuaeAxlgZ6PrfDrD0FlAIabl8dqOa95xCuQ2D4W1HsMSlVYzn+QVkAJTQohlx
         +Y3fl1RLhCJJaeNq6Qpt0wsyGM1NrGPKtssV55KFuR5ZXwfDO5p/EsKEpNzTRynOCOSw
         1Xwy5J7X6k3WYXJUdv020u+TKxc9828PMJ+lewGF9pN9Ol5/ltQsPZHa9O24RHilbFDc
         mRPPmiSE4xzqFFOXeI16RFUCAoZGQiA6i/0aTJdvbkT4oZueO227/W6nXkdcFxekDc97
         cnNazHGG5LMchAot1nfFKcf5GxUARpNZqnxQuiAl9A8ouzGFniRrVEV9gE8IIJyBuKUY
         1owg==
X-Forwarded-Encrypted: i=1; AL+hErET8J9fiigCpIGB8qyFDvkJJQMonlHFiiPsOtkNJrg/XBhM3Qg6zOdmEVbXCoYGwh7S/A+q4hsvZvum6uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQE2mFzPMKvmI/xwjtvUVATwdFqNHJa1v6xKPrR3o3AmRFN6v
	Tz/zsnxro4YqT0yKjcXHnAshtRVf35+rMEgpbixq2L8Mf5ZvH7QUExQia0Wji+RJZ0K5mA==
X-Gm-Gg: AYBFou2b8eaPLcdZnyw2bMgJ3XLq79sImdGSh9H8N7NU/FfeuKF/vCtBV1HM0OOyVim
	tRghPbn3lLEg67mFjNKjahZobSET7U1WtHiW+S8t0lWBSO27TBzzk8+rU4T7SC4O2VRSkejiOLY
	iNgFpuDyxkWriiFDyBGKQQUlcnHk8byWb2tVtCrVMiGlfdiEMqJ2Ij/pLlHemxMTWXLEs0w8K57
	lRCCxy/wcFexPlsN80p/D9SLoSBNA8uNfqtbnmP9dxcyOBo1UkJ1Xd/UmCRSZe0k15Q19p/tIls
	c0QhxvdkCY3p/6hWRz2+3X7BKDLOaLAIvD9K6sPi+hG/pHy4fNkA5It5fHjdOLlA0/E8w0dPwZd
	BJn0jWxzJdVHqkBP7fk+StC/kc9JU+E+MPp+q26BMIqLvKkQEdyl1BTTjAbvhFgctZEVrzI+/sq
	vis3RuhxYGhxNceyYW9O1YPt61qT8oZZqpexbrPje3qVpy0M8OyUmyZHNytkWjN6JkZbGmzWevT
	u4SGkUWWIf+GMwryvQlIUkqagC8b/bJb41QQ2sj9uZ25hFHPyHba3PezZcfJr/1JFh5JTg0s8Xc
	HqtUiZTH/T5Nx1Tc3V3RwxTuymQrv1pjIR7Ff3W3TRTaSoHy6GIUCxQTBZrOsFP4Qx6n80EOhW6
	xIC/CdJxDYmwnSWtKgYcyEeMZv7Msu67smKYu9NZ/RlM0F1XqYiYHvR9jfnx3gKvijoYsJ00z4A
	hkHNIBVvkktGZD316OMhmyyJVmy9v7R2+SIK/WMLQ+RaJbbo1vQX8hx9KyD4OV9MMdOhw7Mb/lw
	hMHMZ5xfQc0FxnTLg==
X-Received: by 2002:a05:600c:4f81:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ba09377c5amr1349305e9.8.1794337743494;
        Tue, 10 Nov 2026 11:09:03 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm4309775e9.1.2026.11.10.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:09:03 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] tools/bootconfig: Preserve values containing both types of quotes
Date: Tue, 10 Nov 2026 20:08:47 +0100
Message-ID: <6ad95c1a6eb524143a38ef9a0d4fd87b92ef1daa.1794337724.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794337724.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
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

An unquoted bootconfig value can contain both single and double quote
characters, for example:

  message = He said "it's fine"

xbc_show_value() surrounds any value containing a double quote with
single quotes. If the value also contains a single quote, both compact
and list output become invalid bootconfig syntax and cannot be parsed
again.

Print values containing both quote types without outer quotes. Such
values can only come from unquoted input, so they do not contain the
delimiters that would require quoting. Keep using single or double
quotes for the other values. Add round-trip checks for compact and list
output, including an array containing the mixed-quote value.

Fixes: 950313ebf79c ("tools: bootconfig: Add bootconfig command")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
The parser accepts message = He said "it's fine", but the original tool
prints a value surrounded by single quotes. The apostrophe in "it's"
then makes that output invalid.

I checked scalar and array values through compact and list output,
including literal backslashes, quote controls, and a test initrd image.
With the fix, all 25 focused checks pass, independently and in the
combined series, and the parsed values survive those round trips.
The full bootconfig test suite also passes.

 tools/bootconfig/main.c             | 14 ++++++++------
 tools/bootconfig/test-bootconfig.sh | 11 +++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 75516e9e4ac3..e7513742fd2f 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -52,17 +52,19 @@ static int init_xbc_with_error(char *buf, int len)
 
 static int xbc_show_value(struct xbc_node *node, bool semicolon)
 {
-	const char *val, *eol;
-	char q;
+	const char *val, *eol, *q;
 	int i = 0;
 
 	eol = semicolon ? ";\n" : "\n";
 	xbc_array_for_each_value(node, val) {
-		if (strchr(val, '"'))
-			q = '\'';
+		if (!strchr(val, '"'))
+			q = "\"";
+		else if (!strchr(val, '\''))
+			q = "'";
 		else
-			q = '"';
-		printf("%c%s%c%s", q, val, q, xbc_node_is_array(node) ? ", " : eol);
+			/* Both types of quotes can only occur in unquoted values. */
+			q = "";
+		printf("%s%s%s%s", q, val, q, xbc_node_is_array(node) ? ", " : eol);
 		i++;
 	}
 	return i;
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index a2e8311d4d19..a0578013e731 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -146,6 +146,17 @@ $BOOTCONF $INITRD > $TEMPCONF
 cat $TEMPCONF
 xpass grep \'\"string\"\' $TEMPCONF
 
+echo "Round-trip values containing both types of quotes"
+cat > $TEMPCONF << 'EOF'
+key = "first", He said "it's fine", "last"
+EOF
+for mode in "" "-l"; do
+  $BOOTCONF $mode $TEMPCONF > $OUTFILE
+  xpass $BOOTCONF -a $OUTFILE $INITRD
+  $BOOTCONF -l $INITRD > $OUTFILE
+  xpass cmp $TEMPCONF $OUTFILE
+done
+
 echo "Repeat same-key tree"
 cat > $TEMPCONF << EOF
 foo
-- 
2.53.0

