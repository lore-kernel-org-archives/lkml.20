Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668498;
	b=K2PfOHVrVBLBJnJFQGjfArdBBmgqRaRjW7uV1T4wuI7ZA0m3i3uf7IFefwlAqGFVUWc9
	 7aIMqQoeuMIS0L8GI/261f5LZ/pa4dzR7x8B6LBXRRBp30bng9jUzTsUBn8vd6Z0Y50El
	 4TAs9OQPO+SRwvSFZ2Q+siR6MUaTymxGeiVK7np6IaEiVgVlpyQKxzUQgdu3Ur5DZOTKX
	 VEVLVGOeI1TQwfJaIbWiQ8adzLdHhapEzQVjs3wTuNRJSLXbueS6EE5Je/AQ1aKYUHhcN
	 eMaxKw3bBKZqZ/8e9wC7AjTZnGz2Yrlc/wBi+cNsoLuRkINImLyXSMRvmoKJxJE53PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668498;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ea+D4XvQXS0wApj/sWZ9FEvJHF+Ta5tWsX5SDWfsCYA=;
	b=Y0h/xhbnrmjsAlRJNxQmykhNQ4HyOgG8wRua+zCPz3nqprvjDBmXNoBWoaCuut44qihc
	 P81xU+AHIoNBN2HL4W/Mkqg5qTehB+v3gCFBCc/q6+rvGd1NCjfT471HYQzYeiP1cKLZi
	 m49Uz6MimNUdbatieUkNZHZlpQyp/C4HB4O2uewC0I4LaqBy5OaYYx2gfUBmEzcrUn2aJ
	 f/pRG4uTQXPK5p0aBXixFXi81JYoT+W/iiDQZidt3F8jWBUEJfyP1HW9J3qVkr3vC6e1m
	 N3Qa32CkBZhmuspegQ5+WCGZB7EIiWhTb7IDUA0/lzXytimKZFHrZP7WZzELnNAWzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CC606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63CC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6168826eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668497; x=1794273297;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ea+D4XvQXS0wApj/sWZ9FEvJHF+Ta5tWsX5SDWfsCYA=;
        b=qxAM4JHC7DGmoYK/qRb78kWIEFyfJur0TRooGfiwx1CZ2CuMpaFywDVnBkFnavyCu0
         CP0StZjkP7oqQe5xVfz/zdJQsPrehW/s98kM9ywSIa38NsP5Es6BkiDByDwRYw/C8h1e
         4KKpevGRdF86hpnUVAxi3VAht1mEPNjSPEQa3+n3XklcvhKt3hVZ3h2Tk2cVWIJCEOiN
         hdNzMn96GsDS7tWOpqiDiBn17Zo3DW5xV6wubMfdmSLcvY07ZDS16MRDolLhfCoHma5y
         hErv0n3DjQ2ZKIF3CBK5gGb2BtgjkzWzQETwFa17CPHCnZGvro9LI1Xe7ivgB4FAnUu8
         DyPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx22R+FvRvC2sLrckqbybfuRycSHAGCdmeO7POvfBBFxz2bpK9Xf0iwfHJDO5XBJoU/vvaqMeTWy+bS02M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8GtxgvAO2EVYLFMsXAx/nrnQJca9UicB1As6K8U8xTCX4fiQE
	NVtULv98EIsTJFam/mdxqHYJULLXNGjA+9FX7yZT0R3bk9iA9FP1+qS8
