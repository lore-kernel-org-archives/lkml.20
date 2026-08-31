Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779793AA1A8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150791; cv=pass; b=iQNaNZXVmBjPswKGmONMane048PCurKxH6iRz5ckhfOySgAl+qNvgoMDNoDAcOe743/b870EgSQBAGIzdiqg2cQJsEafb/L9NiZNT6Htyc7y7yk4vzHYpkJbtmtIWy/XiB2xjSlg+LRoFKM3hXVkqyaoNSeN/weyAirL7SG1fLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150791; c=relaxed/simple;
	bh=OWYeD8HWhxln6GiCQV1UnjBgc7MJ92h/DJUq8qWLZ/E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MvGuQXV8bHSlbyBzDa+7l6rE990RwoLe3YoLAru0/mB3rHAbybma0deJ7TQPMpcx0cPzNSMuS+qDzDzinCOvV+8rFH7cM2oe03DDLzmUUfAwXYm9SX2uXe87Ky3orvKRU8RNL4g1Jy42ojbuxiQOOSvMzmajSMDQUc2rtMnKOR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1275YqM; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1275YqM"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-517dc520840so33049121cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788150789; cv=none;
        d=google.com; s=arc-20260327;
        b=SHKbPBgSnTxzBl+xo6ti6ihOLwXa9QDqCVkgHKpucAdDs/PQ+0snc3zaU8dBtAlw7Q
         Sn0UWFTqAddtFM/RctLOFK24Fl6J1cwo2W8l0Ee1jWoeCpZHOleVzF/qF20YeU7LSI86
         c6igsTOPcyAJPn/Z79FA6vRhUW+ojeOtJptnWJzLxEQF93B2eqSA9CSS47LrMej3nfE6
         ZAFRFharVyAn85J5Foodf0XFxUqnmt7Ci90hz+CH6rdyH46wvToD3xFAhUtMa3upWKUo
         yNu+Px7mIWMKF69RNTdthuxhVP4ONnhrWctk2g3SZ4li1nHO6SQqlelVDs7wkSX0Bjmm
         H2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OWYeD8HWhxln6GiCQV1UnjBgc7MJ92h/DJUq8qWLZ/E=;
        fh=OfueLDfkEOBuTyV2uc05FcyyvpPkhKAxE2NAwnW+F2w=;
        b=GeAhrmbuAI97vUCR3GMXsWAWs+Mmn0p792DHfjThc7slh/9aug94Gt0nSiT7NdF4ik
         xBZgdpygIc7BfBQItA/5dinLzuz5kMiEdJ7Wy0pVa2vS7UGytDUvtdB0liDyCGV+o3at
         49vNCdJK2IBcfAIgyaqRIMmmlgFlhtIKUKj6vJ8+3a7VMDWXspubRL6nILTzafc531kC
         +aFygvpqEMRIRt4HzllQzwOlgFdxtobclSRyNQG37hFJF4/1cdbQO7Zq28vnXafcy887
         DpNz/Nm73hoOrH7NGpv7BEe9m0+F9mqciCRYuHyHiDDXiRhelnSZyy9OmNr3Ct3fPoVy
         7j4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788150789; x=1788755589; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWYeD8HWhxln6GiCQV1UnjBgc7MJ92h/DJUq8qWLZ/E=;
        b=P1275YqMm7w+31RNxDq9HMJSVd2sCBBdugVvvIR59DXpDHpsTRFVFxA4g8LPlboQeB
         JysjfEhmCPj0Mi8VB1THHlg1PPamUQqP11K7baoLMmVEBzrVAXZeBLAuJEPVXMzNIkbb
         FOWrN7GoZNZf50SRAsCxuOMdKnDwo4f/N89eQw4Qyjl0bxHdSr0HYkFz70qSdyUf1mgH
         8oHPWG18aLhaAGQuMd/He1hNWSWLlQrwU+77NmmH5GXof13WOmh69XzH0ZarGtpy1gEp
         trvjQRJnC1AAtMtZaNLUixhxA5MdZsBHG27bH2MXmpa930hX0GdNpl50WNsueahOGVFi
         vhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150789; x=1788755589;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWYeD8HWhxln6GiCQV1UnjBgc7MJ92h/DJUq8qWLZ/E=;
        b=clejdkmyGSncXzbO5xaid6MykJSTcJJRGzQWk7rycK18JYUSU/u4b5RQ1tfpOFw9on
         zB7Jz/Gqii1i+axWi3UFpmz4BCXlWAq4aiGLWYFGq+6djC8t6N2Yv8KpvI/n5m/aIFSi
         Q9cqAh6HUIc9Lqdw2wChLacBSTsG4rKW4vq8dkFG6Orkq5oV8KksRSjaSQUpefwMg4ro
         dInZDODVBW4+/uKeMhzyTgUBz7atGHvx21O1wYDN971mBh9c8gR8D2L15d59uu46uha5
         CZ2ddXu8SRS7iuOhZACw+PFZ6Bk1N0seaAilk/jvyh3tWrcGeeKdVu54zrkN2GcizgDB
         pBzw==
