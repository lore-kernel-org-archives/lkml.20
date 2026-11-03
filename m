Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733970;
	b=gDT9OmvHuZkg/iVSby/A8AD2AbnMGQ+OiWscWUy6kRA9ekV/n7uXP3TBKg0T0ynJbzej
	 uWWJhiaxeFn3kBFt6EefnDd0LGpwl9hXjNpinryqTogyFpQf1e2d25mARsyomUhR1CPdG
	 dhvSLtliKIyYE6DbLAuRuPdkidnIulrpGgqdreylyZuqDQX2WZ306XQnrA3dzdKu1dn0I
	 EU/HKfCpZkWSxWwMafMILLWhIFciJc4OoXzRjuWRzbIIaRIn943ZZ1I/Sb9FR9q6wHYk2
	 vKKaHWUXfggT1m+uly4jfPANjM8exp6AJYe8UJ2W0Jj/Buyxf9vhmI/vOipypIX8fnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Eo6VmiARCV/E0+lmU5+H4tJMnPB8p2KHdxisaJd5aXg=;
	b=vtultRqeYny1FpdJwZHxTdu9RuLV1HbviOED+xqfVpIfaMiGrkxguxC8MKmxawPlmB/1
	 cBX7UpTN8qJ/ttwICbPqHagBuJ7FQ5raCkKWpJyLHrAjtEM7lMkUF3HJWZLU0TuWG2SIH
	 FxwvzdKKE0sA3HtHeGj2UdEGEf6bEvwRnF8Qvewn91UphgbZMNopNspNttCiLrXccVHUI
	 oVLbcX6hmmwlvqP3z6W+r/6L2vrRY2crnImk+oBYvAMW0N2G4N67+k1RadvoIIc3c/mjN
	 ecnVmhhbrHg+tRvG/JvnX7rU/Yhpo/NLEMzZgHpgnSIHqnzCuX5GsHL/qcVs6pkL5Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=UGt+GH9y;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6941606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6941606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=UGt+GH9y
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso3599185eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793733968; x=1794338768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eo6VmiARCV/E0+lmU5+H4tJMnPB8p2KHdxisaJd5aXg=;
        b=UGt+GH9yq1ht0NPyjSAI5qXJmJ8w63K4dOhYvT8/8S6e5QDXUZIUvD14Pb8vIY4Vvv
         q2FVeQuENZUoxFJm4Y2ax5cCNlQBYG7x9wWWMK9tNRbRd7yIX7z+DVpLObbj6DEWZNmd
         EHiCwQfv7yigz+tn9gtH6xoy8VxOJa8MkFby0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733968; x=1794338768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo6VmiARCV/E0+lmU5+H4tJMnPB8p2KHdxisaJd5aXg=;
        b=CeV6ooSlkKbJRp/0Hhwa6fGLC51jsuH8VWLt9t1kilPztwlUxnWqZ/AC3vJZPodR2J
         flQ7rs+trfvMBl3S2zfSdFxP7twDFITPE/KN1C0WZYy/5ylQoGWRvOb4fTtyKhiY1phR
         RdS1QCzBFGsk7+f4LemQd1mOekmlzH3WEfLpWNGC9k+lq9HMUO1xWv8IRGKvyMI05Tm7
         n4mZdSw5ofFnKf2FMcDeQZI9mpgG+lOrqgpK4UW4h0tD/GAEwDp5gx/Pj4wMJcMU32Fe
         vPigD2I2r45r4MNPk+ATzkHqJrqUUVLft+kzqz+xt++cS9p0lXTbO7xfZHsQ3VhXgSbs
         19qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjmTOvG9WIg95RjfRuBlmenzuVeKpoMb2L6DSgQflJ70y2QuKHw+j9EOF+wrJA15GFZ303jMDhnYCZt+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xgLwlla9ZcQKV9XEBBnmLfSqTKWoNvzkIF09t1crTB69Rnx4l
	ygnZNldNaSyp6Tnm8+oqcgSEjY8PAH04ATpAFj8HguHKzGVxiKJk+rIBcORGxYYaz/EUrI5H4+L
	WvhcvLHk=
