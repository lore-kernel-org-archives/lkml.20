Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792949749;
	b=4TLu53ytjPobS1mEbT5j15vBEQler9ilD4ts88ldZZ3ClEW0CvXPIb4w2/oIufrmveAD
	 cmln5S+HaIhmM9GQUTLs5KYOigf3y4O/N8OwMSYtwlEPS+CCfeCdwN/m9b+KQe5hDAJVz
	 5/qhHa2RB9GOsPZ2ixsMTbZNHkyt0C+uyZxLiXhjnHygeyMYUVej5hiiUzK+gMVfJSO48
	 yJLKV8xNbJ4VAsD+RnhI4VYxtJsS+L75pmKhXyGci8ASIAYMWTFkQJrxirFFy6e7Yu5Ev
	 ZZqpKBbyUygObvWzeOEgFBHEhvaQ024sg6Uimvd9aDrKNt0VaFCLOFmRrdXWN5otGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tmiklj6vnw6zb7NyBqdQOEonm6Y3lQH7Jog2rapTKMU=;
	b=ejZvw2UcVr1Ou0bEHs6NmDUuhqF6mA7ywdnRNOJGt94vaD18UUkgFCsw7PvGYvO/ylsU
	 M/Er+H0zNsQNgXTG5SjHVFoObiZdcckXdHf4v+A+vG759Fm/YpLLZ+MM802VJ7/Gs81te
	 nH9jMYS9olu4rkXer770l1par355U2JUJ9J/hpHrPf5Y3znasQI00twidw2IXaIft05Hj
	 rbAM7V/OEr590yr5t98TD4OZLDUZ06JrHgdsSz/KuZTrQDb7YqvSMqOqdubu7wi3NGNgP
	 fF/wZHXKs5h6nGr08Ll1VAplNawQfTHL2VR8ObaJ3j/xu2W6rCSgHBh/wB7mbFl6pCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OyWkbT7P;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D664606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D664606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OyWkbT7P
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so12914915e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949747; x=1793554547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmiklj6vnw6zb7NyBqdQOEonm6Y3lQH7Jog2rapTKMU=;
        b=OyWkbT7PmFHun3lf9RCxXN7/zsJ+yJK79+pQyEtQyq9pU1UFfcCT0i+1hYrQTA353E
         UG1SRGf4Iubk0VbmBF/lEXpuY3aPZHn6w1MgigM2JOA4F8CEIOjt3lnNdV4WJciGuyuC
         Yk+u9pJXJMSwFGQlx45dtU3Wj53XW6TkxcSfM7WLhLNTxJD9+YXbp33Z24E7vPy3AePF
         IWwdKnZauI48J8NRgMgXsDf+vTN0GvABv/sY4vidpmoTVflyro0u2ApALbQYLvtvBLzg
         cvZppyqmsnJpJrBbh6DmUTeHexMtVBi7nQQ4SwPkg1iQAJ6oGcH897RK1oho7g+6bwhX
         L47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949747; x=1793554547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tmiklj6vnw6zb7NyBqdQOEonm6Y3lQH7Jog2rapTKMU=;
        b=jOFZBBnLtfMDuX7YKoUPOKZqZStSRqJiZzyeNl0kCioLH50jSEJKFhr1l77n6NpKmE
         3nLzmHn33GkwswaR+LH4SU6RusUHqNFIZtEia9+D+nde5ntkAxAWuPir/Z1ZLNozysRk
         rFuGS3iFBDYiIB1w51M5u/zpMBz2aYrhD7AAuEdoznVC19CMwTcxexh85xQFThFRi2DK
         sATfqCI7wsIO7NVyeJcYTxlCbvub54tY8K1I+PsgXuCRpEJVJAz3Q5WbteIC+fg7oht3
         v2zqcVoXkpHbAMOU82zR2vAWqhMDl4PO3+YeSM35+ATQXK4349Tj2DwY9tBWYrCtuspK
         DyFg==
X-Forwarded-Encrypted: i=1; AKwUvBzQmSscxTDYzgQND2NuI82f2uyzD86G6/gfZ1/Ze0rWLe6Tnv0kHmT581ZvCNazvSbIwrfWV5Qh9iygOCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq076mtvFrKYgGJa9psMyZkwksE+7OnY9rqJDg55ppj+lGe0TS
	sQzJXyBlAC5SxnS+1w99o6kF52Y5Grtb0kIViYosgsGT1H6W6BEDssDK
