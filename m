Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509484;
	b=1B6GI6t7ScEsH3Ht7E/jZpB2LmUSlqFQOmjMMSiCGkl75tCpyY2LKXpbMGcUPubJMe2w
	 FH8AL5u/aZzVB1XZrEBxLrU2s8aUMDYNEIZWhKy52/1S4pdIiC2sorMOk7avt/uhLM24i
	 FQiAayLPZ2doEBrsw7iXNhb/ysJ5YxN2n3Ttxc+ZnCmZmUlLsEblPNAE/fgCgFIOCDG1D
	 kSDavTtRwZh3Cu7DZG5kGquy2rdn3D5RFxaWVK3ny17O3GZk/f/qOPU1sWnHCnCoGjz5Z
	 c7yeu+5b5eG81FbYc97iALI1JlxU3+Rm0G9MVY7Djrg7yYSaKTt57TwJ0mgLLafjSWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oYX2qRr8l1svLfkLSgI6YJjNFCjAsPL/QF0j4Jxr+wo=;
	b=0m+7VblATJv01/6BOVIqvdwc6lVdCr+5+qiW6MRmAKyo4Rw/A0c5Io2O3HFX/vS/3gtJ
	 BmyJ9RQnh6QKVDhARqef+KbIzzyACpEj9sWu7a/LO2zkRxskThPxew5Xa6a1FUxyRi0sW
	 9Ne9MgICEc8RNn+2x57VSKEO2AYcZ24v53jaIbvKp8NRN6gYmbSJbRvE9Vo48O+NT1UjY
	 xkMMMCrKwrC/JnRq8Pu1b1RCkCy4Km5VP5WdNJU78muYmgJdWkAwq6reM+ObLdWOOdkwz
	 QYqU11Uj0D4rvydTtvp2J+OL74pyzW65EuVxHipodCbK4YdDnxyvI1t9E7ZwvtLsQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8ZqqTsO;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F2D60A262D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F2D60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8ZqqTsO
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed408b0d9dso875525ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509483; x=1795114283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYX2qRr8l1svLfkLSgI6YJjNFCjAsPL/QF0j4Jxr+wo=;
        b=r8ZqqTsOYRMaAs2KKWMB2yPZM5iN4soxNuQyTy2+QoNLD6p36T+o4RRrW3rusOHiBU
         EceS2eAN7QTtiV4wsjt3Lzo0oIGe5qqoF1tg4wDwDorRiZORVC93eevltB3BSiu3i0eH
         CJ9Sqqh/E+wkif1rlSldMojX4oejKk7QatbDIrrc0ZOxAFbXdzRxZ6r/3kJIBydyxx1l
         02pEYpFhSeFMK5VUAZ851Uv0fpWjYtUG26FFW4Y0ziU+j4rhS2RXSzP6rLVM+OIoEviL
         28QOJWfog36ypFteIDo091gIFN59uu4J3QP2I32R2rwoa8dr3tmwu5GlHo2aoHXNqB6l
         VqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509483; x=1795114283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYX2qRr8l1svLfkLSgI6YJjNFCjAsPL/QF0j4Jxr+wo=;
        b=nMumgtraPKh6mSq5TQLGZXa+fw9YP9vLsFpuTV+TWZg9s+S8+Vh98GsazWVYMZ8xYR
         pE+Yalf4W2L3wjxyGP3QdilfsPszOPGo3ZyhZH0J4ZooabfdVEh+E8AmIjR/FHzuZ04C
         GjOmgJEtjwNGME2TeGRxAVh8Iir2d6C58GpW7n7qlQbHMsDFJe4wylaCTMYu3CMKMU6/
         J1Unht1WA6UrHxnQGe5zPbdHBGlmDHIDOjsBXCvdfCJA07sL+CA/f+wT4+YyX10czju0
         wSome4PuclCCEFvW/nzEfovc4E3ehtVJicc4AGb7cpRWaIcOfTFDL4pqN49tY1MCi3vr
         8o4g==
X-Forwarded-Encrypted: i=1; AL+hErEhNGBHfjf8CjxZOU/VlBY2mARvFIOdiZK+aMrr+T0IjP8mfJL2CkxLnG3+AXp42Mcxu6RRfQ6hQd8cj/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kHGKR558lxIdewb+XFfpA35h/G+doXIqxWwkGQS/WwLrJp2yJ
	OrqbdTBWWhkMhXZ7hZC3cVYfvIulRlH3Spe4EWO3PxtxycuoyxFqrcor
X-Gm-Gg: AYBFou0gevaqoLvYN8GZBGGOt/gMGrE6cwuU4B1E+pSGsK44Ma4IZqueaFs9OAoKGA1
	26COUZ2wboybAj2DOiu2xmUU0PKk0iPNa8bwuYPRCHTs7EsLFwI6PWnKOQ8QCbVPvJlzrdu19X0
	V2T8qf+d5q9oRJZOiq3Fpyhy2cLmlUi6N4zMzDe+EBT+bfGOjrxDSEHp1nwhR3xWz+pgJnj0BQ/
	4Tt/RmRqEjwCwXKthCeZ7vIFg3ROEYEMM4QLF1LbdXP6PsOJ744Kpk5qacLhs14oR94dZMiwy81
	5HkY6sIINM4CZTBoyD1uSrhZ38dBKlbANBlBovgsP18Fm3U0Z1J9OnWZgXqbHbbNybjUGPVNSXM
	lo43orDXYpjCCupJYWaIicHJydtLYB3xxyEvFibYTZNHS0QH+jso6js20RZNCAg01H+e12xz/q/
	OEwrrIC22XwjFaO3FXbvN9fQhQkrXPhHbMXzbyovzBq+Yjeq11gPrpFjvvj2hEMOocIIgvzsMWw
	/6kCeT9Hv/u51QRbmeJ12GfVUu+rPAbwg3zuu4EV9Kc4HXEYBM1Vn4vnLILZmBlOcWUZg7E3WmH
	JMyCxE2esIM/fMd4TqeFXWiimLviuFs6BH5a7wkKj6cZgn4q2IdQud+bA8ojDQIaA9mBmXG38rO
	EhbMasmq1rhDr7AOGpy137VeG0Q==
