Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B103AE1B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477662; cv=none; b=Y/QEC1rlNBB0QrZMSnEPqirxszpT6V4gwUyg5fUBFRucAcn23POR23zbd65YP+O/tNyrQtYTIVKZwn7YoIU896lB8pqBqSD2XlMsP570kefLoiJ5kw+4z0Iez+HO4lahCLdeqdb1oV1b+bRIp+fIMThqFqvieDaAKzY4lZEPgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477662; c=relaxed/simple;
	bh=czxqeqFESQJ1IDbCMIdR0MSKz9qKCLKWFtSqaZMBlOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbFiCEnHL8+0vvbE42z/Rt1X/s+JW7CYs4zxqeQKufQOBVpyF9ufHhlxTUklNA3pvQ9xcP8i4J0xzkheUieBKvLsW01P7nj1JeKrU9Igb1fiymvHIKdmjbj2bXk/UGdFdLEBgavUygK+l7O0IVl0yNhBWI0ioxDEnhsejmhzL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvZsdBQM; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvZsdBQM"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1ca1b05aso2208553eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477658; x=1792082458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DfXJtzPnhDJqUStjePsSxjZK7EGw7DHoALi/EH99rg=;
        b=LvZsdBQMFsJ5mCb9SESG8LnwQaG6sqwtEHwT78aZaygG1zwXAlgf3TIMDwh+v3UbIS
         TTITMLpQhj+KM1hW7BK0xeBw6PLjV59Yq3Nso812jd3pcBJS2mAaH1bJ+BlCxKxHNkki
         n8nCHq/5pPctpLeG3YIfU/bJstMmxFF609RQTQxe2jo9yYXqZb3cnS1lhBU9MAJzK/xx
         OGoS7+BtxDrMYpBr3598oaETJ0D3jYsq22qvWIG4fP3J8FkR8Iorr5n2t1SzoCp+9sCO
         NWjwq/EdHmwtwfnpc2U/554bpW31Y/9FPOW6xavV+2/hp+CNDE2kzn5ryoSJdkjfcd+i
         lGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477658; x=1792082458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DfXJtzPnhDJqUStjePsSxjZK7EGw7DHoALi/EH99rg=;
        b=Cw1J5KY3kdp1jKzz4Qo4pmSqF2iaO6VNRTfbb2C6xdkKpBv9h01YBniCKe+vfwjRR4
         UJDwd/2vuc++os4Qe7BGD6fSxfgziLAjscFGIhpm2opODbL+AyelSfprI0g78cfF9bYa
         07k9lslAbI3pvAUtfrPzTIN6u6Qut2tbRRFI81FbGhqlL5aHZmFl0QUZtL3jfeOHkjWZ
         yP9oXt8Hf5iGFziwSeSml52wxmNzwwm+axuul8KEOQL1U36OkGVVLU9i+b3XhlwKow49
         Q+6pj/feiOvOmJSyC7NwttUtIcA7HMVBZPxflh55WV7/bW81tEVBBnxbaf4XzelkEqMR
         0WaA==
X-Forwarded-Encrypted: i=1; AKwUvBxOP4tAZUxMrHezB99jrr3+QLkl/Bf/JpDhOoAOnWar+ToAXNtfD+vS+uJDS3SneYd0z8+7ZF18vk1CexY=@vger.kernel.org
X-Gm-Message-State: AFuF++lmsRgTU8rSzV2PWF5F+NSqOJKSPbxhroCneuA8NRx8CNNSpd6w
	uOnNrQrtLSye+wvEG9XtT4M6sTOtFbzSpLiJgTRvbSOMDf7iPFot9KbY
X-Gm-Gg: AYBFou2kNL2kUqs3pyzPZBo7xvkIAEampVYkaqSD36XQq6HbA4/O0B48d88EnpbyydL
	Nepwgf+AwR+iOzoXiwP889f6qx1gziVptn8CNXo5Cj7AlINFLoMHw4PH32d1f5W6nPsk2bkBFDz
	3BpKe8FKIC81kVRv5zY88imQign5B/hYcoEcd+ljid5iN9tdq4VW1h+BGqChWkOqOCweUVVpNEh
	ST+i20uxPVZtFUdXvo8hu6lS/tfuN6v8NHpU75LNzFbaYzzB2f32zDAqkx/lH2rhPu+EAqXQeCr
	Y5b0fxjt7hcMHJ4PJLDMn/PegdFUr8nOz7Cr1EOyFXi1vHpwLyGJudF5mCJeveej2Um5BexR/VE
	xCPvaFdE8ez8tsWMJYJU7ne4iUc5e62+35svvsl/q8GeQy2hYxOdZt5cAkrddeN1rgoULQb7+tV
	dNxQjgpVgloMZF0TVnudB1IeGSJ9Ysf5E3FD2maytD7jPmWtEB0kVzpvXJdf4rgZG9Q0sN9EXpa
	2WjRo9BAd54
X-Received: by 2002:a05:6820:8589:20b0:6d9:3d73:6e7d with SMTP id 006d021491bc7-6e7a77c50c8mr3867832eaf.26.1791477657979;
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Thu,  8 Oct 2026 11:40:34 -0500
Message-Id: <20261008164035.3668885-8-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-9-lzsx618@gmail.com

 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c42..0425e00c49 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -788,7 +788,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	sort_needed_sec = get_index(shdr_start, shentsize, sort_need_index);
 	sort_needed_loc = (void *)ehdr +
 		shdr_offset(sort_needed_sec) +
-		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
+		(sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec));
 
 	/* extable has been sorted, clear the flag */
 	elf_parser.w(0, sort_needed_loc);
-- 
2.34.1

