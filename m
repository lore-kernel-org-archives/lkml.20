Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892055;
	b=FQcz0BD/eZfeXzxOwY7SJHP6NMQK28xsb/WCMe6MwYGIF5z9rHwY9jpySdZtgGMV1Ad/
	 4wzJzkdEg8G0Ks80it5jDW463+wb4rKltgXSC/b/R9ApNt44pT8/tvgMBt1zSQ2qqZDaX
	 FJ01VnproBLJx8penTXpp74WkULR5qS4oRU21VZsF0mk8pcy2WKscZSACpgghgVKA1Ltn
	 fMntgdqhb1QTvuiyFiqmvCK8YISTLERrgg7CYnd2r34zq7eskH69//AjH62XZvdxcBVS4
	 qjzSNQ2wKey0I88IEz0p77nBl4FKWKqdqwQ8ux9xt0Nd7y/3pHEu6wrMZhCUrZh33kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=g7OooAgXVyrp/xMdwbWWynIIIxWieLjdlc+2il+3n9U=;
	b=NMwg9tuy8zM63v71L+EWkmXXsG8evF/GtQHPYVsedpy8AfEMc9DymtIVLWS+jy8vDWnX
	 aNXJvzDeyV/b/nD1Idp9uC8o1y5xrsxkfc6bO2KIEM9+MO+MubaM1cV9yZtMQe42hMBDG
	 5ELQdg3B9XTQeSoaPmzCsMgf1Acg5G5HjM275sN5KzjIu+esreZHyS9gDjOPOJRAnH7D5
	 C1nxQMgu5xVZUdJN2TTt7yuW7S05oMPn2UwWjnDvzc2Q/tMEXaEND5fwiHdQEZ3kcwNFY
	 bhO297J5vIPKKRgu0XDWuf7zl3u0ivKfHR6fvnDrN1f1WZnyucE75z8V+rIUWDdffnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=adYbJztv;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE986082BC8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE986082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=adYbJztv
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9440304604aso87886385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892054; x=1794496854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7OooAgXVyrp/xMdwbWWynIIIxWieLjdlc+2il+3n9U=;
        b=adYbJztv1KkpNtEqZot0xRjgVbMuObrkgEOc4jvRIE0WqspU1MFLYYVPGTqjzSSmSC
         TwBD6eggaI9ZU7TCa3LUrInT2iKrhkaSqN2HBIktdfnPuJ/ZuL0zsjqKAXI9r3NxJD4k
         8VfMRUM/MTTG1Yuds15Z9y2RlMyEp1Qjp4QJz1dp+GMrkQ9JyKUNTN2DwWH2SDlTHZI0
         aJnK/rqIJwfeCpIjL/9gDcBStHKvA7i9ElTVPOQdtxxxrf8A7+XrhFtOAhMPYyWSsHNd
         Olw6Pqn35nzl6d940GZs2++t4fIv3MQaZ5lwpLYOzusbWLrIc/dO7GKBaY7cZK5dPpMi
         hpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892054; x=1794496854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7OooAgXVyrp/xMdwbWWynIIIxWieLjdlc+2il+3n9U=;
        b=N4RHHrbit2gCcJMaWNhm9/8V5SKEL/0BPN9U3yMcIq+udb8CJ6PHDfACrI4Ee/uPTg
         JXvGsKwq0S6MmlrKoX5De7JMxhY5L8TdBX29lP0KTA0CGxKsMT+VZQsgud9ZOp02qqh+
         wvg9iNXl1OT8HVh9Bnk+7BF/jX8PJNWDmJANiRTgKs2vGa3S1nfWYeqSU/DbCLV+fqL0
         ujSIYXn/uJCYs38TYd0eoZaLYbMR9pNF98YTW8WdwYezTKRKkIuZuCp/fM6wMOjUnjeV
         nC6DlT6RgYcJuCzxyiEynEwo3YOAfvP+OmG3mHsAyKihotuQisuC3s8LKI2uUwftwfie
         YTig==
X-Forwarded-Encrypted: i=1; AKwUvBzHDY4WAteyxyHHkc/w/JX8z1NM0s7yO949yqYbptKXp6V3QJle916YAbgsQetg3KIgdB0h58TxUAv0ce0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1QHxLbJf3XehO+Igqexp2hSaxUPlXzkriURUitAeshXHmJesn
	QIQI/cOVZ+Ohjratu+G2Tb52PpXleWT+q2Uxj1ADffy8eFzkgCFE4LQwsLcNQtn4OxD4qai7/d7
	z1hFowMk=