X-Forwarded-Encrypted: i=1; AHgh+Rph/g3U/Pzk95P9tBwLDvtsswYgpJdyiZz/vY+cncqUKDS6LE5rPOis8pvywZZ5m0V/xwafIzj2pvPduWY=@vger.kernel.org
X-Gm-Message-State: AFuF++kePxqWhA1oDzN5pM0N8kEL1qOh2n7OGc8mHFriYsnEyHMbPoZg
	zlmbittZPhl25He1vQJY4b9BlAYUCI2Ip5Z9MVaA3JvPoYD6RJdJKN628jr2oWcw316G04dHfBF
	/ABxQOoTtfTh4LRC7C/VAEikiBdn/UqI=
X-Gm-Gg: AR+sD11BkCYc8ymfW6O5jhfMn26ezhmERcIKzY9c0YuDkLxKPqyESMii2n0czfHHJc5
	WkW4NGYMU6FPiY+qeDuPS4NAM/oAHD1OCWLB9eavv+LrVbgHa3zmfkzMshXQlzT+nIHs+g5xueA
	jWg/8ZbHEDu3EnQlFkSyta6rfP8FuPhgxg+oMbJGdcYMQ6+yLMKLa8ntHrQzuIqIoANfGNboc/h
	DQHs8HP06zjZNltOcnQyaVn3i2SkhP7MlDEj7FAJ4xzbP+4V0xY3qZHXNz2svKarySGeSUhZ1V1
	13UZvjAtelKRubvHYiuJMAadIWg+AiCaUc1zWq0pGlNMWArQi/9XD9Rk1ZJA+uXZtJXDs2q0FxW
	1jwCfRFiGsXdwIWNWA6NNDyeeuxESNcGQn1rSDoKonHjU0f+3
X-Received: by 2002:ac8:5e51:0:b0:52d:ea18:a8f with SMTP id
 d75a77b69052e-52fb9624e53mr273957141cf.29.1788150789045; Sun, 30 Aug 2026
 21:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 12:32:57 +0800
X-Gm-Features: AcwNN1ULFgkJPJxRmSd92mMdodsL9Jz9781aLnZmGa6ZIMx2OfnHHfzbs0ChRPc
Message-ID: <CAA2SOT5mWrS_KN38TRCu_KfTjpG6fyaytqZbOb25Pb0kfqZ3gQ@mail.gmail.com>
Subject: [BUG] fanotify: WARNING in fanotify_handle_event with crafted msdos
 image and long path
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a warning triggered by a syzkaller reproducer on
Linux 7.2.0-rc3. A similar issue appears to have been reported upstream
before, but I can still reproduce it on Linux 7.2.0-rc3 with HEAD commit
1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer mounts a crafted msdos filesystem image, creates a very
long pathname, installs a fanotify mark, and then calls execve() on the
long path. During execve(), the file open path triggers fsnotify, which
then calls fanotify_handle_event(). While fanotify is constructing the
event, it hits a warning in fs/notify/fanotify/fanotify.h.

This looks like a fanotify name-event encoding robustness issue. A crafted
filesystem image together with a very long pathname appears to trigger an
unexpected name/fid event layout, and fanotify_info_copy_name() reaches a
WARN_ON_ONCE() path. The kernel should probably reject or truncate the
event cleanly instead of triggering a warning, because panic_on_warn turns
this into a kernel panic.

Reproducer:

syz reproducer: https://pastebin.com/raw/JqBwvgbH
console output: https://pastebin.com/raw/2jnY4jzL
kernel config: https://pastebin.com/raw/RgvQ5DPY

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

loop0: detected capacity change from 0 to 128

------------[ cut here ]------------
WARNING: fs/notify/fanotify/fanotify.h:217 at
fanotify_handle_event+0x3e93/0x4800, CPU#1: syz.0.17/10761

CPU: 1 UID: 0 PID: 10761 Comm: syz.0.17 Not tainted 7.2.0-rc3 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.10 PC (i440FX + PIIX, 1996)

RIP: 0010+0x3e93/0x4800

Call Trace:
<TASK>
fsnotify+0x1105/0x1be0
__fsnotify_parent+0x6b6/0xd40
vfs_open+0x2e6/0x3f0
path_openat+0x29a2/0x3e20
do_file_open+0x216/0x310
do_open_execat+0xe8/0x430
alloc_bprm+0x2b/0x900
do_execveat_common.isra.0+0x1a8/0x5d0
__x64_sys_execve+0x93/0xd0
do_syscall_64+0xc4/0x7a0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
</TASK>

Kernel panic - not syncing: kernel: panic_on_warn set ...
