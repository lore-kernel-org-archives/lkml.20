Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992024;
	b=nVetIpOCPoJZ1bLKfdbIeR6/Ys6ZMToWmSuPDqLGb7RjiGIzVAv6h3crOIlM+dIFxeJz
	 Mxe8a53z62m29RVEGyZHTvPYNzWxMRMnRBwuuJY8GQ9BqBwWnks0NQ95Z5X/e/ppKhMCh
	 lldDtif5deFQ67Ljm3SeS1zs8aTrYRt13G0LYs6q9ZV2OOl7djZi5YkqGAmYLMPwdlGgc
	 uUEjAwRYRYJSJeRvtfwK54otYjeEzNB3Pny11vazqqawCs5LaWmNb8ZzpjsXmKClqvpsv
	 8hCMvMa5rFmUrcS4DBWf657GlFfCB6ozUkxUhQ2yZ31q2nYQla/Pqpj/3uY9JGmUQJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YMJu4XLBqQ/fEGisX73M6D244sbUdTxsQ1NSbRoweVc=;
	b=2XoOUWzexjPibO87v3buRTLeid9poXXdTTTzm2uDjVJbuZ9XKwCqJfWqkzBJHUpnUg63
	 rqHWAXvZodqoG/8B75hm0yEhyIlKZSpmE6S646tUGi8JL/pgRoA3OHeC7Gl1re/I2LI+L
	 Fq24aczv9hpXFSiRhkaRIUwQJV1EfRC305cDXhsKZ4db/5U6CmegliswVu61az2P5Yr1K
	 Rrb1F+ByU3bSAMRnEnt+wTofElnVBtK9Ck4p0dJirpkwO/jjWM+irpbEd6gCowhwCBVvZ
	 iev72tqBAO9NPvxq6tfIcE7+VegnTENBlpnGmcgabyQvgypkeCsQRTpvjCm0qkIStdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wUtTXUy/";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9CD606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUtTXUy/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso459423f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793992023; x=1794596823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMJu4XLBqQ/fEGisX73M6D244sbUdTxsQ1NSbRoweVc=;
        b=wUtTXUy/GvL1ymzkcDRgg6xpVxA1BZEB7KkgnwMqpQO5bTNN74ON1+fT6zkGlJlm34
         /rbI2zJZETBP6tU5Oq+AqkP2KvVuvPOTe22ruPWbPBtmUcm5yih9bOelUjfTMz2V9mkT
         b7+mbqaqSfYM2ZAoKchwTcRJiEQCpP1gznRY3tI+eAla24c/cjrC2b7sP3yq5AaHKmco
         p3P8j5L04jyBAqNPs9RRushrAlNAZSExy/fLKZNVdKh/q3Sv3BRZuk3M4ut1AwvBp+dU
         A35pGA+70UDUHabCbUdhKjQOgrl0cQceDy9caSk2RpIwDmDNNQfnhS/jQ7wBG8s87FnV
         QsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992023; x=1794596823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMJu4XLBqQ/fEGisX73M6D244sbUdTxsQ1NSbRoweVc=;
        b=jckETZbvcNWSzmyK4drMbLeE3mpzknVKHGGPrsT6AEDqzHZjwo7PhO5eehsEOYtr3V
         jw9N8f4DPPYT0gDhKrpnzSSyvZkNajGHE6Do6UXw+dhGJR4VR+2C4a3nPpxBgR+9Db8x
         JhcU4TIoKl/tNN0GD7iqGB+bBQkIJoe/veL6AfSIGA7jHVB9UWJyZpY8e5gVsRNV/vZF
         aeFTJ6lFS8hfjOIkgKdBz+2b3jo+N8F5HwYVL7KNmVDiwqN2xhDAxwH/qF2nNVSwqQYr
         5J3j1Wb+xKe6bl8TeI27NzFngsK+k7iKvv0mB8uObJ88lZpUSq3XiP9wy8sCaDSzQ4ph
         iUBg==
X-Forwarded-Encrypted: i=1; AL+hErHq+Ht/trltcYJl2wzVYewvjqeLFtN75Fb4omT//nDnr33r1gOCfUZDuFd0Rrl/8XtcY9c/ydj+/1WfuUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X/usHxnuCeffdhXVEyDoY2O2Sm9BmGWpgIgd/mB6Id7AhwFjH
	5uutbYOhhUVmWS2Orh5ndVfYY0LB6HMxsh9w29sMVh8Ust2xjdU+8H9o
