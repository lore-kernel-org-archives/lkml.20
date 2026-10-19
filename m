Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437081;
	b=CoDCnJS/hbJJyJpYcj3Pi+wNJLrS4YBZB8k2sIbzam4XgoEDDsjhGE2Rzm1A+fc/yOkr
	 n97D4RrLbFa/Ep7cRZNLQwMo5iz5qJ2EPMVof3gxIl+l8uorBXlcqZwrtwu0zCpxl6Le/
	 H3Hrmp1KqR6jyJq/fIhYZ+2FQogYwRxST5aint3lz5YaH08PbKIHWHtyLj4SoCyq7/Mi3
	 qx7KlnVSWqr9NmAsTPqfTr76fSa+cFDxYfK/NSrbMuteaMtMa0gM91DIPf54oSdpFqFip
	 6HgdIWFG4UvzXo19yI8CNPrOA+6mZK6wKfnsfW2NbvIMyA5ITT++xfiRgf9jlZQ0tCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xu+NpaofIcN+A5gy42F4xAEqWNUCxA2rO9+p7TSllso=;
	b=ozaGQ+YQRTfKxA2Pv9mA99LTSnDGe5TBwy5RsetLSzeujMZSsfhpEUFk87CuNpxm+jsz
	 /Rg4lGAVRqxGgPlp08Wph8Qk3CCYkBbCLb+xOzycLGOD5wsnsyIvkADQ/YdrikWt5S69j
	 K4VllVYFJx1Au+1g5nj2nsZogaSINaBURtEzGtw3kkZ6pAQCuWpmkSt5eSB7ZPDQFdrPX
	 QTeJQcxULs6CoKfYW4kPAU/Vrj3PS2Zw1rDYtxLiwcgz3sT5CdSU+Un2yKggUddwG3P69
	 ydGqLIbAhayHofHurmIgH7ZbjAgkwOfxJRL6WKXolVmUl3yBkvpiJ7X3rFsMUKszvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0MFGAlv;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37024606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37024606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0MFGAlv
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso2859878a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792437080; x=1793041880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xu+NpaofIcN+A5gy42F4xAEqWNUCxA2rO9+p7TSllso=;
        b=R0MFGAlvryqL/A5EjTzKCxn6pLcLyqx8O4ghtU4WQYS8HyL87Mp65nitNmm7x/0R2V
         QsFZGb2NsBQU92H4UQm/YaPoalKMdIHw1rsvYJA6N3ybe1U4NGc+moNn4XAhXr65TLZS
         G7WNzJYftIMKOTkfXim0+2GBrjFk69PKAM8UcGXkxggnju8cEBLZ9D3ayGw6pZT5uYKy
         F3fCwLgPEQYSAZ96mGN4JpUZgbg4VjmkbWBsHtHQ0jmwJbrkr4Akiyggwijf5yJ1dT1s
         DZn+9P58qY7rSMTRBCbMzM6ci5/YnXYJJK9LLQbOVtL5P7Bf6KClQ9PK29Q4zCJKpGXm
         vocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437080; x=1793041880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xu+NpaofIcN+A5gy42F4xAEqWNUCxA2rO9+p7TSllso=;
        b=Oce2asBNRfT81zhQWkXPT56c8uv2Z8eatwJdBYlZDDt8FqvN/VWGvszRqTp9Vx6MHJ
         IYN3qY+MhNK71vmFdxnSA4wv82UX41pb252Vr6thYy6OqUl9dbGj6ugla/VMnXjMarFB
         bdspYM/igAaOc8CcLlVX6wh4tDkQoXuOdZzpxSrpIhZtOnDpA/YIBCnYSXjg2OtIUkrW
         j7WJ9wO6d5SmuSuCczBLKvZpNbtNVpMMJPrNSajqhDBa3pabsGsYT/wQbYvKj/PVNMbO
         YSprluO1DyhylTXpLEt4J0rqu/Y5QORBOp3njnrZRGsoZgdDnCDYD3nWaYTmrhzh9yyT
         VZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxh8yOZv0Zk+PjyenY9qSgH9ZvZGybGkQQ8iIkbvzt171smwMkUzwWpgPJd8Fe45V8uB+6pCpq5Xlg4rWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbJYLlkU+5SPYGzNRYG+b+qH0BXeMok+5lGv3depRLIPurUcF6
	6Mx5BvL8EWC+uEzt2GW9EiHsCukZ2lYZfhi1gRJXCqKn+oxvjFNMxR3w
