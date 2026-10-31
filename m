Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442353;
	b=YCTjly4rwkppw9gHkg2X7nNt+YmJawQVC1xAbTDIhJFHVT9pHn2SaQ9PwdLd6s6dImH+
	 G+qAAP2tODnWfb1CIPA1f0aST2K2+kZxQOYwAlwO8LSTPp1htnBNHYHZXeAqvYKwKlZSE
	 R/zAqp+MN9W+Z+cfKLwpPKHOW6Ca5jq/AzdTiac4J1BhnMe2m1j2vBjRboUZyPHH/+Dfd
	 6ZH7LQk3ut6lkTqfxbr6XciwpNKLy0Uxoi4qApbz8inpHE5kVw2tQQDi6lpkW75QHkU6V
	 tuHQqynrnDPK118JiegvnV7mHVtMie6kGOV/dk+uMdPUBMtMdO9gSm9SjH7wmp3a2Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xC1Pndi3QD2rxB4U2UtHXjrmrtX3tvt+J7O1Ci09mUk=;
	b=wazAbmQPYlR/DoFAQt+RZjzsB7DP9paBGZmhMlLkMicC2qQDhldfWfd5jPsRNJRo2tj9
	 E4Yu62uwEgb9fXwUwXJ3NZgHKv+XQGyiwnG8G9zIWZozs88wMtrz2DD+YshWeP954r/lj
	 aVm6Yj2HDNyUN47DfDv3u6UBdzaDPPh8RHMwly280qRufegHpRk7j2XkVGcZYMk1rRJhO
	 HuDwRCk/zfos2jBogrVDMI8rJL8lyofrob6Cy7BbEdxRSwksmpydqwrSsoOsaYdgOm0Ox
	 Zgrvic8exbBoD7cWI1QHZJDI8twU/heeDVlZEVpB9xylrkHVfMmy8T3UL7LXCfQCSGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsg3ejiv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40BB606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40BB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsg3ejiv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso16185465e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442351; x=1794047151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xC1Pndi3QD2rxB4U2UtHXjrmrtX3tvt+J7O1Ci09mUk=;
        b=gsg3ejivSyTLdtK2LZzOiX4TodC/JqnFJyPLqdVQY34L03IF+PP3tZRZq7WmuI2b2I
         LTJU7jZ7HANyXrlIdNuqS2rwNx6ft5v9eA2X1csioEiDJo/rnSCT/dh7kWcj3o25lYCl
         mn7YvEqPsV5D+8MxZubYUglTqpwCZBMSkqmJc49jnmxOuwh8pSQmMNW+fSE7zW11VxmT
         7lS2RkqKzgt+amJu1VUbxjPmLXpdrVyZlAJNLnhltbjrNDi0XMR9ApbSxAzXgJXx5I7N
         8cHNoSMTrjI42t/7xfNqarEMvRt5XmxgAGg+R5UfjXohmEKo6r8k/rapktZy4LHCbEqK
         KZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442351; x=1794047151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xC1Pndi3QD2rxB4U2UtHXjrmrtX3tvt+J7O1Ci09mUk=;
        b=Aw7SQXrrc+12cezO88eJ22rPy0zQOtkhYC12Fz5jmyWJnWm6t7/+85BVC75T6aA/IY
         cE3BLDBrGaGUofkYc4IM42TIEyKbi+3TXOb6+NMj8NVkYM8Iice/A1AUzHySVVZm0ac3
         P4Xo/RtJXrrxZKqHZ6joOB2BXMM8/CMvThdiI+FFUb2M9Pv7xjjFne4G6Y+hYCpjh76a
         87wMHyRxeiQ4ExKDnjYXBlpB8+kvqI73MFZ0D9/Ad+M/3eHJBShjaO9ILEidKZ8rf8rL
         tEyCKhNF4jVoQwCpIqJAgZp9RqRHFLbcAriKVe+rRkFnTuFiVNiSDSHwHgcNulkd7x+N
         ODEg==
X-Forwarded-Encrypted: i=1; AKwUvBzOH+cSTttmQAN1bfBnx5XErY82R+0AAMUeYEl6vCADjKM3zB1LumZYmpzOw2wGaSifTEpb2IBXJulW51A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqF7DxdfLXRMTZLjNa9h5gVbTDmHRDzWzQO27PBsfnZycMWbct
	0mgFaIXMXEWiyWkh4AZdbcDX6m5UVJtDakM1zLjgwJG4/79hUpVSJbrg
