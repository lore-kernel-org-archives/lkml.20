Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4733B05AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133728; cv=none; b=NtRkbUjel9/pOkjSU+eh0PR0AdfqVYaCqtQzM1oA42/kai5WvUU9f7PotYgH6jGCpI7tiTx0w3EkokpttV8ORvwZK4TadgOqL7RZ4e635awN/7nTbhpcvdfTYSVaxWUJuoY92z0GmfFnJgrcI1rDocXwu8P+mIDiFUD0cy5Lsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133728; c=relaxed/simple;
	bh=ncpy0EnqF9l+kQ2Pf1jg0Ciz5YvWnfAlYtwJOLPYna0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfjmgG3xzof7pz0IyHyidXoY6C2D97Vrl3p84eZXpNbgL89CRjqO0XDRNX8UYK+VWdexDYCpJkA2Wm4n59CYdF+yc+fqs62ORmuML2NErHzSrFHJWD3MeSsjjtLrX3nXTf6D5OMXNKaTz+vXEFi90So+/6iGL4fDcKnxYf6wdKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLn/hfzi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLn/hfzi"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so2039288a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792133727; x=1792738527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMdZI/opS9rHJksOsCM3YzUdT2OraHcd3NLiwvXbxvE=;
        b=hLn/hfzijn/ylmdOL+lzYRX0C3FeEsZbPVvuNexcC8RqrRG5GWSD5JePdbhSgui6zK
         q+EUmZCEdvQSRNHF71Ac5BkTwFZa84KkvZfkuhnz80+k7zEOUZ7AaCfIB0HAEyyiN4oA
         OzVADtPJYXScu/Eis2zAir+WhDWISXXINItVMYQBG0wdtx2pjlA8ltASAuOtVcf0VEe9
         bi+ljTW5TcQnthMC0uGWgtqwIwK411hj9sOYhHuhQ+TFLIK+k039vqm7BOTGxWOV1iXr
         uZ+HbNRKaqMmYth6cGp7IAmsjary8PMWmiA+EjibeX2m1GAJ1KE2cXSkDjvT+ZAYBKbL
         Vs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133727; x=1792738527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMdZI/opS9rHJksOsCM3YzUdT2OraHcd3NLiwvXbxvE=;
        b=HXVO2NRWZzhhokjjDm7Tauut53wgnUUI1pddgt4xTkD430/d+9iQKnTaABqM5m8xq4
         yqaZIZXm8ynMUUgtPmS9kWQjYQYOipiSOd+K0tEWVWs7KvM9fOLLQEC31NWfZQNXWMOw
         jUQK0LNPnutGgBoPr3k5IT5wttCI9gg/DzXjFOVdmGIAX54lak5aW1nP21UPfh0Wu7fu
         xlzyRnbBxTvC9VvgDD3atxYsAXzVxniGehJCgVfSG5K4Sncd+WNnC2p0clbruzlqZEOr
         x/DiP35MYOhRWBHTCI3+WeOAvUh3nrVVcfN7nM4HtwdRdGPelh/Og9xHdhZxHDqvwdQd
         4nFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg9yCCPCkhAf7dk6mz62Wm2fp1wvTANUCZJSHVKs2aQTT/JAIgHk9Pka8zqFgt18sn2zWyrH0y4VI6gyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4QzOfvjBzdwkHQmTyoDPM8IGmMPHPm+66t475kjPbLwCUf2ce
	7sv1W6IY4GUZuBaqjzNIVl8pfd5NmOWWbB5a3QD4vB0Z5poSt5/eFMcB
X-Gm-Gg: AYBFou1FkX+xJCdLFwMgF9zVy1WvRIn/W6FW6Y7HYcQIPvgv0L5lksmfuwt/3nuYuuQ
	P4z5NU/wX0mrccH1+EDAG2T/DcXhc3SUZsr+axQ2zHJZAScgPBLFngAHA58Oh6CJlOSo+RrLhpX
	4KV88ab15/Bs2PI1c55POo7kqvVQGKF5IXWkNmtkVTarOQfUuEi9vzCcPg0CLNg/VVQJ9zJhNgL
	tRqpgOofXZde77ZCDNv+u0qioSdyB2dNjOtuVIzQGQKTNQjQMHUdvYlmuil40hmm7jboH6e0hza
	ouMI1pI61dxfVm/67NiBmpEG/J6N/pGhfdWRDVV8Ulq+5I1ZiwOsADDisuoGDJo7rl1SqScMEpo
	m20WUfwUTdHxC/xnDjESgd50cVaGx1VqiX4D8MjsDj2huoBt+d+n2oGUq5lS50taU/ZezmP03Qr
	l2y8jKzWWDFmPj4m7/sL5tFcBJ++x/C4lbMfljYE/hQdBFg/apbzhDlEUV2h3CFL8+Gro2juUL1
	L1SbtNwWFKxg61Ta14hOsY8eX/zzVv2ORWf/qEo9P0Jj8EKidEzqZBv+WmQmU9wc0hByQ3M26Aj
	ojxkwZAZgQAS9QTmRwELWj6umhiKGOMv0Oxq8IkM3QvC33gIVbbevay8TjYB
X-Received: by 2002:a17:90b:1b02:b0:3ac:80de:44f0 with SMTP id 98e67ed59e1d1-3ac80de6793mr6477432a91.4.1792133726731;
        Thu, 15 Oct 2026 23:55:26 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9a40720sm1110434a91.1.2026.10.15.23.55.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 23:55:26 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Mike Christie <michael.christie@oracle.com>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [BUG] scsi: target: iscsi: connection-recovery (cr) double-free / list corruption in ERL=2
Date: Fri, 16 Oct 2026 16:55:17 +1000
Message-ID: <20261016065517.91750-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct iscsi_conn_recovery has no refcount; its lifetime is governed only by
sess->cr_i_lock / cr_a_lock, which protect list membership, not the object once
a pointer escapes the lock.

iscsit_get_inactive_connection_recovery_entry() looks up a cr by CID and returns
it after dropping cr_i_lock, with no reference taken:

	spin_lock(&sess->cr_i_lock);
	list_for_each_entry(cr, &sess->cr_inactive_list, cr_list) {
		if (cr->cid == cid) {
			spin_unlock(&sess->cr_i_lock);
			return cr;
		}
	}

The caller then runs iscsit_discard_cr_cmds_by_expstatsn(cr, ...) with no lock
spanning lookup -> use; when cr->cmd_count reaches 0 it frees the cr:

	iscsit_remove_inactive_connection_recovery_entry(cr, sess);
	iscsit_attach_active_connection_recovery_entry(sess, cr);
	iscsit_remove_active_connection_recovery_entry(cr, sess);  /* kfree(cr) */

Two contexts run this get-then-discard on the same session with no
serialization between them: the REMOVECONNFORRECOVERY logout handler
(iscsi_target.c, per-connection tx thread) and the ERL=2 implicit logout on
login path (iscsi_target_login.c). If both obtain the same cr (both find it on
cr_inactive_list before either removes it) and both reach the cmd_count == 0
branch, the cr is unlinked and kfree()d twice -> double-free, with a list_del on
an already-freed entry in between -> list corruption.

Reported-by: Yu Zhang <yuz08559@gmail.com>
