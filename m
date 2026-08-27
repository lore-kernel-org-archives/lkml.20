Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBE3D7D72
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870311; cv=pass; b=BKSjdpTN6zgInCPopRS8Kh3pigOqOeETvdgPpYGIJ+HGImYNgADzHFCglUfeuySEOuIiTN7SNd9u5hEvhuJ4cPDvM2I1azsyD3SMoSXLWAkFkb+uRRmUnpE8fH/Z3vAIBODmRqGyb/ZVGI7qzg+Ad2soeS7Ibcw4SJZKLdJbJzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870311; c=relaxed/simple;
	bh=k69LAyUd2EhfERePMxgNBmw6XQPxeDXOi+XkvEPB+oo=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GjB8h8qCxJ0sFXdbq/jOZFUsIrlhBTkOKyjZh2Hs5rFeMgLUaAqzRDD+ePo9qaEMT/8DCSztOyTkafUA5wik8f0xGQIX8P9iLGKAEq+MZVEwDonqRCNW8Yq1od31aeIUnMnb/fx9fqWxTcbyPGynYZVElwBdAnMG//9YGyPm6tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ij+mDDEG; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ij+mDDEG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d7195706f1so4382215ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870298; cv=none;
        d=google.com; s=arc-20260327;
        b=d8CVrXKdDVcPBqAHxmqnDCmHlRK98xIKy9/RwUrWcPaYqdSK15rwCUjrSOTfAsEK9n
         YZVbWv6/BIjeBEoLqCddnRQQd/jjvh8KB4W6Al0KGyfUCjFhGLOQojbbhJDOwd1Z2NV1
         960pgRAGQf5JiJ1kOv7xAocj7oOr3Z3TDuGrVrXzRBwRMRLX4PxqGwqMVydsvdMgMzA5
         AWvVOa7Zdp4yT/XhJSh4wt+38XxA/PAVIvbKuAjw1Bf/3KkkA71dljClIec9ajwnFPuD
         UEU0voFa4Jb2qYdyTpsp9ocfcl46ifiIHK5KivKVi77uJSMBCG/KV12RVefzYN3ukChp
         0kEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ATd3DQpfc46IHXiTuWBZnYKSQ7jENEHOCpn+E5KjLkU=;
        fh=u1+9ktCKcKUCrbYSm6gGWqxgR9DQDpo1IVkiuSJcYV4=;
        b=rOKslfgZfLjlYw6xMv9P8QmQMSCuQl8em4/J0oiBOWoL7Of8eKe35KJGrQynvz7a/J
         kPNDFb0a0zCoXJ+BUYhhuDwQMqM75zPGrhcIceb8GeiBju46GtMGjjrmacPiwJ9MU21v
         ssLqOqWhEqFXfFCNOR443qTqmuywoQl9NyiBLGmyE1lUvO8l/w2iN9qcAJ32+UZwVAgM
         /oaEWphvKkzZd2k1iyfMU5zq+V5n0+g5AlZtnkAbf7YQ4YjFpea2+M/aGrRzjNWdrFus
         WbRA930Vg7i/K4Uk37pFpoFf4WCsWPDZStcF01wglVVhqKh2BMfeUhpr2SvkEhvKPkPl
         BOUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870298; x=1788475098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATd3DQpfc46IHXiTuWBZnYKSQ7jENEHOCpn+E5KjLkU=;
        b=ij+mDDEGDmB0CRfIdIkuya9CI6xedmKvRuaq/eICaP+6RY8cqwyRbtauC+2gVAVqH6
         4EnU+LVTbsUnSjwTYJMsnZ048yMCqZMEpegXDN8HHQhIqWaJpOzhsRY8YKEjIxwYcCuu
         IBItHhbk+Op3ewhqAogCL6rMBF2t5Lc+HYF8zZlDkNZJws5a11immEXKl8cZf/HCgYFs
         5LgXvS+0a4D0I7BuLzBLcUErbLCiI2LWY7OU8cZsAep1In0Ky6nzwrhNgKbFk1Rzb+WS
         xbYRnGhWViX6k/RAYrs+SUZ8EbynOQRLx1Kfuzi+V8ahriV4KdF/Vv+PNnrhkR9urcC0
         e/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870298; x=1788475098;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ATd3DQpfc46IHXiTuWBZnYKSQ7jENEHOCpn+E5KjLkU=;
        b=LiVDBreVy3BGVuv5bSB4NPxztBTX05zdbAoHmcHrfLzcRfF4HGZOKqOZ4BhoV9uk8K
         CCSGSKxkGs9RPSvlB2ZO1APv6hndUonKPNWPHjcs6+4KVTxM9paNJQek+z1OoucifmZu
         nZADWk7qVtS5QFvJ0bPVdRJmIYR0t1nAhhdjT1IX3saJGZzlK7lomJpsmVMs67jZ9Jh8
         0efisrH5QnftRcYGNuo3xmFZSS0HWU3RHPtZLeE+yq5Z0jtO85U6fP0Jnau5FbJELAfZ
         4IwRUL94bd59NKDcwEsacNVoLfVEreYFeFp7NdwGnfY3iQHpxA97aVdz7xtnNOIA0yMn
         s7iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8ErnJpVBWWwLm+u2o/GPiPcn1NBaV3ec9TEYh9huyO3qHqFN6AuilvluWWgt/1GRzU2uqw+/4uvzuTVI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6g7gBv2KAnNeKNvXtTLGi3i5bSY/d0Whh40FO+zfAV/Kb37bW
	Ey4+CpsUsYkv1Er7dSv0CnbHw9sSTOwy1lZxCmLRxbAfX8AmdQO5oyCyYtViBEsij8ArmFSd7oQ
	HiqZCQN/KoHLcCLz74YnOiawDnRPZAixsq8/QRZEY
