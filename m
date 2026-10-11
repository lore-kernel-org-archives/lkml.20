Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912C2FE074
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758399; cv=none; b=DJnlYJ4dhsi+F/m9g2uyMomLaadgVmXwhc5dmPn0cQhY7V0zLpLKIwhBd92LRpofI3omnohefgBb0JbpPEROY1fajjtlHSzGF66BsVL2fAcyCVQWOATCP77snrcVVs9uxuL7oATpaD1DGl4YN9ruHDyRm3qa7Ojd6X8XbYqsjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758399; c=relaxed/simple;
	bh=xm7zmmCmvA/Kz7KfL1R9Yqv2NSWneryvUBrSk9xgCDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqMdhVMPf8tWmXDJ62i3Z6Xn6kb20AXuam59eczRCzUEDnpOCD/5ZQ4VEDAno7Ux9PIaHVV8gfFfljjr9Qsk8m1EY0GX3EClF4YDgbL6ujsfu8LW2OIEozDMtke/RPNnfcZYK/x9y4WI3Ecx7YK0q8jX6e5iQtT9kEWELJ6alFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRsPZtzM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRsPZtzM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0584ad71so617448f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791758396; x=1792363196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwhYc9CDw7ZgP6emNisFG66EG4JKlhzFKT9RLmp7nJU=;
        b=aRsPZtzM/CVizgyW5uQCYGYegHyHSxJeYwd1/FhVlRqINvK+hBr3CqxoH7xfFQli+5
         dE8GFrQQX/R1ctL0DVZ0B/E2JCuaxOI7u09ahG+0jr0ZPkhM4Uf/rCch41mQ407bp9uQ
         +MXoyeS+tp/86Tnf3/vGwJhMHvqoaLJBk4b0DeQtfVLRtrg4iEK/yGS/uWfba4iaN/NV
         5st6YOpfeVGmXSzW28aHmMzWNnImutU7/DScP/VqSSkWNxyendDUeI7U/PGKnatC4Sab
         0d8i1SQu/xuawj/IzUun+xXldnlN1EhtjrDBhK6S8P6eBbCfoMkbJNwHm1tNTb6DuhNr
         fL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791758396; x=1792363196;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwhYc9CDw7ZgP6emNisFG66EG4JKlhzFKT9RLmp7nJU=;
        b=2oSxUHiJOkEgm0qLn67CLv+8XV92TZ3qG5q24RCK0JEBHkpxW3Far84seL03ihaA3h
         Ya68dxKSpRXdlE1uCOKOvwt52S5QE2XpgAyhHplMJXZjBW8za8h5tUI4JiVkeznzoy0k
         KQ+SictHWeaBkNS/hVCmyWPm7HtySRwqtSzJsS0xpy3t95JwWaie+p1l7cpNCWHZKzr2
         gpFAnR4yPJChaJyEWi9SrUcnTlTHwiuQsIf6XPCCZV45IySt+MQcK10qxgywF7udfh2A
         sLVtucxx3BvVnrXpsjkvTnW9AQ2YvfkiM+1baSM1tJePFiIYkF7P9gyPSWGOWSqfcEK7
         B0iw==
X-Forwarded-Encrypted: i=1; AKwUvBwSwKiTUbd5fJ44dbzBjDlNv8SCIRxbexymPQgIJyTqn/cHRKXNFRK6vq1uhzQT2uQCHlYr/fUZubBTzTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT90j/DvvWjjHBMrp49x9pUWVdr+UBxikOWOUNrx2Hvz7eUkVl
	KRt8w8aFmUitVltjn3NYErU/REdA+ijTpnKYOi7/BszKy8n+B/joKxk4s58FH2RfI78=
