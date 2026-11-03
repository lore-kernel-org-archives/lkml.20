Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699718;
	b=cERD39zZO/XwYAr3Oaw69/UV7g94xB33xGypla2I+NmEL734zc8lr5W6d+1eKcypADpk
	 XlldB3VLb53i66KnqKgoB5E9ibTOI5JHkxozLzVW8MarbdOqMpC34ju60cIaPxLdqJ2Rz
	 blxiq57vblml2IXL6wTT1aTW5i+CIVH0RSAYdJhy56ZWlZvHIBZq95+RHM3XXzlP2smAd
	 O5Zal5QSLC/DYvUn+AYwr0fN69L1bPFlfFJ7igo/Fa5u6VO11OdKI/sinyN8jDtnz+i+z
	 Ro90ygaI96ruanLzHONnEFZgvczYmadE4wFtw61eLHnTM/upq1N2yUb30zPghMR2Zjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699718;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kVV7cXJEL1sEZo9jcHDx/zBGbrcfVIGiV/+an787JVo=;
	b=QbOvsdF4bKxyl5n7+4I8dYWl9mhc56CmskBCjdmkrnS8jqrj+mEndWu+sH5/KMtsqT2M
	 tAhsMvXdTIHJQeIYQVHXbh34hwXbiHYSD5utyc1BdJXIHYg9goKZ30OuFdMX5k6txcNRY
	 RFKSXTJazYzUKBOCdD8rEuI3zCkf6jyO7UDjCuCVHUZhkyE2DZTqxDbYXgnuoYUAv3uza
	 5kt7tJsHFlFGt52fCzPaAXs7EKPMISZvJQxUlEJiIhV+2z87XV9H1upQ7wcsZz2ICFiEW
	 DY8qCIm4yD+aWie3Em795zpzIW6l0ZZxKj05974uOUJVP29YVStYVB3XnXpFNfoPJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBu8ZLwI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0B606A331;
	Tue,  3 Nov 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBu8ZLwI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350421F00919;
	Tue,  3 Nov 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699718;
	bh=kVV7cXJEL1sEZo9jcHDx/zBGbrcfVIGiV/+an787JVo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FBu8ZLwImHTegRehJyW+d/RkoDoriELWmQKUhbPQItiUQjjXJX6j73UYinbUicbbS
	 NSia6lQqY+mWAcHH0PYeDzijQ/gYfebHTGrIT/i1++9ZBcEkdP+BFgIg2l5gyPveYg
	 pnoponFH8p4WV6OZVVwOWHrHBq/WAJq7WdMg599ADUP/lbghyClBwFfaMLoBQLczYj
	 zLdyW67PsMqtyarDfWhbYj0nTrGQB5yu2iY1XXcHBj3Ds8yFDcI6mRn8fq9FH4zRT4
	 yY4dAPh0RsKDcCdfW0nbaOK9nTtmnekWOiaSVhhRjbsXru6TU9A/bIIoRlUWuOrBUL
	 46rFOeiTTXTcA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Tue,  3 Nov 2026 09:53:48 +0000
Message-ID: <20261103095445.81414-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

In sdw_stream_add_master() and sdw_stream_add_slave(), failures during
runtime or port configuration jump directly to the unlock label,
bypassing alloc_error and leaving newly allocated master/slave runtime
and port structures attached to the stream and bus lists.

Track whether ports were newly allocated in the current invocation and
route configuration failures through alloc_error so all resources
allocated by the failing call are released.

Closes: https://sashiko.dev/#/bug/linux-546e137d-6e4d-4f22-99c3-8ccc8beb5350
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Adapt alloc_master_port tracking in sdw_stream_add_master() to the sdw_master_port_allocated(m_rt) check
 - Drop Fixes and Stable tags

 drivers/soundwire/stream.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index db62a68c09f8..e3cdd36be1a1 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1026,14 +1026,18 @@ static int sdw_slave_port_alloc(struct sdw_slave *slave,
 				struct sdw_slave_runtime *s_rt,
 				unsigned int num_config)
 {
-	struct sdw_port_runtime *p_rt;
+	struct sdw_port_runtime *p_rt, *_p_rt;
 	int i;
 
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_config; i++) {
 		p_rt = sdw_port_alloc(&s_rt->port_list);
-		if (!p_rt)
+		if (!p_rt) {
+			list_for_each_entry_safe(p_rt, _p_rt,
+						 &s_rt->port_list, port_node)
+				sdw_port_free(p_rt);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -2018,6 +2022,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
+	bool alloc_master_port = false;
 	bool alloc_master_rt = false;
 	int ret;
 
@@ -2063,19 +2068,23 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		if (ret)
 			goto alloc_error;
 
-		if (sdw_master_port_allocated(m_rt))
+		if (sdw_master_port_allocated(m_rt)) {
+			alloc_master_port = true;
 			stream->m_rt_count++;
+		}
 	}
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret < 0)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_master_port_config(m_rt, port_config);
+	if (ret)
+		goto alloc_error;
 
 	goto unlock;
 
@@ -2083,6 +2092,10 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	/*
 	 * we only cleanup what was allocated in this routine
 	 */
+	if (alloc_master_port) {
+		sdw_master_port_free(m_rt);
+		stream->m_rt_count--;
+	}
 	if (alloc_master_rt)
 		sdw_master_rt_free(m_rt, stream);
 unlock:
@@ -2148,6 +2161,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
 	bool alloc_master_rt = false;
+	bool alloc_slave_port = false;
 	bool alloc_slave_rt = false;
 
 	int ret;
@@ -2198,24 +2212,26 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
 		if (ret)
 			goto alloc_error;
+
+		alloc_slave_port = true;
 	}
 
 	ret =  sdw_master_rt_config(m_rt, stream_config);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_slave_rt_config(s_rt, stream_config);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_slave_port_config(slave, s_rt, port_config,
 				    stream->type == SDW_STREAM_BPT);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	/*
 	 * Change stream state to CONFIGURED on first Slave add.
@@ -2232,6 +2248,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
 	 * internally.
 	 */
+	if (alloc_slave_port)
+		sdw_slave_port_free(slave, stream);
 	if (alloc_master_rt)
 		sdw_master_rt_free(m_rt, stream);
 	else if (alloc_slave_rt)
-- 
2.56.0.385.gac671c819a-goog

