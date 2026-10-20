Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478699;
	b=CgKMmspRNU4IG8WBJB10IT7mrAv6STBD7U8qgQty6OaJwVTslH64juI4434w3GsDq33z
	 TZbHyXl1DRL277wPLbNySUoCDETThMjnhq8z3h5S04c8Ihf3uiBjIGrJ1g8JiLFUadhY6
	 ohXg2Yq2KuZcQTsj7goB8pHw3YfN3+wlS3fE9S51XjvvLm2bnojG6bfVewauMJCRJD8kn
	 uaiXLjnbS2okXhSCgF8lcA6hj5WnXM07P1KDG4xUWp7aXnBxPCp3whOrc8ksZVTQSiNEi
	 GpP2EEiEFk0FK4YuuBjkzptwtPnDiZXEEVJaheyaiz+p1APWMdMfNg+TOF1wmnluVDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
	b=AkGWabezN+hhbYyHb78mn7WR3afSmZZU3Z81bgNWHuWojMqM13+nvM71yd+cjlORKo3F
	 xXbMmMFkXwHnIRy7apbcuiXmbwZWALz7nJZRAOI1C71hSXT166Xf0ztnlon+150sOnLnT
	 lBkktIlNoMyQ7zqJtH0jRZVjrKfYF5PTU5t9SQFMh0W7hOOD9OFj63BiDfylvPcCiEoOX
	 ZzqB03dpzlOR4ja9bQdiu+o/dkFxCyGPlNaxZfCmnCu5g8qVdh4IwBx5A+aGcHwG/98Nw
	 89gcqy+ufPeGrbE41A+NoRNzUmOcE+oUerAj9pW2+OeYqd9SBzmTzxXjXOe0W2L4ZYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C143B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so22597495e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478697; x=1793083497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=lJOcG6rIfW84QMQcgQEh6NCqonY0PgoUVhn7Rwww0IjPzzS2tQNp4jnTsVEx4i1Cks
         +TEVwjTrsXoEeLVW8OOb1VMNigLC4k/ztw+MG6mUSK+9o1Z9YLTNnmBou1EJlccy5L4E
         Doa4zqS2lzi028EElhqpFAIkWQZWG4xDoAwmR9bM27lVb91pBcZJ3qB/LhnmmX93lUq1
         pP2WKoZq9swhspp+zCyFXhY7z6lLxUgO/m1NJCerppFN4DtnvS+aCavbUFAHfYbcZ30U
         9APArkDxlyUNTsdwjyBoE/EIpCRW8XxtDseUKBtaWfFM6OitlI1dM4y4UfLesX6xb9lJ
         ZOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478697; x=1793083497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=Rl69TDhMWmsdJR4BAo2QowG9rzVO8OXe9cAkr3j1LzBBCRVjMKpvGMaORi7NmaoqXW
         rfM9LuGDWtEReBLVKvDpod28v9NQcfKq7vkua8tnl2hfXnOfApWOJw8d9qCSJEC/ot9M
         BFYCkD3dMSz1tKPr1cJvhTGoyKZLN7OU6NzxI2e4pUkY/leQBv+vDyVwYWAHi3zwHEqT
         vDtXG9nkQDMHQyo2G+oEE3zn5iK4BiMM8edeCFhPIjY0BLAQKK2bcEocFA/mmyv76Cny
         tYbOAUp6YzjL8pkQd90jCUYOPDUXiW14i9mkad/63EshEpZ3j/+ssc3VdMfS52UQSd78
         1KIA==
X-Forwarded-Encrypted: i=1; AKwUvByYhvG1vtxYqIvE+2jpzsprWW+xaUnp4RL5yh9EnhEZAcgf7OAIiG3/AaW9eVQ/qfnO4r5tY7x5T2ihg2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkofEk10ZonNz4Xa1S+9XebgeFekG7/hPXJGLJ8B/5mNZfUDbU
	FrlUuFKrmIKwG4HvXNXtYTLMkgNZOvhtCXfx7/SATIkAn6bwWUlS+H2eFFtx0yIt
