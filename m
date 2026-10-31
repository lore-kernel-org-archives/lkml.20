Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471755;
	b=ZAX9Ft+AfF94oVTmLjU/FmhcVoXRYK9byvj/e8MqaUFF0gI4ysE+Uc87zqu2f4DFA9IJ
	 N2saIcuIJEMuZH4DEg9PEAQah+LCpt0Xub7nRkqKRa9d49wx3oSGVr6CsY+og8BwbjlDb
	 2QoqcXqq900hGCGRQfGb00RxFlpUrLS/1lA1xXKxNjkpUrCf93N6qMssebdVni66asHu7
	 9GEOfGtq9mqiu0FF+Du/8iOfxxg9UWetbqrFd4bbXn934LS22pk46dYmKDJUNM/j2vLEG
	 8BqzHr8WOGXuymygsJqpwhsGefw/zJFil2HZhxd2bYD22Nup7LTuKtTMRz0d7uUKMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yN+TG3cll45GlRcOY9f9N+pL2X7AI2IfUU7T9/nu2cA=;
	b=dZ1wTRzHXCKAYbJN8WGJ8EHAcrmd+8SDBbpo8v5/G8z4MPMFrXFSAI+klzjVWsvMC73/
	 /hfn03r0MWcCBYvOySG+MW0NFgZ9SbDjpYRVQM/bvqq82qQRenY39QfXj2JTrQESMTBMG
	 rzhj4Nwqwv+jH4Qb90LdayN26lo8Sg9HOLZHqTtZtj7tpuTUyM2DAZpq3IF157vOXu4B1
	 7SZ4LMy6ByhqYAWZoH3UI4j+q3JJ3ZQbJNTlNSgEdca9A16ryoruOZP/MdvG6l5s4bSiE
	 nrsZ7OmpSl987bZ4fxMtCrXNh3MQ9IvIH0Gf7fMPywqI9BN8/McPKVtxHo+y9+lt6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFXZPhc2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0684606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0684606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFXZPhc2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11286365e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471753; x=1794076553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN+TG3cll45GlRcOY9f9N+pL2X7AI2IfUU7T9/nu2cA=;
        b=tFXZPhc25wDITKGyVPKqC3DzYiaZ+oFIdXG++nD2y/LuWK/g275eSvM+aQ79akTaZD
         enjN3K5neTOIYTnJADUWlGNL0W6owwNMW7cXUSwFqNEcAdjaKv60zD0wkLZD4PFxBMFr
         AI+JIaIFkC7G2DPF5FywgNUclcAMPV0uDLRenxuni4WdWUdTnG1Xq6u+d1BdhAN1oX92
         TOtHZelzqBOTZ7aqhfIUkIAJX4sX4Ug1oPq+gL62IPCy1ZpmWVr1JylYueDR3d1sqT/v
         ccn/ntkzbwpxROl6AQtCrruY3t6I5snTGU7WW3qn03HBH/8f5+9Mmm0QforKTdwU4R0N
         voWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471753; x=1794076553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yN+TG3cll45GlRcOY9f9N+pL2X7AI2IfUU7T9/nu2cA=;
        b=EKEeMYlNu8hF1FFp3TQju1Ae9LlZIjYNygGXbECZiRzYobL5gHMt0oispDZrD5Zvuo
         ukEPfKVrFOTqY99VGQAEICSOqRxjHW0TlG0jtbRQn9b2eHAn0LiTj4AUwgnYvmcK3dU3
         NyII4j9bUBSUF8JrUFKdImzem134AW1srZ3IrQMhhbkOgPM52/30ZyXuf6xfAbaiqn8B
         xEqhreupdbrOnS+6fDS42hiM/CfsuE6Yg7OZdNyNdOwODWFNjAoglxTlumrw8DOpj/pd
         wcN8sRIT7ryzh9/QuLMeoWAKt1JkzjxPqPW3inaeH3sNR8lyS9sJ8+1mejmLOdOSkK6c
         zgeg==
X-Forwarded-Encrypted: i=1; AKwUvBxWfkou7OIGZnQZsl9dyFtbq0qY8X2ZHo2LS6a+qJvRFtBBA1S4Y8Wd1tBvKA7lBzFwqbfl7dApmwSTReg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWdXI6f4hvgiLChZQKg7/kw5od973STPysfIkzclHTIgfqcG+1
	EqnhPCW6wCBn0Hn+FEnfLKkUpaDb2ztkcNAGGJSXPaK8GzzfHCVjmqCDhBH+lAmXSAic/Q==
