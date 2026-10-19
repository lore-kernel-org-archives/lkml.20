Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429336;
	b=LjLJNzQfrDlZPRHFMAplp0qamM8wvyWWx17eW5+WExYHS+lpGuLRMKAofG6Tzm285rok
	 Fpj5MxJCqv7q6YXocbwPfbRItsPU4sVsYOz6255le9N1FHkBS/YzL9/3n8MgEEo3IFpuj
	 Qi3r7FtTJL8I9x02ocgwWpvJ23Prfax/wAyPRkjC47jQgT9dscR4H2WOyz73spT37cg4p
	 kri6IEe3NaLo0Um2IZJVTby93sqEfyAvcscA51L9x9XqXy483XIxJ6KMN/Fyox34wtEyA
	 ccWnOz7OBtsFN0VMrBBVJjaaWqkvlKzU82iAlCpHrcDhCyhXwC9UK/aldbm7vitkTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TwE1xwzI4l9LNBlDuaYDfYmR+sqYQzsBcgO6n3dFT9o=;
	b=aK0yOP2bSKkCeYhW4rebJYGbr32fkVXTvlXZLpkmNbHVqPENkbo6+Xz6FC7dkOD2lRcB
	 rBD1I8NrVi52+bncV9niCJ8ncv38csxwdvPPTPvs0Z5jLfmG74316e4CykUKeDPsrdMXM
	 uJpuNVKflPTjmii+GTXwI1uYoZw0TklneiQh3ip4CBE9LgyBfHZa8JptP4Aqt/2qQSQnx
	 QA42ECO8aHkLQ+t4x+40WjWen4g8joBfcFf3Dcl/Ire9YuHGPU1IJ4WwJazVsGws+GgGr
	 uHFO/dQHqZZ6TEDmZiF0lxSuXs/dDTxnjaLxCC8drJfLF4zmcKSIkQJQoLf9OrX8dTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enOso1oj;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03A60A2610
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC03A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enOso1oj
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06454116eso678351b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429335; x=1793034135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwE1xwzI4l9LNBlDuaYDfYmR+sqYQzsBcgO6n3dFT9o=;
        b=enOso1ojX2tSHPebycBzttzjr0VJ5iwktTMN6MYFMil62CKWQg2KMNDZhhLlwe3Ce5
         qL6qAogwVBWD+DVRHRVCyZ4nf14NqOMg396UMfkZBx4NVQecQ7IHN9uA6FtDVCtlwMmQ
         woviTmFUiHVxCV8/Gy23vKIMAU5VElaDrFxu15qv+O6hNDcgHHyY6aghKIK7fHB2klcl
         gP1EAwWo3e4VellR0fkoDLupyyw6jYjcvac5zsyIxPC29yaPAeYQb8gzO89nZqoNU2Ym
         LZHSYb8U0XCrg5e/tn7BmKCHoKVxK+7773r0SNLTLF8UKQuIIFROeYYGUWyU/l0eEj+X
         2O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429335; x=1793034135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwE1xwzI4l9LNBlDuaYDfYmR+sqYQzsBcgO6n3dFT9o=;
        b=TDi/MFIjDt2r/H8OuvHq+CONQHcM/MpbPrSdZaR1IlmL7C/UT99g+rXXvuxPbuLDnN
         vqSy7IIYBxmowBgRn8b1CHh/T9+FWDHtOuG/0MrcuKrXD17a5MqQ2R86xhRxkZz+ULgN
         Y8s1zA4+ROJTZyDRKelrdX+ohPP9cGnn74GNPgnpllBJd2BQC6gg/0Mew/On8bW/NpDR
         a9GkoHTKh3j2BoV+NeMVy6/qIe84/5v5SiVIl4zjKyuB5OA3QFXCaHMXA1EIV+hAJNY+
         lpH9U2oKxGyeU7GR4UeDvP1HgtBzrF2OjQzdiZZmZWFeJ/eqXFH4bJKwsGsVeuE+XC6o
         AV1w==
X-Forwarded-Encrypted: i=1; AKwUvBx5Jvxc4TySjuJa7zAYCXBLzEoweFq8qEWlGg3hQMvX6SIPPnpEQKq6YRcO29KQnyPI2G0ugJvMTZm0kPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8doFOms828m4V2uF/9etk2aE/z8nhHMn6NxLs8c5lAFdnz2eq
	iH8CYqJQa6Tt5h7VsXUcLYmk/VPuKnMr3CTvqy2Y6BXMqy9tskAWb+GG