X-Gm-Gg: AYBFou0kaSeoEqhtGRUZlopNoR95az+/rxbDAejoHzU3aLnkemA9HrdNS4909cRx9Rz
	rxoqisLuhjUJ6e7e9fmkoWTDG2wrdRwPEvterXX4rZkSAvjBpZBtrYM1uCYHfQM3QuOXxnbtMvU
	vu+MjY3muWLgzcg3XrLY/XsG/nBKwvq6kuqqGIB/n1w8PWJnAH29mDXB7aWqi5/9P3pM1RSrqE0
	CwyYPqR6IRIGKikgGEMsAmUpTEDdQ1jGQHrvsMf4irNakzrJpNU2DQL8Kb51pfUmGlSzB7rBkTv
	18lscQBoJ3ML4I1UH4KK/3zJ6qu/e5kVDameb/glX0wOGS+pi0zRqcvLceGM1U31u4NhJefznmp
	KzHtQZs2EvFvlGe8BFEvfNkRb7r8H8WktEssE+S2A0MCESQOQw3Bag7LFP7T6fRpReaxib7GwUw
	qwM1VHIJbKjJVSNHyT9/qZ68x8MTrcNPiEgtEVwDyYGBaTA4HlTcnUsJO+wl1w2GwzpHihmQOS3
	jbHamCCajZSfIpIuqfYgxTZngZgBe3vYUlKpDSuvTSXHzV031MCwNk+3QUYsB7jboLQNBAVGWzs
	Y0Q/z4Dx9PJWilN1xYyWQoNBubyNPK6Wy3scuI8zGe8S02VgEIRp3DKa4DCJMxlFO+rGcy63P9O
	YDB6zvNDHPVe+4BPtiB9niYVCeR9Kb1HNiCGK
X-Received: by 2002:a05:7300:b0a0:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-36a422255afmr18552566eec.4.1793668496818;
        Mon, 02 Nov 2026 17:14:56 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm51988583eec.1.2026.11.02.17.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:14:56 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject: [PATCH v3 3/4] speakup: Guard late sysfs operations on speakup_kobj
Date: Tue, 03 Nov 2026 09:14:53 +0800
Message-ID: <179366849349.70545.11202194243719221212@kylinos.cn>
In-Reply-To: <179366847311.70545.1738521378158835923@kylinos.cn>
References: <179366847311.70545.1738521378158835923@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

speakup_kobj_init()'s error path and speakup_kobj_exit() drop the
kobject but do not clear the global pointer.  When built-in speakup
fails late in speakup_init() (e.g. a kthread_create() failure, whose
error path runs speakup_kobj_exit()), the dangling speakup_kobj
stays behind, and a later insmod of a synth driver feeds it to
sysfs_create_group() through synth_add() -> do_synth_init() - a
use-after-free.  Clear the pointer right after kobject_put(), so
the late sysfs_create_group() fails cleanly on its own NULL check.

The removal side needs the same guard: when the kobject setup
failed, a first insmod of a synth driver fails in do_synth_init()
with synth left set (that error path does not roll it back), and a
second insmod goes through synth_release(), whose
sysfs_remove_group() would now meet speakup_kobj =3D=3D NULL and crash
on the NULL kobject - a crash the NULL clear above would itself
introduce.  Skip the group removal when the kobject is gone.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/kobjects.c | 2 ++
 drivers/accessibility/speakup/synth.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/kobjects.c b/drivers/accessibility=
/speakup/kobjects.c
index a73b478e06de..e1860f8d9d42 100644
--- a/drivers/accessibility/speakup/kobjects.c
+++ b/drivers/accessibility/speakup/kobjects.c
@@ -1041,6 +1041,7 @@ int speakup_kobj_init(void)
 	sysfs_remove_group(speakup_kobj, &main_attr_group);
 err_speakup:
 	kobject_put(speakup_kobj);
+	speakup_kobj =3D NULL;
 err_acc:
 	kobject_put(accessibility_kobj);
 out:
@@ -1052,5 +1053,6 @@ void speakup_kobj_exit(void)
 	sysfs_remove_group(speakup_kobj, &i18n_attr_group);
 	sysfs_remove_group(speakup_kobj, &main_attr_group);
 	kobject_put(speakup_kobj);
+	speakup_kobj =3D NULL;
 	kobject_put(accessibility_kobj);
 }
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 40870949b3c6..1af80eb116af 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -580,7 +580,7 @@ void synth_release(void)
 		wake_up_process(task);
 	rcu_read_unlock();
 	wait_event(synth_catch_up_waitq, !atomic_read(&synth_catch_up_count));
-	if (synth->attributes.name)
+	if (synth->attributes.name && speakup_kobj)
 		sysfs_remove_group(speakup_kobj, &synth->attributes);
 	for (var =3D synth->vars; var->var_id !=3D MAXVARS; var++)
 		speakup_unregister_var(var->var_id);
--=20
2.32.0