X-Gm-Gg: AYBFou2Kq2dgxIvyMT7YVhObUaxN2kQRzIkODnt1UAU5EIAIkFTQt9/cwe1sQXT/GO5
	QubhNR+/lRabKp4QbU2ttfiJQBDlDXq9+PI+udDvEYv8pfRtqAL40lZiuFEpN7QUhpB4LkPZmG3
	aKREBbE+U6hRy43Y12TmtWwo7A6F6N91zmG3qZp4EH8coHjKcCkOm8XcJoWCVEUJWP3JQy+aFdd
	olTjaMLD11XoUqVYPTFK31x+snno9MTAut0ug4/dTAZwJG+MEiwGR9cx2FfComZbevcjtQE+zNi
	Drz6VfOOBUAh7YjPp8WH1DSoV29PMJbKTW+rYmrDiPKLG0xNV7Gqw95+nH9SLk8BJwPJkug/mNF
	MKG3mhvuFKsPy36YczeUXogVoUnPEgQAc/YehkT14YXa9arMhYUrHLm0pFzA77R3aVeagHtWY/3
	NCbMvix+rsvD3TCPk1/Cema4hVgFd2W20Uq4eEv464Cq0edVmtHdRDHxsU9RpgstxBAMdrW9y1M
	6n0wGMS8nNifLm/9wdyaVgujtDpiJ68kW9XFVPKTbKjHLSHVW/kJnJdyD3kPg3kyrb3CxzYh6Wr
	6fumUXQSACh9lL7XQoSyu6CLj+wPWMFwHJz9YNrP20YX/zmf8GJkMS6g6lx0nPw8vxhfx2s8J+8
	Sr4HaPqF9rn6438kJhSw09Nz+Kq+rlkmzlgx49/E4rOOpPyfJ4pkcMLyGThnJ2ZkkKq2RDgwE+3
	uoG/hPEDTMC8BIQyDeZ8Ywc8U1TZQHSQgO92UwV3WSTeF/+UKAGCsWYJs6n3SbpWdDDQ+ltxcjs
	BU19js3tlUIkuXDpBu3Ei1g/PjmB6fIBsgkrQ==
X-Received: by 2002:a05:600c:34d6:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4ac150b2192mr132858705e9.3.1793471753435;
        Sat, 31 Oct 2026 11:35:53 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:53 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] tools/bootconfig: Resolve histogram dependencies until no progress is made
Date: Sat, 31 Oct 2026 19:35:33 +0100
Message-ID: <cc5b165d95ad5f2083453644f70f8b194874598b.1793471731.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793471731.git.edumucelli@gmail.com>
References: <cover.1793471731.git.edumucelli@gmail.com>
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

The exporter retries unresolved events only three times. A valid chain
of eight histogram dependencies in reverse traversal order therefore
exports only four histograms and reports the others as undefined, even
though all their providers are present.

Retry while the unresolved event list changes. Stop when all events have
been exported or a pass makes no progress, preserving the diagnostic for
missing variables and dependency cycles.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I installed a valid chain of eight dependent histograms in a temporary
tracefs instance on my Ubuntu machine, running kernel 7.0.0-38-generic,
with recording disabled.

The original exporter emitted only four histograms, so replay restored
half the configuration. With the fix, all eight were exported in provider
order and restored correctly. Fixture checks cover shorter and longer
chains, missing variables and cycles that must stop without looping.

 tools/bootconfig/scripts/ftrace2bconf.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 8ba1a698611e..b3c976bc98c8 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -203,10 +203,10 @@ event_options() {
 			per_event_options $INSTANCE/events/$group/$event
 		done
 	done
-	retry=0
-	while [ $retry -lt 3 ]; do
+	while [ "$UNRESOLVED_EVENTS" ]; do
+		prev_unresolved=$UNRESOLVED_EVENTS
 		retry_unresolved
-		retry=$((retry + 1))
+		[ "$prev_unresolved" = "$UNRESOLVED_EVENTS" ] && break
 	done
 	if [ "$UNRESOLVED_EVENTS" ]; then
 		cat 1>&2 << EOF
-- 
2.53.0

