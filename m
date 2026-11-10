Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316534;
	b=I01Cc8ewD+rTR7kKmkGDwqktB2xDv5dlJQWXEEbwX/EWBYEVg8GMgUd5enCltqyGmKit
	 PE4zQ1QGdpM+UyzjhHCPvq+mz1I6Ok3JMTF2N5OWPZkyyjVF4D9ZmOc20cAK2f7qAkuXz
	 FOf/FwtFZbgrAdkva0Zvrvd9e+fA+TOJHorhIlIkDAXqpY45SrSOih5ZdtbExk3HE2iK4
	 pk0vbL/6PHaRJOJF5nwFntYytRIxSj8f5bhIp96zTa9hAfZjlskjtqV0AHzVUR2jhit5n
	 4TQ3ijFc1nTL2eIdhM16hrgVlQFU4coYHGNVzw30Sp4Rm67QpG+47kd6D4+ET5ns0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0V44FvUiKl8gCxdVxr4jy7rtjbf/nRu5WgYEJWTezPI=;
	b=ItJ1zbVfyf0dtQ0Z+N0A6eZmLuR18Sz5XOgyzP9SUtaY3sPeD3dXjPVgrZltCBMOjbAe
	 qIdZqtwjjKCdKmlEEPngHCGJJTlQoG6w5kGeMrsMnYtsrMfZl67gFeLoN9nR0S54kBZyR
	 DG/GWxXxWVGRyasgAeXUbtxYoBDl+eoCfu6jYV+acEuS6yx+0HcXvR+2aZx82rGVErGf1
	 S7a8zKDQC93krsZAwt6s3v/4y+SHgRuPZoIyZMV6sgB5VIdkcLCY+Kr5sz7xAvmtnrR/I
	 R9sTufldczFSYpuj9YbTKe6sDVyJ9Eeh59elSSGMXjK7XOtcz14LfIPE6smUu6B4Ckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIwujdfv;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D89606B6C3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D89606B6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIwujdfv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso761718a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316533; x=1794921333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V44FvUiKl8gCxdVxr4jy7rtjbf/nRu5WgYEJWTezPI=;
        b=AIwujdfvs3RnyCj0MIpoU2cbm5XfHaTGIHAUgC5cQgP3ET90aWbX4IUCB4KhtgSYwp
         7WOsQW7uAoQ8hNRKSC5n6E+wpy8kss5shxItrNdv5kJg5NzwwDwqAYaNrETwkJQ78enY
         LiMZ4Y7cqXu8srmGsPEO1zVsWqzp8NeUEd30Qoa8Rg2stxrFywVRscpRF/cXwwpKsHfp
         KYApnyh/OOzTsti41075YcEIRjQX6Ooj/Hxp/EF/l1j3PhhU+WkvwX89aUSFsgdZZnjD
         xUZxrpyp6d5bWCVyK+MV1SHVKfH3nEkxQob6bCpP1oX+OLOcSNGZtzL+w2PUw0m7t2EN
         8BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316533; x=1794921333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V44FvUiKl8gCxdVxr4jy7rtjbf/nRu5WgYEJWTezPI=;
        b=YIU044g1Xhj/XCYRYlktQuMLy48mQRp5SXHCqa9ja6WGBu0Rwhd/9YxtGYNzT2AEP5
         5+A+a493Wr3l4Rh3XPdbA/fx4JXfol8wpW9YCETcsxc/qhwUrwFGTTuiDt6Cc/nlBX+N
         HfD1dCXutCP2tAVEx2NKzfnc3ICPJZTw/gwd8pa3TOXy9BwZSOQDOn+AJdC7AGN7lnDI
         jWlBGGBCcMq+fDV+NPnKLlIYlxuv93YwcZ18t+BdiLCMI0KylTv5KXqQH+L2HTxaqQul
         4yjzLSKOxuGKAI82XLAxoVGvCRRi1mVXJiBQx2XLNir2O14tYekH3PL94WcqzAl4BoWg
         o2jA==
X-Forwarded-Encrypted: i=1; AL+hErELJRIOajx2jnt04MoJNmwd2aQS7gzOEWup16OaSfW41mtwreOz0hildVb6KSiRycGXjg99QoB3tVzU4LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PtA3UHO2J+iB5drR2w8RyVxhTy5IeDjKkh+THTijQgocXVFUR
	o/CZEOkoCMCKDIyM7e8jGxc7kiXI+qPJhkkGU5tOmY8L108eZIVlssYPE0H7zz6Bg+I=
