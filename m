Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB203B2FC6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648858; cv=none; b=qc69U2q0J0PEKPc/zt8lgIkrN+M1StGmXtUB7LHArAzeSLDkvko0vQCX0YM08vN6i8Erf6Mn7kF82LpYgc2kjL03DN8L3Ale7HwKxE2MEMfqQ8xEIXsfpG8w9OQ/3zIchdS4j+s2P6+RdAQtpOHlL0tWjcjIwZzzZe8ZIOEUVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648858; c=relaxed/simple;
	bh=sKKHS2HS6UTzwjY9EozcnrCXoQy26cS3HBrm1gFaNaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlZfAGl4cioD8shYs8ryF4HUE346uIW97PBa496VUBiEjbTSuDrWtvn/OIJ9SJpzSE43kb9ash+M0d6AdwyE0SBX28imvRUG0i109dCNaLuMnyUziGKJrgg4eOzl/bCHIRKdhzGrx9SDkVEiUP66sJjAePO8q2Nm47rEZaPSaco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj8dH8sG; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj8dH8sG"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-86e7f44b773so25157157b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648856; x=1789253656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXw8Ug5yYOUTbLigrOAI+34wLiaUYUCdVkEC3NguuEA=;
        b=bj8dH8sGCBczySjqdYvBRgqyPJCGjHFhB7JPBVay61ks5YTSk8Ea8ROkz8AfJ3DQ8Y
         D7KjhfBxMqpFnE5VAtAdHtujQP50b17/aF3lCI4xLcdvqomTLnCIqpaKjIPfS1s3WgrB
         G0/n19LXCwzuLjmlmwbGAaHtkDhlshHZoVWz6aIT6OUltVkQccqq8lFjkf6888RYXHT/
         RIREmYO3fjByJ0a0FTJM04eZik0MJp3MW3GB4/1IsyeXzF/ikN8vnKjnBFlLn52pnY8o
         /wXDBBz3a1VZF+Z9KSHm6p3T7zUnqKlsSQmHBKBPkins0iUW5GbVXJFgbgP5yYo0MTgR
         bJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648856; x=1789253656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXw8Ug5yYOUTbLigrOAI+34wLiaUYUCdVkEC3NguuEA=;
        b=INLvMaVcNm1/iR3VWBr2KXVzZJyQvrKtH2uc+V5XQgqBzz4OIVOPOOikl4GRS3pRwb
         +Ba7zhtfG2ZG9DrDjLvniq9Vr2hvvzOJfz3t+/2kLFVvEcgnz4sRxmP+W+e5JnueyhBT
         XI+/Wg3yDrPOqLSuOZYJqvPjVSaAOZnxpYWKsBnyRPrhM8D4/8hrEeL2df3GM3plllhK
         Y8f3WQpqD9DFgibub46zlDc1Q9nPROcYMUbn4rkWvaWzUhX2vOImaIi57Nq8bJUqMF7Z
         iVfDzEicv4kjVFLVvqUSS+1V+lnukoy1aV7b6mwbY2zyPPFBM28ZFdgllPaN2rEK3Wpi
         AuYw==
X-Forwarded-Encrypted: i=1; AKwUvByTyIdPHuMTyl6tY5DeWZMSwqVhjZlkjJ5/uJ1g7quytZgw1mYqJeE4C2MJHgQpGJe57og+9vP1ZD5c5kI=@vger.kernel.org
X-Gm-Message-State: AFuF++maVHw0JgLNiFxMqt1DZZCHbxsebzKn8MRni07TanwHLPev+ITK
	9fsvYk32BlAQyi7Na1evx4XhpH5+Gq4YQcZI4Wlg+h+eb6sTp8RX3IA4
X-Gm-Gg: AYBFou0HrDRDoLgacxCClwZlGHjKLbCavwsWKqeM30WPBICu9PGRqJ3OXEh1YZ5Q4M8
	ZKOtNLaFErm0/0gUEguKpvlSGn9YZGmCzitYmP42MSIkb3WLrnip2tBVRIhDgYFR3tRbF4XzuaO
	Mbz1NuoUpenx1jjW44j0EcX7xSi0F1410ykO89SA8kUaVCwiSGLxolrmw+nCfWY2sPE7+/MNaWU
	eWpBZyWUO6Aen5W+/VpoR9iadMXHH2YaV67Hq3LGQLt1StbyDuERH2Q+buZ7RP8gtxG8lcP7vxx
	19J+wkXEEWjj0v7qRWoHKy+gngUBYKUeG6On+g0Bb9Bh8c5+489rSNTNN3dMKfvLUZOynr7C58B
	uPYXDOcQ2w/7JSky2NkRNVvJt9IyNr4MHzAbQAahAjxNesNvq5st9KO6bzV4mWi6RZOcPDRviGB
	guUeTRyT+ZRoUXb8ZPihigKQA4114QFcZfu7Tota9GkV1bymJ57WoJNtG5R0x+
