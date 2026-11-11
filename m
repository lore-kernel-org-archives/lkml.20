Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390325;
	b=MNI7Jk4p5q6eSiykUXtjA/JxVE8/pfMpK5HVZIUjbw4m217n3jpkviTv/vvxm7Mij9g2
	 H5u+M1Ab++pMVo4YBC4qhM35Mzeh0ZRwH0G4u5CIex+CZOOZB3LDV0sMCPsICXiJZo48g
	 nqYc16yl6VfFkpq1XOCu17YeGRzUf0O44lTG6/mDkgU/c+uBewKLCJtvrw6VWmx0DJdrs
	 Jb5n1yqg/CoZj0F+gKpHVt2domvCmNxuIf6DFA/RkqoyGxu+2Oq6D5qIDVPX9esz3oFWX
	 chMvC3rMo7CkVYyMryEZO5VK7D/0oCI5tzw2QuZ2w70qqetiqN2Pn15QegPv1fJysNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvcsK1MZNIxG645vDUNLdhdgHTZUV/jW504dcb+ejsA=;
	b=qB83Ylr76e1odmUY22qTsmFCEPjUs6639NMreBnEfir8z6GfSHZNMRSHlYEIQZMEOgh5
	 qA1LHvU8qmW4LLvYiJOuNmwKg0pL2+0tI4/4L69pgvRY3VSbaKySy/cAfC8iUuiMysg79
	 NYa2JHgZ/IAjE0N/bZHs/4OiaKs5UfAv3rcRrkdSvyWzfQ/BE5fLD25HPx+l1PpGjk7TO
	 pGTBgFFj5qvkrMHHB/OMCa0JQ5J/QK+yu3ppH1sF5b4HVwUp0pUGc3G6ZOEwR5BwbEhAn
	 g7NHgLevnFBdRYC3TS9NLroW/ovbC6/d8qvD4/F9/Kg8zmNWJKzPK5KeRlhzq7h5Trg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2NX+aEW;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA469606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA469606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2NX+aEW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so5071978c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390324; x=1794995124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvcsK1MZNIxG645vDUNLdhdgHTZUV/jW504dcb+ejsA=;
        b=M2NX+aEWZZ7U3BN5GA9MQBawF+tZs/Pja1AIXiVnIOFXwiREIS9lppIplaw/gB+apY
         0C0/Ec4FyRvgeWO83DWLqnjn7iljhsJLiyKSOj4RpOt582xas9oDO8OBt64gaZ+3RMQK
         it9oblePgSjrmF8FTZ8TFTmjMJsuTR9owDDz1HKUn3sfCCOiTgt5fEs/ysm047y6RaR9
         6oEdndPcL62TLAj1lyxLW4y5Nrt5usAQuflUn9iD2k/2BTXwhH7DYLDSEyF+2iUbCG6t
         2ryOytTstib012D15IdkuFB5w/a2sN02SnPOQS6y8R75i0tbfBe//NOH2u5i+tbGn7TK
         uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390324; x=1794995124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvcsK1MZNIxG645vDUNLdhdgHTZUV/jW504dcb+ejsA=;
        b=shO+aeejidynnj+sPjYslhtCNsAw2dCli/AD8QHOgE+SMV5g20NLaKWtJRwjVzAohA
         BaB4UskSx1ZCXTW9E6HhexKMwNA/Yiusg8kV3E5qdrqa7UffBx/FHoSUS4o4BQPhvz8L
         5Z8cfPc01biU4DVToqegtxu/MEN+rCX36cmtVRYT+UR9n0a0zBekYkfTQidBKcpnZPAp
         L0WfzdDH1dQv/ySnEiBFJgzJcWJ6M0lE+NkgVCxeM5/S9VSEnBskKN9qwuWRiav4ZNX3
         mCABI9+b4BplOkfNUUGedGYjGP/3fRgxxHdSxG3RVteICV+sqLymqd2w8a61abbRmFgz
         U8MQ==
X-Gm-Message-State: APuU4Z+C92coh6lFtgJN4e9c+iaxqlOgBdJ3ozqt1kXVZE3LFRsLl0Mo
	+V7S+PbyvzA81azm3DtXhJJAELt0Cf1tuLP26mQ48dX/W5RNUJbu3B2H
