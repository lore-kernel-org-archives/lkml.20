Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A74DDB2A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472392; cv=none; b=NTqTeb86rBxEzUDJZXpIiUPthtfRN8qd9gjaLc+1by3mpZXBC7bTFhWRCDSS8Xe60KbUzcNCLwz/c7onP6UeczqcmTwccWBqL/HAYfeFc3erWxqvlH4Vp20Y5eXEpAvejHoRiOmTJV0lvUSz6uUIx0sv+wh/QhP86mAZresRobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472392; c=relaxed/simple;
	bh=9eTqsgxOGqcdU6me9AD6/Cn9lxReRKHCBxZ7dqQbKD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXmTenc9kd0fxHanmkHP5+pY3qcRoIBiILRSvTxWdWSAKpHHhCZHIdh+SFbUDeGBCAHBLHYjt07XSD8nIbOCY0yjlUxhq0CL0OlyhQDWY5HrwAPSIEuG5Z/UJhBqPwK6MNQydLDpTO5Z4t042LIXMI3ECkAnbbG0p4B0D9gF6e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTQu/pTO; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTQu/pTO"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35179d0747fso59028eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791472382; x=1792077182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgntWyKZ0htXISM21JY9zVA6whoi61UfYRw0k8Qzz7w=;
        b=rTQu/pTOuFKah0vcE33b6BKd7nhcGbVCKpI02b4wAzWbhUixG91CvO9S8xTKGl2z96
         EpfIPOvhFoNHnrM1pphE4HQuNCaLTYY1bCmb9IvpQlvkQAHtptzjENZFTZ6P1RVhmSk7
         3qlAq/HH80cbiwo2vqs5asv70B1D1GZgtjsiHJZ4trGjb15o5SGAn/3CCGdXJyx6P6rn
         1D+e9raqimsa4z76Odeut6TSNSbBUfIMdbouQm675V723pMEYDuWi1MqNi23QWPy3iW5
         iUCfAOu7uaZC85CJIKmw3TJ4tuKeoELWxuX2oPni5M/uFw/4Rvyiy49SUrzPQ73bngqu
         Opuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472382; x=1792077182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgntWyKZ0htXISM21JY9zVA6whoi61UfYRw0k8Qzz7w=;
        b=zfRWepHLwM5GrrXCFTbuFUWX6gm8JEG4F8xRJjp4EUjmUSrafg6+C90DVrZdhgnHyw
         qye9SZndS+qtSeSG7gzv1gk99bklHNxaINXXjTh6If9H8eAMCVsuzg18fhTUkxze9WWt
         Y0qWEvxhSc1fj/62z5iSKte91iV6U/V2RGIeHz3yf4fBOud/M9zaCRtwr+v+GbeoU3+Y
         an2WZMRrtFy59Uukb2DQOVLlQdBeqohwPMQctB8aOrsYi6Y8K0WdbrLOrt3gUN0swmRA
         nDosSDYRBXahIwEC7jx6vxExPeI873J0jeBotDiH5zktee5eZx9Y6NiFHOKRAkt015M3
         GXGA==
X-Forwarded-Encrypted: i=1; AKwUvBxjAHKkVa54SE7hbgzkz4+iAZp1zd0lLSGsd0J2T7KpZKjuj8Bx9fX90QxxJhdIqU46DqPKtUW4L/lMhQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbtNrOz06gj5irOx+1zK+PCvjRMsMSBRgr2Gp8ztZEFZTXkmqn
	sSLonsqWRCJUkJ6LYFCxpc7lYjAic0BcYsRoPF5qKVhQQH30kUxxvLYhgwD6ORztRSw=
X-Gm-Gg: AYBFou2GUIMjliinigNIMSz5/pUtZcJgS64hXWwRYQAJyrq0NMA8Z8hS7bmIOrkb6RT
	tvikhqmuSPB61TQqBICKzs58CNuExMMmQ/a/IfujZ4wo9lCdP0gauQxOT8DnwUG181GcygJqwdT
	D35wb8y93AxP3rpBPjpu2yuFbecmsZMRVoa/S7y9K5xzRpT/tl//O67GMdWTEeeNX4aHBbXHkc7
	4wB16gf20YG6ODIGFy6xfAro0ea49ph3TNbJg41t3vI2zqx1+VHlfpS5mOf3K9tfhf0WtsSYHME
	/rMqkd7jfboj9IsH97VmE3SKVzKz3m3bkMEssjou0G7e7DEZJ3Ph0UPt8987FP0pVjS7hIo5gQ4
	uNRxwbgzzpOD6IZZGlZ5x3CofhsI+OHDI9Lp573flpbQslhi/Q3ABi2bDmafJDIm2wTVbziUviK
	rsQHNJn6Japz4jcfr+P2NiFZhJgvuWaaUWLjX2Chlp1mwFw/XKhXIrVWCV4eDptVycdvf5BB+DE
	Wmu0ZpOboF7LXvwUzqIRY1G0ZUfqZChS8zYE1slPw==
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr3298564eec.0.1791472381895;
        Thu, 08 Oct 2026 08:13:01 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm18052389eec.23.2026.10.08.08.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:13:01 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v2 5/6] Bluetooth: hci_event: Disconnect an ACL link that completes after its abort
Date: Thu,  8 Oct 2026 11:12:37 -0400
Message-ID: <20261008151238.2138665-6-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008151238.2138665-1-enghitalo@gmail.com>
References: <20261008151238.2138665-1-enghitalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for
aborting connections"), aborting an ACL connection in BT_CONNECT sends
Create Connection Cancel and deletes the connection. For an incoming
connection that was accepted, e.g. one that MGMT_OP_DISCONNECT aborts
before it completes, the cancel fails at once as the device was never
paged, and the Connection Complete that follows finds no connection and
is ignored. The link then stays up in the controller with nothing to
disconnect it. The same happens with controllers older than 1.2, where
no cancel is sent at all.

Disconnect an ACL link that completes with no connection to take it,
unless an accept list entry makes it an auto-connection, which is
handled as before.

Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 8f22a4528..b1c107457 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3301,8 +3301,15 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 				goto unlock;
 			}
 		} else {
-			if (ev->link_type != SCO_LINK)
+			if (ev->link_type != SCO_LINK) {
+				/* No connection takes this link, e.g. an
+				 * incoming one aborted after it was accepted
+				 */
+				hci_disconnect_unused(hdev,
+						      __le16_to_cpu(ev->handle),
+						      HCI_ERROR_REMOTE_USER_TERM);
 				goto unlock;
+			}
 
 			conn = hci_conn_hash_lookup_ba(hdev, ESCO_LINK,
 						       &ev->bdaddr);
-- 
2.55.0