X-Gm-Gg: AYBFou3108QEWqa1mqfVXSzda95BQLY5tfoKyvAszO6/fb/SyqEWwVXZExVtQfqL7JS
	twlrFGRW4l/HNOvWb+/jUoEGi/XyvE+sLhpZAceVsit5T3mKeUvc86xYvDv1yLPQeINcd1IRben
	5Hy1YtUkNGG200jXfH8rahpzaDvRjxJ5Hprcb+/ZB9OR6qJSDmRsTWh6jQ+9y9heGjT6gV9duTT
	Pkq6wzgwKmQNOFzcHVkQm/DR9TaRNBWGt9aX1t07mihiuk3N8Ewc9v7y7L5jw8npLGNaraAxLOI
	Aj7V1LHU8pewl6IH7XLAccQtCVlTZM4hLIkWJBAIUDxAL+t49LWXZGY2hrMeFJrvCpR9fQ/Nray
	fFqPs5qoEAc24SH8SPmfUypoApibutx5kysqxBc2ZA+ZcnfWFHCTVNkuWgnLaaxHMfqG7ydDk7/
	38/lS7GtQgjFLuEnn/Oa75OwrQTHGhkG5HS4KIyg8/jIBtYDkppgoy/ZyFgKMcy8PdEqfmoyabU
	BCHoht+Hb9sjkgHpS2wesBrTA3o10R95Xi2YwoQvsnA38ge+JeHVhHTjsEYt+1WtJtBLyPGrJCG
	doQBHr/IMgVWvT6R+KuBG2MJyg0uvwnHJYYlcvJtGl68LIcgkhKfir9XBo+YnU+uXuYgbX6zHmD
	8BuE8eXPHrn7p/nWNA+u5PoVcMQHOFimN+pg8HdD+1bQBgrczBEc296lPL1vJadNqSEhDBCuQO9
	eENgBiXceC
X-Received: by 2002:a05:600c:8b78:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4a5dc5d2382mr23377865e9.14.1792949747369;
        Sun, 25 Oct 2026 10:35:47 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-ce3d-9b69-45b1-5da5.rev.sfr.net. [2a02:8434:fda5:4201:ce3d:9b69:45b1:5da5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm10234070f8f.22.2026.10.25.10.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:35:47 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] tools/bootconfig: Preserve event trigger filters in ftrace2bconf.sh
Date: Sun, 25 Oct 2026 18:35:23 +0100
Message-ID: <db9a1e4c2e86e19a4446ec81c1684ffdac02c265.1792949723.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792949723.git.edumucelli@gmail.com>
References: <undine-1792936915899334889-d965251e73c20670@undined.local> <cover.1792949723.git.edumucelli@gmail.com>
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

ftrace2bconf.sh reads each trigger line into "action active", keeping
only its first whitespace-separated word. For example, a histogram with
"if common_pid > 0" is exported without its filter. Reapplying that
configuration installs an unconditional histogram instead.

Read the whole trigger line and remove only the trailing histogram state
marker. Quote the resulting action so that whitespace in a filter is
preserved in the exported configuration.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested this in a temporary tracefs instance on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled. I installed
histograms with "if common_pid > 0" and 'if comm == "a b"', exported
them, then restored that instance's actions with bconf2ftrace.sh --apply.
The original exporter lost both filters. With this patch, both were
restored correctly. An unfiltered histogram worked in both cases.

 tools/bootconfig/scripts/ftrace2bconf.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index f8f288f90c74..032ac5b10a4a 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -115,8 +115,10 @@ per_event_options() { # event-dir
 		done
 		DEFINED_VARS="$DEFINED_VARS "`defined_vars $evdir`
 	fi
-	grep -v "^#" $evdir/trigger | while read action active; do
-		emit_kv $PREFIX.event.$group.$event.actions += \'$action\'
+	grep -v "^#" $evdir/trigger |
+		sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
+		while IFS= read -r action; do
+		emit_kv $PREFIX.event.$group.$event.actions += "'$action'"
 	done
 
 	if [ $GROUP_ENABLED -eq 0 ] && event_is_enabled $evdir/enable; then
-- 
2.53.0

