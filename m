Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782884;
	b=nLoMFZGnG1jUYoupvKCDnLNOiED0UIYpHC821nefP0Fc1B4OB+T7EY1hz0wkJFRJbyCA
	 tRhYGNXm6Q7QfAAqAzrDWn0FA9tjfV8R/uJmmXTb3z3qV2PVG7zSsLT9gqGFSL8tVLtHO
	 lMDOhIzIN6UmcFFGSYnVqjDtBAbUfScICytYsgLeM/9Qvqo4iI0iUzQM6PJZ3/lUH30gn
	 l5mA0Z6zjnU1bRg4XOOQA3qpFppTW3BFI5e7yN/ITj3qAloC9ZmhpH743VE1xOM26il45
	 ltPx1paSevzXE6o4mz4uQ8fTMRiLB42NBL1LIyXGYqmBqsv65j7DERYwh2tDT4BO6iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lXa2AchWhcQsSea10nNai+tedxcsrEK3LOyVBhP51Y0=;
	b=a+NuuQhyyun6u3uVonHKR25z4IcE9IUsdtfcDuz0StnDo7S7pdol3CE/p2lqkE4GGMXk
	 vhdwGj5eAOOD2shFUHNHAgGDGnb0Gy1bcIKTk7Y6leoUGkmaxDdt8XKbbAV/1fcaL6v2u
	 ChwK4LMIbHo4qK0KOXaZmu8bZtemxPXuEXzNpobJSjLPVZMVHB8xWAJkSkVFSEU/wrC1T
	 37gyhCuUxx/XfdDskEjID6u1dof30sax6x7WZirddD7tK7aA7i3fBfAkoMK3AyNRh/R1Q
	 nswrsAOaB7PDehlcG53nJWe7E1+xPbsRHKKaDtw4awjb7x0zfhmgc4rJymFa3IdPWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=fRhW3hsa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 454F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=fRhW3hsa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35943f55c06so1550830eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1792782883; x=1793387683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lXa2AchWhcQsSea10nNai+tedxcsrEK3LOyVBhP51Y0=;
        b=fRhW3hsatCUMpov6em4vui6CaHgUFPBaMeu48uj0IrcQQhGl7jLkKrJVplz024QnsM
         bQmW5LANOmOpsj6DQq02mdI4taTw7DhvVi9Gg6SzTh2mUJs94GVzVDtLfx/yaAl2bpU8
         6niSsDgBIbgOU0lb6/FU4Tj1wI4Ork3FdElYjFHVkKDBM3XJk070EpawKt8F/Bifm3v7
         FNw/9aMFyqq7H1tBwSUG2ztHBScE1+W5lHLoreqowMKyRMgCakW+/RmW14vkMEo3SnV5
         DiTuSifX8B0hKQdb4zxyG5z6OFrASkC4WwLtqSoEMaIdGex5tW/x3whJuQZQ6xWQKsSG
         4CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782883; x=1793387683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXa2AchWhcQsSea10nNai+tedxcsrEK3LOyVBhP51Y0=;
        b=PgEBqm6grj7k8+eWTPSHhM417oMR/XhviaWvyPgx3Q9iZPmp4Da9YOOx/bVUxPL1R2
         Q2YWFX+yvCf3G9YynK0/D0xajrWj8vdHB3s2fBVPR7YSN7a1eDNgDLNxsFoE5PsDMYYM
         P52Q1b0IET0VHhpZBB/G0qvofUsxGpbt0FF1DrMiawDFzZ1P+fywgl7PeG+w3bxAqW7D
         OESFUr8eWAEFihdmbqic9gGmWtcq6Z2JBu7oSip40REWFaziOzF3lhOLkJKfMKBOap18
         /8rtHEBABEL200gJQulTnOcJS3jZjwfkTtJuV4cESpx66/nP3wwUHFooKQ038ByAYjKQ
         zzUA==
X-Forwarded-Encrypted: i=1; AKwUvBy2HAQMR6WIvAizOgjfH+SCyroi+TRHYUUb81ItE0eKwYeiUOAgHCPg3evEv0bgKC2oj5XPLV7yGSyhLVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhynLtxhUh1lmwMpOpIok1X8fbSHge1/TMJ99xnzMOcZilM5Do
	oX9Hvbtr4ljFOrlYbf1WD2m7oLNNgftboUJNvl5LkZW6fTnFTBJkR/9dSEGRYyu1Ymg=