X-Gm-Gg: AYBFou3IlgXDMyXBtOqPaoSN8gobU5PeSYfRhPsa0B1gspATyFGRdmuDZdl+XRyc0fi
	cPZjgCGxJqLB9G0VHi8jzJmNHcVbsBTY55ZpKL4OQes1TtyQl8Zx07mlozY1JN8+uCPXWVepjOK
	BtakrUGDbmQVPIPMHHzsMsY5ZdtLaIuRwbc9EDNu3rgIdxZ+fUqM924qlaBJbexXfjivr54iCn4
	O5VY7qN4iqrHmchzexOx/3kc04u/I2chm1XN0umI3olqQknnUHmJfAHOQdpAgM5kglfc7sba8s3
	EeB64cFYRVd3i/2LN+N6O1idj3VgeVY/qoj+u6T3WBNzuqTStOl3q3iG7YP8UrmG6RccOCxmM+r
	8rxdD8zmc81eEYRu5iAVpnEqEV5UWf9YYVFrTpZUauVmTWYLye+TXWIruY9VnzCqoFK5WeXjWHj
	/E5P/0XbXdMOKnfv1imZPz5/sNbSAog//VpHRBpu/69EOY/PjiOLQOfrXIpzVCJcTPV67f8mEbz
	eetgRZohoaHOCqkCkwuaBQam/nMYHXp7qWXA7ysHkX3P2AHMvZvy66kQ9yGffHS6bv0ZayxkJfa
	VL80FDjQFY3fbW5jsHeWCLKyu7U=
X-Received: by 2002:a05:701b:2702:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b3c034b33amr1797678c88.32.1794390323867;
        Wed, 11 Nov 2026 01:45:23 -0800 (PST)
Received: from linux-691t.suse.cz ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm13890844c88.12.2026.11.11.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:45:23 -0800 (PST)
From: Chun-Yi Lee <joeyli.kernel@gmail.com>
X-Google-Original-From: Chun-Yi Lee <jlee@suse.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Chun-Yi Lee <jlee@suse.com>
Subject: [PATCH] Bluetooth: SMP: Fail if local and remote public key X coords match
Date: Wed, 11 Nov 2026 17:45:18 +0800
Message-ID: <20261111094518.1359684-1-jlee@suse.com>
X-Mailer: git-send-email 2.51.0
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

From: Chun-Yi Lee <jlee@suse.com>

The commit 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys are identical")
 patch be introduced since v5.13. Looks this patch can handle the
CVE-2021-37577 issue. However, it only checks if the full 64-byte
public key (X and Y coordinates) is identical, which is insufficient.

In CVE-2021-37577:
Bluetooth LE and BR/EDR Secure Connections pairing and Secure Simple
Pairing using the Passkey entry protocol in Bluetooth Core
Specifications 2.1 through 5.3 may permit an unauthenticated
man-in-the-middle attacker to identify the Passkey used during pairing
by reflection of a crafted public key with the same X coordinate as the
offered public key and by reflection of the authentication evidence of
the initiating device, potentially permitting this attacker to complete
authenticated pairing with the responding device using the correct
Passkey for the pairing session. This is a related issue to
CVE-2020-26558.

Furthermore, according to the Bluetooth Core Specification, the remote
and local public keys should not have the same X coordinate:

Bluetooth Core Specification Version: v5.4
(7.1 PHASE 1: PUBLIC KEY EXCHANGE)
"If the two public keys have the same X coordinate and neither is the
debug key (see [Vol 4] Part E, Section 7.6.4), each device should fail
the pairing process."

Bluetooth Core Specification Version: v6.0
(7.1 Phase 1: Public key exchange)
"If the two public keys have the same X coordinate and neither is the
debug key (see [Vol 4] Part E, Section 7.6.4), each device shall fail
the pairing process."

To ensure both initiator and responder roles strictly enforce this rule:
- In smp_cmd_public_key(), restrict the check for the initiator to
  compare only the 32-byte X coordinate of the public keys rather than
  the full 64 bytes.
- In sc_send_public_key(), add the corresponding check for the responder
  to verify that the 32-byte X coordinate of remote_pk does not match
  local_pk before transmitting its own public key.

This makes the validation compliant with the specification and mitigates
CVE-2021-37577 across both pairing roles.

Fixes: 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys are identical")
Link: https://nvd.nist.gov/vuln/detail/cve-2021-37577
Signed-off-by: Chun-Yi Lee <jlee@suse.com>
---
 net/bluetooth/smp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 2df303f6a38f..d1786e398128 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -1889,6 +1889,16 @@ static u8 sc_send_public_key(struct smp_chan *smp)
 	}
 
 done:
+	/* Check if remote and local public keys are the same and debug key is
+	 * not in use.
+	 */
+	if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
+	    !test_bit(SMP_FLAG_INITIATOR, &smp->flags) &&
+	    !crypto_memneq(smp->remote_pk, smp->local_pk, 32)) {
+		bt_dev_err(hdev, "Remote and local public keys are identical");
+		return SMP_DHKEY_CHECK_FAILED;
+	}
+
 	SMP_DBG("Local Public Key X: %32phN", smp->local_pk);
 	SMP_DBG("Local Public Key Y: %32phN", smp->local_pk + 32);
 
@@ -2734,7 +2744,8 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
 	 * not in use.
 	 */
 	if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
-	    !crypto_memneq(key, smp->local_pk, 64)) {
+	    test_bit(SMP_FLAG_INITIATOR, &smp->flags) &&
+	    !crypto_memneq(key, smp->local_pk, 32)) {
 		bt_dev_err(hdev, "Remote and local public keys are identical");
 		return SMP_DHKEY_CHECK_FAILED;
 	}
-- 
2.51.0

