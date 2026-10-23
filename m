Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787989;
	b=jUZrZV6pvPckSkZDDMeEOqyPm9jULapRB1nb/h+tFlAdHRvzWKb+c8Rf1paS7Q5RlCog
	 80ig5TNxHB6x47M2ahJm1kklpgMQrudKq6gEZz5Kb9mvyfVmt/2VFqFog8IwbsfznzEzl
	 xA+eF7krjudDiMs+el6Bz4JPmtuzhHMYVAyT+MicBJmxVbU+VLR+1CpZqbzYQjz+ynnL3
	 LL5bwXpl4HjHa1dtRbBvKk++4uw7b9XIR8E5y37m5R9QbCWO/mmtY4/PmSq+hAhFENd/4
	 qf4HBX20wohtzeNGslKUIXtmM5KeCCg46M8BNYe1OC+LMN9mso7pCVHL5IRbHyShvLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=joBq8zZQZw7xm5XS5EnT5tSj+OH2u98OsmcyfjTP7BI=;
	b=D58EThwAIj/2SYFYdFvN3LcOoO/y13UyOLdL9Sklm41n9mv5UEZz5suMHRpwL3Kpolsj
	 qypexfTlqZSzkdjYTypA8JBCYrDQfIt6CYj+m5E8pJyuUQr7GPYqNNQoSopCOn8T6OIgw
	 doyedR8Mw48BhJ6jFdTUa09Maz2Aq9Ci37ojdQYUzvJvpV70sHSbpU+AjUkR+l+5tWB/z
	 Gi3+S+U4U82XSmEFzcbq4O2Ux3xku2hUS/bWDZN+NQ7L7WQJxwZHUGd2f+PzrcoycevbF
	 BTDqq2cxvw2FbncM+IX+2dB0sFXcjJHn98qu6+vuHR63e01Zt3+Gr4ev2YO4Wo32h2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rnZUsKJN;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E05606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E05606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rnZUsKJN
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ba8fcc684so12954556d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787988; x=1793392788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joBq8zZQZw7xm5XS5EnT5tSj+OH2u98OsmcyfjTP7BI=;
        b=rnZUsKJNsKN8ucr/+81v9CEZC7uULbAvGGsKrLc11qT6ZCrbx34Z1SoC2VoYh+uiQh
         9hz1QS3IrsPjhHfOr1Yu/VA9QQd7tyz3CNO3bEfy8FPOwqj99HfNs/Q8jK7vQX+Jhen/
         ekrWV2wxzMKU0CG5XYHqlgiyECDzVCEhzjIfaJddqHaKbgKetQRFiJNvj+/B8/aaJsPA
         ctIRuSa87WyAjXLVHgE2vty+HLxBXuMFaQs3OfOAnCOI6idjhz/OML429QpGxp2/cRqM
         +Cwb/91fgGMYO653ljI6WHCl72mpndmNZNLzkiNmyBuD2OxyNDZzdSrS35mT+4wp/ie3
         Q2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787988; x=1793392788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joBq8zZQZw7xm5XS5EnT5tSj+OH2u98OsmcyfjTP7BI=;
        b=Cyz9/u0ivG2zNhoCDuEf9Ca2s/Dcha+/LN02C0SJ5DvTlWU4xVc78aYS+95lI9i6y2
         jSHxSLdFHn8lRSnmP+eq19D8YY2AsFdlwCwL8xz24+fbMAJxiZKAKx1oledIzjXx3p5P
         +/QcxcX9BAZ+kQWemKlrQJKrcZ+4Aadv5C10E6i/3v3sTNZ2ERyVsUT/jUTJaOZ65lih
         ZQ/x0wS6daYIKm0VngTBQS7lCy7HvrYNIhuYVNVWmmVdzKdE824ZFzewRP0X+LNExIYA
         wYPViohpDBIVkhUPgwX07OqO/ukElOd5wWB7xss0AOxcQ9iMFJ+AjuhbN4cc1AwKQfMv
         XG5w==
