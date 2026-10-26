Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019980;
	b=khzmaN6pBjd8ys6QfMATI4yvDw4QI8UXL8T5Imk6Odh1DQ+Olfu6tLP+3MhVmi0TdoT7
	 MD1Id1wN4XzrLcd9aFYA2+Jc7ZcYsb/ItWkchqJ6dhK4HnTM1PTLjP0l5RwlnIeOre2tV
	 8bbvCz9M5dzXDm8JlZX02bHMWzeO2h5z1EGRILAQOEqVL/9sxyOWW1mZX1Ce0ONruzLp3
	 /qP/ULQdfQE78aMIuv985esf1evd4VpY8aBMIOzte57KcsOnqN8OThGX0cLf/sjhOYBjZ
	 rI0r/UlcOP3UyYbEjOw5N/fX5wGIS6FtPzaX6yshbmNQXNma3MmDRtJzpfXT0A/ccIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019980;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=bCWVrjiZl9TQf8/Ty02OBVB4QF0zvuew8Fni+YiAYE4=;
	b=ZU11WWDc9Imk62RmESXc6jVz4uWDDlOD55dfoXfFE4FaXi+0IQG04Ofn/QyyeTP1kGAU
	 hsro3E1krIlFcP3vLhC9IMiWk1Go3C2Z6Y+wxPU+qQWONCxLX+pt8QMqk8eAj+DB+90eT
	 /+IXw7N4G5+RBlmc9yxT75pEVFBCmo2kaW/MAZ7SlKfXT8qzVkkH7mo1PhSyJdEfCWlvc
	 nqiKGb2HF/DZEuTe4aoHDtAbciB4WQ3FsZRCCHgs+GZ+bpqAD28cSEY8m3g00FuZryMeq
	 Eavz/VlGgwENJ8DCeTVVxaAl6BSxX+5ETFMO3LXrhD8/97n8tr7PpZhfGf+fDBiW5Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O2Pfm1oM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hvQo9oyA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A694C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A694C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O2Pfm1oM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hvQo9oyA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793019978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bCWVrjiZl9TQf8/Ty02OBVB4QF0zvuew8Fni+YiAYE4=;
	b=O2Pfm1oMW4Zh16Pjo8g/wwo6hDjuysozg/qDzkpHxKwt+AXys2NbAXZ1fcKcUMURXUI8Bk
	bXqeKFhK/8l9lZ5yV31npfdkI2y49K7/ZB4Oy+KBdAn3+ij1AxK8LPA6OjMryX3nHUt/Tn
	/M0d2SleEm0IgdoXpm/EFvmQxg8IRp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-AREyR5hsP_aXfp72Jtb17w-1; Mon, 26 Oct 2026 09:06:17 -0400
X-MC-Unique: AREyR5hsP_aXfp72Jtb17w-1
X-Mimecast-MFC-AGG-ID: AREyR5hsP_aXfp72Jtb17w_1793019976
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a028616bebso23768545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793019976; x=1793624776; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCWVrjiZl9TQf8/Ty02OBVB4QF0zvuew8Fni+YiAYE4=;
        b=hvQo9oyAIsrhXEy/CQGA0zMQwMH59RyOIfq5F3ORUyR5oWlYZu9M7GGfR2LwCK4pU5
         mXYfvKYIH+oybrcQekjYVoih6BWxsr9aktf0Nozpk4+cnYhsvP3TYVS03jtq78Lv3geR
         e6p0q+9incvj/uLunJqP07sA12Dzw0BXkh3rry0nEZD13j4WQLRSUyzGvszk2ONZutPu
         K8lYB/0MWmyPB6D3stj92MM64xyad9couNcw3ZvcIedkpIpk5lWFpBTs6Oo1cLRv5wFK
         XYC7NP4oO93wiOUYFJv5XLeilPjXVv5rsUpgEWEDmuvId0+FDWlbRClY9PWTrW7W6YCl
         Hmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019976; x=1793624776;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCWVrjiZl9TQf8/Ty02OBVB4QF0zvuew8Fni+YiAYE4=;
        b=GmvivhUbKEfOqnFUp38nrF81y8pAdFBfyh89rqXpeEdCNp8G9LeRYGnCIo6V+qJfQ5
         gHBTaXRDfhGgEDX/LMoHgFWAQgKSxLR03BHv6XM+R/ULxUfsyVimQA2epKfSedDAmrHr
         CAN3skwwpqfHUnfUmicGWLCXlvNIISzNQ/M0F1SKxoWP4BDr4C7ycQDauOeVvfMoYR2t
         sKNBaPwBL5++9dpusq/v/0IoUmGPOQg51qfwTgJJOh4b909ih66FMUeMkKXbdwRtHvkv
         3+vywbuS+QKy1YcnSKfcJNjjVBn8QV4EaiqQ9CenyNiEyedgGxEsrfYonxT3zoGCzVBG
         +n/g==
