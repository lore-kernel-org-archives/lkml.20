Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471751;
	b=TBJP80ubaiuopwlceBr/5hoCgGkKIj/oywEkEPs2U17EMGW0LVnJoOF4I21mgCNpCGv3
	 yvc5vJxuqsUhjOpAGMsjrDgBI8deTc9kRo/lRMsljqtQHs8/Dl6nbgW5nL4marROpOfDX
	 Cu3kUrqxqK+dk7h55iiCFGTdgmsStUzcNYUj07QEWOelaLD4YF6pVE7A7rCvUonTjv6Ib
	 ggyRSBKx3GMzSSNPn5/68lyXcXcr/eKB89cg1aAns2rhH7GoGbUssPInvLFWF9eSV168s
	 DN/cD6LPG+JDqWKxW6fkaHiNr3cZ0X99rJrMqPWkTpKyfobX5tV/T1TX/knfiM77Plg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JSWP+8K5x8OQvpScI07jlPc5QtG7BUmJR3OiQnYapBI=;
	b=kemaQGEZBtn/hcELwWGQQQnNUZB2zKvYEqo2lLw1UzZQugY4gTH9i75LVt5xJ1LEwlkB
	 UheKXTyUisjQoaJBXDGxX6wUdWEUMg7fl2eIu1ab+Ctd53uVICfk8kjN+6t2Lc8z/6tuo
	 bJX/MiCP7iVoEuGz64bBJ/zqgtiITkFntPqKW4kvok8TmNVZf1LaC5ipDg5HXiD1cT5tb
	 j0Zs2pIpmlRCUxkh0Jzvna0bCpVhU4UmZsynq//0/HGiXe9rMLXR68Akf8ycD7ygUAlxA
	 N0CV18xqSusqAh+KUmRmCDC7Lat7Nwh1cQ4IIata3aVARalUXDSzYMfjUTRfAg45etg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GY/h5Vxu";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A4606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GY/h5Vxu
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso13214165e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471749; x=1794076549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSWP+8K5x8OQvpScI07jlPc5QtG7BUmJR3OiQnYapBI=;
        b=GY/h5VxupOjUe7HiUqsjDuG86vdsQtf2I8PDsyeeiyfCElZ8UuZpZ0d1rhkeyGIxh5
         vkUYDggjh0GZpN8IJ743cizGwowqBKWVdxbboLQWTNN+jzXbDz92J+uZ5WC5y8TESnSs
         wRaX3TH0ipCOiIbpHrBBgnhtpqQwV4D81kzKE2AyY2TnAMBfQaOioEob7PuamSEdHIlO
         zPplGiz61RJKLtyjz5bwVwH/3k4th1+CTqDH74LZ6gCLCO/o3t3yLCn+k5aqgA0TUn2M
         wp0gtAcgJz/wQLl4qIrS2Dva2miqZl9kAQ/0duzGwm/5+xqQBg25vzO5bevuHeHuySfn
         f3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471749; x=1794076549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSWP+8K5x8OQvpScI07jlPc5QtG7BUmJR3OiQnYapBI=;
        b=qkpiMUitJ2rBR0FO91GqrKrZMgx9wGcMloBu4mkIbaGxlTs1QeDjvD6HucM2IwX/Ja
         bR9bUGy+UGl3kvpsjf6AbPu2EY6cFubytq5klZ8rqz9v7atsa3oE3XXM1MEmHvTGlPFo
         Swfxc7fGa6xFAqJRojFXgQFggfuOXf5c6elijwYwYC/+f6C6IcCUraL07oYXdQGWOPCe
         /zgDY81xvvoZemMhm2s1YO6rv7Og5CF83kUIj94tpUtJtvjmap5S6MYCYFdb0c+wdYXw
         QYqxyJRjffjZRurDYmLGQALmwBerdCVp95xsBbEIgf5oNJfCdzdfRZqe3n/KQMQn3K3H
         seug==
X-Forwarded-Encrypted: i=1; AKwUvByckQ1FGsIcED0s3Kbd9UHMJ8sPfdQ++/maiWaALN3oYM1jJs2iM/gdw4WOYZtz9ib6HjuiDDfa0cuXQTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLegqiz1gnPjq5PuqMB9X5r4VpW2zKYEaMjQVS3bv/bajcojzrG
	DwZAkEQgdreXfsFRRyBf2Bzhu0U/L/GqLszP1ZzOYFCFoc8lWeWZNFO8
