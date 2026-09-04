Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EDC486BA9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524466; cv=none; b=crkiKSAMZLfGCdBYy/waKQsjo9AICRLposO/r7Tmt8E2GSBLAmSVPM4kdUoJdaa2WsCUvVFe7Njw0uTUP2ywUkLKBc7TDCp0M3x8IE3pfV8G90etOzX03JpQaPaUfUq/HBwx/fX9B4ol+5J4JOGyAc8VKNSr3VsYqDpLYlJd0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524466; c=relaxed/simple;
	bh=718iZZsmypF7XghmdwvMcFMPMTTcs/XYBUa0598X1t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adbHhosb3TuzjsLdFZEW3xWnenIWZINzA1Q/cvTlf0SmORo+mrtQkbwGDtmaPHAAipo+ZdDF7PH1GW0Tn3xQJ99TNjgSRv634MDJXVgZDGESRfPReF68jJz9F1HGcnl6lxulYL8xjSxGgsWAl40f8yncCvhOIOhQ/1KJFiI8SAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJ/IRgvM; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJ/IRgvM"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so469111eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524464; x=1789129264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIthuZ++MJ4ruXKgdFHwNgs7zuf1TM7Ja2uCIJrD2AA=;
        b=pJ/IRgvMJG06nsdVqf55RiD82CAmuQW20CdOBmM3Mp8iGDFkDu2c8kFNtxmveqjIOP
         iWWwqBuY5d0R5agoFSXpECwlN2bXPwDY8f2E5VQg3EA5PRaLZYRKIc1GwOa3UZ7pFnw3
         GPvaw15e60zVc+3bF4j4iwNpqmeH9O0xs0EVAvjElHXHF03JbQSSTzj6o8Aw+uZtKN71
         4KwqJtFPpwfyjzAbCQGmh0dNV5NNFrnSzSiuyc75movzHtfE+rC30RFFbJpWtMwkBF65
         rEHiHjo1MKy57a4j3HzuJYnhIkNJysIzsiqKkMUBJ8LClXPyMy/3KgWnqHk/oTdrs2o2
         UkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524464; x=1789129264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIthuZ++MJ4ruXKgdFHwNgs7zuf1TM7Ja2uCIJrD2AA=;
        b=Ced+EHmGyVv3rXZ0kXlAsyt70ncDl4tLLhuBGiVLHRSXj+sm3y8zzRVPMjVgUEyQGX
         CHSMea6CSNsPfEAa5eHjCq1ED70Ingp1Z4Zm0y51tVDHLqUN0w2j6A3jJrEYX2FZKXzg
         caOJtowU+sSG5BLuU2jq+DtC2osD30Zx3K3oYQnak/TidT5iQfLClO27zVkyg8SpPewS
         K2cxoplHWUvy7ypm2zaJ0geJQaDlc6izOiWi4wM9nTdYmMxMwATkCmew4Q8IwtBdgWER
         +Rj4mmDpTL8lC7X5PbmhaO2EjBd7I+Ix/mkqloOfIYwBSCQjAX1ZfLy2bxJwcKrCkaSQ
         litw==
X-Gm-Message-State: AFuF++lQX0ot5VHAR1t3SrvLFdRkX1kYyYHiabC5MUpevlcq4iRhHVaM
	y61N0XbbkG01W3IuWlVeuwxFErzYVfuPZyIWzIdtWaBBI/xwaAbqJGOs
X-Gm-Gg: AYBFou03oWJHifjedrB4X1wGo56opNR8Mt7tlaoeldB7CWUtY/UIjvyO1Hrnf6mVv8g
	NfU4QqFpa5lis1zC2QNYz5hIG9H+6aSNlEXq4n2GOlKqdcqhCK6gPrAXegYSxhQiWAPNZYPdE1Z
	3Gk4wdlY6gcOx0Tg3H64mQuib5G2cIqYZzWmCSdU5l2klPKo+xaYq5j7yW83LLtRZtqMV4Dfnwg
	w/DCYc/CXRqrgdEunvhOtuOlUXOdZMzfwgSmtHiF3aPNwjYZcgQ6DPmhMvJPLadv9E8T37DrLPM
	oZiSuO/3XtcaH/KqTaRxqF6w0jrJ8DJbVwZDmBeolFlhGUaYbiMxAm99B/UDW1OlnOgJN0o8+Kg
	Nvuf7D2jdpysJ85Y8LbGGNTpgOqXVQsHMBfAS06RlOnH2OCzVES25xWqLWmvsHzlQw8SmgC4fDs
	eUVgk9hgzE3V79tUhLmtUBkwqLYH0UbGQEkdeGpMn5j/DuIX+F88a2P5Yw+vVe8r+GRowsCmt0U
	9Tp0Rk5k92VMlE=
X-Received: by 2002:a05:6820:2219:b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b6fc9d05b3mr3695040eaf.18.1788524463588;
        Fri, 04 Sep 2026 05:21:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm7116019eec.21.2026.09.04.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] seccomp: fix typo "overriden" in comment
Date: Fri,  4 Sep 2026 17:50:51 +0530
Message-ID: <20260904122054.28531-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122054.28531-1-hemanth.selam@gmail.com>
References: <20260904122054.28531-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "overriden" to "overridden", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/seccomp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index dbfc9b37fcae..6d9158152360 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -104,7 +104,7 @@ struct seccomp_notif {
  * SECCOMP_IOCTL_NOTIF_SEND from earlier filters, essentially allowing all
  * such filtered syscalls to be executed by sending the response
  * SECCOMP_USER_NOTIF_FLAG_CONTINUE. Note that SECCOMP_RET_TRACE can equally
- * be overriden by SECCOMP_USER_NOTIF_FLAG_CONTINUE.
+ * be overridden by SECCOMP_USER_NOTIF_FLAG_CONTINUE.
  */
 #define SECCOMP_USER_NOTIF_FLAG_CONTINUE (1UL << 0)
 
-- 
2.48.1

