Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356824;
	b=ja4ea21criNEFlNFRTEltj3+Mwc31fi4gTB8P3JDv+ajamLCb7tPLDKMEYDSPQQcsKh0
	 0s26tP9wRanH/JCeAIRl+vPfcNQenhUWaBFp9Vp1BnmO3xs0MvzZP18iTg2NPiD0RIWpP
	 8PlMfM/uyDI9pa/mGBaVerUt3LLfwW5LEA7GYIco75Xe9RUHeCZNZ15ntLU0GKiVFb5wz
	 4zf5JHeZXQu3LENjWkyaFS2vn4soVQ84SSp0i0Gxop4YSiP9DCHYiAAfPQeibwPn7iZDx
	 oD3WqHuwGL436mgH5FO9v3gqyqm8G8AUPhV0CLFekM8U/8wSqAufqUw6x8uHe51a/fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356824;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=BferNNNSUC7kWb64+z5TVBx4txrLwdHxxuPVfWleFJA=;
	b=uMb+TkNOQnAdVO83O5/mETqUfvcL5+8jsN9tvSSyNmadFsgnxv/f46EO19zRnQGxV9e0
	 wqoccAD1iuwSECKZp3Oe6KbV6SerscsT5Qh0kKws2IxH20NYNmKtESY09kLLxlAhNBC5R
	 jweZtBxAABAGEc1s7NWgAFuVnH5U9tuKdNsH8uFyj9ERoLQXGTPw6P5ZxF5fAOydaMKCn
	 BsTWCXGetr13kkFzSQcgAfzom02UyTU5xW0jj6zf1iLI4WNFtBmQ0qqqDavuZkifNDbtr
	 e0drJKqINF6CDm1YXX2ak0ddbVSpNJRVSk5rYPT6poCgV4jAGnLrDx2pFhH2vIqxmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=bQqVNsJ9;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2A606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A2A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=bQqVNsJ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=BferNNNSUC7kWb64+z5TVBx4txrLwdHxxuPVfWleFJA=; b=bQqVNsJ9TULcVmtJzq8Fzt5gNU
	aDJwD4xCDD3bYi6fovyA5fEHvJHwO93tTXM2NJ+5qVE+vrgZ7rrdVFmMooO76NrY+uafPrZr8+jRB
	LA8tDYI7hPDp+tfW2jbYH59fa7vu+1S/OE+eVrZHnU8/bX2nPuCBKfkDYGhpSYQXQIfbk0BDP68gX
	we0c4TIpAh3jiA6FcvwQAQoTs8aXDl9uHonOIoh46Ipj9mfH23wO37enLphxJ5Ow8QUCg3PYuRbiu
	kguMfG3Two2iUYlzV7LFlbpktjdhcQnwI2FKPLNqhBDf8GCxDjzvK2ANk78Fwy6JKyBtXAwkw2isI
	0/zc9Jnw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMk1s-003lCZ-2j;
	Fri, 30 Oct 2026 10:40:13 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 30 Oct 2026 03:29:45 -0700
Subject: [PATCH] ipmi:kcs: Rate limit the invalid state warning
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
Message-Id: <20261030-ipmi-v1-1-f84d5fa1fa6c@debian.org>
X-B4-Tracking: v=1; b=H4sIAJ1x5GoC/x3MQQqAIBAF0KsMf52gk0V4lWghNdUsMlGIILp70
 DvAe1ClqFQEelDk0qpnQiDXEOY9pk2MLggEttw721qj+VATmbn1rptl8GgIuciq99+M0/t+n+j
 yzlYAAAA=
