Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BECA38D3FE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619990; cv=none; b=oFINxQwHGAK9/+TwiLiaC/nvaWdCtWMspWEhjgyqhmj98PsYxDZkPPRAQTMjYmps8widFKT2ONAAzWdT9YkJbIgODm9HhU1jqhUdQXlezQO9s9YCEfCy2pCMIPGMOdZJPIAHMHkYxXqH0/xm7loApOXUCYsygG9oQkHhMAb3mBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619990; c=relaxed/simple;
	bh=oyagXbmMPbw5sPtonFwyzEYlm8yHNfReT4MTeHeyFEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BRlsm69z6BvGswAHKdD1m1kJcQFkIrKI2w/ciYAzn4FV3oBYPEY/EHYNZBGRwBxSLapYyXM4z4wQKhOA4Mmso1VDzC1zPlnoCvcG4oOF4tDUoMas1RBZKomL+dcfft8UFTQoLTFFp51TY2ySfxepC9VN5mn3iZtI+0+uaKBn5kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m4Chenod; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m4Chenod"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso4937004c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619987; x=1791224787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oCOHzQeFcL3Lz6dMojIFFyeuxIyS/xhNFHBXFsdeYA=;
        b=m4ChenodgXWEhdhMVoPcKq5kwzZWqOWHznXJ619gS0jWb64h1lMQB18oE8X1DaGHEw
         zgnhe1VzHzWK5mguGqk7Wg38llPaYMf80xml5W9DETRK2oGgWrdQz4g/b/GREfkOiCQa
         3ulWkoFkbWIeu6vN0HisHpFFnXZPgaAS6zd+O1ewkyX2alBPsOXW+52FDv7MC0Xvv0BX
         nbpXo5Ag+x8wpPhZo48qO4Grd98yozfasu05YCsHPgcC80VGKwHur/clJtmuLCtdzOZW
         YA/WUgwLaEwqurSh3AxRMqGcFUXp/Yaa/YnhqOF2eiiXQ9bQkOYm3N/7gYwZ8/oxdpJA
         7S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619987; x=1791224787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oCOHzQeFcL3Lz6dMojIFFyeuxIyS/xhNFHBXFsdeYA=;
        b=b/6AnMhHwwq7n4dJYRgCwAcsfzC7Lp7o61BYz0j4hi45XAJAKwnEEoLCtpzVN8Pbkm
         KOt7FsctgIiPsSzG3/KJ0dQECM1wOy3dV4Uk23rZqXE4gq2m3FE8ZQgWD9Or5UCi8n8h
         RrVyEqCNNsesaZ1j0H5dtWwBzhSMOZ6P/zPJHng7AacXBhuuZF7dsLMZfprO6/hRNQ/k
         mYKlF65KvPL95cHcWY5G0rpVeBScHmlpmsRGthP/56IepRapBXds0taFCc1HNlto4d57
         MWiVLyadlGoV0GSvi0MX0J+aj1dmPR3Yx3GCUI1xJPCRFPb4znUwpEbRnqLDn+j48JEd
         +sCA==
X-Forwarded-Encrypted: i=1; AKwUvBxJo2YXNxTwUORLsfZAuZK1323Q6M+1sMdmPhXibruT7yZQbGOc29eY7BgpXMLGeGxJwVtOf4nldF0C794=@vger.kernel.org
X-Gm-Message-State: AFuF++l4WETeczvKpKa/VbTynOTTSCrz9iEaoVBDe9BA1PqlFg2nmKlY
	UEgq8wG0tmNR7mJw1v8fpnFLVOZPT3jJv5azww0st13X7UJK/SBQCGKu7w4ei77eN0cfTUyNuta
	9x7sGiU0v3g==
X-Received: from dlbep6.prod.google.com ([2002:a05:7022:1086:b0:144:c68b:628d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2611:b0:148:516e:516
 with SMTP id a92af1059eb24-148516e0698mr7051010c88.20.1790619985794; Mon, 28
 Sep 2026 11:26:25 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:45 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-7-irogers@google.com>
Subject: [PATCH v6 06/26] perf trace: Copy sockaddr arguments by their length
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The BTF augmenter copies sizeof(struct sockaddr), 16 bytes, for the
sockaddr arguments of connect, bind and sendto, and runs before the
sys_enter_connect and sys_enter_sendto programs that copy their length.
An IPv6 address needs 24 or 28 bytes, so the rest was read from past the
payload, and now that the printers are bounded only its family is shown.

Copy them as buffers sized by the length argument after them, up to the
32 bytes augmented buffers are limited to. That holds an IPv6 address
and doubles the AF_LOCAL path shown.

Fixes: a68fd6a6cdd3 ("perf trace: Collect augmented data using BPF")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 85db74965280..f94745a60f4a 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -4159,7 +4159,12 @@ static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_machine, i
 				continue;
 
 			bt = sc->arg_fmt[i].type;
-			beauty_array[i] = bt->size;
+			/* Copy a sockaddr as a buffer sized by the next argument, e.g. addrlen. */
+			if (strcmp(name, "sockaddr") == 0 && field->next &&
+			    strstr(field->next->name, "len"))
+				beauty_array[i] = -((i + 1) + 1);
+			else
+				beauty_array[i] = bt->size;
 			can_augment = true;
 		} else if (field->flags & TEP_FIELD_IS_POINTER && /* string */
 			   strcmp(field->type, "const char *") == 0 &&
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