X-Gm-Gg: AYBFou2E88TIb2AeKfSefu4NcDH5T9+QCw+bfRBAuwaxY0MEktrYw4gT6HinX6MIk0K
	UAdI4+RJ0/CHvvxLI2X6VdFFyMvAG0P77a6UAui8cMtUoakizLolx6Z9+rqMix69HaY1Wx7eDHG
	vexfimkbs90lQUn7V4GU7+EgcIU0VboM9insrc8O26GHOHxlvr/mEmte267WX4E7xd/TKHJgIC+
	jggjgZ00g6IRXElU5WeqfRhgx3knr6jRalaxTHx3e446AfypmGhnvoql09ZgAs0TgBM+Bm/UlXB
	Wsb9qszTALq21Ye1DrVmgTEcLA+zLKBucEqRfcNFzA6qKBfVWalYGsulalcrxdWzQzdFdz9i1z/
	7TURPA1vy+lVG4a5JoQ3JcM5jQ1IZz6cOwXZ6Xa6gLbk6tBT6mX9LnoMU3m01qUCMKbBwokE5Bp
	DnpAwRQqgw5nZ4Ul3bwVlxddqG1VNao/D4PRgPQRnHCdCMxEzszq0jz8vRvf5yQcjY46BBImE6C
	utBHG5IjwXBAQ==
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr14028801f8f.19.1791758396194;
        Sun, 11 Oct 2026 15:39:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm16723214f8f.6.2026.10.11.15.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 15:39:54 -0700 (PDT)
Message-ID: <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Date: Sun, 11 Oct 2026 23:39:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
> 
> enable/disable_streams pad ops track active streams per pad via a
> per-pad enabled_streams[] bitmask, so that multiple source-pad
> consumers can share a single propagated sink stream without redundant
> or colliding propagation to the sensor. The shared D-PHY lanes are
> enabled once, on the transition from no active streams to at least
> one, and disabled once all streams have gone idle.
> 
> This is opt-in per CSIPHY instance via the new streams_enable resource
> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
> non-streams subdev ops unchanged.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
+ static const struct v4l2_subdev_core_ops csiphy_core_ops = {
+       .s_power = csiphy_set_power,
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
   };

   static const struct v4l2_subdev_video_ops csiphy_video_ops = {
@@@ -932,17 -981,17 +1133,30 @@@ int msm_csiphy_register_entity(struct c
   {
         struct v4l2_subdev *sd = &csiphy->subdev;
         struct media_pad *pads = csiphy->pads;
++<<<<<<< HEAD
  +      struct camss *camss = csiphy->camss;
  +      struct device *dev = camss->dev;
  +      int ret;
  +
  +      if (camss->legacy_phy)
  +              v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
  +      else
  +              v4l2_subdev_init(sd, &csiphy_v4l2_ops);
  +
  +      sd->internal_ops = &csiphy_v4l2_internal_ops;
++=======
+       struct device *dev = csiphy->camss->dev;
+       bool streams_api = csiphy->res->streams_enable;
+       int ret;
+
+       v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
+                                             : &csiphy_v4l2_ops);
+       sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
+                                       : &csiphy_v4l2_internal_ops;
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
         sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+       if (streams_api)
+               sd->flags |= V4L2_SUBDEV_FL_STREAMS;
         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
                  MSM_CSIPHY_NAME, csiphy->id);
         sd->grp_id = CSIPHY_GRP_ID;
@@@ -968,22 -1025,16 +1190,35 @@@
         ret = v4l2_device_register_subdev(v4l2_dev, sd);
         if (ret < 0) {
                 dev_err(dev, "Failed to register subdev: %d\n", ret);
++<<<<<<< HEAD
  +              goto media_entity_err;
  +      }
  +
  +      if (!IS_ERR(csiphy->phy)) {
  +              ret = phy_init(csiphy->phy);
  +              if (ret) {
  +                      dev_err(dev, "%s init fail %d\n", csiphy->name, 
ret);
  +                      v4l2_device_unregister_subdev(sd);
  +                      goto media_entity_err;
  +              }
  +      }
  +
  +      return 0;
  +
  +media_entity_err:
  +      media_entity_cleanup(&sd->entity);
++=======
+               goto err_v4l2_subdev_cleanup;
+       }
+
+       return 0;
+
+ err_v4l2_subdev_cleanup:
+       v4l2_subdev_cleanup(sd);
+ err_media_entity_cleanup:
+       media_entity_cleanup(&sd->entity);
+
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