X-Forwarded-Encrypted: i=1; AKwUvBwnk7h8XvUkOg23iBRkuvsjY4WpRNX1ezvFoRpQqX4UVoFLMbx+omh7l7ewHFBjySLMTQ5od9vm0e5GpI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI97Q0N/z9ghT0tDyIB+Oo2bXxoiWY+8CEqgILsFHdlAFD/Xpw3
	7AoaUtwi6jb2Foin7Ek9Vxqjhvy5s+iZoA/Tsk7amilI82he+Pn1zxzl06l2rQYypseSZ9xTBER
	UNcKGJZQDBmbV9t1VIG6ID0z7BJ7TVuT42b4d1BjPhJOm1wGyk/NbE95/Xoob/T6LgA==
X-Gm-Gg: AYBFou2iM9sgKRvLAXq0QUCWTaNNDfDwO12IizLhlMJGofRO9OFiU9J9vj/XJWgQjW6
	TfXxthspttLTv3aruOQcsEmpZY5EUaiycUtNuJImi4V6E2nP6BF29Twjp0hXcK5syZipYiWskxK
	1EZLAlB9h6XyXekMbdlnXYJYqyFaCRPX4AZbFQ2YzNikiUXBsv6CqdxRDjLb1LsPRzvroWQShkF
	6ndd0MhV8wZcf6sms8z2peY0NpQWJtkasBcijhhkgbYeSMyIGeuEVyHHABxsoidqzYX7aY+bGwW
	tfI3ai2vlBIOxjQx/UEI9JuB6g3Ul8VHd9nHLyMILzFkyb+KIg2f66a2xZ5Xb19+fm4wTgHgpQ+
	avVGRb0WbH5yqpgBgzeF5vhZBRcbh
X-Received: by 2002:a05:600c:474a:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4a35acaa6e7mr125345155e9.29.1793019975732;
        Mon, 26 Oct 2026 06:06:15 -0700 (PDT)
X-Received: by 2002:a05:600c:474a:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4a35acaa6e7mr125344445e9.29.1793019975155;
        Mon, 26 Oct 2026 06:06:15 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm231268565e9.1.2026.10.26.06.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:06:14 -0700 (PDT)
Message-ID: <2c2ecf44e7aa2d6a9bd8f926557bf745cad3d6fb.camel@redhat.com>
Subject: Re: [PATCH v7 00/14] rv: Add task latency over budget RV monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 14:06:13 +0100
In-Reply-To: <462351c6a891d1a2d57d2589124caf939225f9b2.camel@redhat.com>
References: <cover.1791745088.git.wen.yang@linux.dev>
	 <462351c6a891d1a2d57d2589124caf939225f9b2.camel@redhat.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-26 at 12:05 +0100, Gabriele Monaco wrote:
> By the way there has been a running discussion about keeping the C files =
for
> the monitors as close as possible to the DOT representation, with a long-=
term
> goal to extend the DOT to represent everything and have logic represented
> there too (at least simple trace filters).
> ...
> These are general guidelines, the C files cannot yet be a 1-to-1 product =
of
> the model, but shouldn't be a completely different story either.

To push this even further, why don't we get the framework allocate also the
tlob_record ?
I played a bit to adapt the PER_OBJ things to accept non-pointer targets. N=
ow
this is far from clean and is /not/ a recommendation over how the API shoul=
d look
like, but it seems to work and simplified tlob even further.

Nothing forbids us to embed data with the monitor state also for other type=
s in
the future (besides in-kernel PER_TASK, that must be fixed).

What do you think?

diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
index 04caaf529034..4677e19b228d 100644
--- a/include/rv/da_monitor.h
+++ b/include/rv/da_monitor.h
@@ -23,6 +23,17 @@
  *                   must run in task context; other handlers only call
  *                   da_handle_event() and never allocate.
  * DA_ALLOC_MANUAL - caller pre-inserts storage; framework links the targe=
t.
+ *
+ * The target type: a PER_OBJ monitor usually typedefs monitor_target itse=
lf,
+ * as a pointer to the monitored object (borrowed: the object exists
+ * independently of the monitor and outlives the storage).  A monitor whos=
e
+ * target is monitor-owned data can instead define DA_OBJ_EMBEDDED_TYPE wi=
th
+ * a complete struct type: the framework then derives monitor_target as a
+ * pointer to it, embeds one instance in each per-object storage, and
+ * allocates and frees it together with the storage.  On storage creation =
the
+ * caller-supplied target is shallow-copied into the storage before it is
+ * published, so it may be a fully initialised stack object.  Do not defin=
e
+ * monitor_target by hand when using DA_OBJ_EMBEDDED_TYPE.
  */
 #define DA_ALLOC_AUTO   0
 #define DA_ALLOC_POOL   1
@@ -61,6 +72,10 @@
 #include <linux/slab.h>
 #include <linux/hashtable.h>
