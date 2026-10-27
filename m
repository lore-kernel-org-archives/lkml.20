Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117683;
	b=LheSN55x7s0XG+Av9mE7EVD+QD1UkVA9KSwiVZwHzKaTOU67fl3yzMr2Ih5+xGar3t1T
	 6UOnx0LIGi24W/IAGLYKF7HBmKFG/lTQjk4taG3bhmqjkbqpgV14uitu800HQYi0gNNfU
	 QMoeCNQaIG1ojiECed5Mi/kFZZrXMIKj4JwAKqMcZyF3Q3q9UwfYw5Zre9yPtAOgiK9y/
	 /xqw8eszoi4zKquDzL4+a+KB4bX4FmsuNppFPlydK1/RARR1rrdXj/XQR0d6sccMwvfJ3
	 /7VNnIdLufFUNHyyT6317TWnPHoeCVIJ9fFD5RqIaV/+QXeVluNsO5pbYzrzkhR4EsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mh1RMsnqXeQn3jeCo8IP85tEqAtoIfacyuqQryaWR/c=;
	b=3QFcxhinh4yCfWA8rws8Mt29hSButyS6Hv/hu4Mw40QgpKDzylCXNKhaMxiAQxsp5skF
	 brUR/qUofGDIK9OKQon13OD3BQ0CQW1hYGQtgFM/sKsVml5PZ5LKD3839LIN4CSf/0Ke6
	 KCG5Ocaq8BOFSQRUeUr3v4HA+Ww6lE1YT5cgBcKKrcU0mlc0ywxpCIG0yBHL+QyCRkEl5
	 V/GvrcNcXOHsnX+YjClqR5I7yuWAPnf0WpdoKBUioluMDoaeVHqulMEHEzc3u5f9T5bCd
	 k0nmIZL88hv/VTizDSgGaC8YnF0O0nUgoqmrm2KonCA29tU3K9NJEEM5FUi4r6Nqj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xP0JVMPP;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93D606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB93D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xP0JVMPP
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso58960a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117682; x=1793722482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh1RMsnqXeQn3jeCo8IP85tEqAtoIfacyuqQryaWR/c=;
        b=xP0JVMPP6bOu0/DSCVmAsgcluWlYDPXi+fPvRnabo2azGAQ77IYaotXd/L4k8D8Uk8
         QxFlROSdIKAfprywf40DcaLDd3jA/iKIMTmB+FuIp1DnZuBgLIPrSDOPhsnBMD4NoFTJ
         pNw8vGcsxBVgdepL1SEBMBWRLBVl2Wh/Z1dV4//vTMgKn7ZMd4/ABiHz1a2HWXrORWCq
         hCmmouBIpdjQ2u/9TLQmUZ0ZFwBqsfV85Qc5BWKARFsTYHVygnyC80C8lhwHF/l6Lp/u
         8qRwRcSO8F6OJSNuGlJGwGcdMrGegi6TV4XfWhbYfrKB0zSFWExY49p1Cwr3i9eYdDWe
         LY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117682; x=1793722482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mh1RMsnqXeQn3jeCo8IP85tEqAtoIfacyuqQryaWR/c=;
        b=DFDUk47gWuHt6JGMlVc0cotpdYha3nA7P+LYTTuWLE9clVdP7MvMFuU51T/y9Ge1id
         YBQRc61iB6gAtKSW7HS70B6PoLrTu+Ld0BcRrBvKexKBFUX2+W0iIKe32xqqKyHGJVlm
         PEI/oN/ehubteprMW8R0aQhSRwnuYMO+cHiGFPkEcdhrredVma8cEKd9tFawYtiXrFff
         ZfDB0XiPejcx8wZIB7cwS5fHlyQNS4WyLJWfQAzkQmHlvv7ARCyweVrNQaUq+dxwZa9i
         BK60xmcKi82ZxTs6p5Xk2tpKl9v2KyZgWbKKWMJfbh7M4JTT+5Cyl6Un09dS+UjDvFjc
         XEWQ==
