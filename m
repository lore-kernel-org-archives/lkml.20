Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388770;
	b=1UfoxAWBr1JssuQyJZ91RTok3ovrv2ImRZ06gTMCjvi+sAYMfybccFo9fMQfvTWFRuSv
	 78oCHDuLfJg2hEWrEKWiDaWKn3LynOtw1LqcwOaD2dIxPx9dOQemRd5KXroVowkKBOXa+
	 GWK2qbk+rvnqn+utiyFASoE39dcBhpYShFU/5kXSGAcR0r2Ba3fLRF1uD74To7XTXSO76
	 Igi6CpRvqVUefUJlV6wMvcrF0A34lY7NqtbJBilEeVTsKiSRmV0aB85FWTOyKgQIEia8c
	 DHoJRai2myXB/wCJMBtYzs49Mod243i4tyoH2nVzaSYsgRMXIUMOIODplykqisT+GNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Na1iYLbrn2Uy61QhH6HhZbrLCYD3ujN956/FF1v8tq4=;
	b=unTKn7VghUNxSI6+a8oU+dfUG+buz4cVlXhimDJAIVu3fL7uskULGL0TEYWPNNhsYJb/
	 ID3/jpukGBQ5/XVz8a6Rq0Z1UVUYZ8oa5WBPaIDvWEviFTPNQOBaAiv1qYGldx6FCoOyd
	 MVp2xr8B7RFwKxKi83/x7BgDs/C0kgjmRIdOonoVSoOJeuzEMzIpQ6KUvDAzjvTXoU2W/
	 ii3n6Is/eXQmrZgvSggjX1Rt+qn/UaqSbMHCAOQVsu0BWA3SQoOdd1YmnNlzqXCmeSS9j
	 DOoMlXZ+ayl8BSVE81haAuI/QYvm/mBGnyqLhPeu/Tf3CntwMucaNBCmqEYGcTiDNUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEAVI1RR;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEAVI1RR
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0a28a720aso11159847b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388769; x=1793993569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Na1iYLbrn2Uy61QhH6HhZbrLCYD3ujN956/FF1v8tq4=;
        b=CEAVI1RRRqRA9IhFbpgdZz5IRc6/MsWwGzmu4cw8+7vqs4QG+zqf8wyitGrc+XQfb/
         Pip/CqNJXvmoy+NuFI6ZF5pvTlKx78RnizjflqHhhcfi8IUZi24t5IkWdz4cX6Uu30m5
         cNSdvO4XUle9tnnpOuAH6S8c+79vdIR2b0FfYIaLiNto2p074SkiXzmgpg0UyNEUqHa+
         y4hH/07MrG02iRq+tsXyWx232UfHMSdThMEpSjeCSnozHKd8tQcjLoG+Jr/cT3KMJufD
         C2FvkW5OzNJKoTKsfUyx6YdZ4ua1Meh0k9mSnBmIBQfNN1ezR8mlnBAzeUUqoKXOQqb1
         7RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388769; x=1793993569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Na1iYLbrn2Uy61QhH6HhZbrLCYD3ujN956/FF1v8tq4=;
        b=vC4SaTGrCwuh53VYd8MxzSaijAXTmwXahVB8vn63NsZWyK5NLupaa3CEhPwyzG6Ya3
         kRJEduI+7qrwpIlKyQTXPgJplA9eul6oIfbdu7SyCeV+atoPSM+xz0fBa7OHo7TUDN3W
         gtbBVkhEgBb2DZlaAParxFHj/BKeYUTdT3aoreWVIiP09BiAE5WhTr9jk+MoNaBFcrcX
         q5uwzCYWzWCt3lSpP4gb1yRGBAEDvjtCJ3kdSC5wUp8acPhYEvzC+6t8n9l3ilADkRgi
         Sx6gwcMQOm9vjkTdwaOgwWIASpXyEmvC1nQ2DVreKPEbdeYg0jzkpHotNYZy2Fb94Wg3
         +Urw==
X-Gm-Message-State: AFq9FYJ6evtJ5t7QKi/Cs1RotyYRijAOUKg4/wacrBDVTsKkVYrHpiaP
	98v256kaZVxZ96AAy/VEMzrMt5m2eaS3myPAmo8MJQ0gCRsw9PM2+tPj
