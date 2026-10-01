Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1E5326B6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868106; cv=none; b=H3W0+BX6uOkaaj7taSdKKuG6N/urFPbTvvjLG4olVLK4eu0Qs4Og8REIbVxJEVo44GmW5kVVCc/yfoiAjQi5RnfshAhh6PAmi0nKjHS9EeCS7eNxAq4/5nZzcIdnNcv4O/CAXdozupg2+fLwD6jjXODZesWJ+5SByrY2GDQ0zZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868106; c=relaxed/simple;
	bh=0jcN2iFHeLYz5g2Rm8sCC2sW0gbrujvXHoF4PubAbZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt1fxnIdI1tMqnzJxvqZogXTaGEjgfOqUyLrb5TUHf9/iQhoAtJ/4FhDSZDXTNovHkdrwFJ2CAViOzY//tQ48JZo/VjDcdnRhIvR61Ro/wDDxXLHvjg/1EnpMHQ1+HbicgMAhpeXWSP/eJwd4CkegGvx8MZiaaToC5sUz0+qa4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ILzrTdpp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ILzrTdpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790868103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6y7FpboE6dB3g0qpILJfxK978PdFVDdCOnXJM43FKdQ=;
	b=ILzrTdppe2fo/9G9YtiDb1ZpZ3t1+bDSE11oHwv4wnFPhZxv67m2Z0PsXKs1CiPqsruxf3
	1c/kbEnoO/WwwhcACLTL3N5VNUpcMTqbMVIAo6IGmMuc9Z6Te73E9mNUD++9ecDPZif8nN
	MtPsxjX+/e5lvMeGNtDYjXwEDbpDXyY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-QtAUeN7bNfKEae79EI5-mQ-1; Thu,
 01 Oct 2026 11:21:40 -0400
X-MC-Unique: QtAUeN7bNfKEae79EI5-mQ-1
X-Mimecast-MFC-AGG-ID: QtAUeN7bNfKEae79EI5-mQ_1790868099
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3ECC1195422C;
	Thu,  1 Oct 2026 15:21:39 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 581ED1800361;
	Thu,  1 Oct 2026 15:21:36 +0000 (UTC)
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
Subject: [PATCH v2 04/15] rv: Cast result of model_get_*_name()
Date: Thu,  1 Oct 2026 17:20:31 +0200
Message-ID: <20261001152042.124445-5-gmonaco@redhat.com>
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

Functions like model_get_event_name() and model_get_state_name() are
shared with BPF monitors, however those programs don't play nice with
string pointers without fixed length and the event_name and state_name
arrays need to be defined differently. This gets the compiler to notice
those are const char and the above function discard the const qualifier.

Drop the warning by casting the result to (char *). Note, a cleaner
solution would require to modify all callers, but that would require
changing every single monitor's tracepoint and the advantage is minimal.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/rv/automata.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/rv/automata.h b/include/rv/automata.h
index 4a4eb40cf09a..3c7070e91d11 100644
--- a/include/rv/automata.h
+++ b/include/rv/automata.h
@@ -27,7 +27,7 @@ static char *model_get_state_name(enum states state)
 	if ((state < 0) || (state >= STATE_MAX))
 		return "INVALID";
 
-	return RV_AUTOMATON_NAME.state_names[state];
+	return (char *)RV_AUTOMATON_NAME.state_names[state];
 }
 
 /*
@@ -38,7 +38,7 @@ static char *model_get_event_name(enum events event)
 	if ((event < 0) || (event >= EVENT_MAX))
 		return "INVALID";
 
-	return RV_AUTOMATON_NAME.event_names[event];
+	return (char *)RV_AUTOMATON_NAME.event_names[event];
 }
 
 /*
-- 
2.55.0