X-Gm-Gg: AR+sD10Roh30kEHtZZGoX0XoWwBQF84D64YoJsgxeZYhpba2+t7TGvby0BPV878PFLq
	CP+k/emj3EpDvuE8Rrwg/oSFu/SUFZxFDmbkuzUQJCvIg12wpIenBYG6v9atAAzg9VgzV9N2ohK
	h72n9ZUhK4p1bgh1VaMW9+UrsQNMVRx3OtZyskRItOLaK7U8vcxkCLUMg4zC6DuNhHXAYMsTUm6
	VqJEhqCRtp9ACA/u9zeOIavE2rtDMnnqrDyyUg7PrcBI1mluiIxxoeiYxpm8XFjYyLpWXae0P0X
	WsNYNUXytmnjYjX/yrIXYakbmxgdCsVkn0tcfZeOKsEH3riH8T3XiKVB5DxJb3SNbvCx2S0xYyC
	p3U2Lv26YKwKHJgRS2ogqsUEg4qS1Lq8aYx/dUD3hoNg=
X-Received: by 2002:a17:902:e549:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2d74df5f87cmr33868235ad.14.1787870297349; Thu, 27 Aug 2026
 15:38:17 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:38:16 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:38:16 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:38:16 -0700
X-Gm-Features: AcwNN1WcfJSCKizV-B518BBEnL0-ITVAR6eruLTssxxs2Tj1TY8SkIhO61iSE8A
Message-ID: <CA+0ovCiMX1XFqCf0z=tPOb2nnQaqsxG=FEf2X6CshAQ86gAYMg@mail.gmail.com>
Subject: [BUG] ksmbd: OOB read in share_config_request() when payload_sz == 0
To: Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>
Cc: falemi@asu.edu, Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	linux-cifs@vger.kernel.org, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Namjae and Steve,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/106-ksmbd-oob-read-share_config_request/

  BUG: KASAN: slab-out-of-bounds in strnlen+0x66/0x90 lib/string.c:432
  kstrndup+0x2d/0x160 mm/util.c:120
  share_config_request fs/smb/server/mgmt/share_config.c:168 [inline]
  ksmbd_share_config_get+0x5e0/0x1190
       fs/smb/server/mgmt/share_config.c:243
  smb2_tree_connect+0x2f4/0x1320 fs/smb/server/smb2pdu.c:2015

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