X-Gm-Gg: AYBFou2jIE6yISmbKMW0r/sQpx/Y9f07R9ryPT4P4AQGJh/WZc4OTZJgCQs1mcm64ay
	kxuKy2PVlEAMVNHXZW5lwuSViKYtTcZMEzaFp5c36YQBfoMgqzMRp43L7Na3WDaiIdGtkKZAh+s
	9H/wsrLDFS9xgT4l/2CMdZmCBo1+J59Ib84iBaigifKPoKEtd1cxH8U1X8coj4A1zn1kYVsK3hb
	DKMcSOE1blUUBvH/jd7e8Ulnhn0Jc3h1LApn0POtxwDWl/AOxNCfxgKS8wEx4ZoXJvZ5zAvJE3G
	zUpdd8aOjiJIU+BGgUgdWqtD9XE2FSKe1yUBYKrfEHVHLWkkE4r+zO5NNN+wsv7PpCPufYEOSMF
	noryxhDBArxxhMigCpAngEo+hDymXWNPoV+AlYLfTtl3l0k2FEF34JHN2QTkc78a3YXDcFcJ3v7
	jTHRankOYHFyXqMsdiEbEadXaW4Oid8weEtiT05n+CthHqi0sMEOSf29q/Z2CRX6yvTkKZbN8Lv
	eRQ7jPnHFqtF3UK9YvAQjpYksOS1hLvC0oEur1p+IvRtzA/IF4dR05XhXXRAuQ3AsTNH2jlQyg6
	3/Szuut0ek/77R2Qaojxbb8a9HXM
X-Received: by 2002:a05:690c:3481:b0:8b1:69b4:b56b with SMTP id 00721157ae682-8b2b65aa9b8mr20367937b3.8.1793388768500;
        Fri, 30 Oct 2026 12:32:48 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71240bcsm13323337b3.9.2026.10.30.12.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:32:48 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 1/2] perf symbol: Add dso__load_symsrc()
Date: Fri, 30 Oct 2026 12:32:33 -0700
Message-ID: <20261030193237.1440673-2-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030193237.1440673-1-thepacketgeek@gmail.com>
References: <20261030193237.1440673-1-thepacketgeek@gmail.com>
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

dso__load() goes through the candidate files for a DSO, such as the DSO
itself, separate debuginfo found through .gnu_debuglink, the build-id
cache and /usr/lib/debug, checks their build-ids, records the one with a
symbol table in dso__symsrc_filename(), and then reads and demangles
that symbol table.

The DWARF unwinders depend on the first part. dso__symsrc_filename() is
how they find a separate debuginfo file, for instance to use its
.debug_frame, and libdw's build-id cache fallback needs the build-id
that dso__load() reads when the DSO doesn't have one yet. They get both
today as a side effect of loading the symbols of every frame they visit.

Add dso__load_symsrc(), which does the same search, inside the DSO's
mount namespace and honouring --symfs but stops before reading any
symbols. A new symsrc_loaded flag records that it ran, so the search is
done once per DSO, and the DSO's symbols stay unloaded, so dso__load()
still loads them when they are wanted. Kernel and perf map DSOs are
skipped, as the unwinders only handle user space ELF images.

No functional change on its own; the next patch uses it.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 tools/perf/util/dso.h    | 11 +++++++++++
 tools/perf/util/symbol.c | 40 ++++++++++++++++++++++++++++++++++++----
 tools/perf/util/symbol.h |  1 +
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 55c4aaa53c38..fcf235186978 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -340,6 +340,7 @@ DECLARE_RC_STRUCT(dso) {
 	u8		 is_64_bit:1;
 	bool		 sorted_by_name;
 	bool		 loaded;
+	bool		 symsrc_loaded;
 	u8		 rel;
 	char		 name[];
 };
@@ -603,6 +604,16 @@ static inline void dso__set_loaded(struct dso *dso)
 	RC_CHK_ACCESS(dso)->loaded = true;
 }
 