X-Received: by 2002:a17:902:fd8e:b0:2ed:107a:4f5d with SMTP id d9443c01a7336-2ee0d9e6eb1mr2506175ad.1.1794509483454;
        Thu, 12 Nov 2026 10:51:23 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf7bbsm66205ad.29.2026.11.12.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 10:51:23 -0800 (PST)
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
Subject: [PATCH v7 6/8] ksmbd: use the current command's header for signing in a compound
Date: Fri, 13 Nov 2026 01:50:42 +0700
Message-ID: <20261112185044.41571-7-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112185044.41571-1-mike.michalo@gmail.com>
References: <20261112185044.41571-1-mike.michalo@gmail.com>
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

Three places in the signing path read the wrong command of a compound
request instead of the command being processed:

- smb2_is_sign_req() always inspects smb_get_msg(work->request_buf)->Flags,
  so the per-command signing decision in __process_request() follows the
  first command's SMB2_FLAGS_SIGNED bit rather than the current one.
  smb2_check_sign_req() already uses ksmbd_req_buf_next() for a chained
  command; do the same here.

- When check_user_session() fails on a chained command,
  set_smb2_rsp_status() writes the error into ksmbd_resp_buf_next(), but
  __handle_ksmbd_work() then set SMB2_FLAGS_SIGNED on
  ksmbd_resp_buf_curr(), i.e. the previous command's response. Flag the
  response that actually holds the error.

- After each command, __handle_ksmbd_work() decides whether to sign its
  response only after is_chained_smb2_message() has moved on to the next
  command, so smb2_is_sign_req() and smb3_11_final_sess_setup_resp()
  would see the next command's request and response. Decide before
  moving on, and still sign afterwards, once NextCommand and the padding
  of the response are final.

smb2_send_interim_resp() also uses smb2_is_sign_req() to decide whether
to sign the final response of an async command (STATUS_CANCELLED for a
blocking LOCK or a CHANGE_NOTIFY, STATUS_NOTIFY_CLEANUP), so in a
compound that now follows the async command's own header as well.

When the session does not require signing, this mattered in three ways:
an unsigned command after a signed one was verified anyway and refused
with STATUS_ACCESS_DENIED; a signed command after an unsigned one was
processed without its signature being checked, so a wrong signature
was accepted, contrary to MS-SMB2 3.3.5.2.4; and the response to that
signed command was not signed. When the session requires signing, an
unsigned first command is still refused and every signed command was
and is verified against its own header, so mandatory signing is not
bypassed.

In an encrypted message, a later command with SMB2_FLAGS_SIGNED is now
verified, as the first command already was. 3.3.5.2.4 does not require
verifying an encrypted message; that is left as it is.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c  | 27 +++++++++++++++++++++++----
 fs/smb/server/smb2pdu.c |  4 ++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index ca0c78447f454..32bed8672dd2e 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -213,6 +213,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 	u16 command = 0;
 	int rc;
 	bool is_chained = false;
+	bool sign_rsp;
 
 	if (conn->ops->is_transform_hdr &&
 	    conn->ops->is_transform_hdr(work->request_buf)) {
@@ -288,7 +289,15 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 				if (conn->ops->is_sign_req(work, conn->ops->get_cmd_val(work))) {
 					struct smb2_hdr *rsp_hdr;
 
-					rsp_hdr = ksmbd_resp_buf_curr(work);
+					/*
+					 * set_smb2_rsp_status() wrote the error
+					 * into the next response for a chained
+					 * command, so flag that one, not curr.
+					 */
+					if (work->next_smb2_rcv_hdr_off)
+						rsp_hdr = ksmbd_resp_buf_next(work);
+					else
+						rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
 						ksmbd_sign_expired_rsp(work);
@@ -343,11 +352,21 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 
 		smb2_complete_request_open(work);
 
+		/*
+		 * Decide now whether to sign this command's response:
+		 * is_chained_smb2_message() moves on to the next command of a
+		 * compound, after which the request and response helpers see
+		 * that command. The response is still signed afterwards, once
+		 * its NextCommand and padding are final.
+		 */
+		sign_rsp = work->sess &&
+			   (work->sess->sign ||
+			    smb3_11_final_sess_setup_resp(work) ||
+			    conn->ops->is_sign_req(work, command));
+
 		is_chained = is_chained_smb2_message(work);
 
-		if (work->sess &&
-		    (work->sess->sign || smb3_11_final_sess_setup_resp(work) ||
-		     conn->ops->is_sign_req(work, command))) {
+		if (sign_rsp) {
 			/*
 			 * A refused binding request is answered with the key
 			 * of the session, which can be of another dialect
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 7790aa618fcbb..9c6e740180a4b 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -13004,6 +13004,10 @@ bool smb2_is_sign_req(struct ksmbd_work *work, unsigned int command)
 {
 	struct smb2_hdr *rcv_hdr2 = smb_get_msg(work->request_buf);
 
+	/* In a compound, test the current command, not the first one. */
+	if (work->next_smb2_rcv_hdr_off)
+		rcv_hdr2 = ksmbd_req_buf_next(work);
+
 	if ((rcv_hdr2->Flags & SMB2_FLAGS_SIGNED) &&
 	    command != SMB2_NEGOTIATE_HE)
 		return true;
-- 
2.43.0

