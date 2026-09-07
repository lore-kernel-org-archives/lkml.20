Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E5220F2D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774598; cv=none; b=oak1DmazQr4VvGT0dCZ/L6wiqt7iwdIFtG45XftGtwekSB1MdbRyYuqxImMSwZMZjM4Mv78qlcoGPecF5s/c5vBPx5EygOMtcz9xmjBMEparU5KCijvijP40gACVvJgxNffYA6XeYuZ1J0aiTEqgM4Nz4L6uCvKYnyJfUkCvY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774598; c=relaxed/simple;
	bh=iLBB57PZ5U3pb7SS7fqcg5Rhd7j7cnvqUvLtPUqFASA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSlnHPcMZGFgW2t2XFLqXyeM4/+J/92C7UO+47MImDQC3UX2doJvYG6oB+gGeCm7hUUbvpwaHEDSb1FVrhka3FtdkH0hWsOtkYVJ2uVFZd76NM4AO+GY/EV5VjJqsAGF1S7fnEjCnnHbF1jUf/4Wnkz5GDy5PbJBrwmcyPnr/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTJPYR6i; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTJPYR6i"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so2483492a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774597; x=1789379397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Rc67cTd4W9vIL1rwpsbclZB6rOxxrOtQ39JEau+6IA=;
        b=MTJPYR6iIZnbMO0pBe1GEdvXpBh2rVdKqq8goORy7mrna5xJVfjce6p3wg1Pltt3uB
         yaWCW6gDSoy6pWE1s2KO+WcyTVLFuEbHbCsEiJkICimER/QsMNcCKk5k/LsyWDrvYCwd
         zwcilDBQNDBTLhH2mLAOeaowZucrOSkvajay2vq5mQ+gYfig4DgN/A/egf53LIChqAyU
         khlOP4ZsRlTkElqaTD5vkDCD1PTFNLacLTZRx6HTMDQQTufbKgL1ZMp4O+G4OkNM3tvC
         g0nH7whtxHkOo4oXx7OWRA1i4O2FwAEeJIRBVDEH7rpApkuTkq+3lvWyZEdJOjaPAFh4
         Abtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774597; x=1789379397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Rc67cTd4W9vIL1rwpsbclZB6rOxxrOtQ39JEau+6IA=;
        b=eyStVAhtO5hftD7+bsEodtsCJx4qyIXmyiXboMfzeCj8lx7x+K4sI2hAQOFpeuU9Xd
         qp8M37kYNh1DoXsppXYApYTlo8eH/bCetOfloLvPA6ij1Mu3m7r8giSlopjEqgFnXy7A
         sNCapZ4mJ27NgxQC535zvEQ/f/t5AzQY6Pm8YpmtEvtNdRc6lXRKp5tD239Wso0+7oGk
         LlDyWt+GtnC9OHAUxUGZULQJXQbGGWIt/w3U2aXJpcAPB3eJ+MJfmuz0by03Kr+ORwDf
         KeJqTZxIlpgiFUIWwQVe7/OAseYtwn/8MqtPDzI4rkgdyEml93lWPCX5rtTnzpo834Et
         EhHA==
X-Forwarded-Encrypted: i=1; AKwUvBz8i7D6BSq0suKDxweMgpw+H+MXZKj42Kn50DGX+xgneT19Z1754zLU9OJpSS+QRcXyOLqX5jRkni/rtXs=@vger.kernel.org
X-Gm-Message-State: AFuF++kKisQkrQLpEjA34dm5NbfFkUQdapDZ7EeUdcU7v3iI9GoQOJNi
	pr/QgQyCTCFz9ZpqT4eKJ9PojWYTkR8RW6GHK+7SJJLmL6bH166Ic/KR
X-Gm-Gg: AYBFou1a0DhydF6CR9Ma3zTVz7JJjcoOOPJ8ctS4G82+Q0V9g4rjA5mxTmQzDEOnnR0
	WK4/uY/2thgrEErLk43gger53lOlqQLi7kARaAEZeRuU9Zbhg265XhbhAvIAkLD/+A/uHPVgwyX
	Pfot4CpPtgd7i2TMKPwHFXalbl5Qrh17DTgFdcngRdWRKMQPGpd0FVHFzOCnbZGI8f+EygM4Qu/
	2Z88F2F3oe3i02G/pItWszIi3esjsptkplDYzkAk4/goevrW/0ALKHispVY3nnBEhY86+0MbfmE
	qn0nLFwESGHvxjZIqhxOwMOi7Zy6CiuXuKCFFUsbLZUD4qN8taTdyHPZMju6B+AihBiFa6mby4/
	Ct2ImKFJ+7UHL7B9kSTXUVCA2qw9r2x+9YuoO7GRggGrZNKC07QqUXwRiG7bcmOSDJ2a+/SM4Mw
	myowyUPBdBlC5LxT/XVk/1XdXtJIsjZbeefu3CkRD42+++c4p8UI3bUh6wDY6NF6kaxlvXma6Sj
	QLRyw3LGSbcyA==
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr33007088637.3.1788774596398;
        Mon, 07 Sep 2026 02:49:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm41895888eec.15.2026.09.07.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:49:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] gtp: fix repeated word 'to' in comment
Date: Mon,  7 Sep 2026 15:19:50 +0530
Message-ID: <20260907094950.18606-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'to', reported by checkpatch.pl as a possible repeated
word. Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to net-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto net-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907063804.26581-1-hemanth.selam@gmail.com/

 drivers/net/gtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 69fe5717846b..4aff23bcfdd1 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -770,7 +770,7 @@ static int gtp_parse_exthdrs(struct sk_buff *skb, unsigned int *hdrlen)
 	 *
 	 * This length field includes length field size itself (1 byte),
 	 * payload (variable length) and next type (1 byte). The extension
-	 * header is aligned to to 4 bytes.
+	 * header is aligned to 4 bytes.
 	 */
 
 	do {
