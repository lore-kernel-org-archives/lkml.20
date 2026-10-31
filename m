Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471748;
	b=ti3/uwYouOXtPA2GZOhbBGJLyaXavXDfq4yuPKFiyDHUqDw5Iuy2Lj+rsNBg7NQRuQ5r
	 JIYSVEDVK4nRe+yH4BWYywC5bt7G/NVswkiO9qlVR7koiuL2FzYLSNCOeWJFF/Fj/OHkr
	 MqsWhCsvcVlnGsLec3dnh+Ach4JWJnJ/T8HHZUkcUxRlc5T7GadLsS/0DMfCR8GgO7scs
	 ezmxqGRB7Lv1m4rkt35KRWK9l3rVeFngAOGpysap/s65kiu+Yw0ga4p2GIfKoYZEjml+z
	 yzia06VZkKlO71I5afg1z+C2CtqS/1kftPy8CQAAjvKsewr7lOcQdwW4TPOK4mXSFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9swVnJsIFTaqwiyOyx92HyZhMjF20rJmhD0f7aWIjtk=;
	b=wZ1ETDpkHZ8EIz9zFYCl81K6HYtnCgYjvTdvK4Mt7SLLeCVEVVY9k7TfTipuwXzGPoVn
	 U4ZXrTRKYRmTZwE/rvBzRRmzSBbqqde1q4swDm6FX83w4NXT0dzuzl+mnvwvRW5YxHQc+
	 KPyfaRT00OfJB9ia+FD9tbApGDxKenmnNKa1cRtfzH7oij9Ue1aFTJQwyAcJI0HxQjKoW
	 72YtKwDoSUIvifGDUP5iwSzOt+fJHZ588VtQNegffACH3lsG82oC6XzQuwKhMUy80LwJf
	 dCfrZaff9VMKRsRYwSzwFlJhGbqIPo0/MdfZG7ThJ88qwYx0FWZkUeRZr1D1NfDTFSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsd0MLVN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsd0MLVN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11824885e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471747; x=1794076547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9swVnJsIFTaqwiyOyx92HyZhMjF20rJmhD0f7aWIjtk=;
        b=Nsd0MLVNyEjYloLgtQyhI0rlXtLaWTrhoWJJzdeIhPVRwPXp9TwHxMyyVKfohJ0uo1
         zqzWerpdQPacrdbBun7VlOo+K8uaLEttT5vTILxlscCidV2Xir+y7yLh+O5CEFnUCo4R
         PNwLdy4NLODNJc2hbubtLbnaXAGPousxIx6rZrKlVQlHeBk/KOmyco50p5+2VJv1vrZw
         8s6jQbbrOiCJ7rz2Tgpgop9l48odC6/DQE85XW++C5SLhWqFNiOGOSZu8Tc/dBrbfsJs
         XxkvB7/zLSjyK4Sj38cqQcaA2NqNqaOVNuIjQW1DPt66IIbDo5TCbuIaz3JKmzwRJ+Df
         hpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471747; x=1794076547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9swVnJsIFTaqwiyOyx92HyZhMjF20rJmhD0f7aWIjtk=;
        b=K9Px/VvD0bfDVru6GVHqqpDHaQRZsplFsQC/6HPFD5Gv6NK4OlOt9EuJ5zP30X9ef3
         qfEx4pSnOpDJfzMtu7mfN20ZqkWXCrrLQfoE0BB12XOqQgqxL+SHglObFk7fO4J927Pj
         ys5ZLCxny9Hjobb01Q+PppAi+W3r11zOmWg6MyBTU7YRoMHVEyRjxJhWqhxWLFZChO2r
         nfF1cyA+sGm7VGpbgqFPyH6BddKCctsRxM4yU/p2b1kC1mZTDIKuAwnKMO2y4E4pYGKc
         ps4aV5xmGQlu0PMNVSdG/thuM8qDDz0yxiNHjZBNIq1rLKtPkpLdRR8mQ8DxKCnHcYd4
         EaEg==
X-Forwarded-Encrypted: i=1; AKwUvByF2E1YbmX6ggGMP1ZJWPqylVB8RV2E9+lIA2g5ogGjxM23NFEYYB8X+JwzC1qnKDFNGPVTM4THtcosVno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9GqueDGCx4J9CQALq+oGpxTzDLoiKRVUz20V0c2thXkb/Wn79
	VYkR2ginQ7jOQf0ti7iUMaZSbPowmX0HMAU+FEPqg5vcSbf6ykt2YhmH
