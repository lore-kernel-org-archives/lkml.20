Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F074071E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764761; cv=none; b=ANrUXq+kY1ntTPZtQtdEqI32x+Gb4gQX8lxyCQfiS7hy/slJtDyGwGmBX+7J5/qMGDpnUbtyH7R+zMSy/sh6ErJPXCePFXaMNck6857OS7ZjVmaNZMTv+4Pfg+R5ntyDwLmOmrP8YOWR6xn3qhB7OPqRTmNEoqJj16/OGurc/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764761; c=relaxed/simple;
	bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEKewyeEZUz33NzmePdeHxCs+T1osLeOKvK0pKTlqZyW82rcP46vpMvCaHyvMQEyvXKT3FCgBV9Bq4diW413abznNiq0IHg3P/7whTO8SboPdKMIYCbs6xAV46FCP/Me+WdDUkx5uOyqdyfi/uM/+aJ1NryZn4GFpTCdjqRX5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR95CXgI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR95CXgI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so1492311a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764759; x=1789369559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
        b=KR95CXgIQ4gPfpq7z3hbleFQsM0ARAl53Td4VVU35v42uR7SsWmDA0rTsyDPhEF6Wf
         dO7PPosgEdcffwlR/Po2Y/ix2/EtDpzXVKK+JccoUT3J0zaWalknXlmWN4Vf3/9VRrcc
         7Qp7VhcP/Yl9a9uD7PBY13TD/Oti+EirAoDUQVlZqaiDTjAjmcuhwOTkpRmnbWORLmiE
         V2tSbeWJ46XFAGbisvcKCAOJ8zqPmlkm1tcFQa2zeqs/v3Lz7r/ghjZ8baCmoaU9+2Ds
         CBXKYaJlFfgtMCGDNDAvAyMQNUJRqAPu79Y+He7noZm14oVDXhretqGtJUqoSP6DE/3L
         JYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764759; x=1789369559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
        b=Y1Hbh4H5THZVT+P4sib75/OMmLdDAMBWGAxkZg0+kqN91TQw0mfCX5oUoohKr6BJdS
         wL2y5zSWDCAHZRd5TkLb1aGlYF0gV/WfTtqjvP29c6wuSHhWIhUzDHNt5GvEYcDFhwfN
         RUnmBSmfXqZ6NHuHOTn+TzR0lKcNy1WnEj7X3Igc/DVsH9pjQUQRxdCPfRrxxM0aHWKN
         lhkKNBYty+vxzWkapDaaBApT8BEdYaVXixAqZ4D6HzzxliPFrSoWNUggqi7C55oVpQvj
         pqLKxLWk/o7QmpAqKGquLYXTx0TbAHfEYi+frelbAQsQ4DolLJo8HKiCB4U59FEC91wp
         zJSg==
X-Forwarded-Encrypted: i=1; AKwUvByDIGmQSf5hpXV4RURgIrTenQu0/Mdz0AztU29izRZAfA8dQykCkc8TD8+gQ73v3HdbSi8SOiC/yZ6aNpo=@vger.kernel.org
X-Gm-Message-State: AFuF++mRYUSqs4W+NE2W7qgJ03ojSLK0NvvXGc3z/RH2CuXJ/aE9eH+z
	+ivQu4+lc9iEdXWtKR1AgWHJU/xb7gOTapJHUoIXKtJ7L+mDsxktbjUC
X-Gm-Gg: AYBFou2ln0y+9dvFQO73nEsqAOA8Epkz3fp/JqCsnqY1DwgTKbljuWIL7h16dJAj5/h
	KWSEVmZ+/B27S6ZfqnPuj1yfazYg4ibycTYpVbeKlBVh7oY20Ed14/Djf03ZIJE6mttwx+mjkAh
	3Vqg90iRFvMFhBnUj+gZQ9zw5v3suuocbwkyTvFFGs8n/1dpVO5R3vE64P+z4pL5L/uvuiQusB2
	0jaFrCobVcpPn87o1xIgsgcOCr2ddzWSADbJjGMZXcbgyp6ibaTlPDnNSS4VEKCNRvf3N6MS42r
	iIndvwhvo3nn/E8ddIwQgwEXLie7BGomf/+NRiDhaSK3qPoh8/EUEMrfB2nqVprWzTLOjlgH8D6
	dvLWwGY9gv8qjKduoIN9Oa+liz0nalg7UxQ1QOv5BNZjSVk6jS8SoghyLcmaHy1bwWm3gToyCKp
	GKY2UfCSw9iLGGJwtuZ6443sv7Rg4ea27gGOJ1UITop04333/uNc6+KcpsAh0ySip948RWVa4n/
	7JJC7dRKE95w+g64CK402uq1zUpjOJZ0zN4tG2A/EuAVZHS6orx/En8DH3YMTd0FI0O9NvV
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr29356397a91.17.1788764758817;
        Mon, 07 Sep 2026 00:05:58 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm12128847a91.5.2026.09.07.00.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:05:57 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: ribalda@chromium.org
Cc: 98lawweijie@gmail.com,
	guennadi.liakhovetski@linux.intel.com,
	hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()
Date: Mon,  7 Sep 2026 15:05:48 +0800
Message-ID: <20260907070548.2528198-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
References: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sep 2026 08:51:45 Ricardo Ribalda <ribalda@chromium.org> wrote:

>
> Hi Wei
>
>
> I belive this is already handled here:
>
> https://lore.kernel.org/linux-media/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org/

You are right. I missed it out and the patches are logically the same.
Please ignore my patch request for this.

Regards,
Wei Jie
