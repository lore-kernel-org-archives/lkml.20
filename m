Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471752;
	b=tLAc+j6Rd7GLXYoZSESH3Bfaib6uFRMDZcv7BfRLngL6t2hFcGKEN20+nvqQVb6a3eW9
	 ySDvUUKE8XL63Bfkjvu3OVPiLQ3OyzytMRv/Q1Xe3S0pEoXVzWR5Rp/z9FnL+wBxfHlqC
	 J59meTKm7EPhHRg8RFNQhO0pwHtilzZa//Wt4BWh55GJdjKaHCP7t87EXhGt7OPlbYM+H
	 o7cPxrlXtuII1/zixv5ynoKNfxSQuS299YUtttxiD3lSnUyoAel1LDXsSKvDjastPGHR/
	 VSH8Zwczy6qXyOyoBHcyVSiI/gRVyfQ7EtnL5PGrw98OTUbWHbaEh++jnWO6VR1Pcdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JAt4SPXJ+lKuay4IHak8A5/kcoQw3e1/rqWqojGsCrw=;
	b=KM58iYcbvXECTiRnt3SbgoW8ZMt0c+Wha7KXJcJAeOcr46NkntN8rEmR/pFIAC99lini
	 1G7UgywKYOzCCk7Bx3Nhl6TO2H85O5ntIgp8zCRIRXcScyzlGBz8EFYJAyHU0eiu8/oTw
	 8tXcukCPo9UJfWlNcEctfW0DsOYcBhLmVex40AVZxjUbtpZqfiNR6pvm2wYk4hrfcbRdt
	 N71R7HWqRMjsnVRI2JT3UPc1/eFW7uL8oL5MYADETgrzp/01m2TwpENhO594FXp19dMX3
	 n+82O2l9DaPefHUfz/OTMMlZ07avcEGXP9QF+f9YQof8ID3JZ4P7aS5sQqIFEggAtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeqcFHv1;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94AA606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeqcFHv1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11004025e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471750; x=1794076550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAt4SPXJ+lKuay4IHak8A5/kcoQw3e1/rqWqojGsCrw=;
        b=jeqcFHv1r8xRToqNdx1IV/wfpY0Y6MP2B854gUElWGldGwiAM7WfH21ScCepG1JPsn
         SkKcPCSpJi9ZjOLAkcMzx5RCoVEZojxk5NyrqaCr/wUHh6uXra2QF10x3cBcKNAxpSpc
         a6ZNhjmTqqTqM4sB6s9DZQD0KL+0ghG8btd5gtvf/rbdHk3NP3byIObwHYf58M2IXEW8
         DOQy463BGS40G33xa0pfWAud1RUa9XGHWtIugN/MiiItmgBIJNj9Pw6ifJ18RZEC0O4u
         UZkfAnO15aYDJHjKN3FkUPFSAOqWiFhDYMpfIdebusbeEfZVKUY4zwjfWFTLRiru5SDe
         /Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471750; x=1794076550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAt4SPXJ+lKuay4IHak8A5/kcoQw3e1/rqWqojGsCrw=;
        b=WwUHq+kYAvlvizUQlEZWu9uQPU9Bx4ohCAPYoatDaurj2ihW22dZv2bZG0CE6ufMuY
         efmr+w8ZEX+RJmpBuDgsN5SfcponCwnLqVhqva/NIJxHh0s0zPDPb52K3rLYAS+0rkuu
         B8Tf1EnnTLYLZVdJ00ym2MMftCMaPF7C9f0H8K/RQolTa/ZXLIQAPTVEoYdieqbncqnW
         +9o0GkUGEOj/+/zu/3FXV3Kh2NKCt16lioRetRPAeiDH1lvisHGGY2RUXmfsGVpUldcv
         xZBk0QP8CKOA1jbXYU9tpy//rtAPxKQnpZgWQyNCnyIb+0CY8cTxlT2anxMMdyZ3wnrw
         qz8g==
X-Forwarded-Encrypted: i=1; AKwUvBzLC2GiUCy1pBM1cTIvhUMP1+ZCyI2bqWkwO+b7OtoQxJ/x6NxcOZxqEg88ddsGnkPK9VemBrg1Y+jSq2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYYLtfXy8hwgP2lE2hdcjzQL2xboGmFSnIFeI3dyyO7fzbnJqF
	HamOaj3U9gC/AOGj37QF/7uOC/4RbuUHT6aC1DxP7wHOAjkoM1qDEOWuax7pX6vva5l9Nw==