X-Gm-Gg: AYBFou2uZo5MGJ/2j5yWlOu6sKlXX/KHQNd7enQ6e1+rGU0GDW0koZWvqQLB+OotPym
	56FuQ4+sdadBqLwX/PdHxfL/J0Xppy06KoVVSZae47ZXHfDDggE7b4pHu2F2ZROMJEzmGEDJCtS
	7XEwOB8tJh+eXkZadBUfBHjZW4yFQABpfny6oPZi26J3BaP7b3TL4RjyXnhsWAlQfwRwuNoMwFh
	bBmP4hef5GbmOkvmrj2X9ZP45X6ROCnAp5PuqHH2gM8bD8kOzBsCL1yMPYiwei3STYPNU43ky08
	yzJVG0Scc0i6gg9IdxVWxY9880tQLFHdsYLmuui43qA6I56kyGVdYzd0tc/0E8DfqGTcLYV6vOS
	2hEvgRFvXqOvACAAlg3I34XaPYQnj49THH49TFcx5jft+GwvVLkWizqDq8PNAIoIcidpWgNF4zd
	YA3MbrV8JkjXlqmtysR59CZ7346Gq2/9fycH5vCnYufVxzK0TWwHkDGO8moDHAIgm1+b4/DhJ5q
	7M08LsYwYJfNQojQ1Gg9MHxvCn17k17sdKj4sNTIxhqNcFIgi7iduC4/aiAoDjHApu+U7Bvq1oz
	UzirCwDv/kG7jXI64eX/BiYrLprwp2UXRXEvRaWSlmJOUACQzZfIt1j2Cze6CKiO9U6IoefEKg7
	zrOj06iXgCpnUYHrWy86iEtWd7pqadfczC5YvRi55fZJIG4FOQZhV5KQodKGPZTw0JLfKlFi64M
	+y15MJyXky6z3uY+lsSD1H50BbAj77laiVlk3gZehS0e16Rbi5Q8qBxXdJ93bjq+mFzmEtGANRc
	IkowwIWHE7Xyzvo
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr126461055e9.33.1793471746626;
        Sat, 31 Oct 2026 11:35:46 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:46 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] tools/bootconfig: Fix tracing script filters and histogram dependencies
Date: Sat, 31 Oct 2026 19:35:29 +0100
Message-ID: <cover.1793471731.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Masami,

Thanks for the reviews and for picking up the previous fixes. Here are
five more script fixes, based on bootconfig/core as you suggested.

They address:
- The documented ftrace.notraces setting being ignored by bconf2ftrace.sh.
- Single quotes in event actions producing invalid exported bootconfig.
- Literal filter text being mistaken for histogram variable syntax.
- Valid histogram dependency chains exceeding the exporter's retry limit.
- Helper key lookups matching unrelated bootconfig keys.

The action-quoting patch follows up on the trigger-filter fix you picked
up. It uses the same warning approach for unrepresentable values that
you suggested for event filters. The histogram scan uses POSIX sed.

I tested the conversion and export fixes in temporary tracefs instances
on my Ubuntu machine, running kernel 7.0.0-38-generic, with recording
disabled. The tests cover each relevant step and the combined series.
The helper fix has focused checks, and all 81 combined fixture checks
also pass with POSIX sed.

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (5):
  tools/bootconfig: Read the documented ftrace.notraces key
  tools/bootconfig: Preserve quotes in exported event actions
  tools/bootconfig: Ignore filter strings when resolving histogram
    variables
  tools/bootconfig: Resolve histogram dependencies until no progress is
    made
  tools/bootconfig: Match literal keys in tracing script helpers

 tools/bootconfig/scripts/bconf2ftrace.sh |  2 +-
 tools/bootconfig/scripts/ftrace2bconf.sh | 27 ++++++++++++++++++------
 tools/bootconfig/scripts/xbc.sh          | 13 ++++++++----
 3 files changed, 31 insertions(+), 11 deletions(-)


base-commit: a52ceed51e9bf8f1ca9c2c868b14bf6861986c65
-- 
2.53.0

