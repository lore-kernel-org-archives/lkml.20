Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868264;
	b=XyyH6JDw/xnB7n4xdeDS5KGXFi0MLU+8DuWQIWSUTNvA6PSMVLvfZ4L1WxgTBhDXQjwU
	 XGC+0UENSpVlrvyJrG665J0i7YWw1Njye/+uOCGJo7yqnTeriqm9eLs7S995PC8O+Oc29
	 ZiJnm9rF9KF8uK3GpzB7eh7XCxI7j/yyqJkBgkDZpxnU+M+AeOiB0W9cB/RoeCetH6WuC
	 UQaxYmztNRCzcEIB6bYqlugF/jqBO0aRwEbpxsrlPI7ir6KIYtZbEqy6jtgKIQKcIpS12
	 OYEWMxKtrCLZPi8Iu1IwNOGl7csdGKbKylV5hXRZT6FEsCt7ftN59FwtWpA/l6yZM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L9Hm0XCEtvtTUiqgp7VzX4Brq7t6cHGyCZjHDcneBEU=;
	b=sAWrcutkPbggT5cdYEDcCLHdjVomzaF/qLTvhZxNuQW3WxFyKUTBKwmL/MEr57dmhPEl
	 pI8Ugjwf3nJafGWCahy3qXf4FuT7tY5n/y9NOw3wx9scirruWqVFxyqhZP9Wtn2IBDM3Q
	 23bJDeXFaBsn9Egq9xuy0MSeFg/gnu0UzaqfstLg8fDjz/Vtru3xS7UwkJCzrY3YsKIjn
	 Q4VqgsBI++OWVDS8vz2S8Qt+F+XtHmjMlBBwvgKgFumcoF2OlsWK5a55L2eDBuPGsB4jA
	 sMO2F0DCsLxYAlBm3L0qvFEId6Kza9YD+ahVxlA+L5WA8MuBeubOYl+Rb1aJW8xGaYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAhkuHZa;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48E606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B48E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAhkuHZa
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f3e9e431so96788eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792868262; x=1793473062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9Hm0XCEtvtTUiqgp7VzX4Brq7t6cHGyCZjHDcneBEU=;
        b=DAhkuHZalWXcMpZ9dxg9lsJge4xyEDUk543ipWNVkD5AxFmUCmqBlqJ3V3rgVOWFQ5
         wk+kEZFqj7pjLGAMzZ2XovcKqwo5c/Uk4UOAzbldq3fboSmLYzy6rZsszSzpzKlym88M
         a6+HtnNJbpZOg6TX1ai+zgGxR4mfhHvnp5UyUMSOtCnV/2hZi7ZkD6uvuVmM/+nFltLp
         Tbxvj/fnQC3cDlm8tz1Mn005iOLdfRI5oGvoVgMl5aR4Z8yNKtMN4MPQRpJrJQGoNH/Y
         MggfwVEpSmCjZthfY0YCyYN3i9wS1OGfVD0NTCUJRzEZ4sYCkBA3/aOkNd166Jg79IcR
         xMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792868262; x=1793473062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9Hm0XCEtvtTUiqgp7VzX4Brq7t6cHGyCZjHDcneBEU=;
        b=fLa8WloAcoWrVefS++cBFfZCAJje1WJX+XgsJoLyZoPlr7TL1oxIVomtWQayFlSnjV
         VArJ+paGLlUhIu+jnsvQQa7j+PqAHHSAq04Zwqvdtbfrc3puJFlf2c1dzT3lVpDJP00S
         zHqKjWxw47ZWKneGBQlQVnxVrhB9SM0DJlk5PXoEEi0xOIGn6iFHcUXR+Nq4I0CmEkOM
         pTlT0O9AIVC1fvWJ6p2C4o1LTxnBC89qINe821148bkFDI3KIN5D4SAHgzhMaBcuVO7z
         NkM/EuOB7Di+3nXy29v7aeHWFrNxHgiMQiKkipBp7mB+trl4FxNDKNO4mnb9M2ANNSR8
         PqkQ==