X-Gm-Gg: AYBFou3ofSYCIvndptv4BBIVY8ME2VfXsrj8SYCMO8mWOUcQ3l1FIOEU4MMhJA9oCHl
	E3nulBycEzCnFkxeOpa046/+Jj3XxMI2P+jMMQeBk0KekV+FiU5qiNE3GqID1ELGRTM/7R8vHw4
	/CYudMFkqYsMhaknuuejE8rhXKClMMWEJ+jDXekYMbFEItXa9lz/e6c/vN05fg5KdDGwLOIRmQK
	xEZPCx35oq+fhtMQYMaVA5ffJEr924J4gj8ecdo2fznFzFslEoefOCCGl7LnbMHXAbU8atSJBWO
	7ghipN3LPTh/9MFfY2AS/SkRitcBgdiJG0tNjShf72wo3c7cE+yB4k+yZ1vob5DvHd6ogS/A8Ir
	UN3aP/JrGV38pvA08mEK0dJ6JMkcImfjKG4JnmLiGriRFNcNr9qGo2ZzOlDb4C5W4iAcsVL9NyP
	zL0tg6grCnTCnvMdI6Q/Ih0g+flly+cCKypUYnUYKznVLBnHS73M3zzfP3KjPiAj33DdMNPkylD
	L/WzvA70pn0LFUCOLMZPqV4GcXrT34mWK9J/yr70CekWHBHCZPdNC6FdmfLNaExznnIzi0mK0dv
	x4QED6IE5S749nifg1LjCprZqyxiywXuKiJWnYPKXBAyO1y+4ByTWGmv82p3fdDtMH3cX6Becfu
	M
X-Received: by 2002:a05:6402:2047:b0:6b6:f881:b6db with SMTP id 4fb4d7f45d1cf-6b7565f8de2mr1387154a12.11.1794316532608;
        Tue, 10 Nov 2026 05:15:32 -0800 (PST)
Received: from desktop.home ([46.205.207.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1126372a12.31.2026.11.10.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:32 -0800 (PST)
From: =?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Relja Vojvodic <Relja.Vojvodic@amd.com>,
	Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
Subject: [PATCH 1/3] drm/amd/display: Apply requested TxFFE level right away in FRL training
Date: Tue, 10 Nov 2026 14:09:54 +0100
Message-ID: <20261110130956.160024-2-andrzej.piatyszek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
References: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
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

When the sink answers an LTP request with 0xE (next TxFFE level) in
LTS:3, hdmi_frl_perform_link_training() programs the new level only on
the next poll, and only if the sink has set FLT_update again by then.
The sink usually has not, as the driver has just cleared FLT_update.
The sink keeps asking, and current_FFE advances without reaching the
PHY.

A Samsung QE65Q80T (2020) needs one TxFFE step at 10 Gbps x 4, so its
link mostly ends up at 6 Gbps x 3.

Program the requested level right away and drop the deferred
programming.

Fixes: cbb8e2044b9e ("drm/amd/display: Add DC link support for FRL")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Andrzej Piątyszek <andrzej.piatyszek@gmail.com>
---
 .../display/dc/link/protocols/link_hdmi_frl.c | 33 ++++++++-----------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
index 960f18fe2..78e62bfec 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
@@ -640,26 +640,6 @@ static enum link_result hdmi_frl_perform_link_training(struct ddc_service *ddc_s
 				prev_flt_update = scdc_update.fields.FLT_UPDATE;
 			}
 
-			/*Set TxFFE = TxFFE0*/
-			/*Program FFE_Levels - scdc_config has this field at 0 */
-			if (override_FFE) {
-				if (current_FFE == 0)
-					dio_link_enc->funcs->prog_eq_setting(dio_link_enc, current_FFE,
-							test_req.fields.TXFFE_DEEMPHASIS,
-							test_req.fields.TXFFE_PRESHOOT,
-							test_req.fields.TXFFE_NOFFE,
-							link_settings);
-				else {
-					if (scdc_update.fields.FLT_UPDATE)
-						dio_link_enc->funcs->prog_eq_setting(dio_link_enc, current_FFE,
-								test_req.fields.TXFFE_DEEMPHASIS,
-								test_req.fields.TXFFE_PRESHOOT,
-								test_req.fields.TXFFE_NOFFE,
-								link_settings);
-				}
-				FRL_INFO("FRL LINK TRAINING:  TxFFE = %d.\n", current_FFE);
-				override_FFE = false;
-			}
 			if (scdc_update.fields.FLT_UPDATE) {
 				offset = HDMI_SCDC_LTP_REQ;
 				link_query_ddc_data(ddc_service, slave_address,
@@ -749,6 +729,19 @@ static enum link_result hdmi_frl_perform_link_training(struct ddc_service *ddc_s
 					ln1_pattern = pre_ln1_pattern;
 					ln2_pattern = pre_ln2_pattern;
 					ln3_pattern = pre_ln3_pattern;
+
+					/*
+					 * The sink re-evaluates the link as soon as FLT_update
+					 * is cleared, so program the requested level now.
+					 */
+					dio_link_enc->funcs->prog_eq_setting(dio_link_enc,
+							current_FFE,
+							test_req.fields.TXFFE_DEEMPHASIS,
+							test_req.fields.TXFFE_PRESHOOT,
+							test_req.fields.TXFFE_NOFFE,
+							link_settings);
+					FRL_INFO("FRL LINK TRAINING:  TxFFE = %d.\n", current_FFE);
+					override_FFE = false;
 				}
 
 				FRL_INFO("FRL LINK TRAINING:  Setting Training Pattern [ln0,ln1,ln2,ln3] = [%d,%d,%d,%d].\n",
-- 
2.56.0