+static inline bool dso__symsrc_loaded(const struct dso *dso)
+{
+	return RC_CHK_ACCESS(dso)->symsrc_loaded;
+}
+
+static inline void dso__set_symsrc_loaded(struct dso *dso)
+{
+	RC_CHK_ACCESS(dso)->symsrc_loaded = true;
+}
+
 static inline struct mutex *dso__lock(struct dso *dso)
 {
 	return &RC_CHK_ACCESS(dso)->lock;
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 3587ad243159..ed2f8e89b191 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1798,7 +1798,7 @@ static int dso__find_perf_map(char *filebuf, size_t bufsz,
 	return rc;
 }
 
-int dso__load(struct dso *dso, struct map *map)
+static int __dso__load(struct dso *dso, struct map *map, bool symbols)
 {
 	char *name;
 	int ret = -1;
@@ -1828,11 +1828,17 @@ int dso__load(struct dso *dso, struct map *map)
 	nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
 
 	/* check again under the dso->lock */
-	if (dso__loaded(dso)) {
+	if (dso__loaded(dso) || (!symbols && dso__symsrc_loaded(dso))) {
 		ret = 1;
 		goto out;
 	}
 
+	/* Unwinders only need ELF images, not kernel or perf map symbols. */
+	if (!symbols && (dso__kernel(dso) || perfmap)) {
+		ret = 0;
+		goto out;
+	}
+
 	kmod = dso__is_kmod(dso);
 
 	if (dso__kernel(dso) && !kmod) {
@@ -1915,7 +1921,7 @@ int dso__load(struct dso *dso, struct map *map)
 		}
 
 #ifdef HAVE_LIBBFD_SUPPORT
-		if (is_reg)
+		if (is_reg && symbols)
 			bfdrc = dso__load_bfd_symbols(dso, name);
 #endif
 		if (is_reg && bfdrc < 0)
@@ -1978,6 +1984,11 @@ int dso__load(struct dso *dso, struct map *map)
 	if (!runtime_ss && syms_ss)
 		runtime_ss = syms_ss;
 
+	if (!symbols) {
+		ret = 0;
+		goto out_destroy;
+	}
+
 	if (syms_ss)
 		ret = dso__load_sym(dso, map, syms_ss, runtime_ss, kmod);
 	else
@@ -1991,6 +2002,7 @@ int dso__load(struct dso *dso, struct map *map)
 			ret += nr_plt;
 	}
 
+out_destroy:
 	for (; ss_pos > 0; ss_pos--)
 		symsrc__destroy(&ss_[ss_pos - 1]);
 out_free:
@@ -1998,13 +2010,33 @@ int dso__load(struct dso *dso, struct map *map)
 	if (ret < 0 && strstr(dso__name(dso), " (deleted)") != NULL)
 		ret = 0;
 out:
-	dso__set_loaded(dso);
+	if (symbols)
+		dso__set_loaded(dso);
+	dso__set_symsrc_loaded(dso);
 	mutex_unlock(dso__lock(dso));
 	nsinfo__mountns_exit(&nsc);
 
 	return ret;
 }
 
+int dso__load(struct dso *dso, struct map *map)
+{
+	return __dso__load(dso, map, /*symbols=*/true);
+}
+
+/*
+ * Discover the same debug images as symbol loading, since they may contain
+ * unwind information. Do not read symbol tables, demangle names, synthesize
+ * PLT symbols, or mark the DSO's symbols as loaded.
+ */
+int dso__load_symsrc(struct dso *dso)
+{
+	if (dso__loaded(dso) || dso__symsrc_loaded(dso))
+		return 1;
+
+	return __dso__load(dso, NULL, /*symbols=*/false);
+}
+
 /*
  * Always takes ownership of vmlinux when vmlinux_allocated == true, even if
  * it returns an error.
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index d0bac824c79c..7dd7924a098d 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -196,6 +196,7 @@ struct ref_reloc_sym {
 };
 
 int dso__load(struct dso *dso, struct map *map);
+int dso__load_symsrc(struct dso *dso);
 int dso__load_vmlinux(struct dso *dso, struct map *map,
 		      const char *vmlinux, bool vmlinux_allocated);
 int dso__load_vmlinux_path(struct dso *dso, struct map *map);
-- 
2.53.0-Meta