X-Gm-Gg: AYBFou0kLofSb/1/DL/zSQBEZgakoBNKIs54f1lt2q/RlgU7d7A7iXCWsnb9md4Ch9g
	Ui4WLp2VusBp99Zl+tbZ0Qt4szCeQ4r2U9/DHPwCzGwe/+/6lBPpnONN9GEus7qTizKh0X+kEDW
	Km0UURE1iZ7y7ddnNCXkaUnXcgKZA3GSOX6ybAfA4LtFBHve5rIuUFH4KRFisNgblGsnUpFSLOr
	q2aJ7lQPa/MxMleN9DRWrjd0WddHQfCtvBxQK+zp7Bom9JYv0be5jGP79A89ksP/7wMfUvNTaqn
	q0wEvHmY7/yepO9WaLDkjMQqAlPEAWu1bxYrV9YZ92WbcjQ9gSETHtW2wuHwlSUjST1ypWs4ntZ
	/3ldccehwA3Mu1Mcwlb83+yYwXZj7j2pQWr+euEv/rTsZx6/hIk4bp1GDVAyca93aE0uzElHwW0
	FEAw+5rZve41zkBl8ciuc1Q/pAZFKYX/P875uBqh15ZTTckBOEtIuDsXkxvufFsLqe93HliB11w
	SrCxuXoK9ZqBJV9EQ78DhZZGBduf7ZaJVQ/iBMT7wD/rnQnjCPywab3JZ7eKWJ411iZA5wKDdBC
	q1DAv7V9uIuo68+MPmHv3hFx66iYdVoOHWGjnwu2Jesl
X-Received: by 2002:a05:620a:4592:b0:93e:6618:f4a5 with SMTP id af79cd13be357-945e158cc18mr466781385a.3.1793892053536;
        Thu, 05 Nov 2026 07:20:53 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844be4sm485076885a.29.2026.11.05.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:20:50 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:48 +0000
Subject: [PATCH RFC v3 56/90] cgroup: let a cell make cgroups below its
 budget
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
Message-Id: <20261105-b4-cells-v3-56-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=2016;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=OTJ9QCzjA253vmOiFzdmdl9ASZAcRIOzDg5HpZYKTB4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIre0SmzA0yI/wJIyenH7ASDQ6yQ+AQo9cPfV8U2dBwxSpmbilBW5yHo+V0cJmVO98novDGWWSU
 Iorhwf+EV6As=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

An init that manages cgroups moves itself out of the root of its
hierarchy, enables controllers there, and creates one cgroup per service.
In a cell with a block of ids this fails at the first mkdir, with
EOVERFLOW. cgroupfs is a filesystem of the host, so it cannot hold the ids
of a cell. The init therefore never leaves the budget, and it can never
enable a controller, because a cgroup that distributes a controller cannot
contain tasks. The builder cannot create the cgroups and hand them over
either, because nobody can name the ids of a cell.

cgroupfs meets the conditions for holding those ids:

  - cgroup_cell_budget_put() removes everything below the budget when the
    cell is gone. If that fails, the block is never lent again.
  - cgroup_may_change() stops a task of a cell from creating or changing
    anything outside of its budget.
  - The seal already stores an id of the cell on the budget itself.

So set SB_I_LENT_IDS on the superblock of the default hierarchy.

The alternative would be to make cgroupfs idmappable. The ids that are
stored would then be 0 to 65535. The limits of the budget, which belong to
root on the host, would appear to belong to the root user of the cell. And
uid 1000 on the host would own what uid 1000 of the cell created.

Legacy hierarchies do not get the flag, because none of their cgroups is
within a budget.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cgroup/cgroup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index a0836b115c79..3f439ae0e3b7 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -2331,6 +2331,9 @@ static int cgroup_get_tree(struct fs_context *fc)
 	ret = cgroup_do_get_tree(fc);
 	if (!ret)
 		apply_cgroup_root_flags(ctx->flags);
+	/* See cgroup_may_change() for where, cgroup_cell_budget_put() for how. */
+	if (!ret)
+		fc->root->d_sb->s_iflags |= SB_I_LENT_IDS;
 	return ret;
 }
 

-- 
2.55.0

