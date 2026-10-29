Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269114;
	b=zv0Gn4MH6oE7TzMWIl0T3GSRH3efdF1hKtJmj06xdwetSPCZ3itSb0+71NK3Zt0C6Fux
	 QZ0igqlCfDu+yYTkdDXYDqmVJlSIF9tFb0ivPYsA4P9us03scbBq+ki4Q/BeOecJnsXA4
	 MYhsOLQC7dawEsOzNTq5PH6slAdcM215qdT8pYiEA0a9US7EXnVVMzs6F920ajjgQI0zo
	 Bq4aFLDpZGLdLoyqtj/XNHnI6ET23jRMc6yl8JmNjTpvYZ0YyWn9n4FbRvgZST3MZ0S3r
	 fRoKaFJo4EFIMj74QtcsndFSDTHokCkHTVW27HhicYZnnvxQn76fqFXN4le+7l41JQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
	b=oCd2flpb+XEl2wAebiUgWV1ILsgMFb+D8+rQgfD+OWuHFY2AVnH/t2QOItEpCcUTO3PP
	 Yj660MScleLD4rKBP9VdGpwDBDJLY3lvW8OPop/NRJVTD3QxmEMcR8iLyrKHxcM2ZCG/V
	 +XvB9H24q0RhVHEHyQqV1uutwJyicPMng9QY8CaFgvFi0L4QbLR9Wm1uTInsWO0yLbsw8
	 WIr2iYt5ogzkJlv8+fJxUx1EiyRzaZRzNWxXBaiAofgzZXaNGPa2bitdEgtlNPptbifP0
	 fWVWc3d4T27So38PWWNe670231xjoMGuYG181eVt2Ehw6S2gBSPRBQoLS5Etn+5eZGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oK9UURDb;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE56606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE56606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oK9UURDb
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3275637a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269112; x=1793873912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
        b=oK9UURDbtj5cmbigIdvbfw8F70F/hTthBA0hn89n66C+EO4qlOBLzGCG+3s3HYT4Vo
         nfdgjsIWTdGS44HdzAgMPe1KeDd9QoBNsbQ4n44pQ5F31KU0RnswUK5Vei/6QNr6DhhK
         +gZYSuJw0OfzAVBt1Two0XPdj6eA5R10LqAOmjdMEf45GXw5cHfp2pnHTOjULc5goUpa
         VCPqMHPhQHKK5/9EAKpvwOgXZG9wBlBf/W9jlwDw7/beIg/Ai1N+wbl+TBn2Pij/qT7i
         XkgiO4TESp0/8OJy1qCxY4UIgy5KwgtSETvZgqMlltjlGkJYuPpA04cinfRENoF60Lgs
         m83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269112; x=1793873912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
        b=k3StfvDn1haYK1O6Y26xeuTMn7eZYjV+f1pnOadHezoyb3qy1Vn/mtyiy0J98nuJQ7
         NOheWLkjuuv9rEStnA23TBq+bFU+VpgqSH9eLOl9CEA8ZyDI0fTDsVxrYateDn4vBUfv
         jKAkEDxINTAI/aVUoGeXkSPu9j6j1c8FljiGRwbmkgbfZF8UbjotkOJ5WWuIRcHdgQCr
         EKAADc7YNrzn8V3I4XbYgzLfZ2akidDLjw7dw5+Eoh/ELmOMJVL3MfMgeXgDpHHCGjtH
         2G1BfDnpqPPXFLmXLK+Xq31UrTrxIXjgGbPd53vrylYa66g/7fIyKTUCRSIl6pZdAZVi
         +VbQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9pLy5htkUrtmUl63qFRDPdIdWClj5Puj3U4cGcDG4uSY2y0UU4Y2/Fcae9iXV6pi0VgdNigmfcBN38ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8urweYrseERkNl6gaATbNHaJvPMdXyHAOsMit/NZDzfeo/PSH
	sK2PJraSpa77gEZwwFgAz+DfaALM+jCdUroS8YsbpQOKqswQ0DnDQFDz
X-Gm-Gg: AYBFou2Vov+POwIITwDsHTuzDq3tKhe2CNC61OXOOT8iC9gNfhOqGi+1KYbEUJt2jQc
	8x5ckwEK0mZWwYPywzwURmNJixiq0NNKvgaHaEci1fNaCkzO2+qfwEhFA3Cl9wLmpPlDMn1fzmy
	OAXHaCqQVEUDnNnEGdHbHjoWurDJLqbTS/X++iO7M2hfj1xbcgk0TWuXpdRC4V5ocs5SqrOeWbK
	QAMTFRWcn562j2NXFAi6f6gB3d5uIbPbbSGn9giG1tVnp9mcfmlUPz9QLR49IppR0uAVHRftOQv
	B4PBDsR9LZhlUEikjGzenzviTRiKH/MCrYjMiIdNU6w/t4NgKAXBzhlFAek2n7iQBoAU3/iUlIr
	p4h+yaQduGW600ptUJ+i27JaUw55lKswjEU4Q0jG/z0SdfYo77rGB7CjF2eAeeyTtoa7JZ+Ym0N
	LgcTUjiZe0BkmFMDEMz8QRY1UDWyuN+Q6KeuVMDshuGmgdnuKRpLerU3SVBnQODxY0H8kBKkcAE
	qcIfEopKq28QrEBSmlqOqi5Legr+RzjgSBVYNazwqDeeXoSDoVEHYgGOhhAUscHhupI0SEm5XmF
	fKfbDFtun6umo12/P41BaGasl0oC5rr6ermttv22WVMx54XwCrMwX8mZ7zd8EpM=
X-Received: by 2002:a17:906:ef03:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c49bdf32b3emr416211766b.30.1793269111958;
        Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:23 +0100
Message-ID: <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
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

Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f47717bd1..8cab9a3e6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1375,7 +1375,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
 	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(dpcd))
 		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
-- 
2.50.1 (Apple Git-155)

