Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC735CB7F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039694; cv=none; b=OfFx66zynE/PE4HtTvVyVxc48ewp8IQEUYJcCpGbhAsgUHKcjYQlAFrle2Edw7h6C90zvT+Atufu3q+5K1y1SzTUMqckDCgOq6iJL9CuvNXsyV6QHSELhFAkYUOdpU7frbeOdIf8UwbiIA82zKlsDIBn20DPgejmB2an4oc3WxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039694; c=relaxed/simple;
	bh=m3LsZOYKXpBxu2jAlB5YJTHDy68xjmQ8m4RqAnY7buc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S/m4xSxb60ArSf26fwNEGaDS/ms8AcMtqzD8Cv9BAUk0ZxHPs4ejEzHJUXeq+BsNAyWJLyM4p4RK/Zw69G4PZCLHJ/3KiTz3UbBR5OeZ+R0XWlK6T7azN0FD5kFVdfIaQ1fHlkCT83CY4MxRfoStSXl82HiJ2ggaMJyygxOTpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OshD3BQf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OshD3BQf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82C0BC2BCB3;
	Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790039694;
	bh=m3LsZOYKXpBxu2jAlB5YJTHDy68xjmQ8m4RqAnY7buc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OshD3BQfh9BhJu5uNQp2FG3/KqPInw+5i8WTKaJ43CSjwpWEPppk+JHwKLD0tV2DK
	 WXO0iN3LmPo0mA7JMoLS1p/28CSZeD6A5yg6pk+GsaaICj5V/uiahLdjodn4FXKrkz
	 rWkV8Fl66NWLd38Pk7Ek98gf97OqNm82xcqM+3EsoHnClZRC8u2cJN660XLz/ErUvU
	 +Ks9wMJjqOkbBz74Z3af6x7EB3aUxKIlXypXYt0CgwvCuMUPl99pgshozZQ/QJVFzl
	 SYdPYY/U/vXye+/ACk5m5r9cm8aQLhE3fuCoNMmc8mriV7rGF8fI1g9dciTFd1zOSe
	 w50U7GrIVY+MQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E744C982FB;
	Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:14:52 -0400
Subject: [PATCH] firmware: arm_sdei: publish sdei_entry_point with release
 semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-arm-sdei-v1-1-6d12d12a7cba@vt.edu>
X-B4-Tracking: v=1; b=H4sIAIvWsWoC/yXMzQrCMBAE4Fcpe3YljVKNryIe8rOxKzTKrhah9
 N1N6vEbZmYBJWFSuHQLCM2s/CwV/a6DOPpyJ+RUDdbYwTjb4xTQy4SaiDEPLjtjw7k3CeriJZT
 5u71db3/rJzwovttFawSvhEF8iWOLNs6n/QElHmFdf6MD9r+PAAAA
X-Change-ID: 20260921-mb-arm-sdei-f69f902b810d
To: James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790039693; l=3316;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=kwRV/aHBCufpjFjA3xGTlvIAqmYK7kG+Dzi8qsvpfdU=;
 b=Fgbe9A5j8oOXTX+D4bvOXfcOfpfGlHrCYiIHUVy5lzThSYDd/gVtl2n+KkwU/cSS5swWUe4rz
 cfIXERHDaG2CXS+vG1wOV/wF4ctaKXQuHdeBN2m3d9IcRLLINEGmlme
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

sdei_probe() stores the SDEI entry point to the file-scope
sdei_entry_point with a plain store after the platform reset.
sdei_event_register(), the cross-call helper _local_event_register() and
the re-registration path pass it to the firmware with plain loads.

Keep it in a local and publish it with smp_store_release(). Read it
through a new sdei_get_entry_point() accessor at the three call sites.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/firmware/arm_sdei.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
index e8dd2f0f3..a75203469 100644
--- a/drivers/firmware/arm_sdei.c
+++ b/drivers/firmware/arm_sdei.c
@@ -43,6 +43,12 @@ static asmlinkage void (*sdei_firmware_call)(unsigned long function_id,
 /* entry point from firmware to arch asm code */
 static unsigned long sdei_entry_point;
 
+static unsigned long sdei_get_entry_point(void)
+{
+	/* Pairs with the smp_store_release() in sdei_probe(). */
+	return smp_load_acquire(&sdei_entry_point);
+}
+
 static int sdei_hp_state;
 
 struct sdei_event {
@@ -582,7 +588,7 @@ static void _local_event_register(void *data)
 	struct sdei_crosscall_args *arg = data;
 
 	reg = per_cpu_ptr(arg->event->private_registered, smp_processor_id());
-	err = sdei_api_event_register(arg->event->event_num, sdei_entry_point,
+	err = sdei_api_event_register(arg->event->event_num, sdei_get_entry_point(),
 				      reg, 0, 0);
 
 	sdei_cross_call_return(arg, err);
@@ -612,7 +618,7 @@ int sdei_event_register(u32 event_num, sdei_event_callback *cb, void *arg)
 	cpus_read_lock();
 	if (event->type == SDEI_EVENT_TYPE_SHARED) {
 		err = sdei_api_event_register(event->event_num,
-					      sdei_entry_point,
+					      sdei_get_entry_point(),
 					      event->registered,
 					      SDEI_EVENT_REGISTER_RM_ANY, 0);
 	} else {
@@ -650,7 +656,7 @@ static int sdei_reregister_shared(void)
 
 		if (event->reregister) {
 			err = sdei_api_event_register(event->event_num,
-					sdei_entry_point, event->registered,
+					sdei_get_entry_point(), event->registered,
 					SDEI_EVENT_REGISTER_RM_ANY, 0);
 			if (err) {
 				pr_err("Failed to re-register event %u\n",
@@ -978,6 +984,7 @@ static int sdei_get_conduit(struct platform_device *pdev)
 
 static int sdei_probe(struct platform_device *pdev)
 {
+	unsigned long entry_point;
 	int err;
 	u64 ver = 0;
 	int conduit;
@@ -1007,12 +1014,14 @@ static int sdei_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	sdei_entry_point = sdei_arch_get_entry_point(conduit);
-	if (!sdei_entry_point) {
+	entry_point = sdei_arch_get_entry_point(conduit);
+	if (!entry_point) {
 		/* Not supported due to hardware or boot configuration */
 		sdei_mark_interface_broken();
 		return 0;
 	}
+	/* Pairs with the smp_load_acquire() in sdei_get_entry_point(). */
+	smp_store_release(&sdei_entry_point, entry_point);
 
 	err = cpu_pm_register_notifier(&sdei_pm_nb);
 	if (err) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-arm-sdei-f69f902b810d

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


