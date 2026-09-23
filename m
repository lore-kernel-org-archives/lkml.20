Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169249C4D7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187217; cv=none; b=Jti38jBK00rbaESeQvRyqRk9R8Ufv4aJoJeq6DdznTRdG4eTzKEh153MHpbwfiu60HqztmKtkdlCiIOQB8YD0O9GhTRDeojiv5IgHFGojHrs3bGtxaZwBkN4GXJ5bxdomgdm0X+epOkjYCr+RLrsnXRh1EyfHq9We03a+rHHkeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187217; c=relaxed/simple;
	bh=Bz2oZPyEsNSFolTBe+/41v1O5EHIsofKIEk2vb2oLLk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OObN/M80PcJWUrLFs6R6w7cne+E8hPB1kxrz1KaZ1jzHf12fSyTPHvyNPTx0XvX8GHGMN+R9wL13reuZrn7yd9lEeQckSvW3aJcuhpZQlrbd5IOAFQQl2iUuDVDR30p7MZwnHd8+/dkHA4JxXhKdE9GezcOpnlNPPV3ftgPuVEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QFLAtfCf; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QFLAtfCf"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so871330c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187209; x=1790792009; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idQufUXYxcwsLPFSlSoAQI8ETBo5OuMy8GMNTO6BuDg=;
        b=QFLAtfCfURSPDvvXm9Z3qwSG5G5yd6+CG+X4Xrx1svVhkVYrJ4kOlJ1LTABt0nVDLb
         +XFZaMLJ8ivhTGF6ceKep2HaOYI1BIOfBguEPqS4zERyfdiMOBqOaID3d3ZBQLP2ReeB
         Vfyck7R5a13k8wz3m4xNPAwZZP9E8s8B93wVf8sZd+efiRok5CP4rdw/XL7j7YBwmzny
         lOzzFIfhOA0qbs/XwODQbMy0DHmxZQhrmaJSJ7DCwDnUZAl8Lun3wA/sMpXMx9UTauU7
         zVNkLsmNwNagYVgPh1zFfWsODmb9Dn6jeYmofb+UjNAsCSSSVAxKVsu3qQF49CyepHBJ
         9l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187209; x=1790792009;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idQufUXYxcwsLPFSlSoAQI8ETBo5OuMy8GMNTO6BuDg=;
        b=kjTWhgk2FeTF/GNfu2gcVR/fhKbinLe/x6xh/6hI452/X/I7lzPNcZ25O3ESbGw9lX
         GU4OpKpciVraJv2G4ONl16xIQhdwSnSe9+YIeWW0K4aLvcpFqn3X97+h3gKcw64zGgQP
         gI1aHYsclUPKueeAVjvRaNeFjJlGPiUlsAAU5yqRxyG73hLLh4odC48Co4QXdTiIDAMV
         qCK6mNsW1BSYiwtV1NoocrTsXfRjn8Ev4qJ94DVMNMV3bbhXkf4do9C4BUwqQgNf0al8
         vKXntG4bqPtKC5U++YP988B40nWhwmWHYvxGUMTqRJmlE9wWygmZGKUEoO1+n3xqjOYC
         OSlA==
X-Forwarded-Encrypted: i=1; AKwUvBzeEcSj5Z0Wck4UZjSI7uk0hCK6j60JSUhsvRF28kzRJNSgESAT4FDUVgoL1MyhP9Aarjml1CwYwrduPRg=@vger.kernel.org
X-Gm-Message-State: AFuF++noiAJb7UZ6NuUO7cCsWtnhVoO3tF498fbYAqjtJJIjLcOMr9Kg
	ArPyh96EzTh7FdzgHkA9OPF8fdGSmXSf7arDIZQzD3wlkSpsOc4Q5naDMmNI+wbErk6baqbphAi
	Y0Y8x+JQIOg==
X-Received: from dlbep23.prod.google.com ([2002:a05:7022:1097:b0:13b:9a32:b2d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:250a:b0:144:e246:a0c4
 with SMTP id a92af1059eb24-144f918f197mr2974719c88.45.1790187208381; Wed, 23
 Sep 2026 11:13:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:38 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-16-irogers@google.com>
Subject: [PATCH v3 15/49] perf Makefile: Install standalone Python scripts
 during transition
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Install the newly ported standalone Python scripts (python/*.py), type
stubs (python/perf.pyi), and compiled perf Python extension module
(python/perf*.so, when built) into $(perfexec_instdir_SQ)/python
alongside the legacy scripts during the transition phase so that newly
ported scripts can import perf directly from the installation directory
before legacy support is removed.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index aacaa04854c5..d0754255c62a 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -910,6 +910,13 @@ ifndef NO_LIBPYTHON
 		$(INSTALL) scripts/python/Perf-Trace-Util/lib/Perf/Trace/* -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python/Perf-Trace-Util/lib/Perf/Trace'; \
 		$(INSTALL) scripts/python/*.py -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python'; \
 		$(INSTALL) scripts/python/bin/* -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python/bin'
+	$(call QUIET_INSTALL, python-scripts-standalone) \
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python' && \
+		$(INSTALL) python/*.py -m 755 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python' && \
+		$(INSTALL) python/perf.pyi -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python' && \
+		if [ -f "$(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX)" ]; then \
+			$(INSTALL) "$(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX)" -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python'; \
+		fi
 endif
 	$(call QUIET_INSTALL, dlfilters) \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/dlfilters'; \
-- 
2.56.0.rc1.310.g51773c2048-goog

