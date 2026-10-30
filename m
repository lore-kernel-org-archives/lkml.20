Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364734;
	b=z1kXXqRmMZSDOPMX8GS/Pgxe8HrejRD+4QFQzSPrrGUyaab1xSCXyb+n2DxojiPhTW3L
	 sIpw/F3yd3beKs06InasZLowhjPBRf8Oju219yCcAz5Kjx9EqNDuPSYZIrEAm/XJbaWRB
	 YB/0FTqxAd3UwEH8NeRd+RLyX+vmXFfnC7Fw1sMsaywUZnh5pP3PC7AkybFc/NivfpklI
	 Q87R80nOAM+ygOx15SQl//mFaopO17aOtUzxkM/KXThuW6aXp3GKO2zzb4SUXjeXH46qA
	 R4oARtz6IwmFTlEX2EYpC4nMyelur7OjMe3dubY7xA1yK8M1Ii3GvllpkUC4+HtvoXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VbBUQQO60+lX0qK2/yrAcJOlkwAqal8iWmnpemgTYFo=;
	b=wUwOavsjzXEtmckNsX1YTvYT+WkHNarYVSKwBjJ87xRYNj79HJYEd8ZmqTokkPhp3HzH
	 1XUOAVOyWwfj1y97TbKiEuEE3r3kDMAbkgZY/c+Bg9+H49bjH6Rud6dCt607Qa4sXnQeW
	 lr+8enebW9DcUmEZEmghi+j3Jes+v0LrGSsRkAv8n8g5x3apsMiK3Bs78VeMlztLOlNPl
	 NUSC7DBFEoyEn3lZFR82SoZf8uqVW6Xqi4xcjkGb63/PQUmQbli1OSRqvYp2vi3jxKyL4
	 rcMxZDKhYUAOcTi8xesUol8qLAvUaICJZvFVr/jdnJJUHek+AdJjChhgFwV8H6bO4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UDKL/EjZ";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56947606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56947606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UDKL/EjZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3997795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364733; x=1793969533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbBUQQO60+lX0qK2/yrAcJOlkwAqal8iWmnpemgTYFo=;
        b=UDKL/EjZyYAU9JX5/9jPpxyrvgVm05whzeD8qV9OjjgvxwLwhYTdQxzVZGVJvU6zZL
         nDLrWcrJH8wMzcVcPBRmLZ48VT4HflvDy2VX8gMPojiViBWXFJByvOK/mQB3kz9ZqdS7
         ariLa3ra1XOa5xaw+0hM7z3YW6qEzxel1a6gRuoO4KtfDVP32SQCJrIdZP7zep5h60GP
         1Mhl7q9Qul5GWji37VnVd+hf+HdJRsgJfoy2KbergVp/X2xpLgjCUhxJZ61UvJtdb9ct
         PjVBKtyNOsR+DiVEX4WiUI7+OElXrmFPYHrpgtnia9CqjTeRwo37XFJAG408C6279WkD
         7BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364733; x=1793969533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbBUQQO60+lX0qK2/yrAcJOlkwAqal8iWmnpemgTYFo=;
        b=j4T7qSD2dtwDy1cA2QKu/qOX7yyYNru3H8zWHU4Pr7189XPQfQAfPg/QDvQb/OUPy5
         z6xuBShizv+yu/xTBPunMdFO8Bh2IegYNfgxlgHZLGZtP9zwwyOOUDneh3ldhxqnWHRr
         cY9sljWzGMxo+3vR+BSVN5IRI561lH6+489Gbs7Msxw/LMZ85YIilu62DFPUYSm972z9
         Vl8Z+JHPrMzYKO7IJH4gmpFWeJjvH1pyHellARHKUlmZTq6qDrXfEdFAusFQcDnlB36u
         ymzKZ8JkH6rlhYPGdVXLzMNN2R9R0kPEeUw8paQ+engMRvhJEDjLykcqUDO5sUNDXNuo
         38dA==
X-Forwarded-Encrypted: i=1; AKwUvByVFECzQa+Khp6RjequAFikjMG5CJV1uPdQ4MX6b9Ae2vucrz9jjGXJBkaf28ahFpEOmP+mGZA5a2KnOjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHNo01Ipw0v81z8PEpzslwjsbfGCIcPMTHWyqTRO3E8jlO3eZM
	JyIn9HtQmiUsFY0gd817oYftLHNO0cgrNAUM+S0Zw91aLpfzL5ZXSDVt27sC72K+oWoi8g==
X-Gm-Gg: AYBFou2tjA/Y8usVZ39g0+ZNqWMsdebBnbwL4V4AMHS7blVTPgpSrEzgO8Rii2anItR
	eHLzqhRJl98B/w2oQgQK37vUTmBN8CHzYu1tEFDi+H5Y4RSVhMI3oalW0UCt6q8AVyDj6rE7x2e
	k2S4romIw+9rY2zlFWr9cw9hb0SmSMrWiAWXe7lNFnjNgxM+3CaLXOk+7RYN30XVdTGUixT3amn
	8nl75upMfxa/G/pMDqmRZljOJTL/ImhouDnBKpE/8K76ngMybhJNC7T8DWi9oN3OTBOiL4cQ+gX
	8oT+HGg398qHrGVU0opm0941vv5PCsszIPA8HUm2SVj6QoDnpQ5CPXkUK2se3NJjMdgSyKwSsW4
	Nvpk0JAO4LYm2sx7lAx+geGJkKR4eaYboGuqP7d/RqGqCefSr9NF5CnCqA7anrgdHtJtciCPtou
	LdGniYcElmUqiQDJd0Ah1eZeYcVP8F8la7HkBbocPJX4Q55NpYqNM0uiK8CYpzi7TQShMmzwPZL
	nMHpibSVw2qOy9sXNfLAA+rqADOIoogxatxtERg0Jht1ZdweHCGgx3vadB8cuunjVONwL9W9I88
	ZQrCRM3bZ1DQr/b/bKJCVXcJvjQxQKxxQ5o+EC1vNfgSKUIjwntodkvEACq0hkruxhOQViQVXCy
	4vR1WnIUIiQ4BkmCOM6OEH9JMvtcy+iDsZL5eKB50xfMV3baB+FVZr8MLWeDeDmoo4UuQKxRFZQ
	uQjj1zROhdmR8v1WE2JLc0bUHngzagRiqiCq5IaguPsMjRxhx0NOrogEkLbdmIUFL652HalQchR
	5eKYTA=
X-Received: by 2002:adf:e901:0:b0:48e:641b:477a with SMTP id ffacd0b85a97d-48e6e4fdbccmr3929352f8f.52.1793364732599;
        Fri, 30 Oct 2026 05:52:12 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-a479-65ed-4521-39bf.rev.sfr.net. [2a02:8434:fda5:4201:a479:65ed:4521:39bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm3170047f8f.12.2026.10.30.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:52:12 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] tools/bootconfig: Export replayable event trigger counts
Date: Fri, 30 Oct 2026 13:51:49 +0100
Message-ID: <e0659901d096a29364f7dd23352263c37f2ca77f.1793364709.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793364709.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com>
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
index 8c5889d0420c..82c4fe021fb7 100755
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