X-Gm-Gg: AYBFou23HPQXboNrH/lSE9uwE9o3Tr93kmffhNOZYcsHH6eujt3z2mx3AVvWsPbbnM1
	Ga8ZQOgLPt4HsRKbeoOdEhEEK1SP//LzQwjoceA+LY7WTgSUTeIbYzpqTOqSL8xVuE+VwqtJ+5t
	gv2vplhY1G7Es2b/afS5W09lPUOmz0RetHenmhZL1FtxAlwJh/p0kb9GQSLdxPC1JoPIvnHnZWS
	pea4Tif3vpMV19QnGmS6mNXy74qvE7vIYHxVXOt+oBlYMSwwdp8zBluOBRocal0Gh6PgO8USwwm
	KLqM6yiGC5HkLzazDHObpofcHvtC8kNW2dXZU+yV+fHeMaUM7P04NX+axNUWj+YsIKb/WIc3PE/
	AaOA+nXCyLR53NtGtyg9GzLyzlMwV2a969hdQxO1eqYtyUzcLlnB7N2czrDdBFC/PQ6CYFI5UME
	fbVZ6mwk36Vp6y5AYnf3vLoW5gevB5HBJJZ5pLp+WIfjqI76oRIs0uVG90zSOGh7AEfoieI9IuW
	MTRdIC99gDV8gJeCIDcZlbQRQyXz07MrvHsLXZTMJqx/hPvYjyJZiyff6hVcUR2vq3zTcbEf9E=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr211999865e9.34.1792478696868;
        Mon, 19 Oct 2026 23:44:56 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm223467045e9.4.2026.10.19.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:44:55 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Tue, 20 Oct 2026 07:44:54 +0100
Message-ID: <179247822513.25202.7960395606350309657@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019193402.52923-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me>
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

On Mon, Oct 19, 2026 at 07:34:10PM +0000, Sergey Lebedev wrote:
> From 19.2 MHz, 403.2 MHz (806.4 Mbps, 42 times the clock) and
> 384 MHz (768 Mbps, 40 times) are exact, so the change is one value in
> your board's DT, in the sensor endpoint:
>
> 	link-frequencies = /bits/ 64 <403200000>;
>
> If it still stops after one frame, I would be glad to compare what the
> two drivers write at stream start.

That took the clock mismatch out of the experiment. With 403.2 MHz in
the DT and your v1 otherwise as posted, the sensor probes cleanly and
reports link_frequency=403200000 and pixel_rate=134400000, but capture
still delivers exactly one 644x604 Y10 frame and then times out waiting
for frame 2.

I then went back to the earlier VD55G0 A/B tests on this same Snapdragon
machine. One result was particularly useful: the 1200-pixel line length
alone still stalled, and omitting the 0x0329 write with the old line
length still stalled, but 1200 plus leaving 0x0329 untouched streamed
continuously. Your driver already has the 1200-pixel line length, but it
also has:

	vd55g0_write(sensor, VD55G0_REG_ISL_ENABLE, 0, &ret);

I rebuilt v1 with only that single write omitted, keeping the 403.2 MHz
DT setting and everything else unchanged. That fixes continuous capture
here:

- 5/5 frames in the initial Y10 644x604 capture
- 120/120 frames in a continuous run at about 60.2 fps
- immediate stream restart: 10/10 frames
- v4l2-compliance on the sensor subdev: 46/46, 0 failures, 0 warnings

There were no new CAMSS/CSID/VFE errors during the runs.

So the link-frequency correction is needed, but the one-frame stall is a
separate issue caused here by clearing VD55G0_REG_ISL_ENABLE (0x0329).
I have not tried to infer yet why clearing it prevents subsequent frames
on this sensor, but the A/B is repeatable and agrees with the older
VD55G0 results on this machine.

Would you be comfortable dropping that write in the next revision? I can
retest the revision on the Snapdragon model and add a Tested-by once it
is clean.

Best regards,
George
