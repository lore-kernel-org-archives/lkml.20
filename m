Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787984;
	b=1s+tjGQylOHw9B8I0vI4q7XT6PO71NPnKybY3mCv8GrzgSNJBynWBU43tXM5aUlobYEG
	 PGsxO5KTnSXfoXRYUUyCxMSuxrWXqu9XWwedIYWA21p0cCRe7cDg3OjkMsqayDYjd7Mqd
	 /bJ98azxfDqGvIjm9iOxqDosCiWdP2BFCo8A0wv8GQL82bqVNWryNEgsMFeq0jMhi6X68
	 u9WfqK+jS8S+8/DBx+Bw4vVo3hcLLYvvMqB4qX1dIXVp6cDp8YjwZr5KEfcl960cLy+L8
	 wtdTUfBvEHdLq25lEZRXvQNEZWRrXtYvx+gWb7wj+qGozjDTszLEMPTxDpQB8G9lyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KhND9XCVrKbJO7l5U95EeteiXITb1wWmDS23m7xhTi0=;
	b=WaRT4Pz47XEV8UPFcRBNMgtKNENMIqu107qc1PrXrMQUVBAl/6ZgtiRVyDnntXJzM+6Q
	 us0Hj3Q8/6ZUNxgmktLABZNNpPp0FjFjDo8lF1O0szM6p8rT1PMWZUDNFHF1+jN0cx40c
	 pbi9jxK6qCDE9YrRlOWv5bQJuLo8Mza05weyc4bS0PJKFrVdswtF9lzv/eRLRSYuk8rDp
	 Znz2OsKcc0p0flNQVPazXC+VtjF7l5GyKauqUqp2NbORJYkkxi8pfXn+MuEdR9yBTxrN8
	 6YZP29zu5q56j/uzH43ISekJygUN5sjFNY8baosoq7Y3oNIEcq4rQ3bGTZOi2X9Xz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OzIhFCBm;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822D606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5822D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OzIhFCBm
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53381e53b80so13406741cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787983; x=1793392783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhND9XCVrKbJO7l5U95EeteiXITb1wWmDS23m7xhTi0=;
        b=OzIhFCBmkPmKHSJwGDGMgQRUzaDT4NdbdTFNtN4HE7MDhQ5LcbgngmnLbBHA5bu02J
         ASwMSHEU+6TB7d8O+0NUmarDvdnNxn4D+0qH7reK64frGGpp6mowr/eKztkjY48M7wDX
         LJzrDxxR1QlWibuyhHnJpzPh6CyKNbWyMYgKfVmlUh9CB9BsIO9+6Ls9MgGHo8zs2dXb
         rhGF0iA7FnZ2uDyI6vgbcD4n+MGm6OWXLV+toJlpj1/xvw3M9wH6LfC24bT7F+KNIiP+
         aZ12GsjJdqu8rcgAjvWszla6AhHlw6di6b2Hq0FgkyesjGMwkKYLfHcce9b2z9AZV1Gm
         ZvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787983; x=1793392783;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KhND9XCVrKbJO7l5U95EeteiXITb1wWmDS23m7xhTi0=;
        b=tBMsNJEvoTeExd49vPr8aOHc6VIAa11aS74DDwAHaMR8TBy0e62X4XUcPUbpJbAP4r
         7fbimmdeAoxiKoKgO7kdo23UuCgpFLm80r0bMBhG4S8MJ/uQCcmfbl8A/pw0mOWSjs2x
         Qnh7omBQcLQe2tZx/AEtzM628UNkny4l3GKzp4fGPldDwt1JZxojO1aqH4PyeSwho8fJ
         PEPNkZSVF8bmUys8e2r+hpVSXp0ROoits0seXOf5Y2F/4PhZOs8q/x37sLqFiPZIezp1
         4d7wuiYAQ5CCPdp1B/X/HOzq+tTPEZ/Qi1XkPIYuJ42YOLy7BcpWivsAxvFnFQv+7v0X
         eo3g==
X-Forwarded-Encrypted: i=1; AKwUvBy8IHfAN3TEzh1fcptz9HaPvheb39oCi+IVut8V1Tz8UK6i3+/rYKfrCiydFwOdtFYf4vZ1Utt8O4Pyjpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKEPQZi6kvS7ZTzM6M7YXnDh6T90lt01BlIFkSiIrMAtcr5O+q
	ILgYxTvAi691WEUinU/xf175FPULrQDgfaxkaei112JbCcJShCFENx9APoWyf8d9pQ0lM116nWU
	J+Zdg0ig=