X-Gm-Gg: AYBFou1OBT5xCPPPQvtIFR23R7GQmMUUboG0pH4vIBAIs9c6Mgg2UkN5A9ugn8dZqDj
	z8bXwJjSYxHrZrXlAQjhjtUU5LMfoHYQVouv3/kFGMTj9l0BnHTom2eKEz6WJK3aBTlPGcHak65
	WwqXq/+IuIt6vDQ3ypAbf1kWmX+UO72RXyYP+OC+iDr1eYbNef0TWGo+Dni0g+h3NxyxkHN9MhD
	wBr1Aqi2VzZrAC6y/vBMSWEBHqlft05FFOl0P/pqaRQJgLGt0B2bY3vWWztZgy/MKK8jra4o/P2
	E36aOvP2O5CmQxim+2wYHhktqVVcN6r6kKd8r9Nr6w8mIJtFkuXMd4wKLshJ8i33JdNb4X3ms9Z
	uIpeUtL3z6Ki5Cox9lcbQS2UDoRFwdA+RyUBF+zyHRoEKa04wX8FWkr7EHYn5sahBORAPzXyNpT
	Y99F71sgeXKegCIAMhEHmn+Y3dAvxF9C/0P7N9J80JnxqiMgp5VFvsl40UKtcUMpzbKQXDwS405
	8EmqngJ1d5LnOz/XSMsbvVwpBAgFnPm7ODzGkxVkim5NwQzzGm9l1UkkrHSnLt+E7oombKjcGId
	/FeAOmsRhEj3PRWey6gS6nRvyFENW6iURsbqHobIxPzMqz5qTU8EPBHG2b0KUOXGjkUR05zWGL1
	OzkxIyrZdrbMAfhQcKo6i1A==
X-Received: by 2002:a05:7301:db17:b0:35c:49b9:3166 with SMTP id 5a478bee46e88-369e877b1b3mr240962eec.6.1792782882925;
        Fri, 23 Oct 2026 12:14:42 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec4d73sm201657eec.22.2026.10.23.12.14.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 12:14:42 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH v2] Bluetooth: hci_event: Clear explicit connect state on LE connection
Date: Fri, 23 Oct 2026 12:14:37 -0700
Message-ID: <20261023191437.87024-1-kevin@simpleble.org>
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

Since commit 6cd29ec6ae5e ("Bluetooth: hci_sync: Wait for proper events
when connecting LE"), create_le_conn_complete() only runs once the LE
Connection Complete event has been handled, and le_conn_complete_evt()
has already removed the connection parameters from pend_le_conns by
then. hci_connect_le_scan_cleanup() looks the parameters up in
pend_le_conns, so after a successful connection it no longer clears
explicit_connect, nor deletes the parameters that were only created for
the explicit connect.

The parameters of every device connected through an explicit connect,
such as an L2CAP or ATT connect or MGMT Pair Device, are thus left with
explicit_connect set. MGMT Remove Device for all devices then keeps
them as HCI_AUTO_CONN_EXPLICIT instead of freeing them, and if the
device was set to auto-connect and is disconnected, they also stay on
pend_le_conns: the kernel keeps scanning for the device and connects to
it as soon as it advertises, although no one asked for it any more.

Do the cleanup in le_conn_complete_evt() instead, where the explicit
connect request is fulfilled: clear explicit_connect, delete the
parameters if they only existed for it, and put report parameters back
on pend_le_reports. Auto-connect parameters are added back to
pend_le_conns on disconnection, as before. Update the comment in
hci_explicit_conn_params_set() that names hci_connect_le_scan_cleanup()
as the only place deleting them.

Fixes: 6cd29ec6ae5e ("Bluetooth: hci_sync: Wait for proper events when connecting LE")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
v2:
- Update the comment in hci_explicit_conn_params_set() (Sashiko)
- Rebase on bluetooth-next 27731ba091
- No change for the subrate case Sashiko also raised, see the reply
  to v1

v1: https://lore.kernel.org/linux-bluetooth/20261014224145.10801-1-kevin@simpleble.org/

 net/bluetooth/hci_conn.c  |  5 +++--
 net/bluetooth/hci_event.c | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 29da3fe2b9..5de95408e6 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1614,8 +1614,9 @@ static int hci_explicit_conn_params_set(struct hci_dev *hdev,
 		if (!params)
 			return -ENOMEM;
 
-		/* If we created new params, mark them to be deleted in
-		 * hci_connect_le_scan_cleanup. It's different case than
+		/* If we created new params, mark them to be deleted once the
+		 * explicit connect is done, see le_conn_complete_evt() and
+		 * hci_connect_le_scan_cleanup(). It's different case than
 		 * existing disabled params, those will stay after cleanup.
 		 */
 		params->auto_connect = HCI_AUTO_CONN_EXPLICIT;
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 56ad10ab96..982b67aef4 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -6041,6 +6041,28 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 			hci_conn_put(params->conn);
 			params->conn = NULL;
 		}
+
+		/* An explicit connect request is complete once connected, so
+		 * clean it up here: hci_connect_le_scan_cleanup() no longer
+		 * finds the params since they have just been removed from
+		 * pend_le_conns.
+		 */
+		if (params->explicit_connect) {
+			params->explicit_connect = false;
+
+			switch (params->auto_connect) {
+			case HCI_AUTO_CONN_EXPLICIT:
+				hci_conn_params_del(hdev, &conn->dst,
+						    conn->dst_type);
+				break;
+			case HCI_AUTO_CONN_REPORT:
+				hci_pend_le_list_add(params,
+						     &hdev->pend_le_reports);
+				break;
+			default:
+				break;
+			}
+		}
 	}
 
 	/* If we are central and have subrate parameters stored, queue a

base-commit: 27731ba091954eccddb2657053b590d2113e8d98
-- 
2.53.0