X-Gm-Gg: AYBFou0WhZ0VFEEfCLF71+GV1ngVIzCfh1hJuA7LKhljn/wSzIcRJbh0UXJm8vSr7W0
	OOIR8sjCHXj/oAeXOlz0rGGoav5cfxvV4fWK2YXv1y9UV4yHrfycAmpicLGZopNn4oFV4dhv/Wh
	9H07FMRxgCa9I7HxNDwO9ZHWy8wOP4I0xNJSOiGdGzHrPebX8O4yXpJNMBvNl3RIxO6P2niFnDx
	NxDCSO3qr7te6iL/pS6U88scZgOs7P6UNaOPeJz47s3wUpnavjZBn2prrVw14+EZovVMBz8ZQHo
	sjbRF42y5Sra2ETCxxODD2xBnKSjFYhFfhy16jdyAzplFrdztxy4weSsUWCvXyksm+g9viUKAli
	/sqHMmSuxn8OlFz/IvhLtZB0Y5Z9HsoV0eOR6FpPo7o69vBlSD3ko6U466oQfK+wB9MfxHs7TNE
	rtiX6U71WQHlklXGizUP5iG7AMrmx2/GqPtQIW4jdkO1te36oNQ4f86LRsMW9hHD2hM28GKECvg
	t2/MB135pJmbuj9pKxBTdS/qLRezfvwSlb+RyXwH5iAcqX//8aD2etVJZj2RCt6q52BfHHzEwE/
	gB1gC1n0DTymH888AwliclExXGUqpmXl5GB6vXdvV4Aq36yFGNhQ+fuy8U1IvKM/N4fUzjrv5bP
	BSAxQT8IRr2D0IENslV9e93IaqTPLHXKYX6q0a0HjfkfJk3ojf5ThFMJ/Brrf+DCoe74LfxurRd
	m/gL+CBWvKY2n0pxHlfwgxYfSNG9rEvnxBTrRnhpN4H+SBOJoq6NQPoATAy+9G38hKgj77peCUk
	5Vmd1k6nw2AUK0t
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr135013365e9.34.1793471750166;
        Sat, 31 Oct 2026 11:35:50 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:49 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] tools/bootconfig: Preserve quotes in exported event actions
Date: Sat, 31 Oct 2026 19:35:31 +0100
Message-ID: <001ad0e960ea349b3a5de670944c28853224c0ec.1793471731.git.edumucelli@gmail.com>
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

Reading complete trigger lines preserves filters that can contain single
quotes. Enclosing every action in single bootconfig quotes then produces
invalid output for a valid trigger such as traceoff if prev_comm == 'abc'.

Use double quotes for actions containing only single quotes. Actions with
both quote types can be emitted without enclosing quotes when they have
no bootconfig delimiters. Warn and skip unrepresentable actions containing
both quote types and delimiters, following the event-filter handling.

Fixes: 6a5740440c47 ("tools/bootconfig: Preserve event trigger filters in ftrace2bconf.sh")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I reproduced this with valid traceoff triggers using single-quoted
filters in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled.

The original export failed bootconfig parsing. With the fix, supported
single-quoted actions parsed and their decoded commands could be
restored unchanged to tracefs. Unrepresentable mixed-quote actions
produced a warning and were skipped. Mixed quotes without delimiters
and ordinary double-quoted filters were checked as well.

 tools/bootconfig/scripts/ftrace2bconf.sh | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 31702be0c68d..77ec17c94a17 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -126,7 +126,22 @@ per_event_options() { # event-dir
 		*:count=*)
 			action="${action_cmd%:count=*}:${action_cmd##*:count=}$action_rest";;
 		esac
-		emit_kv $PREFIX.event.$group.$event.actions += "'$action'"
+		case "$action" in
+		*\'*)
+			case "$action" in
+			*\"*)
+				case "$action" in
+				*[,\;\#\}]*)
+					cat 1>&2 << EOF
+# WARN: $PREFIX.event.$group.$event.actions cannot be quoted for bootconfig. Skip it.
+EOF
+					continue;;
+				esac;;
+			*) action="\"$action\"";;
+			esac;;
+		*) action="'$action'";;
+		esac
+		emit_kv $PREFIX.event.$group.$event.actions += "$action"
 	done
 
 	if [ $GROUP_ENABLED -eq 0 ] && event_is_enabled $evdir/enable; then
-- 
2.53.0

