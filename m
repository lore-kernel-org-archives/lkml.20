Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD63DA7FB;
	Tue, 29 Sep 2026 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712686; cv=none; b=L6UxppQ147K26ScGAGsc+Uw2UtxQy8aHJ0OgTDAKhpINk3mBPCBF6aY3EDNsrGnzzcPkjPQEkSGtgkwwTn/CepspfiiSJLISmQraoc8v+9omJ2GQc/xRK2sbQlHLSk4TG8/5uXSyzmVm+3iJb0rIbqTqsEueTU8gupjK3LSOGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712686; c=relaxed/simple;
	bh=bDuMYlPEa0AAmMMpU9ra82upyp5n/ne9CXaVAn+1oPw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RAvlRcoiUQHrmt01E81mnk1jU141zHISwq6HTujXAeFzmmwVvHLZ5gA/RCBi1Rb1oIDv888ZiFtL31YjCEF4xaJy7vEaffPwxqV42i9yoqXgu//26B5Ypmp8y6VZ/dokXwbNBuhv5RwpMAVdjDd5mfuKoUhtL9huQGdDQCrWnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CV5gnUU5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YBCHZxPY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CV5gnUU5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YBCHZxPY"
Date: Tue, 29 Sep 2026 20:11:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790712683;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egHTbs6R9u3RyquDZQOU9N9uSwL+t5saiNu0O8JsGFA=;
	b=CV5gnUU5YBT52WOQq/EApQ+wk+cxq2en9tpvCCYIkSAKjLE6zC61NJjbeVsOVw2w06Mole
	yeloXNo5n2HwouSe9M6/FHNxpR291JhIVs2OYm38fO4rakm16ZxHBU1912qXNBgBnnG2I7
	lkYPf+rfbUUxhC/5PT4nvntOjPKWG0YxDz2fyaUAC3vY5oQicQ734ZYWtkwxNW8t5TV8yc
	2YoT957JHtieoqDwKMFHqWXbcACwFKNIr5VX1bvstgKRkiCm08hQT+xxYRLbdolTf8jQNK
	PRE/A9K5f4A/sBneuvHNZdchOolniLBSzhJFwcJ4c87R6JZ083J7dcY2Get8gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790712683;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egHTbs6R9u3RyquDZQOU9N9uSwL+t5saiNu0O8JsGFA=;
	b=YBCHZxPYeU7vHC4YI9PPfRU2b5pJTewmBhY49QNA3MHqt+g/ysbvhrVFt7izOnDzodv8bF
	MBpQmUZoeq+vYMCQ==
From: "tip-bot2 for Qingshuang Fu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] selftests/timers: clocksource-switch: Fix
 unchecked open()/read()
Cc: Qingshuang Fu <fuqingshuang@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260825064605.472889-1-fffsqian@163.com>
References: <20260825064605.472889-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071268156.3910103.1493041610848293334.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     348f54c435bf3177baa78201952810b255d44b30
Gitweb:        https://git.kernel.org/tip/348f54c435bf3177baa78201952810b255d=
44b30
Author:        Qingshuang Fu <fuqingshuang@kylinos.cn>
AuthorDate:    Tue, 25 Aug 2026 14:46:05 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 22:05:04 +02:00

selftests/timers: clocksource-switch: Fix unchecked open()/read()

get_clocksources() and get_cur_clocksource() open and read the
clocksource sysfs files without checking the return values and without
NUL-terminating the buffer.

If open() fails, read() is called on fd -1 and returns -1, which is
stored in a size_t as SIZE_MAX.  The token-scanning loop in
get_clocksources() then walks past the uninitialized stack buffer,
reading and writing out of bounds.  Even on success the buffer is not
NUL-terminated, so a fully read buffer makes the inner scan run past the
data, and get_cur_clocksource() lets change_clocksource() call strlen()
on a non-terminated buffer.

Check the open()/read() results, use ssize_t for the read length,
NUL-terminate the buffer, and close the fd in get_cur_clocksource().

Fixes: 7290ce1423c3 ("selftests/timers: Add clocksource-switch test from time=
test suite")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260825064605.472889-1-fffsqian@163.com
---
 tools/testing/selftests/timers/clocksource-switch.c | 23 ++++++++++--
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timers/clocksource-switch.c b/tools/test=
ing/selftests/timers/clocksource-switch.c
index db62a76..2e86f56 100644
--- a/tools/testing/selftests/timers/clocksource-switch.c
+++ b/tools/testing/selftests/timers/clocksource-switch.c
@@ -40,16 +40,23 @@
 int get_clocksources(char list[][30])
 {
 	int fd, i;
-	size_t size;
+	ssize_t size;
 	char buf[512];
 	char *head, *tmp;
=20
 	fd =3D open("/sys/devices/system/clocksource/clocksource0/available_clockso=
urce", O_RDONLY);
+	if (fd < 0)
+		return 0;
=20
-	size =3D read(fd, buf, 512);
+	size =3D read(fd, buf, sizeof(buf) - 1);
=20
 	close(fd);
=20
+	if (size <=3D 0)
+		return 0;
+
+	buf[size] =3D '\0';
+
 	for (i =3D 0; i < 10; i++)
 		list[i][0] =3D '\0';
=20
@@ -74,11 +81,21 @@ int get_clocksources(char list[][30])
=20
 int get_cur_clocksource(char *buf, size_t size)
 {
+	ssize_t len;
 	int fd;
=20
 	fd =3D open("/sys/devices/system/clocksource/clocksource0/current_clocksour=
ce", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len =3D read(fd, buf, size - 1);
+
+	close(fd);
+
+	if (len <=3D 0)
+		return -1;
=20
-	size =3D read(fd, buf, size);
+	buf[len] =3D '\0';
=20
 	return 0;
 }
