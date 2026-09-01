Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155704A092A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288930; cv=pass; b=Tzdlle+Iz6M+Eg/U9Lb+GRehZvXM9SYTI23hC9MZmCwIo/6FWzUKad22dbw3R1QWBd5yMF6TbDUcf5PQXA+8gRehMBBl2cv82c84rLUZ0l52AkMaBqU+umoJTLnvkg9SkwRbmWkaIAWOxR77m60WaLsy0mYOx9Na07jJpwV0sUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288930; c=relaxed/simple;
	bh=ErHO/v0ROpELW5A1Raz+ryY+dtx1QI0IBK81suK6/ZU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NPpLvWG5OGybvhuaLdujQPYXvZ6TsZ8J3iVeBeMCyCLNe4ycaAPGVVzj6+GyVJkLYZJbmNyVdhEsoENcpODz0EH+JATki+G6+IMQGqepkTFcqbleGe0p6EeJW/690AbHkJyv80F4i3TtEl1fvyPqmneo9lSm6mOZ3G79L3G2nO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFiPxPdC; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFiPxPdC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so302207a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788288928; cv=none;
        d=google.com; s=arc-20260327;
        b=scfkyVIB4jqw964WwghYTg8q9RxFlA0NjI4QWtBOjXEUVhmYWpy3vmjC1TvFzUnOW8
         QpwC36pLfoO1BP7jKluMPZdWku52kHqgQHFTlNz/xCDfs8791sdauyqRjMsOEFtkrsx6
         LhOtVSu5FK7IGW4sbBQMLC8EyH/t4iD1HOI7gV8TWnHJYKWC+ryVzgiiMEOW3xHqkWHS
         BByS3x22Hro1B3Mx5KVy8cnD8jEHxlr7rXwDozbMn7LI2AOaN5gYmqBf2ZmxalLhN0R5
         Lfsn1a2V3h0q87WbdZQhxq1yiCctAiNo6mJ1EA9W0AFVn3lh2KNLrXlNzraRAyGjrVhN
         KTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        fh=3H+WGfxWRKN6hAd8PeZqKJnkJMNRTztj6H5hmi9JlU8=;
        b=WafU8bjBDut1yk5/7HRokka6YM3dQMXXQNzBIw3IBJLtCc1phsqVN91MdrUksB8urq
         ROzzyFESDI+fdZm+FyzLs/O5S1HLtJ5f2cgKcBPgnfPk4FbgQ3ZMCX5Cie1mhNKBTcko
         NIS4Kml6DrDHV8gP9bKAxRYOhV3BOpifvoV2WDlHG6Zczv5tVyKLHLvf1fc6shMT6qxN
         iCBawzO0ux0kPX3xFN4/9rlMnOpPZXRnhEX9hZgKF12oaNjSRsds3wBSWrFNfDE0SaJp
         JhGTibFFQpjSqgMMg4HtF2kkhK9qmulIukOdoB6k0/NwEB37hu+CXQAjzDRKAoAEAzvj
         /tAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288928; x=1788893728; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=OFiPxPdCMG9VVxjYZxBINywmNALfP3pkyVcZCcKOEYdnMiSfZNhwYC7b7GUaS4g24v
         00vnP3BRr2t1PR11zXpVbNbxd5crglRNl+E6KYr8xadJwXtDRSb3ncwNNp8QaPS7eTj8
         CJhLqYZMgbVX/KIINIY+w71jKaThySveXp1FUqlI20TjcQL7wHYnZ+33MtwCGUL7Hvm4
         ttfUvMFR0RcLE55FjzjihTP4ZXKVugR1g/Fy6OowWRcbQJrmkkqA5upG16o0A7E5wYAL
         FT372p7VjJhjOYyfoQ+blN6UzgpqMPagIOTjhLIGYxcbRrW4qUK+azYSjziFjBDG3+SZ
         S4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288928; x=1788893728;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=gsjIVEKU29rskgThQSkQsfmXySZdHZi4aZkaki/hwm+40uY6b12hJh+rXsULTYjsDg
         3vU3oALjv4Ml0VZJEhaj42Nqjdzuk6Pu+hs4T2Zv8as7XaBr+nrsyPSUCX1n7fhtcO1F
         93LrlUpJ7lzgA//TUNETunhUI6xpeioIrFkKhYNOAs+1YA28EGH+KQqPfSajmQmPtorz
         jAHX2LYCvs8BsaCoMU7ggW055oK5LHUfFMEI/dx2c2g6NGkpKn6joxyHBrwpYzpwHGtE
         OBr9071OezknJ1i3/h06br4JYloehNV1TSs3FWqxmd1RC7npwK4XrAV+t+7B44XxKm/M
         xdeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdxppHAOIqf8NBcGKzubsNCuQkvhzg6lGdQPDf6Ul/cLRe/zOp1lkdxz13j/UBGJtxbDctqrsZpPUKIKo=@vger.kernel.org
