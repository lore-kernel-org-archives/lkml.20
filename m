Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892282;
	b=1tOMG7pry6tcrlfAIyTFXHQt7X5CCUilcylVJDnWEHTDXecHTYvav+RZtKPoNwTKUYSK
	 GkIQamQFZIGYggawzPR+z3nxkwoQuFekiZYtner5NxxCUaH6Mwwr+/eK7YydYAn9s058R
	 iuQY6ysO8N9YETpTX84vU6k4MyM5FIDKwTqGIlkCwMW7FAsudluhDeChrI3BJS1Cx4239
	 SzpCv1Ll50b2Z6Z7NrE4kRR2wzA4wZnaaWBK/vpGAfDzpFaOywVNgsy7cFKlZ1NZyUh7t
	 WVVEtVSnWWDoOhkxbaN6rIwGsXcwKzHeTTyWvV2Jp95xLofipbZhr08JW4ahFgLztkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GVMBWY8D8FTfluQU1TgfP1HMPR7EJYqzlojf+T90uhA=;
	b=21ppX6xB5kQ2sPm6BX5wRmn2TTMzzLShr/swEnXM8zaNMweCMY9XCYc1AfhjxBqvYnf0
	 kj8hM+2Vw3xqfSYevX7lOjCuAFh7cEEqXHPyWrOoZyqtrRo4BFPx6vmD5SRw6Mi477tSS
	 ml7gszDol2t/fv5ZWPY1dtC2hBYOEuxq4fdfvZVlO84nPw9mV2h5vOZUNqFLYbBcmiezV
	 mNwgTlKihJ0r0D5wDWHtjn5frP4g6hwQ2qGFiNYq0y3UCZa8bF1i122amlamtQnhDsuCY
	 mJmSWPZkFXN39ef2g0vo3bTKOQ+SWPjYfq1waJfWL9aqtlIZagsXwgTYIZdzzd8G4eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=eFsyHhKU;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C01606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C01606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=eFsyHhKU
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f3c895a0eso184776985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892281; x=1794497081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVMBWY8D8FTfluQU1TgfP1HMPR7EJYqzlojf+T90uhA=;
        b=eFsyHhKUo7vAAywakMuEXs/Y8oQtA+QSN6W/MeINUEFmO1KRNIxq9Kb/Rch2JlZO65
         4gdfLfBsBS/Qo9VEIO+1V2U2hjWMy2GHaq/N3RV0NujvnlTa6zKeEA7zyjQ+3zyimXGY
         vtGpIaSay0hLFJ8ArWUBh51qkHopDL6BGCxdNFgckzCgIvzzH4uAsf+ExSG/hY5qlXJq
         4HXbq3o1xZ9D5aDJh69ckBBOM58i+70K+wxOeLC9x7Ax8rWGg3hR1EUTCfqJY7nqDWtR
         Cgq1dNCmnwbjnguhAdFmPqGjs0emXF3M3KZZ0bJ8nwSVvePPWD8iYClbGE3C/TLgvBuT
         vhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892281; x=1794497081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVMBWY8D8FTfluQU1TgfP1HMPR7EJYqzlojf+T90uhA=;
        b=z2lZJwfJ7+CNahKaJLDqaxfI7NykfMxlDsvrfQcjZtohg1v3Pow4zIG0RKSMLGLT0K
         fnWHw+oNKKQc3IOPC/Ag/+ksN1x625nRpy0F6cdE1krHAESJ2f16RAjKwzlrH10UMnWd
         vPcyrhQz7hH9LZIBP9hdS3LZUn9/GiR0ZzgT9qYn7CNQtgVkCIM7suTxbR1ifQ3VHnUk
         IYo7VFh70qCbiouOmhU+G3nbHDYbRA3w7fIgkmOyDKQXKoP4/c11dEnFEBqE44dq5mfm
         eOmyRGa+0vrYiptkCjQmurzOK2I/cHGlbHXOyWTecZgttCNX1DU5IMgaiRW/iuv9D/iB
         aAmA==