X-Gm-Gg: AYBFou19IccoZ3OM2n7ax1OKyOy4l11SRtZc66rs70vw7knJL49isxpAv8i0Qn6hCPI
	37BSw495W8ijWrk9tT8wJbxxKDuXOI+TQqoG83IqMqOd4Hzsn+EBKwBudRkErXtBcZKhP9iDSqi
	Pn7+u0DQup9Jfu30Typ80gJf9SjmlhmgtsmVACo0HMJ7860faiboms3NzwqcCNHLqmif8WfqwKy
	EgpqvJPQHlaiWXFvmrLwW1sc3Sw8OXFNyUOULWHFyN4oC/y8eNeHOI29vtGtrPHEqk9IM2Gs3D3
	CNrPF72bCbm3lMgPM/VqCgBMpV47WT5yb/tmUY72lLB+7GhEbL/Ur+Ps6o83fTdPzsG+UwcO4Ih
	wfWjcF735ZXP4dFxnMtzKqxOax2I0dicfNjxueAo/2tXbDgocnXHbJLqGUR//MjobyOgW9LZWWU
	vKNDx34pdstZj7WoBi3Iv8yWvFnilOxAr+EAFUz6JhMG1MZs8w2bgvYUqE/80o4fgxMuR0GhMWq
	ux+ypvXC+Zd9Ww=
X-Received: by 2002:a05:6a20:9883:b0:3db:3d0b:31fd with SMTP id adf61e73a8af0-3e225d390e7mr4343208637.1.1792429334850;
        Mon, 19 Oct 2026 10:02:14 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4317511a12.17.2026.10.19.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:12 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soundwire: stream: roll back failed master registration
Date: Tue, 20 Oct 2026 02:02:02 +0900
Message-ID: <20261019170203.2533974-2-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
References: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
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

When slaves have already created a master runtime, a failed master port
allocation leaves earlier allocations on its port list. If the second of
two port allocations fails, a retry sees a nonempty list and succeeds with
only one port and without incrementing m_rt_count.

Allocate master ports on a temporary list and publish them only after all
allocations succeed. On configuration failure, release ports allocated by
this call, balance m_rt_count, and restore the previous channel count and
direction. Preserve an existing slave-first runtime and its slaves, while
freeing a runtime created by the failed call. This lets a retry register
the complete set of ports instead of reusing a partial registration.

Fixes: ac3bc88cc56e ("soundwire: stream: separate alloc and config within sdw_stream_add_xxx()")
Fixes: f3016b891c8c ("soundwire: stream: sdw_stream_add_ functions can be called multiple times")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with ARM64 QEMU KUnit using the real SoundWire registration APIs
and synthetic slave capabilities. Register a slave with two ports, fail
the second master port allocation, then disable fault injection and retry.
Before the fix the retry succeeds with one port and m_rt_count == 0;
afterwards it succeeds with two ports and m_rt_count == 1. Configuration
failure and existing/new runtime cases were also checked with KASAN and
lockdep enabled. No physical SoundWire hardware was tested.

 drivers/soundwire/stream.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f106a877d7b2..8e94dcaf3784 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1107,17 +1107,24 @@ static void sdw_master_port_free(struct sdw_master_runtime *m_rt)
 static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
 				 unsigned int num_ports)
 {
-	struct sdw_port_runtime *p_rt;
+	struct sdw_port_runtime *p_rt, *tmp;
+	LIST_HEAD(port_list);
 	int i;
 
-	/* Iterate for number of ports to perform initialization */
+	/* Publish the ports only after the entire allocation succeeds. */
 	for (i = 0; i < num_ports; i++) {
-		p_rt = sdw_port_alloc(&m_rt->port_list);
+		p_rt = sdw_port_alloc(&port_list);
 		if (!p_rt)
-			return -ENOMEM;
+			goto free_ports;
 	}
 
+	list_splice_tail_init(&port_list, &m_rt->port_list);
 	return 0;
+
+free_ports:
+	list_for_each_entry_safe(p_rt, tmp, &port_list, port_node)
+		sdw_port_free(p_rt);
+	return -ENOMEM;
 }
 
 static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
@@ -2017,6 +2024,9 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 {
 	struct sdw_master_runtime *m_rt;
 	bool alloc_master_rt = false;
+	bool alloc_master_ports = false;
+	unsigned int old_ch_count;
+	enum sdw_data_direction old_direction;
 	int ret;
 
 	mutex_lock(&bus->bus_lock);
@@ -2056,26 +2066,39 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		alloc_master_rt = true;
 	}
 
+	old_ch_count = m_rt->ch_count;
+	old_direction = m_rt->direction;
+
 	if (!sdw_master_port_allocated(m_rt)) {
 		ret = sdw_master_port_alloc(m_rt, num_ports);
 		if (ret)
 			goto alloc_error;
 
 		stream->m_rt_count++;
+		alloc_master_ports = true;
 	}
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret < 0)
-		goto unlock;
+		goto config_error;
 
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
-		goto unlock;
+		goto config_error;
 
 	ret = sdw_master_port_config(m_rt, port_config);
+	if (ret)
+		goto config_error;
 
 	goto unlock;
 
+config_error:
+	m_rt->ch_count = old_ch_count;
+	m_rt->direction = old_direction;
+	if (alloc_master_ports) {
+		sdw_master_port_free(m_rt);
+		stream->m_rt_count--;
+	}
 alloc_error:
 	/*
 	 * we only cleanup what was allocated in this routine
