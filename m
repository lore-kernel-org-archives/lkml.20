Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3636197F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915727; cv=none; b=mXquZhf9440lDAAAcPDa6txpumoLdy2+CBD5RpRAdTaFfElM4iKuyp/ixDk9N7W0beJiJeTd5qCgR/YiznMbsSWZ5ETBuHasv0o+ZIMwHukGeFFUEngdNQaKEQcPzBcUk+yhrbwEtv9UMewTpKuTVFOW8COlY1H0Wv7GN+UgRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915727; c=relaxed/simple;
	bh=G0sln9s8icqVwkN6mUWpfsrTM2bLhd0a44TIG9K/yq8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWXTSl2re+T5ZsyuGTQ3eCgKBHMxXuugCee/3mwKp0B5N+9C7Ji2w5+TG+AblNasn/drusNMUboLnHM/02dmP9XRWaYzbjym5k3syhZJlEJUrXr6+LRNUp0XOaXm9Iz/mvPeGFOQbnDzwYGkwJ5WrozKMjQtialf0+Fp0URZFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/A/Hfz/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJLWnydu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/A/Hfz/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJLWnydu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787915724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JiYbMpk0QVpG/Nje5Dzxc8mrDMjzdoKIdpT4mZnnljE=;
	b=c/A/Hfz/SgSE1aWq+0KgwvCFDOa2GS/4VUuFtrfDQUvkc0+KqH2XT7d+dxrmtjS6VTRehR
	J998xlrGeHkJaNLu8Vnkjro+zyHFWFClyQqBfE4QHAqv+/o5dRtTwXlGUUNcOQkIfdPB+I
	sto2IJ0IsTVM1ukLwZCkaLwtOuCR/l8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-joilWYlxNe2kIRZtldSyYw-1; Fri, 28 Aug 2026 07:15:23 -0400
X-MC-Unique: joilWYlxNe2kIRZtldSyYw-1
X-Mimecast-MFC-AGG-ID: joilWYlxNe2kIRZtldSyYw_1787915722
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c160b9c0676so61028366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787915722; x=1788520522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JiYbMpk0QVpG/Nje5Dzxc8mrDMjzdoKIdpT4mZnnljE=;
        b=QJLWnyduZDbfFWxjKzeYe9L1fV4jvCkoFw8wnqWcthEomvz6jY5KwNYodlSlANwhId
         XgGF2TjCon6Qj4Rj7Tw2PehGw84QlmoigN95s7TVeDE9z/L5RpmQX1S4aZT3G3AnhDQv
         7lWXRDwm2NaoBvdUp9vINW/dAeyK8ejbQs0TLlrFWrUbP/JeIePrcXnPD7R4CsOp38Z+
         6z5j70LFJ0rtZd5RxaWURK9n+TEMa5BkA0+rm0jTNqXn/n74NC4VZymnfwzBmbklpiKq
         8OTDIL2J871D9g+m33phI5vM9DoVbUUgL90oIMJBIMDv/WtlnP+wjjVoMoAeuuKGIM1A
         u3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915722; x=1788520522;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JiYbMpk0QVpG/Nje5Dzxc8mrDMjzdoKIdpT4mZnnljE=;
        b=HF3MtmKF5W5a5XTnshLOTT7JW+qnX+bWz6For1cvdhr1dwuRTzepS03z4BoVJ9K3Q4
         qnvAtIP+7mJE+xsVQHL2n8w6imlb/wQhtoskzVBMDPLLCtjqqLpkSFVMTOJQYQyprRq5
         MWKmL/dHTTnVCibuaQSYHc9wXYvqmO+WggQC5AHNrFCW6Fr0oystWiQz96MmXzTbGVA1
         IY7AwZeQsLgbkGD3i35zNVKERbjWb9Y8/yxwXZAgWOqXz14zTPX59N2zCeF9++E21ORE
         l8KYVji0hHo71leNwLuIcOBR5BmEdyDMJRMbUgiLIrEGNMWBo2zWRCPu5a0FAz9wQ8Dp
         9I1g==
