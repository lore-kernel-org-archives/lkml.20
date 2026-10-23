Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787991;
	b=JmQO+u7YNKSGnjBPYGoWtpD5Zsvfxj3chC0NL3N5fMfQ2lDMqnqPvZ2MKhhJn1UKLJhq
	 fZbtTPk5NVDP5/2eoUCRQF1R6U/xieWWjDB4qJKQfi5SKFwnWCqWANe1sRs1QLcDPYucM
	 VMLfxze97kjB4QcUDZR0QJfKeluPDUaWXB1muEUGMAJiIG+i0RDfEIR1DtkyfdNMGH5Zq
	 9xi0EzEz+GBb2KjoZ5cnBg90UTLtwXdnoDO8NMj9nz7peRNAACEfjrK6ILhNNX+yB5JZS
	 5LODrCFxY1UYgmS0ub3OwnLFPqxfomXzg4vqPNI9XKZuzcpOMtsOmwCB+JGXYjYUXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zycCjxv2CNNe8n4xUJOwPUmsm9jviG0vLy1To8XxyFA=;
	b=F3uFFpz4rV6r0ZGlK2MrpkJcG/y169o4E6IZAYmU8IJiyDNuBKD8nZ8USh4bm0sUr7wp
	 enyTD5bw429Ac7989mAHXyuWutyoGMPH5+Z/UQm3mLDx9w7bWj3AVHB9vYusSgwjWRUHr
	 HjrDytHXi/VMw4yW7rn0vR7sV7+R7b//GiCzhMjetFqOYeXZRP7Su/Ph9I+V8CLc1bSjX
	 G/PGZ1K9KVqjJuTRE1uQkhIopF0pNfJRcTktZOx2POxSubgYlCl1ubADNrwNwTii+xLlT
	 KfsVvvnGM2R3v73tEk19U0VvVUpZNnmuO+lJAYlfQ1JXa1zE9QP/RjdGJL9GwWfrAeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PShuzM08;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7B606A338
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D7B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PShuzM08
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363316fa0cso15588321cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787990; x=1793392790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zycCjxv2CNNe8n4xUJOwPUmsm9jviG0vLy1To8XxyFA=;
        b=PShuzM08NYnBVugZG1M39R2Q15QDphd1AhmdDlf19o8G89Zn609vGKZLIdJfGDH8jv
         WMAQPLTcckEAqELcfY0gJx1pU+Ja5BuQEJOvm4eVYCYYUhFqg4yS3BzXQpJem/yo8vDO
         8BiUXjU+Ki6M3aLqmSx5to9VworxAvGi5bZn4d7JEh5+P2KPYw7MRQTpQX8mAmAS5kBW
         APA+cZqinip2Z1jhcAk/mQA++OiHETGY/AANfddNWL2DyqYknmm2YZwhPMTaBXOmFhb4
         ZEADr66dWjNkkCBJFXH50fKZmF2w88b7nymzFMIJw8VFDR74qC8X+e/KPxv9/7CM+tWX
         efBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787990; x=1793392790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zycCjxv2CNNe8n4xUJOwPUmsm9jviG0vLy1To8XxyFA=;
        b=2TTNElOvxGebV5zOKeB9Pp7iYzUjlTqhunaSGIDT3J/xaR5eckBcu/nh1TcubkUcXG
         H900QqndIZoWSBNI3FGHUKOMwOYFrWO/TXpv/UtfKe5FPNvzlsGC/TcY4TQW7ohanKU5
         gmYgNNtSkxJVnuzdQmDeANBkthG6cz7Nir8QZ5rsPvI9aq6NgWM3M7lwNAVb/leKHbvs
         3ou5zz6f7QJ6sBcyApt3CSNwMXz6cj4/HS6a6w9K06jN3WJ29UC77FIZVjk+9UrMw7qn
         mzt3XJqEfskSC3Ve3q7YqSRA8cCa8LpBXX7ocboql4okqKD2vke/RlNEAnZcNnDTTHDu
         UNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTB9tauA0VtrNik9tk4dBQLxzPR3zqqodYPRl2DIqVivSQYreEYaWqVTG3r/rj3kewFR8ANjbGki9UPnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIUyUdjBbEVwjkuyv679zsg93z0ut8+thAYNVj4L2xJ/8XaPbx
	U4gI9VGCjNndxbeFQhX9Y9EWss0aw/iEYkJwfo7318N1Pbew8Y3oxT/f/0kW38qdqO4uN5vXWna
	ou5eUnrQ=