X-Change-ID: 20261030-ipmi-a2223415ce84
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Dan Melnic <dmm@meta.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=leitao@debian.org;
 h=from:subject:message-id; bh=j4PbfNKz6Zd45z0q5j+Q/zlb6uBQGKW5KuZSdFWxv/M=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq5HQIqt3HkycfhcmvFMuBuuGjsL3kQt97ppol7
 buKGAbw3RqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauR0CAAKCRA1o5Of/Hh3
 bY1xD/4q2/csiOitXckBDFyLkn7NT87hsfNRL7pe2g6SRc/5DiDhEbZ17dTJ8cMQB40YdtA13aO
 /pbMD5OwFvWT7R6EARoNpeHfGVvxXvK+fFgnqMasEIu1qhKHX4+fDlCsJfWiJFsWZuw11HkBli8
 FIZDeLCnJJEzeO7dx9z+YNMXDtQ+jRQANSb1M1yjNTQeWWpmHKKIo8qJewy9zLoWQA7C/9OUfwe
 UlE8iwNOD97bJeQEf1xwXlpiME7oKMjkd/bzTEMpzYR7sO9h1VnoV3MAdq97M/Llb3fiABnKo8c
 ZEbKuTPiaZzma5O8hl2Kd4BKZvax/UHFQNpwFVX4IhcP+8tcSIG3dqI4xoahnuaM7VX7Ojpwlxp
 mk9In1KKzSxVRQd6N5qKIopFglXUwtn/+hqmFLyq7NajeFaYxH79qmkyArTgl50dihKet46YFfA
 Kzzenz0mQYEQvibzIMWMkjEmxWczelDpFxKseh0uB9zzM2v3rqc0hcMGoN6nWYsduPodSCK62Oi
 qUkj6rYIrefxsL0XnlqQbaOwBubjOEzsbN3+4FV8i3pB0Z0D59Txm1lHj6gP7fXvIvbw5OJQrsH
 NrCyq/3mfrQ2TsQm/WmYy3m8iFaT2EEjpJeoNQw+Iya5DRK01Yltk62ZKJaKm8L/86JHa2ki6ZZ
 qVb2B7gIDtPgjIg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

start_kcs_transaction() warns each time it is asked to start a
transaction while the KCS state machine is busy. The warning is not
rate limited, so if the SI layer believes the interface is idle while
the state machine is still running, every message sent to the BMC logs
another line.

Kernels carrying commit c608966f3f9c ("ipmi: fix msg stack when IPMI is
disconnected") hit this. When the interface is declared hosed, the
state machine is reset to KCS_ERROR0 rather than KCS_IDLE, and keeps
walking the error states while the SI layer, which treats it as idle,
tries to start new messages.

One host logged 29K of these lines in four days, several per second:

  [Thu Oct 29 14:55:54 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
  [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7
  [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 8
  [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
  [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7

Across hosts running such kernels at Meta fleet, about 887 million of
these lines were logged in one week, all for states 6 to 9 (KCS_ERROR0
to KCS_ERROR3).

That commit was reverted by commit 5d09ee1bec87 ("Revert "ipmi: fix msg
stack when IPMI is disconnected""), but nothing bounds the warning if
the two layers get out of sync again.

Use dev_warn_ratelimited(), as the SI layer already does for its
transaction warnings, given it is cheap and will protect us from this
crazy flood.

Reported-by: Dan Melnic <dmm@meta.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/char/ipmi/ipmi_kcs_sm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_kcs_sm.c b/drivers/char/ipmi/ipmi_kcs_sm.c
index c89055db39e52e..ae0399ccd82196 100644
--- a/drivers/char/ipmi/ipmi_kcs_sm.c
+++ b/drivers/char/ipmi/ipmi_kcs_sm.c
@@ -271,7 +271,8 @@ static int start_kcs_transaction(struct si_sm_data *kcs, unsigned char *data,
 		return IPMI_REQ_LEN_EXCEEDED_ERR;
 
 	if ((kcs->state != KCS_IDLE) && (kcs->state != KCS_HOSED)) {
-		dev_warn(kcs->io->dev, "KCS in invalid state %d\n", kcs->state);
+		dev_warn_ratelimited(kcs->io->dev, "KCS in invalid state %d\n",
+				     kcs->state);
 		return IPMI_NOT_IN_MY_STATE_ERR;
 	}
 

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-ipmi-a2223415ce84

Best regards,
--  
Breno Leitao <leitao@debian.org>

