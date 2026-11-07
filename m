Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794030931;
	b=RjWN2g60K9SJmTDcyLVfxz3B4xSquwd/alcV4NayZ6qpie5qbD7styGhLQ5UypBRbaDh
	 51RDiZlP0B6C8B6aO92g3f2Iq0GatvvA2/b7KP3r7uUsCQOSl63b32KvXoqp54Nvp6FAP
	 x46+bGf2x5YOI+sN840kE5mfKTv+6cejj/nKg5UDfUKnFdU4wtYgq+k7grWZa8nfnBldH
	 CNZITSaIT4dybPP/7zR0D1TSJof+5uRXGCFeQ/koSjuwqls9RcZ7BGTqa0ft91YNuL3xr
	 COhceYbcgu/fZWfuyS887rjQ8K+1cNMGSy31+arUvQvvZdmP6uO2OxrhJmrJUmLrUUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030931;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6inbkaSVStlkbrtp0ML2TG9vm/SO/5sfB9kFxriceeQ=;
	b=CEja+mPrXEzDKf4k4aXNmO6pbf9WBOE5yDXuTtSBQ6X4hdLWM3V1zOS1NcnxGPJCLIyW
	 TMcGYjUA1EhnNZa44zvssme59G/WV/hzj5AtHgd1WjQl+8QTEwQhOngjzqwpa4R6cbVUP
	 rU/04qkeUeNiN+dMuJTO2u1RbvvGLNrcHa+toqNb4LucuWb1ERmQ0BiGOWX4UbfumGVgF
	 Uj2nxCElnNRaWi1CO2MC5NxY+7HHDXRaqukHlWS8KsCKlnANELP8rQKAQ+p7MUKXM9cy6
	 P3Nt3c5dKlZi87c+7mxuk1uSrwcIFNfp7aX9RaLfwcgJrF7hiB2SRambAbvXB6e8LuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAQTAbG6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353F606A326;
	Sat,  7 Nov 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAQTAbG6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794030930;
	b=ewSNqLOX6JPR9nnuGT5Fdt3JYX2tZHjj6WV+MGwKnHpXkd+HHt1gPHjgOB4yBeEaqMlU
	 T2c8qQQBYjwkJToVq8j2ddiyK0V8AnMob0NPMFuKkq3F237P2Okx0gH+FVMsWhHHDiNIT
	 os8m1KNbMcUePskJb9CDHt6WtwmYIvJQE17ObtnmkQ3RpZmhzdQ8lCMQ1Mtp00P9M/Jih
	 j/BS3z1zkv4EsZHDWEMJBJB3vrz+iNoDV1JffZ7wM0Rlf3VV+AOfNwLwtI1g37GdNgR94
	 gpz+gV0xPwYv9UArqaPn47CaewYfDL7FW5ei3rFCM9rbrrjMYnG+EGvi5DL2tREgP1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794030930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6inbkaSVStlkbrtp0ML2TG9vm/SO/5sfB9kFxriceeQ=;
	b=satTcyVgB5AGGWK5URvYGR7QRuMM0HR+a/atSU2EUl2dhTMPcwmfbfwSi+ITE8Bffb76
	 +bHpKXvVJjtKkULcOqxZ4livm9DdVogO2+hCy3GzHl0CHd7E8OTNyx7fSzaBCcduV5Fqp
	 gMT2/0Ct2yxIlg+uuTThDdQQjIX1B2sI9ZvcdLw7zBzPXU2nBR71psdfzJ4E50mV0YUsn
	 CaUFzAAI/q1BOfW0b16LEQXFZPpYuWxux0ilhEExy1KCA/o8FSLAX9+QuJ+D4yEnckDPE
	 QOQRg46DJ/ZboTrDlYeEKI+hm0U7sHmbP+ydf5haAHrF1GM/4AAvhtclaTlWM6uWueA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD3FD1F0089F;
	Sat,  7 Nov 2026 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794030930;
	bh=6inbkaSVStlkbrtp0ML2TG9vm/SO/5sfB9kFxriceeQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CAQTAbG6WniUUKGIc08bE3cSmeFh813Jrv+IySDdaUiATmkHKXGfZ5+9kTCzVf7JA
	 Obrit5jsWk8HrrKT85Udq9dsPxHhW9OlIQlAlkGwepjezixRUtOLDTPo5bXCcHmsRR
	 iVSB0bUoyHymTL7TaVFSWkRqmy2aHQ/pYpMagwS55/n+R4NC3NHKXzYii81UAarYxs
	 Y2UlKOGl4DL8tHl9K/V4YRJk9LV92Lzbx0ULmqXNPj10bPRmPJGz8bcZoGszkr1Zjs
	 gSBL8xEYGCbliJMmzWCH+VsKJ1ByWqAj7JKhTS62mleW9wB6pTYr1ZfjZ7rwWFuAGn
	 mmg4O0TQVr+cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5EC4047AC7;
	Sat,  7 Nov 2026 05:55:29 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 23:55:27 -0600
Subject: [PATCH] staging: octeon: fix parameter alignment in octeon-stubs.h
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-octeon-stubs-align-v1-1-1257ff90bcbc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQA/u5SrQwm2ogNJyKILp70
 vJbvPeAUGIS6IoHEl0sHEOGLgvwqwsLIU/ZYJSxWiuL0R8UA8pxjoJu4yWgatvaW91MdWUgh3u
 ime9/2g/v+wHvEWZgZAAAAA==
X-Change-ID: 20261106-octeon-stubs-align-0997c618d732
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794030928; l=1315;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=h+4iwZR2O9qgdWzGe2/8EkE8ODQ/38WUsFjZx8jrl/M=;
 b=ggyo2EnwigUGHf6hrrVHiW6MGKlSCH9E3lqoIg/8HfaWKoH8WPi/l5WYH4hJEqMDdB3zycNNF
 ikplnFgPhzNDH5V7cZp1eAdCLAITt+kw5/nkKcW5hkI1Ux8FkX3ESvw
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Wrap cvmx_pko_send_packet_finish() declaration to align parameters
with the opening parenthesis while keeping line lengths within limits.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e2d1..7fcafabdc78b 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1386,9 +1386,11 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+static inline enum cvmx_pko_status
+cvmx_pko_send_packet_finish(u64 port, u64 queue,
+			    union cvmx_pko_command_word0 pko_command,
+			    union cvmx_buf_ptr packet,
+			    enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-octeon-stubs-align-0997c618d732

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


