Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4AC3EB118
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907228; cv=none; b=ExQMyxEk1FsN0IReNXRYL/6s9VysMn5es1NB/tSx+XBX08hRDTe/ElI25sXnN2nmCL/vZH7adIHq2owmWFUmY2fveU2qjZEUCSPuNxcwknVRwG5CyAcTkRhBaUq2fos08tCQTZRG6PzMCK9Mywa61T6VbqtlE0Wvfv9LHnZBAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907228; c=relaxed/simple;
	bh=1zoJDXk5xgoAFrBVYsh3fxITUbcGtdrwXOa0t6RXmX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6bZ+Tc+QQMLXB1mLGLzJhz704r6tf+S/fwj+BfXsIz/g5m4sdz6AMCouTZPuHniI14VTuUd2Qqw7u/jo8ThUSVceSqjL3aXgXQDBtx8lRDucFrXyDUYIPYX/mlnQ6tvsbWVluoMDGIFoVDeugYi3EbbPX2HaXCFNL10UTcbq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR5MxCKj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR5MxCKj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso3542955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907222; x=1788512022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcNc5am4vIAyRl77N2rZ/loulQZc6aDcjgK7f0FqIlY=;
        b=pR5MxCKjTS+w4T7yImSur3qrvWxDFr+7c98jWqsiJAmZ8SmC9HFJUF69HyMsvPA3ms
         UcXZk7Q38GOCtcbY+gEapqAIzObyycdXaoVOKdrBIeBZj1t2E049QuGf9WSKP023cVqW
         eWwZnf/Gx3vCIt5kSx1ORhSuU4xOfzm9QlQCpJ9WR40Jzb1Zs/M0t/ei0+3IokAw4hpx
         TH08Op6Q5XgfioxtjCiJI3aSJnm9UNna+Sip/A06dGuSU9G9gSazm+i3PGIN4IPCZ5Hh
         Rs+umaBctq0oH85+OBjjuNVZTfYuHVW5fsbCS38IlyCCvnF3bC2IQcU5xrOuTW51fixG
         pgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907222; x=1788512022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcNc5am4vIAyRl77N2rZ/loulQZc6aDcjgK7f0FqIlY=;
        b=j4T9W+NzYjHFHvgn5LQoomqA2wUZYKNBc+qwHvsESXBc0ODQwwEJGZ3PKpUJDyfcS4
         CqjJ+5gcRdZhep7m7qXrU7fMxQhDupHr3LpYSDPv6SzyRJFfT18I6/xMH7uizTqSP7fW
         bbL7YnBV2aKEtvNfiCV3KQ/V+WqCanoFBAYpB1eqYWBPz1bFjZ4p0nuh7zsaSoJ5G931
         XxrnS1koeSNnBvAVN95BqlT3b9GeHUvRu2k5uMYiLhrvYiM5u3RE/R/ccOGb9gv2zNCh
         FpYnzq9kJel4+Y11jQ9L9kuoziqPJ/IvUVt5HmErXlziY4wrPdhFdWCSmGEYFyWw7oK7
         LOvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Jrg5aLD4KKhxG54or3Mi0hdVs8n1RXwz/5DQmWokOpmSU8u04RSIMqJoBe1xdKrv8xHDe8wiwlihf5c=@vger.kernel.org
X-Gm-Message-State: AFuF++mhfhgC8sdUxqTm1Ivep0Q3JWe4GK0BdbYUDfaP92L4Gg+UJ5bh
	JABJvmMxS+LMwOXoB02T4EzVaUymtXlx7BBWB5GQ9LI6rjCHKku9ew90
X-Gm-Gg: AR+sD13Mff1+fZY3iUZHGdHUAKRoyQYVVgE8pNAVaTMxaGf6yByulT+HWuUJ3t7vzf9
	PtQMzLq4a7nwZkHDHlG9rhsXXHgg+7Gl3NIWkhsRh8i0dXO9Gfc862eDDfYyDnv6gWaDeVJYz8W
	6xVuOpVEMfir1uyNhp4Y6HrcVhgIl+huDltDFgggzBccDIJDAzPkihKoPF8t2YZHYpriaYhp2I+
	A6JZlZTyixUMvLtxJDecHy2wpx+wg+FpJXTAg89Nzt1s2s9ZTETGN9xhIPXmVERkOSMLHV17GeJ
	vu8Z3Qhw1tlrloDFqe42AkOyuZ4KjGw5SJ+6yVXNX3+VNACBsGTJXZLM1Pp1zgUEUjTI34KpmC9
	MFMC/M18Su79m/bDoNLJsd4ff9JkcKt4I7oyBjlcp4m3iugnIM1/V9LDTnr0IdWM6tSbhM5kdtT
	vrjVj7x/24ABjUprKq+iLyOSlTnHfVMpsMmPGCaVj0kR9mo9dWIEPVC7coihkrTKhDs9A=
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr33087215e9.13.1787907221828;
        Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: rawnand: vf610_nfc: fix the OOB of written pages and the command completion
Date: Fri, 28 Aug 2026 10:53:38 +0200
Message-ID: <20260828085340.3916239-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Two pre-existing issues found while checking the Sashiko report Miquel
pointed at on the large-OOB series [1]; they are independent of that
fix, so they come separately.

The first has been there since the ->exec_op() conversion: the ECC page
write transfers the spare area out of the controller SRAM but nothing
ever puts chip->oob_poi there, so every written page gets whatever the
previous transfer left behind as its OOB. The second is as old as the
driver: a command that timed out can still complete cmd_done from its
late interrupt, and the next command then returns before the hardware
is done.

Tested on a Colibri VF50 and a Colibri VF61 on top of the large-OOB v2
series: UBIFS write/read-back intact, clean ECC counters.

[1] https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: rearm the completion before starting a
    command

 drivers/mtd/nand/raw/vf610_nfc.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.54.0