X-Gm-Gg: AYBFou3zjMjfF7kggXn1sO4lHlJaXde0nnwo5haYeH+yZcJ8l7Dn4waj41j7+aDEVlG
	YXeijtaddo7YFMo3YH8zslCJnvOHVLmkcGBrYQuMWnAfj/NCo4aLhEtteA7lAzR5GDM2EFW13/k
	2iel+63H86kchq1tKbAPySNMOqzN6daUm/sjaXl3TqlpcdwKb7E+6WITujlGwVt3xMeIqaUTKsU
	UPqzzRQJ2EHhW0k4XHWu8yekWH5IQ+9ODKlXYcXxXTHQfEc6LKOkKGGm07EYBrmrjqGu8kHa7i5
	8kbCyVvv55Iql8VDb2IevvM5K7xmrBJxBnB7Ko/ih77k3ATAWz2TutslylcR/AScrwObtW2xEp0
	U9xOayZK5igXlhttDlPvZ3WgkhVKgIRw1cP+KDH3UNvChUW/aXBQeR6AhGMZviYZR6euJ0Vq3Ke
	HT1f8tptH0R/+t9yG2+1bt4BgJLXkKg37IGcNfHTgfg3zkZG9G0QWm9fFqP0+dKCh6F7mBuVTRi
	rYeRUEkJhTtbWN9UT0veAWs9FjauukgiFUkpKOOyNQ31MpJrtlfOotPyyBk9KeTUUKqHuGr9+q8
	11nWujjuc7SEdLrqHJKHP8iO8YyEPYNXU3US+osV7eaZCJTZ8I+YFrs5NyrUfWFxCvr+dVyyqxW
	sgp0ae5yq/6vUD3s=
X-Received: by 2002:a5d:5d83:0:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-492764aedeemr6683116f8f.11.1793992022611;
        Fri, 06 Nov 2026 11:07:02 -0800 (PST)
Received: from localhost.localdomain ([74.244.226.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4930a5a91dbsm3960533f8f.35.2026.11.06.11.06.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 11:07:02 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: icb@fastmail.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	ematsumiya@suse.de,
	lsahlber@redhat.com,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
Date: Fri,  6 Nov 2026 20:06:22 +0100
Message-ID: <20261106190622.20990-5-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106190622.20990-1-mike.michalo@gmail.com>
References: <20261103171742.18816-1-icb@fastmail.org>
 <20261106190622.20990-1-mike.michalo@gmail.com>
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

When a session's Kerberos ticket has expired, smb2_check_user_session()
returns -EKEYEXPIRED and __handle_ksmbd_work() signs the
STATUS_NETWORK_SESSION_EXPIRED response if the request has
SMB2_FLAGS_SIGNED set. This happens before __process_request(), which
is where the MessageId and the request signature are checked. So the
response is signed with the session's key for a request whose
signature was never verified, at a MessageId that was never checked.

Anyone who can inject requests into the connection can then get
responses signed with that key at MessageIds of their choice: a
signing oracle. Reauthentication keeps the session's keys, so the effect
lasts for the rest of the session.

MS-SMB2 checks the MessageId (3.3.5.2.3) and the signature (3.3.5.2.4)
before the session (3.3.5.2.9). Do the same: sign the response only if
the request passes both checks, and otherwise answer with an unsigned
STATUS_INVALID_PARAMETER or STATUS_ACCESS_DENIED, as
__process_request() does.

For a later command of a compound, the response that is current at this
point is still the previous one, so the old code re-signed that response
instead. Leave the expired response of such a command unsigned.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Reported-by: Ian Bridges <icb@fastmail.org>
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 4430c8d6393e..bd4db44f06cd 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -107,6 +107,32 @@ static inline int check_conn_state(struct ksmbd_work *work)
 	return 0;
 }
 
+/*
+ * The keys of a session whose Kerberos ticket has expired are still valid,
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
+ * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
+ * signs a response to a request it did not sign.
+ */
+static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
+{
+	struct ksmbd_conn *conn = work->conn;
+
+	/*
+	 * For a later command of a compound, the current response is still
+	 * the previous one here, so signing would corrupt that response.
+	 * Leave this one unsigned.
+	 */
+	if (work->next_smb2_rcv_hdr_off)
+		return;
+
+	if (ksmbd_verify_smb_message(work))
+		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
+	else if (!conn->ops->check_sign_req(work))
+		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
+	else
+		conn->ops->set_sign_rsp(work);
+}
+
 #define SERVER_HANDLER_CONTINUE		0
 #define SERVER_HANDLER_ABORT		1
 
@@ -276,7 +302,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 					rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
-						conn->ops->set_sign_rsp(work);
+						ksmbd_sign_expired_rsp(work);
 					else
 						rsp_hdr->Flags |= SMB2_FLAGS_SIGNED;
 				}
-- 
2.43.0

