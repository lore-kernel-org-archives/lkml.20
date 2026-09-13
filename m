Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FBD33D6FA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331502; cv=none; b=lW1NMakmR855evk8pLfNXHwcGOePRp81vQmk+rE1XcDVfCCdgFwRn1fibSZ1cCOZoxj3/KHK61GyMeV6V4MhtgTpzopj5Z8d2JsaTmYSM/7PII8InJCqb/77DwlFPMZAfUJzqIhI7mIq3xbvJyJPvbFLBSywk/AaVKeuPYXGxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331502; c=relaxed/simple;
	bh=TCDyOJseK6qPBPCx1hp8gZvbnaru+qTNFkWXDDYtmTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzQJwRA5gWld3JsOcEDL9P0LEkzGFLvGEc5c1anOKSS71cLlaiEQhMP49MjpgBN+WfYv40ebnDSpXYb2MkgtzJptAiumk39uO3nFiF+N83MLMu9gXZMwulEVIkn5Aze9ai+TPgse88spXTpfAdza8piX1j1KM4fBSbKSrROooAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/dJ0OMY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/dJ0OMY"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so964383a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331500; x=1789936300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhR7p+wss/jt6zjE9pDS80Sv1ZxId2hdmHkP0DmuGW4=;
        b=F/dJ0OMYCv/BbXBbfgVtRuW1ei2HjYvfeE7x/S34wTEkXQQ50aC3qr8a37jZynAIPr
         5zRbvMyuyVbeZqDEsPHjlSKKhbexhz/F+l5ifP+zmRQ2Nn1xqj/POIf+2eX/D/3EB3Jh
         AhEUZLFlg8aad+b4Z5Gti7DEwJOpQp4ImOvcWv04Tnxw84qvCnP0aILHsAuoNj/lGelG
         3I4G2sn9eMK3dWJAy/wd01wFXWACdOOpGebNyPgOte8tpw7wigIa094sdOKgAfGuie47
         6aSqd1CAeiY3W2my5XKYvRw6lp+XQLFaZ4aXMkP8Kqhf5nYDStXsaXd9kkDzQQeiUUN9
         RN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331500; x=1789936300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhR7p+wss/jt6zjE9pDS80Sv1ZxId2hdmHkP0DmuGW4=;
        b=bpDdxlHYks6iLa12zOF5MulOlogSojAvKxSMvYpuPkat/u1tM7BEdGPCiEV0nQaDM4
         Can8csV2dEa8NOEb7+nKGJA/OJtQW7hfqxPYhM47jCO4q8XUF/4IzDNAGue0G1QF1y/8
         8drD2n0VvKDE4JShTEo9IZg/AikN2tpl17dTmGPjczNClwX7RQET9fG2wiLXnU5/Qxac
         p2MRK9+xc+w0cNqzdRjrgw13Mens8kGhBdzDxdWdzT+cYRVXxMgtOmcypubvBRvD9j/S
         HOi4ykiVmtnszinmrrRriFJ9g33AmwkHQBv3rCZvcMq+IDla4nVAM7/0r6nHXx1xUfd9
         h8YQ==
X-Forwarded-Encrypted: i=1; AKwUvByTkRpxO64yHPdUyMJtRHGYbdYPWnjircAdLrfx9+Ni+3J/wLEoFd3hvhZGjQx00Hry3+5V64TUWdx/DE0=@vger.kernel.org
X-Gm-Message-State: AFuF++kuWE4Q2wXM1Vl/GtzTc5biboUUqxW04XZVQCXT+Lb0lcPDgITD
	2sz1mkOslPfcsOj+D1uG8yaVZA/eqX1sd8qTge4IFAFzHuQ3BtwkuKY=
X-Gm-Gg: AYBFou0srBoVxgW3o8xMbhRZ0qFITejXWMrlbHtkO9NvFZMvNwEDiT8YQh773Fsmk6g
	a+E7n1vcgxiLbO5E0zjjXpOccrhCFbj2fK1Q0qIMf1qTlMzNmjvD36lfano5ZpuXP/zeg87BahO
	PJY75Kr5SSuM+v+QrgGZ8nR11D62BxJY+b5qMfglWIKzA1+wtWwZ0FZCvz6SCUNLTgCdw6sRTfU
	mbyiM+VMIfL2vYKAUyHYUwpCFaQahrSMQDpWVkeaFveISbs8JkQyyMQfm+KD+IKK+Vax1RuHyvB
	pF4+J0OySJ4vpked0He/LREp/KLnv6gG8y/F1ixb6jVMXqebU2UIR9Yto4Wd1KrYkpqk2ZPaW0v
	DgnFO4RmFqUkqRKHoYnebihw0hbBpbjboQcuh42duQGPOSdfis6torcrRLlgVx3KAIFZ9U/l2Xx
	XX0b1vv12qzJyb2EssHqZ8YcKvbjmvpkLXLDqzE3PZc3aT/WENhv3cMxMZD8MWZfA36+Hbxq6WU
	GcIf9L/3UT/JqtGYToR/yEhsQ==
X-Received: by 2002:a17:90b:2246:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dbc6f8b29mr15621791a91.22.1789331500331;
        Sun, 13 Sep 2026 13:31:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm17530220a91.0.2026.09.13.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:31:39 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] tracing: Add the bucket size to expr_field_str()
Date: Mon, 14 Sep 2026 05:31:28 +0900
Message-ID: <20260913203129.941270-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913203129.941270-1-donggeunyoo.kernel@gmail.com>
References: <20260913203129.941270-1-donggeunyoo.kernel@gmail.com>
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
index 963e0d6b61fd..9d7ce01fda36 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1755,6 +1755,9 @@ static bool expr_field_str(struct hist_field *field, struct seq_buf *s)
 			seq_buf_printf(s, ".%s", flags_str);
 	}
 
+	if (field->buckets)
+		seq_buf_printf(s, "=%ld", field->buckets);
+
 	return !seq_buf_has_overflowed(s);
 }
 
-- 
2.53.0

