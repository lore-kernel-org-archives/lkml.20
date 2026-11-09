Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268859;
	b=NnOl4Q7Tviw9wDtGIcYu0v/hYIJXjlWtzkmXJq4PEl91z8o5mvaQX9GVSyWFzJRD6M4/
	 P3Q24GmS5LfYoPLz0gldanNsn79K3d7n+JdEmTUtF7b4M0UaTYWNav08jGRJDPjZ/ED3E
	 BbgivCoWCudkWjLjVrtjgqxmk/d5q2AzycZapK/R+mGdOBLqWqtpA4bB7cUI/HhZdhHEZ
	 VIVZJD7U2mm7cdPioBqXUn1KZS/C2bki6K6NW/Ndwy5JTZ/aQlPJ3ghPV0DH1Ctsqwu1D
	 0MML3ukkUQE0/qyQ3mN6ZSDYVQ6KFfVW2ySIcQ28r4sjv9UDOIXGChkHskRgpW7qKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
	b=HqeYW+XORRw9/RjsUbwaq9idMAYl9VD1GTW+z9kiIUMfk9fZkJXpunTc8YgAcBizmqfE
	 JPPJNTr2vaANE1drERF0wTuFJSNICTCieW+vFToLmSfDa6PBxokQmJe/0zNBcc5rnGPXk
	 +5nrOtcb9nqO52ie98y+iQ/dC6QTLS9NCu8MVuXgBqKQmbU3HEntWbmKKo+F0IaE/t5+V
	 sTU+Im8tTJiBociPC2BP9HVYVC4HZTeaXsF8CS2Zyy8k8IoLzNaah+Azn/SGunP/ouKPR
	 isrz7/+J09Mwt6nOdWanDSdpRIczBbbrf/DCWTwAoTJEBGG5VDoJHcNloEZ31gI1BOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EUApwtd;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62360A262A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD62360A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EUApwtd
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8241a56cd70so930702a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268858; x=1794873658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
        b=0EUApwtddQW4t7vBVbCqxXUdz3k2PhxAkpDWZrydBBeMO1g9iFgp0yt14Pn3k9UV77
         19YqrlYF7AC0v2fI/+NS5SK9oB1ik+gv0X+tF29wXqXBri0xzUBCaYdKLFL7AOMIcFJ1
         No0MigvZ0O2gr25cV7G2RGwM2JIwqeUD0jYf1cLnwuvK4rjAq9IQJUqfcW/cJV9GoFvo
         QzyeXidutuoGWAEBGPD4ma9uQPjTR1NXvuB1hlx/gLNqbXHvSpSvhsEjhCEDpB8rdQBN
         DcAZ6fftICgE5IAzuWOcJ4vo/2/9DxlC3BSAsaQojIeEO+ELZ+eCRkOWWRbg9Ahw3GHT
         P5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268858; x=1794873658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
        b=dAUo8sEZSlCMVrXwk6nnCoU9NfoBnnJUyG09kx8TRLpVdW99edzvsglx1gDbcj3IvY
         kIDx3f2Gyf63/tubg6TpoUuZest/12j5u21wIiZz/7tNXharJGi7SsT6zN1cQY/AtFRC
         b8o+YeW30m7wikgjdIT+gDeXTLkWxQc/E2V4myEW9MzIUcZ5cfIr0/pIXEDAaDnD4LII
         BCUSYxEqaHxiYQq5bBuB3IJ/90fhb+WhtUi2ivHsC0nqWpnNvITGihPMfQ5BWMsW5jgK
         GYSNsldsyN1S0sXNO4gumpaEo4UsuovzU684m//X7v4Cx+5GC0cYdHgRguX+OXkWL2wY
         6oQw==
X-Forwarded-Encrypted: i=1; AL+hErGp+VZQTWvN0G95ny6dOOK9MtHhR9ebtJ/AdXuLSvAUKxvOdj37gVc0EXl7ZjZwy9GCcXpjNRiwrMcT/SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CZAJtJ57t0eKqduhS4FC905E6JABec9gDTJHU4SbRfFzhEso8
	6YGzZznKtbXLbzKqNt/1tP4TTeBDaRiqUekSIW3r4XocQya6We8cP4+m
X-Gm-Gg: AYBFou0zSl+jtexY+2D2GQ07WncmgxzsXNCnJi6Oukfd6Wo7UILFBJFgOP4mtiU0a9m
	LKzgrOB3CyNeKmjB1Rrjl0zPEreDrNIWjWTe9qFvmyv7H8FcVroK9RgHpKuDFE8BKCXgwUp4HmH
	CWvOwkixBmUKtutO1jgZNGgVNkSqlNySAxgIj4Xfz1MKRpCir97BTU5CBsf9SLUdfEzZsxQe6BT
	Zu8Bh3xh/1AYgojTkoqRXpeC3yH4Nw6I2z3Mzlg8sq0hIWtXrvKBpV2Uy3fbNof3bt/cFqdRQRy
	+AtNUTRTC2Z7FzstWoF/D2O6EPzS56HLBspTI5uWqUbSH6G5lWhVgYMB3UKEFGtlnKn+c1HnYzy
	LQiVSbg11K1Zc4LZAuGH1feOJGs0PrnFZnZ4fKZSz0MbUfLykaBxaZFRp6kqDebWAkAjrL19WfR
	fyE2fStXlv8Ac2D4srqeof0hBYO+H7ZuShh0+DlTGDPFvg6oeOCRL+FXj4xKm8jn5rAuQbN560T
	LZw+xRPjWBH9wpgeiEtGjpmhmbhn+qF+N12KH7Dl3ikP+RFCYLIUfZ0zsNrraBiojRaOdeEVlRW
	SmPNdId+8v2qJN6xJh6ALVNUpFmFWCgKnmv59rkXnYI=
X-Received: by 2002:a05:6808:1829:b0:4e7:8f9b:1191 with SMTP id 5614622812f47-5683cd3fa9fmr880985b6e.52.1794268857786;
        Mon, 09 Nov 2026 16:00:57 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:56 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 2/6] kallsyms: do not call qsort() with a NULL table
Date: Mon,  9 Nov 2026 17:59:59 -0600
Message-Id: <20261110000003.1719966-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ecb444078c1c..4bbf2e65cb38 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -389,7 +389,8 @@ static int compare_names(const void *a, const void *b)
 
 static void sort_symbols_by_name(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_names);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_names);
 }
 
 static void write_src(FILE *out_bin_file, const char *out_bin_name)
@@ -819,7 +820,8 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1

