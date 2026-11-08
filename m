Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136288;
	b=cSrCqcfhM7DkHimfdHQh2AKz5voJoSpKXycDJDhco9mrkuwfxyn+E+xOYmBLNceaMm8R
	 b5Csg5Lc6EU919wwmqSvX//IBSSlaJ7vsBOmPDqId4WqGTSpaKvrnVqcMzvZNewDSZtI7
	 9BICBy//7q51ggFPhYu3qN4n3koPRqFVMkv5m/BmLYd1F9V5PCD4VJIERIoVUaSHmgiKK
	 pnSUVlMKadGV8JtLZXTbaNnRQeaV9J7u4xvTd9pCpKdeXZeALKJfpG5ei2otAcY6rpX1w
	 OXeqL5Q919vk7v6b1Ds6JvkICh5mcTeLjuwyujSECf6o92ZMaM6JLc62k447Zj1trdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136288;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=kzS1iJP7JX2moOuAROcw1KvqtVXeWKX1vHq+tz9uxCIgntbfNPGE725vttH73SuREpao
	 9qBmEGk1cTS/qHr/UTSOTYMBsp+Ot8PxEfLUfjS3AGJ/VcaF9SqdeJ9gO8fGfACMYG1IX
	 cCe0pKjebBf0YOXvvkP1hpTpHJK3Bhq1jtTsHBbC8xbqxkU4xcegopM6r5jlvhZ+SiNdf
	 V7zb5/z9jtpuDBlLPqjVE+NEfJlQwrCxMo70ifLK8Bf8gwvVE44oIrm10+Es6Qgu1JEEV
	 AbqQMAOg1BEPYS0LRMIEBbvXgH+ME8g7TFPvNPuE0gaXdg3m+oRcSx/8X3r/2Ar7dzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7E606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A7E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-567ac848d83so31077b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136287; x=1794741087;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=UeZ4dZFvn/2Y5QEP8ZS33S7Dn2SDDn45bb0GFuYdCcizjRMhQ/8wquDmMCYMsvYVG4
         DBlSCH3iytbFOFhsUGtIOy+bpnBmrptwXQjMZwJwG/MCQuZvov/3IrfcIjxVd1PKa4IT
         DtMn9azd8e0lKSHpmz8qpxxwP5xiJO6oXC1zIAM4s7Ae1GtgTPLHpZ+9Lw5nwP2bfwu5
         pUY47ZlxUva1kg6jNUkMfZsU4FEOJ8MGEDe2AAEN7i8UQRH85XKCUBaA7Gvl6XX989lP
         VXStIBtVn1kUNr5vs6zL8DJ9zqtJ2Uv7eJQLn7aB+Eube30vWjrTh6W6tx+A2XTAVu58
         UaTg==
X-Forwarded-Encrypted: i=1; AL+hErEE7BsQUMub0mD/k3ZnFFpkDfXH6hgbzpCZIlG7ASEMdhOVELpod4DzFXrrynlIcy8HTkaeRvFaLls7e5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bVsLu0RMepZMhefufBgNw6SrJ0EeYUzA6bsxkQglu8tiAKm77
	aMZ5oNgVGmjiKeIoAVoW8itczWj1UjU6+MG4ochHaYtS9+5QG41DPsLc6VJJtVa1kaZC8DbrhnR
	oFJxNbHBrJLKMD3QfLui8ntOCwP25ODr/yx0S5lSmeUcKMvS1OHMQlW0AN30=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0b:b0:567:f6db:8b46 with SMTP id
 5614622812f47-568143a1689mr647675b6e.34.1794136287572; Sun, 08 Nov 2026
 03:11:27 -0800 (PST)
Date: Sun, 08 Nov 2026 03:11:27 -0800
In-Reply-To: <6a6a98ca.86abc875.e5c3d.0057.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af058df.f50b2b3a.2c0de7.0007.GAE@google.com>
Subject: Re: [moderation] KFENCE: use-after-free read in virtqueue_get_buf_ctx
From: syzbot <syzbot+0f659760bac1ecb01812@syzkaller.appspotmail.com>
To: david@kernel.org, eperezma@redhat.com, jasowangio@gmail.com, 
	linux-kernel@vger.kernel.org, mst@redhat.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzkaller-upstream-moderation@googlegroups.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	zhaimingbing@cmss.chinamobile.com
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
