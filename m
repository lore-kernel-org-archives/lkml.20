Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794107684;
	b=w9YkCaLvcp4nVfPyhDqxj2tw+7kBSnFbPvBm/SiX8pApAMiQnO+AltkNk15Sae9JEK7+
	 1phFzUwYoulmmbJLvyCY93p7Yphh/OiwUe4VHnEcyDWdcd6aow1fvFSIiaoAXPf8kijtD
	 nfwg4ts1y7K/s1zVCKpXeoA0b9j7JIp41jkiFgYa4QPuNo7x954qjymHenviC+0g5u32p
	 CRTDo7IHKQ2JgUmG0hN8riR0uFy3MT/CCiCsRWAdJwx8YosMiRwAmg1ptInEl6RKBfsW1
	 K2z56W/dFOtS/aXJrAexHWKXaYiRuBGHhUKDzbyld2RzXDT1Unp4of00LXBSprkErIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107684;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YHRvZIgqVzcYKoSUOa2Xqv2YSwqjHTEgDzR6R5zPtgs=;
	b=3fZ4gXtp2bb+m1M/Hq6IEVFDHFT0TxpGWnFMq4yjYR8eNEYxUqAJLrB4rz9wZuoKJAYL
	 LD9USIvfjEJO0ZkDBOF6+DKFOz9ivCPxY+zg1La8MuwM2gBUS5sd0hIGyxWBF363Wf0ah
	 Q24Nt/tvCMVv0lMibGJEd+dSMlyQU732WZ4h7QTQuM7hVMFEOaESrOpGCYJldUj6gtI0D
	 /pyuaLak8bjEnOZT/lMRb71bZSFCkvMhD32k6m3oxQWDW+UskTgngclZQoYj8QIV64ody
	 oBOfPdrC4hKhTNCIzV3ab0hEobFBaQ5KNZtmDtNnk5zaipg6MXlxqNnAaVeLZPXvMTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ew0vOkk/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48740606A326;
	Sun,  8 Nov 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ew0vOkk/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794107683;
	b=3vJ2OBkdktjppsQ4RJsKhXQBFQIwIGZm2p40ebNIdIaZGaK3KXc8lKV3yDU++AfE/d98
	 Xb5LrwkifV1TmIkEzBmLCapvwYvoNnBKm1lSu7z5EYvG81At+7U6ffS/CxceuyUAXjOeN
	 1DvHFUb/pT+iFGoiSFemgTFqZEpGE0iaxsIu/AC1WNKSsqR6NkHCSeJx6LRyC6jHrQiWF
	 KeLz0oE23P87/SQ0FOE0OvVwlctydKLXCnItRDzoQ0/r3uJwB83XUVvnS477tot6Lf5UP
	 xr9OrYZmqtMhNMJZL+WFk7Ler38ASARXAHRLeIHAznIqSj/pfkLhvPCwAiKv+slvOow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794107683;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YHRvZIgqVzcYKoSUOa2Xqv2YSwqjHTEgDzR6R5zPtgs=;
	b=eIx/VCgdTijb+D7vzUcvs9riO4FSszhTrcDMbpfJoR9Xhy2YLtQWWlg2nY3LdP+bqOO3
	 9XnQu8t+Yl8hLGQaPqyyb9+QR8RG3SEIFErhh2LHtgc12zT33OJmiY242joi06ISnU7wC
	 JbmWa0I/5hwK5xwFKzTJQzKRHWaSK/D8Pf2QbpWeq+3KPhkIXyKM2Z3BQBOo3K26BMYHk
	 WToDgopJZWlP5GQDCQ5cQSqF4+VoUlbBNvBF2wXkokBSmAI+y5JXMtMgE7PsgtboAwv4T
	 6wD4F3PzBOVydBE/O+xdCiFs6qXyTpR8Mikw4irSAzWuBijeWJBX1blc4KX96Kbj2BA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DB861F008A2;
	Sun,  8 Nov 2026 03:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794107683;
	bh=YHRvZIgqVzcYKoSUOa2Xqv2YSwqjHTEgDzR6R5zPtgs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ew0vOkk/fv0JsLqlRi9fUmJxvC4fwSKt4u6E/QLg6U0sKPMJf8l2RYEIHRk7f+8Fu
	 Kb0vMZpaNvs7W7jpP5WoDUYW1JxkkO1EMxdIAXv/aKEHCA2O6u6y6QWBm8tu2t4/dR
	 wTruaGwUByw1Q7et4eUZprsgV+uCWozfpWdPtKebEieXTGpWU2Qv7SjE0HS6Qioe7V
	 uvL+vF3u9TkP3orgYVO6Sp1hnjH9wCNEcIFWWqs/BB1XCuzKF6XDpXIwXZEv6wQ8Mc
	 6fnuTW3jptTR3/PQgxPMvRiZF2XDEfo32aGU2GS0cJT/5SuJjNOj6itsACuUf5HOaN
	 zyo65jeZqtzDw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E3D8B47DC2;
	Sun,  8 Nov 2026 03:14:41 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 19:14:42 -0800
