Received: from sonic310-31.consmr.mail.ne1.yahoo.com (sonic310-31.consmr.mail.ne1.yahoo.com [66.163.186.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD263B9935
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216503; cv=none; b=Z7TzASoWgCJb5h4OLNi0plv3SOaEUGBUeszdd68aWrQ9tuSP5PFFuk/YKu+24XCqYi14NcmTM8Ax/iKSVh5MHAb8TsgOYF4U/hKVZ06FPocFLNGmv88ds7X2jgGpQlIdgYEoEAAhswSwiYMYGigS/JXdaAPPvZuU9cX/2a5yFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216503; c=relaxed/simple;
	bh=d4zY/ltnmjXjcN3r0DfckvWNHNEg/g2aMa3mQiZA4Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EItqGYzisM7hStR+CefnAHiXN1pF01kiViarNy2f+W+9sOATlakDt0QNanmVNIrhCIAjKjQDVAjqKdKA3jS5yI56ubAdNgrFIFlBmQuj5WOx2NeH4IK6CndkDhTEnwY3aBzhIVSdvlrXcoZZyHxWGgxJztX+ZfRB0ojZDN4LJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=TQwMuNuH; arc=none smtp.client-ip=66.163.186.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="TQwMuNuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788216500; bh=8t0OQ77yaNOPEWl7EKKJc1q7r/apIJtz5Yj4MAKBYDo=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=TQwMuNuH7BPmAnXJRPk465DoX67dgcB7euw7fQXVyBzK+kMVHXBRTXuiAsrGa64SyazD5taWcWZ9B3zwUXMvSG6fXpDlJq7NvyM31r9S8XDixE7IN8kJPqTOoifZGiqj2Jixz1AmpGbGzlRKIdMp2QrpZCcrrTPdrK1lOrzOXMnZIaujzNiCBEQuba4nvt9UEj47LBmeH9t7X8YdCEw2oYUcIqhXD0rvhPbl3zI/3Mm4VspNjOOKG90m180/p61c6Qf98VgzE3u8o62cFZ2M3udpS+muRXYL/JL8thW06RS6E51GsbG76Uz/FaCQZJOLwGMk9eRPghsj4+df4c0jxg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788216500; bh=J4mpD8fa3SjtMkOz8PgvEMkB79KFl7uivM9wHVQcT9B=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MxFzFKslxtwEHNvebLkCXLxg+5RohSCXuwAYK/6xVPJRMj4hxi4e8zE9GFUw7/Vsahb3YOB+eIhohMMtzxJ0ATgAFJ71rD4MjWybx2aL3V5QMvtt5zfF2Zd3RMz0t3sShNbOwheQA2HGt4Ho2bgSMtxgljNqDKsXQxeLFY6/SX12hmEsGSnphNHp9lLmt3HE8+j4CuYVUskyjUZUh+7kBssiQcZu8DLCnaWQQWP+60cq4jsQqGRsMRtkZaS6K9m4EVgljxFa/dOyNlECK5TFvr+4ioCDfTklXbdcCzrwsZ1iPPDWHfdvysrS2aAsFPnNF51Eim69jRP9W21cPiFcrw==
X-YMail-OSG: OyWRgiAVM1k7ad.Z8QCLccptmmvye4obIBa61POshNWMZ9s5i.bR73MAhxn27rf
 JZdzHw1_PYvIQ3H9s9Pw.Rwe08PPgYdc.CsfVVvtw_9Btp0ULafXXzykHz80DQKkya4n.ejKqg7Z
 wHVyuEpJIiyy29IYmwPxyUja3cD2_ZReQcJUZgwaEdOkkxdHKwGExZK.Qru2RzikARh5_cP.MOoR
 f5s4MB3IK.rqjzB9.8Tn0yXYNqbBieIGcrwdJk872rURtNQHjpfPTJBIOe3YKw_6oOYfn8qnZHJP
 ZPzaplw95zKgbLzgPBO58h_MiHmCaTb.RFwcNw0sEyq8uId.eIFooiORlrh1cIPZdPhuCP0dAR_3
 _Br2tTuPKc7uk.2.8J8k05drQMtgRJ7ltUR9SGSfm49s4oPuwz6q6we8eBdNoXb_cWMpgn9gHZW0
 AzyLTkbjLaIa3mp7miWArIwePP9s6ln_bkOLNUpBYj9fJnZLae3hURBChPqK04bX_jglQJPgdQ1h
 pSeX5MbpzhuCl8pv.9s4ACrVYbgu8N9mBkSZvWIAxZhYcA521JjCTmuU3t59jm3tXKacWhR6j.xC
 .XCgTS3zukneOfiUshx4K4OdmrcVkYuoxgSwqgCnqBjRZreECNsnVFFgBBE2ndKZ.6Vko5c9a7TK
 8DDWio_Aq.AriUaExJyOJr3ejJ4yRGjim3S09wpwCgwjQvK.4Ai6fdHRU08IXoIFNOUWuXGE5WDg
 Z0UHu3DPZMp0L5d8Q6tfjuuqyhspuk6nlPul4pons3IzniCHu0c47HvrnJldMZsI3tFx.B6tHzV6
 KaviMWg4tOs24OLDTslQm_pFeIVLNyhctQJlAlyb9Vh6iRDrLKcSYMZsZDOFuMOe_vQj.PKDePmx
 hgJrCT0eQLJMeuyM7W6kdbqy18Sd07BLoCUT0GSnn7OKbsuyt6LZDYxX1RXfuj4BetZdgJ0HxGWy
 qlVR678AIgTLWnra0.UHDqRhmgZoINKf57wFV3hEr7tF.qsrvMH7ZXe8401jNr.3bpKsPEpFqP.e
 BhzIxoB9r1LVWRpqsEmd1YqTeG8XMAxya0pRffqktjpZ_WZmOuW8GT7A460Xvdpdjd472GVWzZLd
 tABtwgunXCAzQqhzsws1BBQXcIgV0I51ykMYs74bp21XYKVYkfYLcBCnZ4WE7fx9pbMqUAGeeXlf
 X9ywnQvlg_NvcbgfJPcCnT8cdbULcYxV3Pa5INDBI4EIx9DDNyPJrrvX4FVSjvudMCYJ8MajZOx5
 mzvvEcqxiTdCOhIOyBjzvgGTGlej6_TcPfO8IDQO4D3Ajx83.srdLi.NZIp1SpTQqIuqy17G7swx
 _qRshfIPo85t7ugnoesfvcO8aiDhjMignToboaTn_H5A5B7c6vQGJtqrogrHkEhH6kGrhEreBxLd
 rL7av3pH8J1JMHRgC.IfxyF26JxgPj67bJjCqEkw9WycuttrM9EiDVX8bowMbD0DCQK6TGtdg7WM
 dCsnmsJlt6Ted7Sl6aW.imev1XdiyFhvWur5IQtPdP1QLm7FoCxaf6ZAwzbPQXgn7yyW_Guq0ie.
 .YbxDXlRWi2EhyB3fVAAJFdPE_XeSl9KYtxLI2IZhaxa05vxq.6A9aEqJNZ_9Qk1XWaDylvPJgS_
 .oyxa4Vpq0TWUXy7Knyax3vLf7VUThffHZTvmv_d4IoPzkihUCR5T0vo4mGndlquKeyhXHyvaVho
 q.YgyAi4UG2SboIxZdjjDazfjV5tUeCF0GNHelcMY8E3V3IL0b.kJFslysuFB8i5rrjZpEPSyZ1S
 Tl75CA_epj4Ns27wjfjiIRK2cWk19IAHbIyiYAaFZjpt3kEhVunxZnH.kmaRi6By3hZPuOFME.32
 By_6PgdF0y.BfwspqCHLUapjI.3kCAODrD0pt0dCINe6orv2g30G6oMoKxWS7WUtI2kW.6qRx42c
 3E1CCTAiA0GsrxxpRXN1u3tq4fGzWbKfOXcnl8Y51wMDFrKkwxEGZ2oiRG30X_n0dNiGn3vbeT_V
 uQdAad6ZZhNJNja5g_VqFkSuwITW6a_35t2PH6FdeVrRuubv95JsbY.p8pczEf9VK3K9xZwndKde
 tyhKey.blrkjtL1_9GDbC9OxWIrOs7ZdewgnBxh.zndfsvNfOIt9q8anE1cNoibYmenRyO6PxvQG
 wh5h7YVuZATCDBWVGY2f_979zlKZpzWOJWixuuAVTJPfC4_o73WQoCj5euRdKpCVpm8TpN4qmI2y
 _mM7S.OF64N9MPeQjcmG_FPNjS9bOjlofd7M_M.snKC.13Y3CsA0a7KJ76gJGT53xFD8BR2eJoJ5
 iA4dvhXUAgILxC7DPlKQjX4Rt
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4a1df3a9-c7e0-4e3f-a449-ccb131771f0d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Aug 2026 22:48:20 +0000
Received: by hermes--production-gq1-678d9dd684-vr75x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9afda7e456c775b6473ef75f34d3e2be;
          Mon, 31 Aug 2026 22:38:05 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey@schaufler-ca.com,
	paul@paul-moore.com,
	linux-security-module@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc
Cc: linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	jmorris@namei.org,
	serge@hallyn.com,
	keescook@chromium.org,
	john.johansen@canonical.com,
	penguin-kernel@i-love.sakura.ne.jp,
	stephen.smalley.work@gmail.com,
	selinux@vger.kernel.org
Subject: [PATCH 4/7] SELinux: hooks for secctx_to_lsmprop and update_lsmprop
Date: Mon, 31 Aug 2026 15:37:45 -0700
Message-ID: <20260831223748.4304-5-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831223748.4304-1-casey@schaufler-ca.com>
References: <20260831223748.4304-1-casey@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement these hooks.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/selinux/hooks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 18dd28b2bb13..12614478b638 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6946,6 +6946,13 @@ static int selinux_ismaclabel(const char *name)
 	return (strcmp(name, XATTR_SELINUX_SUFFIX) == 0);
 }
 
+static void selinux_update_lsmprop(struct lsm_prop *dest, struct lsm_prop *src,
+				   int lsmid)
+{
+	if (lsmid == LSM_ID_SELINUX || lsmid == LSM_ID_UNDEF)
+		dest->selinux.secid = src->selinux.secid;
+}
+
 static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
 {
 	u32 seclen;
@@ -6964,6 +6971,13 @@ static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
 	return seclen;
 }
 
+static int selinux_secctx_to_lsmprop(const char *secdata, u32 seclen,
+				     struct lsm_prop *prop)
+{
+	return security_context_to_sid(secdata, seclen, &prop->selinux.secid,
+				       GFP_KERNEL);
+}
+
 static int selinux_lsmprop_to_secctx(struct lsm_prop *prop,
 				     struct lsm_context *cp)
 {
@@ -7694,6 +7708,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 
 	LSM_HOOK_INIT(ismaclabel, selinux_ismaclabel),
 	LSM_HOOK_INIT(secctx_to_secid, selinux_secctx_to_secid),
+	LSM_HOOK_INIT(secctx_to_lsmprop, selinux_secctx_to_lsmprop),
 	LSM_HOOK_INIT(release_secctx, selinux_release_secctx),
 	LSM_HOOK_INIT(inode_invalidate_secctx, selinux_inode_invalidate_secctx),
 	LSM_HOOK_INIT(inode_notifysecctx, selinux_inode_notifysecctx),
@@ -7812,6 +7827,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(sem_alloc_security, selinux_sem_alloc_security),
 	LSM_HOOK_INIT(secid_to_secctx, selinux_secid_to_secctx),
 	LSM_HOOK_INIT(lsmprop_to_secctx, selinux_lsmprop_to_secctx),
+	LSM_HOOK_INIT(update_lsmprop, selinux_update_lsmprop),
 	LSM_HOOK_INIT(inode_getsecctx, selinux_inode_getsecctx),
 	LSM_HOOK_INIT(sk_alloc_security, selinux_sk_alloc_security),
 	LSM_HOOK_INIT(tun_dev_alloc_security, selinux_tun_dev_alloc_security),
-- 
2.54.0

