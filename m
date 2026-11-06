Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956654;
	b=PatcQhddrudi3UnP97EK5q0H/aSGCEcsuuxR7MInm6I7oe20JHMe0FenXYiSXWZq/jR6
	 gkJUcJiK6ZvK46RNJaR+K5/ikUgQYGnVHGs6dbrDvrIXM8/y4tyjzqFpO4WMKObZbTdbr
	 cnqvOt5FRBedXZbRv/odfk9V/76n++7VjfkUNjpmmohDV+D0ev1YiTYk1WlzkviZ2+M1e
	 MBXWq1ga4J+KPyCpafHDRGvOe3QOt/uC4cjLpN/ApldIZs4PgmDmrC4n01anBghZmzJ2F
	 UO88+NA3Pi7vgIc7HIviu2fmnbBYa4JPLGI0n7XDrceSSAAY5iGErSt1e45eNu1jg1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qkoa4JjbduXa9PqVRLfMlrE2VG0vtHuiXJ+cXhPc0zs=;
	b=okFhA7XE1z7BdrzgdHpEmRNXIBYhKd/hcfaDeRem+SPY5R0pED4NBsoNq+9M53PFku8l
	 ARPybhNyhfSBXFgWTC3lutUM3B+6Aex7nqdbh04Rj55On03bbgAj3pCZiB2s2uCrZPv/q
	 32AbKJgSjKUOCLVSIbWI52Es+MTAUiLLCH66QCiZ4XNtq6maZ3qkIDe6MH36KRcQ/MZjR
	 +uw7rK6Hqd1GrMYg4vkacQutFDwH+ggomLC0aGlvJX7axEnK9zdHVuMAul/f4ttYATEIT
	 kA6LKi85GYVYZqwYYrBbq56cFp4rGfsZfHUIsE7blzq/ODZ8pg74ZmPt8O1yk2MqTfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sR21NDOs;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E48606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E48606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sR21NDOs
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so662014c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956653; x=1794561453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qkoa4JjbduXa9PqVRLfMlrE2VG0vtHuiXJ+cXhPc0zs=;
        b=sR21NDOsT2urRl/6BhV8IyYgU6O+dWimfTr87BNN37EUbJv8NMPyf8BT3ZAQ5T/WC/
         yVSZNVibG9thYJUL+qqzTQAgluQkq+T5N2q0YQn5bn7eeoQD7I/RYO8SR6ScOT9Yf4hw
         k66Ehl5cHmNtSgKBvut012uuweQK43BUUROWxJhODLn+z7AWRBZLz21dkJiVuRbun1Ie
         KBasRtZdorEpq0megDrHywdzBi0XcXHJDodP/scDsLwidoOsS2JmZyks0UpC0M4kXydR
         iw27bOEDfdcGWI5Hlc6DYfJSuutjADOijXTzwWLKbr2fTsrxN8mjB4xPqNExrT4p96/9
         wviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956653; x=1794561453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qkoa4JjbduXa9PqVRLfMlrE2VG0vtHuiXJ+cXhPc0zs=;
        b=q79X8CARhloLJBwk6/e+sEnFJkN4aId1FRJ6Z4JeyCYeSHfIc5en0NHjS7F/oDN4Oi
         kebcfxwktiDtebeJI8rOp0kjyNh8EBcfmkIwqtGzcvrWE4Xg3i8bAb7g7Y8PgRhh5kOu
         YrEIKXLUq0KjTYOZI/1BohHFY/rbnOmeQvTg3hQNX+Gi8EiaXXiQY+cpOTro5bHTWvNW
         lGug7OQjIiwzAjnwiyCaErItEXD64HCe5nQieCcl3Cd/juO1pI58n5nyr7qFIZz4KvmL
         JB8UTGMnlW7Req0wJiXkQTmBSAkMDQ/yznEYRwfY4xss9fL/D8wd8CHNbr3Lyw9+3CYa
         lV3w==
