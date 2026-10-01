Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9F52CCF8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868102; cv=none; b=RviLlaXkC1f7NzaWDhtVmplSnm6DEgtCaprVPcX3vCKJXp/Y3gBgsZZDSz3oUkdUlVv1cydbvNHSqS+uCiYxEO16lZeff67SkQKu+y+CUb2pVjdl39eaD+npr5N+SRg1KwAsdWO4C17R/v9k2mCZBl/JvlfbAkRQMwXSA+kVISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868102; c=relaxed/simple;
	bh=xN80Pfs67HCbw+oDmc7ZViSyGz9ljql1b1gK0ht12no=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQt8GwawwFZ4Q7i3K96XOMCW2gz3sWJwfz7b8hRLzqLuoVMJtGUU9Lg1FVD0CyVBk8vAhT3p54TxlfKEw9ROtzIfyZ19B7biXGdLrh6IKUX4egXr7xDvKcPUmBc/9EgWJ/QKW0O47raOrqjnHcmEvz32rquS5SrGuRpvqJCxdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsFbMg2f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsFbMg2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790868100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9nODF3ao4BoTMuSTnZHD2rQJuc0s627BBlq9bQmlc8=;
	b=KsFbMg2fsA1/q0jbTIaQ0C+xVT4uehVs/t9ppNArtAZnsmlLcYq/HKQzmQleDfrPChjlQv
	O6Td0PkHTOwBy8UVm7hYN/GSpNlt6Tb8I+Zh188laJFhbulLa0/rcG9se4iYOOWOUH8E3q
	TdTzjOenOuDwA8CdzyOXbBwdqB+CRTE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-7ux3MJHrOTCF65APo_aAiA-1; Thu,
 01 Oct 2026 11:21:36 -0400
X-MC-Unique: 7ux3MJHrOTCF65APo_aAiA-1
X-Mimecast-MFC-AGG-ID: 7ux3MJHrOTCF65APo_aAiA_1790868095
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 556441954209;
	Thu,  1 Oct 2026 15:21:35 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C0261800352;
	Thu,  1 Oct 2026 15:21:32 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Wen Yang <wen.yang@linux.dev>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Viktor Malik <vmalik@redhat.com>
Subject: [PATCH v2 03/15] rv: Refactor da_trace() functions to get strings internally
Date: Thu,  1 Oct 2026 17:20:30 +0200
Message-ID: <20261001152042.124445-4-gmonaco@redhat.com>
In-Reply-To: <20261001152042.124445-1-gmonaco@redhat.com>
References: <20261001152042.124445-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The da_trace_event() and da_trace_error() functions are currently called
with strings and the callers are converting the state/event enums to the
corresponding string representation.
This is unnecessary and is problematic if an alternative implementation
is needed (e.g. BPF without using strings).

Change the functions to accept enums and pass the string representations
to the tracepoints only internally.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/rv/da_monitor.h | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
index 6fc5ef8142ac..7f0bdfd7cce3 100644
--- a/include/rv/da_monitor.h
+++ b/include/rv/da_monitor.h
@@ -633,19 +633,22 @@ static inline void da_monitor_destroy(void)
  */
 
 static inline void da_trace_event(struct da_monitor *da_mon,
-				  char *curr_state, char *event,
-				  char *next_state, bool is_final,
+				  enum states curr_state, enum events event,
+				  enum states next_state,
 				  da_id_type id)
 {
-	CONCATENATE(trace_event_, MONITOR_NAME)(curr_state, event, next_state,
-						is_final);
+	CONCATENATE(trace_event_, MONITOR_NAME)(model_get_state_name(curr_state),
+						model_get_event_name(event),
+						model_get_state_name(next_state),
+						model_is_final_state(next_state));
 }
 
 static inline void da_trace_error(struct da_monitor *da_mon,
-				  char *curr_state, char *event,
+				  enum states curr_state, enum events event,
 				  da_id_type id)
 {
-	CONCATENATE(trace_error_, MONITOR_NAME)(curr_state, event);
+	CONCATENATE(trace_error_, MONITOR_NAME)(model_get_state_name(curr_state),
+						model_get_event_name(event));
 }
 
 /*
@@ -662,19 +665,24 @@ static inline da_id_type da_get_id(struct da_monitor *da_mon)
  */
 
 static inline void da_trace_event(struct da_monitor *da_mon,
-				  char *curr_state, char *event,
-				  char *next_state, bool is_final,
+				  enum states curr_state, enum events event,
+				  enum states next_state,
 				  da_id_type id)
 {
-	CONCATENATE(trace_event_, MONITOR_NAME)(id, curr_state, event,
-						next_state, is_final);
+	CONCATENATE(trace_event_, MONITOR_NAME)(id,
+						model_get_state_name(curr_state),
+						model_get_event_name(event),
+						model_get_state_name(next_state),
+						model_is_final_state(next_state));
 }
 
 static inline void da_trace_error(struct da_monitor *da_mon,
-				  char *curr_state, char *event,
+				  enum states curr_state, enum events event,
 				  da_id_type id)
 {
-	CONCATENATE(trace_error_, MONITOR_NAME)(id, curr_state, event);
+	CONCATENATE(trace_error_, MONITOR_NAME)(id,
+						model_get_state_name(curr_state),
+						model_get_event_name(event));
 }
 #endif /* RV_MON_TYPE */
 
@@ -695,17 +703,13 @@ static inline bool da_event(struct da_monitor *da_mon, enum events event, da_id_
 		next_state = model_get_next_state(curr_state, event);
 		if (next_state == INVALID_STATE) {
 			react(curr_state, event);
-			da_trace_error(da_mon, model_get_state_name(curr_state),
-				       model_get_event_name(event), id);
+			da_trace_error(da_mon, curr_state, event, id);
 			return false;
 		}
 		if (likely(try_cmpxchg(&da_mon->curr_state, &curr_state, next_state))) {
 			if (!da_monitor_event_hook(da_mon, curr_state, event, next_state, id))
 				return false;
-			da_trace_event(da_mon, model_get_state_name(curr_state),
-				       model_get_event_name(event),
-				       model_get_state_name(next_state),
-				       model_is_final_state(next_state), id);
+			da_trace_event(da_mon, curr_state, event, next_state, id);
 			return true;
 		}
 	}
-- 
2.55.0