X-Forwarded-Encrypted: i=1; AKwUvByl13DC+nGk3PUzRGutE4RGkYj0a2yU4OVWOPbqs2DQbhbbs5xJr4n1m9VpWXqrOtkKE8/K5A2ycx7JoIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgFkFU2RRBWMOoLhD2whiCfBjSRGNRS1lolL9s+dHEaklPLWyl
	pOM6JyaIzTMd1V4+8W+ECe/UvT4DpWvM7hI4tqHSJwX3tjDUvDdWPgZ4
X-Gm-Gg: AYBFou2Jc3ihny62+sL5XBXYI5z/AchNVUsl0p4JjSz+y2Z3TND/Nir2C8GgUOfcdFw
	LpsUQZVUngiAOvf82ZJvis4GyA0dNRPiKiHTgOTOtVlkjenF6uh8d78CHUfiLh4Jz7bISSiRM+g
	p9D6tsvQ+bcrlXkzkNIi8PR9NNACg8yWEgy0wxhdfeBz5cpv0z69fzx2Wmo1hGD8x+QzJe5z4am
	2upVocqt973qpmZPS42ysFfbfM86A9ahOUpRRLQGXrXjtWr9hP1bcHTibR8OIOwx+Vag04Hn77B
	+xwMieCxMyDw1GNO+4AHioMY6SCmtelfZS47AeQo8Ll/6O2G+aZ+wFplqq0rq8hiUCHBRHwBh9K
	CaMP0QKD7JdxBNxSLaIKolGG/jAujvfkaCzqnm0z/HVcRu4nND4nA2uAWDqdbicZ4XN4BGSFowQ
	S+T4+3REJ3GPMavFBF4dArzT1LRxzOR1hNMml5BE3KmVXhIVkR8SdEh3vJjyLpvBnrXXr81l8C5
	p0qyt5C9VFFh3MILKI2WWnRyys1soQzjsDNhLktbitKaXB2bAm6yJbp5mOowFWZ
X-Received: by 2002:a05:7301:4615:b0:363:a45d:10b1 with SMTP id 5a478bee46e88-369e8483999mr3797146eec.5.1792868262040;
        Sat, 24 Oct 2026 11:57:42 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:b2dc:5d97:34f5:f1e6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm1178226eec.15.2026.10.24.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:57:41 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	vireshk@kernel.org,
	rmfrfs@gmail.com,
	dtwlin@gmail.com,
	pure.logic@nexus-software.ie,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v3] staging: greybus: Replace format specifiers
Date: Sun, 25 Oct 2026 00:27:30 +0530
Message-ID: <20261024185730.164467-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use the appropriate format specifiers for signed and unsigned
variables to match their types.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v3:
- Rechecked the format specifiers using additional compiler warning
  options and identified further mismatches that were missed in v1.
- Corrected format specifiers for signed and unsigned variables,
  changing %d to %u or %u to %d as appropriate for the corresponding
  types in v2.
- Included additional format specifier corrections in audio_codec.c,
  audio_topology.c, gbphy.c and loopback.c in v2.
- In raw.c, removed unnecessary int casts from payload-size
  calculation and changed the corresponding format specifier to %zu.
  This improves consistency and readability, as suggested by Alex.
- Omitted the Reviewed-by tag because additional changes have been
  made that have not yet been reviewed.

v2:
- Correct format specifiers for signed and unsigned variables.
- Include additional format-specifiers corrections in audio_codec.c,
  audio_topology.c, gbphy.c and loopback.c.

