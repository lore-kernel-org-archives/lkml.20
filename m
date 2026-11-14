Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667981;
	b=RjnHuv4HLAC802f9Wn2e0HwJEoJX3fIqxBT9zF9a/Qg9k6q5GjTTbOsSaee4C1WEDIzm
	 PlAwQXyc9OQGDBYMd6yPa1OYWSkGHADp6lBqNCglCCiUhkObmWKeJlBoEAw63gZr0lK6F
	 v5VGDvmGdrzv8YX23HUvrw+NEORMmM7Ys9Wzj8fGIOOc+I/jP3LxM1ZJ8wcWC7e2XoqKM
	 eR+yR5AYVMA8lHd8ko1ozVSamrqA7vW7aBYEC2l64PRdLypSi8R6NjL2GiGUR8HNdyeF7
	 bLcm8v5kKpj6WpHRYL4nuD2Jp55dUezR/PHIDF1HljmOjJIatlew5ri67PIn9qGeRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o7h3UUVVN+MbLxa2NoBAv3sszap7em80pqhV/AUuWc8=;
	b=ZOEpdgz0uEsXQKjWQkuL3w0DMKgGyRRhl1Zh8g25prjxAYWicwJQl+zNP0vdo8lhrAj3
	 roQvKRnVKGnamgHj67oI6Vu3Jy6SfTpmp49WPtcAoyI1WUJk9aE6741ormEQhWKVkObaL
	 EXRjFyEc5XHVfOEZ9RQUHp0ZsV0rBXM/Z+JDgLoxlyF2pC+Ye2wZ9KoyNWd5XQOtPBvnK
	 18LsDpPIVdIEog5uSXc0Yg+ebPtP20pHxwMGfhtMVhPeQdEeMGUiwqbylWZ25tzazHe90
	 Tt4tkA4LHH/c3KU5rg7BohHKYXnFv13fWF3nKBKQzJxuX3icmfBndYxbkpie3mnl+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF5YoANA;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478C606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0478C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF5YoANA
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so827995b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667980; x=1795272780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7h3UUVVN+MbLxa2NoBAv3sszap7em80pqhV/AUuWc8=;
        b=uF5YoANAFA64zaiXNADV9DMYhvnbXnscC141DZITTn4ad5CTpQnGuP/JCcqblPNZPe
         15Gl/kvXSCT8YfUw33Ux8pEdxEFqKzLzwiwjlc9b7pVSv2Jh3L/jkAuIJCTQBqUiufsT
         CKF3rDnNQU/pw2FQEWMOEAIxd9SUw6fpkjykjVCgnuTC8VH+SD8E3PT30HjfWIWnUTws
         f/rstAfI1xXM17A261HaMtrVbIoLqdPMo+vehrhuodBdxjJTlo/hD7SJBhzhuaLM9D/Z
         zHo6DTfd1KI43IEHqdjEOstlsNVCRMO2khdjaRDy9Km0UacwljgumelYtsUT1SPxPG8u
         XWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667980; x=1795272780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7h3UUVVN+MbLxa2NoBAv3sszap7em80pqhV/AUuWc8=;
        b=RA37hzhnL8wpESgl2JbuW6V6Xm2OC2RyO2vlGQx8358vu6DvkiwidcZ45edAmAqNU9
         4G3cFybVxBX/6OVtOwywWGPjuVEuUD6he4jtNJwUM4NPvJCj3OIPqvP7pSjz9pheZAZ7
         TTbDJtRufUaJX4TSIgqIAL9ka+sub7QdKQhjRcp5AbkFvazzG7tY2zsqJL9xMN8Sx/Lp
         6pNNsKQ+yczeOY9mOpc0TDRy1TPV7rQo0CfBsebLezgQZJx4FkRKaH2L+bwnPgU0pS+9
         NxHNKtYTewyNv6ZSv4NGeztgKrBpX/LyryQ+T42J+fWgfPxejVNePtz+oKiWnE0JMPUN
         OQjg==
X-Gm-Message-State: APuU4Z8bjguGuh5qF1RRa5dSSBwcmT2cVShQgqps4v9Vykerh+6AOQaf
	GsiECim/YkgCzq51P6bYlZFYOuMoqdgiQRJ7MVSUgHCI3mVwfhecDr+l
X-Gm-Gg: AYBFou13wTwZojWzmKHsOhK9BZBcn7G4OJA5uAuX3mq7HUvdBqgduB/0Sz4DMfLCKUg
	HNzGUt8XCNpZjZUbpC4MPPGnDEcPI16+4hUMGtKIkTqOoRvn3tuGYvTbGC5ua0aikNQG8haxpw6
	19gP9IEqQ0ysfQh8vsXeADaMVVPcH7YQ6HMZn/h2na/eoSzgG+QrK6QjszOtY9Fd/wAGQzWCUI6
	sAyMYpRT/va+Ix7yPToe1BmOqnFZPzxyzF1JNm7PEelskBFHxpcZcvkzA+URzAW/KhejVE+HYZU
	K36aHk+ze9blMsYuLqy8JIYL6vXBAc5okECUdzeqR79+h5YnnJB//4e7voV0vuolj2R/xkOefEY
	6Au84co8oYAktfVdLd4CEc9FLvHwbt651VQFEim+WIyiXGF9UD0oCzY4BwYeHOZMY5S2ZoXd42h
	8N7sql7Ufe2oGRqsSD9zJTQpdpRhJNlpYDdzuEoZFSCRZ5xbJ/grGFHTEZ39hGytzK7KZdybY3f
	H9DgDndvi1VLZRfsiBi5S/JDdu3Sx3QAoHH5icyc15lTEcwtuoIxFiiqcdgtWFS7LXMQGZBmE8a
	lsfGuS2vYQbDE3CQneE2cOIWWiqu8MKZH9KW0aHvTGWoKbSNgDx/Oy5PSBnldmruFWjx
X-Received: by 2002:a05:6a00:1ad3:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8beb2e7dab4mr5713326b3a.2.1794667980260;
        Sat, 14 Nov 2026 06:53:00 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2113512b3a.53.2026.11.14.06.52.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:52:59 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 18/18] mm/swap: redistribute queue readers after membership changes
Date: Sat, 14 Nov 2026 22:52:48 +0800
Message-ID: <fbb87083afcc51fce533308d723edc55263bdf06.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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
index 0c192844b121..eb2128132455 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -497,6 +497,7 @@ static int swap_queue_add(struct swap_info_struct *si,
 	spin_unlock(&swap_queue_update_lock);
 	memalloc_noreclaim_restore(noreclaim_flag);
 	kfree(old_ring);
+	swap_queue_reset_readers();
 	return 0;
 
 failed:
@@ -569,6 +570,8 @@ static void swap_queue_del(struct swap_info_struct *si)
 			swap_queue_install_readers(NULL, 0);
 	}
 	spin_unlock(&swap_queue_update_lock);
+	if (swap_queue_len)
+		swap_queue_reset_readers();
 
 	kfree(old_ring);
 	kfree(old_queue);
