Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583946F482
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785081; cv=none; b=uIQoRWAlm6lH+J1I32sEaCTGYPuJiy4tzpeT9OZzrDQYEoR1+NX26FGs1difpnHaTlmLzZn/zuDdnHLDUZ3qPENtYnBEimrU7SZy0ZfN7y6Gg3bPBy4jAmRakQLPXvowmceXfCF/J/ba7BctThSYqoPPe4/FNe3wKmT3cAr9BuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785081; c=relaxed/simple;
	bh=zgY4aTxi1TSbAi0m3aIthn2mGxEvPTI/AYXmeFn2+r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PcbjakY7vt81G349i2DeUr6nGmlx4U7WV04Sn31z6se6WJRhT4J9fw5YfurZpbeTATrxhbNuo0rMMJb7rUy1Ph6VnRr3rekJeO5N5iSfavg0butJ7xa+BqlcqS+woDJIHVlrM3ay1fRys0ETxpjPU3gR99MoTVAt3q2KLzHPFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii0FD+3Z; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii0FD+3Z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d53197d8b5so30027265ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785070; x=1789389870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/B51kmcLLW7jzdraAVB1DVt4vcDdgF3rCTF3GOFyjc=;
        b=ii0FD+3ZjnRVrt8lMVE0HdMz3hyMJoY8HyvvPDrGXOk6dHu6X+UFRvMF0ZZKCHUscR
         eLJYgBE+iWNyWcrJ5/mZIuE8mIAqzreF2MbUmEUtz/1CYkOnU/PxWdSZ6ddjktPXDGh7
         mvCpZjpDzNhzvQW63Xe4Vmuq1SW/gnDmAfH/F61qnpBbmIKrsnrBC6GZUVtInd5DXIE5
         cxObjeVKlGcldr3TzbNR8pkjDE0CJAFJvF7vL1snKyIdMoTTN4cOHpOIqmhjHOwET0y+
         JE7xZjNIkDlcRhSgKeIZuLk/kj6VzNDi2FTsLfa1ofY9SCghWcfSxNVyzuIy3Amt4ULh
         kHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785070; x=1789389870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/B51kmcLLW7jzdraAVB1DVt4vcDdgF3rCTF3GOFyjc=;
        b=tP5eC5t5pwUbaJXuWpVtCda7/3VaN4Fl4FMAAdXDHBAUo2Gw4myZkZZY9rzUWUK1dE
         ZAIKETFHBURdCe1YIyWGgd4owMbsqGFb315LgEL6QLYfzTWVwJJ63OiIXeUCi8YiDXhr
         3IQX1tgSa0aPVqopSBYNb5vb3260yAMxDUHqplVdAk8/fKFOFQ7UTTARrz/fyXuYRE63
         ef3JDWEODXOe4Mz+fg1FTDDTv0y9jSlwt4RF/gDoQfohLPTCwyPkIW4Skv8L8LPX8crC
         yhwbt0/u2r4XCZQ9K21/kZEupcJrcgQV8pbyyxahjZwNbtuUmCYKyR7lhX51OjDA8yn2
         2OCg==
X-Forwarded-Encrypted: i=1; AKwUvByS+nTYNemnz+Lt3WA9qVY2In9WI1UBrWjGaw9n19WmgRLC1AjVMfyUleTDqEn0IbRu+KXEe7d3FZZtOW4=@vger.kernel.org
X-Gm-Message-State: AFuF++mfOuu4JDnLq1UA9Pa5SS4Vaw333M4DoncQ579bZ9/TEeEg8xi0
	U3s+ayPPzG1kUlBk7kSF08mees3nAusvUT83LLGDVPjYvkSEpScItnQ=
X-Gm-Gg: AYBFou394Vv/pVYvIwHgeV7N4a6sXA3+Zi/Y0CQYs/FhaBlrLwn9XAkB2uKvx67O9k6
	oUnKwfcEzljSQlLJ7/VPwb19bJLGnxAspqgoQg85sY4F6ylHiHKPoDQiECeMZzpPLoqAVsvxczH
	dDNeBfHbvWCvw6CJsxqoTT28QhQVfRuAQIlOQ5ZtAK7YCpHyQx6EpcGqFsFFtCSVmBMuATxvdL5
	k6q7vAArWDtc+H1HAqpiPOWyn6ayqBCqtLkiNcw4/swUZvoXWlMN/nlXoCdxctUIikJTyoaWONG
	UIGxQal9G515HiDaDxWTehjykpWlq1xMmAQvfRITG9fTZzhG8fTxr+YAzcJ2Mz7UALHde8WGxT4
	5o8Bi6bRAwcQ6j/6+oDeYsk930usrKcC4sa/hGitAo1cq9RAEV9qc+mch0C4pi2Wx8YSyyuv4hO
	w00pTHuCbNJbKJi93VJRvUd3FOz6wpI9OTxywgBHUrUveKBjbguGyk+UuZPo/aQks+i/PWz1gdq
	O2AAy+Is5riRAsK
X-Received: by 2002:a17:902:ba98:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2db1232e1c3mr219541025ad.4.1788785069568;
        Mon, 07 Sep 2026 05:44:29 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm45350955ad.63.2026.09.07.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:44:29 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH 1/2] tracing: hist: take the reference before publishing the named trigger
Date: Mon,  7 Sep 2026 21:44:19 +0900
Message-ID: <20260907124420.607097-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
References: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

event_hist_trigger_named_init() puts the trigger on the global
named_triggers list and only then takes the reference on the trigger it
shares its histogram with:

	data->ref++;

	save_named_trigger(data->named_data->name, data);

	ret = event_hist_trigger_init(data->named_data);
	if (ret < 0) {
		kfree(data->cmd_ops);
		data->cmd_ops = &trigger_hist_cmd;
	}

	return ret;

event_hist_trigger_init() fails when alloc_hist_pad() cannot allocate, and
nothing takes the trigger back off the list on the way out.
event_hist_trigger_parse() frees it, and the next lookup by name reads the
freed object:

 BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
 Read of size 8 at addr ffff888009346860 by task init/1
  find_named_trigger+0xac/0xc0
  hist_register_trigger+0xc1/0xa00
  event_hist_trigger_parse+0x3146/0x6af0
  event_trigger_write+0xce/0x160
 Freed by task 67:
  kfree+0x154/0x420
  trigger_kthread_fn+0xfd/0x160

Do the reference first and publish once it has succeeded, so that nothing
which can fail runs after the trigger becomes findable.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-trace-kernel/20260907092944.3950E1F00A3D@smtp.kernel.org/
Fixes: 7ab0fc61ce73 ("tracing: Move histogram trigger variables from stack to per CPU structure")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 kernel/trace/trace_events_hist.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 963e0d6b61fd..c6c04926bdf0 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6383,17 +6383,18 @@ static int event_hist_trigger_named_init(struct event_trigger_data *data)
 {
 	int ret;
 
-	data->ref++;
-
-	save_named_trigger(data->named_data->name, data);
-
 	ret = event_hist_trigger_init(data->named_data);
 	if (ret < 0) {
 		kfree(data->cmd_ops);
 		data->cmd_ops = &trigger_hist_cmd;
+		return ret;
 	}
 
-	return ret;
+	data->ref++;
+
+	save_named_trigger(data->named_data->name, data);
+
+	return 0;
 }
 
 static void event_hist_trigger_named_free(struct event_trigger_data *data)

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0

