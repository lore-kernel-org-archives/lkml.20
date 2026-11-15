Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739231;
	b=211pxSocG6ikl+CqqAKPou8Vp+3vdfemsK2Hw0TMG8qhC4kW/gCMdc2rZ+hjrEa3w9o6
	 KPBlegUWLe8ySlW4AzEw/vVFqsM/7RKrwCf2lV5sBeUgrBDfr5tDamtJypxiNN7JWE4Rn
	 9O5m9y6njSzA8QhvXsUCHym7a7uCW6Z0fI8BUj3QCriQE+1Arkp3SUXkD/XOR7r0EvuSn
	 AT6fZy7cUSscJSzsT5UwhJ1UlQS7O/DdbWPIUWeCMF3IdfcEfACBJIb/u0rEXIgq1fJG5
	 iUchd8CKHRrccsVvE6wswNv/ScXigrRTRXCFJvCVdOOM0RUhfre+0CIR+TxhUEEkFRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BwKMmAKqPu7cs0jztWGbf0bxcekRUKjcR30xSolmQKA=;
	b=uoSruBBxuISDNzVHLhlnXd6UbE4mS7fBofn7hQ6d0eGv/zuogRU7KZeWflOC83cTkghf
	 CD2SakXOxTH+POzf8PCEoM24ISe0yAIEcLvsLgQoAAKilEhI7314ELQ8GsPx3YkHyu9ub
	 Nsi0hjIYTFMedXBTsVDwHCZ577LOz8scQwG3KrVX1uwN/EogrIyfn/DlfuzRQWt79Oq8N
	 250rlRdwwAwAdN6fjjSmaE9CuJ7ojtjtgUCMuhhZULdnZ2tloLq1Tr7zBLAUL7VBaLvKh
	 584UCeutmeGrG2jGHPVkJjJb3ZaB3Ji1UGAIxSa6IJhR7mN//EwoeLNJvWa6qpTmyvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPQa8KoE;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE6606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPQa8KoE
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so12338605ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739230; x=1795344030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwKMmAKqPu7cs0jztWGbf0bxcekRUKjcR30xSolmQKA=;
        b=OPQa8KoE8NBz3masLHOa9NpIYzd93Qy6Av/TK/2YtXrNMgSbxwBHTomVuGb6UQEXH3
         V8WWCtgwPExlNJXpxqK8AsFYFsJVyqG4cJ/p//GyUMf5KTEOjk91J6y6MdTx5XDxcLQb
         e/48Es7FElgrqsmFukokBnUVF4t4RYYgvBB2p4yS35M2HmgnqtHEfo/rxhtLyjDztmEs
         3RYqVxEupOhSNRWAvbq/jzmNKnVsNBe9mp35/AIOALzYyespId3qbxRkGLos4+JlsHP9
         JskTlyN3jIQUOQWUpDLRKpsBpZa9hsu9zmS0tnMjiOI2A6HT8pm4EDo4BXPtxfz7ga5i
         eAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739230; x=1795344030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwKMmAKqPu7cs0jztWGbf0bxcekRUKjcR30xSolmQKA=;
        b=jeZwnexfjsM0/t0/nSS9wcLAR8/nKWbgUHaQWNfvN7dQSxOjWV0U+Udw3UkJFWDezi
         TpyKCF6FPuzw8fW9UnoqazeV+VVj/EeYlONx/7u4r3bfXEhJbeZVqjwssG6KXVwaWum4
         pT2Vxe74bKeb0UaFIaw+iD136UE2rSkfBlOSbPOV1EgRsW6apD2zf6mL3EU7M7I07ANF
         HG+iElWJRC7y8Yexw/qFqWDuriccBI4JgukIf1pGnohQ1QeN95xucaZMOHYz9HMTLL+i
         SHFVOy+5NfyfDgJeWbViSQ35Ad3NcVZsVuG9d3iH3oQmtlVXCwvASNcziVh2NRdSgaG9
         A+Wg==
X-Forwarded-Encrypted: i=1; AL+hErFI1Z7icE+5PcKHsMuvJ50LacfwMoWRbmo6yDrhfhxhTA2uX4ja59apUlylnRCPJl/8CxRw1MZRbtWcUWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YnqntR0EZwnE+D5OJANezqK3OgYfHAddFBT5YkEzMpmkT8eih
	ljPaj2Zo3cZQGz4yY0ddtwJ8HKhDIyMHWrgSCqDrJriSWfmNdCuGq26RtThhBkCr2P6cJYPb