X-Gm-Message-State: AFq9FYLEpbKrfsqq+fi2ROBuVXSTsqujy7tJubB8oGbo6UoWEoELMd5a
	hpc6gmAd+eOx4H9W6t7+9o0uIteyBZL/xYVZ5aMnUaU81E/MRjwBYYuD
X-Gm-Gg: AYBFou0sZ4PXAuwcjg6HmOU2sNmWan7S+i3q4C6N541DyOjVNQFeLLcpi3NLnncKGbh
	5P0IUeA0tdxn0XqXoMEEjHxItBQixEn5zgh/6HntfxGKvG17yRB5BXfusTnDQRJGegE1Z0kvHeQ
	emDSiE/4DFci6CwmBlYazCZ1isuu9evGGg9oTT74enm0ZxESFkMPnS8UPPF48fw8bzaZP8z+RdR
	3nYB3+jKOq69B4+gtpwloB/55SbOwwbfW6JobliI3kP0yO7l0baXM65es67x6JLbSdG31SME0pU
	8pEvlaBqqKhgmAISW59StMnm0Jgn/4qhSZowClw4jFLDQoXi4g0+eIfcDOhj4fmDxoo7veUe5k/
	61LiS3f6/uQeA7KZxBHbIPRcSh7l2G7NcqiHqQEYMzHwFquZy0KhWPe3phVb5tZooUNZIobRPSe
	XyVJQ2UR6pUL9oKm3YksMwXUmK0iQ0wD/1XqqXVIx2AAMdySUp3IgkVfIfr6TvZ4Cafxu+hXrPx
	Y+oMaAnZ9fK8X7ibVvUVlOKPW6aR5swiPCddLpEtPiNsmFFtLZiGcDYoQrRaRRVOeJE15KlpvkL
	7vfPhyHZpZFNSRUxr8Oish49FZ6eI2fySh/J4QAygQ61tnIrunYN/zq45crasz0n82g+Vw==
X-Received: by 2002:a05:6a21:1bc7:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3e7bfa34054mr7840427637.24.1793117682133;
        Tue, 27 Oct 2026 09:14:42 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccbf9a3sm2976375a12.24.2026.10.27.09.14.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:14:41 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 18/18] mm/swap: redistribute queue readers after membership changes
Date: Wed, 28 Oct 2026 00:14:14 +0800
Message-ID: <fdfe5fac0d5b73f5b93424070bfcc8290d1c7902.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

Adding a device to an existing priority ring reuses the per-CPU reader
storage. A ring that previously contained one device can therefore keep
every CPU at the old common starting offset after peers are added.
Deleting devices or rings can likewise leave offsets and quotas that
describe the previous membership.

Reset the valid per-CPU ring offsets and quotas after peer insertion and
every nonempty deletion. Run the initialization helper under the topology
writer, which excludes allocation walks, without allocating new reader
storage or adding selector hot-path work.

Use cpu-id modulo placement for a fresh best-effort rotation across all
valid rings. This does not move existing slots or guarantee strict balance
for every active CPU subset. Mask and availability transitions do not
trigger the topology reset.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9e90f815f99c..d659afb574b3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -496,6 +496,7 @@ add_to_ring:
 	spin_unlock(&swap_queue_update_lock);
 	memalloc_noreclaim_restore(noreclaim_flag);
 	kfree(old_ring);
+	swap_queue_reset_readers();
 	return 0;
 
 failed:
@@ -568,6 +569,8 @@ static void swap_queue_del(struct swap_info_struct *si)
 			swap_queue_install_readers(NULL, 0);
 	}
 	spin_unlock(&swap_queue_update_lock);
+	if (swap_queue_len)
+		swap_queue_reset_readers();
 
 	kfree(old_ring);
 	kfree(old_queue);
