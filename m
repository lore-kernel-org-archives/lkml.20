Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032834;
	b=OTHbMDtm5PU8ncDw39iVu+fkopwwx0Yq4hM5YWAArYxsGDMuYOnvSdL7OuQaDDXsmXxW
	 ER1IDe83lxwohfWBiYc2g4mfbiptlR01ojttvr8sgOvsV7IWzjum1jGjA8VdkxgbHGgCm
	 vx5/yJQZHWnTW+L213n2a51cKxvwkIjXwBjjdX7oz0a7cvL/c5BX/LePM6erV9LQZkw1T
	 SB5TOMgxibXre6SfaGqJ7thdxFtPDHPFuS1pQnWVUURVe4GtBRy6v4U86oWgge4vWompx
	 lDUUjvNzY1CBYXL3tUlfC1qriHbucK0X43nQltnBELncOQWnrKUlbZfhqB5cBOwBfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k/RQfOJkIdQzlXf5l9/irF3ArAcPBHy+Vg3AaL27hnc=;
	b=p34c2SossQ6AikNre+vti9Uxg06X+IzWMP8QnfRgq6/a2UYhkzJS3kOM9ZbddqvDnICV
	 spOkKSh4jLhq5Suf2/qwpTnNijy82fesZSJVCUJ8dvaaQ2wlM40gK0YemLrAlZcRClzjL
	 Gry3SmRy2WUtPkGmFvaDT8wig1wm700S1+g5P4MUssXXONpdr/C8dg2qAN64+b30AoN7o
	 sAPkArsUlfeLoN6iv8T0lpddtOHdoscQdO+83hKHvN99QrgX/y/7Pe8VY3DWjdZcgLoN4
	 V4IENd5ZBA/RC++vU+jo+n4HfaX63UI8B9N8CCFV9lXGkjtyoQG2OM+J46huiRdO98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=IFvv7334;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015BC606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=IFvv7334
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so20208855e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793032831; x=1793637631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/RQfOJkIdQzlXf5l9/irF3ArAcPBHy+Vg3AaL27hnc=;
        b=IFvv7334RUecEqgCZeJLDe54+kNVLGJT5y3dPohSLzzB4aNtlLs3fEr6EWYHRsrJ7T
         GOhHbxzeqP3qJg0QnDg+9fhaKnweR6TNJa639MNOBuZGq/ow82CnTg85+PWQexV3bCQa
         z2KsiRpEv6wVjGoujgL0Rw+Oco146HEwhtUKJR9sWDApycv/DIxFUUlYtq39FJ6v45wQ
         qMtImlPjdKLANYZVJyi9yxV/frNWefQh55mvkjXR4yvWyfxCCzlQsEgBSj6yWBAYBTDD
         E4B1PJs9VWONMi79OVAi0aftzLeOJL02G76V/UQGKMHOnSbyR4ysuzJcna39s0q7cpNe
         Q1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032831; x=1793637631;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/RQfOJkIdQzlXf5l9/irF3ArAcPBHy+Vg3AaL27hnc=;
        b=Owb9J0M0n2JJbeqyvUcy3sGZp++l8SGuHQGiYMVPnuZFkjuHZWxj9Sq9alu9654n49
         MdEnkiljQ/CCAYsOOQEMO3krD6lwI8Upw/87UjhQ3gKvstiFoqPuGy3D1s0Dn4mHmnp8
         41h8d4wASFUaK19hEjZZamx94FCPQzn1ctfwvBnJyG5hH3Ye1Z0NzYyCeWNktvy++Gk1
         c4JGzgEhnuGIa0AZjNUWlgZFUsAK1VWyYUuR9Uy7gjGed+z/OtBo+kMC+oSbgE9tiEjP
         uxTdBITrR1u6v/1G49Vhv+LCnuk4F1LicCYK74LdyRzqI/0HkHNPJMkR4kK4Odev/PDg
         7lWA==
