Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3A4963B6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352846; cv=none; b=FFZliQdoODl2LSEuC1y3c+Oc1iIsS8X3PjCWSCDKNgeCxJjTqyyrMzSYLeTQ4EORYwK399UuciOTDczXs4JBttP8zVKbtBEsjCCB2ixHsbgqtJhF9Ld46RFWYPVxxApkvQE6nxYqkQNU9xVC3rYsQVPJzaXuB+REr33edFKi7rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352846; c=relaxed/simple;
	bh=qT0DAOgjdJrEEKXxnuOv96A2U8pBrx1RjuWnyxOYjQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jozQrAepucWNx8kuZ0R0u8GKfDXI+r4Tupr2F9a7alf8Gi0fJvNR3vWSY/5iFruRUNaOrK3iPQ8TPBnKlMYko3F9gw5FgcoEY+zkS1xmnIS/AgZatEO7bgwXzv2zGjZAd8pEjsRShfzY/B6lCX63Bf4XbhWdRVh5b3buptIkJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CND+5YCx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CND+5YCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788352843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhKZ4yS66uthVZ2uXlRGt01Z3p06b8KRi2tpqHHHg8w=;
	b=CND+5YCxWCEN2Z5X5ZZ0MDzsCr9G+efhwOJavIzhgbeGCBVeOGQiiJpIb2jcR4kAvw5jMX
	6l5K5sl0t5JuNOG+itAOVSQl2McEcAmkXSdafjmFr0+wEMFovK+3asMTvLbMpDhXwrteZp
	+YP/QtqTmdIQxF5lp+Pyf4218peFo0c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-Gt7dm9-FOnKtsSwTW5pVvg-1; Wed,
 02 Sept 2026 08:40:38 -0400
X-MC-Unique: Gt7dm9-FOnKtsSwTW5pVvg-1
X-Mimecast-MFC-AGG-ID: Gt7dm9-FOnKtsSwTW5pVvg_1788352837
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 164921802140;
	Wed,  2 Sep 2026 12:40:37 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.44.33.19])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37FC91955F72;
	Wed,  2 Sep 2026 12:40:32 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	John Kacur <jkacur@redhat.com>,
	Ivan Pravdin <ipravdin.official@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 5/8] rtla: make struct trace_events double linked
Date: Wed,  2 Sep 2026 14:39:34 +0200
Message-ID: <20260902123942.695822-6-vschneid@redhat.com>
In-Reply-To: <20260902123942.695822-1-vschneid@redhat.com>
References: <20260902123942.695822-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The events list is currently a single linked list. New events are prepended
to the list, making them the new head.

This makes it easy to fetch the last-defined event when handling trigger
and filter options on the cmdline, as they apply to the last-defined event,
but means the events are then processed in LIFO order with regards to the
command line order.

To prepare for processing the events in the user-defined order, make the
events list double linked.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 tools/tracing/rtla/src/cli_p.h | 4 +++-
 tools/tracing/rtla/src/trace.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/tracing/rtla/src/cli_p.h b/tools/tracing/rtla/src/cli_p.h
index f2dd7c610093d..7e3a713f97c62 100644
--- a/tools/tracing/rtla/src/cli_p.h
+++ b/tools/tracing/rtla/src/cli_p.h
@@ -394,8 +394,10 @@ static int opt_event_cb(const struct option *opt, const char *arg, int unset)
 	if (!tevent)
 		fatal("Error alloc trace event");
 
-	if (*events)
+	if (*events) {
 		tevent->next = *events;
+		(*events)->prev = tevent;
+	}
 	*events = tevent;
 
 	return 0;
diff --git a/tools/tracing/rtla/src/trace.h b/tools/tracing/rtla/src/trace.h
index 95b911a2228b2..eacafc0c96b31 100644
--- a/tools/tracing/rtla/src/trace.h
+++ b/tools/tracing/rtla/src/trace.h
@@ -4,6 +4,7 @@
 
 struct trace_events {
 	struct trace_events *next;
+	struct trace_events *prev;
 	char *system;
 	char *event;
 	char *filter;
-- 
2.55.0