X-Forwarded-Encrypted: i=1; AKwUvByr5agIMCHPilJ9UFKUOuGdcPR5eFnR23qCVfTtgrRRprG5db4frnjFGnn1RznBvMyN9F+79SIU2VQaNJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5yQGOW+gJFWUnKpwg/qLfdjQAa+GvGm6snLdgNCvgsTRAflOJ
	ax77nSnfG8JDP43ILEtpuAWPXAY58yhKal2lbPxo/9ss52BbpDLc+Z0Lsu/mxnwkPR4x9+RddvW
	dgBkdsec=
X-Gm-Gg: AYBFou2GDX+Tkf23MHMxb9VB70dV/CNjsJS2ahpvNCa7VSydZ9PXof7ziAGgJX8g/m4
	448/RyItHmOf8m/zG+QOF2c3B/Xcp3XZrB8KIaeXduYXi4hhCkBpOkfm/UOae27nMd3s4ccjJTL
	TbKJatX/EUXYTfIYlOqU3TH+vKzNUWpOBR8mFmZQLCS6v9oxvrJ3CzHy+5SEIx/DHQtaR0mgPb7
	IQ4MufHNqz4g91qt2DhipTeky+r9gCSMvo6ysOcQZWRk9IWiziEJL/ss4lYJ38dHPzJxe+lKtBC
	9OdZMA/Fv3lChmsT/hgDGt+ER0oSpE+sAxyx22kzl9boXdS7dKImKrhuj7PqsgvMOu2g0L9fFaP
	kv7caH3NIdeoiZzrFPyIzfyMtbChPgZfV8BBjy1y2/Wv87jY65JW1bpEUyaC1w7PHhb2hqpSlKK
	b9jIiLSbAKMpO13I6/WrsbgMRJ+G4pIpceEuAY3BHgYVwd0WoWyEYJOzif/7+q7E5ALPOSbhFQm
	PuYoJL6o6rOE58bo2XZ1OuIfmDtaqQgLN1yz1v+z4FOKhDRlIQ1E1qxg0UozImzUH7vSo7R
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr26198285a.51.1792787988058;
        Fri, 23 Oct 2026 13:39:48 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f068328dsm3074785a.23.2026.10.23.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:47 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 20:39:32 +0000
Subject: [PATCH 3/5] fs: make mount(2) remounts killable on s_umount
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
Message-Id: <20261023-b4-s-umount-killable-v1-3-844a341ff1df@toxicpanda.com>
References: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
In-Reply-To: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=1659;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=21ycwsFWqOYt//g+Upk3NygtveQIX34cXPdaquwsbgE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLi90bNtWIHcr4hcJzZXDJpXYEl9y0XtUaowC+Y7MMp6NDdPpa4E/8ne+HjjJfs4J6MAM6uXHhw
 9fa17oKSsqw8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

mount(2) with MS_REMOUNT takes s_umount exclusively, with MS_BIND as well
it takes it shared.  If the lock is held for a long time, by a syncfs(2) on
a device which doesn't answer say, the remount sits in D state and can't be
killed.

The one which wants the lock exclusively makes matters worse for everybody
else: while it is queued, every new reader of s_umount queues up behind it.
Killing it gets it out of the way, the rwsem wakes those behind a waiter
which gives up.

Nothing has been changed yet when the lock is taken, and both can fail.
Use the killable variants.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/namespace.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index e5feb4e48290..837f531e494b 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3485,7 +3485,9 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
 	 * We're only checking whether the superblock is read-only not
 	 * changing it, so only take down_read(&sb->s_umount).
 	 */
-	down_read(&sb->s_umount);
+	ret = down_read_killable(&sb->s_umount);
+	if (ret)
+		return ret;
 	lock_mount_hash();
 	ret = change_mount_ro_state(mnt, mnt_flags);
 	if (ret == 0)
@@ -3531,8 +3533,9 @@ static int do_remount(const struct path *path, int sb_flags,
 	fc->oldapi = true;
 
 	err = parse_monolithic_mount_data(fc, data);
+	if (!err)
+		err = down_write_killable(&sb->s_umount);
 	if (!err) {
-		down_write(&sb->s_umount);
 		err = -EPERM;
 		if (ns_capable(sb->s_user_ns, CAP_SYS_ADMIN)) {
 			err = reconfigure_super(fc);

-- 
2.55.0