v1: https://lore.kernel.org/outreachy/237b20f5-3354-49d7-add8-71170d450306@linaro.org/T/#t
---
 drivers/staging/greybus/audio_codec.c    | 24 +++++++++---------
 drivers/staging/greybus/audio_topology.c | 32 ++++++++++++------------
 drivers/staging/greybus/bootrom.c        |  2 +-
 drivers/staging/greybus/fw-download.c    |  2 +-
 drivers/staging/greybus/fw-management.c  |  2 +-
 drivers/staging/greybus/gbphy.c          |  2 +-
 drivers/staging/greybus/gpio.c           |  2 +-
 drivers/staging/greybus/light.c          |  2 +-
 drivers/staging/greybus/log.c            |  4 +--
 drivers/staging/greybus/loopback.c       |  6 ++---
 drivers/staging/greybus/power_supply.c   |  2 +-
 drivers/staging/greybus/raw.c            |  6 ++---
 drivers/staging/greybus/sdio.c           |  4 +--
 drivers/staging/greybus/spilib.c         |  2 +-
 drivers/staging/greybus/uart.c           |  4 +--
 15 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..24b3317f7540 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -78,7 +78,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_STARTUP;
-		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Register %u DAI\n", cportid);
 	}
 
 	/* hw_params */
@@ -95,7 +95,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
-		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic hw_params %u DAI\n", data_cport);
 	}
 
 	/* prepare */
@@ -116,7 +116,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_PREPARE;
-		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic prepare %u DAI\n", data_cport);
 	}
 
 	return 0;
@@ -146,7 +146,7 @@ static int gbaudio_module_disable_tx(struct gbaudio_module_info *module, int id)
 					    "deactivate_tx failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic deactivate %u DAI\n", data_cport);
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
 	}
 
@@ -161,7 +161,7 @@ static int gbaudio_module_disable_tx(struct gbaudio_module_info *module, int id)
 					    "unregister_cport failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Unregister %u DAI\n", cportid);
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_SHUTDOWN;
 	}
 
@@ -204,7 +204,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_STARTUP;
-		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Register %u DAI\n", cportid);
 	}
 
 	/* hw_params */
@@ -221,7 +221,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
-		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic hw_params %u DAI\n", data_cport);
 	}
 
 	/* prepare */
@@ -243,7 +243,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_PREPARE;
-		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic prepare %u DAI\n", data_cport);
 	}
 
 	return 0;
@@ -273,7 +273,7 @@ static int gbaudio_module_disable_rx(struct gbaudio_module_info *module, int id)
 					    "deactivate_rx failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic deactivate %u DAI\n", data_cport);
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
 	}
 
@@ -288,7 +288,7 @@ static int gbaudio_module_disable_rx(struct gbaudio_module_info *module, int id)
 					    "unregister_cport failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Unregister %u DAI\n", cportid);
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_SHUTDOWN;
 	}
 