X-Gm-Gg: AYBFou3P2y4jQsGhXC+x8faQo4AEiI2G04LQfvKO0YCcackHAuOQV+hGJNyxF/FYwTw
	xkZ3ZFtyFevNMOiLzAhzsC7II+KoNWfq7uqPSfp293bxl3HCE8izWU9jfjtk5iepHvNszoF04LI
	YaZ8DOBUFtBMQU8tKpRepKduhAJE+IEGuvQG+gDmOgQc4NS8IYccXuQZ0XIc3RZb/UbEwBWMXOG
	ypo1vsrh51dVn6UjCl6N+zDR0uCW33a4vYkwu/tCid/UOk6dR1ZHfojfqPq8AN42/ZSNY9NKLoX
	HWFaWQOb4Zt0tiJLDZj4t7u81NkInbbK5QwWIbk/LEIkxuv+hA0Q90s5fCiPdN7TWEQsh2FMOIZ
	h2DYiQU6zW/7lkc+p2X+1WlIFjNyIr1LUgBdfgd6BuPfmMoiz+KLNJKeXAScUHO1YATTDpcpY8+
	spsEdh0HfAMvmXNjiCSIvfa9cRVOpRWivqerT3IzHkviQVERwNDIpa7n8NTKprNZVwiEBWzylze
	sO4Falixys7bHeFAi5uqSBZ9v7F5uYvVn3QqBvUeFVE1UVirJ/Ak+VK+BsZVPlgPBdv9VZLxRGl
	JReFXjV2yS8cb22adA==
X-Received: by 2002:a05:622a:4d94:b0:536:7081:7a29 with SMTP id d75a77b69052e-5383b66e1dfmr424651cf.38.1792787983152;
        Fri, 23 Oct 2026 13:39:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c129b2sm3956406d6.20.2026.10.23.13.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:42 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/5] fs: make the system calls waiting for s_umount
 killable
Date: Fri, 23 Oct 2026 20:39:29 +0000
Message-Id: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
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
X-B4-Tracking: v=1; b=H4sIAALG22oC/2XMwQ6CMAzG8VchPdsIg2D0VYyHdRapzkFWZkwI7
 +6mR4+/pt9/BeUorHCqVoj8EpUpZDS7Ctxow41RrtlgatM3tTFIHSqm55TCgg/x3pJn7FzfHo7
 EruUB8nSOPMj7mz1fftZEd3ZLaZUPsspI0QY3llPh/q8L2/YBJDljmKEAAAA=
X-Change-ID: 20261022-b4-s-umount-killable-4c6379bec3ef
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=3136;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=/dLZyRvsjzBsxEbK5wijtc/SFtt+GpiR7lyMhHxfx1M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHgd+vD1/3+15vhG0gtj7hgV33Mv/fMWlgyUoU+SIy8Bx5l0Fl1HdpMPjaa14tVJI3aG5OaQel0
 AXt9LTWQJGQo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Hello,

This is the next step after the stuck unmount and stuck mount series,
and it applies on top of them (vfs-7.5.super).

Those two took care of the two ends of a super block's life, this one is
about a live one. s_umount can be held for a very long time. syncfs()
holds it shared for as long as it takes to write the file system out,
and on a slow or dead device that's forever. That by itself doesn't keep
other readers out, but as soon as somebody wants the lock exclusively, a
remount for example, that writer queues up, and every reader that comes
after it queues up behind the writer. None of them can be killed.

This converts the system calls that take s_umount themselves: syncfs(),
quotactl_fd(), mount() with MS_REMOUNT, fsconfig() with
FSCONFIG_CMD_RECONFIGURE and umount() of the root. They all take the
lock early and can already fail, so a killed wait just turns into an
error return. There are two things that happen before the lock.
quotactl_fd() has write access to the mount by then and drops it on the
way out, and a forced umount() of the root has called ->umount_begin(),
same as when the remount fails today. Killing the queued writer also
lets the readers behind it go.

This doesn't touch the super_lock() helpers. The walkers, sync(),
drop_caches and friends, have the same problem on a live super block,
but I'll do those once Christian's rework of the helpers is in.

It also doesn't make syncfs() killable once it has the lock, it still
waits for writeback uninterruptibly. That's a bigger job.

For testing I put ext4 on a dm-linear device, dirtied 64M, suspended the
device underneath it and called syncfs(), which leaves it sitting in
sync_filesystem() with s_umount held shared. Then I queued a remount
behind it. Without the series another syncfs(), quotactl_fd() and a bind
remount all pile up behind that remount, fsconfig() reconfigure, turning
quota off and umount() of the root pile up as well, and none of them,
the remount included, reacts to SIGKILL. With it they all go away on
SIGKILL, and once the queued remount is killed a new reader gets the
lock right away while the first syncfs() is still stuck. On both kernels
the syncfs() finishes once the device is resumed and all the data is
there, and nothing hangs in 200 rounds of all of them running against
each other. This was with KASAN and lockdep on, neither had anything to
say.

fstests on ext4, xfs and btrfs gives the same results with and without
the series. Thanks,

Josef

---
Josef Bacik (5):
      fs: make syncfs(2) killable on s_umount
      quota: make quotactl_fd(2) killable on s_umount
      fs: make mount(2) remounts killable on s_umount
      fs: make FSCONFIG_CMD_RECONFIGURE killable on s_umount
      fs: make umount(2) of the root killable on s_umount

 fs/fsopen.c      |  8 +++++---
 fs/namespace.c   | 13 +++++++++----
 fs/quota/quota.c |  8 +++++---
 fs/sync.c        |  4 +++-
 4 files changed, 22 insertions(+), 11 deletions(-)
---
base-commit: e6d8f4efc8e2301e15de7bcf9e8d3a2134fb058a
change-id: 20261022-b4-s-umount-killable-4c6379bec3ef