=20
+#if defined(DA_OBJ_EMBEDDED_TYPE) && RV_MON_TYPE !=3D RV_MON_PER_OBJ
+#error "DA_OBJ_EMBEDDED_TYPE is only supported by RV_MON_PER_OBJ monitors"
+#endif
+
 /*
  * Per-cpu variables require a unique name although static in some
  * configurations (e.g. alpha modules).
@@ -463,9 +478,24 @@ static inline void da_monitor_destroy(void)
  * Functions to define, init and get a per-object monitor.
  */
=20
+#ifdef DA_OBJ_EMBEDDED_TYPE
+/*
+ * Framework-owned target: one instance is embedded in each storage and
+ * allocated/freed with it.  monitor_target keeps pointer semantics, but
+ * da_get_target() points into the storage rather than to a borrowed objec=
t.
+ * The header derives the typedef: do not define monitor_target by hand.
+ */
+typedef DA_OBJ_EMBEDDED_TYPE *monitor_target;
+#endif
+
 struct da_monitor_storage {
 	da_id_type id;
+#ifdef DA_OBJ_EMBEDDED_TYPE
+	DA_OBJ_EMBEDDED_TYPE target;
+	bool filled;
+#else
 	monitor_target target;
+#endif
 	union rv_task_monitor rv;
 	struct hlist_node node;
 	struct rcu_head rcu;
@@ -476,6 +506,38 @@ struct da_monitor_storage {
 #endif
 static DEFINE_HASHTABLE(da_monitor_ht, DA_MONITOR_HT_BITS);
=20
+#ifdef DA_OBJ_EMBEDDED_TYPE
+
+#define TARGET_PTR(storage) &storage->target
+
+static inline bool da_storage_is_empty(struct da_monitor_storage *mon_stor=
age)
+{
+	return !smp_load_acquire(&mon_storage->filled);
+}
+static inline void da_storage_set_target(struct da_monitor_storage *mon_st=
orage,
+					 monitor_target target)
+{
+	if (WARN_ON_ONCE(!target))
+		return;
+
+	memcpy(&mon_storage->target, target, sizeof(mon_storage->target));
+	smp_store_release(&mon_storage->filled, true);
+}
+#else
+
+#define TARGET_PTR(storage) storage->target
+
+static inline bool da_storage_is_empty(struct da_monitor_storage *mon_stor=
age)
+{
+	return !TARGET_PTR(mon_storage);
+}
+static inline void da_storage_set_target(struct da_monitor_storage *mon_st=
orage,
+					 monitor_target target)
+{
+	mon_storage->target =3D target;
+}
+#endif
+
 /*
  * da_create_empty_storage - pre-allocate an empty storage
  */
@@ -513,7 +575,7 @@ static inline struct da_monitor *da_create_storage(da_i=
d_type id,
 	if (!mon_storage)
 		return NULL;
=20
-	mon_storage->target =3D target;
+	da_storage_set_target(mon_storage, target);
 	return &mon_storage->rv.da_mon;
 }
=20
@@ -549,7 +611,7 @@ static struct da_monitor *da_get_monitor(da_id_type id,=
 monitor_target target)
  */
 static inline monitor_target da_get_target(struct da_monitor *da_mon)
 {
-	return container_of(da_mon, struct da_monitor_storage, rv.da_mon)->target=
;
+	return TARGET_PTR(container_of(da_mon, struct da_monitor_storage, rv.da_m=
on));
 }
=20
 /*
@@ -582,8 +644,11 @@ static inline struct da_monitor *da_fill_empty_storage=
(da_id_type id,
 						       monitor_target target,
 						       struct da_monitor *da_mon)
 {
-	if (unlikely(da_mon && !da_get_target(da_mon)))
-		container_of(da_mon, struct da_monitor_storage, rv.da_mon)->target =3D t=
arget;
+	struct da_monitor_storage *mon_storage =3D
+		container_of(da_mon, struct da_monitor_storage, rv.da_mon);
+
+	if (unlikely(da_mon && da_storage_is_empty(mon_storage)))
+		da_storage_set_target(mon_storage, target);
 	return da_mon;
 }
=20
@@ -599,7 +664,7 @@ static inline monitor_target da_get_target_by_id(da_id_=
type id)
=20
 	if (unlikely(!mon_storage))
 		return NULL;
-	return mon_storage->target;
+	return TARGET_PTR(mon_storage);
 }
=20
 static void da_kfree_cb(struct rcu_head *head)
@@ -645,7 +710,7 @@ da_create_pool_storage(da_id_type id, monitor_target ta=
rget,
 	memset(mon_storage, 0, sizeof(*mon_storage));
=20
 	mon_storage->id =3D id;
-	mon_storage->target =3D target;
+	da_storage_set_target(mon_storage, target);
=20
 	hash_add_rcu(da_monitor_ht, &mon_storage->node, id);
 	return &mon_storage->rv.da_mon;