X-Received: by 2002:a05:690c:f04:b0:863:e8cb:7773 with SMTP id 00721157ae682-87128faf717mr58602377b3.32.1788648855812;
        Sat, 05 Sep 2026 15:54:15 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493168dasm45817017b3.11.2026.09.05.15.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:54:15 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 18:54:11 -0400
Subject: [PATCH 1/2] perf thread: Fix live-session detection in
 thread__e_machine()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-perf-alpha-annotate-v1-1-97380433ccb6@gmail.com>
References: <20260905-perf-alpha-annotate-v1-0-97380433ccb6@gmail.com>
In-Reply-To: <20260905-perf-alpha-annotate-v1-0-97380433ccb6@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=sKKHS2HS6UTzwjY9EozcnrCXoQy26cS3HBrm1gFaNaw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmzJ30LvujJItxmM/WZWtv/YjR5mKSn3ckevMRqx9bL
 N7selyS3fGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXGD5lZOhyEt893V
 zUsPPqF30Hk7gCnW6Wih0O8pdcfKy7lW5GczEy7Eu/671fUNenginE0HHNn82Lj/wt3+Dk5rI0S
 lz/mf8dZgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

When the per-thread e_machine cannot be determined from the DSOs in the
thread's maps, thread__e_machine_endian() decides between reading
/proc/<pid>/exe and falling back to the recorded session environment:

	bool is_live = machine->machines == NULL;

	if (!is_live) {
		/* Check if the session has a data file. */
		struct perf_session *session = container_of(...);

		is_live = !!session->data;
	}

Neither half of that works.

The back pointer added by commit a088031c4998 ("perf tools: Add machine to
machines back pointer") is set by machines__add(), which only ever adds
guests; the host machine never gets one.  Host-machine threads, which is to
say almost all of them, therefore see machine->machines == NULL and are
declared live before the session is consulted at all.

The session test is also inverted.  A session with a perf_data attached is
one being read from a perf.data file, i.e. exactly the case that is not
live, while a live session such as 'perf top' passes data=NULL to
__perf_session__new().

So a file-based session takes the live path and reads /proc/<pid>/exe on
the analysing host, which at best describes an unrelated process that has
since been given the recorded pid, and normally just fails, leaving
e_machine as EM_NONE.  The perf_env fallback that would have supplied the
recorded architecture is never reached, and thread__e_machine() returns
EM_HOST.

For a same-architecture recording this is invisible, since EM_HOST is the
right answer anyway.  Cross-architecture it is not: annotating an Alpha
perf.data on an x86_64 host selects the x86 struct arch, so the Alpha
disassembly is matched against the x86 instruction table.  Alpha's 'ret'
collides with x86's and gets ret_ops, while its calls and branches match
nothing and are left unparsed, so no call target is resolved and no jump
arrows are drawn.

Set the back pointer for the host machine and correct the session test.
The new back pointer does not disturb the other reader of the field,
machine__findnew_guest_code(), which machine__resolve() only calls when
!machine__is_host(machine).

Fixes: 70351029b556 ("perf thread: Add support for reading the e_machine type for a thread")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/perf/util/machine.c | 1 +
 tools/perf/util/thread.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index f86b3b7df742..a1288fbed833 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -237,6 +237,7 @@ int machines__init(struct machines *machines)
 {
 	int err = machine__init(&machines->host, "", HOST_KERNEL_ID);
 
+	machines->host.machines = machines;
 	machines->guests = RB_ROOT_CACHED;
 	return err;
 }
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index e483ffcb5d93..f0d3773d87db 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -536,7 +536,7 @@ uint16_t thread__e_machine_endian(struct thread *thread, struct machine *machine
 								    struct perf_session,
 								    machines);
 
-			is_live = !!session->data;
+			is_live = !session->data;
 		}
 		/* Read from /proc/pid/exe if live. */
 		if (is_live) {

-- 
2.54.0