X-Gm-Gg: AYBFou2y0XL0TNQKy/nmme6N8gKhpDRxAWyT6X3kelSLHLgjIV51Bi0v+6Tnw3Tm1xp
	BnAOY3xlLo1z3nceAo7V1i3hEaPyyx2EUr3zyXNVrXASQRO7vKbH6zh5rUvK/Yif9scNwBmOxYI
	eB3ezfR586pspEEPXw5InQK2IGBQt6JESMXksTHZYcLZSxHbgr0Hywak6IURTqWIetTb/1LgH8d
	i5chT3aJKfm9NnwqctUptSN13c/Eo4rSofoIHqBgEdKuUejZub1RB539vMYOWOlwOap52UdyNNL
	lWCTCioJWMX4TEvudL6+mlob5yj6GyXlTt47y0VUJ77rJkw0lAzXTX27sRkK/M3Rb/UIArFWmeV
	u0ofNmRZlGRdIDwbW7lSD0vk8jIEF1ymry1MwdQ5Yn9Djiuty8Fc44TqVX2oo8otwbZZrA/obmr
	6prqw5/VvhBvaq4thEd2skNpIqZdrryt1vY6Nbx0zwgHOaic5K/mBbuWl72NoPAbRKRWq2IjEuT
	Rx8eLQ8+TEadpFGXqECjDDBayPK5xORqZFcpGX/gMvA8YS8l2XMA5fskGBeMw5iyZwLrYJwBaH+
	j6l+O9j4XbmVlmye+nwvy9beAMANrb8e9jiDQHCrzkMycARiwqU0weV0T+aMPeGZwKx6OTlUZPO
	FaRqT0iy8aGM827bFCvr/4amRfIRyYKE=
X-Received: by 2002:a05:6820:2203:b0:6d7:a325:35f7 with SMTP id 006d021491bc7-714f27636fbmr7710632eaf.81.1793733968248;
        Tue, 03 Nov 2026 11:26:08 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm12149533eaf.4.2026.11.03.11.26.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 11:26:07 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] sctp: avoid requeueing pending control chunks
Date: Tue,  3 Nov 2026 11:26:06 -0800
Message-ID: <20261103192606.92502-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

The T4 and RE-CONFIG timeout handlers take a reference to their cached
control chunk and submit it through SCTP_CMD_REPLY. A previous
transmission can still be on the control outqueue when output is corked
or suppressed, or when sctp_packet_transmit_chunk() could not append the
chunk.

sctp_outq_tail() then adds the same list node a second time. Re-adding a
non-tail entry can corrupt the list without being caught by the
insertion-time list checks. A subsequent flush or association teardown
can access an already freed chunk. The ASCONF path is reproducible by an
unprivileged SCTP socket owner in a user/network namespace, with KASAN
reporting a use-after-free in __sctp_outq_teardown().

Check sctp_chunk_pending() in both timeout handlers before taking the
extra reference and issuing SCTP_CMD_REPLY. When the chunk is already
linked, request a deferred outqueue flush instead. Simply omitting the
reply would also omit its uncork at the end of the timeout event. T4
would no longer retry the queued ASCONF, and a migrated, pending
RE-CONFIG could lose its timer until unrelated output flushes the queue.

The flush command acquires a local cork only when the caller has not
already corked the queue. This preserves the existing flush ordering,
transport/error accounting and timer handling without changing the
common enqueue path.

The issue was found by an LLM.

Fixes: 2e3216cd54b1 ("sctp: Follow security requirement of responding with 1 packet")
Fixes: 7b9438de0cd4 ("sctp: add stream reconf timer")
Cc: stable@kernel.org
Suggested-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v1: https://lore.kernel.org/netdev/20261030042321.74407-1-kylebot@openai.com/
v2: Check pending chunks in the T4 and RE-CONFIG timeout handlers, as
requested. Preserve their deferred output flush with a state-machine
command so pending requests can progress without unrelated traffic.
The common sctp_outq_tail() path is unchanged.

