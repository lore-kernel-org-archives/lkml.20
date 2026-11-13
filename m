Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538173;
	b=JCxxQAZSiBDBD1aoxXhBAn84TTnZSkrMWejLy9MDdyxeB0b2C4HaJ4gQovLrUmPF/MCe
	 zO7M6HmZ/14HlBMS5BsAmmxpZ54voN82Bkdl1QS+n9Q+qSG3AObsXV8Mf76OAO/5NireF
	 cL5OTPoTNb7PwvO0tpI0bdND2tS1630A1HCpuSQSCqolKQAV5Th3QOYHSYRokUGS1Sla4
	 MhC3ysRIkBXl/XeBLRb8HYkx1fLE1YChJ0XMvyfoTH4TJofOr4PpHWxc9oqbf2VMSmqdb
	 eLibXwDpyiEYVrWYRpMpm6SwEe2H1SwcZVV1E5HGLRG6FkcmVHQ3pfkqIQBeipZsfVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
	b=F9JEFQ6AtglFSV4BJcnM6bFrNwUfqwFvVFVbN3joVQeqhdTv/SlOlH5C6TRPXx+JiRa0
	 z7MfZWieGNDdC/Bzov/E97vdXoGEHClqbVCNY13IoumGO8i7oesRIOkcl6dUHq/bZBsL+
	 jzdIsHEVbF0HMRBCDizvURCD76H+aUryvxrVDDtdwOJ8wGevnwwmVpklhpXF6kq0jj3b1
	 yxA//4P4puiMqDZNgMwE/jmVYF0ihKCxL7XxupBIvu1svUm1ieeV90/kStD+jYW4kUe9d
	 Aw4CsaCybff4IE3nNeOtecswnMXJv8jhUzyBR2wju4+uhxyj4HiC/dwl6WfESCoqp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5Y9jRcv;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30035606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30035606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5Y9jRcv
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so350394eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538172; x=1795142972; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
        b=B5Y9jRcvnYhESwdbgUjcg8ov5ov1wIuDYyUmbKT++u8hX91MVPWkdL7Cu9OkLy8Hbw
         JkfS0yhysawtup8SwukK6WqXpLdH1WetRpEdtRwZmAPMFHWzDM6Q3/IsRtXE9rt4UHtS
         wpLVJemf3DsYtQOC3Xlw85I7b2ruGw4Xj5alQxr9sfSo9tdMcQEz2q2CwSh6EykRiqDr
         T4fZS1pTRmae6+bte3NkUH2Dq3ZRYcqVhC4aS2wiFEbyo97jW5Bvh0LpJ0SI1gGnM/DW
         SM5BNWtj6zPIuj+58KlZlTIyONBsbQ+g8fvkP01O+GLDOCEYQv+8iP5zuNbFbENTRfEA
         fCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538172; x=1795142972;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
        b=rs3ciz2LQeWrJko2UuKjX9c+52n3icpnI3OG2LzHZq91V5JnWj8LjfpOXRM7+8JVps
         kaX3w5lkS+OkWfYgbKXKG+oj67mNINAFNG5oJDBLGW+cZLPwvpDaWddtA6px2HDe5Rnx
         NA3aUddfYIDs/ZoVQUyeyslcjnoO0Yxck1XODHS07bEpp8l7NPiFybfU6oA7CrBVUbJ/
         KQA0S4C1z9cqsuHlXdpYwTtuqDJFHGvlyLx5/urKSDFUZaezd8JeSPHFmJnmJU3ORD++
         zS6euAYWTyBRSf1oUhcsxfI5x+Lr0Rd6ZQPWAAhZFLAbvEnA7SrOsbgjkQsntc8KFvsn
         2j6g==
X-Forwarded-Encrypted: i=1; AL+hErH05uJde+yw7Z+kcF6Z/5d7lS9vVtL9hLnV+nZinKe4ATDUx0uVtwxx64Hpi/1HedHZfA2J/0Cfeg+1gMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z80haV82rusKNJ8QtS9GBpHmf7nHwg8vYlxXiWEXkg7218GJkcA
	pKxKUHaWfi+LEU5z7Qf+6CLpFnL440i91EBDjNDqfSKjGTqb7NC0NaS3DFQcarQ9oPCYpO+CRQ3
	OPQ4kFTmCAOGFygd+P1UEHcdr1BPlNdRMI4EtJQ==
X-Received: from dycue8.prod.google.com ([2002:a05:7300:88:b0:378:1191:3e95])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4104:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-377e15f06femr5624665eec.20.1794538171985;
 Thu, 12 Nov 2026 18:49:31 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:21 -0800
In-Reply-To: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-4-sarthakkukreti@google.com>
Subject: [PATCH v2 3/3] scsi: core: do not retry passthrough requests on
 disconnected targets
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unlike scsi_decide_disposition(), scsi_check_passthrough() matches
SCMD_FAILURE_RESULT_ANY before checking the host byte and returns
-EAGAIN on DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.
Callers using SCMD_FAILURE_RESULT_ANY (such as sd_sync_cache())
therefore retry passthrough commands against disconnected targets.

Return 0 from scsi_check_passthrough() when the host byte is
DID_NO_CONNECT, DID_BAD_TARGET, or DID_TRANSPORT_FAILFAST, and update
scsi_lib_test_any_failure().

Fixes: 994724e6b3f0 ("scsi: core: Allow passthrough to request midlayer retries")
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/scsi/scsi_lib.c      | 5 +++++
 drivers/scsi/scsi_lib_test.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index af27fd3df8d4..fa16a75e810c 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -219,6 +219,11 @@ static int scsi_check_passthrough(struct scsi_cmnd *scmd,
 	if (!scmd->result)
 		return 0;
 
+	if (host_byte(scmd->result) == DID_NO_CONNECT ||
+	    host_byte(scmd->result) == DID_BAD_TARGET ||
+	    host_byte(scmd->result) == DID_TRANSPORT_FAILFAST)
+		return 0;
+
 	if (!failures)
 		return 0;
 
diff --git a/drivers/scsi/scsi_lib_test.c b/drivers/scsi/scsi_lib_test.c
index ae8af0e0047a..aafafe676098 100644
--- a/drivers/scsi/scsi_lib_test.c
+++ b/drivers/scsi/scsi_lib_test.c
@@ -184,8 +184,15 @@ static void scsi_lib_test_any_failure(struct kunit *test)
 
 	/* Match SCMD_FAILURE_RESULT_ANY */
 	failures.failure_definitions = any_failure_defs;
-	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	sc.result = DID_ERROR << 16;
 	KUNIT_EXPECT_EQ(test, -EAGAIN, scsi_check_passthrough(&sc, &failures));
+
+	sc.result = DID_NO_CONNECT << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_BAD_TARGET << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
 }
 
 static void scsi_lib_test_any_status(struct kunit *test)
-- 
2.56.0.611.g1030f0b940-goog

