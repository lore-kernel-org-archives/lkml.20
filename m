Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FC46A611
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522124; cv=none; b=USIQlciTTBIdrbo7EX2SePIRJdjP69WK8/Fts3v2GPnsGlvtdECe2fl8VTdRRsPq2YXOUYHEyKjQn0BuAnll4uGKHmg7Vn2t78lhzPAeIzOfQ3dKN+vO41kcCaUtCGVYohZ7bg9U6hSfWJ+py5lpimVb4oUWEvMwEFsWWA5Vq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522124; c=relaxed/simple;
	bh=p10aG1VrG/oNHV9Fr/mk0dU+qJCL08DYoYmeQJrFZ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUHNugwZptZPlb0LLDOyYADAnOPip53ZQYzN+rJFDycZyfIcZvAd285nN9xZO6HCIQwjRycBsP+iEXXzcwIYK257kTgjSZrqpbnnFCEhwp43RSQwXi9wgNHN52eNmSpCkJEsrtGS8mGT7Wjc84n9h9IElze4Q46rw1dr0n6J47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMTvEBIK; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMTvEBIK"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a451915d8aso895939b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522121; x=1789126921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDvusaMxs91qsVo5E1DtVwwyTkHxBb9758PdKXK8IE0=;
        b=LMTvEBIKC7ILOuqcu2YHlloRCdFoHWDijVFyxHvWy9l77x6YWsSsmv5wER+oIFkhzb
         HrNK5k5pH5rIijcI5+TTWDGyHzM3UGqeAljxHZga+gXIgyXlmlU0EmCGSiXEHExiJvwI
         Xg3K7ziURfuFP+CnMqufCNqgXZxb763M92qCzKfWrEz6mgUmmYNBxldTrXGmQoyrAyEV
         gfs1nWezDsJ9Vh7jdN3ABTnvQxL0n2T3lS1BaKTwRoaP6lylHvFlW8ZUkqLWNqzjRXnx
         kFqZjPHgxHY6c6dwNCBgit8q7uQcP1oHD2PFz6eJbmoAijKyiiFzG9c1SuCPizByka7T
         Bn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522121; x=1789126921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDvusaMxs91qsVo5E1DtVwwyTkHxBb9758PdKXK8IE0=;
        b=NLn/3ZQbLmjJQNCRmg/cRcHToK50ZlTVsZleCfgG/3tYiXPnVjyqgHsjU9TCvanv//
         pagL8Sj/gKothAcijDZ4mBM0jljzL3AveyOsH5Emg665/xVx+en8TAFsgdX9NrTU+C7+
         kk5T86A4PsbVwkni4PrUX4o8KednnFWnjHVIuTFMumyoI1w1HSoeHq4csMQcXbyFFxUQ
         vcc2u90NTD4vfoXlMfK5QIFrXGUEe8y1HrNtWrToGSlAEJBoSma6E44L9KNP2UHalf9T
         WI/chg1oS4gEbAsJP7gJ9u7wKs1lRdxgMsLSde3CKjwQMotJ8uJbjtYCeRWHzEruS2Uo
         /T2A==
X-Gm-Message-State: AFuF++m0UcBELzSpsTBQh8NJgwN58y/rF+UVDRqHDG5cy5NWa2u7cgK3
	WN4Ug41iNVcBKU3pSUBeGQzYFeQ+gr07pGgoHNPposAQlvGuOZd1pS0w
X-Gm-Gg: AYBFou1pTUfNMZ3NABG3HxYxZDLvkrWeFc2sp/E3InLSYjmtmL/t9qR6OfZ6SVgqwpI
	ktOIudHmJVHrwwlo+HjWrCee+i5KqHwvf8RFLKZV0B8LHVblkACgcXpgbTwOVN7qWUf62r3PItb
	p6+/2eQiEgSj94TEWQtd+gca4cD+QV+9wWzKyn1fm10dZdrwM2sDeo9NI4hSFPo+4Hb+fRf6eYQ
	RE9iZ1m9v3F5B61VL00TxjPp+8YX38LRjF9E+9XMgHyZvyQhvveFZbQPMOdtToWZOjW+JK4sYqk
	M/QcXgHqgrQ4T4aE3Hmtz86yVlaW+Gf05aBw4JNwz5J7l/i5hJl972kXjV9KBp1HJhslsneZTHH
	um4SdfLxjO2XeP6f6xWczdH9vbkHE4pCh6MQx5GhsaqDgINaOhCboh7DZbqMy8vJOqo3ZAKySkl
	ucwTcMVB0vkCaRA9b7U5+hyQBto2O6EdyO3hmkufzQ2wYRd/a1lmxuQzfSvVkK9gH9J2aZzDSnm
	SQgCoCXtp2Jypx1RI3rbSpH3bk=
X-Received: by 2002:a05:6820:221c:b0:6ac:a5a3:460f with SMTP id 006d021491bc7-6b6fc6d1c21mr3837745eaf.25.1788522120730;
        Fri, 04 Sep 2026 04:42:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9146527eec.15.2026.09.04.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:42:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org
Subject: [PATCH] greybus: fix typo "registerd" in comment
Date: Fri,  4 Sep 2026 17:11:54 +0530
Message-ID: <20260904114155.25434-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "registerd" to "registered", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/greybus/greybus_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/greybus/greybus_trace.h b/drivers/greybus/greybus_trace.h
index 616a3bd61aa6..3c331e09ea83 100644
--- a/drivers/greybus/greybus_trace.h
+++ b/drivers/greybus/greybus_trace.h
@@ -339,7 +339,7 @@ DEFINE_INTERFACE_EVENT(gb_interface_create);
 DEFINE_INTERFACE_EVENT(gb_interface_release);
 
 /*
- * Occurs after an interface been registerd.
+ * Occurs after an interface been registered.
  */
 DEFINE_INTERFACE_EVENT(gb_interface_add);
 
-- 
2.48.1