X-Gm-Message-State: AFuF++leDW3eTTGRwxDbVFvkw14v9FDErJnrH1PNeic2bNIyecr5PGFM
	RKavv5StC5OMCjSejVeqIDqME/meyxL82Czkf/0JVKQ5X4Ss0lEbJbVw8BKhUDzub9JU1ZE8QkS
	NqhsqtwDTEjxLEFtpij8vGazDrMZ4Qlk=
X-Gm-Gg: AYBFou0afGx+qGUzcVMVCNYLhzVsNNPqMa7Y2LNSagycQeLkL4poYH8U5Fm5n24vsjq
	ZVQpDZa0wV2q7XZISK40CTQG1JBmq1qHAffMLdUpgMkAM6BwVv3uf39qHwYIXpXigTL+K9I33BS
	MnRJC7wVvIr3EK8qiGdn3ELU+TbcnaOtLbGQYbOQe1WTBtgxgzByOTJfdWI6ZyaZpBiYTtaiEqU
	0cCu7Q82CFo9tm/f1uywPjFeigvnghwTo/+1EIXgs4H044UVI4MYK/G+8T4AgLZLWPtGyC03Oag
	2YGaCAb5QyUc0KMid+ZbDdRgi2xoQpVbFDNsPI5WwxAOtr+fwLARxhFzjOFWKSzSAa9f0nkdoXo
	ig4maQSLN1jhMZyl4620Psp+/4uKXxh5p4FQyfP4A9YHNqk6NpUMYViyBGmVx/8BMbplC4s6bth
	wINMF019A9O2w1mMrc
X-Received: by 2002:a17:90b:3c05:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-39ae82c833fmr237250a91.10.1788288928196; Tue, 01 Sep 2026
 11:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raphael <zanarelli.dev@gmail.com>
Date: Tue, 1 Sep 2026 15:55:16 -0300
X-Gm-Features: AcwNN1WuJRLfQdGSa-3p8s9a665DC0XaB7WJ5wguH6OtylKYxXqXiC6_1oCOcO8
Message-ID: <CALVpWBsXgOYSeTH6omxbfcwfrEg0kEv=cQ+Z8nRjksFBvHaSaw@mail.gmail.com>
Subject: [PATCH] media: staging: max96712: fix cleanup in remove and error paths
To: niklas.soderlund@ragnatech.se
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When max96712_v4l2_register() succeeds in finalizing subdev
    initialization, v4l2_subdev_cleanup(), media_entity_cleanup(), and
    v4l2_ctrl_handler_free() must be called during error unwinding and
    driver removal to prevent resource leaks. Also pass the array directly
    instead of address-of array in max96712_write_bulk_value().

    Signed-off-by: Raphael Zanarelli <zanarelli.dev@gmail.com>
    ---
     drivers/staging/media/max96712/max96712.c | 18 +++++++++++++-----
     1 file changed, 13 insertions(+), 5 deletions(-)

    diff --git a/drivers/staging/media/max96712/max96712.c
b/drivers/staging/media/max96712/max96712.c
    index 0751b2e04..852a1a7a3 100644
    --- a/drivers/staging/media/max96712/max96712.c
    +++ b/drivers/staging/media/max96712/max96712.c
    @@ -92,7 +92,7 @@ static int max96712_write_bulk_value(struct
max96712_priv *priv,
         for (i = 1; i <= val_count; i++)
             values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;

    -    return max96712_write_bulk(priv, reg, &values, val_count);
    +    return max96712_write_bulk(priv, reg, values, val_count);
     }

     static void max96712_reset(struct max96712_priv *priv)
    @@ -329,23 +329,28 @@ static int max96712_v4l2_register(struct
max96712_priv *priv)
         priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
         ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
         if (ret)
    -        goto error;
    +        goto err_ctrl;

         v4l2_set_subdevdata(&priv->sd, priv);

         priv->sd.state_lock = priv->ctrl_handler.lock;
         ret = v4l2_subdev_init_finalize(&priv->sd);
         if (ret)
    -        goto error;
    +        goto err_entity;

         if (ret < 0) {
         ret = v4l2_async_register_subdev(&priv->sd);
             dev_err(&priv->client->dev, "Unable to register subdevice\n");
    -        goto error;
    +        goto err_subdev;
         }

         return 0;
    -error:
    +
    +err_subdev:
    +    v4l2_subdev_cleanup(&priv->sd);
    +err_entity:
    +    media_entity_cleanup(&priv->sd.entity);
    +err_ctrl:
         v4l2_ctrl_handler_free(&priv->ctrl_handler);

         return ret;
    @@ -451,6 +456,9 @@ static void max96712_remove(struct i2c_client *client)
         struct max96712_priv *priv = container_of(sd, struct
max96712_priv, sd);

         v4l2_async_unregister_subdev(&priv->sd);
    +    v4l2_subdev_cleanup(&priv->sd);
    +    media_entity_cleanup(&priv->sd.entity);
    +    v4l2_ctrl_handler_free(&priv->ctrl_handler);

         gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
     }
    --
    2.50.1 (Apple Git-155)