X-Gm-Gg: AYBFou3mf0hAfBIUbT237P0CHcs4ooAwgn4vgeAJcm18brAXvuTHFs0re1sxG6PcFAx
	snBojDJvxEv4XQE3wP/iJpqvRq6MAsdnkTiKeFjWNwu7VOToMmgWx0VdH4eecoZoZeaxX1gbKpV
	xNf7tfRwDkDGFNu36HlmFZavd0wnp+1KvTHbQokWFFiWnlBdxiwD34QFZsgEulReDpfXYi5mw2q
	pDQHp5NYp3cDcfyvmtvYrZZzRwMWHX3w4mni0yxR0zs1Isv7SGADBVV8hAzw3RgZtIHdp4OlYch
	UwEfTDh55c5Ttz0yzX1Sywc3XZV0fJoV6KFvAt2RI0JZZe9SidC2yHhYJH1mhqz4+Mk+DQlptlI
	FsVDc7dQg7cgEEegsqVWK5xSNlpCqIzKu30SpHMkARA9HwxFGUm4AjOD0x5Cb02WXeH+hiZqMgR
	X9TrYfSar2oV3lJcDlnsDoj2f2A/fNGEGrF8DMUWg8EoSFGkKqcQfn1FNyuRj+UHL5DcxkQ/FCY
	Im5ElGs1dPNzDNX+7AWyXFxIqZjSo/zUBNzk4KXMbF9zzkSDNvieExVRvXabfKL5iiSDJgrdJM8
	KcYVtNqg7A==
X-Received: by 2002:a05:6402:a203:20b0:6af:dccb:acbe with SMTP id 4fb4d7f45d1cf-6b3a8102132mr4036341a12.5.1792437079322;
        Mon, 19 Oct 2026 12:11:19 -0700 (PDT)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm4341114a12.22.2026.10.19.12.11.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 12:11:18 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org
Cc: farhad.alemi@berkeley.edu,
	smfrench@gmail.com,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH] ksmbd: accept share config responses from ksmbd-tools before 3.5.3
Date: Mon, 19 Oct 2026 21:11:16 +0200
Message-ID: <20261019191116.31291-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-Z_H2O3W=_KrUifR44yisJJhR=-bQQp1mML7vHgfcdDw@mail.gmail.com>
References: <CAKYAXd-Z_H2O3W=_KrUifR44yisJJhR=-bQQp1mML7vHgfcdDw@mail.gmail.com>
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

ksmbd-tools releases before 3.5.2 do not have the payload_sz field in
struct ksmbd_share_config_response; the field occupies the last word of
their reserved[] area, so the kernel always sees payload_sz == 0 from
them.  ipc_validate_msg() and share_config_request() used to treat
payload_sz == 0 as "legacy userspace" and skip the payload size checks.

That case was removed by
commit f25e93768fcc ("ksmbd: prevent out-of-bounds reads in share config responses").
With payload_sz == 0:

 - the IPC$ (pipe) response fails the final message size comparison:
   these tools always send a one-byte payload, so msg_sz is
   sizeof(*resp) + 1, but the expected size is now computed as
   sizeof(*resp) + 0;
 - every other share fails "payload_sz <= veto_list_sz".