X-Gm-Gg: AYBFou0GonVQgCm8Xau0grbheTAotQAoBu/2IRydfqEcyDwDajaRig4qCAB6TTgBo1Q
	k1ZLH4ouIXWeGBwLpGgewsTwC9IrTnB0wGrGgzFKa0F8e1VYVSsfLxpNNWdReJAbZLLRNka8I2M
	dm8tAJtTfLLLWhyPLihiaiCaAyf1IV+zkpZRV6BwZIIHBpOhIaBoPYOZ9ivI5BixDbAMs61uAOZ
	tMyBFxIGbhEf7EfrblcdlyrAHcEhrtkoRrQb16J8eMQ+XqFqIHxkdZcKMkBBC3PUapukIai9bXf
	tAQTVGkXk7/0zGBCot49ESOndvpZUk/rrGgOnckxZOo9cyvYRd79FnAMDEStFQgv5SV3UAraEzT
	ZPiYObIOyBHHyow+BMCdh4ZRsFumQLGTt7z6Hmq4DSj8vDPQWZzGQJu1B+2s91TBf/YjUBCA/gU
	/6/VByVqy9dS0ZYUepnQkSi+urUmXVRIAfg4/qWn9u794xf5ZJPb2YBZsGa6MIsYSkOVkm7W42m
	bgmffyQiO2yXPcJKwVmuZilS6cfHciuf96f1TfHUTpe/dxF4+nRBliYnHjGYvQAiGh8rE9s
X-Received: by 2002:a05:622a:5b0d:b0:536:575b:8dd6 with SMTP id d75a77b69052e-5383af13431mr1476831cf.0.1792787989623;
        Fri, 23 Oct 2026 13:39:49 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf2dbfsm2894091cf.2.2026.10.23.13.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:49 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 20:39:33 +0000
Subject: [PATCH 4/5] fs: make FSCONFIG_CMD_RECONFIGURE killable on s_umount
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-s-umount-killable-v1-4-844a341ff1df@toxicpanda.com>
References: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
In-Reply-To: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=1034;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=BP0NwMux0c2tHlAlY2QSjhRjlwIiohWP6FQ3yScjWTY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGj8XMlYRyVtG6OJBzEl9Z6MzuvDHDsPof0uauekz8fiGcM2plJfBNIIySdcM1GQIewFjqDM3uE
 ZImmBM9iJnAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

fsconfig(2) with FSCONFIG_CMD_RECONFIGURE is the remount of the new mount
API, and like mount(2) with MS_REMOUNT it waits for s_umount in D state,
can't be killed, and keeps every later reader of the lock waiting behind
it.

Use down_write_killable().  A wait which is cut short is treated like any
other failure to reconfigure, the context ends up in FS_CONTEXT_FAILED.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/fsopen.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/fsopen.c b/fs/fsopen.c
index 70024870fefa..c139cec2f1fe 100644
--- a/fs/fsopen.c
+++ b/fs/fsopen.c
@@ -267,9 +267,11 @@ static int vfs_cmd_reconfigure(struct fs_context *fc)
 		return -EPERM;
 	}
 
-	down_write(&sb->s_umount);
-	ret = reconfigure_super(fc);
-	up_write(&sb->s_umount);
+	ret = down_write_killable(&sb->s_umount);
+	if (!ret) {
+		ret = reconfigure_super(fc);
+		up_write(&sb->s_umount);
+	}
 	if (ret) {
 		fc->phase = FS_CONTEXT_FAILED;
 		return ret;

-- 
2.55.0