X-Forwarded-Encrypted: i=1; AKwUvBwZErbkKohLofCQa0At/LZFR8HbOR7q/U77BfwiFhqknQcL1KF73p4YX8hPhTInVTLKlFexgpS0Q5RUyBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C8N+W7c6SBDxd87aAHCWvWeXXl5oMhSdLEfuigkCi3diEz5no
	4stUy0CP3Dm6S+WH01hiHz5YfMq/fLmBL3CvJKyXXa81K+2/FSdrjf+a
X-Gm-Gg: AYBFou0ncNTSHIMbUeqn9X+of97KwnKYzyBBQwEjFksF1CFkJ4MvaqBk3fufWMvORqh
	0E6jVO9++KbbAuA9/IREwXXMNptqW2GiPRyu83hta7wWEyTSgXgqlNRDDHGhgHWOAxIPkgACmcA
	CrrSrtAuTmZXlHLuu/XJeay3Y+CP5JC4LvfF1frXKy9j5jEinaoZBQon6mKSIdOeHKsmsGhUYKg
	U3serhgIIEOV+tcfGeo095UpzyT7LLWqGl9Uo9LNuZPOjPy7fDSP8RJhcpLdy6VV4zDFWXiBU9L
	tDYmjgGP1Nat+L8x4rNMCK2A7Qj/ltD+3w4m2a3V3q3nYf4KF7mpz2A7UXFyzY0O8y69MwO2dQE
	SXa9WL/AHkVOPlvSSPzqDwmRY5Lud9t9vAJuT/MV1PqDF8LgJLA08GsLUXCnNZp4lXtRDDYa/8P
	dtL6KhbvuA//UglrygdNTFZZVM8yHLRKta6NgaefZxhsYe9ZPXyo8g2Ccowhd8yMzPSkz/g2G0o
	DaZ5nZgHmvA4GgyCzBLSmAfAYMsyNQ9XGGiRY89+zefBbNBJs9rjs7EmMk4ypxBanrOFvNJUPnz
	y4Zj1wknv+IPZRqVdCJHkQnT20BMa1idommJj4oBRtS6ISCSh6ruYEvH0iD5v0LRPv21PJtjNh+
	q8GEXd3wjz/zQG03x4TQYRJHHnYmDU6mUR8IcJUuRypI=
X-Received: by 2002:a05:701b:4553:20b0:144:fb31:a597 with SMTP id a92af1059eb24-1b25d377fc4mr2228979c88.47.1793956652862;
        Fri, 06 Nov 2026 01:17:32 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:2bf5:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm4925551c88.10.2026.11.06.01.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:17:32 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: badhri@google.com,
	xu.yang_2@oss.nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before unregistering the TCPM port
Date: Fri,  6 Nov 2026 17:17:25 +0800
Message-Id: <20261106091725.1334097-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

tcpci_remove() unregisters the TCPM port before the managed threaded
IRQ has been released.  tcpci_unregister_port() destroys the TCPM
kthread worker, while tcpci_irq() can still call the TCPM event entry
points (tcpm_cc_change() and friends), which queue work on port->wq
without checking whether the port is still registered.  Writing
TCPC_ALERT_MASK = 0 prevents new chip alerts, but it does not
synchronize with a threaded handler that was already woken or running.

Quiesce the handler before unregistering the port:

- Set chip->stopping before synchronize_irq(), so handlers that already
  entered tcpci_irq() are waited for, while handlers that start later
  return IRQ_NONE from _tcpci_irq() without touching the TCPM port.
- The IRQ remains devm-managed and is released on driver detach, as
  suggested by Xu Yang; no custom early free_irq is needed.
- synchronize_irq() alone would not be enough because the IRQ is shared:
  another device on the same line can trigger the handler after
  synchronize_irq() returns; the stopping flag makes such late calls
  harmless.