X-Forwarded-Encrypted: i=1; AHgh+RoQ02EOqh/F4lOmBK/yVHbjNEkaCWEZXM2ApQ0vrDDCoVLK8jikbqBSi9f4ehDGD/+8H6ZzpfQTRREV0AI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8EbdNDmTqEaixYL45mdxVf87hKSIMd21jGj2mWg2rzaO4NBJ0
	ngjnQm82Huh4M1M12Mtt6V+CUGxpN37WIKr9tWoX+e6z1lG5vlgBgakHHwrhcukDjTfLmpQuB9x
	eGJ7OGfGhSBpm667cqrB8t+r97zOdvQWxf8Iq2uh7O45ZRzG8d9spYql7hFtMaa1jPw==
X-Gm-Gg: AR+sD10X/c1gMsphnkaA5+OLp9zmx0LPBrsx02bx2ql7aO4hQlg/CchLTamM4AK2Q4J
	aiJ+s7802pAG5I6AFo6uG4FFK3XZjbaDNLL1SETijjtL2oSWQtZsbXI1rbAyHuL6xSYQbNiK+Vu
	we0RN994DcAw8ETBJcn9fcdd82BnU4J+EXVlZbQ7WkHrM/4tO9SgsKFv2pP9JhaaDAd3oOCJisU
	pNg53vX2urixsimvQGHTLgrl35OaVaGbtUmPQ150qju75ZYKopUAMHPpGScw+uOWjGaK8gnO3wc
	TPSFJgXKGv8UtOl2c+hCW9W6Duq3aF7IGzRSh7sBJw/Y3XrMgXFDZ428tJMpVvfdFJV7GWKidJk
	V5F8VNn1QIqHIcNJmJ+KOj3g6rpZU588pu8Yj7PxMxdUc4E+VdPEX+Hi5ct+gTCR1rzG6MA==
X-Received: by 2002:a17:906:6a05:b0:c25:608d:7934 with SMTP id a640c23a62f3a-c25608d8c6bmr229058666b.12.1787915722176;
        Fri, 28 Aug 2026 04:15:22 -0700 (PDT)
X-Received: by 2002:a17:906:6a05:b0:c25:608d:7934 with SMTP id a640c23a62f3a-c25608d8c6bmr229053966b.12.1787915721760;
        Fri, 28 Aug 2026 04:15:21 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2917sm68343466b.30.2026.08.28.04.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:15:21 -0700 (PDT)
Message-ID: <3aafaa66c21e035879254d4b1c08826bfc70b009.camel@redhat.com>
Subject: Re: [PATCH v6 4/9] rv: Fix ha_invariant_passed_ns silent bypass of
 invariant check
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 13:15:19 +0200
In-Reply-To: <b12480afcae971936571d9c0def64d3a8fa0be99.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <b12480afcae971936571d9c0def64d3a8fa0be99.1787243842.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> When env_store is U64_MAX (its initial sentinel value),
> ha_invariant_passed_ns() returns 0 immediately without initializing
> env_store to the current clock.=C2=A0 Subsequent calls to
> ha_check_invariant_ns() then find env_store still at U64_MAX, causing
> the elapsed comparison to wrap and always report the invariant as
> satisfied, silently masking any violations.
>=20
> Fix by calling ha_reset_clk_ns() to establish the guard on the first
> invocation instead of returning early.=C2=A0 Apply the same fix to
> ha_invariant_passed_jiffy().
>=20
> This is a stopgap: once the RV framework reworks the per-env clock
> guard, this first-invocation reset should be subsumed.
>=20
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

I would like to solve this a bit differently. I have this patch hanging aro=
und
to reset() when the monitor starts, which makes the whole invalid thing
obsolete.

I was planning on sending it together with other changes when I have time t=
o
test them, but it seems the patch works fine on this series as well.

I reverted your fix, applied that and added the ha_reset_env() which you we=
re
not defining:

diff --git a/kernel/trace/rv/monitors/tlob/tlob.c
b/kernel/trace/rv/monitors/tlob/tlob.c
index 18150cbf57a5..934eea34021a 100644
--- a/kernel/trace/rv/monitors/tlob/tlob.c
+++ b/kernel/trace/rv/monitors/tlob/tlob.c
@@ -175,6 +175,12 @@ static u64 ha_get_env(struct ha_monitor *ha_mon, enum
envs_tlob env,
        return ENV_INVALID_VALUE;
 }
