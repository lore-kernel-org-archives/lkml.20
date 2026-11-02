Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638815;
	b=0OOvoLCJZP+kfhKVKBWHqycawixgDmGNsf+a2pR4yUOVbLHQNHk+dJaqae8jm3gCJsUS
	 8V5UC8ZtpE8LM5cct2zyaphZ70wj94bfWaK/juZ8/3UuEvapVoLYL+JeiXZVXBk8z5qLB
	 pvgvklDPwY7HsonSTq4YYCpMcjskbhlc5WhRmvmy3Yf/1PgSNDdEkZdyBEdzroUsE+Jus
	 qtNP8vgEdnTx9naMSZf6c/KBLlHZHOyV8buMLQgeQ/LG8jU/QxtRYJmNacXIzg226BO06
	 j/vvf9uyJskQY93Ac6v5aCfhDiO2qguqdiIAkI3ivU5wA9S0TGIQfO4zHPQ+caerj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gj+cEnUX//I8NTeCN+X3F8KLHoyCJOOVE92EzAIsAdg=;
	b=tu01NoUEjj0FOlig2WBqfKUrLkPojL9W5cvOgDtpG+pXKRIZghX8HheD8kp4kyj5lUGf
	 ciOpr1E/0Ath95dEtJAd7lagZ8uQiyWmrelHLtr/S64BetU3Yg1cq4zaza8YmQaFS5uNK
	 ooot2pIhHKxUbaWEHAVhYbCR/RTMEqVPhCa8oa1Umtzh6XIkpF2U15/ilacups4OVdTdL
	 0wvYJQqUhY6Al2fOO2dgOFzr/I8MiT2ONVGs1xZYIpqnhmLfEEJWMVXvqRLmBFT1NyMNt
	 GmcYKMSTsVcM7wveRfJhjlawySV3fV15BkMrvvajhhan0Vp68e01ZFyUniCqwBrf+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=lXQGkVQZ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF20606A592
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF20606A592
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=lXQGkVQZ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso2523694c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793638814; x=1794243614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gj+cEnUX//I8NTeCN+X3F8KLHoyCJOOVE92EzAIsAdg=;
        b=lXQGkVQZDqQD70UuI+r6mqvyH2Roh67io4mSjOU6eBRIP4qTLqJylEtWlj35kB64H5
         EZfB9tVXpuN5qaKHFUqUYyO8YJezGhAYpLzniDHEDy6V2IKCeMy9+rqVY+bccvu6/7Et
         eEQXzdjSavrJDIZEWouHb3htYjXUUz8tI6FeblePdx6tvmPjE+Dbus8REeahqXQDKz8H
         2xloDTiSYGa5V9eM2/UKrYIIeHKdCUUBuNYec+9MKwZPY0jqRReYaRKIFwdFYui8k5v7
         1OQroqp3Qtruar5VDPDPjuVgfDWy4j5KmTfXDpzaCm8505njDYFuSfNTN09BzoNz52p8
         a9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638814; x=1794243614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj+cEnUX//I8NTeCN+X3F8KLHoyCJOOVE92EzAIsAdg=;
        b=QrIYl5J60Bs5uJWIfDcib5VJ6TNK7C53s15IbAxSIp4WaVEVrXvFMqKZoWtnMRM2P1
         FqUcoxmNcDIVX7lbESB9XkkK9QoDa49xcag7DCpTjHOzEHEOr7ViFHQqz7gvtA7BCxCR
         XHnSBkR/nFvDl0t3W5Q9ZOSyua5pbzxM2J6I57s0n/thMqDw5PagDOBdNuiY6iI2SIpX
         ROM3z+HeH8AK5ORfTDU2iCv7dbuX9gU2SIiO5ZVbFH/MvAlX5ImVSKI6GQRhrT8x6KAZ
         ZdgVu2r46ZqsLBZRA8X4uFkXjWQOYsgFl5ztUTR3SmPaED7g6cjGitDHb8YaU3awq1g/
         bM4w==
X-Forwarded-Encrypted: i=1; AKwUvBwh/46y8wHa/d+i///lhGlK7xb3kgLKzDlHDKPmzFZEL1zmOQ1FD8DtETxw9FdERHWyPaujsV++ImCloxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwxbAwQxFD3PM0plfSFI/gNd4cVDWrPv72UGthv8eEU2jy1xp9
	iAFIup9WGVcJjxKeScpFCYsm0oWy/VCucG1oPSoMM0ybmSMpL3ITeH+nM8LlOGBqzfg=
X-Gm-Gg: AYBFou2G1tTxPEA/QqMdEaLBsRvBhgJxFcma29WFMCKMcRKWY6c04OtWXq22UqNJ4y5
	TNtsgOw+NR+aL7cUc9E/171lP0nBPqecKxhjtEcRaZkharwnr41hUTp+6tr6oEm6xDluKTQjXYy
	H6tAiR0v2/ZYej1AHu78qIm17YosVdBhyZ2ClC3tODeehlKnl8gRJeRgiJ6xY+VFid8G1hYJbDW
	8WUCPILHgfu7i3Hn0ejelKTnUpdTnWeyX8jSiyW+ZnzU/fvgennOnK2mT8uRfyrMF+/HovD92mQ
	BjJEfGTcrJBDzLQfPW70BsCDFvlELBQ/3+ETx8gMM7tXe5hMYx8hmm6l5asp5HqiwIohijSi/cz
	E0UgOgw6oIDlsUPumLZ6R/sAveDKocOFAx53CNuo7KEUodCQuW2YEUynvv1c8RVeDxXUgSjzn9I
	PBnjkkERuvUE7DdU5JMES9dh3o7ohIxuhtmv67knUq8FS+buQIack6bUkRH3G0biKDNVQxOdzwA
	SZbpa/py0PlZWNkefZmY7D4D+wBEJPWVwXaJObGQHNowe4MP8yAAT+qiugulJBbEHFZKhdIbqzG
	hYlCrj8833w1NoSrpUGY8wqBA0MSRIIhZ1diMFGs+Wqvp/XTl0FWp0XVm/ScQQQI+dxV3usJkav
	vU63fSt3qAF4bXU6SxjA4kIqf3TIFxBFGtMqSzecyVFwk9kSfVNKf/acgHNmdaEuBEgl1p83BHD
	zpF/zOxluG8227wz7n
