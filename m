Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C8418A5E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518311; cv=none; b=YgTKMw9SDRf0nTmXu0jZHE9hARdqijdTL/DTFn4MZ7Qa+ioZnq7BuFjfYyuWCRTwIJQ5w+EsXhFojd1qEyu64gmORaDstD1GRxis/DyCOKUZaYMmpith4VXHsa0gfClsB5gdZeTwDK/zsj5sDwGjhyBtGv6gb92HQI/ZQtoCz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518311; c=relaxed/simple;
	bh=rJvfD1kmx5Z9DXDp2A9/YFSE/xsPUOHGlNqDR0LMme4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjEi6JC7CLzyuoosCpXwe0xpcyLSQhOLLKlMhmIeGF43FDsq1oSbbulte0fVURwX6aq0t24Ot6ggIbJ5knf9g9rLqwq3vE4c6QL4BUrVCXkBifHS0ugU4ax6fxwYtTsegNiRFRFVVRnC0dfGMFCKKNQ9x7V6AxKEE36BneEgSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAiUuinE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAiUuinE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1853704a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518309; x=1789123109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQoF2fknb+lKYGLE9q4I7eI/LFIH74rjn7xUOB1JgFc=;
        b=qAiUuinEG2/tu89zUgB1hJ5wM8MCTzLzOeNigcfw4LnvCEgOfmbCV2SBkHmYndjQ+j
         dSuW6S8h+IRezx/TjhrtjeT2LFcn7dUklD9X2CQ5n1fmi4ZbctxZQ42hoONcXVMj8xgY
         5I2ZrbalqTPEZ64qhiSOGegUDJbpTXjHa8sUNCumTG/Xaxw4rDfMYoHNi6lLVoftUMFo
         Z2g4Sh1wutqN1389Inr3PINSpxRXRt0u8MUdM0JaPZnVcQYMKofun738L/dN9q3OiJqA
         M1BNPBFfpCRIdahxvOdCYq8klctH9DwIXcAnT/lZEqOs2zWrHdOxbTIwUSN9wwJa5Z3L
         083w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518309; x=1789123109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQoF2fknb+lKYGLE9q4I7eI/LFIH74rjn7xUOB1JgFc=;
        b=tU1TNC51PKMTk3Of4eIc4OE4H2gYA7A5GrMAbl3yq9R0+qpf1KgEskTUXdGg810Ec2
         Xb6Lpf4dJPrntCA78z/z0XSxwM59cYrKIcx0kTFkRxF2Qf/dLPkWsktfGK2/Aie5hANw
         /r5DdwV7V1ieYqtoclsn/glg1PznlvknT7+iKdc1ykL3Eeb2Xp5hbHvTIo2E2GyF/bpK
         o0pmHPCEYPhkJXm2FuhBw1oUCzpKoeozUDJpPxlFvtw9UT2caEFx3e//kAYCd26VqpQ3
         XZZl42yAjeG7FsxmnTw3JUdy4M5QuuUAAimja8LOVob9CGSyle75CmI6h3ZpASZpd+7L
         L7uQ==
X-Gm-Message-State: AFuF++nG3L/ZPLUK8kc/b6hYwdNuV1F0KR4RWMpO5qvNu8I6bqZMB//P
	lW66zYapQy2yAiaMo87PVsd+Co9vfpIkirAbVgG0yytOPsNICAQrxM04rPfc9TrGZEM=
X-Gm-Gg: AYBFou2SG7KxWZqw5CH6WIur3kXN2Td7JqZNWPLOUYtthMiHJaNN3eVkpEyWHtdGMun
	Md6xnm56h+p9MNRHO2CP5bkWzSAVe8y/a255CrT0d2ekm/BR1B+eaolmd1/SA5CekCZ8bQNvD3J
	sxBAyjP3xJLo0WGwzdaSSe7gMBx+r0FNKCtqAshxj9Ov+drM2JEQUPRKtkTdKzR/yQDt3M1x4m8
	d05JsEJBEcaLOSPIpEVomfRKXmRz8yXvCHjeJUxL91k/5sxIhSb9JOMWKMwbrx0dBj0jEcvPCfd
	Cbj/k+6qz3xHmL3W9HsDaUagAvxHicxBj5RpUZ5F3e768aANUKYmNce87Tuimsx89ITJmxyXkoa
	TbAwi79V69pKXX2alW+I8rop0ukdBm2LT2RVt4T1UxmmXtcOu1X2y9aoX8itprrCJZimdCxK44c
	sMGwdCteIWqYlpMAuYyGgqnvImwREE3WU9yzA3TTOo1rVqL2S6ft9E5QseXIUQ8pv+qmuVIUc93
	lqSfAAdFLUroP18LDVATt3YAg==
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr13597449a91.8.1788518308880;
        Fri, 04 Sep 2026 03:38:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6021835eec.12.2026.09.04.03.38.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:38:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iomap: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:08:21 +0530
Message-ID: <20260904103825.8752-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  iomap: fix typo "metdata" in comment
  iomap: fix repeated word 'the' in comment

 fs/iomap/buffered-io.c | 2 +-
 fs/iomap/direct-io.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