=20
+static void ha_reset_env(struct ha_monitor *ha_mon, enum envs_tlob env, u6=
4
time_ns)
+{
+       if (env =3D=3D clk_elapsed_tlob)
+               ha_reset_clk_ns(ha_mon, env, time_ns);
+}
+
 /*
  * Invariant: clk_elapsed < BUDGET_NS in running/waiting/sleeping.  "stopp=
ed"
  * is exempt: the parked period must not be measured against the old windo=
w's

---

Applying the appended patch too and running the selftests seems to work fin=
e on
my setup.

If you want, you can add this patch to your series for now as it doesn't ha=
ve
dependencies, I can sort the rest out.

Thanks,
Gabriele

---

From 29bdf58fc8f108d63b06051b415b97a45b27a976 Mon Sep 17 00:00:00 2001
From: Gabriele Monaco <gmonaco@redhat.com>
Date: Mon, 25 May 2026 10:23:25 +0200
Subject: [PATCH] rv: Force environment reset action on HA monitor start

Currently the monitor variables with a storage (e.g. clocks) are
initialised as invalid, then the first explicit reset() sets them as
valid for constraint. This only adds extra complexity to handle the
invalid case in constraints check.

Apply a reset() by default when starting monitors instead of resetting
to an invalid state. If monitors have no stored variable (hence no reset
function) add a macro HA_NO_RESET to stub it, this is all transparently
handled by rvgen.

The reset() action on ns-granularity clocks needs the (possibly cached)
current time, read it directly there. This might cause a double call to
ktime_get_ns() within the same da_handle_start_run_event() but will
occur only the first time and is harmless.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/rv/ha_monitor.h                 | 8 +++++++-
 kernel/trace/rv/monitors/opid/opid.h    | 1 +
 tools/verification/rvgen/rvgen/dot2c.py | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
index c2e200234e67..4fc5dadb4240 100644
--- a/include/rv/ha_monitor.h
+++ b/include/rv/ha_monitor.h
@@ -167,19 +167,25 @@ static void ha_monitor_destroy(void)
=20
 /* Should be supplied by the monitor */
 static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs env, u64 time_n=
s);
+static void ha_reset_env(struct ha_monitor *ha_mon, enum envs env, u64 tim=
e_ns);
 static bool ha_verify_constraint(struct ha_monitor *ha_mon,
 				 enum states curr_state,
 				 enum events event,
 				 enum states next_state,
 				 u64 time_ns);
+#ifdef HA_NO_RESET
+static void ha_reset_env(struct ha_monitor *ha_mon, enum envs env, u64 tim=
e_ns) { }
+#endif
=20
 /*
  * ha_monitor_reset_all_stored - reset all environment variables in the mo=
nitor
  */
 static inline void ha_monitor_reset_all_stored(struct ha_monitor *ha_mon)
 {
+	u64 time_ns =3D ha_get_ns();
+
 	for (int i =3D 0; i < ENV_MAX_STORED; i++)
-		WRITE_ONCE(ha_mon->env_store[i], ENV_INVALID_VALUE);
+		ha_reset_env(ha_mon, i, time_ns);
 }
=20
 /*
diff --git a/kernel/trace/rv/monitors/opid/opid.h b/kernel/trace/rv/monitor=
s/opid/opid.h
index fb0aa4c28aa6..f85b1959c2fb 100644
--- a/kernel/trace/rv/monitors/opid/opid.h
+++ b/kernel/trace/rv/monitors/opid/opid.h
@@ -28,6 +28,7 @@ enum envs_opid {
 };
=20
 _Static_assert(env_max_stored_opid <=3D MAX_HA_ENV_LEN, "Not enough slots"=
);
+#define HA_NO_RESET
=20
 struct automaton_opid {
 	char *state_names[state_max_opid];
diff --git a/tools/verification/rvgen/rvgen/dot2c.py b/tools/verification/r=
vgen/rvgen/dot2c.py
index 22938ce1bf6c..1532e6b6e199 100644
--- a/tools/verification/rvgen/rvgen/dot2c.py
+++ b/tools/verification/rvgen/rvgen/dot2c.py
@@ -90,6 +90,8 @@ class Dot2c(Automata):
                         ' "Not enough slots");')
             if {"ns", "us", "ms", "s"}.intersection(self.env_types.values(=
)):
                 buff.append("#define HA_CLK_NS")
+            if len(self.env_stored) =3D=3D 0:
+                buff.append("#define HA_NO_RESET")
             buff.append("")
         return buff
=20
--=20
2.55.0

