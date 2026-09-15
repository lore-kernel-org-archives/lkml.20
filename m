Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D13B42EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460315; cv=none; b=smewHLrL2MdwQVaJWbN6Hf/6ad5DVPQ4UgfI2RuBM14+r56tF9VrEXp8Qie/MfZPTdYdHlEyhGdTC0KTpFlhnu5RdGPbaXL4KwPu7n2VGCfF78DE8eGb7PoIibfuvpOIXMV70qlCwMJlzgRmSogO5F1pod8Vj0Z4wEr1z6GBGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460315; c=relaxed/simple;
	bh=Nez0wDpWr4G7sk10oIb3kHxb4r5QkjfbUppUPOGjanc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZgf4y4WgjyM3CmZxF6D7OliIE+Te6ZZe3SoSobg8Afa4+NptwXVepjyB36KmEFsKMJNMDQ2lqrXDFtrk2lDiTXhNf/rzAAZLh/wEbEmHgx3gtLbXSDbSsyeLHYfw8UTkiYffSFvwKIQDsdHm7n7TxQGNBrXy7oLBy93tLG8d+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3n+sVwy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3n+sVwy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4858303de5dso4219921f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460312; x=1790065112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvlSd6ocqZwERJFaaEwepp31AKr9wlHPm5bt+In6lRg=;
        b=b3n+sVwylerEC02rYyTEgngwH9klIFo11e8/xUHI33tH9Kq3+H7Wgpyo1VDdbV1QhJ
         LNPJuVrkUT9Jso64ybjP0ED4ReuPpnilRDwrUHlWhTPI4WDQPmAZxLmySRdZw373gsQM
         7TmQC7zF11rWe1sz/wF4nHL9LvTCJEemJmdTcO/TLaMMX1hAvqPYV35N8DIoRuycZ9mu
         lHEubDcJwOz5QReME8CUoghTkqirOvLV/2aYynxa61okPYZ2MDHgBurgnJIFHF1HtgVv
         +Zgr8HpF3lF4AzjYRL0OhhVtOwRu49iZWaLb2bdc5t9NbAmUlRaxcOgF8wQx2nrdIhYe
         NU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460312; x=1790065112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvlSd6ocqZwERJFaaEwepp31AKr9wlHPm5bt+In6lRg=;
        b=t9IWz+H0pT4mqmuJo5JFcRWLmlkyYIfrJKShVFQAyNAT2aMkETho0nJYw9a0ZahFEB
         vUfN0qsiS76QhjFpNX6+N8DQGGbKknfBZWa15HrVJOXZP/KzENshVWIMuVQIEJnsnZZT
         RnfmOp/V9Dti3WhDera70OC/GlJrvfMsTjUd6yerSDWIRICeL/UuiT/o6+bQ1R5APssO
         AxFVgJKbmrmtQ9v0xYWKkt0jpOveUxTI1NHR2e6QqiZQJkza663ys+VGP9WR2f44nJpa
         PKNrJwBvmGiO2qFLhT6O37nka41zB3lqt3wiJ9q58tkimjXDb4toOi4sxZMcxnrPeY0v
         8Vsg==
X-Forwarded-Encrypted: i=1; AKwUvByFOEVD0qM5t6C0j3YSc6/mNabNzGrWsSZnMgqyLHTtPUNY24kU2qJzZEj/1Z6IClaKgrTuryF0OgF4syM=@vger.kernel.org
X-Gm-Message-State: AFuF++lK+e31ioQknyCqfGUv2+w+Ra4HWc/XpxH3igD6OVKxTerLKfy0
	d0In/uHebJ9XQ/PIA6yZzBjM5iHcYj3taOFWLhe71Snf92M6HtmDc+zL
X-Gm-Gg: AYBFou3BxtjPGx3/EZOeTe5GHsb04QSoz8iJ7QfcJj2X0cFVdgJNGandGkpBwjy7u30
	oVJlLBMSEdizqduQ+NdOiaHIK2ZmG8ku1T+jbEvBY2omva9z8YSeywaGsJ4LB/rtZJPL3UwOvTC
	StUXgy9qbzYYMEcS6CCqv0JLpyaVkU+p/xMkHL/jcOsGxzYP+d7CAejZTV0XVYOHOvhDKhMSdf3
	UQ/UdOFJYVp9Ngb9vaq1Ag7Kaq6hiLihxroZX81hZ3zrTxowxdnGGeG8Ak2tr5KQAxJgEoBSv3T
	Dy/+yZ8YXXuA5+pN+dMMN9gghI0x6NLP45cuj/62AQn1vlSv77wlhsj74qNVYKD9//k89uudu5Q
	mGuj2Im9m6pvVEj5t78GRlPkiiEB8SB/a4zkEFFU97fJU3kNnJCf4pTOGJxC9wAenrTs8mv2vSD
	k3Y4/Q9YcDUucieHHHJ9pAHSR9dA3pNzppLteBEIq/ZRDFce8CFLOTs1FH+K5XfEzgAKfUCdau4
	S54rCTAP5yPyflNV+GqRWfopIy49lE6reAR/ZlWSWwlS6Jwq/edMxf8vkkKJUEMdWXcrHiUDoyY
	+RmZqBG5PkAK2wzt
X-Received: by 2002:a05:6000:1ac8:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48702adc271mr7574588f8f.14.1789460312125;
        Tue, 15 Sep 2026 01:18:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm31341974f8f.4.2026.09.15.01.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:18:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Octeon: offer the RedBoot parser when it is modular
Date: Tue, 15 Sep 2026 08:18:25 +0000
Message-ID: <20260915081828.25800-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915081828.25800-1-orgads@gmail.com>
References: <20260915081828.25800-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bootbus flash driver lists "RedBoot" among the partition parsers to
try under "#ifdef CONFIG_MTD_REDBOOT_PARTS", so building that parser as
a module drops it from the list and the partitions on such a chip are
never found.

Use IS_ENABLED(), like the USB device-tree fixups in octeon-platform.c.

Untested - I have no board with RedBoot partitions; the change is by
inspection, in the same family as the two above.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -22,7 +22,7 @@ static struct map_info flash_map;
 static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
-#ifdef CONFIG_MTD_REDBOOT_PARTS
+#if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
 	"RedBoot",
 #endif
 	NULL
-- 
2.47.0
