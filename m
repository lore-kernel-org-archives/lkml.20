Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177065;
	b=QZuqIE2l6rSXAlkc/SmBCM7y9HjNOF1c66llXwj0773+btVJuQeUcXJCtnkfgpWjvAbt
	 ebep20JzKy4qI2ppY2xaeAagjBwIasKjZ2diJBBv06ptE6kYpVHgnx8oTpNRKXAkRA0dL
	 AO3fMY9gn8RxqgMRDI8X6UV0ufYb0z012VeQqp2VJpFMCgFny+Buti9zSyjTr6zLIbL+b
	 PX0XvaY0LiuXG5kteF0zckPCucVP51HpxLuE8VimeKHVzyP+pinA8rHB9xnuH3HjF2a4h
	 yh6g8yTv3XO7EG48cPJzSn8xu/pliZsQuHeUECyAK1yjh5dyw8XUCW0uBNH4w6/EUYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177065;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1sW1mmLPlw0EKa7jU988h9/QwbW3FrIHOvYZABaI7ME=;
	b=qSwH6gvHHOd1fu0uGKrmXwY9dh5yNtz6VWS0Wr6bzRQwj2ArVjVLcibh8BfWk1WTnLLu
	 11R/X1nTH59Pt8DswQ2LHkCkW5t4WcFXDDkRDlz4zJBpvEe4oHkBptVr61OCZWaJenEjj
	 21ihE3JBbdwjwxAw3Waztj+Um+8JXumKLgnc1ACp0iTltAYxRUYHFz/kp8rs+FRsgWt8X
	 i/NiYbyu6mYciL4iBHQ0PQ1CUNDhbJIP5SVtlnJKyKIaezEVQIYl+vD1GHBiQNm2e9hJH
	 HRFfdAHy2WJZQ6WHOtxVADLm0+WE5SopCALDPAEkwMkcTu/eNUpqU/JMtnPXmkoho7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ttz5znjgmbg6hozo2ejrmcjh2e.protonmail2 header.b=Uph2DApY;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EFE606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ttz5znjgmbg6hozo2ejrmcjh2e.protonmail2 header.b=Uph2DApY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ttz5znjgmbg6hozo2ejrmcjh2e.protonmail2; t=1794177062;
	x=1794436262; bh=1sW1mmLPlw0EKa7jU988h9/QwbW3FrIHOvYZABaI7ME=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Uph2DApYA1WZrge6sTCfSMA8XLaHKdo7LqEIx3pEVIbSotG6hxAAAEG/SJzCOshTJ
	 BuJzJUrIgYBWSVmqepb4espY/tlRt3TSa8l+eUdNEVElRgOt0qNFJ5N25JmvBU7Hc3
	 ESQDeerg4Lh9mKUWWocQAPZXAQ70hKKBafdlEpFqBkejmp9PMsk00/l0gm/ResuqK3
	 EqpKw/tVl9u5NrdEAff3FcqHeLPYLNaRRRgkWrVQbob/SyZVXBQFx8LFjDTJHlot4s
	 ousE5KteOo4Cm0sKvTUFp+BiNr9MdmHmxJpQOmqBUWR+EwyYvh5z0Tu1LvYvkUTP5d
	 CiPWYc27OR5MA==
Date: Sun, 08 Nov 2026 22:30:59 +0000
To: "linkinjeon@kernel.org" <linkinjeon@kernel.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "security@kernel.org" <security@kernel.org>
Subject: [PATCH] ksmbd: read request header for compounded CANCEL
Message-ID: <0cRgD2yOWbwKBhBZfP0O2ejMhJmcsRk-SQgKJhFyowKBsLZmKYKUb_iKGC1VTDPMUlJrnX1Qpa-CsfMFLwt8hxFqjGhvOLwzEGkO-0JgtvQ=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 9264b9ba86082f5e8c578dec8ef8e37008e7e2f3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

For a compounded CANCEL, smb2_cancel() matches the cancel against the
*response* header:

    if (work->next_smb2_rcv_hdr_off)
            hdr =3D ksmbd_resp_buf_next(work);

The chained response header is initialized with Flags =3D
SERVER_TO_REDIR|RELATED, so SMB2_FLAGS_ASYNC_COMMAND is never set there:
an async-form CANCEL therefore always takes the MessageId branch and
matches nothing, i.e. a compounded async CANCEL is a silent no-op and
the deferred work keeps running until it completes, times out or the
connection closes. MS-SMB2 forbids compounding CANCEL, so only
non-conforming clients are affected, and the read itself is always
in-bounds (the response header is fully initialized).

Read the request header for the compounded case.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), fs/smb/server/smb2pdu.c:10515-10524 (smb2_cancel).
Pre-existing in v7.3.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca..36c5a40 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -10521,7 +10521,7 @@ int smb2_cancel(struct ksmbd_work *work)
 =09struct list_head *command_list;
=20
 =09if (work->next_smb2_rcv_hdr_off)
-=09=09hdr =3D ksmbd_resp_buf_next(work);
+=09=09hdr =3D ksmbd_req_buf_next(work);
=20
 =09ksmbd_debug(SMB, "smb2 cancel called on mid %llu, async flags 0x%x\n",
 =09=09    le64_to_cpu(hdr->MessageId),