X-Forwarded-Encrypted: i=1; AKwUvByF49cdfATt/oIakkmAR4VSAlhmvJqz4V7kVC6JqDaqazveN3RdGBl/CVI3CwdAEAaTMOgZukbeSLoRvxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmDpMTQA3JQQay1FKKaVQy/r47pRQVnkIFuz6IghItdWXvtTwK
	PZHQXUEAvS88QBl+dSElvqDtIfvZ288aNWtLkAwvnmSsXFxttsBKYkWfH7eVjN4zhlDtm/hBZ2Q
	E+CPImz9qO62RleuzSd8i9/TWIGowbs4rpd1ozzcRF6oEReDBm0xsemM+V9qHAgjuDYOm/Ju8mr
	kKMGTxiz2aYnNT+X1v+kwEZNinBy6xsskP5fd5hOmih6AdkIyG3cAhxOUt5hfwWc5MZz1jFl1Ds
	xWzJ0jJ6TTDdPZE4KA=
X-Gm-Gg: AYBFou2dnmWXdKo+md02JFcs6LUhgMpGKqXayItXTm/PgkYRskbWlmzg4UrfKPqMjJQ
	fYJo8iuhQq+AHIudQqxceoj0yFHmg/mCiOgAIopVSLZbYHE5nprCEHDeeOc3rEVSSuzSW3oDqtn
	zIVMTm/bFV7yosI7cTuPDZzjzDsU6twzFhxaowk7lfo6qXR0+nPPlvOR0u5dAWYWRIu6gbCjdI3
	rGZZ8JtgiND8424oiXxJu5NgKp5lkEA7YMak3sQu5C/2KAbxQS2pwaK/TcApqk1R1O/7TMAlYe7
	rzHpLzqv5VwCZ6OYi7NKgFHSmvD+6vtsL53CI5WwbbpRieXeXwflmniLQaHQefs2Mf0OlvhS5Uw
	/tS/yUQaw3YA/cIs3XltzB/wDwNMzWVjItvCcECbbeHKg5TX2nPhS8zTsopvm7rNd3F7y3uQcyb
	A6M0M323q7ogBRlFfZUjrVS3pMbAvbL/T7J3Rg2w5pCjP0Z3WiO98Cae3cQ9VSQZOrN2pyUyrMi
	RK6wEkBm6lAncL3SeM8LcoAONPxPlwBmdm2tEwGdttYQubKRxBe2WBbYi/0yNK7
X-Received: by 2002:a05:600c:811a:b0:4a7:a309:6b73 with SMTP id 5b1f17b1804b1-4a7a3096bb7mr12028775e9.1.1793032831444;
        Mon, 26 Oct 2026 09:40:31 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm205961655e9.2.2026.10.26.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:40:31 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/vc4: hdmi: always cancel the scrambling work synchronously
Date: Mon, 26 Oct 2026 16:40:27 +0000
Message-ID: <20261026164028.78792-3-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026164028.78792-1-lucas.tanure@neat.no>
References: <20261026164028.78792-1-lucas.tanure@neat.no>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The scrambling work re-arms itself every second while a scrambled mode
is active. When the output is disabled, the work may be executing at
that moment rather than pending, and delayed_work_pending() is then
false, so the cancel is skipped. The running instance finishes after
the disable, sees the sink report scrambling off, writes the SCDC
scrambling and clock ratio bits back on, and queues itself again. The
sink is left configured for a scrambled 1/40 link that no longer exists
and the work keeps running until the next enable.

cancel_delayed_work_sync() handles both states: it waits for a running
instance and blocks it from queueing itself again.

Fixes: 257d36d493e9 ("drm/vc4: hdmi: Add a workqueue to set scrambling")
Assisted-by: LLM
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cc46036f11d..4a386e053d3f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -843,8 +843,7 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 
 	vc4_hdmi->scdc_enabled = false;
 
-	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
-		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
+	cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
-- 
2.56.0