X-Gm-Gg: AYBFou0Qm2N5VUmu5495Omv2ayHRMmtwV3BnuX7uW+4SnHZF/Z/ieqC2KeyfY94NWBL
	mOU3yKRb4m4d9vOBqOx1xFBmYH2aNuy67DuVniEXX0gvHFZlKCsEueMDE2HRpYfwFM/fz8nRio2
	mpugajWKIexnD/8d3JHXYtdELiQNeGtgF4nc6yC11zJGao/bNKyfOIrNwM10iFZjEkCo5sNk4D1
	Gms+LADb9wQm0tKKfmZ17REgLirJx7GlVEyIwf4nFery/KbcbVQxb9sHKHehPNej0NExnUhirDD
	m0qxlpfFHwXU7o0AQhmbQ3Z/sNqwqGntglF++bflJ13UdsDOlwz6h4oMUuVlkkHG5d0B6NpBnJD
	RuOdYvdC/X0X7azMl7xsX8oAGe/SO1xUgrtDSxGd6G+YKDP7OCydeFxIp+Ts6vM2K+cxJ4eLyCd
	2PQOMIlxrt0xiuCqTUzJpiZ/GUZEC8krEV2RUQbd4jIUIMQcQobpzrBBhnSbN3Wag3xiNlhYIZZ
	l/WDH0uYZaJvkdF9tzOd7ilXIRAQNvbr/J77EMvPk7AlXoMsOSaaFHle9R5GTs9HRnigbLvFQWB
	wWSR66Yf6o59/MtOL8BuvuDLnoeal+DDwmPTfqqxjNyDJSci5STFFb9Z3wmrdHbLKDrKWDsXTaf
	8CMUbneSj72sWikmizEO4K+GKi9BhJH9NiVSkfgAegzRs553YkCNjgY1jHtv5IXjvU7a1Kz8f0F
	O1ade1yHFfW97pQcA6pOWN53PpW+1HsWQddVY4xeK0AxTZbU//rfxYyQmBFfH+nj0wtKh2XD2C+
	EBxEREWQhuLNEWG5VdMBcq+Li5y0yBoyrVqQl7yjrb5QZ7910XwzIDjXnCkVleh
X-Received: by 2002:a17:903:904:b0:2eb:a1b:e9e5 with SMTP id d9443c01a7336-2ee0e0cf7c4mr80607895ad.52.1794739229907;
        Sun, 15 Nov 2026 02:40:29 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm26739145ad.57.2026.11.15.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:40:28 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] scsi: target: iscsi: fix session use-after-free on non-leading login
Date: Sun, 15 Nov 2026 21:10:04 +1030
Message-Id: <cover.1794739041.git.danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

A non-leading login can attach a connection to a session that
iscsit_close_connection() has already committed to freeing.  The
connection ends up in full feature phase with conn->sess dangling and
its NOP-In timer walking freed memory.  The same window leaves an armed
Time2Retain timer on a freed session when the login fails instead.

The bug dates to the driver's original merge in v3.1, but the fix keys
off ->session_close, which arrived in v5.7 with commit 57c46e9f33da
("scsi: target: fix hang when multiple threads try to destroy the same
iscsi session"), so a backport further back needs adjusting.

Tested with KASAN and lockdep on mainline against a target with
authentication=0 and one explicit ACL.  Compile tested on x86_64.

A reproducer is available on request.

v2:
- 2/3: re-test every condition iscsi_login_non_zero_tsih_s2() tests, not
  just ->session_close.  The Time2Retain timeout and the multi connection
  ERL=0 path both reach iscsit_close_session() without setting it.
- 2/3: publish conn_state inside the attach critical sections.  Checking
  after it was already LOGGED_IN let iscsi_target_tx_thread() enter
  iscsit_close_connection() and wait on a conn_usage_count that the
  refusal path then deadlocked against with kthread_stop().
- Both were reported by Sashiko AI review on v1.

v1: https://lore.kernel.org/linux-scsi/cover.1794732723.git.danjwade95@gmail.com/

Daniel Wade (3):
  scsi: target: iscsi: factor out iscsit_stop_kthreads()
  scsi: target: iscsi: don't attach a connection to a closing session
  scsi: target: iscsi: don't re-arm Time2Retain on a closing session

 drivers/target/iscsi/iscsi_target.c       |  6 ++
 drivers/target/iscsi/iscsi_target_login.c | 81 +++++++++++++++++++++--
 drivers/target/iscsi/iscsi_target_login.h |  1 +
 drivers/target/iscsi/iscsi_target_nego.c  | 17 +----
 4 files changed, 86 insertions(+), 19 deletions(-)

-- 
2.39.0.windows.2