Subject: [PATCH] staging: most: dim2: use atomic_t for channel state
 counters
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
Message-Id: <20261107-staging-dim2-atomic-v1-1-6eb4e8f1f63a@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgAo3Bq5QupnESRzCWTCwF8
 e5N2+Vb/H+AchFWGLsDCr9EZcsN5tJBmCknRpmawfbWGdMPqJWS5ISTrBapbqsEdJ78NfrIFB2
 08lk4yvt3vd3/1v2xcKjfFZznBymVmeZ3AAAA
X-Change-ID: 20261107-staging-dim2-atomic-68a85f8feaf6
To: christian.gromm@microchip.com, rajveer.chaudhari.linux@gmail.com, 
 gregkh@linuxfoundation.org, error27@gmail.com, 
 parthiban.veerasooran@microchip.com, shyamsunderreddypadira@gmail.com, 
 marusik.adamenko@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=Ii9BCHVX5TgM8cAejB89bBMykIT8SDp5IxFLV81pPhs=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFnvXypmejyLT3GKnGHGu+GXwwQNIe6H0mGvu1L7fpxSC
 XA/zb+ho5SFQYyDQVZMkUVMhud9/X2dOGurOSdg5rAygQxh4OIUgIlIJDD8D7Zhqf3NFRbAzVoz
 76/5qaBAXefeSh0np+0X121hqNMqY/hnVxD5PTTLqvhznszz+O0/TH3mmr3rzVZ7v3L3uv1VxmI
 8AA==
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

Replace the volatile int channel state counters with atomic_t and
convert all access sites to the atomic API.

request_counter is incremented in the AHB interrupt handler
(channel_service_interrupt) and read from task context
(channel_service), while service_counter is updated in task context.
Plain volatile provides neither atomicity nor ordering for such
cross-context sharing, see
Documentation/process/volatile-considered-harmful.rst.

Use atomic_set() at init, atomic_inc() for updates and atomic_read()
for the comparison in channel_service().  No functional change is
intended.  Unlike the earlier attempt that only dropped the
qualifier, this converts the access sites as well.

Compile-tested only; I don't have this hardware, so testing on real
hardware would be appreciated.

Link: https://lore.kernel.org/linux-staging/2026072515-domestic-cardboard-f657@gregkh/
Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
 drivers/staging/most/dim2/hal.c | 11 ++++++-----
 drivers/staging/most/dim2/hal.h |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 4f137ef846a3..ca931782b06c 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -419,8 +419,8 @@ u16 dim_dbr_space(struct dim_channel *ch)
 
 static void state_init(struct int_ch_state *state)
 {
-	state->request_counter = 0;
-	state->service_counter = 0;
+	atomic_set(&state->request_counter, 0);
+	atomic_set(&state->service_counter, 0);
 
 	state->idx1 = 0;
 	state->idx2 = 0;
@@ -634,7 +634,7 @@ static bool channel_service_interrupt(struct dim_channel *ch)
 		return false;
 
 	state->idx2 ^= 1;
-	state->request_counter++;
+	atomic_inc(&state->request_counter);
 	return true;
 }
 
@@ -682,8 +682,9 @@ static u8 channel_service(struct dim_channel *ch)
 {
 	struct int_ch_state *const state = &ch->state;
 
-	if (state->service_counter != state->request_counter) {
-		state->service_counter++;
+	if (atomic_read(&state->service_counter) !=
+	    atomic_read(&state->request_counter)) {
+		atomic_inc(&state->service_counter);
 		if (state->level == 0)
 			return DIM_ERR_UNDERFLOW;
 
diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index 5d69a5e7d299..70b10793cf84 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -9,6 +9,7 @@
 #ifndef _DIM2_HAL_H
 #define _DIM2_HAL_H
 
+#include <linux/atomic.h>
 #include <linux/types.h>
 #include "reg.h"
 
@@ -34,10 +35,10 @@ struct dim_ch_state {
 
 struct int_ch_state {
 	/* changed only in interrupt context */
-	volatile int request_counter;
+	atomic_t request_counter;
 
 	/* changed only in task context */
-	volatile int service_counter;
+	atomic_t service_counter;
 
 	u8 idx1;
 	u8 idx2;

---
base-commit: a41e364995bbcfa627418a70fe913c35b7510728
change-id: 20261107-staging-dim2-atomic-68a85f8feaf6

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


