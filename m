Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB454D8DBE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284467; cv=none; b=P3haOThNAialKT8AOlX2ifz9hGXg/0CcenSf+p46eyC52oLbzDRmpMkZM21JF6kBJZHdh8HOLv9hxTFg+zKQfWRcWSRACe5RB99aumSNkqLIyIjO0IqSkG11ZooTQEwEM3P+e5ROuSxSWGTUHtiMi1XyHIznQ9Rzwcnn46uYPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284467; c=relaxed/simple;
	bh=9xC8YBZ9vXaoecdIXZFYpIJ8iIev82LQ7BfdnEJqSH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY8Xkl4H+18HFVJVVHI/SPVwos3MmK/WNcUYaJKe5j8B15ghLPv8+P4fr6N+DDD7g8ZwOd1mwrTQtRP2dxWQF5WUy8A7Ey3hZPt93QiSOR7k/EBg7ONf1AuDRRTi0wYU7tM+IgK0s1iqVKze1vwkCaIaTPUJ6A9MTlC3iiG284w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OQ2/IJoG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OQ2/IJoG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=M84mPs65aJFN8Y8PkL2D6LYbGgiqN1ylfaTstFz/I04=; b=
	OQ2/IJoGgJhy0hFHV3CK9NVJlWwF+keBlvah7BsNr/qRqho8PVPd8pGbbikqJigt1Lc2+j6IqUdtq
	bYHOmMw5eJOxiyuAEmzuIaZ7UOkQJSb2b1u9PwBDlmAHmFBcdgXF0IxyZT46rZl0iBf+Rq2akKxPJ
	Pj/KwF/FFOFyUZ2W6WqcbiPDtDupWReaMdwYXJ0e3XM+6zL3G6AL+y8GC5oZesdDHaB/FjcrSeDd9
	XKNAluBAQ3KAu463CPDtz6mZ/EIsNGQ/LdVnNU2WiPyDwJYd3hBeK6m19wGA9pKwiaIy1q/CpVyQb
	ua6i9dpS7YZ23qL1RtnBWrTXxW56gJdhRg==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlk-006qf4-Nu; Thu, 24 Sep 2026 23:14:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	aurabindo.pillai@amd.com,
	Aurabindo.Pillai@amd.com,
	christian.koenig@amd.com,
	David.Francis@amd.com,
	harry.wentland@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	Harry.Wentland@amd.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] drm/amd/display: copy function name into dcn_optc_lock_unlock_state trace event
Date: Thu, 24 Sep 2026 23:10:11 +0200
Message-ID: <20260924211410.867686-9-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924211410.867686-1-mwen@igalia.com>
References: <20260924211410.867686-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Userspace trace tools that use libtraceevent to read binary buffer only
see a kernel address when printing const char *. Use string macros in
dcn_optc_lock_unlock_state to copy the function name into the trace
event.

Fixes: f1943a51f0f9 ("drm/amd/display: Add events log to trace OPTC lock and unlock")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index b2f38654e489..7f05f73e5b33 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -660,7 +660,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
 	    TP_ARGS(optc_state, instance, lock, function, line),
 
 	    TP_STRUCT__entry(
-			     __field(const char *, function)
+			     __string(function, function)
 			     __field(int, instance)
 			     __field(bool, lock)
 			     __field(int, line)
@@ -678,7 +678,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
 			     __field(int, vready_offset)
 	    ),
 	    TP_fast_assign(
-			   __entry->function = function;
+			   __assign_str(function);
 			   __entry->instance = instance;
 			   __entry->lock = lock;
 			   __entry->line = line;
@@ -700,7 +700,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
 		      "min_v_blank_interlace=%d vstartup_start=%d vupdate_offset=%d vupdate_width=%d "
 		      "vready_offset=%d",
 		      __entry->lock ? "Lock" : "Unlock",
-		      __entry->function,
+		      __get_str(function),
 		      __entry->line,
 		      __entry->instance,
 		      __entry->opp_count,
-- 
2.53.0

