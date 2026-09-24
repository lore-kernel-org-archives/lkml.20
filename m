Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01242FCA9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235016; cv=none; b=Jiyx8iSqIJem+/dQDN+uf5nxwRaODCo/bdEtW2VkgQ2KFRxYEM1NmFb3YjSFSGpcJFa2tCP5mpCn3E+xtjw/DfKhAdG+e8nBp/P4ITiaaYAQnFG+MoPaKqsGcVUsBxzWg4fvKTTNg4cLebHvxBfUqk6SOl9biuHxfGB9/5rc/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235016; c=relaxed/simple;
	bh=hVEk6BfAvcK0p+fH919u4o2on0AxzPdVDixewJNN9yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAZrYfaoS7Fkkbjho7Hz1PHjIPrvvkVVAto/Oy6uUxkOdA4ewQ47J4kugB5855x9Zs99oNFsIuZGQw1hHzqMZLzQIBXEJxdtUhQkuylhUnozQrE5E5bsDjFwLSgRpLFEaazwKNN6EhRHQXt59o1DTlF7rXX0od6hCAyb0nyx7hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEQCA2cf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEQCA2cf"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1224449a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235014; x=1790839814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5RaZ9J/BPAqTVFwFZkJAJ6b/KARjI40wHk0bzH3x3U=;
        b=rEQCA2cfZqJ6M5LqQWieMPL6r8TP+vounmMbCRgrUroMjOJ2QqS79DK4VTkMQ0Iuvd
         Yz6/yyrYR9FokfSwPh9NkUtvF0rzbiUbGiHzJPKgg3sbezrvT2j3E1J5dGzFLAkLUoBp
         dGIfJqpdlKk6LHIVf98/n1skWFPd8BD5MGKZwZK1dBzPI6afB2tr8cPqzfWCCyd0RVkr
         GVJcS+3RpFCCua614T7xtBlFmHqXxPS68qNrt14HYiiXVPT/RPYv4InS1USUrfVg9D3Y
         8SMkRyP2EYbFw051BW3tUyS2uqsWakXo7ewGUw4T+1ylti7/lyg6r8ztBW9oprgMCGd3
         jsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235014; x=1790839814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5RaZ9J/BPAqTVFwFZkJAJ6b/KARjI40wHk0bzH3x3U=;
        b=ySoDKVdztGgFDBr09sFmwsegsbG82fjHstuMMoPdCxh8B42C7D0WsiD+wDYMp81P1k
         46DPfKCrsjlMm7TLu3a9YsLXfhCP0Xcv+xh5kYUWgXniiH1cQBRG7dfixWdjObcFQtWm
         4btdxJJ8FMfCaRID0S7Vw5Xl6vH6Zc83DX8GG/1dvt9gijEV6vGRVB1lihXNFBCx/3X+
         3/NVgzBr5GuyMScNetQuY2cRhPF3Fm+APhk3XVLQtzbSEj+eG+3a8eqotC+LcKf44MCU
         uE6+f160miwGRA1LovpmrvUe+NHz91W0l7TU4tQfncF07YX3kU1a4hqgZELoICUpC97G
         wAPw==
X-Forwarded-Encrypted: i=1; AKwUvBxFQZR49w8RLl6M4DJEEPCkObcnP4GILPpi4AD7yrh/eNYaECUOI9Bf3gfCxoQGHG/lWjmbXMN4klvNVo8=@vger.kernel.org
X-Gm-Message-State: AFuF++lIzzcO7FZ5X8iqdi9P17A17WI0uVO/DQ+TN5wTMmFUpzCt1Y+l
	O5YdRqe+32DgSn6QIebb4rvGxTEAerMLBduhWcHL5tHYNf08R2c9pDYq
X-Gm-Gg: AYBFou3HxEtKPzqF9DVMCul119Hk+PsGxtsK4nLzzDfj5fU1eAV33TqYfjmUQ/4v2fL
	cKWWSY4y4gBb+pLRe4ucacfq3MyK6DFrr4mJFRg0VkUbh8PNMm7J10t3SWEFdEf0KZuOX4WG69x
	YPtGmMM3zwn3DSsUm88UvKEC2FyvMzFoLrXkuxf+XRcBBpS6Lm8xvjCkrNc79sz4G69S3Ayp7r2
	e0hrbxqyH7wzBU6JRySsGg0vGC7+XQ10ta5T2qQPPYm+7XcjdvBn6hZg4S7yUFz1E/CCUkdUOXj
	QQkHa046fCnajQGWU7OeTElueCBbol5eubE4PLXEDZCPgHJ9cJwMLPDNYn3WLvD6K65KGYugr7/
	SRvXpWRw9+KJSpWxvueSX+NsOPgV21EHroQKPtHmn/kCGRx3RWa3zdVJwjXqdaXjflizjTmyBDG
	8J3veGB1sNYbc7M4KUKepCsSIzfBWcOT6WJ+3sD+dWjG5gslxIcGWtOn5pHcthnnZ6ryZ/crMoj
	lERpjzLgUhs3qPDWyiTwOXpJuSTcS6B2/DDdXZ3eL89ZDpg9CSFou2hDCWEXf+zEVsxf3pDiHE2
	MccXPpV1wQ==
X-Received: by 2002:a17:90b:28d0:b0:39e:6a81:c920 with SMTP id 98e67ed59e1d1-3a098724784mr1301143a91.19.1790235014279;
        Thu, 24 Sep 2026 00:30:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm3184726a91.8.2026.09.24.00.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:30:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jani.nikula@linux.intel.com,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 1/2] drm/udl: reject short USB control transfers in udl_read_edid_block()
Date: Thu, 24 Sep 2026 07:30:10 +0000
Message-ID: <20260924073012.2742968-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924064434.2541959-2-benquike@gmail.com>
References: <20260924064434.2541959-1-benquike@gmail.com> <20260924064434.2541959-2-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In udl_read_edid_block(), usb_control_msg() requests 2 bytes into
read_buff for each EDID byte, and read_buff[1] is stored into buf[i].
Currently the short-transfer check tests ret < 1 instead of ret < 2, so
if a short USB control transfer returns 1 byte, read_buff[1] is not
written by usb_control_msg() and retains the previous iteration's byte (or
uninitialized kmalloc(2) memory on the first iteration), which is then
copied into buf[i].

Change the check from ret < 1 to ret < 2 so any short USB control
transfer fails with -EIO.

Tested in QEMU against Linux 7.3.0-rc3 using dummy_hcd and raw-gadget
emulating a DisplayLink UDL USB device: on the unfixed kernel, when
usb_control_msg() returned 1 byte for an EDID read (short transfer),
udl_read_edid_block() accepted ret = 1 and stored stale read_buff[1]
data into the EDID buffer; whereas with this fix applied, ret < 2
correctly fails with -EIO and prevents EDID buffer corruption.

Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
Cc: stable@vger.kernel.org
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Change (ret != 2) to (ret < 2) in udl_read_edid_block(), as requested
  by Thomas Zimmermann.

Changes in v2:
- Split out as patch 1/2 as requested by Jani Nikula.
- Added testing details in QEMU on short USB EDID control transfers.

 drivers/gpu/drm/udl/udl_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index af4cff2a7c51..2120e363b6eb 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -36,7 +36,7 @@ static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t l
 		if (ret < 0) {
 			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
 			goto err_drm_dev_exit;
-		} else if (ret < 1) {
+		} else if (ret < 2) {
 			ret = -EIO;
 			drm_err(dev, "Read EDID byte %zu failed\n", i);
 			goto err_drm_dev_exit;
-- 
2.55.0.1082.g2b9226bbc0-goog