X-Gm-Gg: AYBFou26V7W0kyVySvdVSzGohysqPm6VeqiK+qreRHa0iF1XfN7jw4/1OkUuT5zhqs5
	OP1tllBnwdh7r3fzaqAacs273/ZR9c11jYNP8fFsmLnF9VvcR2ywgsjHVwxHNbKszFOSCmemMGH
	bdXPELr3pqdjKR62tAOO9p87rn3jW6sYAdbI/2jaJVEPBSDSGsxaLG6K8zXlsKGsLhT6EZLCvLO
	wQUcb4uPiBysdZ7fD6KLeOiMP85nev9SqDWAk4ynEj7VvBcVLbsgpO+hNKfeCCTL1YGfzm1QEO1
	8S+47OnhqWHjpyYn7zZ6hcJ2SW/7YArKfxCZZzxquLmuSCpsoyn8DQsJZVMNyO+p3r5LjY6+cDS
	juC+1w8+LrOaB8viv4sfDTjuJxb2i8Qo79OhV19Xx+w2NXxZBqedn8+erTy+IHklilhacX+1/BG
	2UwTs2GuVns4E3n7vyuHzz7+f4QRAnLLU7t0gCODWDHzDnCx7GNqwFejKF4iHJrNlMxvyCFognx
	FGU+bu9RtZ29NY9BUYT8YOAk5aVvjOu2MUoDBGwJ1hxcMXkOPGYVqSWtcaJXaUAZ0FqnA9+vAZh
	TvpAYRhIzXbgy9j+uvEVOyZ5+KJ9Kj9RdewsFphJCOWRCYj7nuBZF6XSJdGqJUKFGa1W6+uqnIX
	JwZQaCFHx+50WzXafXCge98v03LrNufj3P9wPBAXVV3qqmDLS9bxTlkvkT2AariPqB9ayeluDPB
	DPWhDSndORlTMVi/drvNk2OPJhHt7IJ4uX/g6NsGYopohDsoMrmMZdo9hIwg==
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr111384845e9.3.1793442351329;
        Sat, 31 Oct 2026 03:25:51 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-994c-f615-42f0-2afb.rev.sfr.net. [2a02:8434:fda5:4201:994c:f615:42f0:2afb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm195363135e9.1.2026.10.31.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:25:50 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] tools/bootconfig: Export replayable event trigger counts
Date: Sat, 31 Oct 2026 11:25:32 +0100
Message-ID: <94b1ba8f2b3ee827211f1cfc33a1521303f2e118.1793442331.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793442331.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com> <cover.1793442331.git.edumucelli@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tracefs displays generic event trigger counts as :unlimited or :count=N.
ftrace2bconf.sh copies these annotations into the exported action, but
the trigger input syntax requires an omitted count or :N. Replaying an
exported traceoff or enable_event action therefore fails.

Remove :unlimited and convert :count=N to :N in the command token before
emitting the action. Keep the filter text unchanged and leave histogram
commands alone, where count can be a variable name.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested traceoff with an unlimited count, traceoff:7 with a filter,
and enable_event with a finite count and filter in a temporary tracefs
instance on my Ubuntu machine, running kernel 7.0.0-38-generic, with
recording disabled.

The original exported count annotations were rejected during replay.
With the fix, the triggers and their filters were restored correctly.
A histogram defining a variable named count also worked unchanged.

 tools/bootconfig/scripts/ftrace2bconf.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 8f3edea79ca0..9100ebcd5af6 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -118,6 +118,15 @@ per_event_options() { # event-dir
 	grep -v "^#" $evdir/trigger |
 		sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
 		while IFS= read -r action; do
+		action_cmd=${action%% *}
+		action_rest=${action#"$action_cmd"}
+		case "$action_cmd" in
+		hist:*) ;;
+		*:unlimited)
+			action="${action_cmd%:unlimited}$action_rest";;
+		*:count=*)
+			action="${action_cmd%:count=*}:${action_cmd##*:count=}$action_rest";;
+		esac
 		emit_kv $PREFIX.event.$group.$event.actions += "'$action'"
 	done
 
-- 
2.53.0