X-Received: by 2002:a05:7022:b889:b0:195:8fa1:b447 with SMTP id a92af1059eb24-1a9494d8f22mr19453283c88.12.1793638813082;
        Mon, 02 Nov 2026 09:00:13 -0800 (PST)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm35506402c88.21.2026.11.02.09.00.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 09:00:12 -0800 (PST)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH v2] Bluetooth: MGMT: Send Connection Subrate on LE connection and update
Date: Mon,  2 Nov 2026 09:00:08 -0800
Message-ID: <20261102170008.62788-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
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

Userspace is not told the parameters of LE connections: the Connection
Subrate event is only sent for LE Connection Rate Change, which needs
the Shorter Connection Interval feature, and nothing is sent when a
connection is established or updated with LE Connection Update
Complete. Applications that need the connection interval, e.g. to
estimate throughput or latency, have to read it from HCI traffic
instead.

Keep the connection rate parameters, which the event reports, in sync
when an LE connection is established and after each LE Connection
Update, with the interval converted to units of 0.125 ms, and send the
event then. As these do not report subrating, keep the subrate factor
and continuation number of the last connection rate change, or 1 and 0
if there was none. Load Connection Subrate then also compares new
parameters against the current ones rather than those of the last
connection rate change, and a failed connection rate change reports
the current parameters.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Changes in v2:
- Keep the connection rate parameters in sync and send the event with
  mgmt_conn_subrate_notify() instead of a new function (Sashiko).
- Rebase on bluetooth-next 42b8c2d729.
- v1: https://lore.kernel.org/linux-bluetooth/20261030144106.75414-1-kevin@simpleble.org/

bluetoothd already registers the Connection Subrate event, and only logs
it for now. Once this is merged, I'll send the BlueZ side: it exposes
the parameters as properties of org.bluez.Bearer.LE1 (Interval, Latency,
SupervisionTimeout and Subrate), and documents the new cases of the
event in doc/mgmt-protocol.rst.

I reused the Connection Subrate event since it already carries the
interval, latency and supervision timeout. If you would rather keep it
for the connection rate procedure, I can add a separate event instead.

As the rate parameters now follow the connection, Load Connection
Subrate no longer requests a connection rate change for a connected
device whose current parameters already match the new ones. Before, it
did so until the first connection rate change.

Tested in test-runner with the functional tests of those BlueZ changes:
with this patch both hosts report the parameters once connected and
after a connection update, and without it neither does. The kernel
testers and the HoG tests, which also use Load Connection Subrate and
watch this event, pass as before. Only tested with the emulator.

The PHY in use could be reported the same way, but the kernel does not
know which PHY a connection starts on, so that would also need LE Read
PHY after connecting. I left it out for now.

 net/bluetooth/hci_event.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index d05934fef4..6330f2da99 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5886,6 +5886,26 @@ static void le_conn_update_addr(struct hci_conn *conn, bdaddr_t *bdaddr,
 	}
 }
 
+/* Keep the connection rate parameters, which the Connection Subrate event
+ * reports, in sync with the connection parameters and send the event. LE
+ * Connection Complete and LE Connection Update Complete don't report
+ * subrating, so keep the subrate factor and continuation number of the last
+ * connection rate change, if any.
+ */
+static void le_conn_update_rate(struct hci_dev *hdev, struct hci_conn *conn)
+{
+	/* The connection interval is in units of 1.25 ms and the connection
+	 * rate interval in units of 0.125 ms.
+	 */
+	conn->le_rate_interval = conn->le_conn_interval * 10;
+	conn->le_rate_latency = conn->le_conn_latency;
+	conn->le_rate_supv_timeout = conn->le_supv_timeout;
+	if (!conn->le_subrate)
+		conn->le_subrate = 1;
+
+	mgmt_conn_subrate_notify(hdev, conn, 0x00);
+}
+
 static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 				 bdaddr_t *bdaddr, u8 bdaddr_type,
 				 bdaddr_t *local_rpa, u8 role, u16 handle,
@@ -6032,6 +6052,7 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 	conn->le_conn_interval = interval;
 	conn->le_conn_latency = latency;
 	conn->le_supv_timeout = supervision_timeout;
+	le_conn_update_rate(hdev, conn);
 
 	hci_debugfs_create_conn(conn);
 	hci_conn_add_sysfs(conn);
@@ -6296,6 +6317,7 @@ static void hci_le_conn_update_complete_evt(struct hci_dev *hdev, void *data,
 		conn->le_conn_interval = le16_to_cpu(ev->interval);
 		conn->le_conn_latency = le16_to_cpu(ev->latency);
 		conn->le_supv_timeout = le16_to_cpu(ev->supervision_timeout);
+		le_conn_update_rate(hdev, conn);
 	}
 
 	hci_dev_unlock(hdev);

base-commit: 42b8c2d729268a65a2d98064e8dc59ff53646b14
-- 
2.53.0

