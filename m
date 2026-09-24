Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E74E13F7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284466; cv=none; b=T6nRUOwJotPeQtqT4sNZreOU41mOP0cUQOKbYof9u/2sjFbv3C7nwVoy4RW4U8Nq+8Joggk0+sfkWMyCIAoTtygNlqsDaAbQ9vXvbHeuhbQOdV/Ph6FaxNJkF7BBzyq72aINpqcpwmY4CAzPfQkWrBo9+P4Miu9tMlH1li1uwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284466; c=relaxed/simple;
	bh=Y+gbgj32yMbQGVK2wj8lP5WDexfPAGHujjgi68gGJLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIreV4D0S55aznD2foWfUGkoMC/Gvorw7zy5+JPK3aQwIkkKDqfAIvbnXfvwIV0nqogS3lBXcua0oUoA3Ro5Jl62xC3kx8z6p/PfVhfDog+Xh/rb/MzepQq9bdUujp34MudFn/8eDgc1LnuQUsaJzdr9b/KGvDzem6Yk6o3z6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=EhbQyeWs; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EhbQyeWs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=5wbo90drhctlfwJ8CsrDNmKRLKeNmRyIMleVH6A8EAw=; b=
	EhbQyeWsmT+wcvDtfYJ7H8RgQydnFpn/m6Ooaq0ErTxoZGkwP8wING4tTE/i8HKK9HjjNSa96fQ+q
	kZm/t2yWZX1zJg8In661/8YE6QiSGJzfoJ7Aif5Dy9ZTvkoy++960FcZW4TasFWM4GTFxDZvvq3tG
	jU31YULhMEzKuGPha/z37U1FHdWhQ6KfEIux1LWGmZrFW8O2/WFqS3rLNolsECeBO2zWyDjUakFYr
	boDAKGU3HONtq2VSx+7hfSsYQki76pka9i36Mttcy12R4REQgY/ve4Iz6RRw8joD4o6tczW1T5uCr
	gCwIc1lL/vD5bm/NuLt9zexDPkkSahLo0Q==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlk-006qf4-4y; Thu, 24 Sep 2026 23:14:15 +0200
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
Subject: [PATCH 7/8] drm/amd/display: copy function name into dcn_fpu trace event
Date: Thu, 24 Sep 2026 23:10:10 +0200
Message-ID: <20260924211410.867686-8-mwen@igalia.com>
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
dcn_fpu to copy the function name into the trace event.

Fixes: 96ee63730fa3 ("drm/amd/display: Add control mechanism for FPU")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 7de4fe355c5d..b2f38654e489 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -637,20 +637,20 @@ TRACE_EVENT(dcn_fpu,
 
 	    TP_STRUCT__entry(
 			     __field(bool, begin)
-			     __field(const char *, function)
+			     __string(function, function)
 			     __field(int, line)
 			     __field(int, recursion_depth)
 	    ),
 	    TP_fast_assign(
 			   __entry->begin = begin;
-			   __entry->function = function;
+			   __assign_str(function);
 			   __entry->line = line;
 			   __entry->recursion_depth = recursion_depth;
 	    ),
 	    TP_printk("%s: recursion_depth: %d: %s()+%d:",
 		      __entry->begin ? "begin" : "end",
 		      __entry->recursion_depth,
-		      __entry->function,
+		      __get_str(function),
 		      __entry->line
 	    )
 );
-- 
2.53.0

