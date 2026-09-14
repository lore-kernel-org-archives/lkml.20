Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB58360EFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364099; cv=none; b=Xywt52qYNeMEP79OGm5nC+RFiSP18OABQJrgO/h1CfaMRwNgO8ieCjwVSYbe75yv5IRGC6nnNXfper+55mAIzoJCgw3q2MUULGsDPuLhCTJ4gXexF0eWcUW4gUELoMX2A1W8H10PfOSS5KEjS8kqKGXc5YNdFkRFBBEopQCudyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364099; c=relaxed/simple;
	bh=pIQ9c55KC9C1IN19GUQ06sY5K4ji/wCShUGP3NMJw+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cd0W4mdizceyB7D6tRA7sXi2+s4/+dXcDX9kYifvhfPyQrS2yz5hI0O2yW8/qWPTlLEdwHVPbPJImZbYzJlww1WTIHSSMyibrmxzaorW/VG7s36+5zomM8kGM9QmWek7ic/Odtp2wisuGbQ+Exti+P2113o6++XtqO5+FnUbQw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie/uE1ve; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie/uE1ve"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2524500a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364097; x=1789968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWnHbjEBAwTuvLezoZnDfrNJHbYbnfIfEVdIgnju5lQ=;
        b=ie/uE1veeYdis4FZ810xJI8UPBOZlbilTNxbFvR4OGJtdsQjvs/e4Ua6MHYObh2JtO
         55ui48oSZXwzWmorkQZIFFu8RyUhZUAwQvKUDM4hmeBaLVaZHAMDMSiEMa89SAAPDQ4s
         +4dIgpegGmJVC/YadhW/X6M8YMaWscxCOui+up2Cs2hx6cHw007973LK8Es9L/XiEhNn
         7ir+r3bflWZrr666QrVPpK0zrsmPeW0VGqzzdeTNxaErz9SVvikZmP3wUGFTh/nD5PiW
         uf9JYZDNkjuOxKbScASVwOI6M9SlSGeioDS54H4Yx+D36Mz9RZp2DwHkWPYY6kf/30AE
         iHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364097; x=1789968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tWnHbjEBAwTuvLezoZnDfrNJHbYbnfIfEVdIgnju5lQ=;
        b=nja3xuE4le34L3o3Sp0G3bomPLSOdtDBaFlKJELyhILYqOUqia8U68J+7Sd9YVD4zH
         X6WG2gMqcN2A825js/zexSyXeMd8jq/x+O4q8t7FGNu5wPLIya6ispydlp3FSYbWkvr+
         bMnnUtIcnpdoMFJkKyXUFqSPhVNA0drwOwZs1tzE6G+ymKeJEXHeZ+vVCE4iL1GR0Lrd
         Gh1zXZ7itbnN5HXmWfMevR/vL70Uy3iwCX4j5rat2ocIo2eTmq8pryLLD/K8OLdmXHGi
         X1WgxheGGBYhSQPiMGvwEM7IE5N3ym3moIRrPatKlah/iehrFmRH/dF4ubiQuIWXa52d
         /Ong==
X-Forwarded-Encrypted: i=1; AKwUvBwP+uUALRP9xJnJlhg8J4tkTqPYK9gR87CO+HVXkf2S43OWp7Hob3UlmDE+iM6JkYceh/I1tWTytxjUHIg=@vger.kernel.org
X-Gm-Message-State: AFuF++krYRyItmP+hoFTdSgYgDZ7hH7gpz5AXuJYfFZmRoZ3GrzDpGrq
	CrT/JIayjOGM5vgp89w8PiSwR7hizFqZOoz2LTtw1m3B/JRk3QTRwac=
X-Gm-Gg: AYBFou0YF+at8MoVWet1voZuoP4xBLG8ZsmZT19bKX8VypUHqhzudXYv0zAClV9wNrp
	iGtHB1cR9tuXqyb9XUHbRayMkSbcOMmPs9QzcF4Ij9kM0INZTG1rz/DsF5ND6QwIs/XL29ULm8N
	qT7sbOoRdgZX3r6VEKLmIkIcQpKWW8r0dHMuXo5gp/TXd97zePjzkctDoP6ux9GObJO5X9srEqZ
	onW0vkkT16rved8pGjQ+ehqF/jZ7XXjyuET3X7a05NO3/RFSj54d3p/F+w2OtPps4xuwtB28GC6
	J6WaTgAQrUyKmtyd6LKNdkOgT/H39fW3U0p4Yvi5u/4Y+iFeA9DrS8bJ3aAD2d1DKphmodlYoUh
	yLqcWbIwTA83SoT5/qVT5IdETt+nlbxMzwr7O6mUg4ktRSBtusLUXs1UEun52pzRXhsBVsVAlDK
	HHiGEKpjSBkDC+iwRQXyNPZ6zlYCRADQ3RK93RR8deEXG8YxyVnxeidFIYqR8cyfEIHjrlYuemR
	d+Gq10/E/iBKbYLQYCFPCcsnzZXz0YosG779g==
X-Received: by 2002:a17:90b:2b83:b0:39d:ee20:1e38 with SMTP id 98e67ed59e1d1-39dee202423mr1419155a91.20.1789364097151;
        Sun, 13 Sep 2026 22:34:57 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm19009261a91.8.2026.09.13.22.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 22:34:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/4] tracing: Add the bucket size to expr_field_str()
Date: Mon, 14 Sep 2026 14:34:41 +0900
Message-ID: <20260914053443.981201-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914053443.981201-1-donggeunyoo.kernel@gmail.com>
References: <20260914053443.981201-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

expr_field_str() renders a HIST_FIELD_FL_BUCKET field as "pid.buckets",
dropping the count, and parse_field() rejects that spelling.

get_hist_field_flags() returns the bare string "buckets" and keeps the
count in hist_field->buckets. hist_field_print() appends it,
expr_field_str() never did. Nothing reaches it today, since .buckets is
refused on a value and no expression can carry one, but the next patch
renders histogram keys with expr_field_str(), where a .buckets key is
legal.

Append the count, as hist_field_print() does.

Cc: stable@vger.kernel.org
Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 kernel/trace/trace_events_hist.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index a3eae5c1344a..91a550411e8a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1754,6 +1754,9 @@ static bool expr_field_str(struct hist_field *field, struct seq_buf *s)
 			seq_buf_printf(s, ".%s", flags_str);
 	}
 
+	if (field->buckets)
+		seq_buf_printf(s, "=%lu", field->buckets);
+
 	return !seq_buf_has_overflowed(s);
 }
 
-- 
2.53.0