@@ -414,7 +414,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	 * is supported, validate params before configuring codec
 	 */
 	if (params_channels(hwparams) != 2) {
-		dev_err(dai->dev, "Invalid channel count:%d\n",
+		dev_err(dai->dev, "Invalid channel count:%u\n",
 			params_channels(hwparams));
 		mutex_unlock(&codec->lock);
 		return -EINVAL;
@@ -422,7 +422,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	channels = params_channels(hwparams);
 
 	if (params_rate(hwparams) != 48000) {
-		dev_err(dai->dev, "Invalid sampling rate:%d\n",
+		dev_err(dai->dev, "Invalid sampling rate:%u\n",
 			params_rate(hwparams));
 		mutex_unlock(&codec->lock);
 		return -EINVAL;
diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..cb05e235b1dc 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -199,7 +199,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
 		strscpy(uinfo->value.enumerated.name, name, sizeof(uinfo->value.enumerated.name));
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		break;
 	}
@@ -260,7 +260,7 @@ static int gbcodec_mixer_ctl_get(struct snd_kcontrol *kcontrol,
 				le32_to_cpu(gbvalue.value.enumerated_item[1]);
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		ret = -EINVAL;
 		break;
@@ -307,7 +307,7 @@ static int gbcodec_mixer_ctl_put(struct snd_kcontrol *kcontrol,
 				cpu_to_le32(ucontrol->value.enumerated.item[1]);
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		ret = -EINVAL;
 		break;
@@ -655,7 +655,7 @@ static int gbaudio_tplg_create_enum_kctl(struct gbaudio_module_info *gb,
 		return -ENOMEM;
 
 	/* debug enum info */
-	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
+	dev_dbg(gb->dev, "Max:%u, name_length:%u\n", gbe->items,
 		le16_to_cpu(gb_enum->names_length));
 	for (i = 0; i < gbe->items; i++)
 		dev_dbg(gb->dev, "src[%d]: %s\n", i, gbe->texts[i]);
@@ -700,7 +700,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 		return -EINVAL;
 	}
 
-	dev_dbg(gb->dev, "%s:%d control created\n", ctl->name, ctl->id);
+	dev_dbg(gb->dev, "%s:%u control created\n", ctl->name, ctl->id);
 	return ret;
 }
 
@@ -861,7 +861,7 @@ static int gbaudio_tplg_create_enum_ctl(struct gbaudio_module_info *gb,
 		return -ENOMEM;
 
 	/* debug enum info */
-	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
+	dev_dbg(gb->dev, "Max:%u, name_length:%u\n", gbe->items,
 		le16_to_cpu(gb_enum->names_length));
 	for (i = 0; i < gbe->items; i++)
 		dev_dbg(gb->dev, "src[%d]: %s\n", i, gbe->texts[i]);
@@ -914,7 +914,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 		return -EINVAL;
 	}
 
-	dev_dbg(gb->dev, "%s:%d DAPM control created, ret:%d\n", ctl->name,
+	dev_dbg(gb->dev, "%s:%u DAPM control created, ret:%d\n", ctl->name,
 		ctl->id, ret);
 	return ret;
 }
@@ -1022,7 +1022,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
-		dev_err(module->dev, "Invalid kcontrol count=%d for %s\n",
+		dev_err(module->dev, "Invalid kcontrol count=%u for %s\n",
 			w->ncontrols, w->name);
 		return ret;
 	}
@@ -1044,7 +1044,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 						   curr);
 		if (ret) {
 			dev_err(module->dev,
-				"%s:%d type widget_ctl not supported\n",
+				"%s:%u type widget_ctl not supported\n",
 				curr->name, curr->iface);
 			goto error;
 		}
@@ -1123,7 +1123,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	}
 	dw->name = w->name;
 
-	dev_dbg(module->dev, "%s: widget of type %d created\n", dw->name,
+	dev_dbg(module->dev, "%s: widget of type %u created\n", dw->name,
 		dw->id);
 	return 0;
 error:
@@ -1155,7 +1155,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		ret = gbaudio_tplg_create_kcontrol(module, &dapm_kctls[i],
 						   curr);
 		if (ret) {
-			dev_err(module->dev, "%s:%d type not supported\n",
+			dev_err(module->dev, "%s:%u type not supported\n",
 				curr->name, curr->iface);
 			goto error;
 		}
@@ -1192,7 +1192,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		}
 
 		list_add(&control->list, &module->ctl_list);
-		dev_dbg(module->dev, "%d:%s created of type %d\n", curr->id,
+		dev_dbg(module->dev, "%u:%s created of type %u\n", curr->id,
 			curr->name, curr->info.type);
 		curr = (void *)curr + csize;
 	}
@@ -1228,7 +1228,7 @@ static int gbaudio_tplg_process_widgets(struct gbaudio_module_info *module,
 		ret = gbaudio_tplg_create_widget(module, &dapm_widgets[i],
 						 curr, &w_size);
 		if (ret) {
-			dev_err(module->dev, "%s:%d type not supported\n",
+			dev_err(module->dev, "%s:%u type not supported\n",
 				curr->name, curr->type);
 			goto error;
 		}
@@ -1278,7 +1278,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 		dapm_routes->sink =
 			gbaudio_map_widgetid(module, curr->destination_id);
 		if (!dapm_routes->sink) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid sink\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid sink\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
@@ -1287,7 +1287,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 		dapm_routes->source =
 			gbaudio_map_widgetid(module, curr->source_id);
 		if (!dapm_routes->source) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid source\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid source\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
@@ -1299,7 +1299,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 					      curr->index);
 		if ((curr->control_id !=  GBAUDIO_INVALID_ID) &&
 		    !dapm_routes->control) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid control\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid control\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..fb1fbd3f7b99 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 	size_response = op->response->payload;
 	size_response->size = cpu_to_le32(bootrom->fw->size);
 
-	dev_dbg(dev, "%s: firmware size %d bytes\n",
+	dev_dbg(dev, "%s: firmware size %u bytes\n",
 		__func__, size_response->size);
 
 unlock:
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index a0a683447b3d..9f7f68411418 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -148,7 +148,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
 		return 0;
 
 	dev_err(fw_download->parent,
-		"Firmware download didn't finish in time, abort: %d\n",
+		"Firmware download didn't finish in time, abort: %u\n",
 		fw_req->firmware_id);
 
 	fw_req->timedout = true;
diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..ee86ed9686c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -141,7 +141,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	if (load_method != GB_FW_LOAD_METHOD_UNIPRO &&
 	    load_method != GB_FW_LOAD_METHOD_INTERNAL) {
 		dev_err(fw_mgmt->parent,
-			"invalid load-method (%d)\n", load_method);
+			"invalid load-method (%u)\n", load_method);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bb9a5b538e6e..ac77b6a12ffe 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -80,7 +80,7 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
 	const struct gb_module *module = intf->module;
 	const struct gb_host_device *hd = intf->hd;
 
-	if (add_uevent_var(env, "BUS=%u", hd->bus_id))
+	if (add_uevent_var(env, "BUS=%d", hd->bus_id))
 		return -ENOMEM;
 	if (add_uevent_var(env, "MODULE=%u", module->module_id))
 		return -ENOMEM;
diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a982c..7616bcc23c6c 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -379,7 +379,7 @@ static int gb_gpio_request_handler(struct gb_operation *op)
 
 	event = request->payload;
 	if (event->which > ggc->line_max) {
-		dev_err(dev, "invalid hw irq: %d\n", event->which);
+		dev_err(dev, "invalid hw irq: %u\n", event->which);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..1fbd80523d4e 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1221,7 +1221,7 @@ static int gb_lights_request_handler(struct gb_operation *op)
 
 	if (light_id >= glights->lights_count ||
 	    !glights->lights[light_id].ready) {
-		dev_err(dev, "Event received for unconfigured light id: %d\n",
+		dev_err(dev, "Event received for unconfigured light id: %u\n",
 			light_id);
 		return -EINVAL;
 	}
diff --git a/drivers/staging/greybus/log.c b/drivers/staging/greybus/log.c
index 815d20ba9b6b..24f5d5cf21be 100644
--- a/drivers/staging/greybus/log.c
+++ b/drivers/staging/greybus/log.c
@@ -36,7 +36,7 @@ static int gb_log_request_handler(struct gb_operation *op)
 	receive = op->request->payload;
 	len = le16_to_cpu(receive->len);
 	if (len != (op->request->payload_size - sizeof(*receive))) {
-		dev_err(dev, "log request wrong size %d vs %zu\n", len,
+		dev_err(dev, "log request wrong size %u vs %zu\n", len,
 			(op->request->payload_size - sizeof(*receive)));
 		return -EINVAL;
 	}
@@ -46,7 +46,7 @@ static int gb_log_request_handler(struct gb_operation *op)
 	}
 
 	if (len > GB_LOG_MAX_LEN) {
-		dev_err(dev, "log request too big: %d\n", len);
+		dev_err(dev, "log request too big: %u\n", len);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..41a8b4d3b7bf 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -281,7 +281,7 @@ gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
 gb_dev_loopback_ro_attr(iteration_count);
 /* A flag to indicate synchronous or asynchronous operations */
-gb_dev_loopback_rw_attr(async, u);
+gb_dev_loopback_rw_attr(async, d);
 /* Timeout of an individual asynchronous request */
 gb_dev_loopback_rw_attr(timeout, u);
 /* Maximum number of in-flight operations before back-off */
@@ -424,7 +424,7 @@ static void gb_loopback_async_operation_callback(struct gb_operation *operation)
 
 	mutex_unlock(&gb->mutex);
 
-	dev_dbg(&gb->connection->bundle->dev, "complete operation %d\n",
+	dev_dbg(&gb->connection->bundle->dev, "complete operation %u\n",
 		operation->id);
 
 	/* Wake up waiters */
@@ -579,7 +579,7 @@ static int gb_loopback_async_transfer_complete(struct gb_loopback_async_operatio
 
 	if (memcmp(request->data, response->data, len)) {
 		dev_err(&gb->connection->bundle->dev,
-			"Loopback Data doesn't match operation id %d\n",
+			"Loopback Data doesn't match operation id %u\n",
 			operation->id);
 		retval = -EREMOTEIO;
 	} else {
diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index beefcbaf3681..1eeccf452eaf 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -1011,7 +1011,7 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 	if (psy_id >= supplies->supplies_count ||
 	    !supplies->supply[psy_id].registered) {
 		dev_err(&connection->bundle->dev,
-			"Event received for unconfigured power_supply id: %d\n",
+			"Event received for unconfigured power_supply id: %u\n",
 			psy_id);
 		ret = -EINVAL;
 		goto out_unlock;
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 4f1b3f4db404..2d23f6324639 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -111,9 +111,9 @@ static int gb_raw_request_handler(struct gb_operation *op)
 	}
 	receive = op->request->payload;
 	len = le32_to_cpu(receive->len);
-	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
-		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
-			(int)(op->request->payload_size - sizeof(__le32)));
+	if (len != (op->request->payload_size - sizeof(__le32))) {
+		dev_err(dev, "raw receive request wrong size %u vs %zu\n", len,
+			(op->request->payload_size - sizeof(__le32)));
 		return -EINVAL;
 	}
 	if (len == 0) {
diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 3952f3d225db..773ec1f72407 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -294,7 +294,7 @@ static int _gb_sdio_send(struct gb_sdio_host *host, struct mmc_data *data,
 	send_blksz = le16_to_cpu(response->data_blksz);
 
 	if (len != send_blksz * send_blocks) {
-		dev_err(mmc_dev(host->mmc), "send: size received: %zu != %d\n",
+		dev_err(mmc_dev(host->mmc), "send: size received: %zu != %u\n",
 			len, send_blksz * send_blocks);
 		ret = -EINVAL;
 	}
@@ -340,7 +340,7 @@ static int _gb_sdio_recv(struct gb_sdio_host *host, struct mmc_data *data,
 	recv_blksz = le16_to_cpu(response->data_blksz);
 
 	if (len != recv_blksz * recv_blocks) {
-		dev_err(mmc_dev(host->mmc), "recv: size received: %d != %zu\n",
+		dev_err(mmc_dev(host->mmc), "recv: size received: %u != %zu\n",
 			recv_blksz * recv_blocks, len);
 		ret = -EINVAL;
 		goto err_put_operation;
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index c1982f3fb931..6e34757d9051 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -540,7 +540,7 @@ int gb_spilib_master_init(struct gb_connection *connection, struct device *dev,
 	for (i = 0; i < spi->num_chipselect; i++) {
 		ret = gb_spi_setup_device(spi, i);
 		if (ret < 0) {
-			dev_err(dev, "failed to allocate spi device %d: %d\n",
+			dev_err(dev, "failed to allocate spi device %u: %d\n",
 				i, ret);
 			goto exit_spi_unregister;
 		}
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 2448fc9098d6..442aad685d33 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -176,7 +176,7 @@ static int gb_uart_receive_credits_handler(struct gb_operation *op)
 
 	if (ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
-			"invalid number of incoming credits: %d\n",
+			"invalid number of incoming credits: %u\n",
 			incoming_credits);
 		return ret;
 	}
@@ -300,7 +300,7 @@ static int send_break(struct gb_tty *gb_tty, u8 state)
 
 	if ((state != 0) && (state != 1)) {
 		dev_err(&gb_tty->gbphy_dev->dev,
-			"invalid break state of %d\n", state);
+			"invalid break state of %u\n", state);
 		return -EINVAL;
 	}
 
-- 
2.43.0