In addition, ksmbd-tools before 3.5.3 copy a global "veto files" setting
into the IPC$ response, so with such a configuration IPC$ also fails the
now unconditional "veto_list_sz > payload_sz" check, even though pipe
shares never use a veto list.

ksmbd_ipc_share_config_request() then returns NULL and every tree
connect fails with STATUS_BAD_NETWORK_NAME, so ksmbd cannot serve any
share when used with these ksmbd-tools releases, for example the 3.5.1
package shipped by Ubuntu 24.04.  Login still works, which makes the
failure look like a configuration problem:

  CIFS: VFS: BAD_NETWORK_NAME: \\127.0.0.1\IPC$
  CIFS: VFS: \\127.0.0.1 failed to connect to IPC (rc=-2)

When payload_sz is zero, derive it from the size of the message actually
received and store it back in the response, so that the checks in
ipc_validate_msg() and the path and veto list parsing in
share_config_request() all use the same bound.  The response is the
kernel's own copy made by handle_response(), and msg_sz has already been
checked to be at least sizeof(*resp), so this cannot underflow.  All
checks added by that commit then apply unchanged, bounded by the bytes
that really arrived, and newer ksmbd-tools that fill in payload_sz are
unaffected.  Also skip the veto list size check for pipe shares:
share_config_request() reads neither the path nor the veto list for
them.

Tested in QEMU with ksmbd-tools 3.5.1 and 3.5.7 and the in-kernel SMB
client over loopback, with and without a global "veto files" setting.

Fixes: f25e93768fcc ("ksmbd: prevent out-of-bounds reads in share config responses")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
Found with AI assistance.

f25e93768fcc was also backported to 5.15.222, 6.1.189, 6.6.158,
6.12.111, 6.18.53 and 7.2.6, so those stable lines are affected too;
this patch applies to all of them (5.15 with the older fs/ksmbd/
paths) and to ksmbd-for-next.

It keeps that commit's OOB fix: the payload size is taken from the bytes
actually received, so a short response like the one in Farhad's report
is still rejected.

Tested in QEMU (KASAN) on 7.3 and on ksmbd-for-next (1db57ad99d46) with
the in-kernel SMB client over loopback, using ksmbd-tools 3.5.1 and
3.5.7, with and without "veto files" in [global]. Unpatched, 3.5.1
fails to connect to every share; patched, all combinations mount, IPC$
connects, reads/writes work and veto files are still enforced.

 fs/smb/server/transport_ipc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/transport_ipc.c b/fs/smb/server/transport_ipc.c
index e550aa41ad..f5cfc32050 100644
--- a/fs/smb/server/transport_ipc.c
+++ b/fs/smb/server/transport_ipc.c
@@ -532,11 +532,25 @@ static int ipc_validate_msg(struct ipc_msg_table_entry *entry)
 		if (entry->msg_sz < sizeof(struct ksmbd_share_config_response))
 			return -EINVAL;
 
+		/*
+		 * ksmbd-tools releases before 3.5.2 leave payload_sz zero.
+		 * Derive it from the size of the message actually received so
+		 * the checks below bound the payload for those releases too.
+		 */
+		if (!resp->payload_sz)
+			resp->payload_sz = entry->msg_sz -
+				sizeof(struct ksmbd_share_config_response);
+
 		if (strnlen(resp->share_name, sizeof(resp->share_name)) ==
 		    sizeof(resp->share_name))
 			return -EINVAL;
 
-		if (resp->veto_list_sz > resp->payload_sz)
+		/*
+		 * Pipe shares carry no veto list, but ksmbd-tools before 3.5.3
+		 * copy a global "veto files" setting into the IPC$ response.
+		 */
+		if (!(resp->flags & KSMBD_SHARE_FLAG_PIPE) &&
+		    resp->veto_list_sz > resp->payload_sz)
 			return -EINVAL;
 
 		if (resp->flags != KSMBD_SHARE_FLAG_INVALID &&
-- 
2.43.0