X-Forwarded-Encrypted: i=1; AKwUvBz93w0vv/JzPmFCTGxkOfNCR8qTssozHAse84Ip9YfXRPWJW9TrR2y5O11Pe0oktEj4hDQltTDhPEZ7QA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L8eNw/ecIYQmzhuHJXqoIiRNDk2qL3D0RJ4lrD6Nc0HgSoscF
	skNqrnsH92UyqIKkzg+p9E2RgHxPleiple8JA81/rAAGKGdI7kF2QqRuqQSzi5QlNuA=
X-Gm-Gg: AYBFou0rgBRdYzq14DMR3pgOeeacp74l6HiDCq/Y9SbveeOY0wjmb61oLOdS4XGkfiI
	dPmDNjoJEKLfI43/hKYVfNV+gKjzfyi80OEsgQ+OVPxi2JPYDSRc5uLlxZrdZvPGB4TunxALijC
	7bS51/uO2pbFcwM6P8gHUf3p6Vtz5XY7YQKmuos+64Pi2dByt4w5sv8WsJeEZEc4H3oXRx7p+k2
	zwVzYf6kbglf3pu1xNS562adATO/56jraGnOs5tSFJviKbynxs58lBb9qsnVfyyUdoedMdC4rRY
	+4hdKq1zNxdF4GfG+jxWiRoZ5a1E8/EwIa81Z4f+5we19m9Y50ajuL8D+bEwyMVPGTxcvIzIEEq
	ZZno3EdpOQ/fvMmshkLbgXbLK/dS1w69Y0qoGjyKHOOTn5AuXkl6u2BXkEgxg82QGcIJJ6X39nw
	eSeo2PIdAlSEUYYM6xUwEsl8Lxz+1rKZeNPgi0iTGTELBfpopfjTLSxgjnPqu1fHVntTYeqve8Z
	RLc2ZDrr8JbXZQBQu/nnXr+6vUSHj4usjLtXYiY9Z1Qa5h/tQoFXzLlosxGWbCCueQUPDUFT6T0
	391FREBInM+mbuD7VcpL31EiRT3JVJZMqXKHEyM5xQeK
X-Received: by 2002:a05:620a:4686:b0:93e:84e5:3c66 with SMTP id af79cd13be357-94421677058mr3210312885a.40.1793892280636;
        Thu, 05 Nov 2026 07:24:40 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d484499esm488155085a.26.2026.11.05.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:24:40 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:58 +0000
Subject: [PATCH RFC v3 66/90] capabilities: let a cell shrink its bounding
 sets
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-66-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=1570;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=PMZ3KyGU55KzKHRvscR9iQYn+d48zp10fb2/lLT/sVo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP3quLI3qgBXnJ/5A77Rnt8LhgQ1d6t9z3+0xUP3nVR8M3nlWbRwHg4RaKFQMsNfySEtdf8/kyx
 P/PJZtA8xOAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

PR_CAPBSET_DROP requires CAP_SETPCAP. Without that requirement, a user
could run a set-uid root program with a capability removed that the
program relies on. A program that does not notice that it failed to drop
its privileges would then carry on with them.

In a cell no program gains anything from its file, so there is no such
program to trick. A task that wants to give less to the programs it starts
should not need a capability for that.

This matters in practice. systemd removes every capability from the
bounding set of a service that the unit does not list, and fails the
service if it cannot. In a cell that has CAP_KILL but not CAP_SETPCAP,
journald does not start.

Let a task of a cell drop capabilities from its bounding set without
CAP_SETPCAP.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 02e25ab18f56..1e0ef7465766 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -1281,7 +1281,12 @@ static int cap_prctl_drop(unsigned long cap)
 {
 	struct cred *new;
 
-	if (!ns_capable(current_user_ns(), CAP_SETPCAP))
+	/*
+	 * It takes a capability lest a program that gains from its file runs with
+	 * less than it counts on. In a cell no program gains anything from a file.
+	 */
+	if (!ns_capable(current_user_ns(), CAP_SETPCAP) &&
+	    !userns_is_cell(current_user_ns()))
 		return -EPERM;
 	if (!cap_valid(cap))
 		return -EINVAL;

-- 
2.55.0

