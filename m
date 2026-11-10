Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333980;
	b=Z7XD+RnLiaHYy8oPcG/HVpRzGaWsEBDZpq2Rgwsxe93UycJT9kP3k00Lf6AN129Mrmke
	 a5OP5wS9JgtqvGBpXj4pIy/8ern0P6I7el5kEvIt/B1Fu5N0+QGrC8X0eSLM6y/UKcQ1b
	 T7Z+1SAv9ll7W+4IRafRWgTDV8cNoyBZOGn0us4pR18aK+hSaNAYh0EJmfbYjpMhs94JI
	 H3/8WarWV3IvuzTa+osLO/7GAKjI0evjOt5LbMKytrSPPMo+2ApS+jf3bpBEXvt+Mf3vn
	 pnMk/Gv4wGjru/blwf+y5cQRHdWpyMTfoCaHx41qYrCVbx+3xtBePC0SDhp9jV4ZNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=00/BW83UpDvF1/mIeyocfltqG8uBMs8V6+t3SsLg0/I=;
	b=mBsQ0fmcW9FvgpB08u2vitHw+Cvesrhm61fR3rN22Llnou6IgEP+g/8/Kf1HAk38T4Eh
	 QbwnURTfWIzQQxtnpbWatDNhWLQAjuca1x1CYXVPmk5SS/pAadHbxozg8I6KDyLda8QOl
	 yr6jT1YFQHIla4EXf2cqT3+u7/AxrvZtByrI6NYl3o6Bkmn6M3nbqZLaxvUmFUY5DkUaF
	 1oDj4lgYXY0ly130k/u6sXHqQCSVK66TIELWLZZ2KKMzjm2B0xhgsxlQhx8s9OweCJIG7
	 bvl9a1nfQbfBin8Rqa9SDX6Tet7F8IFNzHltpo67i/mr7nukj37nwoorZhNgzuc1dLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlT8q6DF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17960A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B17960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlT8q6DF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24704035e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333978; x=1794938778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00/BW83UpDvF1/mIeyocfltqG8uBMs8V6+t3SsLg0/I=;
        b=mlT8q6DF+G674IRGXyaNyQUROjSsnmYYRaeOqa1mQIUaSqt+D614CwlePIzJ4nq/dR
         kVblt0hPou+GpJFytetyijloE/wJFF+7xVgNqLlYD4R7T2kqzGi6kWOZ2gHpzghrPUht
         vXQNbj+K2baqzXd4WzfdOnCAsiLWoYZBjjZAjmuP6gMFs9l78fyVy9iWhqD8h1GdceFc
         XlLS/BsnBmORFMQ310W11phg5c2Lul6prVf2/jvjLc7ZOpkIjyaMMTOL6KjbqVxjox+K
         qe5zEDR5BPh0vsFODVhb++M1CMSzTWv4tb1RCNbz0RJPURQJNoPpiJPN+ul5Kutyq3rR
         /EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333978; x=1794938778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00/BW83UpDvF1/mIeyocfltqG8uBMs8V6+t3SsLg0/I=;
        b=mULVCRUjnRNyFE9Z45gs00CzceegnTJfwkYk3vZOO/Mzlth4/J61R3a9H/eBymMSzH
         3gBTABMhG2B54TJ2L81A8C9Y1Tty+Ok0xJ8/I1Ju5BmOHTeFqMmuzZ2/lNGIbPNFFlg6
         dsYxyGCRRL3U5arHYNdVRAYr7pkMJViNjvQpJQlAJAyWyUhwsIq6Acbi2oAeyiBPrcME
         7IuQJC30u4s+nEtsK6LZMsJm2N6aynlCS+B+ubdz6lI+y82pVW+inZyJYX4uXlv5smOd
         Y0QGqTrd2tWMipnZrFQjq+iN+gXW/hx8ldXAABljidzJqwlypPerOdNyX+EhWeGMGtt7
         9O3w==
X-Forwarded-Encrypted: i=1; AL+hErGj4CFCeAY62ZCDPv1ikwjTwV17vOmoFd/uKbPdWedEsK0buuEr5ptKqhWgScjPj/RXqJlZIR9G4vYoZ/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vSZ2UJqfwGdByHK+bR7FP4SM9YekB7fSqE41C9gOqZ0pQF+Kc
	pTS6iO6Mogr82pH7BCWMPpkkQrtUnzwYf/R+Qd9/9GRlqE/E1cdFE1+j
X-Gm-Gg: AYBFou2FFV6W3wjKUWdWbi58hQnOxUn3NM1/HTvYAzX4nh/jHVh0HdP/EuX2YQexJ9W
	IpEEYTYvQsPb8XiWgO1ach1XuNb7gpCtCPUbajRF5rm1ZPzg6hy7/5CvFUzGZn+/pVczU3lke7h
	2ttdK0BDr8Ze6dxNjZVwfpeDIJ8BNj5pnhN4Bq5ESNlQ9FnoVmm83iKkTg5MH+QAfVlAMqfS5Sr
	s/Hir9E6mZuStaPo280t2w2cDpmcGzzgpZKk1coyOXL3oB8d8w7ovNwYDwAOzZQjZoZm172qwVU
	vz/d30oG0uHUPvoyrOxif1lEdVcuwaUSNYhk7EGAcNmPJRPuzjxXhoVy0oNoJraad2yDWIR/EVN
	MQ1PDYPtrxp+NuWJc9KsP6LtLNnFL9Kys413fESQj3Nsw1/13wYOt9jnns3RzKhwPcVgnng9z2Q
	11zAiiTNXsbWkHseYAr4qkvPBdbFXqCDRX5pzbkK5YE3ASJYs70ba5CP15ZJ6hFF+KPSmGPxoxE
	KCcLlwkb1ZPGUbbipykph89c1Ey8S13gAfmZvHgcpYFX5e2W3HLXnbHUSCrMrywN33SG/milwrc
	7k7l4FHOZxXeFsJwo71GpRSlb1e3c5J3xCXbhbHTQ1fzyjlvWqRBxUpw18S8P+gr0Gfk34ICrAd
	JEwbXbhR3QeDRN/I8T2kNTb2GaMIoMdh+l0XtTYDffKnbA6TMb6sHu3YpmGEiM2EgFf4Gw/3QlY
	ukwbN5WVmAt581UNwz6QUmMUIwsTveaRpKOBoqjkK4cookc/0cUA/LcG6uCaiy3LMtoGRfjyw9W
	p4sWwJTj2Qf9fcKvw==
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr65665845e9.13.1794333978452;
        Tue, 10 Nov 2026 10:06:18 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm6270450f8f.48.2026.11.10.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:06:18 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] tools/bootconfig: Preserve values containing both types of quotes
Date: Tue, 10 Nov 2026 19:06:01 +0100
Message-ID: <3347694260715a039b799ddffcc0c1eb05e7ded1.1794333957.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794333957.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com>
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
index 1bab0e685e2d..7042bb5fe280 100644
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

