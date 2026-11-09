Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240013;
	b=bbGeXWZYx5FVUPfMRHNPiafxGWjk4LWQKzhht57DFf8USadMMVT/nui9PQou8jMRJ74J
	 S1bYoQpsbC3gULPOO8zM76gpQ5wnZGnskO8bi/+hvy+hZN9bYsQ5RPERdhpLvzujYmb1m
	 4k1QQr0Rcjxo1IIbpkFeLtUA5g3xDbJxl+sVw1Dwfh28b+cPwzTpEZUfGmRaUCKSCth7w
	 f6G3clI8TFpUmD1Pb3l+jgjR/jWtTRBogb/t8GnpoNKjaRed6CGwfqm8mE+ftRa5tTZNN
	 QW6giBuBV1yJo70SuW80oqQXDVd2Qlk8Ndi4rZK/QasJQYt/fXuoXYz5xORxtZJDyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
	b=seX7TLNEhlFef2LLJUMGaF51ECpt0C5xrIxTP4IbsFLycwB6y9SB2mz/bQSHDOdqioSk
	 VtkZ5io67vmvBlANUgd+MdEHZ7Lxl1YnTWQqLbFdZs3WSXbLbuY1mHOiN3XBcFHghm824
	 DsOM0QYsR1m7BPDAxESuwBSSc8wn0+jXh2nLhvDYSU4slp01t9DxsHCDRMoSJGrKl9TRQ
	 kUcaqMMk2Pxy60zEi2efW0B5HYxsw2W9NYouC9P5JbzgdLNmSvFOdumdzF8crCvz6kQID
	 hCfWbkxg10naMQJM1GQxL7zjJtfQ/73oKaq3VHE+IC7rE9/3sHcYw1s0rZNisd5Nrjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y/MJp8uF";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B986606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B986606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/MJp8uF
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1758977eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240012; x=1794844812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
        b=Y/MJp8uFrPneKv4tmXU8sXRiFgMTrl9I/DECANgUdi+N1ChonYVjdmp0SLiXH+nI/C
         +h7xgac2eH/iTc7Rg6wDoSYm5GqkfZ+sSgq3sJ3hRSx56PjDnkPn7jf7WrtXO36q13zj
         srkmYiIA99XBc9SjSX0Y68K2QpLP7iIkWq9kPyi6ocjKrPt03zvUkFr4t88ShD4eapTX
         3IharZ/Q0PHgz/CfLT0cRzHTIF3G5z2XZ1fwLOAnwqdabV5KpnNOGWzLjONtbbTUgu/W
         WqzZtboPd+Jcw9qMggCbtvC5tzqCEZk2EmSb4+Uz9j77YMNQMqyxQr5RHrhWq06zrMI3
         xWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240012; x=1794844812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
        b=mYQ6PWY5jb0qUMorUTU9Gqt5qKjQXfrB90oWeh6Sw4v+hyg+6med/xURSXPx+BZJVv
         bm9uPp6vNHwbcGLQnJagXDbbuFZ/FPy3bW2UurBYMLV9L79oSKD7F9kHRUDMYMpEywZZ
         9oC8B5fix8C3GpheZBeYlXYEn/HU5Y9oUfpLIO/W0vR5lgGeH3XDKmMZcMz5QiDJ7d9M
         qB3vXPUUKjaIUXxL9bSHu9Edi1NjAq2NCc8sxWwvUQXexokWRFn7ec5rfE8r68Xe+iFj
         fop0AhzN5/+4omTnTSgEC8NyeVpriPM6YTuMVu9UZj6t0gFEa8swpmMURj3ZxEKdj1Nr
         V3sg==
X-Gm-Message-State: APuU4Z8KMvhoDfO9XvAx1ZZvVbo+VBXB4lfY4hiFDFPR4OUCENMnTZ7O
	i1FySP9x36q4C+B3ou214dITDxx5r2SIq3tUD+BHQsHwaKXhKALSOQZC
X-Gm-Gg: AYBFou1y+axRApQTN/iusJbFfyvxnZA1ZdPijpQmli/C9fIvl2WIVRdN7oVhp/AjXOz
	axZFk8AJF3YMCl9878VW19u90o3azDpmTuC2RHljz5KSdrLfH0UfSPS5GrUw9xnbyQT8pCwamyp
	HMWQ5LtnQ6yLLLlQRDA+Yx/SyLvATCa1kW2E3hgbYyOx8n8Fuit3SWSlAQ32FSIg8Dfafv2EPto
	vUns/RcdPnAb9Uq2fralfqb2wIkpUbZeImrJmqK4pSqb8U921brK31M21LzAfuSYBWahK35ZxP0
	PeCuofBTAOhB+OFZSs+On5nF3hSgroEQjS5mioQSAgUGsJO1xQ0RD5DAXLDgoyqBTFaSwXektYw
	tq+2EMR4UIm6whK2tOPS5CsIFeUxJgmLh9LkTip/+uxGniquarlP2ziq4PQE3oIS0vSUlwgFcCI
	ptg9eLrmj3cDErEDnLSkaYP6UD5KVuNqDb8qCz8qWzWtegB/29FevGWga7AvhGLfzB1widwme8m
	s8+lHbjfQC5vnczuQDMJSofbamqgWifCHk+0fnbp3FlahUWDJ2D+MYf4pabZ1WQcM7vVQBhBCn6
	pOAJZzL1W6LXZk8ilmf3RqrTT2ICdtM7bJsbifxnTqW90utsuw==
X-Received: by 2002:a05:693c:41c6:20b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37252e3a972mr9279476eec.1.1794240011687;
        Mon, 09 Nov 2026 08:00:11 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm14715578eec.12.2026.11.09.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:00:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v4] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 15:59:41 +0000
Message-ID: <20261109155941.5850-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
References: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
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

parse_uint() passes the remaining input string to kstrtoull().

When the input contains comma-separated fields, the string
contains both the numeric value and the following fields.

For example, with:

device=1,subdevice=0,name=Master

kstrtoull() receives "1,subdevice=0,name=Master" and fails
to parse the numeric value.

Stop parsing at the next comma and pass only the numeric
field to kstrtouint().

Make all parse_*() functions return the end of the current
substring, leaving delimiter handling to set_led_id().
Temporarily terminate the numeric substring in parse_uint()
before calling kstrtouint().

This allows numeric fields to be parsed correctly in
comma-separated input.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v4:
 - Make parse_*() functions consistently return the end of
   the current substring.
 - Let set_led_id() handle comma advancement.
 - Use kstrtouint() after temporarily terminating the
   numeric substring.
v3:
 - No code changes. Retain the v2 implementation after
   comparing the alternative approaches.
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..1b0473b71c3c 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -447,22 +447,23 @@ static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
 	NULL,
 };
 
+/* return the end of substring pointing to either comma or NUL */
 static char *find_eos(char *s)
 {
 	while (*s && *s != ',')
 		s++;
-	if (*s)
-		s++;
 	return s;
 }
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = find_eos(s);
+	char delimiter = *end;
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+	return end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
@@ -487,8 +488,6 @@ static char *parse_string(char *s, char *val, size_t val_size)
 		}
 	}
 	*val = '\0';
-	if (*s)
-		s++;
 	return s;
 }
 
-- 
2.55.0

