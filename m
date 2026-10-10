Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701749503B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631887; cv=none; b=H+APmptWwyNMcgohMbZAekdxi9q/BIhBwaEw+aWjCnSQHb/1JTZkNfjeMirDFUERZ9t5hhp+5RjHZoEpiAtvwZwskC7qmNLSDbrga7/fj/t5pjEibA6q39bYNAM+eQIBtIFaVjewY4u5KKMlGY8u5bk5FmOL0ytOoUnQjQwVwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631887; c=relaxed/simple;
	bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtpP6GRfkSleCdx96kyz47Zff4DSrOViW0iYca+IIua1bUaq9qq23r1hPJSCLjM0nyygdSQhtsximM3CRia1jjW28u1zrnKE9fU8YkzBiWBBv8bXzjnyhNzehbllB40fU1qSts/ttWEhKlVTM3nnhh8LNdv2Q9e+IYNDoiiTFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSnd7Upb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSnd7Upb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5278365e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631885; x=1792236685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=ZSnd7UpbfCXgZqmFdH7yiOsV5Op7IkwIarhwClaWT2TKvXPxl52KnmclpSBeMehD3W
         3ztxGtskF17bKD1Fgnn8kQfPEPxVzKPmBVYsu5u3Hv9JuXMSAw4kHWl9tmfBP9hgPfFq
         S3tZoD6EJVlB0aVCma7ajJW1W7kvnwOdjJQ8lQWzjtMuZqBu5xEIM+dguSRHJSNia6y9
         j/2ZGEh5tlRHcCgapyeikF8qJ0J1CXxAcGjcWJ6xHAbyqwej3pu73pNlATVuaTI27R8h
         /pFMcBjNxWQnsn/Z2wXK79BLjNZf3W150w8qpxHNG1s4PifQlmWRpFV3kG/I9Qx4eXts
         Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631885; x=1792236685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=MwHIcY0JkvPs3I0LY7oaaDdBhMQvnv01FUsw32/jRJEgQ3mB95MwMId8NzpwW00jIh
         HU2YP07cK4vWr3i+k8egolbDBruB7w6KXiz2PkptSpQkmyH1gOHTKyXDyV2DoDZCIOSz
         KR6czyrYoZcSnsyZZr0XX/hKknzVZVGOAjP4kCCfJzlplSPnwG33N/SSN12ZWdT5eAUX
         P3M8OkVNY0ra5ffmMC/eeDWR3E9jkfS7JtHyzyzdi2klBHS+QGSPos5TITCi9pQyg6yr
         PVQVzBQLIqdg9g5VNFMlNtYTrQTC8VoG+Sy78Z5koPHHaoip62uyHRhS+sO1vadMuEvM
         PTvg==
X-Forwarded-Encrypted: i=1; AKwUvByicazJJjqHrxAbS3MDnJTqNCYbgc3N0ZjPN/zTE9gnmnL0iPqsLdxANU1+nEHparM7sBXOh0vfW83ftLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyRhi3MgHhazGdgoXS2y8RoC84P1oHlDMoSQJVMhmB9LobmU/o
	TkcFwSlqmGOHB1LpO0AL1AWe6RT6wZH2ugcGMXloLFHSBqJSCGPeWql+
X-Gm-Gg: AYBFou1jmt4UOT298gKM7He+/KHPSxxi/tOZ/X0JkPFyd8zc4GtT9wOjVNDjYgVPLSq
	8WsfmFNq3x5ZUvCMDajs9MnJbwi+uUArFjyRxmw509bpQb/qHT2NLMk6jsSVtcBeKkwqTqmjsg2
	fGJsDTI1M+PHfgbyScpS+92GMOkpGNPkuiW2ACOheUNXwCdjwY+NmwqmHKYgSHW6OMY0fsSGVlK
	2G9JzRhZPuQv18gteKsz/YBqssv1hF3zFfbxwd49Gh+7XucJCF2dCzFPZz9W/svF0B4RGHmhQYy
	/o1VqzslZRhuwnQf2+Wehs/zzcIhdnySO/3F7rVzN44YLt1dB7BCEab6HqSEl5/eEZvpj0+yXgo
	A7BLTpbQRy5k4z9+9kUNHn6IWah9abFI6DYBkVsY6fSE+ItkPZYpIoVO4/6tYstDqN9MeFMCd57
	OtLjtcIccYV5hF0HmGYtL+rDikK0Tx4VAe5/bG76YxVDTVfoUM2V4BN6HKyccbwJ+zVXMrAal/Y
	AlZ86+N1eKbYPh25XycrAgPpeGRihiGMV7excGPUGlScUY=
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr105108215e9.10.1791631884527;
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm133458045e9.11.2026.10.10.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	dev@berg.pm,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	German Pablo Lindo <germanpapulindez@gmail.com>
Subject: Test for [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Date: Sat, 10 Oct 2026 13:30:55 +0200
Message-ID: <20261010113055.31715-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260831130312.26296-1-lsa.uz@pm.me>
References: <20260831130312.26296-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulindez@gmail.com/ this patch is necessary for the proper functioning of the camera ov13858 but not the only one needed for this camera to work

Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