I have a reproducer for this issue and can share by DM.

 include/net/sctp/command.h |  1 +
 net/sctp/sm_sideeffect.c   |  8 ++++++++
 net/sctp/sm_statefuns.c    | 20 ++++++++++++++------
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/include/net/sctp/command.h b/include/net/sctp/command.h
index 2058fabffbf6..abd6cc509183 100644
--- a/include/net/sctp/command.h
+++ b/include/net/sctp/command.h
@@ -39,6 +39,7 @@ enum sctp_verb {
 	SCTP_CMD_CHUNK_ULP,	/* Send a chunk to the sockets layer.  */
 	SCTP_CMD_EVENT_ULP,	/* Send a notification to the sockets layer. */
 	SCTP_CMD_REPLY,		/* Send a chunk to our peer.  */
+	SCTP_CMD_OUTQ_FLUSH,	/* Flush pending output when uncorked. */
 	SCTP_CMD_SEND_PKT,	/* Send a full packet to our peer.  */
 	SCTP_CMD_RETRAN,	/* Mark a transport for retransmission.  */
 	SCTP_CMD_ECN_CE,        /* Do delayed CE processing.   */
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 35f540fb15fc..6f19ac78749d 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -1498,6 +1498,14 @@ static int sctp_cmd_interpreter(enum sctp_event_type event_type,
 			sctp_outq_tail(&asoc->outqueue, cmd->obj.chunk, gfp);
 			break;
 
+		case SCTP_CMD_OUTQ_FLUSH:
+			/* Request a flush without taking over an outer cork. */
+			if (!asoc->outqueue.cork) {
+				sctp_outq_cork(&asoc->outqueue);
+				local_cork = 1;
+			}
+			break;
+
 		case SCTP_CMD_SEND_PKT:
 			/* Send a full packet to our peer.  */
 			packet = cmd->obj.packet;
diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index b2f609f177fb..8b76b7e28504 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -1122,9 +1122,13 @@ enum sctp_disposition sctp_sf_send_reconf(struct net *net,
 		return SCTP_DISPOSITION_DELETE_TCB;
 	}
 
-	sctp_chunk_hold(asoc->strreset_chunk);
-	sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-			SCTP_CHUNK(asoc->strreset_chunk));
+	if (!sctp_chunk_pending(asoc->strreset_chunk)) {
+		sctp_chunk_hold(asoc->strreset_chunk);
+		sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+				SCTP_CHUNK(asoc->strreset_chunk));
+	} else {
+		sctp_add_cmd_sf(commands, SCTP_CMD_OUTQ_FLUSH, SCTP_NULL());
+	}
 	sctp_add_cmd_sf(commands, SCTP_CMD_STRIKE, SCTP_TRANSPORT(transport));
 
 	return SCTP_DISPOSITION_CONSUME;
@@ -6197,9 +6201,13 @@ enum sctp_disposition sctp_sf_t4_timer_expire(
 	 * chunk, it MUST be the same (including its serial number) as the last
 	 * ASCONF sent.
 	 */
-	sctp_chunk_hold(asoc->addip_last_asconf);
-	sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-			SCTP_CHUNK(asoc->addip_last_asconf));
+	if (!sctp_chunk_pending(asoc->addip_last_asconf)) {
+		sctp_chunk_hold(asoc->addip_last_asconf);
+		sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+				SCTP_CHUNK(asoc->addip_last_asconf));
+	} else {
+		sctp_add_cmd_sf(commands, SCTP_CMD_OUTQ_FLUSH, SCTP_NULL());
+	}
 
 	/* ADDIP 4.1 B5) Restart the T-4 RTO timer. Note that if a different
 	 * destination is selected, then the RTO used will be that of the new

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.55.0.openai.911.g06873a30d2f3

