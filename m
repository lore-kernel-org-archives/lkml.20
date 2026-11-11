Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386594;
	b=aAETEpR2lea3YFIzFKfK6VL6ef6JlWzNh8ndpKej60d+4tl8Mip55F9q8W/lwTP+IveM
	 FEWFMRb3lYDkRpJ1V6Y3JjKoo5M5Xf60Vu0jcBz1xzaVRi7KvsJyF2v/BAPm6/jQmhk9h
	 rsHMX5cX7CRSNssAvlNQQs10+yTupwHadsUV2lTsYHRCy2vV3UnW0pKgnH+JuM0CcWj1I
	 I03zkrPjHTJlvvJPoEBwHva8I67Dukx9QlhOFpTLjXy2MCWnFF5DgbwAdiV1q+ACOH8I1
	 3xyozjCiZzg8wS9hZYFTppOhxbb7I1XkqX1w3nkgS7wSYSLoFvyVrwGxL5FPxQfCKrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386594;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wN2OC1t+3U09rHRWjhqWomp66EIWenKx57TtkIRB3aA=;
	b=AooqkM5I8pkWVHmU5e8B9pL/Q8fk/oTA9zVlkrr/s0mFuJYXQgQgBtxkgLlSDUhqnLVd
	 4OSAxK2AeLmW9V980lzk4c2kZCuSpx+LmNXP40KfW578XF1uWmpve95fbKV3E/g/koGWp
	 ohsEktUVzpQ31mCvlOCqxVEvv0RBiug/5ewMjFP5KykLdtJQxV+JWdfgj2enQi+EoSQN6
	 lUnHATdKPw97j5NAaZbdJKp+RFyoJcTnBglz29UtawP+NzC+zV272NtLcaOFGxnqRYcju
	 fGla8Myotv2hDIjbIxnCpfxkvmEh63Sah8CHinmIqWG+stI2JBPllabou8H5rFNBuLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="nWF/Qw4B";
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65814606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65814606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nWF/Qw4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nWF/Qw4Bbem7LWAt+8VWjlRkzwe989aBTlzW87OaBG619/wdJz1LF4ZL1EtX/SSXBqvgrGco80yoL
	 TQEPKpL2dJVNkvjFcy75c8i9uUCs/d3Q7xjhwSJ46xtER8CA+j2qx6XQNjRxy6zOq955la1ycBCe/K
	 BW+AoESW1Gq7Lw4I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af42a9c5ef-b2a7a;
	Wed, 11 Nov 2026 16:43:12 +0800 (CST)
X-RM-TRANSID:2ee16af42a9c5ef-b2a7a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42a9fae4-d5c11;
	Wed, 11 Nov 2026 16:43:12 +0800 (CST)
X-RM-TRANSID:2ee46af42a9fae4-d5c11
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: oleg@redhat.com
Cc: brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0f4d5234b6cb5e479e5d@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] signal: Preserve the ptrace stop code for SIGCHLD notification
Date: Wed, 11 Nov 2026 16:43:10 +0800
Message-ID: <20261111084310.81013-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

After ptrace_stop() drops siglock, the tracer can consume the stop with
waitpid() and clear the tracee's exit_code. do_notify_parent_cldstop()
then rereads that field without siglock and can report CLD_TRAPPED with
a zero si_status instead of the stop signal.

Pass the stop code saved in ptrace_stop() to the notification helper.
The other notification reasons continue to obtain their status from
the existing group-stop and continuation state.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 kernel/signal.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index dd770e68faee..d3afa9b846f6 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -2346,6 +2346,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
  * @tsk: task reporting the state change
  * @for_ptracer: the notification is for ptracer
  * @why: CLD_{CONTINUED|STOPPED|TRAPPED} to report
+ * @exit_code: saved ptrace stop code when @why is CLD_TRAPPED
  *
  * Notify @tsk's parent that the stopped/continued state has changed.  If
  * @for_ptracer is %false, @tsk's group leader notifies to its real parent.
@@ -2355,7 +2356,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
  * Must be called with tasklist_lock at least read locked.
  */
 static void do_notify_parent_cldstop(struct task_struct *tsk,
-				     bool for_ptracer, int why)
+				     bool for_ptracer, int why, int exit_code)
 {
 	struct kernel_siginfo info;
 	unsigned long flags;
@@ -2394,7 +2395,7 @@ static void do_notify_parent_cldstop(struct task_struct *tsk,
  		info.si_status = tsk->signal->group_exit_code & 0x7f;
  		break;
  	case CLD_TRAPPED:
- 		info.si_status = tsk->exit_code & 0x7f;
+		info.si_status = exit_code & 0x7f;
  		break;
  	default:
  		BUG();
@@ -2512,9 +2513,9 @@ static int ptrace_stop(int exit_code, int why, unsigned long message,
 	 * separately unless they're gonna be duplicates.
 	 */
 	if (current->ptrace)
-		do_notify_parent_cldstop(current, true, why);
+		do_notify_parent_cldstop(current, true, why, exit_code);
 	if (gstop_done && (!current->ptrace || ptrace_reparented(current)))
-		do_notify_parent_cldstop(current, false, why);
+		do_notify_parent_cldstop(current, false, why, 0);
 
 	/*
 	 * The previous do_notify_parent_cldstop() invocation woke ptracer.
@@ -2710,7 +2711,7 @@ static bool do_signal_stop(int signr)
 		 */
 		if (notify) {
 			read_lock(&tasklist_lock);
-			do_notify_parent_cldstop(current, false, notify);
+			do_notify_parent_cldstop(current, false, notify, 0);
 			read_unlock(&tasklist_lock);
 		}
 
@@ -2927,11 +2928,11 @@ bool get_signal(struct ksignal *ksig)
 		 * a duplicate.
 		 */
 		read_lock(&tasklist_lock);
-		do_notify_parent_cldstop(current, false, why);
+		do_notify_parent_cldstop(current, false, why, 0);
 
 		if (ptrace_reparented(current->group_leader))
 			do_notify_parent_cldstop(current->group_leader,
-						true, why);
+						true, why, 0);
 		read_unlock(&tasklist_lock);
 
 		goto relock;
@@ -3235,7 +3236,7 @@ void exit_signals(struct task_struct *tsk)
 	 */
 	if (unlikely(group_stop)) {
 		read_lock(&tasklist_lock);
-		do_notify_parent_cldstop(tsk, false, group_stop);
+		do_notify_parent_cldstop(tsk, false, group_stop, 0);
 		read_unlock(&tasklist_lock);
 	}
 }
-- 
2.51.0