The same ordering issue exists on the probe error path: if the final
TCPC_ALERT_MASK enable write fails after devm_request_threaded_irq()
succeeded, the error path unregisters the port before devres frees the
IRQ.  Route that failure through a quiesce_irq label that sets stopping
and synchronizes the IRQ before unregistering.  If the IRQ request
itself failed, the error goes directly to unregister_port.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

Testing with QEMU, a simulated I2C TCPCI device and KASAN (7.4-rc1):

- Remove path with a real threaded handler parked at
  kthread_queue_work() while the device is unbound: synchronize_irq()
  waits for the handler before tcpci_unregister_port() destroys the
  worker; no report.  Without synchronization the worker is freed first
  and KASAN reports a slab-use-after-free in kthread_queue_work().
- Probe failure path (the final ALERT_MASK enable write is forced to
  fail): the handler woken by the injected alert is rejected by the
  stopping flag, and the teardown reports nothing.
- A shared IRQ raised at tcpci_unregister_port() after
  synchronize_irq() returns enters _tcpci_irq(), returns IRQ_NONE due
  to chip->stopping, and never reaches tcpm_cc_change(); no report.
- tcpci_remove() with the ALERT_MASK = 0 write forced to fail (the
  driver only warns) while a continuous alert stream is active: the
  teardown completes, no tcpm_* entry point is reached after the TCPM
  worker is destroyed, and no report appears.

These are injection-assisted reproductions; they do not measure how
often the race occurs on physical hardware.

Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes since v1:
- Follow Xu Yang's suggestion: keep the IRQ devm-managed and use
  synchronize_irq() instead of an explicit devm_free_irq().
- Add chip->stopping and check it in _tcpci_irq(), because the IRQ is
  shared and a handler can run again after synchronize_irq() returns.
- Quiesce the IRQ on the probe error path after the final ALERT_MASK
  write fails; an IRQ request failure still goes directly to
  unregister_port.
- Revalidate the remove path, probe failure and a new shared-IRQ
  trigger after synchronize_irq().
v1: https://lore.kernel.org/r/179378589227.74015.8259496684787732118@gmail.com/
---
 drivers/usb/typec/tcpm/tcpci.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..2a3ed5195abd7 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -50,6 +50,7 @@ struct tcpci {
 struct tcpci_chip {
 	struct tcpci *tcpci;
 	struct tcpci_data data;
+	bool stopping;
 };
 
 struct tcpm_port *tcpci_get_tcpm_port(struct tcpci *tcpci)
@@ -818,6 +819,9 @@ static irqreturn_t _tcpci_irq(int irq, void *dev_id)
 {
 	struct tcpci_chip *chip = dev_id;
 
+	if (READ_ONCE(chip->stopping))
+		return IRQ_NONE;
+
 	return tcpci_irq(chip->tcpci);
 }
 
@@ -972,12 +976,15 @@ static int tcpci_probe(struct i2c_client *client)
 	/* Enable chip interrupts at last */
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
 	if (err < 0)
-		goto unregister_port;
+		goto quiesce_irq;
 
 	device_set_wakeup_capable(chip->tcpci->dev, true);
 
 	return 0;
 
+quiesce_irq:
+	WRITE_ONCE(chip->stopping, true);
+	synchronize_irq(client->irq);
 unregister_port:
 	tcpci_unregister_port(chip->tcpci);
 	return err;
@@ -993,6 +1000,18 @@ static void tcpci_remove(struct i2c_client *client)
 	if (err < 0)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
 
+	/*
+	 * The port's kthread worker is freed by tcpci_unregister_port()
+	 * below, and the threaded IRQ handler queues work on it without
+	 * any port-registered check.  Publish the stop state and wait for
+	 * handlers that already entered tcpci_irq() before returning;
+	 * handlers that start afterwards return IRQ_NONE without touching
+	 * the port.  The devm-managed IRQ is released as usual on driver
+	 * detach.
+	 */
+	WRITE_ONCE(chip->stopping, true);
+	synchronize_irq(client->irq);
+
 	tcpci_unregister_port(chip->tcpci);
 }
 
-- 
2.34.1