X-Gm-Gg: AYBFou3tMUqoY0CitPfTL2zGbBcXtzlU+9uLVB7MpQv9oevgGEyj7HQ5VpJ/e5R9kjK
	ctabE/7Lt2y666cLGqlT+VU61WGVQARj5JMzqwgIEX7aQ5Oniy2SJc7S3oADz65NNK3lQh9xOdO
	qUTarHwIvxdaEoPdDAt5j87BLVWXMEoM5NdvDGSD0StpY+/xuEzuSBW4IVG6Jd7Kcm26xUNhgkr
	ZHLUsuuv272YlympYj+MzO/kmg9E1AzuIbmUMeeOOycOmaMdorvNpshh49UmfZ6sFNnCRU9Ftcy
	5vw9gyLDmhuRgkm7g2olVZgonLdtM8cOEmftAucbxwobu0d3sQ3V089nQMImghlN7dAmaG3Qnbr
	zXrt4pFl0UU5FuahfZriP3y5s2Ml6t69pYUILYcs2P8P1Wca3zI4SafTOLuQ5+mZv5bADltNxwK
	MZ2UowYgLtyx33GqydShKxP1I5PfnwvvRt/F5k/YomXTRdcvglZOnalQXltrwZAgOrGhGa0WGYl
	TeSBqtppnIiVZhm7tKTMZWKKIalPbk2UPHda7vSjI1bwuxE81ecQMoclz395TAXe300KawZClvB
	n5G/OUEbQ362/26Ezs0/QvVxpPBdqOhSvoxksT1fCiqAvTmVTPtYRbHTeA+G9RljWx4AexDLsDW
	ZBCfBqsfg4+3mfkgXMola0taHSXqAMTLF4cqAx9B5hHhBOThCbOGmZ3LoIFhTApHGue9q4NtiPC
	yLIf6QP13rKj9ZgKMxZ8KPD2D5V4d+iZk5xTAlMAFDiMEsVsanXopWQ+DH04mHW4qPgXzI45qKH
	XCoDeS3wj48VayR
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr122145225e9.22.1793471748993;
        Sat, 31 Oct 2026 11:35:48 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:48 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] tools/bootconfig: Read the documented ftrace.notraces key
Date: Sat, 31 Oct 2026 19:35:30 +0100
Message-ID: <41adc1bbe842f6f9240aa877b85d6b0310259743.1793471731.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793471731.git.edumucelli@gmail.com>
References: <cover.1793471731.git.edumucelli@gmail.com>
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

The boot-time tracing documentation and trace_boot_set_ftrace_filter()
use ftrace.notraces for function exclusions. bconf2ftrace.sh instead looks
up ftrace.notrace, so the documented option produces no writes to
set_ftrace_notrace. This affects both the root instance and named ones.

Read the documented key so that the script applies the same exclusions
as the in-kernel bootconfig consumer.

Fixes: 7e66ef0046cc ("tools/bootconfig: Add a script to generate ftrace shell-command from bootconfig")
Link: https://docs.kernel.org/trace/boottime-trace.html#ftrace-per-instance-options
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested the documented ftrace.notraces setting with one and two function
names in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled. The original script
installed neither exclusion; the fixed script installed both exactly.
Fixture checks also cover the root instance, named instances, arrays,
an absent setting and the unchanged positive-filter path.

 tools/bootconfig/scripts/bconf2ftrace.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 7745c97e7abd..e5a833171b57 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -258,7 +258,7 @@ setup_instance() { # [instance]
 	set_value_of ${instance}.tracer ${instancedir}/current_tracer
 	set_array_of ${instance}.ftrace.filters \
 		${instancedir}/set_ftrace_filter
-	set_array_of ${instance}.ftrace.notrace \
+	set_array_of ${instance}.ftrace.notraces \
 		${instancedir}/set_ftrace_notrace
 
 	if xbc_has_key ${instance}.alloc_snapshot; then
-- 
2.53.0

