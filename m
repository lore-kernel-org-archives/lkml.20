Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFB3FFACC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835598; cv=none; b=aNR3ZHdBwlpdcbcS8nMCDjtu7klhXDFkNbxVnTPWBtRWmjkZn1z6VMv2tdrXe7NeawYgAPooRPvz7MfRvgn/29OEkWuq+FJC3FHeKsgXdP/0Ogozi6RDQGqoElmbKNJl0+dJEXsAGfQkYZwtLHTCXTBBPz3aXo6mpDLz7YYNlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835598; c=relaxed/simple;
	bh=T+PbAjvDjs9UkwDIYLfn+71BTvBU7oss2V2Irly2PNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hyA4wArkld5sh4I3a7rglq3822JhN7M5odrKAOcmDQHP2fU779fc06RaUIhXF6ktfQKyGEZ/kX4TrLB60Dhtzj9gQvvCAKx78DCmuNXzRyIaonnAszSlb1ySiRlZ2tU02QTLwcmQp/ixFbC56tSLlqyIDpj6lmBlXOiTM6b00Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YfcbUzr6; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YfcbUzr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787835484;
	bh=hDj/p8jypRxjLRWVJMSiEO7QZK3O8045pLQDz9Be/Nk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YfcbUzr6kc/zrwXJdIq8Dp3p/RbAQgccXE8rgAPejKsDfowzF389u7IX46b2umrib
	 ylvZ01rf+fVvr317xgCOLITOybvgF+TKejbC5smI9qG9KYqSQA+HeJIm/rVteCzjN+
	 0Cg/9L4TWqWOV1kxy7D91Jc+/HJXHUjU1EXGLhVE=
X-QQ-mid: esmtpgz11t1787835467tf13d2e15
X-QQ-Originating-IP: UjMqKlSEJhg9MokEB+W+80+C2/HVxYCgg29CDkeaDgk=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 20:57:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18087141386268091049
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: kbusch@kernel.org
Cc: axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH nvme-7.3 v2 0/4] nvme-fabrics: localize string option parsing
Date: Thu, 27 Aug 2026 20:57:10 +0800
Message-ID: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ma4CB9LXNscGQSrFP+zBHA91J6Tsd20GrJfFaO2KXCh9lyEKa4l3EdBS
	ZuaxGF2yPdDLWMllj5yMSDHQJXKTgqpY9y9xApopkEunYyqBmcWmgOJPW8piwIFOUD3nQpo
	3LqsSti/cprOOJNhBP4nc9kETMOrcjIm27X2Yf4NzFAE8EOPyCeqUOk02VsPCRz1pov19BB
	gKBL7KQ+G84Ev/EfUvxGGLprdvZUyY/Fgd6supbkH66IWKdF+4U+dDi9Mk2vZ9GuDOhDUzu
	k+nL2x2OJzJijdQtLaeb14WuT01Z1PP/PdHrA6+cmacG0xEKm+U915Fq7WoQtzPzGMt43B0
	1IK5kRvBzjEjY6AwGu/hPE9B9DF49JQU1m0WkF1ajZNcX7i1naPzkyG5V7DPfp4UZha61Dy
	oBZmLRvdKRrF5IHB0Iy0RGJ5ZX6lcLEKBXEghZsJdu9VhDSM2abjtMOzSlne+MZiY2jrARW
	GtVqK5vmdPaa1wrstfFqsInavDaTCe8pJVYWZ5CNJEVC3LI4CiNj0+ReK4G15ReiKp3jm5x
	HToVH/Eqj9OcnWDMmmf2w/5rxyDbdlJA0fJlT15v/65AKXZjr8UBdtX743SJom+tId30YCA
	OJa27UXuWo8ia72Oyaws0F+ozBYT6JTSrqp9kkin8acnQnuT/FGQzTc1cNZ5dInKvmaNU7P
	EY2Lfz1ag5BEwkh1/zLlr+tDZcWwwk+6EQ6ukDnpTOCD6srPN0JLxqHiJahxSDG7+7iPP7j
	/p0du61stI+cIrU9svvD5Y5Iw0TTkipnYUjP4rnQurxWGWdY6W3f4WCs5hMrNphotjWMIqo
	G4hg6c5pHQuBTrMO+sU2JxPoLqG3XtETRnaqDlAie/H2FYeOkBh1HE4Bt9XN9qvnBVT7iaG
	TKSQi3JkOUkl1kw1pqmvQ50bnObVyiQUr7bcekaOgkDkkX6bxu7RFsJhoWUYFoShGnJzJ0W
	MtjYGOIXFIKTerx1JKCcmsn4jda0g5QAwZMs5Ad3taBTO0/k/PTrYX/5zNcuCpRoobh0Dxc
	2ESzT5CIRRqG5KuAmP/ctR3aRxfUqwMRiezZfil7fwhSYy26IMoOmkD+m1f8w=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

nvmf_parse_options() currently uses the same temporary pointer for option
tokenization and for strings returned by match_strdup().  It also contains
several copies of the same string replacement and DH-CHAP parsing logic.

This series keeps the changes deliberately small.  It separates the option
tokenizer pointer from allocated strings, factors only parsing operations
that are actually shared, and otherwise leaves option-specific code in
place.

The series is split as follows:

  1/4 separates the option tokenizer pointer from the temporary pointer
      used for match_strdup() results.

  2/4 adds nvmf_parse_string_option() for the five direct owned-string
      replacements: transport, traddr, trsvcid, host_traddr and host_iface.

  3/4 reuses that helper for the subsystem NQN replacement only.  The
      existing NQN length check and discovery-NQN update are left
      unchanged, and hostnqn and hostid are not modified.

  4/4 adds nvmf_parse_dhchap_secret() for dhchap_secret and
      dhchap_ctrl_secret, which share the same validation and ownership
      rules, including sensitive cleanup on rejection.

This series is based on nvme-7.3 after the accepted
"nvme-fabrics: fix DHCHAP secret leak on parse failure" change.

No functional changes are intended.

Changes in v2:
  - Rework 3/4 in response to Sagi's feedback.  Drop the dedicated
    identity helpers and limit the patch to reusing
    nvmf_parse_string_option() for the subsystem NQN replacement.
  - Leave hostnqn, hostid, nqnlen and the discovery-NQN code unchanged.
  - Keep p for the remaining option-specific match_strdup() users.
  - Keep the reviewed DH-CHAP helper logic unchanged; p remains declared
    because hostnqn and hostid still use it.
  - Add Sagi's Reviewed-by tags to 2/4 and 4/4.

Xu Rao (4):
  nvme-fabrics: separate option tokenizer pointer
  nvme-fabrics: add helper for owned string options
  nvme-fabrics: reuse string helper for subsystem NQN
  nvme-fabrics: add helper for DH-CHAP secret options

 drivers/nvme/host/fabrics.c | 119 ++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 65 deletions(-)

-- 
2.50.1
